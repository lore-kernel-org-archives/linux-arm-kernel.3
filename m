Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAAC1CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 14:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mTeugc1mw8AJhG/UkyxA6QZakbeowukdRimSYseE0MI=; b=wWGYxfnt/qZqElYvwz6DobbObp
	p0gaoybEVAgZZVxE6cw1h3XbJ3VjuwI6a0NCuwvwEnaatRYZwLseYwjEJtRvdivSDmSlanWyL297W
	19YkpAWFIRl/8UKRHNQZ4K6AAMgmr7eIW//1ueomMOOnP3I2o8YbS6SnIhdHczxYHGC6cHnMMQeNq
	BjNIUhUgCvEcYnHX8vrpsDVGNIm26g1ggqvnLPknkrUlTlheSuWDAckwzpzQW9+auKGUH+E6+cpk0
	e4m+XnNO730LiO40e7QbaVwVg8PK/wxBn3+0SNA+o3YRSjkgVENuQ91DYiRpPuVEBjSHkAUH3gpzL
	O5y7ZFoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umYZC-0000000H9gO-05u9;
	Thu, 14 Aug 2025 14:04:30 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umXpZ-0000000H1N8-37IG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 13:17:22 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-244580536efso6350405ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 06:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755177441; x=1755782241; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mTeugc1mw8AJhG/UkyxA6QZakbeowukdRimSYseE0MI=;
        b=DskwNEvErZFYVxq4t+AGvzlO+DWL4Oml7hWaggR72TCn3wepMsiWp7bpot9DFKMmVT
         wIzzTGJgIruzCvyhEQSZl1hT77laH1M5V4+MHRVu05wvYJH8J+qGDaFEgl+8ydrHVu5/
         4Wv7u6xCMfgKgU+K14N/CP/Ci8RS2qJJ0WcjLVMrte2ejDJlAV5g/rZhVL+5SDE0nlC+
         jRQPQOGQyRxd5vn8InlJ3tB6/xuEJrYdPloL4bzCmGqmNxofkw20RkHi9j9qiRX3jh1U
         yJYSg2BNVeQ1d7Zei9fF0V/WUh8r6bwVJVEKdlIXJLG7Xs6f4Oj+5K+cMAU+W5oQAtHk
         Hd/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755177441; x=1755782241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mTeugc1mw8AJhG/UkyxA6QZakbeowukdRimSYseE0MI=;
        b=VByuM/SugFQuul6e30KwlAFMwby07Lcpgk+5lLPmUgX719sy8T4NDIegJdF5WjNDMp
         mZ+FPCLbGKVK3bWNDmCCMO0C5UFRnfiTakDFslFFnsj8X+KSSoPTjDiLxC2KXadNwf4X
         0p3fZm8dzwldeR7E0f1tb2G+TNfpJg8bEt578YUyuvkAaOOplm5aHq4+D4HT9rDOrfY2
         egZ9THg0J5Z9OwqKYEVBPnSepgfN65IELk+CymExBF93wz4ndS0RlHYUCM76ks03aHxP
         NARvEfa6+iqqOq0zk9XX4h0pJYThRCqel4A2UjmpOuSRoBTXoS1y+yxu5OWr6aoV3ZrK
         Ed1g==
X-Forwarded-Encrypted: i=1; AJvYcCUplZ86LeFbYW1PGS+3xBFm8KBNkVWxZ5Ae1oxUyifNFHUFmtOglnlc7134xo3VXxXvXqTlIHGDzYy58PgnDIve@lists.infradead.org
X-Gm-Message-State: AOJu0YzDPNZTDt22fefzTCBAhY4eCDGz2Wp6QKfKml8SwgwORRkX6OJR
	uZu+qUuotBRtPe9Wc0g84kx3d7r13+Ylb+b+uTSW+8I/vDtSC6IxbfZa
X-Gm-Gg: ASbGncssmfZoUzgE0Q/HniD05M2q4phehAjF9GkhPAy2B4dohcKwJtw+m+A0bi+K/vd
	IIIgMYnvtQx9Pm4Km/AXio0B92r+4iJBPGX2PHFYTuzL02pFdL7yIc3SNoNTAazGEWfHgUdYsYx
	iMXLZD3hUmvSx98n7ml8J+myAyoVvcpiXYdw6fDAb/pFw7nqocv9iwTnUkiLiQLqq+6CVfMzVN9
	k6a1HUzNb38mIIng4AUfwZIqU0xwMeUbGQ0unAFOSi0GwSGOGrhtA2nTFYjB9bM8FocDOzCY330
	oGLAKV5O4yfZXPBOIhAySi0qdj9u6cefvXI3Jb/kiAiPLuPUQzb2vdJfntSjHVWiMuFrXkldzVw
	MU62tbdWo6tzfarzxs705EPFxU+r2N30pLSObM7Li9rVlCqe2Ft0QEJhMDMF+fiuAmnmcbXYIlV
	kT6IxfoyidO5Q=
X-Google-Smtp-Source: AGHT+IEi9Cd4/1A3g4Nl0M2mQgj+9WahbmP+8Rb1RXtow/Y3VwIO6BsjihtLcR9sqiy3LmjE4+Qh7Q==
X-Received: by 2002:a17:903:2acb:b0:23f:d861:bd4b with SMTP id d9443c01a7336-244584b8f07mr42768455ad.5.1755177440508;
        Thu, 14 Aug 2025 06:17:20 -0700 (PDT)
Received: from fred-System-Product-Name.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24218d8413asm335652995ad.63.2025.08.14.06.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 06:17:20 -0700 (PDT)
From: Fred Chen <fredchen.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] ARM: dts: aspeed: santabarbara: Adjust LED configuration
Date: Thu, 14 Aug 2025 21:16:59 +0800
Message-ID: <20250814131706.1567067-4-fredchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250814131706.1567067-1-fredchen.openbmc@gmail.com>
References: <20250814131706.1567067-1-fredchen.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_061721_787985_6A1F15D2 
X-CRM114-Status: GOOD (  12.60  )
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

Update LED definitions to match changes in the hardware spec. Add a
power-fault LED on GPIOB5 and relocate the ID LED to GPIOQ4 via the
CPLD. The ID LED now shares the power LED: it blinks when ID is active
and otherwise indicates power state with logic controlled by the CPLD.
Retain the 'fp_id_amber' label so /sys/class/leds/fp_id_amber remains
valid for existing users.

Add a 'bmc_ready_noled' LED on GPIOB3 with GPIO_TRANSITORY to ensure its
state resets on BMC reboot.

Signed-off-by: Fred Chen <fredchen.openbmc@gmail.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-santabarbara.dts | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
index ed30f3bf61a4..ed2432f37609 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
@@ -94,7 +94,7 @@ led-0 {
 		};
 
 		led-1 {
-			label = "fp_id_amber";
+			label = "power_fault";
 			default-state = "off";
 			gpios = <&gpio0 ASPEED_GPIO(B, 5) GPIO_ACTIVE_HIGH>;
 		};
@@ -104,6 +104,17 @@ led-2 {
 			default-state = "off";
 			gpios = <&gpio0 ASPEED_GPIO(P, 4) GPIO_ACTIVE_HIGH>;
 		};
+
+		led-3 {
+			label = "fp_id_amber";
+			default-state = "off";
+			gpios = <&gpio0 ASPEED_GPIO(Q, 4) GPIO_ACTIVE_HIGH>;
+		};
+
+		led-4 {
+			label = "bmc_ready_noled";
+			gpios = <&gpio0 ASPEED_GPIO(B, 3) (GPIO_ACTIVE_HIGH|GPIO_TRANSITORY)>;
+		};
 	};
 
 	memory@80000000 {
-- 
2.49.0


