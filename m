Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C3C1CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 00:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U5nftmpeMNxILQOhfvmkuo3ny/kYcoPK9w/ov0DMU2I=; b=a3bzUjq3I56JyszYlqJv9UdbR5
	chfmwOtp2UDp+4dirBvnNQni2BUcteFH/rEo8IHapHCHQ5ncww0xc8olmyDumj/Ck7DOsZdMVJOSD
	g9QSxfaicIKGUGUNl5UNy0No/AMd8WqVoLTb2TX31EU6I5Mo2V9k/4T/k9hd5qvCTCGFUJvyughM9
	+0jGeRjHJgDeBlwCPAxHXYCbHPNgKVTfj+hk6oXo00UHnuRm/akC3WcS2uVm/4adAXIh43o9Q+OPe
	gzvay1GfuxgHZqw/RCrqQDVy8B/nycgf8FmbRGT7Tkaja411Q9BO7AlQZZTd2qO/4Sw2+oFhuGMJj
	PXQhY6zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCS6s-0000000AjP0-43Gn;
	Sat, 25 Oct 2025 00:26:18 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCS6l-0000000AjIS-0fur
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 00:26:17 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-292fd52d527so28777065ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 17:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761351970; x=1761956770; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U5nftmpeMNxILQOhfvmkuo3ny/kYcoPK9w/ov0DMU2I=;
        b=fyunUheCVUmZ+Y12hpZjH8Tl5kvbsaj9dpppdGLP3PxcjTz57ukxJDdFTA1XPGhYPL
         aynqW8xzLvMrvYvt1e/7Fa+ZMp13JaH4PnCnQGBuJcsCt0epyl2wHSfespdb8vOCQxP9
         qy7zZcq0YQgcBvK6fZ3lXnbbtif7dRLPtO6EFvdUPtRsdIpzr5R1TEelpJMb5OqgWayw
         3Rp2iCoTSl0DZL2AkiKkRpOqEmpmpy0BNvz+mmlCSLJWrBb1KXKB/wsMdXTn/MUGB8ut
         3KgCvOmpeyssKWQzW8+pC+G7m+gKb0aMW7NcDxM2F4tWFP29B50oQBzf5VsrLFZenvQ5
         yGGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761351970; x=1761956770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U5nftmpeMNxILQOhfvmkuo3ny/kYcoPK9w/ov0DMU2I=;
        b=TDfT/ekMZD/jrWaIvpQOSysIDrbbvvVUIkwLc6rGMbdljIo6n+5hCu+vXMXR21OgjS
         5FBeJ8XTZ6leEduWllJL3SCQrPqG/9SmquFfFsH4IbA6eE96py4p66IaldKk4lK4XWST
         DTCmgiZcLRJnKQ+2QcSPk7jrRypAMN8XsXauZF12cvzx/xO4q3dkRHYkktDoVnUCikic
         otLElrz54J1NbLb91r0asbkmAzbxhRI8Qh96i8uQ0qiXBotdWv+zZCOuTmCtuHC9WyZX
         7xab+WgFTtQ+g9N4Xgs0FYXdSeKkUvUR0hMeejw/T0UotfUNemH7oe1Wxm13dIxvLVuW
         uVPw==
X-Forwarded-Encrypted: i=1; AJvYcCX//SUXN4slNPmMffdFptAJpDCRrJXX7v3aLSdvPoRCghY64NSTU0fF5o8J1Tys+XzaJkVPWBbnc3bxL/SaTQpt@lists.infradead.org
X-Gm-Message-State: AOJu0YyupZ4Dd7JRaCH2Rh+6Jczfq3NjKYmL2HTAb+TjaSBEMenDhVUE
	Id1m81MWq8NP3+C33JrHfxlH2KxgFYtHE9WjZaYQLgeYfz0s2In4vLat
X-Gm-Gg: ASbGncvRUXTBlz5kgucoIF667HTfA6YHFCj+uk/Zx7xHgGNOMwE5cKKMc+rVAWej05M
	Jx01P3EgKmQtOvWr+lvbcUwq+UbRbZmo69DQMEQShoHDYMkgub+hODYAf7Orz+FXEaZo9Oh0ver
	osizJ7iFEUrne3fXRgzxDM7iW3tjZEcOjBObQ4qEHlbLafetxs2Q4hViEGFTXLqC1u+j5H/qAwE
	8NuCdEeEQ8SWrwMcPcm5xZ91+lqKQYmqabgMj1U55sIcO7D2aCzggN8+atHTXyYhSbRT6cTASbg
	O4UpGinaA16VZMJXak4kiQy4mKosspzLVEMH8bBcMuUcxcELOFscnQIw/2TICvZm/Xqz3qXYW+n
	ySOaCpNZRRJv6qKZvgc5A+gcj50awtqnSkuk+62e2/xOUv05T91mkBrukjA4c7yvp4WEeGGZNzw
	2K18j1+QYjz9ru6T0tDBZ2DNTarORHYO8Fm3DvPQWLFzJhFrrhwgcZE5GAzRXioK56f+A2Uf1Nl
	XtEY63opkghxfiQNKBT7Eb8frxsKNqT2QWWoxULBie9gj/74NajOg==
X-Google-Smtp-Source: AGHT+IE8KakcB5GHMGG8ECARmltmRt3k8h0a0+JIbETOJrnh8ND1oGT/dCjWnKYo35ORe4+xL9/X1A==
X-Received: by 2002:a17:902:db05:b0:269:8f0c:4d86 with SMTP id d9443c01a7336-2948ba5b73cmr48845065ad.53.1761351970277;
        Fri, 24 Oct 2025 17:26:10 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf3f4asm4728885ad.11.2025.10.24.17.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 17:26:10 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 25 Oct 2025 10:24:41 +1000
Subject: [PATCH v4 10/11] arm64: dts: apple: t8103,t60xx,t8112: Add SMC RTC
 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251025-macsmc-subdevs-v4-10-374d5c9eba0e@gmail.com>
References: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
In-Reply-To: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2689;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=2GQnZlbwDgkFgLSJTTlkgGVtMUC2q8Y46wlmJNb88ZA=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBl/JM59fOHE8XGD1q5TTvfe1J0p3i1UNPndGn9/d7OLU
 d1ZTR9rOyayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKhjrGPEwMUpAFNteIiRYdmlmbkMnxU871/kSnOszjRcPnf5/0tbq3w+nJg8l2vSeQ1Ghlvlif/
 yF+yz+2l6ZbLx3N8bhLcfEPusO+nlav2A3Ss3neQHAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_172611_233986_BCD69048 
X-CRM114-Status: UNSURE (   9.34  )
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

From: Sven Peter <sven@kernel.org>

The System Manager Controller of all M1/M2 SoCs supports the RTC
sub-device.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Sven Peter <sven@kernel.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../arm64/boot/dts/apple/t600x-die0.dtsi | 6 ++++++
 .../arm64/boot/dts/apple/t602x-die0.dtsi | 6 ++++++
 arch/arm64/boot/dts/apple/t8103.dtsi     | 6 ++++++
 arch/arm64/boot/dts/apple/t8112.dtsi     | 6 ++++++
 4 files changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t600x-die0.dtsi b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
index 3603b276a2ab..f715b19efd16 100644
--- a/arch/arm64/boot/dts/apple/t600x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
@@ -44,6 +44,12 @@ smc_reboot: reboot {
 			nvmem-cell-names = "shutdown_flag", "boot_stage",
 				"boot_error_count", "panic_count";
 		};
+
+		rtc {
+			compatible = "apple,smc-rtc";
+			nvmem-cells = <&rtc_offset>;
+			nvmem-cell-names = "rtc_offset";
+		};
 	};
 
 	smc_mbox: mbox@290408000 {
diff --git a/arch/arm64/boot/dts/apple/t602x-die0.dtsi b/arch/arm64/boot/dts/apple/t602x-die0.dtsi
index 2e7d2bf08ddc..8622ddea7b44 100644
--- a/arch/arm64/boot/dts/apple/t602x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t602x-die0.dtsi
@@ -121,6 +121,12 @@ smc_reboot: reboot {
 			nvmem-cell-names = "shutdown_flag", "boot_stage",
 				"boot_error_count", "panic_count";
 		};
+
+		rtc {
+			compatible = "apple,smc-rtc";
+			nvmem-cells = <&rtc_offset>;
+			nvmem-cell-names = "rtc_offset";
+		};
 	};
 
 	pinctrl_smc: pinctrl@2a2820000 {
diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index 8b7b27887968..59f2678639cf 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -916,6 +916,12 @@ smc_reboot: reboot {
 				nvmem-cell-names = "shutdown_flag", "boot_stage",
 					"boot_error_count", "panic_count";
 			};
+
+			rtc {
+				compatible = "apple,smc-rtc";
+				nvmem-cells = <&rtc_offset>;
+				nvmem-cell-names = "rtc_offset";
+			};
 		};
 
 		smc_mbox: mbox@23e408000 {
diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
index 3f79878b25af..6bc3f58b06f7 100644
--- a/arch/arm64/boot/dts/apple/t8112.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112.dtsi
@@ -919,6 +919,12 @@ smc_reboot: reboot {
 				nvmem-cell-names = "shutdown_flag", "boot_stage",
 					"boot_error_count", "panic_count";
 			};
+
+			rtc {
+				compatible = "apple,smc-rtc";
+				nvmem-cells = <&rtc_offset>;
+				nvmem-cell-names = "rtc_offset";
+			};
 		};
 
 		smc_mbox: mbox@23e408000 {

-- 
2.51.0


