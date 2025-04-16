Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13A5CC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 10:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FS5uPP+ij9oewaAABDY8TZe9TR0+Gp5xre9Bn462Ac4=; b=Wvirs252ndLbbMu0duL8QzwJmW
	qZ/PpQvsv2xwaSE5V0f2OcVGmdf30kuhZt5jCvXnmCajaaZDbveLuJADvriHF4tkt9CxUlLFftHyr
	EaaqPOV3EMh4H5Xm44KlXisJEiyv6RRMzKHsIFLoL39DJbxcVrfddQ0zYm81WLYw284csyFbP/j8p
	o/xH3xdgr//Rzrf++69yJVqdh9IoJfaVg3Z0ugWUiOpumjfkWNXJtFoZwDKHwBqcaOR2uWB7wey47
	q6ybjxbSfJyjro68A4W/Jzsi3rjqecZQpBAFFxh1ho/NewjA7G1jUVmuUGFr1hjbPaiqSxvbE3r0c
	HP+cYqgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u502W-000000098BR-0YcH;
	Wed, 16 Apr 2025 10:30:44 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4y2e-00000008nkZ-2XmD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 08:22:45 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-30db3f3c907so63766791fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 01:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744791763; x=1745396563; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FS5uPP+ij9oewaAABDY8TZe9TR0+Gp5xre9Bn462Ac4=;
        b=ikiJmdBI4MNN8jxJIbeVQaLc1uBA74ag+kUSE0kFRrVXZip/3kMatFTKxuYF65ijF4
         1yLET37GBrvoSgbhOzTTvyDQ4MO0ucTIdNGEQBWYJKO6U5mk96Dn63bjGQy9ZPGnStLB
         Vl67tJnDgrILQ92V4ogBILj/BmSolPT9aiBu5IaBgskzeqeVdqsWqw7s37Ik4BtivPZP
         W7gMeRZ0ib/UTHPRwMjFiFE1TzNre/a1KSIzV/5QpPwgVnhOqYTKyhTQZp/+SJm2umpf
         jsts/jTRmAkV0Ym4Qe82hGHNG8F6+1iisiIj8mEvpKkn7FebuH2W8kE1gWCD+6vP7c4V
         W9FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744791763; x=1745396563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FS5uPP+ij9oewaAABDY8TZe9TR0+Gp5xre9Bn462Ac4=;
        b=TdFgdb6FEkbn93Avmhv9ntOV/CCg/zWFBJnv/nT2aZ0FE817zfU3Opp5J7kWxfSDx3
         xxlag/+PBLmMy40CGuSMLGGsZcv7zmVGgutWLuo9oTIrfyT1u3uNy6GhyeNvk3tuDy8I
         2dC1TS2LGWyoJl3ZqXWSLidchdhBRrMujvoaFJTmb+hB4ZsbuJPzdj+S2rF38tQZyGcW
         kcO8bd8fQly4CtNwU8PKBQMZXpiy2PLoQkhAv/zqmudnMXwTZPn4y0IkTsDtcC8UGOuB
         6C/6aGRPm1YGBQPLwSw3227QQaMt9PIvrwGTMJVMjXEq4DWBiEc84BwktofXYWcwwVz5
         O0Og==
X-Gm-Message-State: AOJu0YwPCoZCAm9TIYaPJwlUEK2udDnN1SJXu9lm+LiQieKNM4n809QP
	CiR9b8qeHfAkxEbokgNFYZYJGUlEJv62DCrGVeKEeoOgt178g93W
X-Gm-Gg: ASbGncvrWFdKrFOXIu4wiAHv8U3Ko4dNjyLIucZA2ysezOp4xFuo7a2O9oZ4Lno91OC
	v+yv1fdd1VUB+hWDde/KyMnZMpKbWWOauDU+9feP+t9BCN8hi/gXlA02nzY/IGbNmMo0d/It5tM
	w/es0HUngaF0IlrwoKRcVwrX2sLZmLxDIGzLfgQXQhJv/cAdCLdkrrOAS1OGlp35GxCwPeLW6tE
	z2tHQ6my/XlwrTf8GLD/xJ4PCM6y8wCB5h9Eub0AAhbOdJJJJ+YkmcF8dmStNamgDIjMrl8iq/t
	bGlcEzVgdFvg606JwjNtXiND4oRNtTs25WV08QnEqP5QEwO8KOeV
X-Google-Smtp-Source: AGHT+IHPeVBmX5Vqd+spNUAWjSoBPV5YuATnfOQvkQdVvOGLDQQOmBTgQaBeDe7nS2HMTs/0Pcb2LA==
X-Received: by 2002:a05:651c:158d:b0:30b:f924:3554 with SMTP id 38308e7fff4ca-3107f6ceb59mr3528241fa.21.1744791762861;
        Wed, 16 Apr 2025 01:22:42 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465f7b20sm23025391fa.97.2025.04.16.01.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:22:42 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 16 Apr 2025 12:21:37 +0400
Subject: [PATCH 12/13] ARM: dts: vt8500: Add VIA APC Rock/Paper board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-wmt-updates-v1-12-f9af689cdfc2@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744791712; l=2596;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=TZ3ytEYMytA7e0tV+PnpKqiq4sZdXQ+N8pRmsK98hNw=;
 b=HD3p/YZ1dwkru1Tiqb4TUgeiFPeP70kS2kSj0M4pn2zzpXtTY9j+s8Xw5YZ08y2qcMhKeKIXl
 Lq+cku1FuBYCfdxA5yTGL410gTy4b/dKbiVUfRlvJFNi0ZVjNnpVXHq
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_012244_651017_FD5823BF 
X-CRM114-Status: GOOD (  15.94  )
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

APC Rock is a development board based on WonderMedia WM8590 released
around 2013. Paper is the same board, but with VGA port unpopulated
and shipped with a recycled cardboard case

Its hardware includes:
* Single-core Cortex-A9 CPU at 800 MHz
* 512MB DDR3 RAM
* 4GB NAND flash
* 8MB SPI NOR flash
* ARM Mali-400 GPU
* HDMI output (type A) capable of 1080p output
* VGA output (on Rock, but not on Paper)
* 2x USB 2.0 type A
* 1x USB 2.0 OTG (microUSB connector)
* microSD slot
* 10/100M Ethernet
* Combined headphones/mic via 3.5mm jack connector
* Half-height miniPCIe slot (with only USB 2.0 signals)

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 arch/arm/boot/dts/vt8500/Makefile            |  3 ++-
 arch/arm/boot/dts/vt8500/wm8950-apc-rock.dts | 21 +++++++++++++++++++++
 arch/arm/boot/dts/vt8500/wm8950.dtsi         | 11 +++++++++++
 3 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/vt8500/Makefile b/arch/arm/boot/dts/vt8500/Makefile
index 255f4403af91c1d6a22416ab694b8eab44bf98a2..c5a2e57d53af4babe40fe2d79b2f8d9c1ae1b8db 100644
--- a/arch/arm/boot/dts/vt8500/Makefile
+++ b/arch/arm/boot/dts/vt8500/Makefile
@@ -4,4 +4,5 @@ dtb-$(CONFIG_ARCH_VT8500) += \
 	wm8505-ref.dtb \
 	wm8650-mid.dtb \
 	wm8750-apc8750.dtb \
-	wm8850-w70v2.dtb
+	wm8850-w70v2.dtb \
+	wm8950a-apc-rock.dtb
diff --git a/arch/arm/boot/dts/vt8500/wm8950-apc-rock.dts b/arch/arm/boot/dts/vt8500/wm8950-apc-rock.dts
new file mode 100644
index 0000000000000000000000000000000000000000..58b3c8deb4f20ae072bf1381f1dfa5e5adeb414a
--- /dev/null
+++ b/arch/arm/boot/dts/vt8500/wm8950-apc-rock.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2025 Alexey Charkov <alchark@gmail.com>
+ */
+
+/dts-v1/;
+/include/ "wm8950.dtsi"
+
+/ {
+	model = "VIA APC Rock";
+	compatible = "via,apc-rock", "wm,wm8950";
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x20000000>;
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/vt8500/wm8950.dtsi b/arch/arm/boot/dts/vt8500/wm8950.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..31fba05d3c3e70b21a64d08b5cdf645102a1faf3
--- /dev/null
+++ b/arch/arm/boot/dts/vt8500/wm8950.dtsi
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2025 Alexey Charkov <alchark@gmail.com>
+ */
+
+/* No differences have been discovered vs. WM8850, but chip markings differ */
+/include/ "wm8850.dtsi"
+
+/ {
+	compatible = "wm,wm8950";
+};

-- 
2.49.0


