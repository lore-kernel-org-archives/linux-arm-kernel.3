Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C283C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 02:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ZxCy7mrct22eBjkvKCaCp8i27n4yjdKKChzB9Nlcrw=; b=Q2ktjIN8TwY13hpGcwbSG1Qzpq
	YmHM/LmkP/ZyAszokbYK+v1INwXtanF9prfeCMWWPE2+8SjoSeDQKc9/DBtlH9jSq+ORC1N3A/xzx
	e8dnlPKN3l6TrNhiYdcMye6dllBfX0B+Gts2BtV+PH59lVPlHMHyJlbbJql4IwLNXQr1EVpkAHVNr
	4uuMcC7tp+9aohasbWAE+cPRMQ6qmXzGL/GeI2Tqel+MMelzwOmPw8rjMoGE+Rp/EQrYC+X0oamY/
	flC8+kV7G1s+zKily7SIzoYX3RqNW/0M0u9cLvjJ8OXJexM23DQFt2Ubf8p8sQ2/bmkRzdQlhovWR
	QSTU8//g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCUaf-0000000Duez-2hmU;
	Wed, 07 May 2025 02:32:57 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCOZG-0000000DK8z-3gxM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 20:07:07 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2295d78b45cso80104865ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 13:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746562026; x=1747166826; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ZxCy7mrct22eBjkvKCaCp8i27n4yjdKKChzB9Nlcrw=;
        b=deYroVxlxeBy2YiqU2Y7qItpiR8PCIddpcbKH9Ah0ALc4N81Yn9dg5Pzge/UjCgS29
         tdDWY/xbN7c2K9CKowwafOyyf8yNlOaSU2W46NtL8D9VlcbfN7gslZUciDWmsr+LvUbt
         AVfgd5FGBplkl1YvhF1rwibXoDDMuB9h4mBbziurNZCXCE/Qr/uDmu/rjKu85xAsPTo1
         BytzWWf66Hts5pdAFkv+nRbeHdP9AjLWQPq32wEbzdTaoC1FLJJ2c4Emkhsbf59pOwvw
         lZiPbYB7H0Pl/4KIHIKCBnrtfjTvK+Xognc8ZzSsPOxK6kV67P9t0oiCPsrFdUVP2MZO
         X3sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746562026; x=1747166826;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ZxCy7mrct22eBjkvKCaCp8i27n4yjdKKChzB9Nlcrw=;
        b=fyUvbHds3QPupq+ce0m7dhrI4rtbKUxmwN9BFVia1C6ZkoMCjKstaC7scTslPBnlGr
         mFPDYcuK7oahukxx5rQLuVIFi9AAHd3Xlmxp6/Z3y17Jybd82I8QHf32Ct2ItVk0vtGs
         JA4/JXi41x1/2b68GS4IuyY3ft2/cqoDV8Kjo4yN329JNnHckaWeGL5BE+saWIGCEPvB
         3XDWkh3Okb1H2IH3wU4eMTObcWIjtsLtdwpqoGVLBpGJkCvs6320cIesKEWEz6mmn1B0
         2etcsE38IB7dB8hE668AHfYgHwW/5muXzgvqwsgAEkssBzMssazGJwYQgBU+R52fOMP5
         znmA==
X-Gm-Message-State: AOJu0YwoLcExoqF+pBitQp2iTUVjJaMg9qUGUEwTiuMi6ILAA0AF9kMB
	ujjU8WkscJu/Xm+Bey4TIiW0ilyqeabc47oJh1I+Q7euXRZM79Q9
X-Gm-Gg: ASbGncucPGSDwK10KPCqTPdNR+LU2/jZHhtzb+W9UxbU8yuT/dbrTKbxpeZslkpy3uQ
	+zV8/+nIBsNYWcRwEv+uNHa4ASMYMfIaTLpZkw7ywOy8Wr97HmOODGNhnV01H8FXQKekxlXKhOw
	knNYsmBS00fFllaym61Nz9IGT3+laoACXVwLW0LOsagsw6NJVrGo5/37NYEgX58t+3wvQDIgFMj
	Lp3ZTmyNXdd8yxtk7AI9NVwWhwurqjL9YfEVLoebU1ym+i6M8mGZqWp6IhIHb/lS8l86ySWKvAa
	DwKRyajY4D2uLUWdfvzvexIIqW00n9tFXOkgimr3JpHZ7pFG+0jS6beMWfJcZQc=
X-Google-Smtp-Source: AGHT+IHgty+nWlNjvTn6uA89Smf4WEwkFQeboQPPyPj2tQrZt5RL3JsInUt016uy2gN0K4G0GCNLdw==
X-Received: by 2002:a17:902:e784:b0:21f:1202:f2f5 with SMTP id d9443c01a7336-22e5ea70a93mr7009825ad.8.1746562026263;
        Tue, 06 May 2025 13:07:06 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e151e97absm78378635ad.62.2025.05.06.13.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 13:07:05 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 07 May 2025 00:06:14 +0400
Subject: [PATCH 3/3] ARM: dts: vt8500: list all four timer interrupts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-vt8500-timer-updates-v1-3-6b76f7f340a6@gmail.com>
References: <20250507-vt8500-timer-updates-v1-0-6b76f7f340a6@gmail.com>
In-Reply-To: <20250507-vt8500-timer-updates-v1-0-6b76f7f340a6@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746562005; l=3301;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=np1yhCpp/qpjWGPuT2g9hwqJ7HuHqaWY+xGRBXC7yJw=;
 b=acj9oqY6ajaVU5Jdm/+NS52srXwXFDErkKw/vH45g0NmZPqUHKsdDmqsG39gjwMEAfZdC+dIX
 Kxa/8yKPuWGBEKPxh2MZY5a0osj9FK/0b0OPvbVxF9Ahurk+TAxBM3O
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_130706_922828_83348714 
X-CRM114-Status: GOOD (  13.31  )
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

VIA/WonderMedia SoC timer can generate up to four interrupts corresponding
to four timer match registers (firing when the 32-bit freerunning clock
source counter matches either of the match registers, respectively).

List all four interrupts in device trees.

This also enables the system event timer to use a match register other
than 0, which can then in turn be used as a system watchdog (watchdog
function is not available on other channels)

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 arch/arm/boot/dts/vt8500/vt8500.dtsi | 2 +-
 arch/arm/boot/dts/vt8500/wm8505.dtsi | 2 +-
 arch/arm/boot/dts/vt8500/wm8650.dtsi | 2 +-
 arch/arm/boot/dts/vt8500/wm8750.dtsi | 2 +-
 arch/arm/boot/dts/vt8500/wm8850.dtsi | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/vt8500/vt8500.dtsi b/arch/arm/boot/dts/vt8500/vt8500.dtsi
index 2ba021585d4889f29777a12473964c29f999f3a0..d1dd37220d41becece5d24fbb19aa71b01723e35 100644
--- a/arch/arm/boot/dts/vt8500/vt8500.dtsi
+++ b/arch/arm/boot/dts/vt8500/vt8500.dtsi
@@ -111,7 +111,7 @@ clkuart3: uart3 {
 		timer@d8130100 {
 			compatible = "via,vt8500-timer";
 			reg = <0xd8130100 0x28>;
-			interrupts = <36>;
+			interrupts = <36>, <37>, <38>, <39>;
 		};
 
 		usb@d8007900 {
diff --git a/arch/arm/boot/dts/vt8500/wm8505.dtsi b/arch/arm/boot/dts/vt8500/wm8505.dtsi
index 99c064c916b2279797f71261ca9306e9dcd4bbd8..2b1819f0c5412648a83cd3eeb495f68d2e4100ef 100644
--- a/arch/arm/boot/dts/vt8500/wm8505.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8505.dtsi
@@ -209,7 +209,7 @@ clksdhc: sdhc {
 		timer@d8130100 {
 			compatible = "via,vt8500-timer";
 			reg = <0xd8130100 0x28>;
-			interrupts = <36>;
+			interrupts = <36>, <37>, <38>, <39>;
 		};
 
 		usb@d8007100 {
diff --git a/arch/arm/boot/dts/vt8500/wm8650.dtsi b/arch/arm/boot/dts/vt8500/wm8650.dtsi
index 0d6c7bd87f7dcce0eef056d04c38ab1de5d52639..042eec78c085d19fc97d7f0f9721399c0716ff74 100644
--- a/arch/arm/boot/dts/vt8500/wm8650.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8650.dtsi
@@ -181,7 +181,7 @@ clksdhc: sdhc {
 		timer@d8130100 {
 			compatible = "via,vt8500-timer";
 			reg = <0xd8130100 0x28>;
-			interrupts = <36>;
+			interrupts = <36>, <37>, <38>, <39>;
 		};
 
 		usb@d8007900 {
diff --git a/arch/arm/boot/dts/vt8500/wm8750.dtsi b/arch/arm/boot/dts/vt8500/wm8750.dtsi
index 0158c0ba5dd110957eac38775d3bf3ebd2ab4154..56342aa1d993a43e7ee766f93151c6d456496262 100644
--- a/arch/arm/boot/dts/vt8500/wm8750.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8750.dtsi
@@ -253,7 +253,7 @@ pwm: pwm@d8220000 {
 		timer@d8130100 {
 			compatible = "via,vt8500-timer";
 			reg = <0xd8130100 0x28>;
-			interrupts = <36>;
+			interrupts = <36>, <37>, <38>, <39>;
 		};
 
 		usb@d8007900 {
diff --git a/arch/arm/boot/dts/vt8500/wm8850.dtsi b/arch/arm/boot/dts/vt8500/wm8850.dtsi
index c4bfb4d30aad0358b39cbf30edf0c63e32167bbd..03e72f28d31b1cfdcfa71ede93b8943971bae4e3 100644
--- a/arch/arm/boot/dts/vt8500/wm8850.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8850.dtsi
@@ -240,7 +240,7 @@ pwm: pwm@d8220000 {
 		timer@d8130100 {
 			compatible = "via,vt8500-timer";
 			reg = <0xd8130100 0x28>;
-			interrupts = <36>;
+			interrupts = <36>, <37>, <38>, <39>;
 		};
 
 		usb@d8007900 {

-- 
2.49.0


