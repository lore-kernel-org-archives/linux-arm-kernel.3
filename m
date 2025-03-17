Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B5FC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 11:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Yb1bmwpZfvOX6yMK1i3HHBS8ZlfwQU6J5gT+QGlyLNY=; b=Pfxnz7VlZD9kagMQhaW/N5k/89
	FYPgxGpWDcDv4QKpBGWMaW/bHmbvV0WY3B4bb+qZW75nZoTsTkCVWEd/j9KgQq/SoKq5iGkMmv9vi
	9xJErrEe6TmkH+xOjL2cvZ/nMCF+YXOYymmxSD17OAuYIFxdL40uSOgPUBeWMAoQbw6/wB88GEYyA
	ol97oic9g8H1l3cOKnlmyvJaE8PI3PAxrdeaIKCrOqmtqUTSD5gGDjmJOEqEMxhJWQhSOPzF/q5L1
	S1+dwwdn/4GEolT1VsGVfJjG2L8YI3nUaO2nV+DFSn3uwHcGjz58dEAHg2W/XbBXBvmPm7/qjQ2Eg
	DGfBPnnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu8Wb-00000002N9A-2OeA;
	Mon, 17 Mar 2025 11:20:53 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu8Uk-00000002Mrb-1eg8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 11:18:59 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5e78378051aso791871a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 04:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742210336; x=1742815136; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yb1bmwpZfvOX6yMK1i3HHBS8ZlfwQU6J5gT+QGlyLNY=;
        b=sPs5mB/gMx1B0yBRr5kNA9NzYdxiYJNyjI6eJUIn091WTLYKgDuYEiaO7TdGbGH0RR
         avANfHVD1h5YT06/o6jktHdF5I/oDSNEbdvrY4blzf3kgr0icuiYlyCm2nA9o5YxMupY
         OpYQ1JUWFC6oIFVmhRhDNk6IV+ZkkWrPaFiruzbmqThn18Kc4bH1uR01/7SxK7z355Nc
         DAOam+NeyOOqByz7CJPLuEYmidblj4kNK3dh2CI+wrQCGnnQbUjat0Km92Xk8SohlZQJ
         9fHzRRwy1Qjl+gREcVghvzzBui/CVR6liU0Nv8jCdwd7TJAh9TNB+jN1wcbIkrW8619a
         KGiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742210336; x=1742815136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yb1bmwpZfvOX6yMK1i3HHBS8ZlfwQU6J5gT+QGlyLNY=;
        b=fb3LIbHnNDGsfjNwmKq+pjz5GUwPMSLH1Oygh0OoYOEysVuc6oFi0lwHohUCNSDVaF
         dq22KjBZJr0BA5UFMFJ+i5CQgh4qHx7R4v9e8LmeXQfdUHA8CvKZCwaS3XCLOdnIRGa/
         +KO6Mn6Jg9XcchEhKVtl4McIAR3rcRXFNCNoLPAR6HbrYaeAy6WzPGC4BAtyDbCodMpf
         DhccUMQOxOMIipp/nyl+T4JqsJRYz4bzw4Klq1ZRQC0JfUOKGLv4fY+ROvfAAUQvm7Kc
         mgMu6YSiPVBHSk0kHnsbIFpIoI5xMPzeHaia+s/ah4FJwBqdn1EydBMFvJ8t7dR2FumY
         mfew==
X-Forwarded-Encrypted: i=1; AJvYcCXKeD3Li2dlmqq33Zd4ah9c5CWw8fnMrLUPXB24oOy6OgJJJd4ThUWAJcEwTQh39ucnk15jt6QC3CAeHoiMapQL@lists.infradead.org
X-Gm-Message-State: AOJu0YyQ/m0q7crhNXL9d+7Qq8CXDn2vszRJE8yYYauyNPZRq4RVZ0Ae
	GINZmTxe1FFBdGUHIW+S1hlsHcn1flf53fJErBAQcjGp00MBtfWoo6GCD5CrGnk=
X-Gm-Gg: ASbGncsnQle6lm2vd5AfgggxurCt3DEG1m9qmHOFNL8VkhFO6z+7qrhD0cFxemfIpAC
	Ll2fU4Ln13WcNpEmkfo0AOvFqz+Fo+pxd3bgcW/fjxrtA6/Hky3ah4U4O57j5hxib7QBFm9b0xN
	kZ2keYGibzT+FupEl2ZN/FvhGFggWC8ySxJHZLjeyBYq7vpUI0Ju1XXfuypZVDXG2RzBIoW7g6W
	Jevz2G971ECWRvWm8L7WKQN1VHW+87f5c3hpmSuqfhHsPN1jIgPL8DApjj2HsI3eiXw53k72xfH
	XQ4RORsk3pGD/YsMhVIk2v3UQsjlypAqLY+rSLeRjF3CoBJPU6/+9bM6ZA==
X-Google-Smtp-Source: AGHT+IGfG0kMUMy8OCD9zOa9XSNGd00YZZiW8tI8Vc7MTZK1U10MgZJVD9O1t41p31Vck9HevRFDYQ==
X-Received: by 2002:a05:6402:3592:b0:5e4:d192:86c5 with SMTP id 4fb4d7f45d1cf-5e8a10edf48mr4164494a12.9.1742210336553;
        Mon, 17 Mar 2025 04:18:56 -0700 (PDT)
Received: from krzk-bin.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e816973b87sm5851428a12.23.2025.03.17.04.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 04:18:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ARM: dts: nxp: Align NAND controller node name with bindings
Date: Mon, 17 Mar 2025 12:18:53 +0100
Message-ID: <20250317111853.43708-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_041858_434850_B15A9355 
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Bindings expect NAND controller device nodes to be named
"nand-controller".

Cc: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/nxp/imx/imx25.dtsi | 2 +-
 arch/arm/boot/dts/nxp/imx/imx35.dtsi | 2 +-
 arch/arm/boot/dts/nxp/imx/imx51.dtsi | 2 +-
 arch/arm/boot/dts/nxp/imx/imx53.dtsi | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx25.dtsi b/arch/arm/boot/dts/nxp/imx/imx25.dtsi
index 9cfff2151b7e..82601a4b7b4b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx25.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx25.dtsi
@@ -611,7 +611,7 @@ bus@80000000 {
 			reg = <0x80000000 0x3b002000>;
 			ranges;
 
-			nfc: nand@bb000000 {
+			nfc: nand-controller@bb000000 {
 				#address-cells = <1>;
 				#size-cells = <1>;
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx35.dtsi b/arch/arm/boot/dts/nxp/imx/imx35.dtsi
index 30beb39e0162..111d7c0331f5 100644
--- a/arch/arm/boot/dts/nxp/imx/imx35.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx35.dtsi
@@ -363,7 +363,7 @@ emi@80000000 { /* External Memory Interface */
 			reg = <0x80000000 0x40000000>;
 			ranges;
 
-			nfc: nand@bb000000 {
+			nfc: nand-controller@bb000000 {
 				#address-cells = <1>;
 				#size-cells = <1>;
 				compatible = "fsl,imx35-nand", "fsl,imx25-nand";
diff --git a/arch/arm/boot/dts/nxp/imx/imx51.dtsi b/arch/arm/boot/dts/nxp/imx/imx51.dtsi
index 8323e3a56a1f..f42903c9cf0d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx51.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx51.dtsi
@@ -595,7 +595,7 @@ weim: memory-controller@83fda000 {
 				status = "disabled";
 			};
 
-			nfc: nand@83fdb000 {
+			nfc: nand-controller@83fdb000 {
 				#address-cells = <1>;
 				#size-cells = <1>;
 				compatible = "fsl,imx51-nand";
diff --git a/arch/arm/boot/dts/nxp/imx/imx53.dtsi b/arch/arm/boot/dts/nxp/imx/imx53.dtsi
index faac7cc249d0..0c38c37dd142 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx53.dtsi
@@ -775,7 +775,7 @@ audmux: audmux@63fd0000 {
 				status = "disabled";
 			};
 
-			nfc: nand@63fdb000 {
+			nfc: nand-controller@63fdb000 {
 				compatible = "fsl,imx53-nand";
 				reg = <0x63fdb000 0x1000 0xf7ff0000 0x10000>;
 				interrupts = <8>;
-- 
2.43.0


