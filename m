Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41DF0CAC588
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 12:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QdXx5WHPadAVmQPefLqhuYKaW1K4eJN9K2RwteEElB0=; b=kLzQ81XflpXI0ppVpfXj0KQmJT
	804d5KIsDJ8OX/BiFGGAqhSgs6X5UyttLAY1zJYxmbJ+aPrdQvB5UzppFvBsjf/t8uCTOkVoWmxAQ
	nbc9i9DCKseg2NUkO3J9I4MjNZ+2rRaTqgF3bIMnqKUJKySCylWKKR5VYpum7gMXNXkgsvVI9rymy
	gREd8t/zI67sly2SzchrIoh/lQmGCQZgkiZ9NTLW9UhCt5WrH4JnyWMuitiF1FUbvtup/5KPmpLvG
	q8D8oKmlGxkjih35CdkU+FAeyltXAbUiAizrZrcqux5pb/05VjjOCFb+Ce3slUVwvWyCNWmYyKcSl
	4l39uEGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvac4-0000000Gqml-1j9W;
	Mon, 08 Sep 2025 12:04:48 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvYh8-0000000GEHE-0lRI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 10:01:55 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-772679eb358so3786484b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 03:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757325713; x=1757930513; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QdXx5WHPadAVmQPefLqhuYKaW1K4eJN9K2RwteEElB0=;
        b=nZG+k1yv/2P8izW+bolDa+TJLhHqPvfzuEPYRfas4gKQ2F2Z92sc2mORaB+2t+ehNv
         DqqvSzsvdIpWb8DD5KmuXu8nQ0BG5Ib0V88Xg2/+ayaoYDKgJ/vDWyhSLQU+9osJTgNy
         ddcSc/jOnoIjZB9a0UDdBGh2SwECW3eNJ0A/QpfRrqK80v8eGj8Hdl8C7xQMSm3pEww3
         hpnb9MQ4jYRXV3j7x4PFZSMrFKmYKOfCmCpBW/jlbA0SZgT4HUzmg21fp33mavMS5ex3
         M6ydtI3dFYHdDSXb6BaGeeTS0ntOmlCufQ5/T8QCPYRC3w2HYkjpLYcSV4/PYbrh40go
         uGHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757325713; x=1757930513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QdXx5WHPadAVmQPefLqhuYKaW1K4eJN9K2RwteEElB0=;
        b=vjnfRzj51USoN01UeDt1bu01xRZVtPsIKcYE7jLYD95wdklYiVJAax8vQBXO04a/2S
         yQvhuA6ZmGgaykTBRSZ7C5NeDKt3CLf1UvSmDS+agz7mZ/O6NPHm8Y8sJ2Z+hDZ/U7eY
         ASHArkOWOoqEGkX6K4b9tGzi24IZXqekrWDMzsZWaqQPndoHbOhKPsGg83sF7NME/JMP
         iEH5hLLrVwH3QdZykOVcuf9tLCn65ULt6a0f21ZeHo/uiOkuFaZ6kdjEQbx9YTwvKXMn
         3dui+bhqtBD8kGLS617z0Downl10ywVHOa0vFf8gdaZYYCyX6dvmCcnnboB8noZxkrX4
         uTQA==
X-Forwarded-Encrypted: i=1; AJvYcCV+IWNtL7BwBy44d2vTIsTh472c4ZgvgQk4R5Y+1mopsiIn50BjNZ2IMtskv5pJY8JZYBPzcmTOo2YwOkpj14Ja@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3v/F7nA1vlJO1fWZx1mkii55HVR6dc2Ii9ZOkb5GuD/HIOQHe
	Dk/e0cYDk1sJYwHegLy1Ljj3AT+IeQqYaO82S8WeAwlFekWfL0ldv9Q7
X-Gm-Gg: ASbGnctcXTb90eLav3bTTl0GwH1dWt/kETtxNvgu4i8KiGek0wN65HuQYZ2ErECwqjx
	r/OHG/rFTWPFAjEzfNVR8MH44EOIxYkoMPwotmPEKakQQGCvcLSQLyak4LF+WHEmQHYy34NQ2xu
	xdN7Ril2xdyvLU1CaI4gUneqrOfiXpTxKAYwBnKhiRhG8pTW+xOcPPPvBkArXQhAv/LwxKgw3ms
	6XdR1j+/6WPgd+Nox0ISioP+cGpGJlvXuSIef7fol4ZC4BF3sQUjnd6CpNkERqG9fKh5y8vf76Z
	u52tm/GG8z17MlkXJAuQpv4Z/I0pxGAMrhHIt9F/yWN3ZHoiBcluhb66lVa7s70P2GF9STNDxzC
	dQ0X3jiXQIjYI4MxJuvao8/COVGo=
X-Google-Smtp-Source: AGHT+IHVeB2ldGD9lByaVExSPq65coU5HN8zsO2WyV76Pj52Ray2lGVUsmxjkuZZ9lkMLPVGsDPzQw==
X-Received: by 2002:a17:902:d501:b0:24e:3cf2:2457 with SMTP id d9443c01a7336-2516e69aee6mr120267185ad.24.1757325713382;
        Mon, 08 Sep 2025 03:01:53 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-24ccfc7f993sm107826545ad.63.2025.09.08.03.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 03:01:52 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 08 Sep 2025 17:58:39 +0800
Subject: [PATCH RESEND v8 15/21] arm64: dts: apple: t7001: Add CPU PMU
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-apple-cpmu-v8-15-d83b4544dc14@gmail.com>
References: <20250908-apple-cpmu-v8-0-d83b4544dc14@gmail.com>
In-Reply-To: <20250908-apple-cpmu-v8-0-d83b4544dc14@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=946; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=lnaE9Aql0p+zaBjSHyK2yyUlKYAm5n38nVhdpv7cd64=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBovqlEaG4dqRUS59rdWuvyoslW/xZbeU7W5FMYc
 Dv0BEFms4iJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaL6pRAAKCRABygi3psUI
 JG0WD/9LyMWx8U1EOfmaE1lMDGBv7OlkEKBgXAeGH0Y7oEuZJ1WCg276LK7MnLHTDx/B2PDzN6H
 Ui9mfg4uWgxb59NgvOupSiys1A/UpzaMZscIuweCw8NS/WwmX2vWankY56oPTRjUVxwaOW1bpby
 JBc+sslES3rlwzGOMxgbYWcShTQbGUTzfmo9r7wkvjvs1PK5vOIVgxzUMgw5TWK7on/MlooIkPA
 iuqEClLbdR7QQZ03wugZkXy0toHbKbwpUptvPTlCNRXk5YCATYtrNILgn5gWiEQ330eesscqEJ4
 mfkrYiPDqLn55d/TwShHBIUlwFpABFNHVuV58AS8uCiA0xV4fI3F9ST7nYCiFrrCcJX16I7+R9k
 qZZMbLlB3QYj/IhOrlnRLqmHPKGOaQAJlMUu9u5Fz72u7rmhZFRQCB5I7vaNzbWePXIB80qDwp4
 1dl20lRd+8VaF0oaf36IC5jNAdXVHeV6MJ4hL2He7cfRCMumxvpUzh273994aREZTPpGDHhVm7i
 VMKu3nCh6X1980fuZws8XwHpiZTCZHN/leOfWCOd6dCGx3xDnbTsTxmYjZlIGVBWxrYZaPgW1Ij
 fTD1pOsYviZFC65kZQSVzWi8W/Kes9/o0o4vOURRwhxRDdoU5oLYNnFWeEXw026GFqSNbShpPIh
 D0yR9laSIwEnzjA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_030154_238434_A2A0DCA8 
X-CRM114-Status: UNSURE (   9.87  )
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

Add CPU PMU nodes for Apple A8X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t7001.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t7001.dtsi b/arch/arm64/boot/dts/apple/t7001.dtsi
index a2efa81305df47bdfea6bc2a4d6749719a6ee619..0e414018f5acbcdb10db92bec6e26ba32e53c781 100644
--- a/arch/arm64/boot/dts/apple/t7001.dtsi
+++ b/arch/arm64/boot/dts/apple/t7001.dtsi
@@ -199,6 +199,15 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,typhoon-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 75 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 78 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 81 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1 &cpu2>;
+	};
 };
 
 #include "t7001-pmgr.dtsi"

-- 
2.51.0


