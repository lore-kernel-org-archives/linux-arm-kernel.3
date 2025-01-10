Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A8CE7719C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 05:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vVXW9sadEYYz/3lyJUreu1a3FFE71B79MGuKsmMkDH8=; b=ys+cXCn5QsHNmEZzyi2w7acyHs
	+DQ+jd5KmyDdXV3VHEy61Y6LdS7J7EcvyT51phd3umz6gyYXPH62NOOIZbaqrKx3LdjsEMVkE1G9D
	VJhxaoo9m6k5CAtaKjqEcbCMxIs5NTC2Kfzb8Uq9/rrIAnxVMsptj/xGmuy6BSTOZrG9v6WnNflt5
	CoiS71ea3b7fKLiIDmWKXb3p1lh7jX+RjP2sd6l36iRMJVG9IbFvaAmmUxMXJ3loXn1Jc95hRr0QM
	85+kpH33Z8K5iL4415/zw6Madj06kvIYVENenJ3IgDU8z1HWR51VHWFmLDqZkEvSDHWxdLjiL63Te
	60SOlgxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW7vQ-0000000E5ob-0Fcb;
	Fri, 10 Jan 2025 05:51:16 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW7kU-0000000E3IW-0xXg;
	Fri, 10 Jan 2025 05:40:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 893E0A41606;
	Fri, 10 Jan 2025 05:38:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 46C31C4AF14;
	Fri, 10 Jan 2025 05:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736487596;
	bh=lYfgcjnWVOh9r2jS7pg1xoSiuLI+3fr2N40FQHTJ5kw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=iisBkp/VqFpmIaAvYpfAIyJRV4lcFO1MDO/NYjenSJZ1F256eumL//D42lz1Agzrc
	 Y0qnply6qboYXDt/JLMXZgBQ4c1N6fTJp4jwwvb3T7bnRzHJ7Q0ycWjv51QPVMk80s
	 OV6SREHPUMs4b5ITcGvdAQXvlSMna062G0vriOomfsm9LZbxHq2PNi3i1baXAKGyBM
	 PakvEFuYCQVrR7uokGP50M6X67/AM5PD18OWZuJSfhGhg3iW36+KrpfInLcz85vl6G
	 RF6JIqBRVLu83OGvgkUtuSKmNPkKGOH2I2+PCj1CvsGiXgSzol0I9MXqtGvzA1RKtQ
	 pJKO5b7Z6oxnw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C217E7719C;
	Fri, 10 Jan 2025 05:39:56 +0000 (UTC)
From: Ao Xu via B4 Relay <devnull+ao.xu.amlogic.com@kernel.org>
Date: Fri, 10 Jan 2025 13:40:00 +0800
Subject: [PATCH 10/11] drm: meson: add CVBS support for S4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-drm-s4-v1-10-cbc2d5edaae8@amlogic.com>
References: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
In-Reply-To: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Ao Xu <ao.xu@amlogic.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736487593; l=1984;
 i=ao.xu@amlogic.com; s=20250103; h=from:subject:message-id;
 bh=ksJtH4UxnpEi7M4UkQGZERM6UKX2oS80vckfy1Q9IKE=;
 b=rmzddFL21GrVnJWT/GWsDudRTQRE6oO9H55qODD4VTAuFAr4RaVDt8+uZUOTfYRY7VK/OYwY3
 PrV0mS4uywOBSA/hF0LAwYxgqPPvR4uPeVjWkxv68lOF7sP4Wa38bCT
X-Developer-Key: i=ao.xu@amlogic.com; a=ed25519;
 pk=c0TSXrwQuL4EhPVf3lJ676U27ax2yfFTqmRoseP/fA8=
X-Endpoint-Received: by B4 Relay for ao.xu@amlogic.com/20250103 with
 auth_id=308
X-Original-From: Ao Xu <ao.xu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_213958_395634_7E1F80FD 
X-CRM114-Status: GOOD (  10.61  )
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
Reply-To: ao.xu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ao Xu <ao.xu@amlogic.com>

Add support for Composite Video Baseband Signal (CVBS)
in the Meson encoder driver for the Amlogic S4 SoC.

Signed-off-by: Ao Xu <ao.xu@amlogic.com>
---
 drivers/gpu/drm/meson/meson_encoder_cvbs.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.c b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
index d1191de855d910f9845bf2d5aef336e391982ba2..45ed800173c1754b23fdc8b53e9487530bcae5a3 100644
--- a/drivers/gpu/drm/meson/meson_encoder_cvbs.c
+++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
@@ -30,6 +30,10 @@
 #define HHI_VDAC_CNTL1		0x2F8 /* 0xbe offset in data sheet */
 #define HHI_VDAC_CNTL1_G12A	0x2F0 /* 0xbe offset in data sheet */
 
+/* ANA VDAC Registers */
+#define ANACTRL_VDAC_CTRL0	0x2c0 /* 0xb0 offset in data sheet */
+#define ANACTRL_VDAC_CTRL1	0x2c4 /* 0xb1 offset in data sheet */
+
 struct meson_encoder_cvbs {
 	struct drm_encoder	encoder;
 	struct drm_bridge	bridge;
@@ -187,6 +191,9 @@ static void meson_encoder_cvbs_atomic_enable(struct drm_bridge *bridge,
 	} else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)) {
 		regmap_write(priv->hhi, HHI_VDAC_CNTL0_G12A, 0x906001);
 		regmap_write(priv->hhi, HHI_VDAC_CNTL1_G12A, 0);
+	} else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_S4)) {
+		regmap_write(priv->hhi, ANACTRL_VDAC_CTRL0, 0x406802);
+		regmap_write(priv->hhi, ANACTRL_VDAC_CTRL1, 0xc4);
 	}
 }
 
@@ -201,6 +208,9 @@ static void meson_encoder_cvbs_atomic_disable(struct drm_bridge *bridge,
 	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)) {
 		regmap_write(priv->hhi, HHI_VDAC_CNTL0_G12A, 0);
 		regmap_write(priv->hhi, HHI_VDAC_CNTL1_G12A, 0);
+	} else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_S4)) {
+		regmap_write(priv->hhi, ANACTRL_VDAC_CTRL0, 0);
+		regmap_write(priv->hhi, ANACTRL_VDAC_CTRL1, 0);
 	} else {
 		regmap_write(priv->hhi, HHI_VDAC_CNTL0, 0);
 		regmap_write(priv->hhi, HHI_VDAC_CNTL1, 8);

-- 
2.43.0



