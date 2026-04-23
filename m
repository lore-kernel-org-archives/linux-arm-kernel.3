Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F137EFDEE33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 17:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BhxQfSaEdm48BO6beZPKAs6raZHeeUDyJtb3UwUvNww=; b=ogmiQMDVLWwTPtgWDgBVApF9vM
	WaLgmAt9uff7eJDHYJd0ongbWPnK8aXR+v4yu5bVRxozW6Xlj7vlneOstK9HAWMVmzCMnSdnJqkSj
	M1mw87N6DrhSCnlndFIRSBaNZeExIz5sj/CeA6Eb2h5KdjnJtlHIWXTjT7j4DlDEg+QuUjLIym7d+
	7youkKi7swx3uhaZNMF9T2pTBzC2x5EVvRx8b+TOh44ElVdayNT/kXd946EH7MQWwEUK3RTKy0i9a
	RPlDW0AEUXnIzAf0v1EW8RPBrk/HB8z2DjKlroB4Gltk3Asjx2c9+v5ipHy/fKvqXMYRxdiMoBtvK
	H6R1cong==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFxmR-0000000C2P0-2mTc;
	Thu, 23 Apr 2026 17:23:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFxmL-0000000C2KD-1CW7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 17:23:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A9A6F4092E;
	Thu, 23 Apr 2026 17:23:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7302C2BCAF;
	Thu, 23 Apr 2026 17:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776965032;
	bh=i1zlfKqoBWN27zTMIh+OOnDw/plffp5P3L7s2aSHSfI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OFNk6j0KAd1NN8/nvgHQ6Egdms+ZX6699lnUxuVMk9JPdCRyrtnSRIiyg0GLGjUmm
	 qesvgUwzgDwny0MXo2jU7QZ/VaIcsfPC82NZf109I2lyr8ZWL+m4xYUkWf1cLMAuCT
	 ofd1IWRLCi26k48NpsVh0Pah/dXkvVKyrugEnyFFBLzXLM13DzRVl4CFBuuQ0O4XCZ
	 W9uQpFDIreYtGlYeNbAbOmqVo/4JAZRodVcUn3g5N6BV4KG3YbUl7FPDiU9ExqAu/v
	 6Ei/PWoUBUW4UiLwWUEzj13MDb0mbdM3oy9mfV5jXtIqLTDSXffKtle82za4UBbQA0
	 Lr7N8qsaccf0g==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Thu, 23 Apr 2026 18:22:53 +0100
Subject: [PATCH 3/8] firmware: arm_ffa: Align RxTx buffer size before
 mapping
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-ffa_fixes-v1-3-61189661affe@kernel.org>
References: <20260423-ffa_fixes-v1-0-61189661affe@kernel.org>
In-Reply-To: <20260423-ffa_fixes-v1-0-61189661affe@kernel.org>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Jens Wiklander <jens.wiklander@linaro.org>, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Sebastian Ene <sebastianene@google.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_102353_350287_00AFE46C 
X-CRM114-Status: GOOD (  11.21  )
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

Commit 83210251fd70 ("firmware: arm_ffa: Use the correct buffer size during
RXTX_MAP") advertises PAGE_ALIGN(rxtx_bufsz) to firmware when mapping the
buffers but the driver continues to stores the minimum FF-A buffer size
in drv_info->rxtx_bufsz which is used elsewhere in the driver.

Align the size before storing it so that the allocation, validation and
FFA_RXTX_MAP all use the same buffer size.

Fixes: 83210251fd70 ("firmware: arm_ffa: Use the correct buffer size during RXTX_MAP")
Cc: Sebastian Ene <sebastianene@google.com>
Link: https://sashiko.dev/#/patchset/20260402113939.930221-1-sebastianene@google.com
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_ffa/driver.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index e6a051b20cb7..4dec7ca52f8c 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -2063,6 +2063,7 @@ static int __init ffa_init(void)
 			rxtx_bufsz = SZ_4K;
 	}
 
+	rxtx_bufsz = PAGE_ALIGN(rxtx_bufsz);
 	drv_info->rxtx_bufsz = rxtx_bufsz;
 	drv_info->rx_buffer = alloc_pages_exact(rxtx_bufsz, GFP_KERNEL);
 	if (!drv_info->rx_buffer) {
@@ -2078,7 +2079,7 @@ static int __init ffa_init(void)
 
 	ret = ffa_rxtx_map(virt_to_phys(drv_info->tx_buffer),
 			   virt_to_phys(drv_info->rx_buffer),
-			   PAGE_ALIGN(rxtx_bufsz) / FFA_PAGE_SIZE);
+			   rxtx_bufsz / FFA_PAGE_SIZE);
 	if (ret) {
 		pr_err("failed to register FFA RxTx buffers\n");
 		goto free_pages;

-- 
2.43.0


