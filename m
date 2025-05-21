Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB1DC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 13:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pfpFg2ay/DYpkuljUTwLjtBaRV7sY5PPvp8r7cmQfzY=; b=MZeqy0sdmki5tmu5wSNukqvafi
	PCHtGDpLnmQazLnPg4YVXOtaKHERm/7Pn+W/VEpbWkgkwfxNg13fxSnlhPnr2k2ZpwPNw4BrOo52Q
	CC1xBYyS6tWcTKXj/tdAI8oVJdLeC8GaQ+SsxNsqnE2tosvrd3hDgCWfs1dmfcCHJMaLZ0HWGUspT
	InM7830q9AERoWPz3ZCBhDoi3mZZh8iE/UYP2RYr0kc+OE2We8skxZjY0YXrWdJKQADi0MpVo+fNW
	JorDsKapsUtZdCSGjYdIOP2h+C9CdKFjyUNTlIua2M7ppd72vjS4v2A68EOomR5bzDpr+z9eOkmwW
	3nA1PNeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHjIt-0000000FuVu-3vZz;
	Wed, 21 May 2025 13:16:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHixg-0000000FqGo-1E9u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 12:54:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 542541515;
	Wed, 21 May 2025 05:54:04 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2E1293F5A1;
	Wed, 21 May 2025 05:54:16 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v3 0/2] coresight: etm4x: Refactor trace filter
Date: Wed, 21 May 2025 13:54:04 +0100
Message-Id: <20250521125406.2594620-1-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_055420_402238_4071F9B4 
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

This series is minor refactoring for trace filter and comes from the
previous patch set [1].

The first patch introduces a new helper has_feat_trf() for detecing if
FEAT_TRF is implemented. This is more readable.

The second patch refactors the ts_source_show() function.  It simplifies
to directly return the TS value when FEAT_TRF is implemented.

[1] https://lore.kernel.org/linux-arm-kernel/20250519174945.2245271-1-leo.yan@arm.com/

Changes from v2:
- Added the has_feat_trf() helper for more readable (James Clark)


Leo Yan (2):
  coresight: etm4x: Introduce has_feat_trf() helper
  coresight: etm4x: Refactor returning TS field

 drivers/hwtracing/coresight/coresight-etm4x-core.c  |  8 ++++----
 drivers/hwtracing/coresight/coresight-etm4x-sysfs.c | 18 +++---------------
 drivers/hwtracing/coresight/coresight-etm4x.h       |  9 +++++++++
 3 files changed, 16 insertions(+), 19 deletions(-)

-- 
2.34.1


