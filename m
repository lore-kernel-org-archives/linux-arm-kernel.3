Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA3A7FF60D8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 07:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kZ0FISfr5kyvOiMiGgtJkNjcn8iqulgi6+Bp+/x1xTo=; b=LHpZs2kmjfVe4rr9nymodMsMys
	EB8fIDrxyn042gbs3zNCdIKkNB08NN0MgBuTh7aLJn/Zbu0NXY3/s57YCOMut4spA4ygeJSYCk+Qn
	VabFc5PCCmM2sTFsbp6A5OCmAesHG8PtfQRmqLVrXYMzOy4AbZab5mDtyS0P8GwYAe7806Sn7mjoQ
	EDYSmIXwSxxAqxKRzzFEKI1znwgjECeNPvh1Didh8NLPTswJJYvtIB4VJkyOwvATOC6R+NPZxCU+t
	DxxZPgIJPoTaJQfxHH6toEqK0sFfawOhzeifT6wp8OXRuiEdo+/aGILuJmFjc62u0NsAhBG2sP0l/
	aQ99K2Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Tru-0000000CWig-32Jm;
	Tue, 31 Mar 2026 07:50:34 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Tra-0000000CWYu-3vmn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 07:50:16 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-486fe36cfabso32138485e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 00:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774943413; x=1775548213; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kZ0FISfr5kyvOiMiGgtJkNjcn8iqulgi6+Bp+/x1xTo=;
        b=M9z6Wj2u0YZn4CGoVxrndXkUMZZJTzKipNFfJl4pAOTSsTT4GqQO7VRxicJf8YfGFg
         g9+H3eCNg498argW5jhWO/VuZP5jIvy4kjJFV0Of2TXLQgfd/2bOdM4BTOYq/ifG2pFG
         h/ItItVvWXktoMf9uwGM8yhVp1MEctLXiTN4wFT4t7OijMp5aVZUr5O5W5qI91zIdFbt
         7o7SMoNFqgzxxEAIUEtqCDFe9J4ONKa9R/b/I2OMVbqinB2I3EHXij7dw6p0XvHllR9h
         QPGzk+GUS3DsWmCaxLAvNODmBT/vv77OKUZUsWTB7Tffx1RJnK6m4QzI/Oz87BygCi5M
         g51g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774943413; x=1775548213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kZ0FISfr5kyvOiMiGgtJkNjcn8iqulgi6+Bp+/x1xTo=;
        b=c41Fgtk/7j4KISuCxuHF4uWeo6smCE15FnLToUggTXodkVfTwJhIJyu75PTPXC9Atr
         QhWrqkYv5TijsVHFm97Iw5hUC+6JJ0bl89QXqnQrBgBA7+C/+Rki23qo8waC//3e9Nek
         D/x2rF1g9oOeeSRToZ6gYg636EFDaZlYWJ2y5xnDzW0eugVmZ/vafwT4vgnTIRCmGlW1
         DasTEc58Yt7yvM8CYjIT0YC1GVdYm4seeCz8fNaV+Z8Ud8jmm4alU3ozqVJ6DSXOhgNw
         vpbsxfBS6Jrr66WmFsoyFq027noHqJLgoWxnSm4APEMmlOwy+NjKe2eYkd7SpKTGJtbu
         jgfg==
X-Forwarded-Encrypted: i=1; AJvYcCU+v8Vu7AQ3QmWt8bwnLl065gBli5XsnuSNS/4EZ+x8qzw5/tJQPQxcCBrSnWe5dC3544p9ujdkt4go6puMPpub@lists.infradead.org
X-Gm-Message-State: AOJu0YxdGFISz7N5f389Blf7dW9dsGwdhUYPcL6XDdoLHONFf5oxNfuX
	buUhc/n/Mwin6yWbF6MM0CYSo/1Z23JL+hY/TLD80wQssIuOOzlasfcy
X-Gm-Gg: ATEYQzy+Q0ol45H95Hh3qEdl99SFjicWbQu5JQEQ9KEvlVKxzhOZRo53WJVPYwov+H4
	yBEjxuzcAMFm+FgZRY6NO8y4T5/5/+B86xelqPlWavz0b7Nihp40OcnZRO0zV8A1F99XCyH5Fku
	JH7KKcH17OS/yixTFgmnlMKiS6W84wHOl2a6M3ZmPtFh0J1teMKxHli0Mz21qXJISZj9XnzmQKJ
	NhPRfz8jiG1D/O6cBjKo567sAMj3AOj5hP8m1Ew1Ls0AHwvvRMSQv4eT0uMbJLogrorswxCl48o
	NnIRu7413ZyGaBMHYh/1an1X3x6KEqZfjAtMDTDQTsvae7DpVQctkfHo/kbvmyOGzmY0akfjm/+
	SFvvYBZ2ckntdbAOChm476BXbS5wbrpIsbKKEM99k+ZXMmdqOcOyCtlxCKfncpe3PqROX+PFnSN
	VQCwwfB+faEw3aVqK8Tmb+FkoQeRauV30xkkx9Mc0=
X-Received: by 2002:a05:600c:8907:b0:485:fbd2:f72 with SMTP id 5b1f17b1804b1-4887818678emr31449875e9.1.1774943412488;
        Tue, 31 Mar 2026 00:50:12 -0700 (PDT)
Received: from rock-3b.tailb81abf.ts.net ([213.152.28.84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887c91f0casm9873015e9.35.2026.03.31.00.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 00:50:11 -0700 (PDT)
From: Midgy BALON <midgy971@gmail.com>
To: iommu@lists.linux.dev
Cc: joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	heiko@sntech.de,
	jonas@kwiboo.se,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Midgy BALON <midgy971@gmail.com>
Subject: [PATCH] iommu/rockchip: fix page table allocation flags for v2 IOMMU
Date: Tue, 31 Mar 2026 09:50:10 +0200
Message-Id: <20260331075010.1463-1-midgy971@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_005014_988905_FE2C988C 
X-CRM114-Status: GOOD (  15.27  )
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

commit 2a7e6400f72b ("iommu: rockchip: Allocate tables from all
available memory for IOMMU v2") removed GFP_DMA32 from
iommu_data_ops_v2, reasoning that RK356x and RK3588 IOMMU v2 hardware
supports up to 40-bit physical addresses for page tables.  However, the
RK3568 IOMMU page-table walker uses a 32-bit AXI bus: it cannot access
physical addresses above 4 GB regardless of the address encoding range.

On boards with more than 4 GB of RAM (e.g. 8 GB LPDDR4X), removing
GFP_DMA32 causes two distinct failure modes:

1. Direct allocation above 4 GB: iommu_alloc_pages_sz() may return
   memory above 0x100000000.  The hardware page-table walker issues a
   bus error trying to dereference those addresses, causing an IOMMU
   fault on the first DMA transaction.

2. SWIOTLB bounce-buffer poisoning: without GFP_DMA32, page tables land
   above the SWIOTLB window.  dma_map_single() with DMA_BIT_MASK(32)
   then bounces them into a buffer below 4 GB.  rk_dte_get_page_table()
   returns phys_to_virt() of the bounce buffer address; PTEs are written
   there; the next dma_sync_single_for_device(DMA_TO_DEVICE) copies the
   original (zero) data back over the bounce buffer, silently erasing the
   freshly written PTEs.  The IOMMU faults because every PTE reads as zero.

Restore GFP_DMA32 (and DMA_BIT_MASK(32)) for iommu_data_ops_v2, which
currently only serves "rockchip,rk3568-iommu" in mainline.

Tested on Radxa ROCK 3B (RK3568, 8 GB LPDDR4X):
  - MobileNetV1 via RKNN: 5.8 ms/inference (IOMMU mode)
  - YOLOv5s 640x640 via RKNN: ~57 ms/inference (IOMMU mode)
  - No IOMMU faults, correct inference results

Fixes: 2a7e6400f72b ("iommu: rockchip: Allocate tables from all available memory for IOMMU v2")
Cc: stable@vger.kernel.org
Cc: Jonas Karlman <jonas@kwiboo.se>
Signed-off-by: Midgy BALON <midgy971@gmail.com>
---
 drivers/iommu/rockchip-iommu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
index 85f3667e797..8b45db29471 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -1358,8 +1358,8 @@ static struct rk_iommu_ops iommu_data_ops_v2 = {
 	.pt_address = &rk_dte_pt_address_v2,
 	.mk_dtentries = &rk_mk_dte_v2,
 	.mk_ptentries = &rk_mk_pte_v2,
-	.dma_bit_mask = DMA_BIT_MASK(40),
-	.gfp_flags = 0,
+	.dma_bit_mask = DMA_BIT_MASK(32),
+	.gfp_flags = GFP_DMA32,
 };
 
 static const struct of_device_id rk_iommu_dt_ids[] = {
-- 
2.30.2


