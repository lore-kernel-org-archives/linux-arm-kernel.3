Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B584C43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 23:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+574nsJgw7cSNXkVQR6yScm9DYuK5KiloK6lKNYaJz8=; b=TJP+d7XCQrm/99IreADLbGF5Mh
	MgLh4T4+XNs6BQdImoy+h/x3Ie5fQxb+BDhycYC30mby73zpwoGg7tlp1xbyG+OMuNLP+22ZfncBY
	cdVoeqoFFB40Z71P7/pJlOMY721sFwuq7iA9kWfY6N8/vWv0KLvbhJ6OXtbBMs7X2fmcSNU98Hkl2
	oiBHPQH6iluxt8obl/z1NWz7BBGUimGkFi+4fvNmVeIskuDgI0+WxXVA/v7hw2wUa21QlN7NcLPju
	44Upl2BEdA6Jm0QwG2g9IlG+hU0/w7q7IGFyMm7W0UUeIFepvdcN1sv8M7X/BGb5sQ55TZVhvzjxu
	7PDhlg1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf4TN-00000003A98-2lqd;
	Wed, 01 Jul 2026 23:36:05 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf4TE-000000039lk-1k3h;
	Wed, 01 Jul 2026 23:36:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782948949;
	bh=0FtTX79xt0EBYjvLtHUyDjYzFQpbVZRekVbSWXeCyyk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NuRFT/cn1yQQEJ/vkhStNIJbt+EU162wv8oSq7gC1LSBZWm0B6CeOX0K6mcfSue4F
	 otiNlvgLB4MTshk07r7H558UUCmOx7eLIkkbHR8VGFkAo6r/jj2ru3jL4f6my9d/Vp
	 HKpnk2+5nEunpr7UGnSMK4WNVtqhnOQ/5R2i+jBdi//9Y1/Lu/uSfy6BKKbISkam8s
	 M6XnsVjdaohV5Lsj7YA/arH2HpYkkTqtTNOsrFgpBaXLXWPCqpU+bXMrOO0TUXgjVC
	 cKUvvvKiYKfy9eJpvUDbMEvWKp08LW42nYWt7EQX/0qUgWM45yQOTPg+IJrfsfPATK
	 Jj1NPVrYCI8dw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 522CD17E1411;
	Thu,  2 Jul 2026 01:35:49 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id B5194480035; Thu, 02 Jul 2026 01:35:48 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 02 Jul 2026 01:35:44 +0200
Subject: [PATCH v9 06/38] phy: rockchip: usbdp: Drop seamless DP takeover
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-rockchip-usbdp-cleanup-v9-6-e31efbb62d2e@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2751;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=0FtTX79xt0EBYjvLtHUyDjYzFQpbVZRekVbSWXeCyyk=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpFpFN+QMIggPCzG/vFrBVmVQiKdnvHQdrhj
 HVN6CKTRwCDWokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqRaRTAAoJENju1/PI
 O/qagrEQAIL8vbIJuCTOKLgIxMmY0B7WFlfonb7pTMWGhlMl/MGeaeAJt9v3eUvLNKWUEz4sp7B
 tG6TGPMnMJklQHxn1nEJ+KOfL+e3xnp1KVwkO33O4eCwglBkMovykDZpUKUQzx3RKcw380Fh+zb
 GPDIfu+5DTMhf8BEYVclgUgttEhQsW22IfKFrZzK+k/J1YKjYBF1pcGLkkmEzuvmfTr/sKljlxJ
 Jv72P26HRy17aJTjY50SLtpzstI0yccu2dEUuVmEZ7X7U9/IbO6itNdwLW78VxY8nfdrxO4aT8t
 uBISw/ULpCfd5lWsq4GY6gNs6zNr4yYAtvQy/MhJHU1oucxz3zrp7XTrbVr5c6z1eMULPd1Rm9L
 tOLf5VxreD50Yh2kqZr48ICwbBZLM8q3xVEJr6uJyDAGRdAAPx0KYqvGjEg/S8kwM2Wa/Z/LKAM
 eEcyATTWh99alt4n+Jb/APSJYBNXZq+WsnK1wVcQMcFpdHQJWdPfCCIgv1bwGrxUF7lQyg0DA2P
 D1SL13dOhYBgkB1GsAIUmxHDXo1Jq6GRzPTEfTFjcgSHfUXdeFwxxOvWM4xplTN21Rs/fysqiPC
 /ppyWUKMbjZWF2p2KN6rPwTDTT3aswI7NnqsKjQvkWEFqJHSWXfVOnxvXk2W4wLLqWzOs2/COrV
 KaWRuSVSPu8HF+0j2RLMmuQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_163557_215489_2161BA65 
X-CRM114-Status: GOOD (  17.16  )
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

Right now the DRM drivers do not support seamless DP takeover and I'm
I'm not aware of any bootloader implementing this feature either.

In any case this feature would be limited to boards using the USBDP PHY
for a DP or eDP connection instead of the more commonly USB-C connector.
With USB-C's DP AltMode a seamless DP takeover requires handing over the
state of the TCPM state machine from the bootloader to the kernel. This
in turn requires a huge amount of work to keep the state machine
implementations synchronized. It's very unlikely we will see somebody
implementing that in the foreseeable future.

As the current code is obviously buggy and untested, let's simply drop
support for seamless DP takeover. It can be re-implemented cleanly once
somebody adds all missing bits.

Technically the VOP side should be disabled first to avoid data being
send to an unpowered PHY from the running pipeline. As a workaround this
force disables HPD. I'm not sure if this would be good enough, but cannot
test as there is no support in the bootloaders known to me and my test
boards route USBDP to USB-C connectors.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/20260612164107.C7DB21F000E9@smtp.kernel.org/
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 3fc8222fcaec..d73455370113 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -926,6 +926,7 @@ static int rk_udphy_parse_lane_mux_data(struct rk_udphy *udphy)
 
 static int rk_udphy_get_initial_status(struct rk_udphy *udphy)
 {
+	const struct rk_udphy_cfg *cfg = udphy->cfgs;
 	int ret;
 	u32 value;
 
@@ -938,10 +939,14 @@ static int rk_udphy_get_initial_status(struct rk_udphy *udphy)
 	rk_udphy_reset_deassert_all(udphy);
 
 	regmap_read(udphy->pma_regmap, CMN_LANE_MUX_AND_EN_OFFSET, &value);
-	if (FIELD_GET(CMN_DP_LANE_MUX_ALL, value) && FIELD_GET(CMN_DP_LANE_EN_ALL, value))
-		udphy->status = UDPHY_MODE_DP;
-	else
-		rk_udphy_disable(udphy);
+	if (FIELD_GET(CMN_DP_LANE_MUX_ALL, value) && FIELD_GET(CMN_DP_LANE_EN_ALL, value)) {
+		dev_info(udphy->dev, "Started with DP PHY pre-enabled; seamless takeover unsupported\n");
+		rk_udphy_grfreg_write(udphy->vogrf, &cfg->vogrfcfg[udphy->id].hpd_trigger, false);
+		/* Wait for VOP side to shut up */
+		msleep(100);
+	}
+
+	rk_udphy_disable(udphy);
 
 	return 0;
 }

-- 
2.53.0


