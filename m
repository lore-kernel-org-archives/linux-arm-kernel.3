Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21DB4CD6E6B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 12:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cq/j8G3NT+tBoF6HRRNJiKlOu2gP9zRAiXpNDLBe0+E=; b=ByxMf6pe1rqEDd30xNyImRBIRs
	PWnqmvcbKbCNiRiBavvkiCL//X8jt14xyuosr84QbQAJAW0xTDV3iaBlowsz9XKk0Sb986wn5VOg/
	b6ck6sqGv/CQIubXjuisrj21NzieX2SAzTfWy0NnDkzDO2EEKJ0+4L2SRlHcbnnBn6ZtU3gcxp1k8
	OkecLBUi9mW/NALGT1Scu7ZMTguZMSMWJjHvqK72GOnYiaRLeFJSZGsgqfi6VNja5TydUNf/Mw/Rz
	a7LhMw+Wv+Cn225eZBT9X3WdAZplHfn6twVXY0eR0aGJmy7PsUQCMSWG9M6rITRgM5n7UT65jjFBl
	GXh8EJNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUkGY-0000000F0Mg-0oKW;
	Wed, 03 Jun 2026 12:00:10 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUkGV-0000000F0J8-1InX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 12:00:08 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-490b915ded5so4647065e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 05:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780488006; x=1781092806; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cq/j8G3NT+tBoF6HRRNJiKlOu2gP9zRAiXpNDLBe0+E=;
        b=AretNnOJcz4HgNqhSKTe1v9AEdNaElVLmIp25sInXU7cfs8/oz9XTLIm7fTTWsnPFJ
         0iP/aO8vllz0g2ZR3jLMnnPgVG8MDFeVHhnxvYRBKHgNiDdwwpDIMxSaHitI6ewylqjC
         r/ocKA+EAlZ8+jCi0EKh29IT0oPPPb4Yz2i18Y8+CtL9j7YViQw7Fk4jr3qxpdwiTwGU
         fdWeZoPWW5r7Ay9zMZQUguzo/1BJ1yEdgp89n/7K3mKRVkbe+rP4jirm6HNbPHUWPUXs
         18SgRNrwI8AFRAG5+FRHfL8q7U8C27mYzS/QbY9J7GD3IK59PYx+W5XvG5K3hRQyll8A
         y+Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780488006; x=1781092806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cq/j8G3NT+tBoF6HRRNJiKlOu2gP9zRAiXpNDLBe0+E=;
        b=EPT3fJiZJIK0tF2t22voJjmTqlCNz9xp4I7HsTcxD+IBaMmSXBD+hyz+IRQoeW8sT+
         2GF+LcwiqWeUFFbrwK8WqIblBp0TiUhpEgGu93Y+qXXnMzSun8kP84VBMV1JZjy+AMCA
         zDj7FOrzFfy6YX6ogjRwv3b7SG93LgaYWW7mvC0upYpjN4Eyneb7iUZpB+n/oJyxwxEr
         gTXoJoS3mQneJzJ7tL4XgU5sLEmIrXpf/6d02yh1DLWgDAj1gea/E9zVchZsuf9Q9PL6
         XZn/0wZIGOTy9/26nCo8/5aPKc+VWi2rqErK4knRzJfeDZ5H2L+63KctldEbnFvGFR/T
         CyGA==
X-Forwarded-Encrypted: i=1; AFNElJ8n64ClaoQK9rOPY8Fc9MpNm6+Z9rSNFpPsOweVa0Gxowl7+vXESggPTOJTyLT1eJ5J7M3T5EQf0N0UU8cfrl3L@lists.infradead.org
X-Gm-Message-State: AOJu0Yw20F0slvsjgEVieNf+qqcBjaiZ20QGSDGwR6u0/Z1B6MUrDK2X
	97TdTrNLhUzOV5MBzHRtgoiU+4DZjVAx3JviwYC6wwVlobF9egmyIBqQ
X-Gm-Gg: Acq92OFkrzOtkzzzD2fHBlga+OwcJYRJlgyajilUl0tdVl6eRNtMRNogvz92C9eBZrw
	0oTfCsmW0w/Coq4cRMYzx83orHKqrv0Nc0PQU6/Kq6Smfk9kUlbtIiHH/5cswEF9RzcBeJLtEiX
	/j0Pw+auwyDPCcaSWKs6SJchLam0Hm5q9tkENRdCN8rGTSDA2ecJiBLVnYlDhOA4hxHhiNdjXvf
	VJWvFPp5sjOGP3kUYH+hq7UCzEDYp34gLFiYugHSr1t7q1eG4Z1oWuRb8rNCQpo6WiGOiI6tksi
	VvwslwaGchIi+/9UQ1pDGEmENvW7o3KMil6JOXPZnPvwnaMXXcEk7oyCDkuC01eXk5PUIrnBh7M
	cmeqesAryPMbaxs3x601+aGtjRgS33x0/YGgSMPNDESSGBqu7SKkO7EYNuMao0RjbvRMYT173/7
	oGzLSXE3O4Gy7Jfg0PZKEAi9asT4EUOwNHOJlvDNAPMU274vw6fqqLW8cCzI9jgTB98FfM3vRg/
	6ZKHmYBYn3K7FoFWCN3WDiwGWGzsrO7fFFG3dHxdsDUE449
X-Received: by 2002:a05:600c:4e87:b0:490:7dfd:f7c2 with SMTP id 5b1f17b1804b1-490b5ecfe9amr53048185e9.11.1780488005304;
        Wed, 03 Jun 2026 05:00:05 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344762sm7771928f8f.23.2026.06.03.05.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:00:05 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 05/12] arm64: dts: imx8mp-var-som-symphony: enable header UARTs
Date: Wed,  3 Jun 2026 13:55:43 +0200
Message-ID: <0f72ccc0fa5d7a40539fc25a07bfc57f4308f5a9.1780487415.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780487415.git.stefano.r@variscite.com>
References: <cover.1780487415.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_050007_368771_958442F0 
X-CRM114-Status: GOOD (  11.53  )
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

Enable UART1 and UART4 on the Symphony carrier board and add the
corresponding pinctrl configurations.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx8mp-var-som-symphony.dts | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 8f8c76993fb5..3dda28be92f8 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -154,6 +154,13 @@ &snvs_rtc {
 	status = "disabled";
 };
 
+/* Header UART */
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart1>;
+	status = "okay";
+};
+
 /* Console */
 &uart2 {
 	pinctrl-names = "default";
@@ -161,6 +168,13 @@ &uart2 {
 	status = "okay";
 };
 
+/* Header UART */
+&uart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart4>;
+	status = "okay";
+};
+
 &usb3_0 {
 	status = "okay";
 };
@@ -261,6 +275,13 @@ MX8MP_IOMUXC_GPIO1_IO05__GPIO1_IO05				0x10
 		>;
 	};
 
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART1_RXD__UART1_DCE_RX				0x40
+			MX8MP_IOMUXC_UART1_TXD__UART1_DCE_TX				0x40
+		>;
+	};
+
 	pinctrl_uart2: uart2grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX                            0x40
@@ -268,6 +289,13 @@ MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX                            0x40
 		>;
 	};
 
+	pinctrl_uart4: uart4grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART4_RXD__UART4_DCE_RX				0x40
+			MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX				0x40
+		>;
+	};
+
 	pinctrl_usdhc2_gpio: usdhc2-gpiogrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_GPIO1_IO14__GPIO1_IO14                             0x1c4
-- 
2.47.3


