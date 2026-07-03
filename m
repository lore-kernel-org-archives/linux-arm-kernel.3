Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DD79C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 08:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1/Vk5h3C2/HoI+a/W5fGw2if/3IbStBgrfTZj/tnSBs=; b=DKLJfOVUSEfGDBGNgbclwyYLq6
	0l3grNmCFdZJXdJmZHcS4DCcNFMpRx+KdpCqfJbbp/IUkhOsP+jNrR69rqtz7qt2JY6lQmIRNCg/L
	PTA6ubrrgBANfOhVNl1LNRR6m5pWLXh5YrosK/Bgfl9bM0myswBsUFhgnY4juso9m9ASJJV82V0Ht
	pI40ntHhBKddWZcLWTksgkcdnmkRO0dx4lyARbWM0B1zbg4iG/YUhHGrQiZAebq0N+2QzsF+Mrq1I
	EfR6/pw83Cu1hfTi1sZ/IpLayfhFeQ3KLsCfvtIw7ZtKjtqgEjCfeOTjGfkUEVB1NxqSsgsaEx3dJ
	0ci2hNGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfZXJ-00000006O6f-42sQ;
	Fri, 03 Jul 2026 08:46:13 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfZXG-00000006O4Y-3rJv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 08:46:12 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4938d5f86f3so2342205e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 01:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783068368; x=1783673168; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1/Vk5h3C2/HoI+a/W5fGw2if/3IbStBgrfTZj/tnSBs=;
        b=isQ2chKHpWQ/oXYzJJmPjD9uwnayVTsMt38rdh0M+WT39ktXQgI+9yCVNZrcVafDC3
         Scf8pTrU91aaagHYlCO+87whqb6YTEaMRVM2fz/upMs0VoOTvwrSfPJbR1NIQ93MfdF8
         O5Ky3zwKlwNMwMrqyulu0Iy6KjiWV0pUs7dYnSu/1ZUMDkCdAC8GrScl09AFV0bh2RQg
         8QfcZRKCX9juTyVD6DrbtDbzq8bZslrGGxejq4OnwHBtP614TrPjvm0zeR2EogJJ2l/X
         xlBTIYMk9oxYFMk+hUdmIGLVhVBwmLT+WpUNFGqWHMOVm+JcKWLvDTqghBqHcICPFICR
         ZJxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068368; x=1783673168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1/Vk5h3C2/HoI+a/W5fGw2if/3IbStBgrfTZj/tnSBs=;
        b=jBTOpxFerjHvNuRmmZT7qyo4LnatZEMfcPXGLbU+c/vJFInv5OFbMVGq8UmzsAk2Oc
         02uevqvuJgu8sVjtgiIfSFEgeGMRJ15PGSQ6assx0wgcRujr7p/hJcFT+As78BL6+egG
         mfMF91oBqCGLGNFF1AZMJKxuJ0wSxrkWhCEed8RI+tNc67SSzcl7FOqzavEboIpepNNM
         +MIVDzT7RRIkV9oadGYiFQ0tMMf/7Cu/nSyBhm0Vu7G8D6xvNVZI7KMqwBSPnGHmb/jA
         mN+Isb5ySiV/968oOC6q1ZlYUFNrSbbyovA+cEC7gdKO0W4ln+dVLAQzv553H/sH4nOB
         KgcQ==
X-Forwarded-Encrypted: i=1; AFNElJ/rz1OiUKjMg1s1j0lUJ2T2znVcTwL7VgUHwKJAaSguWIQNncmU1XtxGATqzH5zoKnaflkbywgrk143fYztC8zZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzC/J5c71GllLSUHdSYC+/mhM1mcqWiFCSg6BMJ6KVPaJa/9S4/
	Fi+TsZWJCAW4BVZZ0LVboROKTzamZ9PsGivOkbe1SLO3U70f9QAjjgMY
X-Gm-Gg: AfdE7cmdHlR4xfslnmZ2f95H30rJs/1vA0k3LQ8khVbZHmMTNHleZWlyYzeH6V1EyDV
	dwa4xJWjeXhjtPAyRPCjwLSkX5tWcE1vdM5I6nT+x1hmzbUYsvZDAd3RSpWNcwuIBiZ8ovMaFza
	6t8/aAlKC9n/EanyQEpqdMXly6FiZCgn95beckdKeXjFsqlqyAaF7XL52gobARCF3xhBJ0l8FZZ
	bWTHputZZwlY0IuxuO6U6ioIlNJJFeG/be+63ayXutX6PVuYx5psYCmj18YajHidshq5Igbcw/L
	iD5fuGKtv/Xf4ZTd7Q9KCC1uSeVaCS4pRyTeX/TeyRWImp0Fl8pIqqd655BAC9Jow7OnoR6qah/
	VO8W+2qF5O7kCrVu+AurnZ6FeRF21EQ/+vssJePOVYz/VXmhzMFvG95ChTxxqmTzUmWDkKxsBNl
	oAjWKOKEJcGoga4lmfiS4J/LvZNp7iRlyz+VKj2v1gGNSup7Z9ZF9G2vZAiqnywrBGMRdmCsxNp
	wyLQklLvnDLeUJvp2b3WqCppg==
X-Received: by 2002:a05:600c:3f0b:b0:493:cbdc:7cd2 with SMTP id 5b1f17b1804b1-493cbdc80cemr21533515e9.3.1783068368277;
        Fri, 03 Jul 2026 01:46:08 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cfb6f199sm6335505e9.3.2026.07.03.01.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:46:07 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v1 01/15] arm64: dts: freescale: imx8mn-var-som: Move UART4 description to Symphony
Date: Fri,  3 Jul 2026 10:45:48 +0200
Message-ID: <3ddf65049a048dc4760df1e8ae5af4d3e91ca77f.1783067947.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783067947.git.stefano.r@variscite.com>
References: <cover.1783067947.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_014610_999424_0A57EB45 
X-CRM114-Status: GOOD (  12.95  )
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

The VAR-SOM-MX8MN module does not provide an onboard debug console.
UART4 is routed and exposed only on the Symphony carrier board, while
custom carrier designs may choose to expose a different UART.

Move the UART4 node from the SOM device tree to the
imx8mn-var-som-symphony.dts, keeping the SOM dtsi limited to hardware
present on the module itself.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx8mn-var-som-symphony.dts  | 18 ++++++++++++++++++
 .../boot/dts/freescale/imx8mn-var-som.dtsi     | 18 ------------------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
index 3434b189fa58..b07e71d3adee 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
@@ -15,6 +15,10 @@ / {
 	model = "Variscite VAR-SOM-MX8MN Symphony evaluation board";
 	compatible = "variscite,var-som-mx8mn-symphony", "variscite,var-som-mx8mn", "fsl,imx8mn";
 
+	chosen {
+		stdout-path = &uart4;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -171,6 +175,13 @@ &uart3 {
 	status = "okay";
 };
 
+/* Console */
+&uart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart4>;
+	status = "okay";
+};
+
 &usbotg1 {
 	dr_mode = "otg";
 	hnp-disable;
@@ -234,4 +245,11 @@ MX8MN_IOMUXC_UART3_RXD_UART3_DCE_RX	0x140
 			MX8MN_IOMUXC_UART3_TXD_UART3_DCE_TX	0x140
 		>;
 	};
+
+	pinctrl_uart4: uart4grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_UART4_RXD_UART4_DCE_RX	0x140
+			MX8MN_IOMUXC_UART4_TXD_UART4_DCE_TX	0x140
+		>;
+	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
index 38ef9e4fdf07..32f101ef2850 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
@@ -11,10 +11,6 @@ / {
 	model = "Variscite VAR-SOM-MX8MN module";
 	compatible = "variscite,var-som-mx8mn", "fsl,imx8mn";
 
-	chosen {
-		stdout-path = &uart4;
-	};
-
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0x0 0x40000000 0 0x40000000>;
@@ -274,13 +270,6 @@ &uart2 {
 	status = "okay";
 };
 
-/* Console */
-&uart4 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_uart4>;
-	status = "okay";
-};
-
 &usbotg1 {
 	dr_mode = "otg";
 	usb-role-switch;
@@ -432,13 +421,6 @@ MX8MN_IOMUXC_SAI3_RXD_UART2_DCE_RTS_B	0x140
 		>;
 	};
 
-	pinctrl_uart4: uart4grp {
-		fsl,pins = <
-			MX8MN_IOMUXC_UART4_RXD_UART4_DCE_RX	0x140
-			MX8MN_IOMUXC_UART4_TXD_UART4_DCE_TX	0x140
-		>;
-	};
-
 	pinctrl_usdhc1: usdhc1grp {
 		fsl,pins = <
 			MX8MN_IOMUXC_SD1_CLK_USDHC1_CLK		0x190
-- 
2.47.3


