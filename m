Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A2FE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 15:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e5aEpMmoZZCQQPaRUNn2M/cjTXlmafGJ+ljwOWiSLUI=; b=Cku3plZ2bQolIMhNvHK3ZMtM5N
	kgy9lQ4VvqrLhdzNFytdnNcfdUXz3HQ3ZTVF1t1lfVYtgn0Ohyg9UsCHreqEbDzC7MihW2LGLJulB
	46PDnM3rzTRBfnUP7DxtWqsbWct96BSroK2Q9CkJeQhMJ4TdVq5KQRFvwTbtN0K5ekut+YVLVCbQ7
	skkMyxBaiPhUdARm74QIchiwIVREJNhrpUilkAnULrxyCwATBPz43mk6CHRhpgNngZT3jKMIYEU6t
	A/88XuQFg06s8ngHstFukKf2AT73vbUgBjI8mBwKzSHrDKHfNT6VQd43Ia5vTgeQ/PBYqvAzW93bD
	5vmR6e1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWGwY-0000000FvoD-24YO;
	Fri, 10 Jan 2025 15:29:02 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWGmv-0000000Frpa-1iM6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 15:19:06 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so16585785e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jan 2025 07:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736522343; x=1737127143; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e5aEpMmoZZCQQPaRUNn2M/cjTXlmafGJ+ljwOWiSLUI=;
        b=mlUO7Js+yT+XCX9LFn4+ct+DbvQ8/gKIjYxnLS+D8SflahZgRhBqlUhhdgDPWVjnRf
         OuMBWBNoM1aPqih+BKy+iqnPCfc/zqmEhX8/Q0cum/DVV3Ms8FsHiDjYaI3CBpHyGOcm
         Sbcs7r9Zqh/7879z18tgaYtDnk51LVcTy7W7lzWVXlZQHaPyX+wdGCneDIXLmO3vvbz1
         hk/DYgc42B8HnnAs+LafVzzafEQZ2FoIi8/W1XTG5TjnBu3F0o0p8xOUio8NWlsvDrgo
         k0rjuT4t6Yrt/8XRAWWLEYaA9VgX69ywoiC4aUjgYZ2QABOgxlWEXBKn1kp7afsg7ilZ
         khkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736522343; x=1737127143;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e5aEpMmoZZCQQPaRUNn2M/cjTXlmafGJ+ljwOWiSLUI=;
        b=SDClmde+o1Gzr6GX8QzJi6hiV87Mn72UYU2oH6PdiV8ZXQG30kfdK6ur+tVlzaXVja
         uHF0tVhGm5xLlsmlXj+7P8p6s3v8pKg2xeM6pF9jEBwgXeGJDl1oDSeaS4Nm3na/eyOp
         nWPTee9GcTu9ByuNc8Z13u1bBEdt6sdLAiB1gqrRKmJvoZIjOdSvuWMsXVRhnDZnvzGg
         94MiO1tQoAWINJopE+fHjDSfluXriOXM6USu1xCcvvtaGCVKktFTHwdWA4qq+uLLRKZQ
         +u6KK6aJrSU++h8gnN4MKl+KxRAxMEtpjujSZkIkLIkWC6FFn+XgWHtmwe6y911ROelF
         ft8w==
X-Forwarded-Encrypted: i=1; AJvYcCW2q2endfApFSRwAxlYl/jpZMd4P83xfHCBzkO+B7xvZctxYbeiZweeokAb66kKhH/B6So7JZ/DH0p14dr+7bdt@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3maNcvJmPQDkGpUvcvc9GiTziRWCPvC0+D61cfDPdxYyq/C6i
	l38Cyl9O22lnge1+eh4qXUzOIPG5ahYGhbUCcybifdQNa/xyNCUI
X-Gm-Gg: ASbGnctQdfhniNBgCv4uSk9HvKIEeVcTA/zSSOsBiuFzPd4MtCHoywNfBjLj+imSVqh
	LZHJl7D5mrm/5crf4IWPEGf3MO9xiBhUj86bIFEXAldmh3xuQ9o4rHF9juOIW1Y+JN9Oa6WI6yv
	d9U+OXZs18gurKZU8nd4SEgcwqBzZwVDUzVR5W6yd4BsIKYCuB8GDiOem2Y0ULDzWRhxtfa9s9O
	Xau9mOD/2iyn8UjK7RF3WZPT32xofc7Q1N9ne7gN8FpWfKd8zX4KI8JkQCLChy5ElBbPjvZ
X-Google-Smtp-Source: AGHT+IECfAJ2WoCuNj7wvzCw79nESfWsenN47zMVWMkB4VRz8D5aWBaZsf1e+N3uhc6SbLU9mvw4vw==
X-Received: by 2002:a05:600c:1e17:b0:434:9d62:aa23 with SMTP id 5b1f17b1804b1-436e26dda97mr99240525e9.20.1736522343081;
        Fri, 10 Jan 2025 07:19:03 -0800 (PST)
Received: from eichest-laptop.toradex.int ([2a02:168:af72:0:d0fc:3598:a372:ece6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9e6249csm54511425e9.38.2025.01.10.07.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 07:19:02 -0800 (PST)
From: Stefan Eichenberger <eichest@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	max.krummenacher@toradex.com,
	francesco.dolcini@toradex.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	stable@vger.kernel.org
Subject: [PATCH v1] ARM: dts: imx6qdl-apalis: Fix poweroff on Apalis iMX6
Date: Fri, 10 Jan 2025 16:18:29 +0100
Message-ID: <20250110151846.214234-1-eichest@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_071905_460608_295AA631 
X-CRM114-Status: GOOD (  14.18  )
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

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

The current solution for powering off the Apalis iMX6 is not functioning
as intended. To resolve this, it is necessary to power off the
vgen2_reg, which will also set the POWER_ENABLE_MOCI signal to a low
state. This ensures the carrier board is properly informed to initiate
its power-off sequence.

The new solution uses the regulator-poweroff driver, which will power
off the regulator during a system shutdown.

CC: stable@vger.kernel.org
Fixes: 4eb56e26f92e ("ARM: dts: imx6q-apalis: Command pmic to standby for poweroff")
Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
index 1c72da417011..614b65821995 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
@@ -108,6 +108,11 @@ lvds_panel_in: endpoint {
 		};
 	};
 
+	poweroff {
+		compatible = "regulator-poweroff";
+		cpu-supply = <&vgen2_reg>;
+	};
+
 	reg_module_3v3: regulator-module-3v3 {
 		compatible = "regulator-fixed";
 		regulator-always-on;
@@ -236,10 +241,6 @@ &can2 {
 	status = "disabled";
 };
 
-&clks {
-	fsl,pmic-stby-poweroff;
-};
-
 /* Apalis SPI1 */
 &ecspi1 {
 	cs-gpios = <&gpio5 25 GPIO_ACTIVE_LOW>;
@@ -527,7 +528,6 @@ &i2c2 {
 
 	pmic: pmic@8 {
 		compatible = "fsl,pfuze100";
-		fsl,pmic-stby-poweroff;
 		reg = <0x08>;
 
 		regulators {
-- 
2.45.2


