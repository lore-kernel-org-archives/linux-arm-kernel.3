Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 593A9FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 16:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8uDEROK9AVADwd6DHoxni0OQSCuvNKlQkXU0GxKvajs=; b=iVygGL2k6+qrDdKmadfUkweMmc
	yRdKc1czLDr//5RgkFspIxbXxyfgVcS8Ee/pTeTvt3CoHEx0eowDkbpD404jXmNWu0CUaoh1LewFu
	f/KjlZfQ0ksIi2fgAIUV8PuFpSayrlLZlh/8JQkudD46db4oDUNZM+7V75xKyd8qus0Bv8/xXwbik
	oArc9GHJfF9O0bXfXLmkAVs/L169a7k9wLso1jbUH297ypeeozmJTz8CYCCaY1s0arT0IyIRUyy87
	lCE2HzQVAY3tAvNB54WPf5jorQ4ErDLhqCAlUVCLeEc20Vn2476tcuTCZ2qtV7OqtfryCK93MoItb
	44aGuC2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHkyK-00000001rS7-2GpD;
	Tue, 28 Apr 2026 16:07:40 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHkwx-00000001pk4-3PuF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 16:06:20 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wHkwg-0002mE-B7; Tue, 28 Apr 2026 18:05:58 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Tue, 28 Apr 2026 18:05:31 +0200
Subject: [PATCH v2] iommu/rockchip: disable fetch dte time limit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260428-spu-iommudtefix-v2-1-f592f579e508@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNwQ6DIBAFf8XsuTRAsU178j8aDxYW3YNAAImN8
 d+L3nucSd68DRJGwgSvZoOIhRJ5V0FeGtDT4EZkZCqD5LIVQt5ZCgsjP8+LyWhpZdpw3Uql9EM
 NUFchHvosvvvKE6Xs4/c8KOKw/1tFMMHsk3N+Mx+rteoCunHJ0Ttarwah3/f9B3jTTfizAAAA
X-Change-ID: 20251126-spu-iommudtefix-cd0c5244c74a
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Heiko Stuebner <heiko@sntech.de>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Simon Xue <xxm@rock-chips.com>, kernel@pengutronix.de, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.15.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_090615_865392_072A9694 
X-CRM114-Status: GOOD (  20.30  )
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

From: Simon Xue <xxm@rock-chips.com>

Disable the Bit 31 of the AUTO_GATING iommu register, as it causes
hangups with the RGA3 (Raster Graphics Acceleration 3) peripheral.
The RGA3 register description of the TRM already states that the bit
must be set to 1. The vendor kernel sets the bit unconditionally to
1 to fix VOP (Video Output Processor) screen black issues. This patch
squashes the 2 vendor kernel commits with the following commit messages:

Master fetch data and cpu update page table may work in parallel, may
have the following procedure:

	master                  cpu
	fetch dte               update page tabl
	        |                       |
	(make dte invalid)  <-  zap iotlb entry
	        |                       |
	fetch dte again
	(make dte invalid)  <-  zap iotlb entry
	        |                       |
	fetch dte again
	(make dte invalid)  <-  zap iotlb entry
	        |                       |
	fetch dte again
	(make iommu block)  <-  zap iotlb entry

New iommu version has the above bug, if fetch dte consecutively four
times, then it will be blocked. Fortunately, we can set bit 31 of
register MMU_AUTO_GATING to 1 to make it work as old version which does
not have this issue.

This issue only appears on RV1126 so far, so make a workaround dedicated
to "rockchip,rv1126" machine type.

iommu/rockchip: fix vop blocked and screen black on RK356X and RK3588

RK3568 and RK3588 has the same issue as RV1126/RV1109 that caused by
dte fetch time limit, So we can set BIT(31) of register 0x24 default
to 1 as a workaround.

Signed-off-by: Simon Xue <xxm@rock-chips.com>
Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
During testing of a newly developed driver for the RGA3 peripheral [1]
(Raster Graphic Acceleration 3) of the RK3588 some sporadic hangs
have been observed. The upstream rockchip-iommu driver is used to handle
the RGA3 IOMMU register space.

After a closer look at the TRM for the RK3588, the RGA3 iommu register
description of the RGA3_MMU_AUTO_GATING register (offset 0xf24) mentions
a mmu_bug_fixed_disable bit, which must be set to 1 but defaults to 0.

Looking at the commits in the vendor kernel, the bit is unconditionally
set to 1 and mentions that it fixes a blocked VOP (Video Output
Processor) [3]. Therefore squash the relevant vendor commits
[2] and [3] into a single patch, combine the commit messages and keep
the Signed-off-by line from the original author.

[1] https://lore.kernel.org/linux-media/20260428-spu-rga3-v5-0-eb7f5d019d86@pengutronix.de/
[2] https://github.com/rockchip-linux/kernel/commit/7f8158fb41b5cc8e738aaeebc3637c50ebd74cae
[3] https://github.com/rockchip-linux/kernel/commit/6a355e5f9a2069a2309e240791bc3aad63b7324e
---
Changes in v2:
- no changes to the actual commit
- Adjusted RGA3 register offset mention in the cover to 0xf24
- Adjusted RGA3 link to the latest patch version
- Link to v1: https://lore.kernel.org/r/20251126-spu-iommudtefix-v1-1-f90003dbfcc4@pengutronix.de

To: Joerg Roedel <joro@8bytes.org>
To: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: iommu@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/iommu/rockchip-iommu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
index 0013cf196c573..87ae036d64145 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -76,6 +76,8 @@
 #define SPAGE_ORDER 12
 #define SPAGE_SIZE (1 << SPAGE_ORDER)
 
+#define DISABLE_FETCH_DTE_TIME_LIMIT BIT(31)
+
  /*
   * Support mapping any size that fits in one page table:
   *   4 KiB to 4 MiB
@@ -930,6 +932,7 @@ static int rk_iommu_enable(struct rk_iommu *iommu)
 	struct iommu_domain *domain = iommu->domain;
 	struct rk_iommu_domain *rk_domain = to_rk_domain(domain);
 	int ret, i;
+	u32 auto_gate;
 
 	ret = clk_bulk_enable(iommu->num_clocks, iommu->clocks);
 	if (ret)
@@ -948,6 +951,11 @@ static int rk_iommu_enable(struct rk_iommu *iommu)
 			       rk_ops->mk_dtentries(rk_domain->dt_dma));
 		rk_iommu_base_command(iommu->bases[i], RK_MMU_CMD_ZAP_CACHE);
 		rk_iommu_write(iommu->bases[i], RK_MMU_INT_MASK, RK_MMU_IRQ_MASK);
+
+		/* Workaround for iommu blocked, BIT(31) default to 1 */
+		auto_gate = rk_iommu_read(iommu->bases[i], RK_MMU_AUTO_GATING);
+		auto_gate |= DISABLE_FETCH_DTE_TIME_LIMIT;
+		rk_iommu_write(iommu->bases[i], RK_MMU_AUTO_GATING, auto_gate);
 	}
 
 	ret = rk_iommu_enable_paging(iommu);

---
base-commit: dca922e019dd758b4c1b4bec8f1d509efddeaab4
change-id: 20251126-spu-iommudtefix-cd0c5244c74a

Best regards,
--  
Sven Püschel <s.pueschel@pengutronix.de>


