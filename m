Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 464BDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 23:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wh49f0xnm+dnPD93gRdPCbAkw8035G3HYldXfLYaT44=; b=VLuURL9Ms9MDKJgCEKhVT+4Gwt
	G8+qBd/6tNstpFsBrSNXoSWtQTnKrtd8xBAzWgW1VNUjcoRz5JRiZCumrmpVVgThKW5OM+522ES6J
	DQyU0uhJrQWKX2BDczBX2/w2mLCnKYv046Ud507zJ2ry2Hatxja+GmzsvFylss4tiMGV182R77fwM
	w67VnNj638K7IL0Zuh4VNkpKYNJ2zdfMNLeLAY+BguXXCm6u6DGWUdQ5jCJ6bdKrynTxUt43bjKoi
	oWUcdlzQekpg96zGaOtVFphj4pwxAwq0RzvBt4zroV2iR2N2LDwqO+KVLj4MRuj7YmwL0J7w4E62/
	82tCXdTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf4TO-00000003AB1-1mfr;
	Wed, 01 Jul 2026 23:36:06 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf4TF-000000039mQ-1YPr;
	Wed, 01 Jul 2026 23:36:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782948949;
	bh=+YRPJyI1V8oNPkbxLLhcwim5gCsEu0UcFX5g+tdQNU8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QDh2xTKbPq/rwzI4ArqPloCgjYsrSvdcAJThPpyAfQLHAd9R3Y8jv9+1gLjYoq7us
	 l+we5j9dUTx26du/MS+7Rjqah8FCw8YEMNgAkbXeu0EY9+gZ/IUUSiFvz0+npu/Yzt
	 aCxiMnGLt6MpFD3HeXxsYEEbQKao4DvtVDhTlDZWOgHOW8dkEVY/qjVpkGtwX+TdOS
	 dw19hmNL3ZZsuJBK+C+v0NbJBcpMQyBhdkVDlJn9wFAFFGg1DDENi53mydJXJztwgq
	 DxDRhGtE1TRPWS928xpOq1tvIraZgehjeAzOCVbnh+JPwg7PloFQpBuQZc7FVEQaHb
	 hyDJ6lgj6kXyw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6B55417E15A5;
	Thu,  2 Jul 2026 01:35:49 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id B9A3A48003D; Thu, 02 Jul 2026 01:35:48 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 02 Jul 2026 01:35:47 +0200
Subject: [PATCH v9 09/38] phy: rockchip: usbdp: Amend SSC modulation
 deviation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-rockchip-usbdp-cleanup-v9-9-e31efbb62d2e@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1765;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=hEuJtDizS20fyTE+j+LEHbrRcnH32J1MUDI597yISUc=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpFpFOfqEVg3dFDtpeVCKDLjpfuZWiJ9ZEiW
 SH0E15gBWfF44kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqRaRTAAoJENju1/PI
 O/qa4Z0P/jAOopK3jHpNLZwR6v954tyqH0evvyHHdyCjZbKq6lzYEukQUexNux120mXZ3EpWCwP
 DDbKZCgJmfvtMgazW1VPo3PunKo3PfuivbDGPrQG7bnnY3JC9GFvfX1xdlNU/YllFJWNxtiVPs6
 ei9ZqkQI7Gqyqazm8Es3fm/ptDQtkRomFhQ+/lQtfdc3FVlX3HhCmezL1Vjx0nP1lyHnurfToe9
 Y02hyunPII3TTciS7fFXDMWhavnPmKS676kQmxs0D9G5XRbTjubGx0SeBGTVl5U96N0f+yijknp
 hDILpdQO/NHZyVe/oa9CRfdXjTPU+SwvXJsYP7BrrvBvK4tT4rC7h1M7AKWYhsEy2M12GD2b+PK
 tbHo8cnv5/yrvxj1HtLmzUgkt54OZIEilDuHtMijO2G+NDxKE23q8+QhxZ+AwExTQ8jPhNqHT7F
 6NVfCs8nm5s0JiBsAb4uKRqx+G4KnxqfG8TVh74Jz64RNsRtk5UyvO+A6T74RJRW7wu1Z7VCvGK
 BO2OXUWVMsdj3Sj5kP2HJOjqlFkHd13wOHhqEf6G5ij/4dSx70Sqr0ee3B4JcKkmbHXr2+6Uibg
 h72OPnFGdj91Y7skXGlB8xmO3r7EydZ7koENWV8uRX5jHqCu6ETR6BfpoFDKp7r7iJSy6JsrlIu
 5v/v44tCd51/XF0l6sFU5yA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_163557_613782_67ABD7E8 
X-CRM114-Status: GOOD (  10.79  )
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

From: Frank Wang <frank.wang@rock-chips.com>

Move SSC modulation deviation into private config of clock

 - 24M: 0x00d4[5:0] = 0x30
 - 26M: 0x00d4[5:0] = 0x33

Signed-off-by: Frank Wang <frank.wang@rock-chips.com>
[Taken over from rockchip's kernel tree; register 0x00d4 is not
described in the TRM]
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 2b27fd1c15d8..923279ed7d77 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -350,7 +350,8 @@ static const struct reg_sequence rk_udphy_24m_refclk_cfg[] = {
 	{0x0a64, 0xa8}, {0x1a3c, 0xd0},
 	{0x1a44, 0xd0}, {0x1a48, 0x01},
 	{0x1a4c, 0x0d}, {0x1a54, 0xe0},
-	{0x1a5c, 0xe0}, {0x1a64, 0xa8}
+	{0x1a5c, 0xe0}, {0x1a64, 0xa8},
+	{0x00d4, 0x30}
 };
 
 static const struct reg_sequence rk_udphy_26m_refclk_cfg[] = {
@@ -377,7 +378,7 @@ static const struct reg_sequence rk_udphy_26m_refclk_cfg[] = {
 	{0x0c30, 0x0e}, {0x0c48, 0x06},
 	{0x1c30, 0x0e}, {0x1c48, 0x06},
 	{0x028c, 0x18}, {0x0af0, 0x00},
-	{0x1af0, 0x00}
+	{0x1af0, 0x00}, {0x00d4, 0x33}
 };
 
 static const struct reg_sequence rk_udphy_init_sequence[] = {
@@ -412,8 +413,7 @@ static const struct reg_sequence rk_udphy_init_sequence[] = {
 	{0x0070, 0x7d}, {0x0074, 0x68},
 	{0x0af4, 0x1a}, {0x1af4, 0x1a},
 	{0x0440, 0x3f}, {0x10d4, 0x08},
-	{0x20d4, 0x08}, {0x00d4, 0x30},
-	{0x0024, 0x6e},
+	{0x20d4, 0x08}, {0x0024, 0x6e}
 };
 
 static inline int rk_udphy_grfreg_write(struct regmap *base,

-- 
2.53.0


