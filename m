Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9720CD1CDAE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 23:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LjEjhgB3SoWdMvIeP5RbyFQkL6DtMOMzx3chxCrGCxw=; b=EXa5IjfeKdO88o4kLecsXA9dcW
	5fCV/DMwSP2g7rSj0/W9hxj1wYZZRkxzLrogdoPVYtgiU0R2Tdw0neRMNtwXM38S7V2/1aHppNcIJ
	g0o2pGPM47fXD42eqKH/hlBhKISY1ZRriCKvu/BPmXU6r1nylLR+JawN3jHmoKYkchiBDifeaUPCb
	lAwLEjqq2klYW4GYpKB2Toj6cgMmeBmdfghGlGME3SAf3HOCeshSgbbgdYtq0cwYEYujGgykWyDEl
	8G8eR7SWMKLLy8ypseTn6bAX+wFvSoAQENfHcZjQDMxnT/dMbHVXmyNCU7DziQiJz3AnFOAlpHZgl
	7ZsLCCvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQwgy-00000007Goq-1G7G;
	Wed, 03 Dec 2025 23:55:28 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQwgu-00000007GnK-25cb;
	Wed, 03 Dec 2025 23:55:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764806120;
	bh=lfwx5dWdmB91fro96PRWljjZswN6jZAfvgtTYs9ZWBk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=A3tFM4rrT//Wbk5ZjB+zLf4/OdSYIzUFqkDYRA0/3ByNaRCPhUspf/vuamrTWI8eh
	 9KQtJ3RxIgm2xDYP+XPVttX3Y0n9ytD6LbZ5iViumpmCpM/AGqJi+YsXqu0Znr0Iji
	 wyAJ6FIRteY69v51X/zYrzz/xBDWGZQR/RGrUTTtxLc6KbIfX28BVfZEQoO1XYIGYi
	 f+he9MKtsq7w3ybsdyWOnS/UfV04PPMzRIrXvoQDDlkJgv0lYtm8CBRHLtYfOFC9S0
	 jM2Rb1nst0lTBrEztLmu5kHAEroQPnw57W1C9jBYsF5M2iRWre2RWCkSAgc7qbK75q
	 7tABys8PcClDA==
Received: from localhost (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5AA8D17E0CF5;
	Thu,  4 Dec 2025 00:55:20 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 04 Dec 2025 01:54:09 +0200
Subject: [PATCH 1/2] phy: rockchip: samsung-hdptx: Pre-compute HDMI PLL
 config for 461.10125 MHz output
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-phy-hdptx-pll-fix-v1-1-d94fd6cfd59b@collabora.com>
References: <20251204-phy-hdptx-pll-fix-v1-0-d94fd6cfd59b@collabora.com>
In-Reply-To: <20251204-phy-hdptx-pll-fix-v1-0-d94fd6cfd59b@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_155524_695456_B80BA3B8 
X-CRM114-Status: GOOD (  11.85  )
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

Attempting to make use of the 1080p@120Hz HDMI mode with 10 bpc RGB on
my Acer XV275K P3 monitor results in a blank image.  A similar behavior
has been reported on Philips 279M1RV.

The faulty modeline is created by drm_gtf_mode_complex() based on the
following EDID entry from the Standard Timings block:

  GTF:  1920x1080  119.999987 Hz  16:9    138.840 kHz    368.759000 MHz

It's worth noting the computed pixel clock ends up being slightly higher
at 368.881000 MHz.  Nevertheless, this seems to work consistently fine
with 8 bpc RGB.

After switching to 10 bpc, the TMDS character rate expected for the mode
increases to 461.101250 MHz, as per drm_hdmi_compute_mode_clock().

Since there is no entry for this rate in the ropll_tmds_cfg table, the
necessary HDMI PLL configuration parameters are calculated dynamically
by rk_hdptx_phy_clk_pll_calc().  However, the resulting output rate is
not quite a perfect match, i.e. 461.100000 MHz, that proved to be the
actual root cause of the problem.

Add a new entry to the TMDS configuration table and provide the
necessary frequency division coefficients for the PHY PLL to generate
the expected 461.101250 MHz output.

Fixes: 9d0ec51d7c22 ("phy: rockchip: samsung-hdptx: Add high color depth management")
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 29de2f7bdae8..cafa618d70fd 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -414,6 +414,8 @@ struct rk_hdptx_phy {
 static const struct ropll_config ropll_tmds_cfg[] = {
 	{ 594000000ULL, 124, 124, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
 	  1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
+	{ 461101250ULL, 97, 97, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 71, 1, 53, 2, 6,
+	  35, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
 	{ 371250000ULL, 155, 155, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
 	  1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
 	{ 297000000ULL, 124, 124, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,

-- 
2.51.2


