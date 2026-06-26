Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 342E8C43327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 21:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ogK5DrC2mjHv5uafLOYwmwT8eUt6S5FEnVmlWyAD08=; b=Mgb13gq8YY0/EGK67rSWL92uuc
	DU+Uyyx7pAjeb5NzQEVFr1cL0C36rTILH7i6cXI5/zxIt5rAEPMOHyhtyzD+lUT5eAWPjwS7Cyuc6
	HXJ5GtqhQDZSyrOjAdQoObOgl6t/rhPpE2IlJeDG4xHDGRkjmTBivVFbAj0821bBrPKSQW9KmQnyj
	jhzOS9bi02B5HaNRgvO4Idp2hjsUuu/CebwDQxyzkPGeeZceqX+hiG7tlkJyxrFTwjMu9Jq6xmDcr
	32zkytiQ2WRNVnEWFaZmQWTD7CB+QhpRyJmhzF7FrL+1MuF/7/bkQa3oguzy4xe2Pd8K6wIEO4TiQ
	thDIrZFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdDhA-0000000Bsyr-3iqf;
	Fri, 26 Jun 2026 21:02:40 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdDgs-0000000Bslg-3Udg;
	Fri, 26 Jun 2026 21:02:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782507740;
	bh=z5ArQie+25lpzfxR5vY7ueV2Ks9qhlwHdmy+YLbUGgc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SmgbsxtMR/Odv0/RjgMDVe2rJfu7LrX3cMxNawjRMvp8gQxtTzirj8P4JotCmtwrg
	 cZoDZxyC6uni5k/Wnh01Q46Pcmo9ko5LThCsLZrfvbZ1bnqC89Sz+duwP0c7L+GdXy
	 EqD90ImRPMVhLsC2DscUfi8plcg2JaYP/PqgGetoot8VVeP9pwRCIPAqXwfPzzVDFU
	 4TIeR5mvPttaJ6aiGq4VMAq+ciEa+KLKMUAkL+VBGG1jTexockFg7W1OdGKg7RnFwE
	 Y4eqLA6zU9Oii0ETj/Gl9TvJI0hV3mAvEYYiaZp7mNLUmYjzwK4lcS9CG9db+bALZe
	 BQC/LtZs4/KKA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0632C17E0F8B;
	Fri, 26 Jun 2026 23:02:20 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 2B88A480067; Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 26 Jun 2026 22:55:15 +0200
Subject: [PATCH v8 22/29] phy: rockchip: usbdp: Properly handle
 TYPEC_STATE_SAFE and TYPEC_STATE_USB
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-rockchip-usbdp-cleanup-v8-22-47f682987895@collabora.com>
References: <20260626-rockchip-usbdp-cleanup-v8-0-47f682987895@collabora.com>
In-Reply-To: <20260626-rockchip-usbdp-cleanup-v8-0-47f682987895@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1759;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=z5ArQie+25lpzfxR5vY7ueV2Ks9qhlwHdmy+YLbUGgc=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo+5yUnIBGtcaw3J9f2Jxg0XrKKTU088zOC1
 1VM6QB28LabEokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPuclAAoJENju1/PI
 O/qa1tQP/isoWK3Wwe8hDfeIEFNRp81dcRt+EnorGMXCQZcYPnAODIoJ1cvlG5QtMHRV1H5x8NI
 yoRlPnWwAq7h/Ivpbjp2W2SkIYVsD8eEssas7d2yWxPbPbAyg7/KCji4bjNpxxX7pl+Pum7znT5
 /Lt9A+dSUn4J4VX7wFI6YXTrHvK0L+YzBc3hM6nbSVH8BFKe3ZXanRXPIdMKuM1vLmA8i5o+1qV
 tTHLjhJlWExfcUCmCIFzSruQvMFRB+2930wraLlBlt/RGdm6MxKUbI+HdFEo8JHF4a8gzsY0Whi
 3KJZiKv8lnynZGejyCDDkRRQXHd6V6uJdtTisaFYGhI1Mga1I4Y6O3Uoe+7RjcFmJZyQ9LQZ6Za
 LHOz9a3s83N8JDs+PhUv8wcFzRRAkQeE4x2cey5QkBENtXNxDqYloK288c3P/fbfheX50mHxew6
 rIaTPAATYWE9AKgPVCyE9bSyrRQXg/DYAajaA2FDte3PiHdbb8e+Inql+q0DALWNz/tiuA/YP0B
 tUXk0r0Sj84zfPD9laP3p0em5Z/TNWgmVntcjqLXEo0fryMulbgZe/uiWrUwZtBSK6AwVmyA8Oy
 Pry9LxH8JaPTvSq5dsUSLulvczDGF4+2NNIV+Ecz5TnElgexgfekt179oStXVYuP/VKoGGj44fQ
 7F6MRwxP2X8PKYYd6vWAtTQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_140223_027858_84C05AE4 
X-CRM114-Status: GOOD (  12.24  )
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

Handle TYPEC_STATE_SAFE and TYPEC_STATE_USB Type-C state events,
so that the muxing is properly updated when exiting DP AltMode.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/message/20260619155020.CC7361F000E9%40smtp.kernel.org
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 7c3b0d45d938..63fb41ad0199 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1327,17 +1327,26 @@ static const struct phy_ops rk_udphy_usb3_phy_ops = {
 	.owner		= THIS_MODULE,
 };
 
+static bool rk_udphy_is_supported_mode(struct typec_mux_state *state)
+{
+	/* Handle Safe State and USB State */
+	if (state->mode < TYPEC_STATE_MODAL)
+		return true;
+
+	/* Handle DP AltMode */
+	if (state->alt && state->alt->svid == USB_TYPEC_DP_SID)
+		return true;
+
+	return false;
+}
+
 static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 				  struct typec_mux_state *state)
 {
 	struct rk_udphy *udphy = typec_mux_get_drvdata(mux);
 
-	/*
-	 * Ignore mux events not involving DP AltMode, because
-	 * the mode field is being reused, e.g. state->mode == 4
-	 * could be either TYPEC_MODE_USB4 or TYPEC_DP_STATE_C.
-	 */
-	if (!state->alt || state->alt->svid != USB_TYPEC_DP_SID)
+	/* Ignore mux events not involving USB or DP */
+	if (!rk_udphy_is_supported_mode(state))
 		return 0;
 
 	mutex_lock(&udphy->mutex);

-- 
2.53.0


