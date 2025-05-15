Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D06C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 19:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fiQ0h1gm+58SwWG/Ylv3xbw2eD5gYtt7QUrqncv1bU0=; b=4dFm8SYB90r9FidQic2DRfKEqg
	YW4D7zu8hCnUeo9ZOOc31wIWDY9/LFqBwXzybisz02rs5ciKQOh/CVXgkwgrcjwJZGkn3ALUUZi9n
	1eq8UhgNguczCB7ZGqgwqMrljKJ6+f6wy/Aj5bIx6T8FwSE5CouI0vZ++XLZtouOD+ncKZn3x6PVb
	3M0WcqzGzj+M8EpNiAWaxboKSuNJ6RxMTmf/zNwra9ddr7QfCXZricBaVCOtfbYx8v6z3d++dW41p
	ptULGpqNxxYakwez+enNfsdkNe8eOg8v8nso88gjpdwRbb0oNP23Qrbm/aXTg88D3U0wggvaFxKQK
	wt0WfTDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFeUf-00000001hwK-0SZw;
	Thu, 15 May 2025 19:43:49 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFeQg-00000001hOx-3YMx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 19:39:43 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-54fd1650b83so1499482e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 12:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747337981; x=1747942781; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fiQ0h1gm+58SwWG/Ylv3xbw2eD5gYtt7QUrqncv1bU0=;
        b=Xuntq74jhN9aSezGspBsd4FH7FcPQ8RDS1L5+TqYu8TkyF9xa9hicJHsEltuYpTqSa
         vWUBR2W+ljCrghV7sas/sXan7fOrW4Jc4IQHuvXGYShOlC1THGcqRfznvlzgLC+Do9AS
         QX54fRQisS1nA4lpKy8bai5XjoB6+gd0ovMG4/b6t17Jo9+y9ZYgeYMyUM+d+t9yrXkt
         h9VlZhBGkRMz4s3MtmERuXENnTCXAtzpmeEwaCCXycN1LngKIALWt1xDfMxpRvc+nbXI
         gVpNX9vIMDYn3HR+K8kzWNjwtdTwwld1N8G9Tc+g2v+V1JnwkvJBtTTQW+0rcsQsKKEu
         s1Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747337981; x=1747942781;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fiQ0h1gm+58SwWG/Ylv3xbw2eD5gYtt7QUrqncv1bU0=;
        b=rLdOs3eNuVQRVLNA5SdZDmqWHhn/wPkehfPD4sOc97dhNlwc4D3m7q/tqKOm0rDc5U
         IHmDX2XkLtpVBiqPJEr+bfNhy2eQCsg0ag8k+jFWqec0eqnGPaN+tstVwfZ4XqadGINE
         ctDje0sLDvZIXQJE/78aYsmg5Lftcu0VQ77d1fxu94QWFtgpC8M/NQHfGNhja3b/UfLB
         iv0yOcyjaYBXVbD5QoyvQmSJ5QK0oeiQkma6AVk4EUUSghL+R1qEEKNDlFNz6tBftBKW
         7yLWKgk+aYdmVnNrjrcPC2ba0z+pE7iDCq98Z12zXqNMHPUTedvTo8Zf9dudEarsnOoQ
         gB1Q==
X-Gm-Message-State: AOJu0Yz89CTnvNTzqj0o7O5bNT0NptyluYimgjaoCfua9JciyojORTGO
	/133fTN6Tvg4TXSj9lKdU0jj82+FUe3KLtRnCSnBG76SVPUDnklR/FLX
X-Gm-Gg: ASbGncuqxLrgshqqDRr7uQBX4RRrV6TLtBeDQt35qwTLTz1AjhG2qDsHM/gYjm7uy7e
	dNLpCBh3FTTMtYbDqMAsp++KuEi2uA9js+/Sn8C+y+0MUitAZda/BdyDFLGS1BrnivXEthclaLs
	4hoES451UHpte3fg+fXKuJKWeydW8m7XZzSTkZkVUNatmG5rM11XXDN65dCvidHyGb0eA0sQ60S
	PEUuiveFmWbl68hPLjLd6fFNY3YDI6LyvBRwJzkSRb5jXLk1Dp8+gd8QC2WrdJM9Fqm1asz+Dx7
	c1Gnxu4JJSTNGooM3QOiTwxUFosmrI8EMAurldXOLI8AZVamu6OWSV5O+wmSAfWE
X-Google-Smtp-Source: AGHT+IH2rrWs4kDErxqMq6b9kePeGaKA2FEDnIeQ+pVM8RJH0dya3t1BnUfw9uQiCK7wVRnehRIfzQ==
X-Received: by 2002:a05:6512:4508:b0:54f:ca9a:5267 with SMTP id 2adb3069b0e04-550e7222369mr222829e87.37.1747337980859;
        Thu, 15 May 2025 12:39:40 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([95.167.212.10])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f544sm72297e87.235.2025.05.15.12.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 12:39:40 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 15 May 2025 22:38:41 +0300
Subject: [PATCH v2 2/5] ARM: dts: vt8500: Move memory nodes to board dts
 and fix addr/size
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-wmt-dts-updates-v2-2-246937484cc8@gmail.com>
References: <20250515-wmt-dts-updates-v2-0-246937484cc8@gmail.com>
In-Reply-To: <20250515-wmt-dts-updates-v2-0-246937484cc8@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747337978; l=5773;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=MJfAK3c7sgX3bIlslZgAN72r8gP9KS/K7tVV1XvW7Sc=;
 b=COKK9BMnfX9rt3fTup09zuyoC1r9j5H1d2ENM9cZOogie9tr8mFWWnbQ4qdDO+kcN8pu+iqSP
 KaB+nvWlCy1D43mCb7iFZJPvROHSu60xuuRf90yDv9kD+/XhF1Lprkv
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_123942_891541_19CFD808 
X-CRM114-Status: GOOD (  12.25  )
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

VIA/WonderMedia SoCs don't have on-chip memory, so their memory
nodes are better placed in per-board dts rather than per-SoC dtsi.

Move them accordingly, and also add correct node addresses and
sizes for each of the boards. Some boards were also available with
more memory than included in this commit - those would need a
separate DT or an appropriate kernel cmdline argument to reflect it,
as the bootloader on these devices doesn't handle DT at all nor does
it any runtime discovery of available memory size.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 arch/arm/boot/dts/vt8500/vt8500-bv07.dts    | 5 +++++
 arch/arm/boot/dts/vt8500/vt8500.dtsi        | 5 -----
 arch/arm/boot/dts/vt8500/wm8505-ref.dts     | 5 +++++
 arch/arm/boot/dts/vt8500/wm8505.dtsi        | 5 -----
 arch/arm/boot/dts/vt8500/wm8650-mid.dts     | 5 +++++
 arch/arm/boot/dts/vt8500/wm8650.dtsi        | 5 -----
 arch/arm/boot/dts/vt8500/wm8750-apc8750.dts | 5 +++++
 arch/arm/boot/dts/vt8500/wm8750.dtsi        | 5 -----
 arch/arm/boot/dts/vt8500/wm8850-w70v2.dts   | 5 +++++
 arch/arm/boot/dts/vt8500/wm8850.dtsi        | 5 -----
 10 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/arch/arm/boot/dts/vt8500/vt8500-bv07.dts b/arch/arm/boot/dts/vt8500/vt8500-bv07.dts
index 38a2da5e2c5d64477f04e1da9d98cb97be0d95e4..c8c07c2b4acf92e977704437de88550391c8679f 100644
--- a/arch/arm/boot/dts/vt8500/vt8500-bv07.dts
+++ b/arch/arm/boot/dts/vt8500/vt8500-bv07.dts
@@ -10,6 +10,11 @@
 
 / {
 	model = "Benign BV07 Netbook";
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x8000000>;
+	};
 };
 
 &fb {
diff --git a/arch/arm/boot/dts/vt8500/vt8500.dtsi b/arch/arm/boot/dts/vt8500/vt8500.dtsi
index 3cd86941db90c08ae4fbd3e0b1b079623bce28a9..30ebaaa1e5a4b53094b295570ab6e831acfb1c93 100644
--- a/arch/arm/boot/dts/vt8500/vt8500.dtsi
+++ b/arch/arm/boot/dts/vt8500/vt8500.dtsi
@@ -21,11 +21,6 @@ cpu@0 {
 		};
 	};
 
-	memory {
-		device_type = "memory";
-		reg = <0x0 0x0>;
-	};
-
 	aliases {
 		serial0 = &uart0;
 		serial1 = &uart1;
diff --git a/arch/arm/boot/dts/vt8500/wm8505-ref.dts b/arch/arm/boot/dts/vt8500/wm8505-ref.dts
index 8ce9e2ef0a81097e7143a5392ee5b42bf8028ec1..d4ff99c700120fbf3401335168ed88b190335005 100644
--- a/arch/arm/boot/dts/vt8500/wm8505-ref.dts
+++ b/arch/arm/boot/dts/vt8500/wm8505-ref.dts
@@ -10,6 +10,11 @@
 
 / {
 	model = "Wondermedia WM8505 Netbook";
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x8000000>;
+	};
 };
 
 &fb {
diff --git a/arch/arm/boot/dts/vt8500/wm8505.dtsi b/arch/arm/boot/dts/vt8500/wm8505.dtsi
index 34e55b8c2c8b20fe2598ccc9699551dc9c8e69a6..8c99374822f65352102df83a33a1ac072127ebc1 100644
--- a/arch/arm/boot/dts/vt8500/wm8505.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8505.dtsi
@@ -21,11 +21,6 @@ cpu@0 {
 		};
 	};
 
-	memory {
-		device_type = "memory";
-		reg = <0x0 0x0>;
-	};
-
  	aliases {
 		serial0 = &uart0;
 		serial1 = &uart1;
diff --git a/arch/arm/boot/dts/vt8500/wm8650-mid.dts b/arch/arm/boot/dts/vt8500/wm8650-mid.dts
index 7977b6c1e8ebf215df210dee703e470b9159d329..bfc570e80073d5e6907978dfc5d2413e1ceb2983 100644
--- a/arch/arm/boot/dts/vt8500/wm8650-mid.dts
+++ b/arch/arm/boot/dts/vt8500/wm8650-mid.dts
@@ -10,6 +10,11 @@
 
 / {
 	model = "Wondermedia WM8650-MID Tablet";
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x10000000>;
+	};
 };
 
 &fb {
diff --git a/arch/arm/boot/dts/vt8500/wm8650.dtsi b/arch/arm/boot/dts/vt8500/wm8650.dtsi
index b42c77f99c006af31d4be8bbb985f536244edf8c..2daff177979b482eac7e21ec1b17ba000ea69ef3 100644
--- a/arch/arm/boot/dts/vt8500/wm8650.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8650.dtsi
@@ -21,11 +21,6 @@ cpu@0 {
 		};
 	};
 
-	memory {
-		device_type = "memory";
-		reg = <0x0 0x0>;
-	};
-
  	aliases {
 		serial0 = &uart0;
 		serial1 = &uart1;
diff --git a/arch/arm/boot/dts/vt8500/wm8750-apc8750.dts b/arch/arm/boot/dts/vt8500/wm8750-apc8750.dts
index 136e812bc1e498d48c7fc61154bc66a48888b117..72d633bedff04401c40f4d3772fbcfe45e1c0e31 100644
--- a/arch/arm/boot/dts/vt8500/wm8750-apc8750.dts
+++ b/arch/arm/boot/dts/vt8500/wm8750-apc8750.dts
@@ -11,6 +11,11 @@
 
 / {
 	model = "VIA APC8750";
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x20000000>;
+	};
 };
 
 &pinctrl {
diff --git a/arch/arm/boot/dts/vt8500/wm8750.dtsi b/arch/arm/boot/dts/vt8500/wm8750.dtsi
index 68e325163061b11e52027fbf291953a170f39469..60220d299e21101ce8102b376bec5382ef5ac0d1 100644
--- a/arch/arm/boot/dts/vt8500/wm8750.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8750.dtsi
@@ -21,11 +21,6 @@ cpu@0 {
 		};
 	};
 
-	memory {
-		device_type = "memory";
-		reg = <0x0 0x0>;
-	};
-
 	aliases {
 		serial0 = &uart0;
 		serial1 = &uart1;
diff --git a/arch/arm/boot/dts/vt8500/wm8850-w70v2.dts b/arch/arm/boot/dts/vt8500/wm8850-w70v2.dts
index 5d409323b10cb94a5694722de1e31cff5be390ce..eb16991a2cccf35da23c4a0a8ac2ad02665b2109 100644
--- a/arch/arm/boot/dts/vt8500/wm8850-w70v2.dts
+++ b/arch/arm/boot/dts/vt8500/wm8850-w70v2.dts
@@ -22,6 +22,11 @@ backlight {
 		brightness-levels = <0 40 60 80 100 130 190 255>;
 		default-brightness-level = <5>;
 	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x20000000>;
+	};
 };
 
 &fb {
diff --git a/arch/arm/boot/dts/vt8500/wm8850.dtsi b/arch/arm/boot/dts/vt8500/wm8850.dtsi
index 03e72f28d31b1cfdcfa71ede93b8943971bae4e3..1efb8989931d0dab7b946c906b50292b09fc8bb3 100644
--- a/arch/arm/boot/dts/vt8500/wm8850.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8850.dtsi
@@ -21,11 +21,6 @@ cpu@0 {
 		};
 	};
 
-	memory {
-		device_type = "memory";
-		reg = <0x0 0x0>;
-	};
-
 	aliases {
 		serial0 = &uart0;
 		serial1 = &uart1;

-- 
2.49.0


