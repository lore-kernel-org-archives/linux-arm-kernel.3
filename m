Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F51C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 15:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PY79EKzRYcaTfBmkEn1plelmE3wgG6iSvl/aBwK6Y9E=; b=kEUxx5JDbMh3Xur67e2DK7aahk
	8s//yd4XFo0qSh1InecnT/0jWVq/Y3sVybtu3JzzqOQ4KtLx5tB8qYonbtu16IRbcDAybzJdd3wlx
	EMR9KblQ/H89dfo3qmgbIUiSWJTXUoh1CbnvhrdM/a4alg06tTMBQjYrbsu6pyfy1d8B/1bbBwIMG
	NLS1KWfCDCDGOKS7bNDpybpW9DUpDZKa8O6U8eyt8Fnjzj0uhswCCzCBKcWZfVh1InL3Mbj/NDi43
	9XB6H3E09oof9j9DjlGL2w4jVeAB2i/YVXVCpKdETJ3OYV7M5EAo3C21odQ8Izqm5Hc9pUT7jZtbd
	O6wtZ7oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVAd8-0000000F0Ru-11sb;
	Fri, 27 Jun 2025 15:04:42 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVA36-0000000Euik-0OM1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 14:27:29 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-60c5b7cae8bso3494613a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 07:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751034446; x=1751639246; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PY79EKzRYcaTfBmkEn1plelmE3wgG6iSvl/aBwK6Y9E=;
        b=N202Cl7doJEHqqf8vHlK78QH2O4mEEFI3BRa6HRXfRgpAp3xA3aQqhihDGYJ73uvBD
         3fYXQS9d1KoYJzlXtjq2ASwqZmCxBjMyGvbiU+x+Lz4G71jW+WvoEnQfeovm4MF4xdzf
         adPwRK8mE/K0vec09kts0e/27Man5uKX+uPzfJogjO1qKHmmDpSxeSmWzj5Ot+ZMcmh2
         7xxYI/OduOX+eClahTPzRqUZAtDxmBEggSex26Br/6sDPbzf726xxz6TqLgv5Y+zK9Mb
         ZaXuA+W8hKE15342Va8bpPrK4yJyZ55UzAGVaWiGlhKEOJL/vlgZRN5OZaRcHNwZZF43
         44pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751034446; x=1751639246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PY79EKzRYcaTfBmkEn1plelmE3wgG6iSvl/aBwK6Y9E=;
        b=MkVIJmq6nrYPSEoW6f8b1WS4c7DHyvNWXU0BXeC8bT4hLFXoHT2y9oNO2YYayuqBUa
         wroUN7b0hVH+jiPSYCoMuGgBXg84nRtI5Qg7FEYaFhYju1m3sBiC7sgJKNhPnJhwE7cd
         2JABC3aAX2TS86OTZJ2IW5XjYrsbHH2mQUqKgW3H3vLObQVSAPFv0xSNCpHMY0GgOc3g
         hZLZvtidPj4aHYxCuZQI+WFooXfB+yj3Yx4GlOe7U4jxZLNlXXJbhtpg+FwppyfMMwmq
         EvfsCYDfMlozZiOjjUpqt1/s/SrDUCFRXUOM/qbwcOQ4h6Qp8Pw1T5ojsEqTeRwCPzKJ
         GV3g==
X-Forwarded-Encrypted: i=1; AJvYcCV+T33RCmJsGPTgkCWri9iJDXVssLt1DdizEAfR9Pgt2MzJgTCaCHQuEy2oBfgTbl58PDpSXa7GxQnPLiGud+ap@lists.infradead.org
X-Gm-Message-State: AOJu0YyeNe6Qjr+l8q5M1f32oOLpvBI9rBBTlpKQagJkM5e5m55t8ymP
	Nf8SFVCR3HRGcS4XYXeXEKSADjCO9UAKxfx0pAlOUUwsEkcqDEziFVMC
X-Gm-Gg: ASbGnctcQi/pMv8LaKOMtCv9jB8DraLGM5bNTTbGMu+xlzks7nVRg0gmUml1xIXbSOp
	IGW6K+zMJpWVwI1n1fvVoxi5XjW9roDAmtVZIUvfuFQ6oQPeYEBJ7lsjrrBXZl3LT48byCOJxRK
	ZzBlmqLPQKHDiC6Je5zcSiT6M8dGbct+ZFGx2j3dVIcUMHQXGo7jv8eg4zVShXvcjRQQJv3YinH
	0h75Kbt8Ll41LDeIUJ/IQ+8ChR97FOIiaVaLIeEFPcVSDTG0Lh0MI9l7cYGZwe+sW4tIO6aGvpz
	HhlpJKuQujFyhBNz3kiayJ5wHtX5XbL93SANpMzQ861Bk9oKt7SVikJAoUiH0nQM40EfK7nKg3I
	+EagHf0jkFMyZ1CBiXFLC2kIarG0p6q2cnQ==
X-Google-Smtp-Source: AGHT+IFnOD06HjYEqKm1S8KuPS4M3Ez8CyJAs1iLSJ2WT8T4Kt7o/r+8yNxZapY+lwfOAyqb7QEm3A==
X-Received: by 2002:a17:907:961a:b0:ad8:9257:571c with SMTP id a640c23a62f3a-ae34fd6c852mr358792166b.20.1751034446217;
        Fri, 27 Jun 2025 07:27:26 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35e2dafcbsm98925366b.116.2025.06.27.07.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 07:27:25 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: dts: imx: add dts for the imx8ulp evk9 board
Date: Fri, 27 Jun 2025 10:26:45 -0400
Message-Id: <20250627142645.134256-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250627142645.134256-1-laurentiumihalcea111@gmail.com>
References: <20250627142645.134256-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_072728_131405_C852FEA6 
X-CRM114-Status: GOOD (  13.61  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add DTS for the i.MX8ULP EVK9 board.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  1 +
 .../boot/dts/freescale/imx8ulp-9x9-evk.dts    | 69 +++++++++++++++++++
 2 files changed, 70 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 4da7501ece17..4b288b324d38 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -322,6 +322,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek-pcie-ep.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqp-mba8xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqps-mb-smarc-2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8ulp-evk.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8ulp-9x9-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb.dtb
 
 imx93-9x9-qsb-i3c-dtbs += imx93-9x9-qsb.dtb imx93-9x9-qsb-i3c.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts
new file mode 100644
index 000000000000..5497e3d78136
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 NXP
+ */
+
+/dts-v1/;
+
+#include "imx8ulp-evk.dts"
+
+/ {
+	model = "NXP i.MX8ULP EVK9";
+	compatible = "fsl,imx8ulp-9x9-evk", "fsl,imx8ulp";
+};
+
+&btcpu {
+	sound-dai = <&sai6>;
+};
+
+&iomuxc1 {
+	pinctrl_sai6: sai6grp {
+		fsl,pins = <
+			MX8ULP_PAD_PTE10__I2S6_TX_BCLK  0x43
+			MX8ULP_PAD_PTE11__I2S6_TX_FS    0x43
+			MX8ULP_PAD_PTE14__I2S6_TXD2     0x43
+			MX8ULP_PAD_PTE6__I2S6_RXD0      0x43
+		>;
+	};
+};
+
+&pinctrl_enet {
+	fsl,pins = <
+		MX8ULP_PAD_PTF9__ENET0_MDC		0x43
+		MX8ULP_PAD_PTF8__ENET0_MDIO             0x43
+		MX8ULP_PAD_PTF5__ENET0_RXER             0x43
+		MX8ULP_PAD_PTF6__ENET0_CRS_DV           0x43
+		MX8ULP_PAD_PTF1__ENET0_RXD0             0x43
+		MX8ULP_PAD_PTF0__ENET0_RXD1             0x43
+		MX8ULP_PAD_PTF4__ENET0_TXEN             0x43
+		MX8ULP_PAD_PTF3__ENET0_TXD0             0x43
+		MX8ULP_PAD_PTF2__ENET0_TXD1             0x43
+		MX8ULP_PAD_PTF7__ENET0_REFCLK           0x43
+		MX8ULP_PAD_PTF10__ENET0_1588_CLKIN      0x43
+	>;
+};
+
+&pinctrl_usb1 {
+	fsl,pins = <
+		MX8ULP_PAD_PTE16__USB0_ID		0x10003
+		MX8ULP_PAD_PTE18__USB0_OC		0x10003
+	>;
+};
+
+&pinctrl_usb2 {
+	fsl,pins = <
+		MX8ULP_PAD_PTD23__USB1_ID		0x10003
+		MX8ULP_PAD_PTE20__USB1_OC		0x10003
+	>;
+};
+
+&sai6 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_sai6>;
+	pinctrl-1 = <&pinctrl_sai6>;
+	assigned-clocks = <&cgc1 IMX8ULP_CLK_SPLL3_PFD1_DIV1>, <&cgc2 IMX8ULP_CLK_SAI6_SEL>;
+	assigned-clock-parents = <0>, <&cgc1 IMX8ULP_CLK_SPLL3_PFD1_DIV1>;
+	assigned-clock-rates = <12288000>;
+	fsl,dataline = <1 0x01 0x04>;
+	status = "okay";
+};
-- 
2.34.1


