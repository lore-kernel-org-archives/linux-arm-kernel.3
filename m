Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38BB5D59D99
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 09:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2bGUzMeLW/JozQ7jHBnhOnIeY8glII+n/t0VKsxF74I=; b=hB0SbFGM9pvHrRixLkoI3q0pAg
	XFydyoajcJI3H/ywH1BQpIdx9LKkSt+QseoahUo0m6iE5Dg2GdGrV0x4TgyRoU4HT8w+PR0GJDEQX
	JJDzHX4HKSWj3EgJ1524AUfv9jFy/VRUgICFBr1hxK4ba91Il75BCqIgMrVE8CS+to9o3lTupRKcr
	NvDNqxtBLOIyiQbQxj6mtMEzZNg+9+eO74PlsIh+irKd6/F3Oxi6zE1VHmMp1lFZkD0iGDVL+zwV+
	zl2vuQBB1/5H7HtLD9qrIWeJE3r7bpfWumAg8IzmSqroN9e9mftyaAMqgug1x9rMh+AGnsFOzEr29
	ElDgLzdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV52o-00000003Nno-3Kcr;
	Mon, 15 Dec 2025 09:39:06 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV52m-00000003Nlc-0LMH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 09:39:05 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-29f0f875bc5so42697565ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 01:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765791543; x=1766396343; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2bGUzMeLW/JozQ7jHBnhOnIeY8glII+n/t0VKsxF74I=;
        b=KUoqXilkvVfnToV30A6HIyscvxY2QOB+ySZPTMZ58tuek2CnS3KR+kCKo3ex3YP5ew
         fhpmbd/GDCAXWUkyG3lIFqPqetmEWeAVGhdJk3/YPgMajoOGeSUnVmeWsnZGj+hb3UEH
         vRcveB2Zqai1OgK7JkOuitYAoLF1PEGVWosj+WewzaPk03LZiSCN74yvcgv8yowb3mMf
         ckDc3H4tvYDRVi0TavLtX6dy4PiIvM9qSaE9Lxh+LB0Twh1peGVnw2HBzSNG1kp34+7c
         3nMfXza9Uhe7OU4iWjluoldsnHN6nXDFbkk8h5TIXnCfOvMFzJ6d/G2MrmYeVjaI+uoL
         CpSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765791543; x=1766396343;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2bGUzMeLW/JozQ7jHBnhOnIeY8glII+n/t0VKsxF74I=;
        b=t220Gciv363rifLjnw6Brf9yRSe/tSQY6jSQvNxSgAwtxAdg1b+aaBs8cyAwM64BGV
         8T7XUciJuFKtDD/oB2odiFvbwL8T2ccSRiB6gcQOf77+9jnmVkoAMwdLIql9QosgBgG5
         cOOscvRiJELCIenLkEG7IpraPYE+mGR69lkjOUEWHS/IefO63Z3yr148h0NuFCI5i5Db
         2b8WaeVL/jllat59mDw/Hych5FLz8ssdNU002ty8kTUYC87VsgDAz17iCg156TSRvFLn
         8ksEOEL3AchZsBZZYQjpAyDUciBuS1uSCK5WXDVeDjICfk/U/VFWn5AOWf/9e4AuZaXz
         lYrg==
X-Forwarded-Encrypted: i=1; AJvYcCUrdXqYMIBL18uBnOQj6scMzqJlVRqAALI7rSYZ+R44gnjThWMv1QKsQ9zSkNvc5uGN1lmvpHSw2pbOc5H7GL+F@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5qdl8cUQKR/oka2OvGq0QfayHZcIB+R+DxHfmVoVwqzUqeqU0
	4Hcqw2wGg1oKKPFERklGinICSgsqvevHjMbpr6Reg0QBmr67GUb0fVGU
X-Gm-Gg: AY/fxX7h0XnqGV5qIeGli3fW2HhAHlxjhScM7E5OdEu7Fd4U3iKiY7USKaFLJ81ov2y
	obL9bByoTfzeN7ZE16dNXESE/i2C77G/f0451/5Fgxw40p120W9FDd2Ag1RtKMGS/bdtDvXYKc0
	lfCwO7zpo3vEH5AAS2ACe1r27rXbL3cggVUuGuajddb5PsLwlvsnTe69tiGGKRY5Jawh/W3yyZh
	GKN25K73o0YaQGdWMsx2zQuTe879NVPGClPGTnupm52JWP3ydbsGDm6ZWnlSZRPt7oYLq3VMoUY
	qXNXO+51qfeFNwiIEfU4QUaf6cuQgeSb4VslfDFqdnlaywaaYy+ZffYJ3Dwo6MhxrjSptXuSAY1
	7UkIzYPAz7NeV8vqZ+5WIuPrYcyaa9JGSeh33GRX+cFqz4YRFJSfgXDLmsZ8aRvBlZqUVsNfz7m
	EUl6CsfvNmuFncAoJVEhknTZkXw+o1mDPEgCGTbkpY5uRX7dhwRkPwFRzvMTQz/O2doElcY7Igv
	FgzsnVBkwOa+vvLEGBcbhhsfvsMk9E+dlTGjLxlUZw/L5TxR3RB+/HD++NGlwe+fWldmnfVG3Bi
	oM8ARxP0tEzs1ElXQgyeUYoXcowSVo2F5CgNawTxPeyB53z6z5Y=
X-Google-Smtp-Source: AGHT+IE1ONDmMPxkmeJv8Jcwz9fHIvPtzkrv+UtHURTUiSutUD39OJoEqG9ODwNwY90PRcf4H0q9VQ==
X-Received: by 2002:a17:902:d4c5:b0:2a0:b02b:210b with SMTP id d9443c01a7336-2a0b02b21fbmr55998955ad.41.1765791543118;
        Mon, 15 Dec 2025 01:39:03 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29efd74f5e1sm113017705ad.16.2025.12.15.01.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 01:39:02 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Mon, 15 Dec 2025 19:37:50 +1000
Subject: [PATCH v6 6/7] arm64: dts: apple: t8103,t60xx,t8112: Add SMC RTC
 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-macsmc-subdevs-v6-6-0518cb5f28ae@gmail.com>
References: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
In-Reply-To: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
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
 bh=XqyBBwDw5d8mhE2yQoV9/8OYd4bvzgC4hPOX4wfMNZ0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJn211msN8f2hHad0eiKb84X+hTfnyV7VXJHXeN/+YV9g
 su/PGLrmMjCIMbFYCmmyLKhSchjthHbzX6Ryr0wc1iZQIZIizQwAAELA19uYl6pkY6Rnqm2oZ6h
 oY6xjhEDF6cATHVTHyPD+0CvUyukrZ1/yro1RbnqzLLbn6LQaFjJef3+56CtzwMcGRlmr667zhi
 x8ti05R2ebR0CvAtj48yMnqznmsrQW6/0t4ARAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_013904_140312_399270AE 
X-CRM114-Status: UNSURE (   9.63  )
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
2.52.0


