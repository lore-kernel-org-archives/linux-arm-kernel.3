Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A159C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 08:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ZxCy7mrct22eBjkvKCaCp8i27n4yjdKKChzB9Nlcrw=; b=bn169Fmk/sbiOK/J4iS+fK5qYN
	nZ5bTypRreIdUDQw7LvtnClzG0Oh/ojP8JooSR+wO3jhr+g2KnXWNlOsFDx3x0aH03uSQ48CRia6k
	4EaCQa6XfU123iOEfbIvj9ioofQsr8CJcqIXflJObQ0WEDWIz/DpmYSDVyhYoE3p3+yAcDU8RyfKM
	yLoJHO84/FPLL8hDfW5HZbsy5TZ991WB8Hy7Bbf4CnNeI6yFVRRhovMnPFgEmIEeSvh6Y7BpsCbPq
	HuodRgXdFJiTm8RIfqfdIygcXdh/ltZIkI8nIqfshM56rwHsJfxt930s+wVUbgqwnEDJcHS7bVQyA
	SmWBBXoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCZx3-0000000Eguy-2yGz;
	Wed, 07 May 2025 08:16:25 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCYkC-0000000ERZw-28DI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 06:59:05 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-30572effb26so6292930a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 23:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746601144; x=1747205944; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ZxCy7mrct22eBjkvKCaCp8i27n4yjdKKChzB9Nlcrw=;
        b=ZwT748Z9RjQuqJAwrcp42ra0POEXqlJcCyQIxQ0bTER5Z+YVE7lqebI/P8c+nEC2ZZ
         nXePLv55AzLZWRZ7mkFSMh/wSZW1F2wBusGCSVRMNBNVIeyb29DL1TiQ+9NxSvHdng0G
         VHKx48tt7zpf18oYASLWCq+GqPClyZmlYfqryY8Sj1GyVRqbLuTw3kJfV3gSrPQus5Se
         IcmNWsNBW0pgV+qsV3s1r/CTKHoGnJw+9k0yL1zzo0sdDJDpapIIvCYVYeNiupWLTA5z
         zY+pafcpWPHR2w9DA9juYTgna6uH2RD3cQgxl+rB5CsHatOnj9sBfo3xF2SNmCAGRVYA
         sC4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746601144; x=1747205944;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ZxCy7mrct22eBjkvKCaCp8i27n4yjdKKChzB9Nlcrw=;
        b=WX++v4Q9cNxi7mbFAXYWtePXgRe4OpaZK7EnYpd4NVm2qXdXgMIyLLHKzU4MEDUmeU
         JYP9HenY2X1O1U3F15knxNDu4l/znPIpyh2UMzBeeWPxjRh4USPHmNSot/gRgEo+VW9E
         cvFKR341t5jdpYMM0rjooGASzgVl8ITFHKq+YCe4GkS+jUwHDGUhPJ8ZXWxdMXNY3YDk
         YK8BBlP0suY1yAP2Nytute+WbFqKHBBRnt9EmaAQNx1ulsTWfqhjghOqf6WReAmSMIkM
         yYimfpGj3cukLhkCTYg0nXhPz2HXEuOfGNUOCctqjI+HEr86RteIPOZB9N0mFfjQFA7L
         HFBg==
X-Gm-Message-State: AOJu0YyoOpiht4rbJ4PO1tvS3m/XhHJxn8H3ya3l5qz4p7xMKL0c9Rpx
	OdGzcSB5avC589N2RZ//WsvZDAk4F5WVla4r73vq9jgkbTgIAp8e
X-Gm-Gg: ASbGncsGxQSNFB8H4wSwKEih3WMSHD04OugfVmH7k6MDiorF3UDG5O6fi+NrCs8ZHDO
	JXyXJlUkrdlawJWpR/A33yQGzITbpwu6Xo8abwVQYsPcYysL8SxzA5QD7BUgU1Bp3PpKHeOzYdh
	52PvK4G566kwl7Kyf9TIP2bzk4a1eZkZBOJb6ZTFJFe7zAG2VeRbZ7cAamZM/vW733YVeQkZAge
	BQZd+GouL0wLJY/nDqrtwDKMroORE935TQFEY40puAmjD/v5qeB+aa8Pkv2iYUaMPRi6fOhkLr/
	2JRZU8u+cJIU+SxebvlECbazpSeVF7YJtlHcdZnWfay/jC5V8yOMkIMba99Y0Mk=
X-Google-Smtp-Source: AGHT+IGgS0h9enKlNVOXLCfCrbumo8HB67DCYKoAL9Eq5wVn3b4dSk1Ow5ZwYG7Bteh8MSXTpAgMzA==
X-Received: by 2002:a17:90b:4acd:b0:308:5273:4df8 with SMTP id 98e67ed59e1d1-30aac183be0mr3784024a91.10.1746601143894;
        Tue, 06 May 2025 23:59:03 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30aae525db4sm1315529a91.22.2025.05.06.23.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 23:59:03 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 07 May 2025 10:58:33 +0400
Subject: [PATCH v2 4/4] ARM: dts: vt8500: list all four timer interrupts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-vt8500-timer-updates-v2-4-65e5d1b0855e@gmail.com>
References: <20250507-vt8500-timer-updates-v2-0-65e5d1b0855e@gmail.com>
In-Reply-To: <20250507-vt8500-timer-updates-v2-0-65e5d1b0855e@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746601114; l=3301;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=np1yhCpp/qpjWGPuT2g9hwqJ7HuHqaWY+xGRBXC7yJw=;
 b=FFRTMlEYxUjfk04F5tcy6Fu8t48a/oBMv1JKyKZORF6YvISOkxhzZ46nWOvKjhQlm3S+G5IK4
 3dTVT2mgNcyDZhB9T7QOJuQOdzVCuj62wFbHfp0HeZC4noLZjEbkFui
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_235904_539059_61F8AD2F 
X-CRM114-Status: GOOD (  13.22  )
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


