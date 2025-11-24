Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA89CFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 16:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CFLp2Dg5kNEU3vCQ8i0dZZ8uyo+jmULcoBsOaQ1N0tk=; b=QaubGeKJ3/ikJIM23ED6IRbCUN
	psoJQJbvSbcxD5Jd2x77YZeF0Wk1El5BWo7uNBAHGtXnXnHw5C83+QOjbkPPWKmxWwnFvHE8MUrgb
	lKMTvqiUA1otz2V/Re2fVXIf1KNuNSBuI2yu8LvgeG8syR64vBbsIkw2AqomlYudfRS0G9A7MzqIi
	/7WqlD4BCWvWfEadogkgqlu1H5nXcVQ5C8a3RyCVGBQ8HLL1qEpgRlYHsQI0H2zG33UeRXl96DZ9q
	2uXpiuszhZ3dAs3dtaZHyoYTRhXtUudS8+7v/ZU+0v1t+M6knAcJPuY/5DdEyFuEYVicmZDFGGpcp
	8y90qHLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNZbj-0000000C0gu-1vvM;
	Mon, 24 Nov 2025 16:40:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNZbh-0000000C0gB-1qdU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 16:40:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D7681477;
	Mon, 24 Nov 2025 08:39:56 -0800 (PST)
Received: from 010265703453.cambridge.arm.com (unknown [10.1.30.67])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 850063F86F;
	Mon, 24 Nov 2025 08:40:02 -0800 (PST)
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org
Cc: mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	michal.simek@amd.com
Subject: [PATCH] perf/arm-cmn: Support CMN-600AE
Date: Mon, 24 Nov 2025 16:39:54 +0000
Message-Id: <f0c6e66df6b74f073df77c00bdf9ed560ca9c703.1764002394.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_084005_520488_426CBEA3 
X-CRM114-Status: GOOD (  11.59  )
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

The functional safety features of CMN-600AE have little to no impact on
the PMU relative to the base CMN-600 design, so for simplicity we can
reasonably just treat it as the same thing. The only obvious difference
is that the revision numbers aren't aligned, so we may hide some aliases
for events which do actually exist, but those can still be specified via
the underlying "type,eventid" format so it's not too big a deal.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/perf/arm-cmn.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
index 23245352a3fc..651edd73bfcb 100644
--- a/drivers/perf/arm-cmn.c
+++ b/drivers/perf/arm-cmn.c
@@ -210,6 +210,7 @@ enum cmn_model {
 enum cmn_part {
 	PART_CMN600 = 0x434,
 	PART_CMN650 = 0x436,
+	PART_CMN600AE = 0x438,
 	PART_CMN700 = 0x43c,
 	PART_CI700 = 0x43a,
 	PART_CMN_S3 = 0x43e,
@@ -2266,6 +2267,9 @@ static int arm_cmn_discover(struct arm_cmn *cmn, unsigned int rgn_offset)
 	reg = readq_relaxed(cfg_region + CMN_CFGM_PERIPH_ID_01);
 	part = FIELD_GET(CMN_CFGM_PID0_PART_0, reg);
 	part |= FIELD_GET(CMN_CFGM_PID1_PART_1, reg) << 8;
+	/* 600AE is close enough that it's not really worth more complexity */
+	if (part == PART_CMN600AE)
+		part = PART_CMN600;
 	if (cmn->part && cmn->part != part)
 		dev_warn(cmn->dev,
 			 "Firmware binding mismatch: expected part number 0x%x, found 0x%x\n",
-- 
2.34.1


