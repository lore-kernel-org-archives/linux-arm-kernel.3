Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E338C369C5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 10:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KAQfuUf83ZQ1MK8Cm8aM+n8tf7t8e38c8JTgiG4heGM=; b=HKxcyDTcgXkW9ccNR1BfQbdg4p
	sRgNUhJOL67DgxAYiINyO3u25d+6kGBwYjwAOwkYZmeZ5Mq855vwKl4zVFKIq8z2bVrHIX9YOSU0X
	SJ+j5WN496Sed8e2Lhm3NCi75sYgrpuWd8i0NmhxwW1tW0yNHbJdlVeIrlUyDJ5D0KpmBbDIEe5QW
	E0eSnq/21JD1JwScdjcUqdQP9B/x5HxMjMZU6ao8yljM9F0uY1cPSWRshbfbMeBmIv99PLzhDzewe
	MqQ5VB6VuyPCdVsWhX7BlXjn/yBxWVeWsZw6e7qxf5p68ghP2jSJ1QlHylJtFN8klFNibkgyMQ20O
	ShU5h2vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u502T-0000000987N-1QKl;
	Wed, 16 Apr 2025 10:30:41 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4y2S-00000008nfi-06ln
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 08:22:33 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-54af20849bbso7998895e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 01:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744791750; x=1745396550; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KAQfuUf83ZQ1MK8Cm8aM+n8tf7t8e38c8JTgiG4heGM=;
        b=Tnfnhlsn9h0aLk2p7s6eEKy43RGPFPL+/35W5H7LIhcSlsvX7j+ACA625Dh8m0lda3
         Nh1lISIx7RPbfr9f0gXhUh1XbVHzwReJma5ZfsJ/p2lzjS6vVSBhUxhkxp26SCuIz85I
         UXlgrE+gs+mx5iozS/CSWnUHaIn5OiVn45IX9+aXFW5pA/3W0aBw15MAu/GpYPE65b5I
         +qcfpG2SvkcrjYIJnjDfg1EyYX0zncTuB+wOrjvzzSmXQJ+EZhLAesgN7dSYCl4MaARY
         0ZL7a5KvUtFYhyIXx+E9HBzwFPU3BxOe1YlB9vCndohqhrxmrg5hLzELewj9x872F1u8
         HfCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744791750; x=1745396550;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KAQfuUf83ZQ1MK8Cm8aM+n8tf7t8e38c8JTgiG4heGM=;
        b=hxkFNBmcfBVBNbHKgKgnWE85a31AXp7caooUdPCcbKgSzdQqSusUPTjYnSOZtVY2rw
         YB23fpVo8L7gD7K6hRx4YEP3ENhjdp/cMWe8JcQknRXoXUH1ieiJGv/kVh00pbAw3Xic
         W6ItHi3tjrYEW/WXuQ7SjJ816oZUyVoQxDSJSYdTZ9vJHM7dX2kkRlvHSdGn20wy+PgL
         vC/YFogjIOKxaf+X2AzSqwnPdo99d4pro8Cd2iYtYl8S95/dzaV9LCV9CAOya2VfYagA
         qVRKOU02m8gsU71CLgtLATfiVlfQ9LN6IF/MZCFpkYO/BiJ8pn+JwVa9Df07RQqcQFEj
         FWhg==
X-Gm-Message-State: AOJu0YzSaWbpj+KPovnYnP5pobTH4Hkqr+KaIo5ed76YllltKql+perp
	JBiFpe6h7LI6VHh/Tjukp1cPXBnchEZwzxNp8PEeX1YFuMvVx8l0
X-Gm-Gg: ASbGnctTBfkJEhb4EqxxJCmJFKE9l72MyePrMXsAGQ8BbzICHe7EQiJMeNycVz4aocM
	AnMY7unCA5/JwxqlaZ1scOr2l+brLeT5ZSYTRT6vVs3UNJtP4DUWQpW8eWPeeFjZDXjQibyqNkC
	rDtz+dQ8fOIr/BzsYyP7bmSL9k5YNqWiArkp7AUWMJA+xGlv4UBwxfJPIi3UrQmzxotemHgWcdF
	5lSqRdAy4z7gipKT2ZElHI07hb1UuUmcSgWQl99ArJfNk1gb1yWKEFZaNJkRmqVpWWaM312ugJH
	OaE8NHHzbukF1AVumIj690jzRFg5ZvLDxzF8R5P7TXKbHu7kwbQj
X-Google-Smtp-Source: AGHT+IHptCVJ3TcfVK+g8FtWiw6bqjgdng7HMYdACiNudswsAqCBHy7UbnLsHd9iDozfeXymfzbCSw==
X-Received: by 2002:a05:6512:108d:b0:545:2fa9:8cf5 with SMTP id 2adb3069b0e04-54d64af4268mr299099e87.49.1744791749775;
        Wed, 16 Apr 2025 01:22:29 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465f7b20sm23025391fa.97.2025.04.16.01.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:22:29 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 16 Apr 2025 12:21:34 +0400
Subject: [PATCH 09/13] ARM: dts: vt8500: Move memory nodes to board dts and
 fix addr/size
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-wmt-updates-v1-9-f9af689cdfc2@gmail.com>
References: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com>
In-Reply-To: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mmc@vger.kernel.org, netdev@vger.kernel.org, 
 linux-pwm@vger.kernel.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744791712; l=5773;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=BmJUD5nwuKvbGTiRZP1tJM+KAwHk7jBLkGQf5lDJmTw=;
 b=B2fRvaOMftmj6JqZFXsv8NqfER23Z4+7JRZ0onR49K8P7sVtgran7RY1mUTl9T4YzngyYido/
 kkWuByJssLDCrVaUq082RnJYMgWkWQmC0+kspWxYA7p5fGHYZ/SlhTT
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_012232_068630_47F71118 
X-CRM114-Status: GOOD (  12.87  )
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
index 1138940ce16cb8603d196b6e935d54df53b9a229..143daf983d1d926c2c837c43002d1a86cff3866a 100644
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
index fa76df2830c79a695753c85397d4e916592f6a51..69d2351a81dbc816efd19ffe3ba5ef80eaa4e9dc 100644
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
index 5b6affda3b6b8d8be9f3100b36cb303d015f19b5..deebe9b933876bc1eb188f82ce8c1c17098d04a2 100644
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
index 14e1d4f7c093a8ae9cce5acfeba3755f6df93a24..bde825b59074eb74af4ab296895a3968e992aefe 100644
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
index 3f4a514d65e2ac7658b73cc9c4f3cae1407265bc..e8385c03e04bf5644c86a85aeb41e1cc1eedb202 100644
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


