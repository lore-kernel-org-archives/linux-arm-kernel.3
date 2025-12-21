Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C246E67495
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Dec 2025 10:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gafawmd2FnMX3Soveey9doymZIgc+Is4GNDsLrUvGuc=; b=rehW4+xx5wrPJr+cC1eKKPKR9D
	YVmApAXTS97rXG41L//40fR1VcT3W6MM6PBCmDHjrpSZBF+5wSflnJxntVkDRh1ppSfRz1zIlXVkJ
	wbp0wUw7acOcXAuBbM5jFP55lP490Kr3TWAkQwAYAP9xAaZtC779uuzrEqJPI5LE3mo0EWMFCP0uX
	PEs9QhdATkUOTYQkPGgmN19GFdqz9+E83BUPFFAiw+A2hR/tBuzR+8MF3SsRv1/IVT2pxv2pbk1PF
	LlJLAq7lphgpmUpb8c6LZhFcQw0DXUHOoo4aMV6LIgqM1/ebajwXNQxEQ/vBr8v8JZefCwycaD1zn
	t+/0jgEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXGo4-0000000CKFP-0FyC;
	Sun, 21 Dec 2025 10:36:56 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXGny-0000000CKC8-4AaP;
	Sun, 21 Dec 2025 10:36:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1766313406;
	bh=q3Uj/NZVJjkzwSWbKVMfMAr3uA3LKimv6B/evUvOnrk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GgJnqNojZ7n9yvTUF5pLxAJ8Dehkhvw22XpNW2TnnOkl5NL6k5FRsCcmIFzovLW2i
	 O3m5MMtrr9crJ9w3keY7uZ8TaEMlo8HmT1teLOmOLheIJuK7ckfX/J4s+9a6QlXLOx
	 /rUEO1NyzWfqMrgYLqYQtYZQJ8PbUTF6eW8X10wX65iHNuT7zYQcfeC7/FrYAuOmaL
	 VhKnJhqdDeKXDtAJGFjhf6dzdu7lAGspVddC1aMW6ZHM5zd6Gt4QmJ5mzk9Sxc0v4I
	 mGsdx7uCulIA5ZiFVStHZxF1lKObqLveVNxx2mk1SEwpYheyULwWIfnUo47H5EIhrh
	 X5EZ6jUSRLOrw==
Received: from localhost (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 38FBD17E12E8;
	Sun, 21 Dec 2025 11:36:46 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Sun, 21 Dec 2025 12:36:23 +0200
Subject: [PATCH v2 1/2] phy: rockchip: samsung-hdptx: Pre-compute HDMI PLL
 config for 461.10125 MHz output
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251221-phy-hdptx-pll-fix-v2-1-ae4abf7f75a1@collabora.com>
References: <20251221-phy-hdptx-pll-fix-v2-0-ae4abf7f75a1@collabora.com>
In-Reply-To: <20251221-phy-hdptx-pll-fix-v2-0-ae4abf7f75a1@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Derek Foreman <derek.foreman@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_023651_209614_E5042835 
X-CRM114-Status: GOOD (  11.76  )
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

Attempting to make use of a 1080p@120Hz display mode with 10 bpc RGB on
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
not quite a perfect match, i.e. 461.100000 MHz.  That proved to be the
actual root cause of the problem.

Add a new entry to the TMDS configuration table and provide the
necessary frequency division coefficients for the PHY PLL to generate
the expected 461.101250 MHz output.

Fixes: 9d0ec51d7c22 ("phy: rockchip: samsung-hdptx: Add high color depth management")
Tested-by: Derek Foreman <derek.foreman@collabora.com>
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


