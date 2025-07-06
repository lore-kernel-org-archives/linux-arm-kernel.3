Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EAB6C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 03:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=85nfx4ldL54wSVT5XtoQ/mvHVV77q6rK3dhp/Wa5E+U=; b=sMK+WIv7qin2/5LSRCjIcoScAF
	2LQOcY4bvzNLsVL2hweqqv2If0TR8tevEcxDad8DDs84X33pOM5j4DOLdumXMpUNid1dfdfV/kuON
	mpkbnSUz6b+tvkTG0JvF1YQ/DV7jEafwlSj87F3zpd26mx6ALHs+cX5VFN/QXV1B0XqGW2y9HG4sj
	t2PoJaFzapnK7/NkxOKhsHN2YyBCFgowgRs96XweHS/gJx3q1ghEWaHNO9rH2qou21m+4fnppgwq/
	EFQiyJKUG9g3pLbn4YJ4id/8CLQMIojUlQOsfdhFapGeunmNAQOB51ZRIDhQzR0oS8JLOgvtRYg4f
	BQ6/GCqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYFg1-0000000HIgq-1wZ5;
	Sun, 06 Jul 2025 03:04:25 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYFZN-0000000HI9b-2VCb
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 02:57:34 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-553d2eb03a0so3525005e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Jul 2025 19:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751770652; x=1752375452; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=85nfx4ldL54wSVT5XtoQ/mvHVV77q6rK3dhp/Wa5E+U=;
        b=QpjiF5qCBq75Qj1sqGrEyJh/nWZAz/NT75VBxOmltCd23Rh4/55+wL6SkBu3X0YZg/
         fOkBmIaEkZnKZgBSxtbf3CvMr2/82JElwlfjB1VrGh9A7qn2TTnbVRe/NFJvUZpSKUBR
         N8mLMuC9dPr5VT15/OyjHnJ/pCRljQHDcYV8Lrf9iUkXsd+mXqnRWnpm4ET2Fd2Yk/MP
         oQE/DjAugdBil1pz7dZcq/3uaYFRBfTchszNY5CGU03QBdEIKZHGjcOEoXSLShq/JEHD
         Y5snwzq3AtURWyD+v1OSKj7ZzWOB9uLPm2lur6b2Er5QaItzkmr681y683I8GxzG3e6a
         T/NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751770652; x=1752375452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=85nfx4ldL54wSVT5XtoQ/mvHVV77q6rK3dhp/Wa5E+U=;
        b=CaGNy1uUK9fp5mVIp7nvz2Fqypy2dHbE4c3QHis68iLg7g/XeFT2XV49TSP36oBI+B
         fzsEiKUqUdfpdmwPpt+VmPFqc+hZ2l7o2HfxHwR+9/4yizEZID7Ausu+4uQzpuYu/SUG
         jmd7RTOMm9PTSJHAIRzu0EsuAJZQHMR3ovv9sOCLmyWxEeuJiRvfSdx3HB/fxJpW6kif
         yqnxo+F5rHMZpPCrHAO+O5JqnNRkZVQ1CqYthVsCozOzWF7q2QRtX0IeRVavkxpw8KwA
         cbFsYWq1iRkpCIDrnCtmKvZSRrkfT2LUQXgwboe0jtEaRDzUPnTccDL6pUILoSeRNwj7
         hZOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqYkdaqa0EVtpkythlots23aMPcMR8pN1R9Q9V3YJX1dzG/q7tTU5XU4DBUDLHiEiDoP5yMEUnCZcDAYIxT74K@lists.infradead.org
X-Gm-Message-State: AOJu0YyUHDRdEZsdT9bFKvGytTeWciclJMtt4NxI/q8RuJrtBD3EwHVY
	1TYfmM+mD/kiBe2LEMPxlDir6FUHEbA6jzijN2SwEaNiC0NoxbI9Vuho
X-Gm-Gg: ASbGncuQP9BNXg89O87JV/fNBK/jZKtF9AwODV8jA83C7doHwZ72ycHoacP7EZFnerd
	V3Q98n1gNSlUe3/IdTKwIshsqDuNsyEGPsNcF9Rd7QhIaJhjyUzfjgugTrX0b6GN9GXtgKMGXCR
	5RDvloo+TvQs7k4cAwxfs+gj1QxLu5OCSC5ez1xGJFETpbcRxDs2Rau7B4J7scs/YngOcns1YmM
	NhapI88v0JI0+Rc0+HORZ0i8kZHmOe4OUtfV5hLJf8u9zKs0xd1XXFSqlJ+Mlm6Md4qNRahg4NX
	mlaEThmktMmIB76yorx3lbLpPGDpimR8L+q0Iw+tx5ZuHpSWB6TbLsUjFwExzItoTYqa4Z4=
X-Google-Smtp-Source: AGHT+IGN0Pll4L+siyWkYqepxKdXBDqJA09V3lw+p6WVOCV2OpsJJsEpsce/Z0TPbGFyafElS4Xm8g==
X-Received: by 2002:a05:6512:145b:10b0:553:2bdf:8b87 with SMTP id 2adb3069b0e04-55641a4f68amr1665035e87.10.1751770651927;
        Sat, 05 Jul 2025 19:57:31 -0700 (PDT)
Received: from localhost.localdomain ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384b7b4fsm788573e87.198.2025.07.05.19.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 19:57:31 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: allwinner: a523: enable Mali GPU for all boards
Date: Sun,  6 Jul 2025 10:56:23 +0800
Message-ID: <20250706025625.2707073-3-iuncuim@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250706025625.2707073-1-iuncuim@gmail.com>
References: <20250706025625.2707073-1-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_195733_636271_2F748F10 
X-CRM114-Status: GOOD (  12.23  )
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

From: Mikhail Kalashnikov <iuncuim@gmail.com>

All devices based on the A523/A527/H728/T527 processors contain a G57 MC1 GPU.

Enable the DT nodes for this GPU and specify a regulator that supplies power
to the SoC's VDD_GPU pins. The other parameters are set in the SoC dtsi,
so are board independent.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts   | 5 +++++
 arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts    | 5 +++++
 arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts   | 5 +++++
 arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts | 5 +++++
 4 files changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
index 8bc0f2c72..553ad774e 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
@@ -66,6 +66,11 @@ &gmac0 {
 	status = "okay";
 };
 
+&gpu {
+	mali-supply = <&reg_dcdc2>;
+	status = "okay";
+};
+
 &mdio0 {
 	ext_rgmii_phy: ethernet-phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
diff --git a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
index 59db10354..a96927fbd 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
@@ -54,6 +54,11 @@ &ehci1 {
 	status = "okay";
 };
 
+&gpu {
+	mali-supply = <&reg_dcdc2>;
+	status = "okay";
+};
+
 &mmc0 {
 	vmmc-supply = <&reg_vcc3v3>;
 	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PF6 */
diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
index 142177c1f..b9eeb6753 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
@@ -76,6 +76,11 @@ &gmac0 {
 	status = "okay";
 };
 
+&gpu {
+	mali-supply = <&reg_dcdc2>;
+	status = "okay";
+};
+
 &mdio0 {
 	ext_rgmii_phy: ethernet-phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
index 5f97505ec..d07bb9193 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
@@ -95,6 +95,11 @@ &ehci1 {
 	status = "okay";
 };
 
+&gpu {
+	mali-supply = <&reg_dcdc2>;
+	status = "okay";
+};
+
 &mmc0 {
 	vmmc-supply = <&reg_cldo3>;
 	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PF6 */
-- 
2.50.0


