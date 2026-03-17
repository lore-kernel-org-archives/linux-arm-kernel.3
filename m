Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85765FED9FD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 18:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1+kdjq6E/4DqWWpjZKLJLLE1f4gi9Ch+ebUmotEYo0Y=; b=A39f6FAp4D7uM7XqP58m9EwN9B
	rL9rMV6A8TdxOLT/ZLJwkimGwPothLOfItmmoxgBHaKHJSq2xGoRC2g7KC2gbHxPdzvPGxAFNAPCd
	x1Stqkq29GhgOP8JkF/Lmax1YcbodeZlKrBPkQPshMCX9jHYCTOFgmeQZVwEgx69SxLTZHlO0rOjo
	cnF6nulUSUMzphLYT4UJd/C4t64ZHpcl6NKSyek3kBvvcyZd8y5ZEPbHzM7RZC4xl25BwtRfsmipA
	R0Z1iC9kbOyMlxlYxPwzJTTDjqmls6o+vxlkaDq0NJDRgCaP2psQ6rsMBIF1LNPyztX+//93pXJS1
	3jjl+39g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Yyh-000000072O0-3WVS;
	Tue, 17 Mar 2026 18:17:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Yye-000000072Mz-43o8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 18:17:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 352BB1477;
	Tue, 17 Mar 2026 11:17:04 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2414C3F7BD;
	Tue, 17 Mar 2026 11:17:09 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: suzuki.poulose@arm.com,
	mike.leach@linaro.org,
	james.clark@linaro.org,
	alexander.shishkin@linux.intel.com,
	leo.yan@arm.com,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH 0/2] fix inconsistencies with sysfs configuration in etm
Date: Tue, 17 Mar 2026 18:17:03 +0000
Message-Id: <20260317181705.2456271-1-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_111713_188371_34D6367B 
X-CRM114-Status: UNSURE (   7.62  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The current ETMx configuration via sysfs can lead to the following
inconsistencies:

  - If a configuration is modified via sysfs while a perf session is
    active, the running configuration may differ between before
    a sched-out and after a subsequent sched-in.

  - Once a perf session is enabled, some read-only register fields
    (e.g., TRCSSCSR<n>) may not be reported correctly,
    because drvdata->config is cleared while enabling with perf mode,
    even though the information was previously read.

To resolve these inconsistencies, the configuration should be separated into:

  - active_config, which represents the currently applied configuration
  - config, which stores the settings configured via sysfs.


This patch based on v7.0-rc4

Yeoreum Yun (2):
  coresight: etm4x: fix inconsistencies with sysfs configration
  coresight: etm3x: fix inconsistencies with sysfs configration

 drivers/hwtracing/coresight/coresight-etm.h   |  2 +
 .../coresight/coresight-etm3x-core.c          | 11 +++--
 .../hwtracing/coresight/coresight-etm4x-cfg.c |  2 +-
 .../coresight/coresight-etm4x-core.c          | 45 +++++++++++--------
 drivers/hwtracing/coresight/coresight-etm4x.h |  2 +
 5 files changed, 39 insertions(+), 23 deletions(-)

--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


