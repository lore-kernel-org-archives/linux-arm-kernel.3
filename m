Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 793BFC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 09:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FEtF7qEvsNXTmyOD1T2fZBfkSHd2BexV1VORoI+Vnis=; b=TpOz0toqjDZkuKBi3JmFqTugl2
	1tA3dgCMhq/hHhMLwsOHZtvbiwvbuFXAb4AMrkIO5I5K9jVHNA6kq37DTYqg4WUW9AV7eKy9wsvOz
	oNShej/Pt0FrNqO9COrEMh2sSWhLwzDywYRR7a9DQaa4BXYzUAB3VXvMDU+aPZ2h5zf3l0k4ZjPTR
	qTzpgOuuZFIIZp2UPmiPm2SIXc2CeAHf8eURh/0kpYTuwxeMBZnNkJa5InyFKRh4PhsGS5toXOqoZ
	AYjKZDavtIy0PV9Vmn2QhiTbZUVBewjL7B8smW87PnYuuYk0WD+pZB7opVKiO1W6iAmURWchB6M90
	v3wPfQBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uggjU-0000000GP7n-3Iet;
	Tue, 29 Jul 2025 09:34:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uggPV-0000000GMNC-1tgj
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Jul 2025 09:14:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=FEtF7qEvsNXTmyOD1T2fZBfkSHd2BexV1VORoI+Vnis=; b=cpQnEZ96Gx9NI5eP0VSDB64CeR
	H3DPd37/Fsx1V47nldT0HeqwVQqWDd8vWdtlYA4MmouktRIFhE9Fm+PQEh1jq3gaf64VS5nSu7UZj
	ol0Q5IP+BT6pivTT4lbrb2DjDaSTjzQKe+Bmipaszq2EqLImJ6p/WeTx9xiE3xkmqN3O47l18jbED
	9skMhhZJLg1JpxwaqP5N2V0zHwkHAQN4vnIkFB1Z0fx9mM/B2NMrZuETPwDCEzBsCn6/4u8bHQRST
	/KjJo+yzo0+OqCCBH37gh6RN0d6VyEYkPGDIcqdG7LZZm4WCkaT6jlToJyLwL6NyElM+yGtG3pS24
	DTeofxFQ==;
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uggPR-0000000CbhJ-3hyy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 09:14:12 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-748d982e97cso4854788b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 02:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753780446; x=1754385246; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FEtF7qEvsNXTmyOD1T2fZBfkSHd2BexV1VORoI+Vnis=;
        b=e0fux4w0RCcwG5e7lWLFhshtzc8xU97RK5Fr0ExhvrV4KtWbY8L2u/OJgA7tuhFWUv
         lGdzDJkl2EaySQXDwliRRehdrVlnNrrfvEwXlRXQ6fulNQpCnnn3PVCqLKUAFfNzttDJ
         mk6yELt8m0n8XNeqghv8afcQZNoMQEZCXJPTZXlK6rdwQIsjf+nGUP7jK2/vbYO7KzxA
         c3c2olIGhKM1O1uXcAg04qJ6CxGw+xdtxZjzNBgOMwoT0Ma5Zt7Lrg5dmrMDGOH0fI/J
         UAj2YrtKPdoK+Fb9LvLJcQfagVGYqRiA7kJ1I9Td40DYBKIPh4KgadAKszn4vZKZ60If
         IWBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753780446; x=1754385246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FEtF7qEvsNXTmyOD1T2fZBfkSHd2BexV1VORoI+Vnis=;
        b=C6R1jO0kOnPKwQn3uwNWgdTXj0M3FL/kMUNJxq6pETCmeNanukMKI38BUva37lNF2G
         cmEoVlFxQkLKpT3sqvbD/cGQl5O5YT+ynQn4Gqh8ro9UNQSTw+C1HCGG/aUdn9A5na9v
         em/P+IHgCT+wFrOsvkn6lWUH1LEysqy2H9jHlQgH7Fq5Yb8jIFkUDGE4e0R8VBFZGiua
         HEuAlc8BBNgR8KVfVpEwyXGTu7nM/4siko6kq0PnhRsOo1nGOTQcv3WUdxAKIyAcDrrY
         Yi3pyCd5LhpJh/hcJhCUEP4yDpEbGHdGdSV6ZHaQU5yciHblgUNW1HpwI37h0HfRld91
         TFwA==
X-Forwarded-Encrypted: i=1; AJvYcCX7pJoqgrhGKuvi4SXj3dCUlIfYtDpIf18XZz3yNV8mss2uE6RqteETqoIRSnOHpUvwHhoScfAJi/GUujybWNNc@lists.infradead.org
X-Gm-Message-State: AOJu0Yyi4nvjKZRoVoftBrNfSbIgzCxmT+SV4FO1lNq8JH7AJrljPRO+
	bMW5slyhQEAa0778r6EKLuwtgFvjCfZ70TlNUKdquK/A0ro+MneKQwZVojM0MQ==
X-Gm-Gg: ASbGncu/e4RhYpaQKXpDM3x5PMphbNf6Mkvkcr+mUiVhwya7VMBfMTRy2OURmQeFpPV
	07YRETo4oxcZPcPImriHXtgGIQcfsjEMPKQvaMeS/2r/z7q91MKNoZlRNppmxE7o0xWygYMonKT
	5C9jKy/psBJr+ylPXlLq3jFfbZF4XfahkaCPscgXeC7mol4xdn4TQ4Wws7EXl1HTlS38HyNmGUC
	IV0OLxFWEw1uhou1nmfD6WYR1kNLzNuz+bPSQDk1JXjPx456IE7TyK0ZZ5HXYDJ2spRjLfLP2Bb
	Pkt4r1MMmmvGRK3RR6Qo2gk+HUp4lBV5eL+P2kf4i3sxCF5p/OGikivpQ1wtUW2txGlVgausNe7
	HSvtLWjMB6VBkOzfriZSO3mSkA09DF93upuo1V4NF3HB30waYkWxFue/yEGYg0FPAp0hMhEMWE4
	HkCSWihc4ZsS6pEyN/8cG/mQZhJG7cQTIgSsVfSNjiP1+c0cY=
X-Google-Smtp-Source: AGHT+IGZbRiJ4XM9/7SP0TbANTsh6WCA507Pa7WbbQuyrxdcEdrxbpHYh29JWvG1Csf/3GaK7l82Mw==
X-Received: by 2002:a05:6a20:7491:b0:21c:fbf0:21bb with SMTP id adf61e73a8af0-23d70171d80mr25597800637.24.1753780446288;
        Tue, 29 Jul 2025 02:14:06 -0700 (PDT)
Received: from fred-System-Product-Name.. (2001-b400-e38d-c586-0429-5c72-053d-8858.emome-ip6.hinet.net. [2001:b400:e38d:c586:429:5c72:53d:8858])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7640b8b06ddsm7528612b3a.121.2025.07.29.02.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 02:14:05 -0700 (PDT)
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
Subject: [PATCH v1 3/3] ARM: dts: aspeed: santabarbara: Adjust LED configuration
Date: Tue, 29 Jul 2025 17:13:45 +0800
Message-ID: <20250729091351.3964939-4-fredchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250729091351.3964939-1-fredchen.openbmc@gmail.com>
References: <20250729091351.3964939-1-fredchen.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_101410_211148_F42ED848 
X-CRM114-Status: GOOD (  11.64  )
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

Add a new power fault LED on GPIOB5 and relocate the ID LED to GPIOQ4.
The ID LED is now driven by the CPLD, allowing it to reflect multiple
system states depending on CPLD logic.

Signed-off-by: Fred Chen <fredchen.openbmc@gmail.com>
---
 .../boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts  | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
index ed30f3bf61a4..c7eb30e5baad 100644
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
@@ -104,6 +104,12 @@ led-2 {
 			default-state = "off";
 			gpios = <&gpio0 ASPEED_GPIO(P, 4) GPIO_ACTIVE_HIGH>;
 		};
+
+		led-3 {
+			label = "fp_id_amber";
+			default-state = "off";
+			gpios = <&gpio0 ASPEED_GPIO(Q, 4) GPIO_ACTIVE_HIGH>;
+		};
 	};
 
 	memory@80000000 {
-- 
2.49.0


