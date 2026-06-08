Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E4F5CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 10:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ojVwZhZ3EvYNAttKwQ19CCpX2VmMvoPJYfArtnRSCJY=; b=lvwU9OdwWX7qgQJEl8aahSJaZG
	M7YeHcOUsB+ZjtOzqL/uk1X0jBvvOJvwRpeP0TH93Hkwz7xfAUACdRBtVVve7yLswap0ahSo37fLD
	NLtr0ABK+mMj7RYQCSxlVcsTVPYWR+N5eKcZRBzCG7SMqRZF6fl+yejfSBxJTDyipR4taxIl1t0Zn
	OOT/9GrJ06IDxAH24bxyD8ag3ytGIzl41lE33Eb04+SK8VIegW1xutzRUDGlX6iUXvou5Zvgv6zR9
	FwrHE3CK/xFsGSR5oE4kfhh4LIvFHLI6gDPLiZEJTK7mw2/PZOWZgnSSYQ87eLDzbx+0XSEPgbywd
	nByDQoxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWvS-00000003Hbm-2Mjd;
	Mon, 08 Jun 2026 10:09:46 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWvN-00000003HX6-3QW3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 10:09:42 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-4600ddc4017so2985685f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 03:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780913380; x=1781518180; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ojVwZhZ3EvYNAttKwQ19CCpX2VmMvoPJYfArtnRSCJY=;
        b=rrG1mansrl5UWmf8uZSDLdMOLaGnPXAVqlIDAoQkKodGfsChN8lob1OgxLZbTEBxiT
         eGOozB75Z2UXpNM91a/o8nlzo1DkA9PpsPQfU0GXVK4gC0nI8df7TCk1An5ukoxB44EU
         hRJhaTooVa5h7JUn+ICndI3hP6wxwqZZwZ47iliE/ekTOGYHORO0rqDF4yQ2DIZPjIYG
         spm2pryyuylx2tIjOUwKcMMkmWQl0nrM+IS6RLR0A3xy2SKjbzGUpsbV24on62Jhm9Lo
         9/D0QIO+ibCQwfNpEOYFFAuzfHQ4QYpA2Se0vxddi/emYfKHL+EQ+iKxlLx8jfF1UR6P
         LwFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780913380; x=1781518180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ojVwZhZ3EvYNAttKwQ19CCpX2VmMvoPJYfArtnRSCJY=;
        b=I+biTIthi2xyhphL7IjvXNH+yBIMs8zwLILGsCZl5eUkbD78qr9Dq0OGcpZcRO7QJl
         dZaJJRzN+eePYiowRTHCKthXdm0zrlWPPCcCJicFFmLGEx5ebhoIcElmNNICKs3VfY0k
         QntsbrEaNsQc5B9g2i99AcIp/ro0UIfsA0u5mbOeI0npxxXhKydybNXs8aKn23D6ft1g
         I309j4bLzCkbR4u3FMAFa76fhKRNIytyv583Kxvyegq1aQTTY/BPMhDjze96m/oJIQY3
         DLpPifkQJPfxckWc/cg7Y1f4Q1sDn8SUHNBNKH8DkQnmIehLclNyY6wi1+TYzVmShugo
         DVwg==
X-Forwarded-Encrypted: i=1; AFNElJ+Bnthmgv9yt5heaTcj4Nx1IDropcGwU1uIU48isMpuUzWV23UBvzM/13ZIwx8VZhpZnBD++KH9BzPy6UIvqfdu@lists.infradead.org
X-Gm-Message-State: AOJu0Yxap2ij/e/eop9lwJiCDOkhqMYFhjvUqqJprL2nDLhAjfW1s1Bx
	A84N22Xw7PNWcYwN6QjDZBmDx672wnD1Lhpkr6UQEmZ/k7zmiJ0D1GLk4IAxLg==
X-Gm-Gg: Acq92OE85OUrWmy9DnAVpb4bQ987iF/VI8wHlcUgRFhLBuB3eUyQPcsWAoYXrJ5LJHG
	IwoXDd90ui7L7BXxqhPg93Ld3iI2cU43rmPe27Dq0FZT8Syn5WswS711uJABJ7ddjxRfSr3t/xw
	ZQxVMq9JwzEfvK6w4O5gtghFzTRtlOeG8sk9kRue3Jz5/Y3+gHlYUcC13Aw8FiDSdLlYRdgSoaw
	V7tGEaAtEwn/gpyOVFU2NOXo/R3FT9RoOEWrOf5xhxxhw7xs94ZEfowQ9+fMv07DQNulAxYnSsn
	iZzeuQfgTx1vMwkMwHOKLK7tk6iX7tWAVAwaap4ttNl3wLdRu81Nxurc6R1isRYHBJHhpCZy7iy
	Hhd8VsbZ3DvQrZAQd6JNp6Ntv2JZPX4ZH+nrsp4n1JdBmtVrAbkfoD/fLtHQq8HbCnoDKPGhRIy
	xL+/AiRCuNwtIuTkfkZn7kHMjQkxxNGw+FrNrlIiLmmaa8TJoxZOWiMmpb4Wk1jXLQsQJPJzeiJ
	Je9f/PsPurcO3EksIjcGw5ovtaVdeX7MBZJrlHbFbXTULVuuJhFbk+bFKk=
X-Received: by 2002:adf:eac1:0:b0:45e:ea65:d329 with SMTP id ffacd0b85a97d-460302dcbeemr15699680f8f.7.1780913379806;
        Mon, 08 Jun 2026 03:09:39 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4602cda3651sm39503219f8f.32.2026.06.08.03.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:09:39 -0700 (PDT)
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
Subject: [PATCH v4 03/14] arm64: dts: imx8mp-var-som-symphony: add TPM support
Date: Mon,  8 Jun 2026 12:09:21 +0200
Message-ID: <6e57585e7a493e688f235a1c9877d7e1d6640cbc.1780912893.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780912893.git.stefano.r@variscite.com>
References: <cover.1780912893.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_030941_877360_C603458E 
X-CRM114-Status: GOOD (  11.62  )
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

Add the ST33KTPM2XI2C TPM device on the Symphony carrier board.

Enable the I2C4 bus, add the PCAL6408 GPIO expander used by the TPM and
describe the TPM reset line.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 .../dts/freescale/imx8mp-var-som-symphony.dts | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 2b04c9027125..e9fcc491e5b2 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -116,6 +116,31 @@ typec_dr_sw: endpoint {
 	};
 };
 
+&i2c4 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "gpio", "sleep";
+	pinctrl-0 = <&pinctrl_i2c4>;
+	pinctrl-1 = <&pinctrl_i2c4_gpio>;
+	pinctrl-2 = <&pinctrl_i2c4_gpio>;
+	scl-gpios = <&gpio5 20 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 21 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+
+	pcal6408: gpio@21 {
+		compatible = "nxp,pcal6408";
+		reg = <0x21>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	st33ktpm2xi2c: tpm@2e {
+		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
+		reg = <0x2e>;
+		label = "tpm";
+		reset-gpios = <&pcal6408 4 GPIO_ACTIVE_LOW>;
+	};
+};
+
 &snvs_pwrkey {
 	status = "okay";
 };
@@ -201,6 +226,20 @@ MX8MP_IOMUXC_I2C3_SDA__GPIO5_IO19				0x1c2
 		>;
 	};
 
+	pinctrl_i2c4: i2c4grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C4_SCL__I2C4_SCL					0x400001c2
+			MX8MP_IOMUXC_I2C4_SDA__I2C4_SDA					0x400001c2
+		>;
+	};
+
+	pinctrl_i2c4_gpio: i2c4gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C4_SCL__GPIO5_IO20				0x1c2
+			MX8MP_IOMUXC_I2C4_SDA__GPIO5_IO21				0x1c2
+		>;
+	};
+
 	pinctrl_pca9534: pca9534grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_GPIO1_IO15__GPIO1_IO15                             0xc0
-- 
2.47.3


