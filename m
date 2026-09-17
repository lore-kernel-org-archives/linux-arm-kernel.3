Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFDCCC982D9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 22:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p44TxhNKudxJKjuTHjYChz9yjXZoZjxwqz/JOTq8TSg=; b=rPMXDQLKC0PPvWLL1fV1rSzjJK
	Y+26P+QOLDs6YGTJd2wdfHwFtc23xvGSSnGrlxjjCJf6qLY/e7RrbpKv+3Ly3g+TKQJm0CkrCn9wS
	5AoxWSuQx9js3DU2fY+5UZUQX3MNeS0qxUZMnM6H5SPS9qIljmrPOKOOx63azzApYNCTQD+8QyRfQ
	lDSmi1wbyR7xu5db29HbLWsyMtgwCW/LTWPwbj+26SVhPE+CsPWCYJiXstFXLl3PdJdv6BVr+IgrN
	kJB4RXNVHVf3spZZ+5s5ixm7JdA2/jSiJtcPB7gid2nZxs7BL43f8j4Mxx3JeD3MO687ORE10hqNh
	Y7hFUr7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7KYT-0000000Ce4G-1Ikl;
	Thu, 17 Sep 2026 22:26:09 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7KYO-0000000Ce1t-2cvl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 22:26:05 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso1467055e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 15:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789683963; x=1790288763; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p44TxhNKudxJKjuTHjYChz9yjXZoZjxwqz/JOTq8TSg=;
        b=HMeTyX+BSH+6tBWnJeZvC/KNvq5p9c1gDEw1I//+8+YCT5mEZOsi1vYuAwRnwNiHLN
         u7GC2gSGbFKGfD9lJQaTy+Vad7HtWFS2Nwx0o/zPJWpntGSxxEY/VdHNwq8x9MGgM/C1
         IJM5cd4skciATYFWgZWALErRTBdAvEMdJ4l9GJeAzvYywyXuv9zGnuM6jBDXFe6coW1r
         Y/qIeAuIhxLeZYQBKBdSIXv2GPlULsTcHQagGECJStyMMvL+xvSV6jY8yYmXsKKvd0kc
         wPeBaXRfmZ7xZEDPB1cLUVSVB08oX3jprrGZ6Mn1BeIpR0j5+ggV6vo5lizyzRhLLbCw
         bP7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789683963; x=1790288763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p44TxhNKudxJKjuTHjYChz9yjXZoZjxwqz/JOTq8TSg=;
        b=QwKNz1daXATMFz7w1WqZQvkLGjUulHLMLMpHCVarMEEmYwow6mN6AZb8uoweI3Q6N3
         GRE5mkb4qQ+QmhGK+kk0Ah2O7yVj37U10e+/gRlbwuNMFnMCloWEa/7Yo5U+hfd0FgAB
         mW0xQxjjUIXblCmf33PZsVxo/wnJBWMiXzM+/dSmKuZ8cCf6mm8ZRY1dRq6w74LOKnz2
         SLRXj6aPHpiogSlfaxJsBAzZJAOVuashMMBIrFsVk3y5TQJcb5w4fugMP25Y7KuCKn1p
         4S96jGhVlzgWGEnCHkVpn7JTOIjpaiNC88s+uGdqXwjLoZL5BhhwvydFbKLmmlT1GQnp
         p4jA==
X-Forwarded-Encrypted: i=1; AKwUvBwALDmm6s1fNWMKvrsx4CeBafijZXGEXy8MHPYcYH7hmDJzgTADDc5UXOxKZFwynw9armVUvEIZVuxy2v4iXRoG@lists.infradead.org
X-Gm-Message-State: AFuF++mi9GeIzJvZdE9KmjXy2qAVzcqzlOvsubZRGgSxi2R1DmvbLrFc
	TNTwxIVrQ+AflEZf4Jg+mqguNBK2kwXE0iQ/RW86pnBm/OVjgmZhWDSL
X-Gm-Gg: AYBFou2iHCy3j0hBWgBhSaYZaN7LFLTbgSdGpQnUYvGtbWjZ0kllPBzSZlujAQ8B+rp
	wr3jcLxMhwH07OGIfRYKNJKsIMvM8+FLzwbHbPF/7gAvWYpVoTPvAqGHcnAHfVW+xuRQNs9S0D+
	Cc5BtTLxSSlO+SfXlBQ3bzKoXt/rEEjzSRV/SkTMHZAK2zhElS6Mt5pr585MpSN1G/tTf4BtJSM
	9GV/uHScK+m2qOnag6yp1E8zh4WtjqmUMXTzIIaOUkzvq7MFwA0QI/9QgWoMe4m2gYgKuYphY8b
	2ma76fPdF2GZdxJv1jgKkhvUkiNnSyA2a2VvA7RAIZdY4cjHq4mKUdVgK/zMmsWOh7Xij9dGqhr
	5AvTeKOZebEbWdZCvqGFPknyxBLF9KVQvbdd7vcVlnfjOTQ+a11rUI5DzXKWuedDQ9JZRm+HscW
	TtV4tnkv/Et+KMYbBff7MGfzns0ii/nT9Q2b+VY5ZUr1nv9Q9VEUnwE/ZIlqklF69pIjsfNlqni
	4rLWQzkj9qK/fZdvk7tof9tXPX/7J02mZz/JkucvMAy7JxvYsPS5vZd8P8ddk1bRveGiWSWoW6Z
	w5ciTnbqBXlqw07X4CY5YQ==
X-Received: by 2002:a05:600c:3b0a:b0:49f:bd3c:bc20 with SMTP id 5b1f17b1804b1-49fc573b7a2mr2953515e9.27.1789683962520;
        Thu, 17 Sep 2026 15:26:02 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc56aab7csm5583835e9.1.2026.09.17.15.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:26:02 -0700 (PDT)
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
	Fabio Estevam <festevam@gmail.com>,
	Nate Drude <nate.d@variscite.com>
Subject: [PATCH v3 2/3] arm64: dts: imx8mm-var-dart: add TPM support
Date: Fri, 18 Sep 2026 00:25:44 +0200
Message-ID: <4f550d729c32725e96884b4ee3d10afa908bb15f.1789683864.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789683864.git.stefano.r@variscite.com>
References: <cover.1789683864.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_152604_682883_FC00B1B5 
X-CRM114-Status: GOOD (  10.97  )
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

Add support for the TPM available on the Variscite DART-MX8M-MINI SOM.

Co-developed-by: Nate Drude <nate.d@variscite.com>
Signed-off-by: Nate Drude <nate.d@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - Fixed reset-gpio polarity

v1->v2:
 - Add tpm pinctrl
 - Add comment on tpm reset line

 .../boot/dts/freescale/imx8mm-var-dart.dtsi      | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
index c7a9eb23e5e8..cb7998616a87 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
@@ -138,6 +138,16 @@ &i2c1 {
 	sda-gpios = <&gpio5 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
+	st33ktpm2xi2c_som: tpm@2e {
+		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
+		reg = <0x2e>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_tpm_reset>;
+		label = "tpm";
+		/* active-low TPM reset line. */
+		reset-gpios = <&gpio4 31 GPIO_ACTIVE_LOW>;
+	};
+
 	pmic@4b {
 		compatible = "rohm,bd71847";
 		reg = <0x4b>;
@@ -452,6 +462,12 @@ MX8MM_IOMUXC_SAI3_MCLK_SAI3_MCLK		0xd6
 		>;
 	};
 
+	pinctrl_tpm_reset: tpm-resetgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SAI3_TXFS_GPIO4_IO31		0x19
+		>;
+	};
+
 	pinctrl_uart4: uart4grp {
 		fsl,pins = <
 			MX8MM_IOMUXC_ECSPI2_SCLK_UART4_DCE_RX		0x140
-- 
2.47.3


