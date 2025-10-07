Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48F0CCA472
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 11:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5xSjj3Iwg14xHIfiMziIXjcapcCofRPyKMdiFHmwd9k=; b=2zZ+gjWuWi/7wAXewIDzoXndZ0
	s3tSQuuafytymDnRh0aCBi3vwyHJCC+WQv2JivnpxsEk4eA5RPFreV1XXOZp/VbWQF0kGTrHcqpL+
	JvdLtGLkT378vGPWIL3agEBxLNEUQdgFDMBkxRp8nxhG82Uj27KycSj5bdICxCSPs3Ux/EzlsC0vL
	T8Be2VzYgbosDgvJHhxqGbyievxzJ0rDdyEznlj5E+u/cStSGHJtyKivdOOQykk6WLQoiLK2rtPlm
	z2U32s0TjtgTNbG0bRIsUzuP7aKYDktfd0k8Lkp9fUH6vV6kElwRrBhCbDHxfAc/y+s9vEwTqhCSk
	eYqXQXFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v65iQ-00000001s6F-1LYA;
	Tue, 07 Oct 2025 11:18:46 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v65iM-00000001s36-3Cuq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 11:18:45 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-782e93932ffso5550617b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 04:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759835922; x=1760440722; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5xSjj3Iwg14xHIfiMziIXjcapcCofRPyKMdiFHmwd9k=;
        b=VmdPcYtcqmPkwryiTcl/ct5lFWXFWQ0FkBi2OjpULoIQ0DrrzS4c/wMSDOfBIQUF1B
         Sc0Ec/Bkq7CGhBlrmeFib+b2pnZjlKxU/yEAeIKFUDGAoGZONA7Uexho1oAK/IIqkJ6B
         gZ9m+AKVzPRiNG8N8rWEp6cDL+nuvzRCdaOSSPLqyvU5JV759iHPOjg4VvqAPNmySgyJ
         AbzxVoILMdl7oU1IDOOKc7gC5vUrhtT9fjqdSuFpcYFZNOFtUKA1PqDSTxrV4BoPbmKM
         LAn8OtbJWx5i+1xQyrJs7nnpUw/8aytH5L0OvhtKwaudBTdkf/bWbxohLsyuIza2uYwW
         OycQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759835922; x=1760440722;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5xSjj3Iwg14xHIfiMziIXjcapcCofRPyKMdiFHmwd9k=;
        b=UZJ+c0xf2z9WaSDVBiVrdpVDS7CCv9/+XkV88alZCCskeLADxIWKDGR9nvmpw24/ug
         zAT1AlKkIcjv3dJFB2BU+LTO3xnXTCOPFKEP1bJEN6MDLZbZSEJAOqDxt7KiZ6YwKrkR
         M5fKQrPw1uSZ33xY3iGK9YlDBo6WtTHZvsf8HpqjdUR7UR0fGH2Dmmuj3ht8YGN4aGkp
         gKQauefowTXI1FoprjG986tDeeohRUu1hO2arL14dLxaLjliaLDpLwNwjX83T11P66ea
         7VcEU1JvSxdpwUxhac6XqaTLp+/IhW4FTSdwwLg7MNhl1AI/xx+UfuU81woSMC5Inipm
         2XBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVM0ptrbv7I1Lhvin+Ugs3DiIoyKWNUPyzDhSWMH/INZ7LXk79ySvtxT8MdjSNv8p+1/4zYApnnxs9kgmF+CbF@lists.infradead.org
X-Gm-Message-State: AOJu0YxHebu8z4QXTEzAsWtl7vq0QXLfyUkVm344libWaT6dEVV3Dbyt
	pwkr4BClh7EoMHlG66j0WukgIbQRLbLmw3HQiE/ZM9hku/xJ4q+5KTm8
X-Gm-Gg: ASbGncvPpW7Tn9VSCpqFEEzDsPmdOuqe8MyhtHRVMCTFYMBxs9csfeIdoZY3gIIN0eF
	5aJdQ19pFJCXDkCqFE0WNCtDyM097fuN//VlOxoczo7rwURd4oAVRUSjiKgUzTPRLvZsd6EQXYE
	kI9lTK0OIWHvCitwvGedUezX7y4JV7TXHp1TZmS6qg2v7HzU5Gt9TqCn2Yoy5wvZmiAfv1CMZQR
	sASVGEJdlGVXiKCcSth7MCbc9EwyUoChFzz4M0e20UZjx4EDzMBSyP2wX/3vmpNn87YnfFukaML
	/RrHeuZizm+PYuOOGbE4QYXTpc01mrUuOJDMO8GBBxutbUVlBwxMQlAzc4PJnqEepip3McaiQSb
	7WDn0I9Ep/U9XUp/YTPr+pd107eY8GyGxkxgm2enqxejqFcYBfE7zVhAwlaTyLw5kcqRMOCEQ+h
	jsOFlS/OCzrI3ZESeq5ez8GM9xEdhmKcs3sHlZ2173kg==
X-Google-Smtp-Source: AGHT+IHQhWG4at6c4CSv92k3Kc2ZO7qLCe+WK+3iGElAPZoi7Z/HUsioUEndvALrS7T+2HHEi3fTMQ==
X-Received: by 2002:a17:903:2409:b0:27e:e96a:4c3 with SMTP id d9443c01a7336-28e9a54423bmr206134295ad.14.1759835921894;
        Tue, 07 Oct 2025 04:18:41 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1d31bdsm162509045ad.94.2025.10.07.04.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 04:18:41 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 07 Oct 2025 21:16:52 +1000
Subject: [PATCH v3 11/13] arm64: dts: apple: t8103, t8112, t60xx: add hwmon
 SMC subdevice
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-macsmc-subdevs-v3-11-d7d3bfd7ae02@gmail.com>
References: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
In-Reply-To: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2496;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=l1N1qUSs7aNQur915ZEPIIc8ybGkzYfyM4nn88B18eA=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBlPvm1b4qq69Uht7n7+Jkm98m/LRPVem4gxb5O6ar954
 s7df7ZydpSyMIhxMciKKbJsaBLymG3EdrNfpHIvzBxWJpAhDFycAjCRqZ8Y/mmfN0l8cGTT+/aj
 HGrv5p1WYI5+xXPz5b3Eb+qv5wRNCpvLyNB8WqqikeUrk3D9m6SOk5mMvzVf6f3cW964bnHO3/P
 2XiwA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_041842_845574_20C7D066 
X-CRM114-Status: GOOD (  10.99  )
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

Apple's System Management Controller integrates numerous sensors
that can be exposed via hwmon. Add the subdevice and compatible
in preparation for the sensors that need to be described
for each device.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../arm64/boot/dts/apple/t600x-die0.dtsi | 4 ++++
 .../arm64/boot/dts/apple/t602x-die0.dtsi | 4 ++++
 arch/arm64/boot/dts/apple/t8103.dtsi     | 4 ++++
 arch/arm64/boot/dts/apple/t8112.dtsi     | 4 ++++
 4 files changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t600x-die0.dtsi b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
index f715b19efd16..e6647c1a9173 100644
--- a/arch/arm64/boot/dts/apple/t600x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
@@ -37,6 +37,10 @@ smc_gpio: gpio {
 			#gpio-cells = <2>;
 		};
 
+		smc_hwmon: hwmon {
+			compatible = "apple,smc-hwmon";
+		};
+
 		smc_reboot: reboot {
 			compatible = "apple,smc-reboot";
 			nvmem-cells = <&shutdown_flag>, <&boot_stage>,
diff --git a/arch/arm64/boot/dts/apple/t602x-die0.dtsi b/arch/arm64/boot/dts/apple/t602x-die0.dtsi
index 8622ddea7b44..680c103c1c0f 100644
--- a/arch/arm64/boot/dts/apple/t602x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t602x-die0.dtsi
@@ -114,6 +114,10 @@ smc_gpio: gpio {
 			#gpio-cells = <2>;
 		};
 
+		smc_hwmon: hwmon {
+			compatible = "apple,smc-hwmon";
+		};
+
 		smc_reboot: reboot {
 			compatible = "apple,smc-reboot";
 			nvmem-cells = <&shutdown_flag>, <&boot_stage>,
diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index 59f2678639cf..78eb931d6fb7 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -909,6 +909,10 @@ smc_gpio: gpio {
 				#gpio-cells = <2>;
 			};
 
+			smc_hwmon: hwmon {
+				compatible = "apple,smc-hwmon";
+			};
+
 			smc_reboot: reboot {
 				compatible = "apple,smc-reboot";
 				nvmem-cells = <&shutdown_flag>, <&boot_stage>,
diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
index 6bc3f58b06f7..5a8fa6daa00a 100644
--- a/arch/arm64/boot/dts/apple/t8112.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112.dtsi
@@ -912,6 +912,10 @@ smc_gpio: gpio {
 				#gpio-cells = <2>;
 			};
 
+			smc_hwmon: hwmon {
+				compatible = "apple,smc-hwmon";
+			};
+
 			smc_reboot: reboot {
 				compatible = "apple,smc-reboot";
 				nvmem-cells = <&shutdown_flag>, <&boot_stage>,

-- 
2.51.0


