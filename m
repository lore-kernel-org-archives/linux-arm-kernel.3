Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E67C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 09:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a2JZkOTP3NU4RyVKKk6UTttGKcVbYydKwlySFWwM5Uw=; b=aXPt/9d94UyO+x
	q/e/VSkxqzrmqX2YkA/q/EzDlA1EZqj71JQcNMKuV3lIXQEYwHpL4lqxBOdRhkLQ0sAA3leuh1nec
	V1Fdp/JYTJfyNf5P7exhQczjsW29vBDXQMLaH2Gjya6bSTA9zKa+UqWkapVbHnlzET7kNwnuaPcc4
	NEHdfNQun+CNSF0dxDw6aILYlpYs1zhpo9l5pDBBEW3X4BQDnozVtm7kP2QfIhaRpO79qEErOlDbD
	0YFBcdqOpivGzYqhAJ1CKgIFWYqMVKdUHbSuJCdnIZraHuiCg6VpsDPyM3cy8MS2wAxmPiMBJXqTl
	dcxQm0JyHvFdbGgq3oJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYMdv-0000000EQpO-2xZT;
	Thu, 16 Jan 2025 09:58:27 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYMbS-0000000EQPs-3D5H
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 09:55:55 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-aa69107179cso154499466b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 01:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1737021353; x=1737626153; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a2JZkOTP3NU4RyVKKk6UTttGKcVbYydKwlySFWwM5Uw=;
        b=GZDqPcRsKq6UCaZI/ybsfgncz6IdzskbEEO46EFHPnU0KbgovUk6HuiQ4yBtGFcVww
         lfu53PxwSRPbbb3J2wJkvttOA5RPoPJJ0xjRY92pViKJhGJKN2sUpozFvSxHQTIpmfcO
         KyXps3tqyipPivLO/rBZ+67cYv8evJ83mJvXaJsXDmAh5Wz64bsjaCjqkfbcQIANw3cO
         ISE55KSkNVxaej7UQBpNOobIyIsxDSX6/Rh1l0MJu9bLH3zEWm04nmBfRSUqy0c3S0rY
         creekac0Cxk2GuB6NVYZWeOe1kfaG2d+QGyB3l69JwFvcl++aKf6/Pu3UP95wDOrSm3F
         +SfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737021353; x=1737626153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a2JZkOTP3NU4RyVKKk6UTttGKcVbYydKwlySFWwM5Uw=;
        b=X5pshc5rfdYpTzkSh5aGlo/YzQu1vbkwzw2FJFawU7ghMicJePbXDl1ie4PBkp/yd+
         GdQZVQuDADDj6g5mpGjebpvLxlCGDaCoXrEULNSGPNtsgdtyBn8SH3+VMpVAVJ5heTQr
         j5k0wEA5B/9C2yyw0EPQcaI0buxFzHB6BCAGGhztK0KmViE+lFCS6HyiwxNyimdpy4vX
         DC4AuDTuid+ogcm3/QUIkAhBI4REu5cIDAE1Qo/SJWlysa8eUyvMH1TFYfy4Zu/Z/iiO
         MMUHG2ZJ501ajM7i6/JcVJ8N0lurxeNOwCnvsp+aF4vH8UmYG+tmOAPaBtiH+PbdQ0cu
         Wwqw==
X-Forwarded-Encrypted: i=1; AJvYcCVAVAJkJXNRq++lGJFCTsOcf8E1yHrC/NFF0wDxiafD1J6jtwJZPurc8z1w2Z4Ffm5dDtQdPXMqy+aPE6ZaS0zH@lists.infradead.org
X-Gm-Message-State: AOJu0YzDtOQWXUyt84mSuu10H/zpcTwkApPXLOu+ROL4eP6KQRhoz3Ur
	m9A9ty4sE5STIWYFKAukgafM9Lh1zeQM8wWLS04+Pyu4jbbe3DikXswWi/+jYnQ=
X-Gm-Gg: ASbGncv8laFvup6u1a4tWIQKwx3+Rrl6i+aQF0azBqEoWzdsuomhvMPH8qcxFRJaZVB
	nj9PR6KsS8/F/dZGghUOD09qi2uS6K6Gw6ziKbIMPZ106hZEzWvFBbFMtYDk757PaVjkkQ3qk60
	e2Of0DMue2+XiDAbaBplcxIUh9Dt9zDGGIHE59c/l+t//Jsf8BcnYmULWHU4xwMJ2zWD9NLety+
	FmsOZHQX4v8rQK9y4zsrvrLbV8YhFd9KUTUCHbVGsYGQZKzw5bfiwCo1ZtPsGaE3I7I4S+/ULb/
	A3c5rIETdpQbs3kQMOtk
X-Google-Smtp-Source: AGHT+IGqmEM5tIVYsEgVOSqrXifiEVbt88aq/jVt4bvs/3Gqj5zJYphSDmnmUagbnv1Kr0BlZDyWFQ==
X-Received: by 2002:a17:907:d8e:b0:aa6:a844:8791 with SMTP id a640c23a62f3a-ab2abc6f301mr3381843166b.45.1737021353060;
        Thu, 16 Jan 2025 01:55:53 -0800 (PST)
Received: from fedora.. (cpe-94-253-164-135.zg.cable.xnet.hr. [94.253.164.135])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ab2c905e296sm896769566b.12.2025.01.16.01.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 01:55:52 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: catalin.marinas@arm.com,
	will@kernel.org,
	lee@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] mfd: at91-usart: make it selectable for ARCH_LAN969X
Date: Thu, 16 Jan 2025 10:55:31 +0100
Message-ID: <20250116095549.449169-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250116095549.449169-1-robert.marko@sartura.hr>
References: <20250116095549.449169-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_015554_800444_57491C94 
X-CRM114-Status: GOOD (  12.33  )
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
Cc: Robert Marko <robert.marko@sartura.hr>, luka.perkov@sartura.hr, daniel.machon@microchip.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

LAN969x uses the AT91 USART IP so make it selectable for ARCH_LAN969X.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
Acked-by: Lee Jones <lee@kernel.org>
---
Changes in v4:
* Add the missing whitespace before COMPILE_TEST

Changes in v3:
* Pickup Acked-by from Lee

Changes in v2:
* Pickup Acked-by from Nicolas

 drivers/mfd/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 6b0682af6e32..d44c69bb3dfd 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -138,7 +138,7 @@ config MFD_AAT2870_CORE
 config MFD_AT91_USART
 	tristate "AT91 USART Driver"
 	select MFD_CORE
-	depends on ARCH_AT91 || COMPILE_TEST
+	depends on ARCH_AT91 || ARCH_LAN969X || COMPILE_TEST
 	help
 	  Select this to get support for AT91 USART IP. This is a wrapper
 	  over at91-usart-serial driver and usart-spi-driver. Only one function
-- 
2.48.0


