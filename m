Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33207CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 16:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TY/jmezCk2IGHu1L4RBdyjacUFr0kVBkg1PS+t1yGG8=; b=KcekJnx9mSYxgVTiyKKck4Yk/p
	cmsBgPlxnmjujgqssaOJwHSoNRl4nZhk20jPcKOboUB/PrzS6ZKHbFmDAoJhr35a1EQe8e/30hMoG
	hzeNHgWaSVcTvr1w1dekzUIWjfCOQAhtsFNtzuoJLnCmwwvxQKwc34FBP04KTS+iqGfofmodjVNJw
	9taNi+f0TqQALXp882vjyf5FCiH9qXgtgugIKjR2vsdI5S0LBFlbmbXoiJ/3YHAXJIQWvxRo6Dtw4
	8KDlu7/yXbPndS7YoqG/TpoLxNJjX983DexaVxKs1gh1yaBb/zgUBpl4x9BaZgj5Hi27sOv+iZMrC
	VnvpopiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4e0-0000000BEMS-3NR5;
	Fri, 12 Jun 2026 16:22:08 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4dt-0000000BE4k-1hNg;
	Fri, 12 Jun 2026 16:22:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781281314;
	bh=nn72v3NXHYnsFH6LgmNbYwWr2AJNEbtIzUXIxz/C0k0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=awYYdslfh/upFrIuTnUi4x4On05b76mm7FJpUg+2wlKuZvBhwVu0rbm7REgWlnRif
	 T45l7K+73b3A9NN+D9SW+1EcRzLI6MMvc32AdvQT/04cGw6H1EPBV8SbSLFs1pfH8l
	 5dkHuOhEw3GRDzVsmXHpJKWwGvz1EXCifpSSjQYmJQuFwF+34Qa83HEe+T2uV0kIuI
	 ekPwAnGYS4RSzAl3v59aaDc5V/9xwdwTXXUMSMaCVjJKeryWQaPR7j4/nfKPVvlIhg
	 jePoU3PGj3ciGRfQCA+97PCFFMJKnr5I3famn+b3sBgWJf9z/GVeUiS0PoTC8UPYYX
	 HLwKNdSgVxsMQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 901D217E1104;
	Fri, 12 Jun 2026 18:21:54 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id D2FAD48003D; Fri, 12 Jun 2026 18:21:53 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 12 Jun 2026 18:21:48 +0200
Subject: [PATCH v5 10/18] phy: rockchip: usbdp: Cleanup DP lane selection
 function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-rockchip-usbdp-cleanup-v5-10-efc83069869f@collabora.com>
References: <20260612-rockchip-usbdp-cleanup-v5-0-efc83069869f@collabora.com>
In-Reply-To: <20260612-rockchip-usbdp-cleanup-v5-0-efc83069869f@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1889;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=nn72v3NXHYnsFH6LgmNbYwWr2AJNEbtIzUXIxz/C0k0=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGosMiGC9Js2vHRBo4IIsfXrskxlpHWaB0bnK
 UyvrLWLNhgRxYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqLDIhAAoJENju1/PI
 O/qa9a0P/RHgIcA0g+8Mal3rdvSPll/VZVXuqzsqiIWl8kaF0YuyKXWFXW+hBG08N048Ebv56Gf
 MdOWU6ZeWgDO9Jr4GeM5COSSDhvodsnpmDSULzR+3uzpWjRnsP32KYg910bL+dLME272cCBqb7c
 ASmvm4FPHlMJoLdFa8zgOYMwjFV9dT1XYhWFUYmaTeRWngfQZLYeHW2bJYAj76IjMb7gAIiz+pm
 iA+ZLEpaxuuNkyGkmr1QYnaeSprbm31vLDDEHKqhFz51qOPWm7LIDS1kj+cH1ZFosa5tFfpNZur
 dSV289edIJauXabTZAyqYYA7rxoxhiNzf3qMP6h5dohou3cT0MLSbGv//3zZkiDOoy41N7Be1sU
 C2gL/3gYCFXD4YLwtJo+Dz59/yQT7UbErW0vv03vZPzXc+LEF/FFuRJQSFJxRaWmnfDT+nUs6RP
 0IMDgq7pqekGwLs/QEtSZ5DJX0ss2dElAaT8NKUV6yCFcvCjWYX8TCf7y52sAWD3pKUmenJ+5CW
 IGd5/OP10J/e3jaPD3qiICi2gAZaT4+gFVi8fCQkR3zgDuB7nLYV4FYU2YCK3+lAQDI3FOVVgN1
 hn1ruXFxN2uDaIgu/1NNKmmdvrDn8accxG0nuBH6oLL2kEC4N9vW5JbMD2shVI+fo6X9j6vNwqv
 Nc5qK7L83H8GYycpeFrgq2A==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_092201_600843_DC49D27C 
X-CRM114-Status: UNSURE (   9.79  )
X-CRM114-Notice: Please train this message.
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

Use FIELD_PREP_WM16() helpers to simplify the DP lane selection
logic.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 1bfc365e2b2c..beab20e4c512 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -550,30 +550,16 @@ static void rk_udphy_usb_bvalid_enable(struct rk_udphy *udphy, u8 enable)
 static void rk_udphy_dp_lane_select(struct rk_udphy *udphy)
 {
 	const struct rk_udphy_cfg *cfg = udphy->cfgs;
-	u32 value = 0;
-
-	switch (udphy->dp_lanes) {
-	case 4:
-		value |= 3 << udphy->dp_lane_sel[3] * 2;
-		value |= 2 << udphy->dp_lane_sel[2] * 2;
-		fallthrough;
-
-	case 2:
-		value |= 1 << udphy->dp_lane_sel[1] * 2;
-		fallthrough;
+	u32 value = FIELD_PREP_WM16(DP_LANE_SEL_ALL, 0);
+	int i;
 
-	case 1:
-		value |= 0 << udphy->dp_lane_sel[0] * 2;
-		break;
+	for (i = 0; i < udphy->dp_lanes; i++)
+		value |= field_prep(DP_LANE_SEL_N(udphy->dp_lane_sel[i]), i);
 
-	default:
-		break;
-	}
+	value |= FIELD_PREP_WM16(DP_AUX_DIN_SEL, udphy->dp_aux_din_sel);
+	value |= FIELD_PREP_WM16(DP_AUX_DOUT_SEL, udphy->dp_aux_dout_sel);
 
-	regmap_write(udphy->vogrf, cfg->vogrfcfg[udphy->id].dp_lane_reg,
-		     ((DP_AUX_DIN_SEL | DP_AUX_DOUT_SEL | DP_LANE_SEL_ALL) << 16) |
-		     FIELD_PREP(DP_AUX_DIN_SEL, udphy->dp_aux_din_sel) |
-		     FIELD_PREP(DP_AUX_DOUT_SEL, udphy->dp_aux_dout_sel) | value);
+	regmap_write(udphy->vogrf, cfg->vogrfcfg[udphy->id].dp_lane_reg, value);
 }
 
 static void rk_udphy_dp_lane_enable(struct rk_udphy *udphy, int dp_lanes)

-- 
2.53.0


