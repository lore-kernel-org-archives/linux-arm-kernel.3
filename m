Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4632BCAC594
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Sep 2025 21:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oxWfkQz90C9L6MSNr2+XH/iEJ/4hSdL7W7krVSxEuE0=; b=mVKLmz4mvsA4+7AfwRmiGJdbwc
	glZ5z7ewiskx6DLBWMjDOXTfsnCTcYXaOj9doPOyTJSfNyy4FjzEGW/DZcFkM37Xci+8oVSeZClha
	W0qsXt/E44SFRtFCEVwQeICWjPMG/+4m250j2xe9jBqWLQEB3HNPqkSQN8lMlfoLHrSfObMs2oCb5
	Tq9g6+RWWnL1oJNITJVwv1v2n6UFajjA6hkoCD3EL4YylgNjGtkHcnyoJsyyU/Mcf16jxHNkOWeB1
	UMJ1q2SyRUQrbRG+GJUTRB9j2WuXmqjhOWkg+/nZQl4/SdZVWZW7Dpzn8hEqZ3M9ksY6C7/q6mzBH
	VU5FeLpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxXgd-0000000GJRi-1LbF;
	Sat, 13 Sep 2025 21:21:35 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxXga-0000000GJOu-39sG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Sep 2025 21:21:33 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-45dd513f4ecso18597365e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Sep 2025 14:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757798491; x=1758403291; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oxWfkQz90C9L6MSNr2+XH/iEJ/4hSdL7W7krVSxEuE0=;
        b=CqbxskMSRBFGK3P9/c/Sw1OzYqod8twp8lQHXX23fyM4CH3/8DWwQnBwmCnypA2znh
         z+H3zrE2py9Iif6tyrTp+9GJHEhLg2Yot8WCO2bYXx1h4130nD8FP9r10agxpy40PS/n
         ZrbHZuIzTzu5qofq6/pHnepCK6T6/yW9fYEiyIdIaG7fMUEa+TVzs0bYJ+U5Ef8Swrij
         uG626n4Ujp9ThIdGut/g1DKg9PZMs0n5OMR+lRLY8X7PI5+Lae5GXtZ99QwnKaCXz1y+
         vHJ3K0SStVNqm3MV7ZMDqW6m71FCkNilfJF5I6woZDBn9AyhmCnbM+zGdFm3FnludG34
         N4dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757798491; x=1758403291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oxWfkQz90C9L6MSNr2+XH/iEJ/4hSdL7W7krVSxEuE0=;
        b=Df5WvN+7ni6NBYIQUNqo6LB3/d8h77Ceu4m2Q+FzJy0OiDHejlHIuThP0thdrQRNZ/
         18SF3/8rwS5nq5fVYEkB74smNFB0l0frD5K2VOW5prxgFiU03Hu/jIF7Z4mdcMw2hvDF
         Lxbeos5szv0fUbVgCvcEULhWiiBKSGKO5zO8lX2D6wjUtkPxmtcEfPEtjwxzsU6XP1cy
         Pp2/dW8ZTsNd/WSol6NpjRgMRMWhr/BevR8vQyC9vw8MDW0vWETHOG5CAeldQXv4jWXS
         p9HSnakv60expAG+bTbHyV7yzfVNvscASpJ4EilyqvY+lxUDgnNB2Rdty0yV6kYT3S0/
         R9fg==
X-Forwarded-Encrypted: i=1; AJvYcCVDvgs2FfZF+NnhzQxeOZcRLaCTs02semj+mrYrB8+ymh0Fig4L+vmICR/oWBqwK2A3PfFvmLfSAV1E65pvjYN6@lists.infradead.org
X-Gm-Message-State: AOJu0YxoTUFbefIlww3z3sa6i75q9xN4FAcrJaRJ2f4fOZeJHPNhU6HM
	21uV2ItfbVlMyU0N69947sTLar2ZrKZKhLQ8vGdofRW+li/k7vExZunn
X-Gm-Gg: ASbGncs5wSdMwFQnslnepPoaqeCd4mZxjiuAhUvEf0vTAgUaZbFkAas4kOaJohbqECr
	l3TE5PgxiIAoOIxo/ioZbaIxiMwdCigxSGVdalxXaMkiX3ay8ZJN6bOsNStJLeNc3iYqvep8zx6
	Z1m+Ia1edxFBWthLIX6PnxfoaG9bmho5OAWhjuoU3DFmruUoE1Il1l/GjTPKXTwXZvhah/rLsFQ
	iEDOkrbdML6g7jZKm6y569dcS5o3lRfoKEv5NsY856lVqPwfHwd06C08ekm2LIZ5F/iNL7JjV+n
	VWhlTv6QuJDYOrrhpTQlcWM8USggR7N4rUhflD/3CLHR6VN1UlN/4llWhFOnOhSowRBX1OvFqDw
	ruANW6txL8tTQ5MSrdvT1Uae7NcMLS2TaKi2GP5XCFUJ7HzQnXfGc
X-Google-Smtp-Source: AGHT+IEs/fk+jCkMcX17PxuJzAl3BMnHRPZjZ8PBJFXUcfnuVJskMnNC5koV2QxLjtd7wZEjTRjvpQ==
X-Received: by 2002:a05:600c:45c5:b0:453:66f:b96e with SMTP id 5b1f17b1804b1-45f211ef88dmr66556345e9.11.1757798490854;
        Sat, 13 Sep 2025 14:21:30 -0700 (PDT)
Received: from Radijator.localdomain ([93.140.65.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607cd6absm11576842f8f.34.2025.09.13.14.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 14:21:30 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Date: Sat, 13 Sep 2025 23:21:05 +0200
Subject: [PATCH RESEND 3/9] arm64: dts: marvell: samsung,coreprimevelte:
 Enable eMMC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250913-pxa1908-dts-v1-3-8120cdc969b8@dujemihanovic.xyz>
References: <20250913-pxa1908-dts-v1-0-8120cdc969b8@dujemihanovic.xyz>
In-Reply-To: <20250913-pxa1908-dts-v1-0-8120cdc969b8@dujemihanovic.xyz>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Karel Balej <balejk@matfyz.cz>, David Wronek <david@mainlining.org>, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3698;
 i=duje@dujemihanovic.xyz; s=20240706; h=from:subject:message-id;
 bh=8/peqm48tCTiEczHfDYZk/YBJQovtzWt9KQ0JhK9ewc=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDBlHH/iXbxO44VcrF9qzRXLzgmz7d28d/yQ4fUguaD247
 amSxPXTHaUsDGJcDLJiiiy5/x2v8X4W2bo9e5kBzBxWJpAhDFycAjCR8B2MDPvn8IomPP5QfVl3
 86QD/VOXm555zJEWyxtWvVnu/v1z8v8YGT4wz157xuv64fv66QyrH351u68YtHFzhVT8g1maq78
 8O8oIAA==
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_142132_822284_CF615907 
X-CRM114-Status: GOOD (  10.82  )
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

From: Duje Mihanović <duje@dujemihanovic.xyz>

Commit a41fcca4b342 ("mmc: sdhci-pxav3: set NEED_RSP_BUSY capability")
fixed eMMC probing on this board. Enable the eMMC and add its pinctrl.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
 .../marvell/mmp/pxa1908-samsung-coreprimevelte.dts | 79 +++++++++++++++++++++-
 1 file changed, 77 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
index aa161982ca43844287d212e8a24884d2b8440fed..78b7bccfc5f299889d1b9a8fd2c08554f17eb147 100644
--- a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
+++ b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
@@ -292,6 +292,79 @@ sdh0_pins_2: sdh0-pins-2 {
 		pinctrl-single,input-schmitt-enable = <0x40 0 0x40 0x40>;
 		pinctrl-single,low-power-mode = <0x208 0x388>;
 	};
+
+	sdh2_pins_0: sdh2-pins-0 {
+		pinctrl-single,pins = <
+			0x24 1
+			0x28 1
+			0x2c 1
+			0x30 1
+			0x34 1
+			0x38 1
+			0x3c 1
+			0x40 1
+		>;
+		pinctrl-single,drive-strength = <0x1000 0x1800>;
+		pinctrl-single,bias-pullup = <0 0xc000 0 0xc000>;
+		pinctrl-single,bias-pulldown = <0 0xa000 0 0xa000>;
+		pinctrl-single,input-schmitt = <0 0x30>;
+		pinctrl-single,input-schmitt-enable = <0x40 0 0x40 0x40>;
+		pinctrl-single,low-power-mode = <0 0x388>;
+	};
+
+	sdh2_pins_1: sdh2-pins-1 {
+		pinctrl-single,pins = <0x64 1>;
+		pinctrl-single,drive-strength = <0x1000 0x1800>;
+		pinctrl-single,bias-pullup = <0 0xc000 0 0xc000>;
+		pinctrl-single,bias-pulldown = <0 0xa000 0 0xa000>;
+		pinctrl-single,input-schmitt = <0 0x30>;
+		pinctrl-single,input-schmitt-enable = <0x40 0 0x40 0x40>;
+		pinctrl-single,low-power-mode = <0x208 0x388>;
+	};
+
+	sdh2_pins_2: sdh2-pins-2 {
+		pinctrl-single,pins = <0x5c 1>;
+		pinctrl-single,bias-pullup = <0xc000 0xc000 0 0xc000>;
+		pinctrl-single,bias-pulldown = <0x8000 0xa000 0x8000 0xa000>;
+		pinctrl-single,low-power-mode = <0x288 0x388>;
+	};
+
+	sdh2_fast_pins_0: sdh2-fast-pins-0 {
+		pinctrl-single,pins = <
+			0x24 1
+			0x28 1
+			0x2c 1
+			0x30 1
+			0x34 1
+			0x38 1
+			0x3c 1
+			0x40 1
+		>;
+		pinctrl-single,drive-strength = <0x1800 0x1800>;
+		pinctrl-single,bias-pullup = <0 0xc000 0 0xc000>;
+		pinctrl-single,bias-pulldown = <0 0xa000 0 0xa000>;
+		pinctrl-single,input-schmitt = <0 0x30>;
+		pinctrl-single,input-schmitt-enable = <0x40 0 0x40 0x40>;
+		pinctrl-single,low-power-mode = <0 0x388>;
+	};
+
+	sdh2_fast_pins_1: sdh2-fast-pins-1 {
+		pinctrl-single,pins = <0x64 1>;
+		pinctrl-single,drive-strength = <0x1800 0x1800>;
+		pinctrl-single,bias-pullup = <0 0xc000 0 0xc000>;
+		pinctrl-single,bias-pulldown = <0 0xa000 0 0xa000>;
+		pinctrl-single,input-schmitt = <0 0x30>;
+		pinctrl-single,input-schmitt-enable = <0x40 0 0x40 0x40>;
+		pinctrl-single,low-power-mode = <0x208 0x388>;
+	};
+
+	sdh2_fast_pins_2: sdh2-fast-pins-2 {
+		pinctrl-single,pins = <0x5c 1>;
+		pinctrl-single,drive-strength = <0x1800 0x1800>;
+		pinctrl-single,bias-pullup = <0xc000 0xc000 0 0xc000>;
+		pinctrl-single,bias-pulldown = <0x8000 0xa000 0x8000 0xa000>;
+		pinctrl-single,low-power-mode = <0x288 0x388>;
+	};
 };
 
 &uart0 {
@@ -320,11 +393,13 @@ &usb {
 };
 
 &sdh2 {
-	/* Disabled for now because initialization fails with -ETIMEDOUT. */
-	status = "disabled";
+	pinctrl-names = "default", "state_uhs";
+	pinctrl-0 = <&sdh2_pins_0 &sdh2_pins_1 &sdh2_pins_2>;
+	pinctrl-1 = <&sdh2_fast_pins_0 &sdh2_fast_pins_1 &sdh2_fast_pins_2>;
 	bus-width = <8>;
 	non-removable;
 	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
 };
 
 &sdh0 {

-- 
2.51.0


