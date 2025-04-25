Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F306C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 16:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+tWJq6XlOyiQDY9fEz34q6TpB8T/RU7UR54sdkDEpSg=; b=NEa7/WKed2akxtwcZhWpDNIi4c
	tRgQE8GSbx1D2MRsezNh/h4rCPk6Ccv55kJdSEq/5DJ4eWNFJrjxJN9QWLdFH9xg6T+Gt+I+nzWYT
	3gBPq2ZaecoC2hdaYwjnUhY4LCCOXdvPSbgujq5GMR7ZDwL6tT4NOayZzOsaYRNjGyAWb+X+2AmgI
	ia0Nx07LrWZaCmQMjqz64ux5N14k5frvOSCtkGumvvSo03E7QXSyQjCnVRLxFpTKNhQSQyPmfbaCg
	7KVij9Kpd9avDczWw2TX5N54p1+KvamvaGhcSOukyVj7NDLn/AxYAyzmrAshewwRdVnY8WZCsjUHA
	nlzL0I1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8LlW-00000000BJu-3KPE;
	Fri, 25 Apr 2025 16:19:02 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8K8E-0000000HS7e-0t3f
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 14:34:23 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-22d95f0dda4so36333145ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 07:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745591661; x=1746196461; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+tWJq6XlOyiQDY9fEz34q6TpB8T/RU7UR54sdkDEpSg=;
        b=Z4pKulNvDzVReIeAObToTB8l50iQAQ7fT9eBT8ubcC0Imtl+3cOLlLkfeYOvOpt8Kw
         CLl1Rl8ZDL/b4FN1EfKx54FZY3k3Js8PbNgmL3iQM6D09FnQY6w4UvCS7sEkyET5Rc99
         5ANCLXlkjL7ei9/nPWz+aUZHlJJXl3g0K8UkBqg08f+rSV22UJtHZN+uE8v7a/Usg4/c
         tyN5X6tW6UC0uWGFDR7f6v33vD8jW4qrlE91IzCacsRQ9oVHOWLW+llp3sdemMmJOThu
         luD1OiuX8QdC5rUdtN2BGHh5Icc6thBzEigiEIQa3ga9LuxKRb7rsjL++ry6EQTwcIIi
         ddwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745591661; x=1746196461;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+tWJq6XlOyiQDY9fEz34q6TpB8T/RU7UR54sdkDEpSg=;
        b=UhAMvDa7WBMzw2/r56ThnAW5/Vw19KfFuIRy+9Nvmp+WKF830Lc6hjZazoio72nc+g
         aLn7lIYmv0DhFrfxLbGFNKVo1t2Hrxn7+U7Ld9BJ4HcGERRLAaLDU2TM+lbSHTyNSi5P
         yJtXAA7SYiCgX8NxEyewJ2G+iLBORdJpsqA8VVgqQBf/5gUdlDEVgpx4WZPmVamNJW1m
         g7gfpKeHdLhWmjykyafjkovmb2fG1DCzZJRKdcLD0tVXRRIIp67myhDbx2aAilGPsOuz
         Z3PDlfm62OqzRPoXhq2lMp2Y4/bo2DtxfucfBftDHC7/TbATod7uJlM3saHMR3rOTv98
         JLRw==
X-Forwarded-Encrypted: i=1; AJvYcCU0t74NefiGvRgfStuS/5rM1f8fpDuPmCJaP/5DylWCJLutNK9meydOmbixg6JpyXP1RsJ4EeiqfPqoANkzd5dM@lists.infradead.org
X-Gm-Message-State: AOJu0YxGCl9AAi3of6s+zVyuC8tsfl7dlKj7yBJ+sN45Op80J3fQF09Q
	j4uBznH6RUtDWLNjo0ZgyWyk3vqnMBOlo9k3kq6ON4y9OEgmTvtS
X-Gm-Gg: ASbGnctcKq5v1J3HEV/c9ALQe1luNJCGzgPVRkt1HXSYqD7zCQKCamShfujCdT5X8JI
	A2Nwl8kynI4WlKcmWqih4sitGdTr82aSR46C8hOQ6354Ff/FydRplXXbdzt2ton7VB7YyWDY5FR
	bTv4UP6w0EwkMLYoSsaXvkUW792vdjvYAv2TSv7oSwQTeh9ZbcrchlLW5DNCOw2GtczOK1S0mpX
	q7rnYdvyfl3kmZ2H3MfaZIYE+Cw0xee8ulyTisqdWk4gAD8jZ+66To/s9DofQYt8v8kLYhyhvw9
	Q7tSi8vh+v1SPOIoUPQJODR37M+Z8HiQa8DgayQbbGXfX3AQZSEq
X-Google-Smtp-Source: AGHT+IEU0GV52aKMbgW3P/kjXtOrQ1JtVfrrWBFeROicqQ5bV8dmN7cDixmkQXRl7zWJEGMK+bSwLA==
X-Received: by 2002:a17:902:d2c8:b0:224:10a2:cad5 with SMTP id d9443c01a7336-22dbf4c8508mr41907325ad.10.1745591661178;
        Fri, 25 Apr 2025 07:34:21 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5216c35sm32860695ad.233.2025.04.25.07.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 07:34:20 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Fri, 25 Apr 2025 18:34:14 +0400
Subject: [PATCH v4 2/2] ARM: dts: vt8500: Add VIA APC Rock/Paper board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-apc_paper_binding-v4-2-0ec2d0febe21@gmail.com>
References: <20250425-apc_paper_binding-v4-0-0ec2d0febe21@gmail.com>
In-Reply-To: <20250425-apc_paper_binding-v4-0-0ec2d0febe21@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745591663; l=2603;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=dxmjWywiK0Xyl1oGWV/pydlU53vhd1+AcfgyENDB0jE=;
 b=sTNaqM2U+dP1CoAz8PAv3Jd62z7GBeFLFgjCyco+k8uSfsLW3hshOnAwbkJcvqd9QcgZ8c9io
 61Mc7w12CLNBAL2i7Bkm3gm8NcclYY/oRWxBhXxTagW5WgBJoXagIHp
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_073422_253639_C29BC92A 
X-CRM114-Status: GOOD (  15.32  )
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
around 2013. Paper is the same board, but with the VGA port left
unpopulated, and shipped with a recycled cardboard case

Its hardware includes:
* Single-core Cortex-A9 CPU at 800 MHz
* 512MB DDR3 RAM
* 4GB NAND flash
* 8MB SPI NOR flash
* ARM Mali-400 GPU
* HDMI output (type A) capable of 1080p
* VGA output (on Rock, but not on Paper)
* 2x USB 2.0 type A
* 1x USB 2.0 OTG (microUSB connector)
* microSD slot
* 10/100M Ethernet
* 3.5mm minijack connector with combined headphones/mic
* Half-height miniPCIe slot (with only USB 2.0 signals)

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 arch/arm/boot/dts/vt8500/Makefile            |  3 ++-
 arch/arm/boot/dts/vt8500/wm8950-apc-rock.dts | 21 +++++++++++++++++++++
 arch/arm/boot/dts/vt8500/wm8950.dtsi         | 11 +++++++++++
 3 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/vt8500/Makefile b/arch/arm/boot/dts/vt8500/Makefile
index 255f4403af91c1d6a22416ab694b8eab44bf98a2..6fd29c41f3660d29d0368e4f8772d46b0a3c414c 100644
--- a/arch/arm/boot/dts/vt8500/Makefile
+++ b/arch/arm/boot/dts/vt8500/Makefile
@@ -4,4 +4,5 @@ dtb-$(CONFIG_ARCH_VT8500) += \
 	wm8505-ref.dtb \
 	wm8650-mid.dtb \
 	wm8750-apc8750.dtb \
-	wm8850-w70v2.dtb
+	wm8850-w70v2.dtb \
+	wm8950-apc-rock.dtb
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


