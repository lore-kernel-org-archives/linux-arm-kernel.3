Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 309B9E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Dec 2024 17:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NeiFSOblfaqq9ElF67bZFcJAPgV8MULjIcaPcl/N/us=; b=UyUoVtneOetFI6PUui4TLOatP+
	G2ekYS3kue6bopyRtFmK/CSGLQf4bbUgsMDMFAVNZYeeWcbERAGnWPwYdOW/eNVsDsKgVZhLcE/9S
	Vo0nEWlJ0JLG4Qan5hBCgHw6TUA2rjskvOQajqYboOKAqg3D/6tjilJf+hMIQpiflFEGfzPhJYf6c
	AWS9ZchHojSOk0deRJkOouGnPcqgkrk9V0SKIy09BP/6qvfrmbwOxIRaWPo5JzC9gGzk16y2cEy7M
	ETwLapvu1bXZEexoryttjP22Xxsu83Ft1IvfMorm7qBhxJvv4WLirSm8F6nTZBt25rCKSOF3eA3C1
	JmRANRsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tP2qh-00000007Cu3-0ReH;
	Sat, 21 Dec 2024 17:01:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tP2pJ-00000007CgZ-2uJ9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Dec 2024 16:59:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9FA071476;
	Sat, 21 Dec 2024 09:00:05 -0800 (PST)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3B5AB3F528;
	Sat, 21 Dec 2024 08:59:36 -0800 (PST)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: suzuki.poulose@arm.com,
	mike.leach@linaro.org,
	james.clark@linaro.org,
	alexander.shishkin@linux.intel.com
Cc: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH 0/4] small fix for configuaring etm csdev via sysfs
Date: Sat, 21 Dec 2024 16:59:30 +0000
Message-Id: <20241221165934.1161856-1-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_085941_787027_9D34CB58 
X-CRM114-Status: UNSURE (   5.35  )
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

when etm csdev's configuration is modified via sysfs while etm is being
enabled via perf, enabled etm could run with different configuration
from perf_event.

Also, there are some redeundant usage of drvdata->spinlock in
etm_starting/dying_cpu() with enable/disable etm device.

This patchset fixes above small problems.

NOTE:
   This patchset based on:
     - https://lore.kernel.org/linux-arm-kernel/20241220104521.809071-1-yeoreum.yun@arm.com/

Yeoreum Yun (4):
  coresight/etm4x: disallow altering config via sysfs while enabled
  coresight/etm4x: remove redundant usage of drvdata->spinlock
  coresight/etm3x: disallow altering config via sysfs while enabled
  coresight/etm3x: remove redundant usage of drvdata->spinlock

 .../coresight/coresight-etm3x-core.c          |  33 ++---
 .../coresight/coresight-etm3x-sysfs.c         | 120 ++++++++++++++++
 .../coresight/coresight-etm4x-core.c          |  20 +--
 .../coresight/coresight-etm4x-sysfs.c         | 132 +++++++++++++++++-
 4 files changed, 272 insertions(+), 33 deletions(-)

--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


