Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F05CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 17:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Date:Cc:To:From:Subject:Message-ID:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dJfTZYzHcnQiEPMNnGUef+DkApX9Jg4jYFXcZeflThA=; b=Gw7osK0PT6jXzAkoyl3yeLHB+Y
	wPyUC0jGSPI/FF7U9ZMlgY80hFbdP2PBbN2/JNOjlbX2UJVsDdBCArEqHoEvApA7o218TXhI+26ci
	nJsp8CzLVsxX+lQICS3s8QlO8u03MEISpF0fEm8ZbH11+86KpHZiEfx6d0bntmEaE3eJEBN1NH4jq
	VLDqBDEdsH3jB4MFOOWDghIsOOoxOaHWiYIm/1heF9rq6kPkjkwTDcVE+RK9cfCQQpjos061tjRMd
	y4hbj2zSQysqalWKBcg+mnTXH8oMPKzwg7NmyjYRauacQeWj+mpv8vy7d5lST6eZtIdzlWJK+07kd
	3PaNIzrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyD6v-00000005J7X-1QXE;
	Mon, 15 Sep 2025 17:35:29 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyD6s-00000005J62-0l31
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 17:35:27 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-45dd505a1dfso37055985e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 10:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1757957724; x=1758562524; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to
         :reply-to:from:subject:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dJfTZYzHcnQiEPMNnGUef+DkApX9Jg4jYFXcZeflThA=;
        b=i3dV+VSHdpxrbI/PJASUJOG5vubPBDRbNcA8bBz14uIVlKxAFA1c39MozzcpaqUIOJ
         9Rxt8+51X7J2nqBJTe6b8FNFBPzJ0I4vjbGOJ0RrlhM5s6V8l++jks+z0X+5FinlYXlZ
         FUEglBudTO1pLXA+8CcARlPO168DDGdogynQFanpeR6PygzrAaGngSO3Ykrvk2qc5GId
         22hy3ZzNfFQ+1pSsM9w26FiJlBXxC8kLGtYKxPN4wHkhiJ2kJxyD371kFcMJv8jIzjm2
         SxRSdWYw27dgNM6xgkPWhjjHTjnGTVYucTQ38u0UOfN0lQxuMpEqtXYgW0c552pRpRBG
         dyOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757957724; x=1758562524;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to
         :reply-to:from:subject:message-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dJfTZYzHcnQiEPMNnGUef+DkApX9Jg4jYFXcZeflThA=;
        b=DPte82v/lfhNLUuC7I1O/KP2Msq2CQHWSg7qsrTn6t1k0jWY3kec/DejycbtFyOrP8
         EzUMqkEMumxRFJ1MlouNmccBVt4qPHCk/1IoFEa2ZALxrYblyofKYUo8xGcGZBY3zVHh
         nBMaSbBi2qxqVlSJxMFVo+BMqtDna0jk7xTmjBSxn+yDRcTaGvUzXSEW4A93y2pYJcYZ
         SPG32S4JIQ/z0ZS4EOQlBnKU3JL2GrH5hmIIlzUkN2XS8ZdgdFl2yEYCFqtmLdiGffmI
         KlX70Ln2Sm6D7yh+0QWp+NXz7zqdw/MdS4WDfzrXG/D7zIzXGP/JbHVEcZzvR9a/5f+p
         aBHQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2Apa4o+btNGwgQ7itTq9sE+htaCka9zWkKU6e2QvUaHhp3VLetrrqG5ZBB2iEYKtSRqwDeaIefTw9e4pKdHkd@lists.infradead.org
X-Gm-Message-State: AOJu0Yz89oRkJlQH7q6+ubxKKklG8YMBIa5OsBcK4DmXVXQQVNXZPKst
	W69I77i5gyIcS18gTM206xMmX44EypdRmlHCSUJnNqcbYm88TR30dxXhWmK2YA==
X-Gm-Gg: ASbGncuj8UjaOX03ovFEQ03SMEV2mENoiDs/eLkJzQpGzm8K9b1RWgNwL3NmurkNrRy
	qKlC2eqh5bYt0fgqA75mG86hQvntvEfVo17B7Ia9BIbZI5frKjvaMRE8YOqAD3mFqdZ4S4+NR4Q
	aFARfRmQ5b9Ldgvc0CoQTeQXQB9O0eRaZ1JQj1OfxmfJh41bdxEOpDGGvRbMhAFieRBhjJp6CA9
	z+r9zeEa7M26U/xr2T8D7BLvJ5LxEwic+GMDgzOL2c3o1j4vPDAoxKZqk9hCLdKxan8LeZDbinm
	Oxr1uEKv4v3ZiMYiT947uefZph4Q+rATz9mvQzwtOPZlu434yvIKieCqFn+3aoaP2yciKrlJ357
	LV0wk6KZwkiKFiClCy8FcP2gmIwc67mdVSYrB
X-Google-Smtp-Source: AGHT+IFlmjL1Fht0YOdtcMNyEHLpJqko9jLlpH0FPgQwvYKwyX04VvMT7kNUH7KAojwm5eI6mGVNdw==
X-Received: by 2002:a05:600c:584d:b0:45d:e110:e690 with SMTP id 5b1f17b1804b1-45f211d55aamr97678875e9.14.1757957723588;
        Mon, 15 Sep 2025 10:35:23 -0700 (PDT)
Received: from mars.fritz.box ([2a02:8071:7130:82c0:da34:bd1d:ae27:5be6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7c778f764sm13377778f8f.57.2025.09.15.10.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 10:35:22 -0700 (PDT)
Message-ID: <9dd924871a81364a922131461339dec2a45d434e.camel@googlemail.com>
Subject: [PATCH] drm/rockchip: rk3288-lvds: honor DCLK edge via GRF CON15
From: Christoph Fritz <chf.fritz@googlemail.com>
To: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Andy Yan
	 <andy.yan@rock-chips.com>
Cc: Sandy Huang <hjc@rock-chips.com>, linux-arm-kernel
	 <linux-arm-kernel@lists.infradead.org>, linux-rockchip
	 <linux-rockchip@lists.infradead.org>
Date: Mon, 15 Sep 2025 19:35:22 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_103526_227183_5300F763 
X-CRM114-Status: GOOD (  14.39  )
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
Reply-To: chf.fritz@googlemail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Set the DCLK edge (normal or invert) via GRF_SOC_CON15 when the specific
drm_bus_flag is enabled. Keep track of the vop source in use so that the
right DCLK (BIG: dclk0 or LIT: dclk1) gets set.

This change is especially necessary for RGB output configurations to
actually propagate the DCLK inversion.

Signed-off-by: Christoph Fritz <chf.fritz@googlemail.com>
---
 drivers/gpu/drm/rockchip/rockchip_lvds.c | 17 +++++++++++++++++
 drivers/gpu/drm/rockchip/rockchip_lvds.h |  4 ++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/roc=
kchip/rockchip_lvds.c
index 2411260db51d7..08784c3ecf703 100644
--- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
+++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
@@ -58,6 +58,7 @@ struct rockchip_lvds {
 	struct drm_bridge *bridge;
 	struct rockchip_encoder encoder;
 	struct dev_pin_info *pins;
+	bool use_vop_lit; /* true if CON6 selects VOP_LIT */
 };
=20
 static inline struct rockchip_lvds *brige_to_lvds(struct drm_bridge *bridg=
e)
@@ -235,8 +236,11 @@ static int rk3288_lvds_grf_config(struct drm_encoder *=
encoder,
 				  struct drm_display_mode *mode)
 {
 	struct rockchip_lvds *lvds =3D encoder_to_lvds(encoder);
+	u32 bus_flgs =3D lvds->connector.display_info.bus_flags;
+	u8 con15_dclk =3D (bus_flgs & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE) ? 1 : 0=
;
 	u8 pin_hsync =3D (mode->flags & DRM_MODE_FLAG_PHSYNC) ? 1 : 0;
 	u8 pin_dclk =3D (mode->flags & DRM_MODE_FLAG_PCSYNC) ? 1 : 0;
+	unsigned int con15_dclk_mask;
 	u32 val;
 	int ret;
=20
@@ -260,6 +264,17 @@ static int rk3288_lvds_grf_config(struct drm_encoder *=
encoder,
 	if (ret)
 		DRM_DEV_ERROR(lvds->dev, "Could not write to GRF: %d\n", ret);
=20
+	/* SOC_CON15 DCLK normal/invert */
+	con15_dclk_mask =3D lvds->use_vop_lit ?
+		RK3288_LVDS_SOC_CON15_LIT_DCLK1_INVERT :
+		RK3288_LVDS_SOC_CON15_BIG_DCLK0_INVERT;
+
+	val =3D con15_dclk ? con15_dclk_mask : 0;
+	val |=3D con15_dclk_mask << 16;
+	ret =3D regmap_write(lvds->grf, RK3288_LVDS_GRF_SOC_CON15, val);
+	if (ret)
+		DRM_DEV_ERROR(lvds->dev, "Could not write to CON15: %d\n", ret);
+
 	return ret;
 }
=20
@@ -273,6 +288,8 @@ static int rk3288_lvds_set_vop_source(struct rockchip_l=
vds *lvds,
 	if (ret < 0)
 		return ret;
=20
+	lvds->use_vop_lit =3D !!ret;
+
 	val =3D RK3288_LVDS_SOC_CON6_SEL_VOP_LIT << 16;
 	if (ret)
 		val |=3D RK3288_LVDS_SOC_CON6_SEL_VOP_LIT;
diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.h b/drivers/gpu/drm/roc=
kchip/rockchip_lvds.h
index 2d92447d819be..81081b84eea6a 100644
--- a/drivers/gpu/drm/rockchip/rockchip_lvds.h
+++ b/drivers/gpu/drm/rockchip/rockchip_lvds.h
@@ -77,6 +77,10 @@
=20
 #define RK3288_LVDS_GRF_SOC_CON6		0x025C
 #define RK3288_LVDS_GRF_SOC_CON7		0x0260
+#define RK3288_LVDS_GRF_SOC_CON15		0x03a4
+
+#define RK3288_LVDS_SOC_CON15_BIG_DCLK0_INVERT	BIT(13)
+#define RK3288_LVDS_SOC_CON15_LIT_DCLK1_INVERT	BIT(15)
=20
 /* fbdiv value is split over 2 registers, with bit8 in reg2 */
 #define RK3288_LVDS_PLL_FBDIV_REG2(_fbd) \
--=20
2.39.5



