Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61FCCCA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 13:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GFs/yrlv3BxwsD3hFdvMm9SwNXFqtO7aFYTEcCrbHJw=; b=mOJoZ3XOM/p70bcG1de6w+1IPF
	PenbksL2I630Afmf4e1meJEjCmKamfL8z5lDYhkM//a8wZBp+YwHNE/zamoe2u4y3X6+tjLxWW6oF
	fuLkI1AbQQcreRoLN1aytApKrRihyQr2tkUXoXrgPXEHchV02SnL16XLHYflQMwkJ8jgYCk7CwgBl
	+s/EpmAQ7yn0qCk7a26VRuvoNiB6qG/d9hoCDcRFN+/ladVKd82GVnqGOqnZi6Tpp+Thm61ISHFnl
	6DiZvyMHB1I7ZJQu2aCMELjNBTEbJ3ZQ3cpGYwGIJYufkg+Q1cYlLuuvvDJalsnkCkoHElz8CXPJ0
	ZRpA5MSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4Fi-00000009gfj-1Ckt;
	Fri, 12 Sep 2025 13:55:50 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4Fg-00000009gek-2dJZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 13:55:49 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-b04ba58a84fso268754066b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 06:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757685347; x=1758290147; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GFs/yrlv3BxwsD3hFdvMm9SwNXFqtO7aFYTEcCrbHJw=;
        b=XjdpmQscEuq0NPQpyP619jRSnx0bqTfW2nk2m1RHKg60AWko2U749YMRg/FILMbgY3
         mFisSxIjSNd1yVcO1nn2hu1U8jlcH6Cwbz2zznkSbGrPBs/K50LollG2GIGAXlJgMER8
         uhBtkigBmA+Y2XaekDtDNkLUsFGp9Lto3glJsX5wyKqMJ0iWw8rxxmpkYY0P0h5EO8B2
         FsOpz76X87OM9p4fpuOydcFLGwPh1d6MJ8onFrXzhJcZRV2DsOAgZZ1Q5HcuEcp9Iqpy
         BR4tmPObh7/ybxYDUn0Ik3SN7U9CcJFOYVfheCvxcr7m3lxnwgyXOhd1epiSlwXa12zm
         ZMFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757685347; x=1758290147;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GFs/yrlv3BxwsD3hFdvMm9SwNXFqtO7aFYTEcCrbHJw=;
        b=KmUv1d1lzEiMRV6kT00oiLzrvZTSGPkEGqU98xSkVucRiPo2Dtt4HgoAKeq5lBA4Bp
         9+Xdqv4UScNzGbTD5Ci25grekfAxEZ7u2RlX6HymXZj1xo8ZbHHkYx4EG7ezr5ZXMW8k
         iYPclBCbTfdSycsPiX8SR9fdTLq4pgslqniwxDHUMN8n04ehhqquPChOJqVzfxdS3vRy
         tcWUIuK5VsY7udFqtiyxu+sORUlBSSpQXxlEk48lm/naPkM5fqNPgpZ2h3Yvxo8zJ/l6
         nIbeB2C59QWO5Dylhqch+acABoNCn5yKr1NQYWaRyoQNKpAq1YMAxbzEwSyBHEb8qmER
         3O4A==
X-Forwarded-Encrypted: i=1; AJvYcCXElrUBOnjXNqOzBl/sdozbMx1UiSZYtnDoup2rettBylKOmdidg9FRC0KOY7A+JtgjvHFtcEX2Yxuo616PQd4z@lists.infradead.org
X-Gm-Message-State: AOJu0YwkQgDlNYrMY2pU1WvGkbZ+hX6+p83tTJ1SQ/genw5z+PZ3muEP
	Je/eK34TBQTZFIEuWLmgBXDQH+Hl3/5XE1oROELUxQManNWVvzvtbuLI
X-Gm-Gg: ASbGncvzl9Yjsjj4mrGaROhuIVct7wPw3+Flmn9epRMTzh03BKw4OhL5cgcGP9wPxIH
	MLSJZYZRifFcNWv3fFmJZKepjx+hIqYVulzcthUNlybcONf+xVz9Nf3K4sSnBAJ7tyIxJw5ZQeu
	9PE/CEguXKLAbqWIHiotaaDM1ZHgWBY51Be5NYqgsgVXyRK0k3bxIzHBfQY/xk7p640AMXy9ySw
	cWscu43YGiWmd23RR7io3YyIegzWKwgzvwbBYFqOOqifmva95nnhH+h3sCRuCAicK3SI3VcYfzx
	zB0yXORkyoqcnMde4pMewrTXIZUgyc8TvlgVj9UHSsviwTJJ39Gv/5zaHxw4wFrzrCaOxBMQRKe
	VSez2Ixv63FCnAI04CdPZPbUrcJhrWoCsdDXkwuqndPj8/ys=
X-Google-Smtp-Source: AGHT+IEfWvgTrCzJfv8ZQfD+Jx15z+YEpVcjInjP1fcgF1fRUw7eW1Phf8azNXvHtBWqDEj6x+bNog==
X-Received: by 2002:a17:907:9627:b0:b04:4625:2372 with SMTP id a640c23a62f3a-b07c356ec97mr305733666b.15.1757685346656;
        Fri, 12 Sep 2025 06:55:46 -0700 (PDT)
Received: from HomePC (89-67-214-154.dynamic.play.pl. [89.67.214.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b31292aasm381628566b.44.2025.09.12.06.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 06:55:46 -0700 (PDT)
From: Andrey Leonchikov <andreil499@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	dsimic@manjaro.org,
	dmitry.osipenko@collabora.com,
	tglx@linutronix.de,
	amadeus@jmu.edu.cn
Cc: Andrey Leonchikov <andreil499@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: arm64: dts: rockchip: RK356x: Add OTP description.
Date: Fri, 12 Sep 2025 15:55:41 +0200
Message-ID: <20250912135542.2304150-1-andreil499@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_065548_686004_3B6CD26D 
X-CRM114-Status: UNSURE (   8.14  )
X-CRM114-Notice: Please train this message.
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

Add OTP mapping, can be used on future by drivers.
Contain a factory-programmed values for a various peripheral.
U-Boot already use "CPU-ID" OTP value ("otp_id" on this patch).
All values from original Rockchip sources tree on github.

Signed-off-by: Andrey Leonchikov <andreil499@gmail.com>

diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index fd2214b6fad4..74523efa8ecf 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
@@ -1057,6 +1057,111 @@ rng: rng@fe388000 {
 		status = "disabled";
 	};
 
+	otp_ns: otp@fe38c000 {
+		compatible = "rockchip,rk3568-otp";
+		reg = <0x00 0xfe38c000 0x00 0x4000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		clocks = <&cru CLK_OTPC_NS_USR>,
+			<&cru CLK_OTPC_NS_SBPI>,
+			<&cru PCLK_OTPC_NS>,
+			<&cru PCLK_OTPPHY>;
+		clock-names = "usr", "sbpi", "apb", "phy";
+		resets = <&cru SRST_OTPPHY>;
+		reset-names = "otp_phy";
+
+		cpu_code: cpu-code@2 {
+			reg = <0x02 0x02>;
+		};
+
+		specification_serial_number: specification-serial-number@7 {
+			reg = <0x07 0x01>;
+			bits = <0x00 0x05>;
+		};
+
+		otp_cpu_version: cpu-version@8 {
+			reg = <0x08 0x01>;
+			bits = <0x03 0x03>;
+		};
+
+		mbist_vmin: mbist-vmin@9 {
+			reg = <0x09 0x01>;
+			bits = <0x00 0x04>;
+		};
+
+		otp_id: id@a {
+			reg = <0x0a 0x10>;
+		};
+
+		cpu_leakage: cpu-leakage@1a {
+			reg = <0x1a 0x01>;
+		};
+
+		log_leakage: log-leakage@1b {
+			reg = <0x1b 0x01>;
+		};
+
+		npu_leakage: npu-leakage@1c {
+			reg = <0x1c 0x01>;
+		};
+
+		gpu_leakage: gpu-leakage@1d {
+			reg = <0x1d 0x01>;
+		};
+
+		core_pvtm: core-pvtm@2a {
+			reg = <0x2a 0x02>;
+		};
+
+		cpu_tsadc_trim_l: cpu-tsadc-trim-l@2e {
+			reg = <0x2e 0x01>;
+		};
+
+		cpu_tsadc_trim_h: cpu-tsadc-trim-h@2f {
+			reg = <0x2f 0x01>;
+			bits = <0x00 0x04>;
+		};
+
+		gpu_tsadc_trim_l: npu-tsadc-trim-l@30 {
+			reg = <0x30 0x01>;
+		};
+
+		gpu_tsadc_trim_h: npu-tsadc-trim-h@31 {
+			reg = <0x31 0x01>;
+			bits = <0x00 0x04>;
+		};
+
+		tsadc_trim_base_frac: tsadc-trim-base-frac@31 {
+			reg = <0x31 0x01>;
+			bits = <0x04 0x04>;
+		};
+
+		tsadc_trim_base: tsadc-trim-base@32 {
+			reg = <0x32 0x01>;
+		};
+
+		cpu_opp_info: cpu-opp-info@36 {
+			reg = <0x36 0x06>;
+		};
+
+		gpu_opp_info: gpu-opp-info@3c {
+			reg = <0x3c 0x06>;
+		};
+
+		npu_opp_info: npu-opp-info@42 {
+			reg = <0x42 0x06>;
+		};
+
+		dmc_opp_info: dmc-opp-info@48 {
+			reg = <0x48 0x06>;
+		};
+
+		remark_spec_serial_number: remark-spec-serial-number@56 {
+			reg = <0x56 1>;
+			bits = <0 5>;
+		};
+	};
+
 	i2s0_8ch: i2s@fe400000 {
 		compatible = "rockchip,rk3568-i2s-tdm";
 		reg = <0x0 0xfe400000 0x0 0x1000>;
-- 
2.51.0


