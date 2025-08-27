Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A46ECA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 15:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EAV1SA7tmKDs0DFNYAv2SnCbmS2lL2C7TchccWIUu1A=; b=Q+2jiAuyFWVNh63yewwHdsvvct
	PlraEgV2ABZ4Uh+P2GF2HDkaz65V6ISsgvp8ZqFggVoovxKsDKXWsV2jOM6jCBZTViNljUEEJbtlQ
	JT6qMs16ScS2s1VK7vEqR6x3qDxscjo3NeeB8rQl9ZNVyxoLbzIQ6TPDok+QeeRqKbEmRjsmlR0UF
	7iGieJg1n0hXhWLcaymTFPmiylf2bVNEZsI/R+TBTWA9NWsF2O4IScZjdKuxmcgpGdMjhO3J9yduJ
	9WTSHDoqlhbMci/NYsfLlh5pV3JCWpI6SDTsL+sRn2PSysLr7nHv6qkMz7iY1JbfGABsoa0YEWKe4
	xsC+IFLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIOZ-0000000Fy5j-01ki;
	Wed, 27 Aug 2025 15:49:07 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urEG7-0000000FFiO-0Iay
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 11:24:08 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-24622df0d95so41190855ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 04:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756293846; x=1756898646; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EAV1SA7tmKDs0DFNYAv2SnCbmS2lL2C7TchccWIUu1A=;
        b=FXd4wihqhbFvwyudLFJSFueKP6b2KFa9zRHHQGLtguU4o8iUwT5x+pvRrj0etUklOr
         XVqDN7LFR5w6ng8VZ8hAPs4MUkEE3lS2FjSJjOi9BbVdnpnJ0FYZo94UjYLW3sbHZ5yg
         waTVZPi4lqicb2lW1o+lVPwAsLmKWYYWqsqLy6u/OpSH8FScsNB+q84z9AEB8B2bZ0L7
         svfPKFVVK75bY83Hr4MQ2m5vw00c0ychLIuqX2VKEkhY0m/gR5RxISoF32E40lXzdH7M
         MJnfG214PGuC5tOy4zJcFMTyBX1FCRgLS7WFL0QIRHas7ds0ZtMOqpYsfd1aKqSE29Be
         Wjdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756293846; x=1756898646;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EAV1SA7tmKDs0DFNYAv2SnCbmS2lL2C7TchccWIUu1A=;
        b=Nh61ht5YE3aHZKo/gdJpSJr/xb9JKra/BPMUaLeZHWiTCisLf22dqukxy9wmuYHaUW
         7Va8fsjEPqBi3uH26XZiVOE/2yxUL/6Y/RLV/1r5EvMyHteOjlPO/iFmxXjTlQMMystI
         rf+diKNG+ufVGyXS0VbNQf1PItXrQMi5rzbDCz94hWOoV683vxpReSd9xRk7ZOeRxZXN
         e8Ko3V3Ovs6z1ZUxvkIx/JTUD47NXmdOKp1z1YyVLvQD10Yhk+FMFUzExJVzMdmkV5yw
         W4PopgFipsQKLsby4Ln492Mxyqr17CQHDuoIlYm2qQgqD+zTuKQbDU24eb9wRvwYSy3m
         0vaA==
X-Forwarded-Encrypted: i=1; AJvYcCXEOVblt7wUBAMUGOg8sOQ7Robk5zWFFkkbfIl9StsYKesxSoKIjZf9YleiB7Z6/nmby22UYHOJLdyNU3B8Gog6@lists.infradead.org
X-Gm-Message-State: AOJu0YzLYtt3VIBZicF9VQiSkyQDGsKQRO4lPf44U3dPwmCpNhmRpf5R
	eN1MMTxr1Soo1IDOIU3lCbYN3a3VinwoM01vpZuKE6JDvY8a4jD6wNX/
X-Gm-Gg: ASbGncs3z2DelwwKi0/roD3xyObpBdNeAznuDhGBvL80x9u/ARVzxzlWGhsfJHPCUcD
	TRbzUv+TzO8tqG+81VIkPzZK50OERg83qt+u9NwkT16c81wXeU5ilW4FauDA3Xt+F38dfiE6HQu
	JV/AD3G0cbqpUXsRCQ8t2lf7Afy3nsQ6cUKDVkqN/Rq6dnDNYkM0AqDOt1eI06SX/G6yKvckhQ1
	0RDfxTaMchRx/LBkLLNLUJw7oYD54Eij4RnYwIlSa2WunG1J2FP4QWCsV2FH+dyYYW979teCU+j
	bvOF0ikh7jyV0A3N5DtFceD4E8xaZa+GvK6nzuPimulQDLGvxxGoZanzKqt6+ksBegTCnYlJEwx
	2UBjr5dQs0qhIMJ5tXkcUlXLs3Xik0ZQYmxSUvp5nocPUmL2T2XIqYthNHS1VoCSuHLUhkupUnS
	jiIEg/eXxROMRtl/yN
X-Google-Smtp-Source: AGHT+IEgqB5UiBHU0abrKFQK8xQrwcte6KMuII6oePpzWrjYXeDJ609b+w/zvWBMeHhWli3+DXh1nw==
X-Received: by 2002:a17:902:e888:b0:23f:df56:c74c with SMTP id d9443c01a7336-2462ee38734mr223696675ad.14.1756293846078;
        Wed, 27 Aug 2025 04:24:06 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fcd6232sm1819708a91.16.2025.08.27.04.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 04:24:05 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 27 Aug 2025 21:22:45 +1000
Subject: [PATCH v2 11/11] arm64: dts: apple: t8103, t600x, t8112: Add
 common hwmon nodes to devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-macsmc-subdevs-v2-11-ce5e99d54c28@gmail.com>
References: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
In-Reply-To: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6874;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=5hVOIbFNhGdk2deyyP87QpYIGvupinnZhOGdw/+Fj2E=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBnrXjW3saep7c58/zbWu7Anl9fX5H7Ae7033Zo9z+Wyv
 B+EZ3zrKGVhEONikBVTZNnQJOQx24jtZr9I5V6YOaxMIEMYuDgFYCLFexkZvn5dzJQv01djKj5F
 oXLZZeFJz6ZHLdwnWLn8a2OnfmVoNCPD58bYlucFCRJGX8Vcz+gzazKd3FyyQXlN8YVji943Hgj
 gBAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_042407_117398_18447A3D 
X-CRM114-Status: GOOD (  10.51  )
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

Add the known, common hwmon-related SMC keys to the DTs for the devices
they pertain to.

Co-developed-by: Janne Grunau <j@jannau.net>
Signed-off-by: Janne Grunau <j@jannau.net>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../arm64/boot/dts/apple/t6001-j375c.dts | 2 ++
 .../arm64/boot/dts/apple/t6002-j375d.dts | 2 ++
 .../boot/dts/apple/t600x-j314-j316.dtsi  | 4 ++++
 .../arm64/boot/dts/apple/t600x-j375.dtsi | 2 ++
 arch/arm64/boot/dts/apple/t8103-j274.dts | 2 ++
 arch/arm64/boot/dts/apple/t8103-j293.dts | 3 +++
 arch/arm64/boot/dts/apple/t8103-j313.dts | 2 ++
 arch/arm64/boot/dts/apple/t8103-j456.dts | 2 ++
 arch/arm64/boot/dts/apple/t8103-j457.dts | 2 ++
 .../arm64/boot/dts/apple/t8103-jxxx.dtsi | 2 ++
 arch/arm64/boot/dts/apple/t8112-j413.dts | 2 ++
 arch/arm64/boot/dts/apple/t8112-j473.dts | 2 ++
 arch/arm64/boot/dts/apple/t8112-j493.dts | 3 +++
 .../arm64/boot/dts/apple/t8112-jxxx.dtsi | 2 ++
 14 files changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6001-j375c.dts b/arch/arm64/boot/dts/apple/t6001-j375c.dts
index 62ea437b58b25ca649e20b1072b4d835bbc17d3a..9e8c4107e65d8dc47ad2ad99af2f436613c11d8f 100644
--- a/arch/arm64/boot/dts/apple/t6001-j375c.dts
+++ b/arch/arm64/boot/dts/apple/t6001-j375c.dts
@@ -16,3 +16,5 @@ / {
 	compatible = "apple,j375c", "apple,t6001", "apple,arm-platform";
 	model = "Apple Mac Studio (M1 Max, 2022)";
 };
+
+#include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6002-j375d.dts b/arch/arm64/boot/dts/apple/t6002-j375d.dts
index 3365429bdc8be90b63c8051822243d897854ab27..b62cf16d6b73e74c3d9116730b44596be2a89ea0 100644
--- a/arch/arm64/boot/dts/apple/t6002-j375d.dts
+++ b/arch/arm64/boot/dts/apple/t6002-j375d.dts
@@ -48,3 +48,5 @@ hpm5: usb-pd@3a {
 
 /delete-node/ &ps_disp0_cpu0_die1;
 /delete-node/ &ps_disp0_fe_die1;
+
+#include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
index 22ebc78e120bf8f0f71fd532e9dce4dcd117bbc6..2cb38861c3855e31c9b8ab66fe69b818c381c604 100644
--- a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
@@ -121,3 +121,7 @@ &fpwm0 {
 };
 
 #include "spi1-nvram.dtsi"
+
+#include "hwmon-common.dtsi"
+#include "hwmon-laptop.dtsi"
+#include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t600x-j375.dtsi b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
index d5b985ad567936111ee5cccc9ca9fc23d01d9edf..7e551e8660c9c2b51f021b1188680c5cce9d2951 100644
--- a/arch/arm64/boot/dts/apple/t600x-j375.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
@@ -128,3 +128,5 @@ &pcie0_dart_3 {
 };
 
 #include "spi1-nvram.dtsi"
+
+#include "hwmon-common.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8103-j274.dts b/arch/arm64/boot/dts/apple/t8103-j274.dts
index 1c3e37f86d46d7b5d733717b47c4b57dc55e1201..f5b8cc087882d6bd2b0f4f2711844d2a0fa8b604 100644
--- a/arch/arm64/boot/dts/apple/t8103-j274.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j274.dts
@@ -61,3 +61,5 @@ &pcie0_dart_2 {
 &i2c2 {
 	status = "okay";
 };
+
+#include "hwmon-mac-mini.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/dts/apple/t8103-j293.dts
index 5b3c42e9f0e6776241bf746d3458766e44e3639a..abb88391635fa048c196d0631d90405519ddd178 100644
--- a/arch/arm64/boot/dts/apple/t8103-j293.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j293.dts
@@ -119,3 +119,6 @@ dfr_panel_in: endpoint {
 &displaydfr_dart {
 	status = "okay";
 };
+
+#include "hwmon-laptop.dtsi"
+#include "hwmon-fan.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8103-j313.dts b/arch/arm64/boot/dts/apple/t8103-j313.dts
index 97a4344d8dca685708aff136af92a1b316f3c3dd..491ead016b2193f123f4ded9dadf85ebf37cdc7e 100644
--- a/arch/arm64/boot/dts/apple/t8103-j313.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j313.dts
@@ -41,3 +41,5 @@ &wifi0 {
 &fpwm1 {
 	status = "okay";
 };
+
+#include "hwmon-laptop.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8103-j456.dts b/arch/arm64/boot/dts/apple/t8103-j456.dts
index 58c8e43789b4861544e20c717124ede3327be010..c2ec6fbb633cc6aeec2322f295c054998fbf08cc 100644
--- a/arch/arm64/boot/dts/apple/t8103-j456.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j456.dts
@@ -75,3 +75,5 @@ &pcie0_dart_1 {
 &pcie0_dart_2 {
 	status = "okay";
 };
+
+#include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8103-j457.dts b/arch/arm64/boot/dts/apple/t8103-j457.dts
index 152f95fd49a2118093396838fbd8b6bd1b518f81..20e85612ae70c116cab788f2c03f5a7d76cb19be 100644
--- a/arch/arm64/boot/dts/apple/t8103-j457.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j457.dts
@@ -48,3 +48,5 @@ ethernet0: ethernet@0,0 {
 &pcie0_dart_2 {
 	status = "okay";
 };
+
+#include "hwmon-fan.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi b/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
index 0c8206156bfefda8a32c869787b2e0c8e67a9d17..f711af410a2edf7587ff091e195c5cf243dc8a34 100644
--- a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
@@ -92,3 +92,5 @@ &nco_clkref {
 };
 
 #include "spi1-nvram.dtsi"
+
+#include "hwmon-common.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8112-j413.dts b/arch/arm64/boot/dts/apple/t8112-j413.dts
index 6f69658623bf89ce73e3486bce504f1f5f8003f3..500dcdf2d4b5da698ee0798f37f624ff70e7b9f0 100644
--- a/arch/arm64/boot/dts/apple/t8112-j413.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j413.dts
@@ -78,3 +78,5 @@ &i2c4 {
 &fpwm1 {
 	status = "okay";
 };
+
+#include "hwmon-laptop.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8112-j473.dts b/arch/arm64/boot/dts/apple/t8112-j473.dts
index 06fe257f08be498ace6906b936012e01084da702..11db6a92493f367cfa64be5e844c80e99bdd325b 100644
--- a/arch/arm64/boot/dts/apple/t8112-j473.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j473.dts
@@ -52,3 +52,5 @@ &pcie1_dart {
 &pcie2_dart {
 	status = "okay";
 };
+
+#include "hwmon-mac-mini.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8112-j493.dts b/arch/arm64/boot/dts/apple/t8112-j493.dts
index fb8ad7d4c65a8fe7966f5541f24f03a379143cfb..a0da02c00f157a0e667b26aebef9157636b14ecf 100644
--- a/arch/arm64/boot/dts/apple/t8112-j493.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j493.dts
@@ -133,3 +133,6 @@ touchbar0: touchbar@0 {
 		touchscreen-inverted-y;
 	};
 };
+
+#include "hwmon-laptop.dtsi"
+#include "hwmon-fan.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8112-jxxx.dtsi b/arch/arm64/boot/dts/apple/t8112-jxxx.dtsi
index 6da35496a4c88dbaba125ebbe8c5a4a428c647c3..6e54c1fb097e8f72cb4fb37e491893a7e3d7e6c2 100644
--- a/arch/arm64/boot/dts/apple/t8112-jxxx.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112-jxxx.dtsi
@@ -81,3 +81,5 @@ &nco_clkref {
 };
 
 #include "spi1-nvram.dtsi"
+
+#include "hwmon-common.dtsi"

-- 
2.51.0


