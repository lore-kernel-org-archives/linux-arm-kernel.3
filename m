Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA8ECC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 14:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=97dsq8shbijTwl1Kc6C9X7zbEyd2fSdds/39rteFriY=; b=siwJCE+k6itbITVJrhJ6QoyKQD
	2jrnMeqdRAkc9LA9GMEXTVZTKNvG/S2nuF4nPLmU1LgEv6ZSRIzx0adzCuCI9hNU6rYlJ+UvR+NXL
	xzlfhpxH33INqlODKb8oqVCeF4yWPukNtUjeWECNWroSerjJCREYMYbxVZYiXBlZOtSIzqAsrtbeV
	6/ofAlvtqH3yjir3tFW1HANYDP1yfk331rOYLnYbThDHf3IpyuCw7fWYSrFWvopBAHCI0j18hkQtd
	ZJpvTz4zFo9MQoRz2OaVe4OPHLxx+fA8AYlcDCt+lzmmqJKqgcALRSOHgbKNomWON6acNiikfdutY
	3p5yqgrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV9k8-0000000ErUt-2M6w;
	Fri, 27 Jun 2025 14:07:52 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV995-0000000EmP7-0VoA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 13:29:36 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-607b59b447bso3379927a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 06:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751030973; x=1751635773; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=97dsq8shbijTwl1Kc6C9X7zbEyd2fSdds/39rteFriY=;
        b=aStFPFf/V/z1bEty719PbVDUMbFE0J/KiPFUCPCuiT6mBdpHsp9wyBK41X/oVT1R2y
         886XNoC2EVs69FClbO5gzsfGE1xI3G7GrnAiLykUcD1oyOrK8DYxGt5J0qalI0PRW0bT
         /DS1IdQftPmjC8gZv2q+zjz6zPskbzB0bVhwhXdPlAWstUIDI5s5IY8WnuonjUJH7sL8
         biLJLgkSbH8QY+9OD/3giQjrhJapDpnuN+HFIAsqHvG+TyDSRxD2+LobWygemiUugDUM
         cr1rtkByfSnfPJ/Ox2tR3J/RJ//MaUiv9sHbD0V7RZ88nxHZ6gplizMgedXudUbsnml9
         S/mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751030973; x=1751635773;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=97dsq8shbijTwl1Kc6C9X7zbEyd2fSdds/39rteFriY=;
        b=XubFBCiCxoq8nqog9hboExH45RbLDXfIF3NWs67fRJPb7zzgL1I+J8UEE1+S8B/c30
         xhPVilgtN0eJFPcORBj7aih4Z+xeN9uSOu+ZHSIJxo/yaCMW5+W3QwxqHUTadXE2BdWS
         3UQqiGlKxy4Z+1PjRhKKCM9LsMTtxdHFb66nWqqbIf3DyHChygHbCl9GeHjPM/hP6IOm
         U1LvPn0mvSrarJ4ccTJnlj019zZ74K0z3rY2qCb+JwFPVAfzauJT9ys1STGHYyRoqVJH
         nokEYWPczTo+2uNL9vzL55ZDKyDgEOOTDfYwJfGUV6+6TL0J8FGiLsSki1y2CbiQEPMg
         Vnow==
X-Forwarded-Encrypted: i=1; AJvYcCUpOtVxbs7udxQFu2q/bCwprOE+YXppF80EndXTg2lCb2NuwTkx//esifM2W0OBcleSeWDjehIkRXViNelT8Nar@lists.infradead.org
X-Gm-Message-State: AOJu0YzSXrUajIeeoYPm1mEmA7ZQ2UC2Pklpfpc8xzXfNJOXMvydS4Kg
	j6sGGS0rafNFNNwc8X3CF4ze5J17Jtgne1X3zWWkCwcWGONoZ624TFZ9Z2pzihs8VO+6k6P5/FE
	mvwtNYEsRXQ==
X-Gm-Gg: ASbGncuGTIcioMM9RMzQGKSPJt6JylGVi4IvrFHuv9wM1pmdkVCNC6hbS47sgQTuzTK
	Sko38ntC2LFcxgGD4YrqpfvHAEjHz6i49F1w+UyL3mwj4ggtEPjiTcehmSnmMGdJZqUbU3jJdOK
	QOEQSBbYgYRfI7xMJnQiInB6xUUK+dMzGpL+G5T/iFIE3yesU96UF9v59/l8XwsGs4VO6zs/QE9
	16aeSfD91Wig3aYstARQM7ffB0YaUyVAFScHkdwH3LSEhqjThJ8Ts5KW4zX2iC/zBusO3YcdwLT
	Mg1dYds2Ah61pAcBAnOaDSzHp/XjNDkBXUbJ0lYpk+Z8wfW4p3wXqiVEDk5kofw/XHxaVMngm5J
	g/9LdlgNl01NzP3uZcw/Aqwt6CysMF558/Rl0x2FEfJxwnQ==
X-Google-Smtp-Source: AGHT+IGBgERbQ8JzXtKIK0Cr/Y2P+P8Vyd6f4ZzXNGWb2nY1h3VKwcv0VnVGjAGel1FVXEgEuaqQWw==
X-Received: by 2002:a05:6402:40cd:b0:607:ec35:eb8e with SMTP id 4fb4d7f45d1cf-60c88e72eaamr2655542a12.20.1751030973492;
        Fri, 27 Jun 2025 06:29:33 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c82908297sm1462702a12.26.2025.06.27.06.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 06:29:32 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 27 Jun 2025 14:29:31 +0100
Subject: [PATCH 2/3] arm64: dts: exynos: gs101-pixel-common: add main PMIC
 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250627-gs101-reboot3-v1-2-c3ae49657b1f@linaro.org>
References: <20250627-gs101-reboot3-v1-0-c3ae49657b1f@linaro.org>
In-Reply-To: <20250627-gs101-reboot3-v1-0-c3ae49657b1f@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_062935_159731_E07020F2 
X-CRM114-Status: GOOD (  11.83  )
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

On Pixel 6 (and Pro), a Samsung S2MPG10 is used as main PMIC, which
contains the following functional blocks:
    * common / speedy interface
    * regulators
    * 3 clock outputs
    * RTC
    * power meters
    * GPIO interfaces

This change enables the PMIC itself and the RTC. We're still working on
the remaining parts or waiting for bindings to be merged, hence only a
small subset of the functional is being enabled.

The regulators fall into the same category (still being finalised), but
since the binding requires a 'regulators' node, an empty node is being
added to avoid validation errors at this stage.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 .../boot/dts/exynos/google/gs101-pixel-common.dtsi    | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
index cd8e1b8a10b111190b984e104f749d04514d0449..c1b51f4cfb8c174852b44690f84ed1aa0b4057c2 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
@@ -100,6 +100,19 @@ cont_splash_mem: splash@fac00000 {
 	};
 };
 
+&acpm_ipc {
+	pmic {
+		compatible = "samsung,s2mpg10-pmic";
+		interrupts-extended = <&gpa0 6 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pmic_int>;
+		wakeup-source;
+
+		regulators {
+		};
+	};
+};
+
 &ext_24_5m {
 	clock-frequency = <24576000>;
 };
@@ -290,6 +303,12 @@ if_pmic_int: if-pmic-int-pins {
 };
 
 &pinctrl_gpio_alive {
+	pmic_int: pmic-int-pins {
+		samsung,pins = "gpa0-6";
+		samsung,pin-function = <GS101_PIN_FUNC_EINT>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+	};
+
 	key_power: key-power-pins {
 		samsung,pins = "gpa10-1";
 		samsung,pin-function = <GS101_PIN_FUNC_EINT>;

-- 
2.50.0.727.gbf7dc18ff4-goog


