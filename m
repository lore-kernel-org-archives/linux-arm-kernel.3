Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 310C9CDE00B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 17:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gljqqiaA5n+dnaLW/EKZpq7yV1Dj8Xztnx1BNx0sqoc=; b=hk97GuvQQLGdi64oxAqxTapddo
	T9Ruey2y+myncExYIgS9DzauTzRAWBPclp6r1BvIJ3QJp9oFujWnb5nW0pWD0E8gMTkFawcWEXFet
	DinHYtAQjfggfMkivhYrfOcK/j7iSIYQ8YnBfjpiTY2AH9NqoszLq/gNNJNxy0K80y6f1lNF/28Q0
	GtOiQWYOPfYPgIGGtn/8ajhlR1/rukMzj19+XQkoOaV2U89kn4AW+WYJzXWyhw4voTidaSU2Lyn3Z
	IoAmtR/TwLo6FTEU2VIOl7KE+rd6Foo3/ykSVmIG9pTDia7D2yzzJn9BBpk59ZEic1MxMM6XkVB4P
	NlzDKeeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wco44-00000009aMQ-0OQX;
	Thu, 25 Jun 2026 17:40:36 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wco3I-00000009ZVV-0tTy;
	Thu, 25 Jun 2026 17:39:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782409181;
	bh=55a1CMz0aPbT0z+xD144Y7HsUrcAJRjocQi1kgsRK5U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Hoop8H4+NLxq87T/JXfqRy7f6l1AEYOK/5GZy/Cj9m6xCDnXFAGeGHLIuOc3Rw+yG
	 aLnUO42ObKZxJVUpyqlIQ82aejW1S4l1wKb5Rz6GGLehp+ORlQ/E9Khv5VbDjP59ny
	 gQmG1zR6MJOYXMD2ppX68WsprKibi1qbJgvq+R7MRIbbXT5RE6JnPgkjXv1yNDvM5s
	 myc7Q4H71j4GXNXs5GUAgfZi6GPuLz9kCHyA8InrUDjW18l37F2YwSaMv0+3qehmQH
	 AKzvBDhquf4D/+XLDVdchQ1K/93/om4hSRjLbe67gYfwclMczRfXPFHW2lkYtcUoZn
	 qsVMI65Hf4bBQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C9D7F17E1531;
	Thu, 25 Jun 2026 19:39:40 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0B023480048; Thu, 25 Jun 2026 19:39:40 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 25 Jun 2026 19:39:39 +0200
Subject: [PATCH v7 12/27] phy: rockchip: usbdp: Add missing mode_change
 update
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-rockchip-usbdp-cleanup-v7-12-38eb3cf654fd@collabora.com>
References: <20260625-rockchip-usbdp-cleanup-v7-0-38eb3cf654fd@collabora.com>
In-Reply-To: <20260625-rockchip-usbdp-cleanup-v7-0-38eb3cf654fd@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2006;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=55a1CMz0aPbT0z+xD144Y7HsUrcAJRjocQi1kgsRK5U=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo9Z9uC1Nj0Wzul/F6072JLY/OZpZq5BdhuF
 k9NTo65aMmoeIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPWfbAAoJENju1/PI
 O/qaAp0QAJmyKZv7/4bIhBdDdxWc3uSfH6AxRm34h7RcWcluNTdPJfu6R0Zgs5XoLdazh4Hqcrq
 oQ0V0d6zWVs69cjnmPqXon0JamzCUc8xYrEJts/OzmU36kTdAWHki0m/UZ/75GGRo3Ho+qoKSWY
 ABk++2DhT18oAqRLZIwqMaKzHHYdC9HbvyxbbMLNC2LdGiS3N0culfqfOFzxpYM2tG0nJn7QTQc
 7JHsGcQQ6i31zF/eiG/psch41IoVnCeAL8LDN/yQWtGzXsX854wiaHpB2AtgH2U3g1PZSiIGSWK
 j47N+VywLvfSzQNmPaRBznGq6V0db3Zdu0LjEXOsrORcsgthBx/6Wu6Fy9LFus2+QXSo6dd42m9
 6wrt7G0ASDGaT8jzHUqI01vNXVg1FvpQM+Er3w1XsjhMXRc+ACUhfalZ99dzDANGBA8A9jCOZDU
 D/Nks0srSfSCvhUO2AYZqKCLmw59n+h5O3U5SJQAB5IW52hUV1y1lQtntAeqq4pmnabRrvOK8XI
 ueEi7+PqkaCuVhwNdLaOVQxo+sMLjMUhE+3sU9fXvB2RXisdDnGBnMctdJ2Q3mS9iwyc6dq342R
 HC9R4t0Ud8NxFurQQtdUVpD0ayEPIOXx4Q5z80qqAdqNa5ivUJ3eHecgiv8YKX9bFe3NfG9eK0a
 J9q7hMq1xbfroJI89vO8yFQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_103948_438420_4546130E 
X-CRM114-Status: GOOD (  12.43  )
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

rk_udphy_set_typec_default_mapping() updates the available modes,
but does not set the mode_change as required. This results in
missing re-initialization and thus non-working DisplayPort.

Fix this issue by introducing a new helper to update the available
modes.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 1067ddf2d742..f079715f7da2 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -622,6 +622,15 @@ static void rk_udphy_dp_hpd_event_trigger(struct rk_udphy *udphy, bool hpd)
 	rk_udphy_grfreg_write(udphy->vogrf, &cfg->vogrfcfg[udphy->id].hpd_trigger, hpd);
 }
 
+static void rk_udphy_mode_set(struct rk_udphy *udphy, u8 mode)
+{
+	if (udphy->mode == mode)
+		return;
+
+	udphy->mode_change = true;
+	udphy->mode = mode;
+}
+
 static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
 {
 	if (udphy->flip) {
@@ -652,7 +661,7 @@ static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
 		gpiod_set_value_cansleep(udphy->sbu2_dc_gpio, 1);
 	}
 
-	udphy->mode = UDPHY_MODE_DP_USB;
+	rk_udphy_mode_set(udphy, UDPHY_MODE_DP_USB);
 }
 
 static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
@@ -1394,10 +1403,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 			usleep_range(750, 800);
 			rk_udphy_dp_hpd_event_trigger(udphy, true);
 		} else if (data->status & DP_STATUS_HPD_STATE) {
-			if (udphy->mode != mode) {
-				udphy->mode = mode;
-				udphy->mode_change = true;
-			}
+			rk_udphy_mode_set(udphy, mode);
 			rk_udphy_dp_hpd_event_trigger(udphy, true);
 		} else {
 			rk_udphy_dp_hpd_event_trigger(udphy, false);

-- 
2.53.0


