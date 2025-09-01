Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D96CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 23:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lzcedc5ariPE0ii4husYv8u/WHZjFrvu0Oy0OmgexK4=; b=m3uQfsl/bAcC+4AtDZkNpm+i2y
	uN1O+qNU39SuqkXxKzQeqGJm3u+QLPLzv143RupEtemuFxQyXNQ7rkBinBlp0jTLQnR7Xkrnbdxy6
	EgESUYIeP2LJCFyI5RV/ZEjXrXgW4msXuS0IIWScGQ6HzY54yKIVBbVg4+Vc508adRCzrbqgCIMfz
	fuhwdyyj9nEdq37d4JXYygZ1q1NS7nG7pkcsvmXOd8HYV+G9D/m38w48W/zIrwkDNvDFL4s+qU1EF
	7yJugUUi0E05lt1V+qi3Gi6p/bBa3nTFxCtVf1TOSi/FDTzOy1p6lByCBGzuKub33wIJkv/oL7OBN
	dq1lVeGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utDiV-0000000EGKO-0oSv;
	Mon, 01 Sep 2025 23:13:39 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut816-0000000DPUq-0Gz0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 17:08:29 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-55f716e25d9so2048119e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 10:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756746506; x=1757351306; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lzcedc5ariPE0ii4husYv8u/WHZjFrvu0Oy0OmgexK4=;
        b=bVdDFImo0C3itAPT3E8ApnokUlz5QgEfaybdnQQOurJlz+u6UfSwz1CjDugCr9rwMq
         nqmiUs1ysmczdd0269f1lEV7205slHoRAZuMuWwwxf/VY52vi3bmticqLrn8NFbvqCfH
         RYEig68CoxYToeycA87AH5hITxX75106fxCoLxGsAc+nel7zQGVcIDMh0G5k+AotlAdr
         7KOJY+1OB7ZsgxmMGkxhU4fv5eAzsCGDVQhH+GuLda4TUu3mkSwYPHseAkaVWjOuZYr5
         eh0Q6w3PBPdI4ENgdi+8pgmkPIE7N9S92Ixd+X5gu0avdoStxy++sIQsZF209C0My6YO
         JMxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756746506; x=1757351306;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lzcedc5ariPE0ii4husYv8u/WHZjFrvu0Oy0OmgexK4=;
        b=iKDUgaivv9/OhvH5gE8X/Xx7nsy0/7OCbFQaatC6MknIHKG+OMFqsAXGD0pmVYa16N
         19Y+SXxf5okq6ZECAKXSR9je1kM0xecVZ5fsxcXFv02c3B2NhIW+aKUlzAK3Fg0U/ubJ
         0qGtEmsPhmS8CoafYtKzGHcDpz3sQAE61tCVenXBycO77VYcMhA6YtRIfIuqqJK+cnJ9
         mbCeZBvPJDUv3fObPU62G2fmlcCl3Fbx1baI5I3rLoxGSRYNJSD8Zhg5OFFJXvWpfdxt
         sNeiRbwS44JirW8R9CblCdt8KFGRdjEd9aMsNIbjPn0yS+Z9nJA4WI11K6Ymq2V0pwpE
         riaA==
X-Forwarded-Encrypted: i=1; AJvYcCXtoCDpwZGga9wueNh+jgtofG4Fa1F+5JWxoSTpSzHYENzWkjvBMNqeeXZKn/tXPtXU1PwEQ49ndOICEcBnqvOD@lists.infradead.org
X-Gm-Message-State: AOJu0YyUCocd7ZM5Zjc5yipihfDiIKW3IAIg+Qo6MAWLtLe2M60F7c18
	sSLwbiZNtYPab8cP8WLCIwj6KJMeZgF29L6eWdsnEK5O1frzu7Ni+avn
X-Gm-Gg: ASbGncs9AkvYCvYdlMyKtogUx633C6f9l4WxULWA5xA7koyLaQANOd9ZPxWpxFLgAKM
	WWjBUlq2+JumIv+RV2XT2K9q5nYQM6+eeBRsVDgcHWpAfDkgE6T/hF2U060E9vJDOMfoeHeu1Fg
	2ZcWmH2T+wzv3wztdcGzKRz5OvE+yhVmOo6aLxjDaMuP9RmJ6CEJ965cr4A0yyzBaJ29CKGi/IP
	HwOugZRd0neUHW+auYS3bT7omTZvZEmpJuKfgcvnYKOrSVG47QvWBvEH4lhp6f79N1V7hCK5laa
	4cdy9ofTKeBgjyXN5+yT+zpDF6DXb7qmYmaCjg7O7dQKY5PL6YAB+oft1C76YW/RYM7nw7Pr8za
	vxujvHRjB7Y8/kE1Dz95XGiKrLGLiom19qyg=
X-Google-Smtp-Source: AGHT+IH3pC8k3xQeBOb/wW4FK2pwYVKYg0crcqd0bKD2RvBOb6fMiSJN0mQaI0dyPcIMeY6TJ6SyCQ==
X-Received: by 2002:a05:6512:3d18:b0:55f:6f76:42b with SMTP id 2adb3069b0e04-55f70995a8amr2636282e87.30.1756746506104;
        Mon, 01 Sep 2025 10:08:26 -0700 (PDT)
Received: from tablet.my.domain ([2a00:f44:892:8a37:6b0:21e7:549b:225b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f7abf7abesm1137666e87.55.2025.09.01.10.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 10:08:25 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Mon, 01 Sep 2025 19:07:15 +0200
Subject: [PATCH RESEND v6 9/9] ARM: dts: bcm11351: Add corresponding bus
 clocks for peripheral clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-kona-bus-clock-v6-9-c3ac8215bd4d@gmail.com>
References: <20250901-kona-bus-clock-v6-0-c3ac8215bd4d@gmail.com>
In-Reply-To: <20250901-kona-bus-clock-v6-0-c3ac8215bd4d@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Alex Elder <elder@kernel.org>, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-kernel@lists.infradead.org, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2485;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=jZ6SN7U3gtrOXPIdIQzLylVY/8dXMuB4ayQmv6+f1VU=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBotdLKHjx+ECuGJdyX/Z4riBATTgknEagxk7FP7
 0Dcob8ewOiJAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCaLXSygAKCRCzu/ihE6BR
 aOGIEAChVctWAwTWP6uIYuZGmmTCvZPBte5WgDTJxGyAwWGzzJZj+CrvdZBOcLVJMIvmJr/DzcI
 TrLz+u6+Q+D+zmu1P0wPm26Xt9upRBGJnWAyv7lHhuPMS1QdUzxEwIgrpyHPtytK2gEXFm/2Ae8
 pn4jac85PbVPK8WJweLR/nVpgEyUVL+7SIARo8qXhq1Sum3AqVAnTewki5+5I7kKDYM5ArDSj9d
 eIZ0B7DDnUJ1cP5QyWNtUYHvOQ9Vl5aUeeQQ5r3z/phqXULjJqxpyfUCJ+VFx5w/82OwUWkm8lB
 O5BwPpd0ZRE0+yhcOqY4junQ1h/DaZAoy7h2utOqcXquBDaYytgB44Vx2HV+IlC8hgxyzeRJXMG
 2uB9FT3iUcjMAhg/+3KIokEJ6UQO4v/Ol900VY5/cx/bs1FTmNkEkdgaidz3kNbCOjBR8mkaLWD
 H1eej5CLmh5EXtQ4WRr+QOrY8VQan12pPqTut1ZZlOU99oowPQzosQ9AucWiQ4c9a0ymkG+kLVz
 g24lxjAXg4c6xmS6ty6ZgoZ9yYVMuLiwOaoAGkqhTaTwqVgrNW3an6UwbKTP8efDTtkUV8iarMC
 4c20Gv9CC5Rx1V7S3GwKf9RuiVTSAayYzn6U5yRLF4iM+eB4avJVd5zwX/SOTgULl5mHjFubcM3
 lDpcBIhS85h6+pA==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_100828_108516_103759AD 
X-CRM114-Status: GOOD (  12.82  )
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

Following changes in the clock driver, add matching bus clocks for
existing peripheral clocks. Replace the usb_otg_ahb fixed clock with
the real bus clock.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v2:
- Add this patch (BCM281xx bus clocks)
---
 arch/arm/boot/dts/broadcom/bcm11351.dtsi | 33 ++++++++++++++++++++++----------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm11351.dtsi b/arch/arm/boot/dts/broadcom/bcm11351.dtsi
index 53857e572080d752732c512ed27f942756d59c46..fac5cf5a46bd9a4b7e09a2e65c3e807d1b4ef960 100644
--- a/arch/arm/boot/dts/broadcom/bcm11351.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm11351.dtsi
@@ -233,7 +233,9 @@ aon_ccu: aon_ccu@35002000 {
 			#clock-cells = <1>;
 			clock-output-names = "hub_timer",
 					     "pmu_bsc",
-					     "pmu_bsc_var";
+					     "pmu_bsc_var",
+					     "hub_timer_apb",
+					     "pmu_bsc_apb";
 		};
 
 		master_ccu: master_ccu@3f001000 {
@@ -246,7 +248,14 @@ master_ccu: master_ccu@3f001000 {
 					     "sdio4",
 					     "usb_ic",
 					     "hsic2_48m",
-					     "hsic2_12m";
+					     "hsic2_12m",
+					     "sdio1_ahb",
+					     "sdio2_ahb",
+					     "sdio3_ahb",
+					     "sdio4_ahb",
+					     "usb_ic_ahb",
+					     "hsic2_ahb",
+					     "usb_otg_ahb";
 		};
 
 		slave_ccu: slave_ccu@3e011000 {
@@ -262,7 +271,17 @@ slave_ccu: slave_ccu@3e011000 {
 					     "bsc1",
 					     "bsc2",
 					     "bsc3",
-					     "pwm";
+					     "pwm",
+					     "uartb_apb",
+					     "uartb2_apb",
+					     "uartb3_apb",
+					     "uartb4_apb",
+					     "ssp0_apb",
+					     "ssp2_apb",
+					     "bsc1_apb",
+					     "bsc2_apb",
+					     "bsc3_apb",
+					     "pwm_apb";
 		};
 
 		ref_1m_clk: ref_1m {
@@ -325,12 +344,6 @@ var_52m_clk: var_52m {
 			clock-frequency = <52000000>;
 		};
 
-		usb_otg_ahb_clk: usb_otg_ahb {
-			compatible = "fixed-clock";
-			clock-frequency = <52000000>;
-			#clock-cells = <0>;
-		};
-
 		ref_96m_clk: ref_96m {
 			#clock-cells = <0>;
 			compatible = "fixed-clock";
@@ -396,7 +409,7 @@ usbotg: usb@3f120000 {
 		compatible = "snps,dwc2";
 		reg = <0x3f120000 0x10000>;
 		interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&usb_otg_ahb_clk>;
+		clocks = <&master_ccu BCM281XX_MASTER_CCU_USB_OTG_AHB>;
 		clock-names = "otg";
 		phys = <&usbphy>;
 		phy-names = "usb2-phy";

-- 
2.51.0


