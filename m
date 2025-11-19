Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B55CEE356
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 02:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7te6Ep/cieKtTTUKAy21pAvjYLQDivfQbFvTLZT+tAM=; b=b7ltK0mW+5pPUl4fAGKhsIntjp
	cr28CFvhWS7pYEnABLaheJITiDoL1quWxdJik6a4i8Am9zEpmd96PxgsSDCBNBLqJ/okBW6XeVvdg
	eKUqXzwtadmehDLt336NDqJxhKfhxUnDXd6qtXRkwVSX0cFbgrfS3DHOUn6jirEXgQFUfjyt/UDdi
	3I7/D+Svgn8+cKVxm1KlFKIdytLelc6Fb5WX5IdVVyPjHD+vW+jhw5eft7JWRuM1BSg8/A0uYJVyd
	PWp+L6FnfIC5zOFOFGfPnA/12o7/7/JiEsBIV/d4QwEzL8wc3BlzljysmSQU5Ta7FOVGJ+3CkegOs
	cnQtehOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLYJ3-00000001Pec-1x26;
	Wed, 19 Nov 2025 02:52:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLYJ1-00000001PdO-35GH;
	Wed, 19 Nov 2025 02:52:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C68DF601EF;
	Wed, 19 Nov 2025 02:52:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1D89CC2BCAF;
	Wed, 19 Nov 2025 02:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763520746;
	bh=ElCciTxYJE7L49qWv6JNOG3HGQMWHUYfQycN6MnNKKE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JuBDf3aexUMVaL+djrhneMCUZijivQpzYBV5Wyfb23ROoM9QzshWrAWcOLi8Pv/uH
	 WRe6F4i7yZgYSHSu2nOYaPpVAPKXKcOAk6z8nx31jpwl3RcnoSEMq+VAR1T6lPEHfT
	 u3xw2drfirBsCeMS5YxPOGkgUJySfdFUBuKNvV7SubdfjJc1163UFvfXoPilNypxBk
	 mq6SBLu58OZnRARJPx89k04HEGlIanC68SDh2dcRYTlf+2lb+yHZM3wzUyu7V455XO
	 V9PvvBsYHnTMEzYzHstzBgnjWSBw4tlUUDe43R41SQ1KnjZVyVQTqv0w5GKPblBcHt
	 68vN9hMVMg7sg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C11D2CEE356;
	Wed, 19 Nov 2025 02:52:25 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 19 Nov 2025 10:52:23 +0800
Subject: [PATCH v3 2/5] soc: amlogic: meson-gx-socinfo: add new SoCs id
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-soc-info-s6-s7-s7d-v3-2-1764c1995c04@amlogic.com>
References: <20251119-soc-info-s6-s7-s7d-v3-0-1764c1995c04@amlogic.com>
In-Reply-To: <20251119-soc-info-s6-s7-s7d-v3-0-1764c1995c04@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763520743; l=1131;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=2Mf1Qm+uRzCORwHeNC32iVQnPUYJm9R5423gGpFP26o=;
 b=LvDbdITIaIPRQ5mkhRzLzxcmSAM22ARk2rlCXtaPf8xd7zO3rkzZE2v55YVNg8hBIrfx1f6wJ
 HSErg+4k9FnDKMMhmDqVwaICHoPlWkm1hBxG5HYYDtT6/ZWlldZXryj
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add new definition for Amlogic SoCs, include S6, S7, S7D.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 drivers/soc/amlogic/meson-gx-socinfo.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/soc/amlogic/meson-gx-socinfo.c b/drivers/soc/amlogic/meson-gx-socinfo.c
index 7549f1644e5e..2a54ca43cd13 100644
--- a/drivers/soc/amlogic/meson-gx-socinfo.c
+++ b/drivers/soc/amlogic/meson-gx-socinfo.c
@@ -46,6 +46,9 @@ static const struct meson_gx_soc_id {
 	{ "A5", 0x3c },
 	{ "C3", 0x3d },
 	{ "A4", 0x40 },
+	{ "S7", 0x46 },
+	{ "S7D", 0x47 },
+	{ "S6", 0x48 },
 };
 
 static const struct meson_gx_package_id {
@@ -86,6 +89,9 @@ static const struct meson_gx_package_id {
 	{ "A311D2", 0x36, 0x1, 0xf },
 	{ "A113X2", 0x3c, 0x1, 0xf },
 	{ "A113L2", 0x40, 0x1, 0xf },
+	{ "S805X3", 0x46, 0x3, 0xf },
+	{ "S905X5M", 0x47, 0x1, 0xf },
+	{ "S905X5", 0x48, 0x1, 0xf },
 };
 
 static inline unsigned int socinfo_to_major(u32 socinfo)

-- 
2.37.1



