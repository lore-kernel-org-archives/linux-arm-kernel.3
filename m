Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77FE5C35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 07:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=05OyaXbL0WKbLYpImlnz0xJZmG54ud3JNw7Cj+unigE=; b=s11gdKhWW3Y+gljoFQU0oV4vXN
	5FiXISVH+VmB053wrrFhzgrpXSziSfIUbek1/Cc7OCO7OVbYtJN1H/4I+Di1zP5hVZYSiWpiczvYb
	6VDu4wk3RvcEmYxb1IXsyCoxx8KyoZIRI2qAu7TRxJmA/ysyj7mERk9vYv3/rs+iqLLS9zOajigTD
	DjhMJ8MKqi+71OPAsV6quWCpyQQFPm+C3jLqGtNCpF1XCx2GzD0UYEeJiRx9L9sjZObdyeM+yY9Mb
	t76rMrSkrF7ojWMFTrPJuxswNtRvZLwGAp/5qKGZla9b1MbPDiERWPJTygxglYKBOKaiJbX0ONDV6
	Csyy5qUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvWuV-0000000E74r-3B9D;
	Fri, 21 Mar 2025 07:35:19 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvWnz-0000000E63o-1r8d
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 07:28:36 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-223f4c06e9fso27490515ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 00:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742542114; x=1743146914; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=05OyaXbL0WKbLYpImlnz0xJZmG54ud3JNw7Cj+unigE=;
        b=Rd8rp15qmR48YTQN/D0TlJwesEWx332wCyf6YYJNVhTXA8GBcTprqbmVNeMqq2K6bS
         mIWRD0hDr6SnN1Xd3Ketnreuai5u0BEWiHCjr16/ZEcnmp8zvYeV48rTKzU8B3PORqv1
         di6iNFt52qYfIRIAR0kdLBk+qUodeN7s93JLMfXXpxCH8R1tLrtgHeN6kqHnHaHDF24S
         JfFtRVWnPTS09L7uGgtNonVbMwTCX/yl835zcemk4x6BdUwoYCPf4EQWAGCfRoYe9tsY
         Xnbl6Lra8BZFD8JkVL31kKiAXWhg2WNXPM9xXSrYbr6w36BH8y9z63o9kcYZSx8I8t9B
         qGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742542114; x=1743146914;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=05OyaXbL0WKbLYpImlnz0xJZmG54ud3JNw7Cj+unigE=;
        b=YP+3SR9W3f2T2OhdafG7/xy6CYOPa8buhrmb4MZHRZItG2qlBi3129NLubyepGFoR0
         qBNNHUz9Eo5/Pj+OqgmIB1BqXFXF7aX95vRGBcb3b0dcHA57Dg1UNqVRdtV7M7offAKI
         yLNa6fsvcib4bWC2nEyWI8CjkCLrk3UGGa4QNpzQQtFle2LT0FkYAFmpOqzsvL23YJll
         Zz1c4b9r1VP6rDBaCqDwpzr1MjnSS6o0qIVmPGJSaeuzaLKjVCUR5V4BSot8jvDqWVKw
         sPgD2UL2yp7wUP84VjwnWgVilAy3tyToVLcF2fhrdwJc4Z75PhPGdA1eouW3q2t3YlDh
         OexA==
X-Forwarded-Encrypted: i=1; AJvYcCVe+bE1y6L/6OeDSTu4pHJCz+ieLrRUzJsbI694mPwxVgL8i2x6nkVDNr34zL5wqE32x46vd19IrazaGHn3OtyS@lists.infradead.org
X-Gm-Message-State: AOJu0Yy46by5xvYYWxPEcgOLgZx0BTe2y4AWJF0kwpAYSMrtapsXv3JN
	oBYNCUDCoQg3jKrC454Ti04kUBTfTsb/L6SfoXjPDxLFx4W+6hSXdvYHkQ==
X-Gm-Gg: ASbGnctnvR399ca91MssN9hTubC68ycbq43B3yg+ucC2McVcFWBg5OzJ4xrXUXidaP5
	auMvWem6+VcbkhukfH0tYfWySrmC5j2WioSV+3PRCP2lBmoGMbZm3iZXZ/6rHaAmgQ9OgDbb9JA
	mzPbp7yuX6ETd+ANE0QCqIduob0HQ8RdhhFPLaAFOfk2R61e7TTU1Ar1+wU9ggIZZVPfWdhpbzn
	lFoJWdhe7X22IqHfr7azqqmTlD73GABTkgt+ckWb7j554a2bq8pEUJd/TfUP4RScVT+3C5ir8g4
	LLG96p7TfdsZgFZKakXR8ggvOmJtxc6zVatSB/nqNtr47nQikBpK7Z7bHXtw6CUTekJysdEQPfe
	P4lvkBfqLEHfiDKkCAzVzBg==
X-Google-Smtp-Source: AGHT+IF6B0melgd9ZTHhX9+OmeXv+v7h26IaVqxBaObXnrdTWrN/Qr4WVVvrYpXTWtPK3QkHwoGXhg==
X-Received: by 2002:a17:902:dac3:b0:21f:58fd:d215 with SMTP id d9443c01a7336-2265e6babf6mr99928505ad.11.1742542114211;
        Fri, 21 Mar 2025 00:28:34 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f396fasm9862265ad.27.2025.03.21.00.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 00:28:33 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Fri, 21 Mar 2025 15:26:04 +0800
Subject: [PATCH v6 03/10] ARM: dts: aspeed: catalina: Add MP5990 power
 sensor node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250321-potin-catalina-dts-update-20250102-v6-3-4bd85efeb9b4@gmail.com>
References: <20250321-potin-catalina-dts-update-20250102-v6-0-4bd85efeb9b4@gmail.com>
In-Reply-To: <20250321-potin-catalina-dts-update-20250102-v6-0-4bd85efeb9b4@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742542103; l=843;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=BbOh4hpBKP+yiYoTLN8aSP+ooMjZZlQ3ZAt1eegwZSA=;
 b=2JhrlSHvGwiwqPQm1ccY/be+hyH045aFSjhPcwPOkWU6/+9JxEdpWxKu3JcXk8yp85n579LF+
 KNdtNGtkVReCfztW3E/Ip078gcE0yYTcAo+88IyGSxSDQ0th+cDxzBZ
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_002835_473859_D91A48C2 
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

Add a device tree node for the MP5990 power sensor to enable monitoring of
the P12V supplying power to the fans.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
index 307af99e833c..f5f47245796a 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
@@ -428,6 +428,10 @@ i2c1mux0ch0: i2c@0 {
 			#size-cells = <0>;
 			reg = <0x0>;
 
+			power-sensor@22 {
+				compatible = "mps,mp5990";
+				reg = <0x22>;
+			};
 			power-sensor@41 {
 				compatible = "ti,ina238";
 				reg = <0x41>;

-- 
2.31.1


