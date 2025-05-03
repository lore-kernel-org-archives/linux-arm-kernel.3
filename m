Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8997C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 May 2025 12:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gsfY0lV9E4GQej2w/iz2H9P9kYpTOHKDKPixk3yXVII=; b=3ageX/hqV3GVOgHVzZJMrGwZqG
	yHOgr5Jtxu2BZLCH6QzEXLQKTpbcvkefbmHiONYGSvBl9OWGajcitGDuAcepkz6BfhrGu5XYE/nh0
	ZCTUz4Ul2KjomJKCUQR6hMri1fTJhrg+6uVeFjJLp2ifD7yQ1G2VXCEHyjPJAgjaF0xi8qTjInHQv
	KCJMc4NKP3TBPmw/yXQDRTrQjvUQPcucPPNk3Q7MOYewNv1afWe1Cp0vUGAr2UomT7lVVvNh+6T5G
	L6NTwU2BoWLjbe6exEHWr/XMBjXEqwzYIaCtWsHi296pYeYaMJsyPDuexC++6+pFme3dGdi+W3o8w
	OxUtepdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBBXl-00000003qN3-0SCh;
	Sat, 03 May 2025 12:00:33 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBBQS-00000003phq-1doe
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 May 2025 11:53:01 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2ff784dc055so2777984a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 May 2025 04:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746273180; x=1746877980; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gsfY0lV9E4GQej2w/iz2H9P9kYpTOHKDKPixk3yXVII=;
        b=fzbR9u+vwJn7BiX732NVdkdX0mwvTGQKpZJ850BbotJmimJ0yy7XN6Xa/Flaol645F
         oNKfqPPGUzNKWhZmqnPsCszzgoBFqnz4oLa+6bNVEh11Zkddjonm8rCzCgpfQ7fgX/+t
         ClLlyuwSfyjuKJbpcHMJE39S23h3hFAj4S8tmxvje5Dzw4Sy6bOSD4xitoTWks8AXN45
         W9PBC+5p339AgK8idsdSvKA4U9GgL4Ehz7UahS0npud5UKFy/c9GPU2WQVCTI6M+Yyc9
         EEU9siYv6b6lT2EMqCNG+IYqyaaMPlJ1MGacrZBC1LkiIeyOfZUVHkbqZJ7Aw7SEh8T3
         TVlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746273180; x=1746877980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gsfY0lV9E4GQej2w/iz2H9P9kYpTOHKDKPixk3yXVII=;
        b=XEkAI+quB/BqMEY2wppoKCn0BASFHEioc8SFEOh45emT7aqdhFPJG1SqFxSWLbsGwo
         1nSa5jbYApa6viMj6ERt1znBlwnQy/gR6jIq51PwBvO5330hy+MnjMOESCIZGYUzffQ8
         cunHPqfDXVLsY4nKMdYN0/pgoGQ4li/9Dwn3fqIHqaznRQDEhiiT3/n2RyZOrk/JLQMQ
         //oeul4EXlhuUotQvVzkq4k7C6GIIcc+CW1U1irJQd46Ywi3kUNfXrux2mdSBsmPIF9j
         5CzjCXqpDhokEgkUcA9mRh4mzxct92VRqLACjn/OX+vjmH5dKrK3qYPwm6KqxMFR3tLb
         0P/w==
X-Forwarded-Encrypted: i=1; AJvYcCWBDQ6dJKEGzIWvEgydwxjZ2ugQJDLs/daj1dIpYpGjAlmYGZiy8EN7/WmyRGg8goCbhJAGG1ARCjR+TpeGRvSi@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+VTj48+OCdCK8tWShcUpAFYbDCtLfAU5zlAzchoR0ielkaiu3
	KmRa593xWycUViW8ZStzOzohvFvYJNyMEZBIBsloKViqVGkMJswbXNaglW6YOYQ=
X-Gm-Gg: ASbGncvBsyymJqKFGKzvVABMxYqcnt+Krp0KXWFyf3AkHLjhh/u/1TfmhkYkADnfyBG
	qPBk2nQZR8ftDvw4FZMMsSLS3d/FaqEi7wllwt+VmOrLMsxs7ozOARLa7CeRFMHvFjTRxzt8/BU
	Bs7TWQTFNtRcehkPudYjSDrqosxpES6efoT9H/FpOl0XLxzDTgED9qjKv5AYNbJcDywBKZq9LKx
	FMbo2wJu+kTgjkTF2JISMD3UQ1sFFiFZEKifpnK8PZA6LCtxvZ3y1T0dnkm7knVpZU+vVX27xeC
	T+TZtHMpyJhxB2UFcigflmh1CHQjmj5mkG2CIRfqZPiI14YEwFr5
X-Google-Smtp-Source: AGHT+IHo07xACMd0WHyn+ptRHsMdpYfr3dNlaXuZOyQHE5V6GOegT0d8TzAAcTKr8eLDIZ9r9I1D+g==
X-Received: by 2002:a17:90b:3506:b0:2f5:88bb:118 with SMTP id 98e67ed59e1d1-30a5aebf90emr3409932a91.22.1746273179808;
        Sat, 03 May 2025 04:52:59 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a4745f9a0sm4879878a91.5.2025.05.03.04.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 04:52:59 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Sat, 03 May 2025 15:52:33 +0400
Subject: [PATCH v3 3/3] ARM: dts: vt8500: add DT nodes for the system
 config ID register
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250503-wmt-soc-driver-v3-3-2daa9056fa10@gmail.com>
References: <20250503-wmt-soc-driver-v3-0-2daa9056fa10@gmail.com>
In-Reply-To: <20250503-wmt-soc-driver-v3-0-2daa9056fa10@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746273161; l=3308;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=dWBUq8bBWa8P3YO4Zzb1jAw2fF/9zbTcQ/3MFoyjWSY=;
 b=Q5zeXE1GVBmZ0NC9FYxAgrg1Xao74WTqZNc9cnSUgJsM2fbNVpTIj5Bl8X5WS2TKnACPtewKa
 GEXHPSCaL/gD4E/PzebzzVpV1d9mt6BAJ4itvI8evLLzqPRs8goRKj5
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250503_045300_458989_FA0205A3 
X-CRM114-Status: GOOD (  11.38  )
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

Every VIA/WonderMedia SoC has a 32-bit chip ID register at the
MMIO address 0xd8120000. Add respective device tree nodes to let
the system code access it at runtime for the selection of appropriate
hardware quirks where needed.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 arch/arm/boot/dts/vt8500/vt8500.dtsi | 5 +++++
 arch/arm/boot/dts/vt8500/wm8505.dtsi | 5 +++++
 arch/arm/boot/dts/vt8500/wm8650.dtsi | 5 +++++
 arch/arm/boot/dts/vt8500/wm8750.dtsi | 5 +++++
 arch/arm/boot/dts/vt8500/wm8850.dtsi | 5 +++++
 5 files changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/vt8500/vt8500.dtsi b/arch/arm/boot/dts/vt8500/vt8500.dtsi
index 09f5ed3e6821b72fc440f9de3df0ad484d2c4e17..2ba021585d4889f29777a12473964c29f999f3a0 100644
--- a/arch/arm/boot/dts/vt8500/vt8500.dtsi
+++ b/arch/arm/boot/dts/vt8500/vt8500.dtsi
@@ -55,6 +55,11 @@ pinctrl: pinctrl@d8110000 {
 			#gpio-cells = <2>;
 		};
 
+		chipid@d8120000 {
+			compatible = "via,vt8500-scc-id";
+			reg = <0xd8120000 0x4>;
+		};
+
 		pmc@d8130000 {
 			compatible = "via,vt8500-pmc";
 			reg = <0xd8130000 0x1000>;
diff --git a/arch/arm/boot/dts/vt8500/wm8505.dtsi b/arch/arm/boot/dts/vt8500/wm8505.dtsi
index c81810b967bb349419a5ac7db4e788faec3695fb..99c064c916b2279797f71261ca9306e9dcd4bbd8 100644
--- a/arch/arm/boot/dts/vt8500/wm8505.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8505.dtsi
@@ -66,6 +66,11 @@ pinctrl: pinctrl@d8110000 {
 			#gpio-cells = <2>;
 		};
 
+		chipid@d8120000 {
+			compatible = "via,vt8500-scc-id";
+			reg = <0xd8120000 0x4>;
+		};
+
 		pmc@d8130000 {
 			compatible = "via,vt8500-pmc";
 			reg = <0xd8130000 0x1000>;
diff --git a/arch/arm/boot/dts/vt8500/wm8650.dtsi b/arch/arm/boot/dts/vt8500/wm8650.dtsi
index 555008120a3e315591d2ca49a39d354925d570fd..0d6c7bd87f7dcce0eef056d04c38ab1de5d52639 100644
--- a/arch/arm/boot/dts/vt8500/wm8650.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8650.dtsi
@@ -62,6 +62,11 @@ pinctrl: pinctrl@d8110000 {
 			#gpio-cells = <2>;
 		};
 
+		chipid@d8120000 {
+			compatible = "via,vt8500-scc-id";
+			reg = <0xd8120000 0x4>;
+		};
+
 		pmc@d8130000 {
 			compatible = "via,vt8500-pmc";
 			reg = <0xd8130000 0x1000>;
diff --git a/arch/arm/boot/dts/vt8500/wm8750.dtsi b/arch/arm/boot/dts/vt8500/wm8750.dtsi
index 309f6e5129fb817d343cd58a8d90340afd8d6eb9..0158c0ba5dd110957eac38775d3bf3ebd2ab4154 100644
--- a/arch/arm/boot/dts/vt8500/wm8750.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8750.dtsi
@@ -68,6 +68,11 @@ pinctrl: pinctrl@d8110000 {
 			#gpio-cells = <2>;
 		};
 
+		chipid@d8120000 {
+			compatible = "via,vt8500-scc-id";
+			reg = <0xd8120000 0x4>;
+		};
+
 		pmc@d8130000 {
 			compatible = "via,vt8500-pmc";
 			reg = <0xd8130000 0x1000>;
diff --git a/arch/arm/boot/dts/vt8500/wm8850.dtsi b/arch/arm/boot/dts/vt8500/wm8850.dtsi
index 3f4a514d65e2ac7658b73cc9c4f3cae1407265bc..c4bfb4d30aad0358b39cbf30edf0c63e32167bbd 100644
--- a/arch/arm/boot/dts/vt8500/wm8850.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8850.dtsi
@@ -65,6 +65,11 @@ pinctrl: pinctrl@d8110000 {
 			#gpio-cells = <2>;
 		};
 
+		chipid@d8120000 {
+			compatible = "via,vt8500-scc-id";
+			reg = <0xd8120000 0x4>;
+		};
+
 		pmc@d8130000 {
 			compatible = "via,vt8500-pmc";
 			reg = <0xd8130000 0x1000>;

-- 
2.49.0


