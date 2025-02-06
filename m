Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B9AC02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 18:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9j/Oa5YYyXRr2YC4IwFerwor4UG4DCkLhlqZUyCWpwA=; b=0wwZY3gYyJdBX4EltJRRgw5DaP
	7QUwTaeqeAcOouonXxexVgWQVCJ0S6tFAyJ0MpOigcrnjVcJ3lfCP7UH5Z7SElBZr7ZRlG1ESToaw
	hXNU4ZjOqTx8TV5fvpCMNtmXNUI57XlQ5l/Xik73x8BX1fchE7H7YSn2vHWy19vavhndGaxVhj60x
	5qcC6QI383tlEL/P/YLkqoNyn9pgTx6Qp22x/dgot8brFHaFbDPjpHRZIzLWdjrRpo17QXqt6iaZE
	f8Zyd7x5Qx/VHSxs58HqWrtuamx1XxD8AQWGqdlGeXcXC9MrZ5djXQ3/ingpe7qmScuC6dSxD0R5x
	8jHjCNEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg6Kj-000000076ku-3igh;
	Thu, 06 Feb 2025 18:10:37 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg6Du-000000075Cs-0cs0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 18:03:35 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-436281c8a38so8673855e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 10:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1738865012; x=1739469812; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9j/Oa5YYyXRr2YC4IwFerwor4UG4DCkLhlqZUyCWpwA=;
        b=k/nfM5A7jj4ZUFpWePW/shvFl/ad0u9+kOhjJVJUV2rKTqEpHSfF1IPsJgzR7qnDzg
         mauK3R75wtrMPYTUJiee4Q2HqVOn1FYEJFx+SpV+9ix8EDci6vRkRMpSWxU4GkQx+B4o
         xuBkPyVSaO97SceULM5lx/aUKxJofHDmEVtWZ3Kr7qF3neSLp6zSRM5nvDLTJ9ow762h
         JDQFWSg8HUHCbBT2OpV0A65SfGOCdr8Ox6ZYuot7fbN4izqDJIV5GglOwLF7M9fZ5lqP
         VcbE6EES8DvgP9UdvlhjtrvPatAq5IrSSn0RO8AZjCdE2GRkczOJ4ZLK/2+B11/dmsnI
         4ZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738865012; x=1739469812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9j/Oa5YYyXRr2YC4IwFerwor4UG4DCkLhlqZUyCWpwA=;
        b=X7cR8JRD5bi5X+x8yXzPZWz8kQ1i08YS/fZzKXP3dmY+rKwM7Ty9u5FIfV1vUtMu5A
         Js6wZN+rY7IfxZaKrLpcizGMg/hWTyPiVT61Akyl2LieovA1dZtSL9IjjBRr57G/oveJ
         pXsnkKONRO/Vco8yYrFnFkmSsZaZBv88m24ZxlEg20XGc0fPmrEXpVFL7DNluNQAhc8e
         oEkmnK6hZavQ2G9z3Gm6MtYCahMnjSewfXYhqsk7+7+4FltNdyb+4cXDpghxRAdJEMK4
         TuOqirz6Thw2vwk7P0b9qT3cbcgxu/c/3sdLQDCDQPutgHRznJKivjvg/8b+ITCz5Ab0
         R+Mw==
X-Forwarded-Encrypted: i=1; AJvYcCW6EXlptMqGEJuCkxMURuw4T1A0gJZemsOBBBUwLADWB9oHp3PXa1iDSrAmgSfAlFWUbV5SFVSfSm8xFkHbIIed@lists.infradead.org
X-Gm-Message-State: AOJu0Yyu9IzZf+zjmiXqz/0q5J7P58MLqQddQBPIha+OnzpglfOjdvzi
	8pNqtm28eAfuloJT5qOH60OQtCT8JaYorlXppL7YkRmTPb0qPfz56VkkCMXjmIQ=
X-Gm-Gg: ASbGncuUKe0nmtFlvnJaXWYRgrwylBGIYe3ETMj7yOMC/CADU6J/DPMnaVyiewvvWpm
	1bhrO6H/Rk6UTwEA6b1UT662gztfI0iyd+KzK65vX7KjR0liemxuoNGPLoJavmROJi0fQ2bOQwE
	zTuNs4Ra0h6jrqkFPorYP3m33Tb6RYg52jCiya4KIAaaB2O7L3OrRDHclg9V74GTi+a8Hn26ajp
	06WJxOwrAsDW1upEEiqe+U4kqUlDiT8mjyIOu+1lh0h9OH7tF2+Ckw82FBsEXtTwFvdJW255O39
	gE3W+cw=
X-Google-Smtp-Source: AGHT+IEGNVXFcPPbaAsAkKUz6RKFMzgdm3ieZv/CxcB2k8KxB6gUfL4TU2Ef/Sfmqg6Pd5YA7HWYzQ==
X-Received: by 2002:a05:600c:46cb:b0:433:c76d:d57e with SMTP id 5b1f17b1804b1-43924972d1amr3677925e9.5.1738865012189;
        Thu, 06 Feb 2025 10:03:32 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38dbdd3856fsm2278858f8f.28.2025.02.06.10.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 10:03:31 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 06 Feb 2025 18:02:38 +0000
Subject: [PATCH v2 5/5] arm: dts: bcm2711-rpi: Add HEVC decoder node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-media-rpi-hevc-dec-v2-5-69353c8805b2@raspberrypi.com>
References: <20250206-media-rpi-hevc-dec-v2-0-69353c8805b2@raspberrypi.com>
In-Reply-To: <20250206-media-rpi-hevc-dec-v2-0-69353c8805b2@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 John Cox <john.cox@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>, 
 review list <kernel-list@raspberrypi.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: John Cox <jc@kynesim.co.uk>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_100334_187225_A0ABD234 
X-CRM114-Status: GOOD (  10.64  )
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

Add the configuration information for the HEVC decoder.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi | 4 ++++
 arch/arm/boot/dts/broadcom/bcm2711.dtsi     | 9 +++++++++
 2 files changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi b/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
index 6bf4241fe3b7..56c633005941 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
@@ -105,3 +105,7 @@ &vchiq {
 &xhci {
 	power-domains = <&power RPI_POWER_DOMAIN_USB>;
 };
+
+&hevc_dec {
+	clocks = <&firmware_clocks 11>;
+};
diff --git a/arch/arm/boot/dts/broadcom/bcm2711.dtsi b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
index e4e42af21ef3..2931d93ba184 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
@@ -628,6 +628,15 @@ v3d: gpu@7ec00000 {
 			resets = <&pm BCM2835_RESET_V3D>;
 			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
 		};
+
+		hevc_dec: codec@7eb10000 {
+			compatible = "raspberrypi,hevc-dec";
+			reg = <0x0 0x7eb00000  0x10000>, /* HEVC */
+			      <0x0 0x7eb10000  0x1000>;  /* INTC */
+			reg-names = "hevc",
+				    "intc";
+			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+		};
 	};
 };
 

-- 
2.34.1


