Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE913C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 15:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y1NlfLag6cXRAi1RREWAXx7+nFLb5S0lG/vhce/4QOE=; b=wGy6+8QicbSLlMo5Hm+ba6QyyD
	l+8HWqmluMgmDyMc5oIY+VasxRnOKqxSRehfu6CnDeFHA7yY2iQbaM0sNX5HaiUvwvwfGJlqqwfjq
	3kSrLODVP2ul+CkjKB3RaSZSfCEGk5hbHsthHAKClhih/oXwEJy/HJWq4F0kAL/7YhPNxB7nWkvmr
	vO3TLSzjYN3dsnBaA+dGEZSz2wGfxuerNjf49vxFhIn4VqORzouIFQlCmuCvNxtBBiCac87qUeJ+y
	esrwxRaji/hf1a1PIpluk+hkJ4ipNAtDG/+DpicCZ4HGDtxIB0XawXM5exvdwskuO0kPSC6PFeD9f
	2qoPqbJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl8tC-00000001hMT-32Z0;
	Thu, 20 Feb 2025 15:55:02 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl8q3-00000001g2A-1uDS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 15:51:48 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-220d39a5627so17445875ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 07:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740066706; x=1740671506; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y1NlfLag6cXRAi1RREWAXx7+nFLb5S0lG/vhce/4QOE=;
        b=lxCmxZNqrfTby+z9ybnP7+E6rnlraiQqNdqRro/+N2Jzd9j4NKReND4PHXP/SQgkb+
         VZ7f1pTHI59jSyph0dV2/Pauo6O/FKY5aY6/lAuW6NSV/7jw0C8vdQk4Vx7BVOQu2qrc
         akyl8bH94vttVKbvLg67Qk2SXPtMZgFfjaMXrervwpd6LKjnCm7I7SLD9ybUxf5Ko4V4
         Y0SyZ5APZWioH/bLLnRQAnQx2GaxgVTk34Ec+/PqETkuafHSO1gRzobC5ZtR9KsLDl6A
         fBI+lypbyG0Nj+Px/GlMowEp+GS09x+MJCoC8WQjt7QBCX3y+EJQjrmxftPyWiBgjyQ+
         Kpnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740066706; x=1740671506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y1NlfLag6cXRAi1RREWAXx7+nFLb5S0lG/vhce/4QOE=;
        b=EQDzKo7ENLQu34EDepJ7tptp2kBls/Aw7hHcRGadRDih7PZljJcPNmgfSraZa0dUjK
         NMrRWd7/imfTZQgF7Qhltq3poZqdMflCZ8rdHblLZtOJ66NHLskF9KWxt2XHDlgGvI9M
         nKMwr6kpfPWS0BKNc5lN1jq1qtcBYC9OQj5vStH0hjweVsByOcuZvYlWT4CkZ7/vF6Ot
         cNCSUmXNdEgz5abM1uL/ztp2bQMKLUw6ty9GHEZ6LfzL4swex+GjOB5CHEjmpmBG6XTV
         kb9/wqjSzbqyj3vAJFIr+z60tmD6wMJ0BWKpUdcVbZnd1DJsyiGGYMVu86i22cJ2yZTK
         7eKA==
X-Forwarded-Encrypted: i=1; AJvYcCWtyG5psfe3tmW8GM1fkY0/hesLS2P3DOlo2hNyhU+t5hPNYHMacterVg9ydJkTSD6GPz8ODfG5BFSrp2HwlXEU@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5hZIJLzdi1l9qqhLJU6CUxfRQQJvXIS2LkVJL3BIUboTZwEbs
	eON0HZFT3KAyaHL8gFpHYODgO0TnTWg9PmeycSP+47NEzkizK5kNqFXC8A==
X-Gm-Gg: ASbGncv7PU8lzLptAo4GQe9As3zmd3IsGT7Gaost5nP8tigIDfNy6FkRJ8lop5n/A2O
	e/j7Q3S3N6SSBK9KbxICNMTy2/8wTrbOJWn6gNBBNaY2dbM/kJtE0YWM9iWRUoUXJ/S47ieM+Mt
	DQJn0T6LCoj/jntNOQTtMAXJ5l48FtTsy5rWntjlzvkPeufpSvRNcL0jUUsBwzLF/a4M5X5sqY6
	ycXFKg5btM/eBPRVGsfi0V40rd/hwP1H36FzXZwy7t1MlX0LQ3mcjEaXN4C/LYJ7Jmj7B2sOt8O
	PHIU7KEzeBXbH2G/fQ==
X-Google-Smtp-Source: AGHT+IF5nb3qL/RD7OyYRMOZ8L+tw+d0s1Z5Bw8xKRR7akur52BeX2LWZzmSm2zFJMw6MwCvDDyQjw==
X-Received: by 2002:a17:902:e5c6:b0:220:d256:d133 with SMTP id d9443c01a7336-221906111f4mr36757955ad.14.1740066706443;
        Thu, 20 Feb 2025 07:51:46 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-220d5349019sm123694345ad.36.2025.02.20.07.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 07:51:46 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 20 Feb 2025 23:51:03 +0800
Subject: [PATCH 1/5] arm64: dts: apple: s5l8960x: Add backlight nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-dwi-dt-v1-1-d742431c7373@gmail.com>
References: <20250220-dwi-dt-v1-0-d742431c7373@gmail.com>
In-Reply-To: <20250220-dwi-dt-v1-0-d742431c7373@gmail.com>
To: Janne Grunau <j@jannau.net>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1482; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=uDPmflVJvnxOB1rw8vcGbu46t3L1/i8a/zN5ANyYz3k=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnt0+MO0zMTpQPauB/DSJytq3Q1Jtgk5jzXbhik
 yG+F2AiJbiJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ7dPjAAKCRABygi3psUI
 JPYbD/4uMyhSLygzQKP3tRNOkXR68uKYdbWUne6RZKdORb8nRY6IDKTkSHm1msNt+3k6yCSnY18
 3WYKTs02Dj0qFtD1EWGQBjbrFFUg5HopoF+bYSITupj0EX/9XO3Ln0Z/nkc0pOWNj+HgXwF21xK
 +tvU1iH9nQklHoHgCRUA1RtQKxUjyRUg5+9zukwWwdz1Fq3CNswD49chIwhje5kci8Z54BrJLeR
 hRc5uUTHy35LPKBrXnUKfuQdboR6+0aRrP4FYphRKYB7zQp1HYR+Hvkg2b+a8XJVCoNpAWeQHWQ
 koMKbIaVBljKbT0XATmTdDnSeGjMAk+gFqUK+IGNJ1CrcUnhVomiasZ9R51uZod/AH227aM+Pnr
 2pajZ/GeiI3VEj5abSXGWSlumLfhVTi56aTRuBMPNZUOysKiHZkTjRFoaT129KEjk0TXp0MoJzS
 auCiQgY9E7vcnHx2tyNj90Jcwoy7ighwhD/kdKjYdqBHfNAztGL1tp/h2AJQ5iwV1Rr/6ZexdKF
 A8exgNFmdJTYT2aKbiNMx4NbnI8E7x9JFzPQbbznmFKtuateNcN0MSfGzKpiTekh3Vf5inajGwp
 uuVlutt0uOYqJftBxvwz+ZaBxIdxSTmRZ+Q9yA2qrRYBdKrFHePJZi1qw41jqItp9LoepT/3SfE
 7IpGjYTS/CDB4RQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_075147_513878_C4D0AA32 
X-CRM114-Status: GOOD (  10.58  )
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

Add DWI backlight controller nodes for Apple A7 SoC, and enable it for
iPhone 5s.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi | 4 ++++
 arch/arm64/boot/dts/apple/s5l8960x.dtsi    | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi b/arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi
index bfbd2629e206736822a157431ec959e1aa70f41b..8868df1538d68595cfe92c80b1fcecee42d348df 100644
--- a/arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi
+++ b/arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi
@@ -51,6 +51,10 @@ switch-mute {
 	};
 };
 
+&dwi_bl {
+	status = "okay";
+};
+
 &framebuffer0 {
 	power-domains = <&ps_disp0 &ps_mipi_dsi>;
 };
diff --git a/arch/arm64/boot/dts/apple/s5l8960x.dtsi b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
index 64dbae5c73515bb6a1651b9b26d349d0cfd0408a..b109a1e7fcdad4ee3caf0efd2c56d76c66706e9e 100644
--- a/arch/arm64/boot/dts/apple/s5l8960x.dtsi
+++ b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
@@ -100,6 +100,13 @@ aic: interrupt-controller@20e100000 {
 			power-domains = <&ps_aic>;
 		};
 
+		dwi_bl: backlight@20e200010 {
+			compatible = "apple,s5l8960x-dwi-bl", "apple,dwi-bl";
+			reg = <0x2 0xe200010 0x0 0x8>;
+			power-domains = <&ps_dwi>;
+			status = "disabled";
+		};
+
 		pinctrl: pinctrl@20e300000 {
 			compatible = "apple,s5l8960x-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x0e300000 0x0 0x100000>;

-- 
2.48.1


