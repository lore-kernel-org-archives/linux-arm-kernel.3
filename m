Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 960C3C44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 14:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YqtYO4KlCLrGmWVbxC/0USob6y7QFzL2Qo/ZzvJQALQ=; b=ofsGorS6V1ITwftuyNh/lGXAAJ
	bR2GSY1mOI3TdjrGN8TYy7HBMHY+JsaFN8LkLZhkpTtXcVK+CQZiECS5Cejbyzvt0jQRgrnW784gc
	PWxwgFqYZyowrBAPTOdNW9BrDsTvozkSWtu+gUB0rPLlasshRwiUfbq1sOo/wKQZ17ROMT7aBp4Kh
	W34O65pQ8PeGk6a95GUrhvBAXYK5/GjmiHpXiwlYRqd+nwF8Ha0RVnU7fMqpAOI/v+9FoXcHCTiie
	9C3UbXzgInT5pIFder5CIzBL8G1LYyZoTBTcJe74k0jn8h/bIacMNMR/C2HhPTZyfq1Hm5l6L8vzV
	3COMUM2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkNWI-0000000HYaS-1p8w;
	Thu, 16 Jul 2026 14:57:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkNWA-0000000HYX4-1JJ2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 14:56:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0BACB1477;
	Thu, 16 Jul 2026 07:56:49 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3234A3F7B4;
	Thu, 16 Jul 2026 07:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784213813; bh=Pb+f5I38gSvwwEGMdj5XYd+7gcuHmWuq0P/BWHFGhGM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AdmolQK6QIRNo6fNFz8nMa5Jv2S3JcWc+yfp3PwlFnWwcMmg37AE/S6ttE0YLTWGm
	 45e2YRimiRj3T51D+HVX3wzAwh3Q1SJQvauOfk5qSrltjOLO5OGYQ/OrxayCIRqk8U
	 EfS0HW3nHdVN30xO6X8s3Bb4gDpr9bO++ZenAook=
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org,
	mark.rutland@arm.com,
	catalin.marinas@arm.com
Cc: ilkka@os.amperecomputing.com,
	bwicaksono@nvidia.com,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: [PATCH v2 4/4] perf/arm_cspmu: Make IRQ more optional
Date: Thu, 16 Jul 2026 15:56:37 +0100
Message-ID: <a6bb2c54e91712e91f95d21051d2b4b173cebc93.1784213435.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.54.0.dirty
In-Reply-To: <cover.1784213435.git.robin.murphy@arm.com>
References: <cover.1784213435.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_075654_394332_ECE4B178 
X-CRM114-Status: GOOD (  12.21  )
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

If we have 64-bit counters, we can reasonably assume we'll never have to
handle an overflow before the end of the universe (since we're a system
PMU with no sampling). Thus even if firmware does specify an IRQ, we can
still continue in the event of being unable to request it. This can help
systems where IRQs cannot be claimed exclusively, or are broken in other
ways.

Reviewed-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>

---
v2: No change
---
 drivers/perf/arm_cspmu/arm_cspmu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/arm_cspmu/arm_cspmu.c b/drivers/perf/arm_cspmu/arm_cspmu.c
index caad9a36651d..ad82de166dd1 100644
--- a/drivers/perf/arm_cspmu/arm_cspmu.c
+++ b/drivers/perf/arm_cspmu/arm_cspmu.c
@@ -1256,8 +1256,11 @@ static int arm_cspmu_device_probe(struct platform_device *pdev)
 		return ret;
 
 	ret = arm_cspmu_request_irq(cspmu);
-	if (ret)
-		return ret;
+	if (ret) {
+		if (counter_size(cspmu) < 64)
+			return ret;
+		dev_info(cspmu->dev, "Continuing without IRQ\n");
+	}
 
 	ret = arm_cspmu_get_cpus(cspmu);
 	if (ret)
-- 
2.54.0.dirty


