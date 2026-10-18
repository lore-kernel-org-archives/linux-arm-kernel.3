Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BEE3CCF2D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 12:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=le/7ZMUGNW/GaIhf/O4ysG6KC+WhTS8gzrqG1Rpguic=; b=1619I47E1Fs/MjvsIWr9nDpeGi
	IcQT3q7m3LJfCsTi1DDMOq1ywZUPp2oIZPylwyvsWph+mDOcfXhbaNpImWrmK1airvPUhgdZ32pGC
	+2FjKz4hFgs+y7iJ29YeGs3cptmQ0uFtmdt1xmAeZ+TfBdOelQRrK0/bnJfYhSp0A1X9MTIQE3bG1
	nfNoKXns7fNBtGgh1ArztY9vmsKm85/TYA2sHgD+jB6soZlpEeb8001cKxUhVC6ytIf59sIiWevV9
	2CKQfCirf71lwPGHaPhLvsYPrpCZnjKnVc66wi4uedMOWuqK2x/Bs3DHvUhFZAZ+0/oTnSGVivrK5
	s/NxWTYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIQ4U-00000005qnp-1zWx;
	Sun, 18 Oct 2026 12:33:02 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIQ4L-00000005qgw-1PKe
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 12:32:54 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a1df146015so4861175e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 05:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792326771; x=1792931571; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=le/7ZMUGNW/GaIhf/O4ysG6KC+WhTS8gzrqG1Rpguic=;
        b=W/Y7zUaFWpokeY4HbTnbt/b8a3qZRN19q3+ZQkjlB7ZA1mllJmoS74cRehm1U/4fSk
         GCXzhLOgZEUQsrC5vV+Cuhlsky6yJPS/cbJ6q5XR75p9j7QCwN0RE1lKYkVy5LcqvoKh
         HpZEJNNVHUMEkALdp1QBP3xZaI3EDM4YZrq/EqUx+Qy9BlAmmfqLADrzFSsGkEKB/gP+
         50kABcdbMRTGoWjhrpeIUq1eHsXgs1K6n4Bgtd3Y/3sxSaQnvE6z5/4kFJBvnKBn5jSA
         HuTyvrznp9gZOSG8HbyU+ioQQXDDu7k5nZ7cpk/nXSJ7KAVBCYMfhm0MDiN18ZgBX6le
         NmTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792326771; x=1792931571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=le/7ZMUGNW/GaIhf/O4ysG6KC+WhTS8gzrqG1Rpguic=;
        b=uC83sR1N8UF7I7GF3enrTymMKsQXGE8crtFM9a82D97elin7bilBxRT8QWoMpnWX+c
         9lL3RYs+jWcqmBLchS7mBd4phuXJNpIoRM8xhCeBaAM9SUKRVOtYE/tEaNKqrmFx77Lv
         JQ4ggK1xIkvMxFkWjINxM5uVZ19+fdiWcE5Dl60vEQ0/3f1kLLuZoJxpVBi7CX1WhVTH
         v68May29ayraTZNHue7mwSx2PXXvN/z375l3ptIZHyXPUCRB+16H8/3rMgWHR0D1+3+M
         zY7IarNXi1+Jr8StHdtt9LdnrREnpWTMnD9xp0gxOQBXcDtoT5nnSBkFl02lyisKxCsE
         JTYQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQr5Bls2rTkP88OIiwtxy1KhGOomDSYPhrIHzrl5k6J12+yq/jVSEzFMgIu/vQmNILLcUM1DpTGyZ1fcRRbSgU@lists.infradead.org
X-Gm-Message-State: AFq9FYLxHlJ3t82MdQdOOCoZwoxq7XgzdsMvVvHLCjxbaBdG9Mt+soYv
	XQPK38qwdBSjbohZCGo88/I86jnE6Dray0eCeWkM3Sh71gC0WtLdabUW
X-Gm-Gg: AYBFou0CdhX/bQqESIJwxa22mWloTuHk4nTV11ws+W29+TaPYkjsjd55RWerZIBwZ0A
	SlOG0KiXeESVCpXY2pbupZjl0M5mtg7xzvCON9YyRHgfkFCaXngLpSEnsKMWfxxJlekooT/aZkl
	aEizTKgDPV6y2UcLjc/1ZspRHo1xKXUW3McXWW0DvcgQ41ZRwgYAzWtt4c5RjqaYcJ3OFp/4fQu
	iOA4sUYKtggdJ39kOHOYDczcFREEdXfgIl6E4LYhbct7EqGJE+oacl0EXFX7gEFep7zZeWzXj3z
	M4kehuHOjmzOCYmRS6CAGiXoovquXwCdBR2x+gghEeIs2S3KMOYRzsjJsuizRd81V1+XveoMB/q
	zT2GorRQ7DzvCGLJWthiRYh5kn1diDqEHLFw0VpZj15kVPQwcClWyK2eeeYMCC7YL2KCDMEQ1Ry
	iDj2CY9hFE4fjv000xTJvHFzwNiLJZB5lmY5bUW0t9q9bkAU5KcqO8Bc9SnX/xjtX8kxYuC5iW8
	SYlSuD/7JXwHjGQgBSae3IFw2u6fZ/R2Sz6BujeTjukvlaqhppML/kc5cle33l34HOqAioKNHIy
	HlP+KXEVQ1ioxUJlQu2yzg==
X-Received: by 2002:a05:600c:4e8a:b0:4a0:4a8:d444 with SMTP id 5b1f17b1804b1-4a1d7630cf8mr109051655e9.33.1792326771289;
        Sun, 18 Oct 2026 05:32:51 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ddde4esm245012535e9.12.2026.10.18.05.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 05:32:50 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 4/4] arm64: dts: imx93-var-som-symphony: Mark I2C recovery GPIOs as open drain
Date: Sun, 18 Oct 2026 14:32:27 +0200
Message-ID: <ec5fdbdf55d25cdcb756d16709a7011d5bbea9b4.1792326585.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1792326585.git.stefano.r@variscite.com>
References: <cover.1792326585.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_053253_405618_18AAC75B 
X-CRM114-Status: GOOD (  12.08  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Mark the SCL and SDA GPIOs used for LPI2C1 and LPI2C5 bus recovery
as open drain to match the I2C bus requirements.
This also avoids the warning emitted when the I2C core enforces
open-drain operation on SCL.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index 409c7e74ffe3..1f0954620195 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -210,8 +210,8 @@ &lpi2c1 {
 	pinctrl-0 = <&pinctrl_lpi2c1>;
 	pinctrl-1 = <&pinctrl_lpi2c1_gpio>;
 	pinctrl-2 = <&pinctrl_lpi2c1_gpio>;
-	scl-gpios = <&gpio1 0 GPIO_ACTIVE_HIGH>;
-	sda-gpios = <&gpio1 1 GPIO_ACTIVE_HIGH>;
+	scl-gpios = <&gpio1 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio1 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
 	pcal6408: gpio@21 {
@@ -265,8 +265,8 @@ &lpi2c5 {
 	pinctrl-0 = <&pinctrl_lpi2c5>;
 	pinctrl-1 = <&pinctrl_lpi2c5_gpio>;
 	pinctrl-2 = <&pinctrl_lpi2c5_gpio>;
-	scl-gpios = <&gpio2 23 GPIO_ACTIVE_HIGH>;
-	sda-gpios = <&gpio2 22 GPIO_ACTIVE_HIGH>;
+	scl-gpios = <&gpio2 23 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio2 22 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
 	pca9534: gpio@20 {
-- 
2.47.3


