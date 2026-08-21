Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE932C5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 14:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OmCssIUI07ufWPm/xfAJqm7bns7S+UOY74WOaOcLcEg=; b=EZzpCvFnWCtGJ1iQ9R6SU6RyVX
	dXVgc/U6KauLzbI2IOnWLjWulpmYiaHxr40/tlOciewB5c2a2m8HYlpRMn9UswurGH+kobS3eNmYI
	gCXhkE4qW4tE7nE2z3IHUOyU+i3K1lTIvGWSfCX0jHqUVfSt0jxrqtVVP+vyVFya7owOxwq+vMFM6
	5nzTSOY/XisVRpIyLAEL/IkVpAhTzfQByTAYbdZMHi3yEEBXOuD99eKMqHqywmA6wSPTFtvMKXvdW
	5EqKE/YSk7mAMwymQvIDJRv3fA6RomibtX9/fwKkQkNAmE6k3ehmejUFI8jWyELByoWe044liVKGZ
	gg4eA4kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxQiR-0000000Dbzm-1bjd;
	Fri, 21 Aug 2026 14:59:31 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxQiM-0000000DbxS-3070
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 14:59:27 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-6a41191c9a9so2374171a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 07:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787324365; x=1787929165; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OmCssIUI07ufWPm/xfAJqm7bns7S+UOY74WOaOcLcEg=;
        b=m7yr5Xa4QedakrPmqsSihDowTt2eFVccQGKH3V6AxnK5EP6FBqnSjC4hSIVYL33dqG
         F5miazt9GLCTR22nI+rba4R9vUNwK/Auxcu2L4doRX+Vk3AKvXfxqShc5cfNfOA6e2qc
         Lj3gBHTpjIYAwIjTdCN/4CI3j6sdOhSLucv5+8685rVybvvl6k6shqmBTf0lNq12r4iy
         hNGKMm1Mgvpzdlx6/X1CTPWXTkSm1inS9kMBk50Ol4tk8SnBYo3bZDHwMvmDsh8sHPLm
         aJh0c4JuHdg0zJWUoFfDsfBar44FTq6YGUB71ANqvukvXzKl0X3FhN1fVaDNzFepcg2k
         acnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787324365; x=1787929165;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OmCssIUI07ufWPm/xfAJqm7bns7S+UOY74WOaOcLcEg=;
        b=WCCXBlBeuldrtR8N9tNwP33Y+TGwZ8MRmki5QmJTNgtV0rC6Ldcr3xSIf6R8IBVxaQ
         W172Lu67oLVY89YbPL8gp7xHtaqqZwU03pm78XDd771dzaSBWexWvDNukJ8CTfJJ1nrl
         jNHu29aPbPyPaYGPWxhFoyjuWRx5qF46v45qfxLYBZcCCc+Av3ckT5fFe97xN++F0fPp
         9QL519+D9knYfFoa2JF1RKuBZgGZwdf64ZMTNuj0o9CvT2G94HvdS0dGwoYQdeQKD4nT
         4tsw9zi1+ERAJXybo5eUBXyh9oNzBuqB1+z83dTx/r0H5oFIUHikgjHm0mHfFliRGSmJ
         mA/Q==
X-Forwarded-Encrypted: i=1; AHgh+RofO1r6HL9kbUvYa139z8pgUy1nSzTHG1ispuyF+kPMkT59PPrI/od2fqW1bEDwvkJsET42Ln8XyUCRDGTo3MHW@lists.infradead.org
X-Gm-Message-State: AFuF++l0x4+3saoCXl/kZ/NgkvYgm2r7GXf1FEoQQ2oeK0lV5BKNBXAV
	BsE22z/KOxNPKuoe4zqpprbwafwgqbDf2umqtIq/iu7BsEKJP5V/+ZevEYvW0Pe1
X-Gm-Gg: AR+sD10kg3SdVJiOMOaAdTBa44Os3sDAJROMR4nW+PwEjlypIvUKHmveGpmFczFVLgA
	luzLVXG3eE/IOje3QcRpqBpS7QNO6v0iKrjdglMMbHWEvsZOcXupNOwvpQWd+WEXdaBVuexPc/5
	g9f+GwIxAlL29S71Gj+Q/p6Di/bWLO6eA4DXG1GZqBM5w+zoFlOiQmA4f+g+hHrj0dEwwcafDpy
	GRpMvcpNV7D2ET+uNbLq1+ChDXtGlFlzwBm+Xh4rvnUo6mDT6S4WTO8EFl72lDVXQs6tPhK6NZj
	FOi+vLzTmFfTaxpSNDJ25Jgcpa23x5TngGEe0kbu1jSlYUJR4KQD/QSTY1xrkJ1W1y8eBKt5E1a
	zKjuL/z5SZRD9gF+6WsYaJ5hh/o94cI5d5iuxHr1OTFCqOVgyma4e/liY90W70d4zF0KtzgvB4c
	XhdNlXRhgPwU6Ewr5VL7HdSs0/rw5g/mXc0ySpNO9LvOyw4wq/qCAoQNuymByxiVKFMpC1ppSrh
	uT6Zqa/Guen6P2kvWSjmvRm+rV91ol3BxDq9NNSemgq/qq2zhdyAeecmWbrjOW5IFlj6npjmeNB
	OWVD3YCNThdWH7Dkxt43quDs56YyKUwUfrC5Dw==
X-Received: by 2002:a05:6402:5406:b0:698:c13e:179a with SMTP id 4fb4d7f45d1cf-6a42f1bcdb3mr7491043a12.10.1787324364681;
        Fri, 21 Aug 2026 07:59:24 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a411971b19sm6577066a12.11.2026.08.21.07.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 07:59:24 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Date: Fri, 21 Aug 2026 16:58:58 +0200
Subject: [PATCH 2/2] arm64: dts: apalis-imx8: Add USB HSIC support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-add-apalis-imx8-usbhsic-v1-2-fb93d73ead44@toradex.com>
References: <20260821-add-apalis-imx8-usbhsic-v1-0-fb93d73ead44@toradex.com>
In-Reply-To: <20260821-add-apalis-imx8-usbhsic-v1-0-fb93d73ead44@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Francesco Dolcini <francesco@dolcini.it>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
 Franz Schnyder <franz.schnyder@toradex.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_075926_787576_AD8B7E49 
X-CRM114-Status: GOOD (  11.25  )
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

From: Franz Schnyder <franz.schnyder@toradex.com>

Enable the USB HSIC host path on Apalis iMX8 modules.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8-apalis-eval.dtsi      |  6 +++++-
 .../arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi |  6 +++++-
 .../arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi |  6 +++++-
 arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi      | 16 +++++++++++++++-
 4 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-eval.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-eval.dtsi
index 6f5af37ba9af9..1d4e92f674f87 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-eval.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-eval.dtsi
@@ -133,7 +133,11 @@ &spdif0 {
 	status = "okay";
 };
 
-/* TODO: Apalis USBH2, Apalis USBH3 and on-module Wi-Fi via on-module HSIC Hub */
+/* Apalis USBH2, Apalis USBH3 and on-module Wi-Fi via on-module HSIC Hub */
+&usbh1 {
+	vbus-supply = <&reg_usb_host_vbus>;
+	status = "okay";
+};
 
 /* Apalis USBO1 */
 &usbotg1 {
diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi
index 93f485140b20c..68fb2eb8c7e67 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi
@@ -222,7 +222,11 @@ &spdif0 {
 	status = "okay";
 };
 
-/* TODO: Apalis USBH2, Apalis USBH3 and on-module Wi-Fi via on-module HSIC Hub */
+/* Apalis USBH2, Apalis USBH3 and on-module Wi-Fi via on-module HSIC Hub */
+&usbh1 {
+	vbus-supply = <&reg_usb_host_vbus>;
+	status = "okay";
+};
 
 /* Apalis USBO1 */
 &usbotg1 {
diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi
index 5c86bcee55fb7..baf09624fb27c 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi
@@ -271,7 +271,11 @@ &spdif0 {
 	status = "okay";
 };
 
-/* TODO: Apalis USBH2, Apalis USBH3 and on-module Wi-Fi via on-module HSIC Hub */
+/* Apalis USBH2, Apalis USBH3 and on-module Wi-Fi via on-module HSIC Hub */
+&usbh1 {
+	vbus-supply = <&reg_usb_host_vbus>;
+	status = "okay";
+};
 
 /* Apalis USBO1 */
 &usbotg1 {
diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
index 681f24810d52e..64604f91d5673 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
@@ -870,7 +870,21 @@ &spdif0 {
 	status = "okay";
 };
 
-/* TODO: Apalis USBH2, Apalis USBH3 and on-module Wi-Fi via on-module HSIC Hub */
+/* Apalis USBH2, Apalis USBH3 and on-module Wi-Fi via on-module HSIC Hub */
+&usbh1 {
+	pinctrl-names = "idle", "active";
+	pinctrl-0 = <&pinctrl_usb_hsic_idle>;
+	pinctrl-1 = <&pinctrl_usb_hsic_active>;
+	adp-disable;
+	disable-over-current;
+	hnp-disable;
+	srp-disable;
+	status = "disabled";
+};
+
+&usbphynop2 {
+	status = "okay";
+};
 
 /* Apalis USBH4 */
 &usb3_phy {

-- 
2.43.0


