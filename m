Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E68CAC581
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 08:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7L/8llJEdSIG4Nfg2l+GvW6TEBvITMkZd39Mo6ER7CQ=; b=dTkGUcnwYo3sPmVizNIxAYLdR+
	ClbZ1fQJbVsDl+sukcrsWxqtp44Q3HlBKS2kycQJK+QeibqbU0Bmz0KMwe+zcSBcpLyPZOJSGIuSc
	9c2trkYVRSb2NPIhBkpJkHlpPVbreLEQT44Pjr6jb0Url16zGafDtaX3hnZEdbq1FX7nKZSZxDxwu
	nFsGDfmTzU0xFWrOPtld27x0im5QdGXuhdRfGyB1HQ93UUc6xz+CNjo+wrLav8MoDJoJ6UWJUz39j
	R7BMhQhJGMYUqTRa6MWX1iMaXCD1jc7cn5qjXqRfEaXiU4EpND5NkW70fMp3Gz/NL5EFsiwADewDB
	70syDxYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvXdd-0000000Fqab-3hnT;
	Mon, 08 Sep 2025 08:54:13 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvWpf-0000000FYCK-3ojO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 08:02:36 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-77250e45d36so3380054b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 01:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757318555; x=1757923355; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7L/8llJEdSIG4Nfg2l+GvW6TEBvITMkZd39Mo6ER7CQ=;
        b=QpWBAVb6KjQhF5DIpMXBwb1RxhLSpaeS7UgxulqNQvbZwrLSf9ID4JCvkOUHdJnf7q
         UEYWCxEVlHyHUGUI/Vy2g6IPbI64p9uSTazrO0QWEDZxfqjrDjOyrBU4/TKLd1zvhsCw
         7gjz3D07RZkJRb3TXfCfu5CovPs1sbudEwwP896S/kN0YT1CvUq/hvCEr0s+IXog3VNX
         Dhnsmotsl3LETBmjqoRUXMUvitA04CmUdVFseHXJ77uk0cRSdhfVVKHJ7+46Wp5nokV+
         Cf9oYn+A3tWm/NRZZhcNUT9AQo8Q0I5VH2DbBGTkgGRzEYvG6KzPLPzThlZfHVMeJFAK
         G2/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757318555; x=1757923355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7L/8llJEdSIG4Nfg2l+GvW6TEBvITMkZd39Mo6ER7CQ=;
        b=pNrOXvtlO9NYHD56+7X8KJXiuHhLrvbkZ0jollRtlve/3tXGiD+10ioFtsOC4qMmlS
         ZjTASRkj0LClT3VFJpd9qO0cUx6Z5OjHYeWO/gr0dRwa0IyYu1lAOzoHHw4isWTCQv7O
         ELaskpWvgSvp1+iUTYReBREXnUp+Q45a1D32W7Do3wwTzX7Kef1mJJjZf7da0mRCcX9D
         Eey7h7P0Mb8sRb7FLhYe0yF8spu7MhEP54lPPMxH863oMTfx30hcM1aD4m139OxykC2S
         Lt9UfQU8wWy6ttqWFytU55NYd+kTeEuqV80a1EuwLRf2ghKE+U88yMgT1M1YhbiQG7Ff
         hTLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXks5/J7OSDuPpc72GZmv0OGmRwZWVeKBxF2CoLXwujSuksb2O8beKgKNqkQ/h8TxG0SWeCsf9KtzsvmhXHq7nq@lists.infradead.org
X-Gm-Message-State: AOJu0YwJn9uECSK1lRDc5wKArSJ2PXmXIcwfwqpzZ7bASMla99hI/f3f
	BTMalTZRuZnpDqc8yQiaFcko+m4sWjKus7UmVF2m3GkB31WS/PtM6pVqYPy12w==
X-Gm-Gg: ASbGncuyXjtk0mggLkvBjstm0vk//JmY4LzEDf928LS1Nr1zPcGBMMYQzLap8czO2Nj
	5esNFTI3loTXnbC5AvYgGeBjPD0g5JFURIboua0NOFm2kC6vUCaM2dYX+5M+4zuO2y1KKVwTRks
	ekHT1HMd/Mc4GeLQwxn30Z9n7EOGgTY3TPaXbE1ZT9shXLhDNhETA4B36r00spoXiSA6l9z0wrA
	TP3duVMxzaf1fNys4BhzG8G2gMN8zfjwDmjVU/VxqgMvhE6FKjCvUQCUpxqOF929Cv2BeCuBCWq
	Tk8LfM6ObjXIuLmsXJk/RL5YwyYMx7sO5wQ+uuDSZl15EVGlWvV+3bf2DTf4lU0oySmMDy47H+5
	lirFStWHV6zS/C+M5YI6XXsmvM9FNyJqU8OnGVGIrQpugSKhCP/jJMfrPTXPSO+DvueMC1zOFwD
	nCB2QavbsfF4u2wMc5+hpAkknqVXS6I6c5rwHtsgw2I8znQmNzdXG4ZbZbuZBfwPdJQWaE4aycR
	X7rYg==
X-Google-Smtp-Source: AGHT+IGboyEkG9gWXFOkl88XKtiOMptf6/1xvI87ICp5Zjmw//pmeh9e60nsTnkc1Awdr15nSl0vZg==
X-Received: by 2002:a05:6a00:181e:b0:774:1be4:dced with SMTP id d2e1a72fcca58-7742dccafdbmr9530181b3a.9.1757318555079;
        Mon, 08 Sep 2025 01:02:35 -0700 (PDT)
Received: from fred-System-Product-Name.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7727bce1b58sm15186600b3a.9.2025.09.08.01.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 01:02:34 -0700 (PDT)
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
Subject: [PATCH v3 3/4] ARM: dts: aspeed: santabarbara: Adjust LED configuration
Date: Mon,  8 Sep 2025 16:02:14 +0800
Message-ID: <20250908080220.698158-4-fredchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250908080220.698158-1-fredchen.openbmc@gmail.com>
References: <20250908080220.698158-1-fredchen.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_010235_949216_286FB67E 
X-CRM114-Status: GOOD (  13.14  )
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
index a453f8dc6b36..de624f4a33f3 100644
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


