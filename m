Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C628C43327
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 23:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SbaZfIBX5202S5ZMq3E5aHCjj9P3SjKPzs/8gGHpePc=; b=pvpMu1vrb+wPn9e/Hu9T4JcNdc
	Syl6p3zqeAhSkNogwktwkV/844XQYXfC+1rlP+WaWKqg0lcdRWLJsZJ//NjgZF/iOnlpxuTYBjed8
	asFQGxRHJr6NPYPV+L805rx4PToczq7uzM4vajyGZkRYPoCOVRxueWiM0NPI/pMNcnKpIRzqq8iRE
	wSrV2xbckmehITTyAZLgiu5k8LMl1YxgP1HcfRH2LTJsNowXxRMZiiHzFLzI5F2jFR1hgn01f2Gxj
	xF59Jz1QglzoxWD+zpOY2sOBkkRJkV0VOFb39skwDNiLVfMrfkZ5+QTjtQpmevDAANeVYrkjUQ0PX
	2MftuK9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf4bv-00000003E2W-0EDM;
	Wed, 01 Jul 2026 23:44:55 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf4bo-00000003Dsk-0nup;
	Wed, 01 Jul 2026 23:44:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782949486;
	bh=K4TFQfI8KrgKCRiz3fVU2iMjkS2a62J+Oe7IrvkqpNg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LrpvvmfL5Hk8Qy3HBqAuS+422+BzBJgOUUIR+fu4ogaO0Z+CwfFzpkU1b1Xlty83d
	 SLXCBOB6O13U6A6iOfPD4dENHuYJMZKfwYrAWjCLdqET0EshGWypwWjkVlxzB8FAwe
	 r7Sv/O6U648QItLftK3Ng///PVIRFuYGhPVX3qeIRQa8Bh8K2rEIw0ar3ZtiRapvzT
	 z3z5O6je2xzGc82RmuCjtqN/IAWFVbD5BOJSaefSGEV659mpalMv7WvNCrvaptZWFO
	 AxmNJ2v/pTqkQuxRqm7HbKI1Fgk9R9vvWq3kTEHSqg6FQH0JtMC0HFXmgEOeR6TbBd
	 bwpkM1QwXsIJw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B82A717E023C;
	Thu,  2 Jul 2026 01:44:45 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id D8817480071; Thu, 02 Jul 2026 01:35:48 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 02 Jul 2026 01:36:07 +0200
Subject: [PATCH v9 29/38] phy: rockchip: usbdp: Handle
 rk_udphy_reset_deassert errors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-rockchip-usbdp-cleanup-v9-29-e31efbb62d2e@collabora.com>
References: <20260702-rockchip-usbdp-cleanup-v9-0-e31efbb62d2e@collabora.com>
In-Reply-To: <20260702-rockchip-usbdp-cleanup-v9-0-e31efbb62d2e@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2365;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=K4TFQfI8KrgKCRiz3fVU2iMjkS2a62J+Oe7IrvkqpNg=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpFpFT2IyOzi6G5F/L3yujvJZYpCZva+SZRg
 wVGmceIcTp84YkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqRaRUAAoJENju1/PI
 O/qaLLYP/i0FxP/zsgeGzItkWLUf57bXZpGMf6BvoofxIlFKVXLW38pWDDAHGoU9OsvMF5hMtRr
 5FO6FIyp2Hwqbv83KnUu9kzjeKGsmDeYLbojtAbKICmAr9EjcebnQVXC+hq4Agc6ggpvdbqnuZm
 l1e3IabPQC3/Gti5yM0wPAepoQeFWlZqvz2tf3QP2HxhD+yIZYGm/qnevwQ4+lhIWL5abQnXsDF
 11PqCSkrddn/HwRmWkji+X7CNOHADXVu+j/5/CkKrSM2JXq1euply4WlASPxqjFzm3grzTJK5em
 cNti+2/S+juVuBPA0O/MApdol1kTClW7XZkXfhwNXaxYSmYRrmpY0aG7ZwEtH2RGv++uPSZk61H
 N3RZdPup/Aoz3nPjMkKVxzQYF3Z53fC4AHadGfXrxxKUkGITiSjFdyci1gcTOvVieZH6gCi4WBu
 etrzW4OTCkoUMq1gcy/Aq2BBLfFq7pjxGF+OK62MhBXa3PTpNFrzkf5I5Qw7eDSwKQhHFCt/B0Y
 MclO69Av69YeyQQ77rip/+L24aKYzlPtDQgN5vVPDDE4NnJ2/e/vqY7zNORRevL2sWdJuZkgo0y
 iR6yanm/eN1Tj2D3r8Hja5XSFTy5RY+/cFgAxQKKmItoSYV5l5m0S7B/qqiOVlBi/L/3yi3NDzQ
 ikORdcrD1lbqZpInrTnw7xw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_164448_388809_AB1E1DA4 
X-CRM114-Status: GOOD (  12.31  )
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

Handle rk_udphy_reset_deassert returning errors to avoid theoretical
(Rockchip reset controller driver does not return errors) SError.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/message/20260626211151.2332F1F000E9%40smtp.kernel.org
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index f788405dfa1f..266cbb0e5325 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -799,8 +799,12 @@ static int rk_udphy_init(struct rk_udphy *udphy)
 	/* Step 1: power on pma and deassert apb rstn */
 	rk_udphy_grfreg_write(udphy->udphygrf, &cfg->grfcfg.low_pwrn, true);
 
-	rk_udphy_reset_deassert(udphy, "pma_apb");
-	rk_udphy_reset_deassert(udphy, "pcs_apb");
+	ret = rk_udphy_reset_deassert(udphy, "pma_apb");
+	if (ret)
+		goto assert_resets;
+	ret = rk_udphy_reset_deassert(udphy, "pcs_apb");
+	if (ret)
+		goto assert_resets;
 
 	/* Step 2: set init sequence and phy refclk */
 	ret = regmap_multi_reg_write(udphy->pma_regmap, rk_udphy_init_sequence,
@@ -826,8 +830,11 @@ static int rk_udphy_init(struct rk_udphy *udphy)
 			   FIELD_PREP(CMN_DP_LANE_EN_ALL, 0));
 
 	/* Step 4: deassert init rstn and wait for 200ns from datasheet */
-	if (udphy->mode & UDPHY_MODE_USB)
-		rk_udphy_reset_deassert(udphy, "init");
+	if (udphy->mode & UDPHY_MODE_USB) {
+		ret = rk_udphy_reset_deassert(udphy, "init");
+		if (ret)
+			goto assert_resets;
+	}
 
 	if (udphy->mode & UDPHY_MODE_DP) {
 		regmap_update_bits(udphy->pma_regmap, CMN_DP_RSTN_OFFSET,
@@ -839,8 +846,14 @@ static int rk_udphy_init(struct rk_udphy *udphy)
 
 	/*  Step 5: deassert cmn/lane rstn */
 	if (udphy->mode & UDPHY_MODE_USB) {
-		rk_udphy_reset_deassert(udphy, "cmn");
-		rk_udphy_reset_deassert(udphy, "lane");
+		ret = rk_udphy_reset_deassert(udphy, "cmn");
+		if (ret)
+			goto assert_resets;
+
+		ret = rk_udphy_reset_deassert(udphy, "lane");
+		if (ret)
+			goto assert_resets;
+
 	}
 
 	/*  Step 6: wait for lock done of pll */

-- 
2.53.0


