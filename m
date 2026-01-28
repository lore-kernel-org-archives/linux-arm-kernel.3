Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB897D35672
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 05:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sK4p8AbcNLvlqa+RZXsOEdBM7mQdQ2CRB4EPV5C/zSw=; b=1hsKp6h2pbpn2RX/+IaJjTENwY
	IMG4Nr1zi8tFxvKl7dO/90XZ3ffZtAi1wrNMkavRg+L23v7Xt0cStxkei/ooMM69qWz+2aQ3qW9lL
	vJ0o2d/0JrF+hml4izvRp8Kwew7F4Vu24z8MRHzlLyMXzGXU5ka7Kb9VNUwYRilNwlMzhFRmPxvnp
	ZhRgXd8rF8F0k1JH+gpATDZ6IP093dqtb+eVLrR7E/G+tILml7j2tueNt7nDIlmGaNRHuhWMxyxvz
	/xTsTR9KvaUEdaW+Y40QCAYX07Q+qlPS3s4EDZ0gvFMld1FjjhFJyT5zqBgOXiyRzrYlW6R9TgtGV
	k4TsuaDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkxkn-0000000FRud-3Euv;
	Wed, 28 Jan 2026 05:06:09 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkxkh-0000000FRti-3Bzl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 05:06:06 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2a0a95200e8so43784905ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 21:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769576763; x=1770181563; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sK4p8AbcNLvlqa+RZXsOEdBM7mQdQ2CRB4EPV5C/zSw=;
        b=WhDh9L38Fgb39tSXqoLGKC1Ya1CJDINI7sZ1Ku8aoiXheK7LPg0CBQg4mXQ4WOolwt
         ymggFVGD8nzi1fYOrxHiBiklvA3E0dlppU78zBO9t8Tat13FqP3pLvpEML7afkZOQtrK
         BGutYapgHlMwh6zip31B2dXYalDQeRisxspKSZGbXdDDn7LpgpLwICWOYijfoYT0UGET
         vtJmw6M3a1gOwfM9PmZladWIBd+i1PKwqgZk0Mm0WDwCLA0VMiWHAEFv0zilZrTk4/PF
         Dgth8zTfmHDY28m7MoXgJVZKqmVRTfGSMGrlkLMXgN7MhtSGJWhRiFLWurKzx0NmgMcf
         jRbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769576763; x=1770181563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sK4p8AbcNLvlqa+RZXsOEdBM7mQdQ2CRB4EPV5C/zSw=;
        b=hJgMbOCBnmfLLEtM+4myoV87mV9LP42R/gU3mle8XCqLb/h7fRiLTUWB0EP8Pn498F
         jqnwW0UnHq39AZEvV7NAUI7Ila15OoH+dj3GGZ2+RLzXi3BHOPc+ScRIJ2FdvSElAX9W
         9LfpWQHnK9N+sCPj0GxzRvTpRyfP9lez5XUd9sJ7Mi/uLlQQ7iLnK1tZwuD8tKdzJOXs
         gjpyYM4eW/qNd4BluSDER5/5xkqIMtPeKlQ6A/W+vZs6C32AwFP3e7AefLGTN7mawmpZ
         b/43wcijev2XVCl7rJLaKUvE7JyGsQxP30XG0ibqg/lqF9cPbeoiodeXT4FNoVO1ld3J
         amXw==
X-Forwarded-Encrypted: i=1; AJvYcCViWrQe8aE+sEr7fHz0c5iGCCP4I2m8OP+BY70LiK9QnacRhsxy83I99MsCUJH5p6gbCvcjLv6/Cle2W413XsR1@lists.infradead.org
X-Gm-Message-State: AOJu0Yzs5UQElPwK2+VE8O0Stno9O5IPgDFwC0zzlK36cO4PBlGlf5xE
	XWCnQraxE3XdsD5CAVGUuqsLzj/U0If3niePtuWVF4Qo/Hfgqx3SoEH2mSqPLg==
X-Gm-Gg: AZuq6aJ/npmLiR3NVV0Q9XtPMr9dHEj/c+gmK86yRpNYH+2SKAS8YK+XbKlYuyOJlvk
	5hAuNt0JZbc2EEUkKEiz4fGgALhpMzmU7uwTEx9SbS5Ze8yXBTXgKE9vzWS5oMfD1KqP4l2/Nud
	vyO1ZCagTZgnD7aVtuHerD0ICJzBBpdCeDqdvz//MCJJWmX9zHn/AMOY/syUZ1XDsCl7F6G5xKK
	BvIJwMSCE5TIT3uj2jvSR5c+VIpMs/cUu0uYi7pp6xvJnvwJyrHKfZH83nEB/GUBBvBP/PpsrnH
	y4WY2wuZfcpVd9urKOfdNOxYgmN9xKiHroWOzESvsMw0l1Jy4t+SarElpDqjvu/rOJoBgQdFOF9
	hIc5n3wSxBx9HWte53Tt3xXdllGNMV2DgWHTEPFsQRa//vOPgYkt3OsP+GNoR6X9YwNkTOGNNYM
	wzrjCxJA/AF7vJ2D33QJogKPTEaDcR8C6ARUvH2g8bDSmU6O0Y/IEN1Vw=
X-Received: by 2002:a17:902:e808:b0:295:24ab:fb06 with SMTP id d9443c01a7336-2a870d645ecmr37710295ad.22.1769576762557;
        Tue, 27 Jan 2026 21:06:02 -0800 (PST)
Received: from wig-Precision-3660.. (125-227-154-99.hinet-ip.hinet.net. [125.227.154.99])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b3ee952sm9736025ad.14.2026.01.27.21.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 21:06:02 -0800 (PST)
From: Wig Cheng <onlywig@gmail.com>
To: shawnguo@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	zaq14760@gmail.com,
	Wig Cheng <onlywig@gmail.com>
Subject: [PATCH v2 1/1] arm64: dts: freescale: add pixpaper display overlay for i.MX93 FRDM
Date: Wed, 28 Jan 2026 13:05:49 +0800
Message-ID: <20260128050549.3337279-2-onlywig@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128050549.3337279-1-onlywig@gmail.com>
References: <20260127025740.2601841-1-onlywig@gmail.com>
 <20260128050549.3337279-1-onlywig@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_210604_013701_FE8C9591 
X-CRM114-Status: GOOD (  13.30  )
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

Enable Open-EP Community pixpaper-213-c support on NXP i.MX93.

Signed-off-by: Wig Cheng <onlywig@gmail.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  4 ++
 .../freescale/imx93-11x11-frdm-pixpaper.dtso  | 51 +++++++++++++++++++
 2 files changed, 55 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index ce8f937c2315..c2727f8061e2 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -398,6 +398,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb-i3c.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-frdm.dtb
+
+imx93-11x11-frdm-pixpaper-dtbs += imx93-11x11-frdm.dtb imx93-11x11-frdm-pixpaper.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-frdm-pixpaper.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx93-14x14-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-bl-osm-s.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtso b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtso
new file mode 100644
index 000000000000..1111503b08af
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtso
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Overlay for Mayqueen (Open-EP Community) pixpaper display
+ * support on NXP FRDM i.MX 93 Development Board
+ *
+ * Copyright (C) 2026 Wig Cheng <onlywig@gmail.com>
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include "imx93-pinfunc.h"
+
+/dts-v1/;
+/plugin/;
+
+&iomuxc {
+	pinctrl_lpspi3: lpspi3grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO08__GPIO2_IO08		0x3fe /* SPI3 CE0 */
+			MX93_PAD_GPIO_IO09__LPSPI3_SIN		0x3fe /* SPI3 MISO */
+			MX93_PAD_GPIO_IO10__LPSPI3_SOUT		0x3fe /* SPI3 MOSI */
+			MX93_PAD_GPIO_IO11__LPSPI3_SCK		0x3fe /* SPI3 CLK */
+		>;
+	};
+
+	pinctrl_epd_ctrl: epdctrlgrp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO05__GPIO2_IO05		0x31e /* DC pin */
+			MX93_PAD_GPIO_IO06__GPIO2_IO06		0x31e /* RESET pin */
+			MX93_PAD_GPIO_IO26__GPIO2_IO26		0x31e /* BUSY pin */
+		>;
+	};
+};
+
+&lpspi3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpspi3>, <&pinctrl_epd_ctrl>;
+	cs-gpios = <&gpio2 8 GPIO_ACTIVE_LOW>;
+	fsl,spi-num-chipselects = <1>;
+	status = "okay";
+
+	display@0 {
+		compatible = "mayqueen,pixpaper";
+		reg = <0>;
+		spi-max-frequency = <5000000>;
+		reset-gpios = <&gpio2 6 GPIO_ACTIVE_HIGH>;
+		dc-gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>;
+		busy-gpios = <&gpio2 26 GPIO_ACTIVE_HIGH>;
+	};
+};
-- 
2.43.0


