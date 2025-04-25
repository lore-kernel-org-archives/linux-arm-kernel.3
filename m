Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 271FDC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 17:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+tWJq6XlOyiQDY9fEz34q6TpB8T/RU7UR54sdkDEpSg=; b=src4NF7RrLD2Wu/IgjUjnuKHh5
	/BQ1+rS7fXbVnx0awmeFTMnCvbHsP7iyStbCIxkg60qPyv1ckZzDqLafMchJ10j5JbwQ/l4cvgtI5
	enxDLJ7uK7wNLQRRNfibNXhKYLvmSoE6+aW2LtKlvrecBlML8htTeI9HmbJ8gUqgVIFyGyvjnlj5y
	5XdRWhvdD/06NFBkcT+KXN3kfS0TdZ3E93gqiUsbFFgVg/TCZycSqgn0A1GXg+KQf8NA1DUPjgENo
	llni0j6oNwyXau7NrJThuX8srmC3L9Qp1Mh1jhZAMhwE6OKm57vXamh3svpvZrkeHtCS+7C7JP9IF
	WjQuonfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Mu0-00000000OkT-23LV;
	Fri, 25 Apr 2025 17:31:52 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8KZb-0000000HXjB-1PzB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 15:02:40 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7396f13b750so2647927b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 08:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745593358; x=1746198158; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+tWJq6XlOyiQDY9fEz34q6TpB8T/RU7UR54sdkDEpSg=;
        b=WTp/7nhsil2VZlLsp9I4W0Yb5F3RqgMXTduGK7XLbWjPzEGjx7e6vl97C8WnAAocoe
         VknMBIfF9qwr+PYmpNF4zSdCXvZOF3Uw+7X7S0euL280ii9oyWPMA6FUFzFx1VmwObCf
         5d2dYJUc16dkzuOnaY/LnIFC9hrThH9QqB3CufDpnsWQaU83lC3KiF8rnxKLJft7k6zv
         p6g6stQWuVdROvSfunLHHea/NaK5sPtIcwiB2UF1eOL7ggwM8R5q428yJZ7g2Sll5yu4
         z2SpTTJRF2Reo7PZTcFz2oAYPGKjZg83dqWZNpFt8oI6yuX5d6FaD8gsp+vHd65GKoY2
         u1rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745593358; x=1746198158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+tWJq6XlOyiQDY9fEz34q6TpB8T/RU7UR54sdkDEpSg=;
        b=DxfVrqGTL3CoBAe6tGe339/G7HTZBXTkV1HVIe7kaPLSF+YVaAfjM+R/cQDrD39cm0
         HLwX5ITnY74eXiGHUoiffRFjVsr24zi4Rd0pPN1BjS4IzmBooXgx31dhTneyUGpkWMrg
         WCVr5NDlp48Y7pH98m/S296fLEvrd9+7yuoLVBvVQ4eC5hFQR5oYFBymYR4EIPsa936r
         4joYdYr42/cuMPHaxdoLe5zzl+y/Dyqq3kfwahxX4qkxvsR2qNjoEAV1Jy3BQCh3ohUU
         E6k4yS8BhxvYD2Gzg+Zf5yYPsysRgKyxrBSehlhkWGEm4gFBPoFtvAbObOZJN86DlONt
         LSDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzyscux8myPb7H8lJlXTSWicr9Z6dCo3f7nuYOjMZGHDHzih0GJLjurfyOfAA3c4PG6HtB6IwGfa5q/a6wuEyo@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8RbJk1PA1f4A3Bwx/mVf/csUpz360ee5nhyz+bFpsXyLQPU7c
	qEpcYlfUN3lprSFTBX05sjIWIvowfDb4Exo3qao5dejVW7fwOmyjmX0HYcbIjvk=
X-Gm-Gg: ASbGnctlZz/GvGNu6724ZDYQSOHs1KmT4ikHF8QRQSLRaETlRDqry15MK8acmpQS8Gt
	1bJIAUHf2xral3yNQEXWC8bJWQNVSzsaag+ahvM8Hvykh5UyCcdtrVk5IerBJPNPphB4vuh11kg
	slp5Pt7SVwHxI2PSIwyYVorbcz7oRJRcXadK3g0vDAaT/NchniDSD4DoS70TpVAFyoPY8fPhZio
	+WiRfKyasHTLtNrSQvk2/fLCBJn8lIUiOxQ/xDsvxyhjChpGJL7LskYEf2xDvLOUo52xJaUWjEB
	rQVRJPesMiAXfXYrQszFLVhikRkytrvj9FAnPs4JuDCQsQKUJpwv
X-Google-Smtp-Source: AGHT+IHTtYhjS2JIBkQcm0mKs0zc9Y3HQI5vNbYB2tTsjnKaosMTzLOoX8dqIc5SryHq4WGWl8GeJg==
X-Received: by 2002:a05:6a20:394f:b0:1f5:7007:9ea5 with SMTP id adf61e73a8af0-2045b6981dfmr3922340637.2.1745593358409;
        Fri, 25 Apr 2025 08:02:38 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f76f45bcsm2996984a12.13.2025.04.25.08.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 08:02:38 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Fri, 25 Apr 2025 19:02:23 +0400
Subject: [PATCH v5 2/2] ARM: dts: vt8500: Add VIA APC Rock/Paper board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-apc_paper_binding-v5-2-3aef49e97332@gmail.com>
References: <20250425-apc_paper_binding-v5-0-3aef49e97332@gmail.com>
In-Reply-To: <20250425-apc_paper_binding-v5-0-3aef49e97332@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745593359; l=2603;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=dxmjWywiK0Xyl1oGWV/pydlU53vhd1+AcfgyENDB0jE=;
 b=PxBRFd+DlojZ4UuFSxtTkoHa3ihmZ8vGszUhdjVd8fvssBYzBTNSzR87aR80bopVOFFfEd9Me
 g5o2t+bOzVOBu8dOaCXjoXuj0ASUJKLmYVJYYyCBF7GaH7t5CJ6KtX7
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_080239_368655_3A6862B2 
X-CRM114-Status: GOOD (  15.11  )
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


