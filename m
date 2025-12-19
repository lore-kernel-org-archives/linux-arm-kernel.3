Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF3AD711D6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 08:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=34Z/wqK33nY+/r9/my4gnemDx7jJlFUXcUiWHmEPYyc=; b=K+xmcTji63Art4bY6p1kCBspoF
	2pNzUj4ZXI/TdsqJzE4op7hsgfa+azzl5k8SuWy9Zt2kCBlrQn1IfJ6hd+3d7Qgdz5Yp91A2KwGCQ
	wiyt2+YMKA1C8p7oJ4gdoC/Cqv7ztGOpyjRImE7GDfJuWGdFxi0wFxqgQjcQAAForHKpEsy8NukRb
	MSGf8YhJPCk75nSijQspM0WeXaXBfjkqMKldcGHWT5dOkYS/oVh/uYEiLvo1eMDjh6P+Aw5W3uB7Q
	dbQrfor5nnPJ6lxXljIo/USlizcUszipWUQqA1tuWuC8mKkbyabwg/VSYItIQlMgGZWV0zGOJeIlT
	tG1jcFSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVYw-00000009o8e-3l9Z;
	Fri, 19 Dec 2025 08:10:11 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVYs-00000009o6A-0wg5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 08:10:07 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7bc0cd6a13aso940085b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 00:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766131805; x=1766736605; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=34Z/wqK33nY+/r9/my4gnemDx7jJlFUXcUiWHmEPYyc=;
        b=gq8nLkCa1WeFsXxAylQP4FKDVGtDIGnrS7H5iizAj7rHU2R/UCtxhdjz5k90RlZe0Q
         jbR+Fy9G5ZHUah8+2vzSvRynB2mDNdRYL8wqozuCBv3ZA2etNJKOjEz4PLjzBK/ci1uD
         /soIx4WphlymdSkaJtTc1VP52MrAan6TtNZghgHEWwfMp3PeeNx12owt1Ro3QJ2VOHG+
         XT4gKXi8aYe1pO68Qp92YhBlfcdl/89d1I0pGHYUazgsseQ0cHxPbvPUs2MGJActrMgO
         BJr2rI81O61M73ZXcyMISOxbYwUSnFXyoNwseZJZTq4qtvDgpK45KMkmOhT/kGEqBZWi
         cLqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766131805; x=1766736605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=34Z/wqK33nY+/r9/my4gnemDx7jJlFUXcUiWHmEPYyc=;
        b=fTgdnnUdtksBJM8Tf9EdKqh4iDnQ0dLEJe1yIVordZS6RmnQdm2Yyn62aN6lLxNMea
         E6LSaBlKP4EhKHmJYJOXq7yAG86hSPwz+rh9oCtaV552C4vhPEI8jdYKeLaZ597mAQU8
         akDjq5lGnrlYdBiTnfg64DNIInt5KRXYtqwyT3QQoGX+EX1Oai3cft6Ksv/xmvUJqvyt
         KYcK2gqO7qMRWEzfJlHPgZwBn58aQlEDl/zrg2f93jAPRsDYw3Qg3+Rp9iRX0vCACovJ
         Pg1HsmCRNFUHzubWOCeEaRGUQt3N5imO3rEjlTDIKWbfH3HO2v7UUlGOdOKAUeab1aKo
         Rl5A==
X-Forwarded-Encrypted: i=1; AJvYcCX6IAR3XQh6/nqFk9KhFfm1oCROLaGPzZv6VbqfPSUNBWNclWX0soWPpbwiFkAvkYa/Jj5fpYH1hENWwMlCIrno@lists.infradead.org
X-Gm-Message-State: AOJu0Yzl3yvH1VMBQISVpfGD8MWMP0DGZs5elh1FU6dUXVqI0bNQF/Ow
	anW1iHGqCsRC9nhorc4OyiN1UeshKfSSr9PhIFz1iRbx3NWTm4NRHh6r
X-Gm-Gg: AY/fxX5p5US0HebYNs5TGK7bwZ/wWiZTAkEhXOAXjL4l1XsvTOu4hcBX1tuiaLtMu5u
	iKU4xX4XFQe4CKDuBS+UOyOBNcDqKImFByCnIOtR4uxAMGb0VvcPc1whAo3+jM85qZU/jMnFGVq
	y8IYI0oKyrPQqrAfKZx6sTAaiLzA5O0tbevsTd7Os/euCjVixgZCJmyYlxZF2ROStQu6yaD7cC+
	jQDEWHF3vSoa9gb4pU0d6WEnY9XML+YC7WCLntMti7kz5zMhCHXrMZXXX0c6bLGg783EkdxL9Dp
	JqoHEMBUuX5TOOLFJkVFkPurlgfkOjI1Lc0i3EWIcgWBGYTYTY1+PHqt5qqtkhaxa6Jym6e3H+b
	frsvBxaAbeGLFBCowF/8Y+6t3wHF4E5TbmsLmjtEAlJDnJ0NXHaUNOb8KSJQEHFlR2aXedT4N+7
	sQpecS/y2kZXWDilwCT4oByMUYkoxuI1ODQ06Ru6y+fRPP3aVTkUA8QXZ6hKPnboibfLZvoMDee
	8QMi+p1LHGukBqZSfAVDasjftL/KXOnlU6fcuH2kAm5YznzJGJ9BwFbOvm1wbmX57HU9hRv7AHw
	TMy+2L9EafIIHahp2fUnUA==
X-Google-Smtp-Source: AGHT+IGqfS6t0BtWWUQ+A8QtFK38ikOJaZeZ58xc+M9BKY805z21T0J3RpJjQXDHps61ueUVFOAmaA==
X-Received: by 2002:a05:6a00:4514:b0:78a:f6be:74f2 with SMTP id d2e1a72fcca58-7ff5284da68mr2523709b3a.5.1766131805321;
        Fri, 19 Dec 2025 00:10:05 -0800 (PST)
Received: from 2001-b400-e3ff-afb4-41b8-b31c-89b3-0a14.emome-ip6.hinet.net (2001-b400-e3ff-afb4-41b8-b31c-89b3-0a14.emome-ip6.hinet.net. [2001:b400:e3ff:afb4:41b8:b31c:89b3:a14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b423d86sm1597274b3a.26.2025.12.19.00.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 00:10:05 -0800 (PST)
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Date: Fri, 19 Dec 2025 16:09:55 +0800
Subject: [PATCH v3 2/5] ARM: dts: aspeed: yosemite5: Remove ambiguous power
 monitor DTS nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-yv5_revise_dts-v3-2-ca1d5a382013@gmail.com>
References: <20251219-yv5_revise_dts-v3-0-ca1d5a382013@gmail.com>
In-Reply-To: <20251219-yv5_revise_dts-v3-0-ca1d5a382013@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Amithash Prasasd <amithash@meta.com>, Kevin Tung <Kevin.Tung@quantatw.com>, 
 Ken Chen <Ken.Chen@quantatw.com>, Leo Yang <Leo-Yang@quantatw.com>, 
 Kevin Tung <kevin.tung.openbmc@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766131796; l=1501;
 i=kevin.tung.openbmc@gmail.com; s=20250924; h=from:subject:message-id;
 bh=PuGP3tDDyva66stpyd0PfJUp+oeZiyMMNMGNoISiM78=;
 b=ty83E+CYPB7Z6jW6eduvzKPvIngjQn4TpP4Y6GcwiwBZ0tmTuJIQuwghpPnsofiRPA6UAL0hO
 BjCASEV0a3fAYR1htzZYqxa15v0nKqfsi4GSl0D+O9I7qe5YfHNYPRy
X-Developer-Key: i=kevin.tung.openbmc@gmail.com; a=ed25519;
 pk=PjAss0agA0hiuLfIBlA9j/qBmJaPCDP+jmQIUB6SE7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_001006_293863_10897449 
X-CRM114-Status: GOOD (  11.14  )
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

Two different power monitor devices, using different drivers, reuse
I2C addresses 0x40 and 0x45 on bus 10 across Yosemite5 board variants.
Defining these devices statically in the DTS can lead to incorrect
driver binding on newer boards when the wrong device is instantiated.

Therefore, remove 10-0040 and 10-0045 device nodes, and let the driver
selection is instead handled in user space by the OpenBMC Entity
Manager based on the actual board configuration.

Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
index 7991e9360847532cff9aad4ad4ed57d4c30668a0..45b8ac2e8c65a4f672e64571631b7f6944f26213 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
@@ -674,20 +674,6 @@ gpio-expander@22 {
 			"PWRGD_P3V3_AUX","ALERT_TEMP";
 	};
 
-	power-sensor@40 {
-		compatible = "ti,ina233";
-		reg = <0x40>;
-		shunt-resistor = <2000>;
-		ti,maximum-expected-current-microamp = <32768000>;
-	};
-
-	power-sensor@45 {
-		compatible = "ti,ina233";
-		reg = <0x45>;
-		shunt-resistor = <2000>;
-		ti,maximum-expected-current-microamp = <32768000>;
-	};
-
 	adc@48 {
 		compatible = "ti,ads7830";
 		reg = <0x48>;

-- 
2.52.0


