Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53FF7D5C0C1
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 12:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g2oXJkzWtCGaIKJ5cbPKhS+LoIlQBWBf1ApP5urqLDw=; b=KNtgQBrCbxCvN5fBZKZYO3osxj
	5ETgUT0ibuQWbC31rOMC7B/EiId7+EopiCS4/0tMTpz7x/7aghIiwjYPxApJE6HKaRb24CGTAwNYV
	JfTrHGiTUkY2gHmejG9NkSeY1v/Fk73RZcplr5EUhPBjSoR1rtmCtdjP4OO26iTXf+GIx9RXWULpK
	xGZHVQC/2oT/GrnRFni+kOYbbBSA+74yCZsVjyUzmutdsHv9G9NUE5k9dkmTupO0/aTTHX7BkVEzZ
	FU4ivla1NPieX03Zqzcptyhlzvulm9mb06eFk4g3FVlJCF/NyULAbgDvZoSX5dNgZji8kdPsbvJTs
	t3lf1p6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9NiG-0000000ARdC-03s9;
	Fri, 08 Nov 2024 12:03:40 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9N5t-0000000AKkR-41nm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 11:24:05 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-431481433bdso17409955e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 03:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1731065040; x=1731669840; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g2oXJkzWtCGaIKJ5cbPKhS+LoIlQBWBf1ApP5urqLDw=;
        b=LICAdDN0pA66bpVdd0qioXxQJQ3CJfGJY9uaWawf+X1dD6P+GGaJxMVRs6BSQNxy+W
         ynV0743lAVLZECA4ozCjiIys0ZT+KGYt2RqWeRPMvy521uffxZymMswtM/SXcTicag09
         qKybaYAWRFT0Ykz07Pde/ETqgt6Hng7BKSwrQXu8eKfYxpzCQ51hSsqOpZ7YcWJkZrYL
         w/jLfF4eakpOKyUHbPMclm7s0HsjvANA5wUnoVEIv85+mms2eFCGrpMydGGN1fIemFlP
         WE0tAuJbAjJtVjcmrKsc2pfrAAUoVcQjKWB1uDyYoPlgnnH9LjcaMSMvm37ssPiwO/JY
         GiqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731065040; x=1731669840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g2oXJkzWtCGaIKJ5cbPKhS+LoIlQBWBf1ApP5urqLDw=;
        b=k8vAWpnTODuCKOYZc5OdcsA1in+RfRrY/IBKsfvzp89e7FhmZe18M3owdWlh3gUs9B
         ct41NtXxeB3WJ7TIdAxO2Tsi/8vXKr9zg3bvrNJByOOJANnnFogcBmpSN9SzfrTNS6iG
         ZGx9UsoqUrTinpKIM1mmzeKkKiB7OCVR3gVWJ2IaGs5ZsF7sEwyMG7iDgwaNQRJooqbG
         9LHtE9eFycnVfypyyN6nmJDk9ChPfo+VoC8dgNprEVDSPmEpyeqXEhWVBN4rTqrWxPYc
         eD2MInCJs7iaiMpIEn6yX/kCqzdL0SFwqeWqkNpVhu5qvBVyCvZ+3f5yjtfZTfQpg5S/
         OqPg==
X-Forwarded-Encrypted: i=1; AJvYcCXL3yJeosLmX0MiJuYfPHUi45rUT4euR61CbZPAAE6YhTQBXui+GNiwJOrORYFKEAlZZe2aOZ5t7kWnDn+bOhbd@lists.infradead.org
X-Gm-Message-State: AOJu0YxuF2sNr6zbp4E6Yh1LIgmX3zKrA5mbDyd1YB6CfLNkVgEh7JwJ
	OvskIi2R8aYyhcySBZcgwmwFrOJ/wsYb/vWwFrgkdKnNVDVlfyQ6W+tENrQBEsg=
X-Google-Smtp-Source: AGHT+IG3MD1LtAeRYq2Tgi0EQ1T2xgC9oErR/8Baw/cgSq2n2SS2IbIUneoqxr+Ubgn8WvPWUdOaKQ==
X-Received: by 2002:a05:600c:4ecc:b0:430:582f:3a9d with SMTP id 5b1f17b1804b1-432b751b68bmr20133435e9.26.1731065040128;
        Fri, 08 Nov 2024 03:24:00 -0800 (PST)
Received: from fedora.. (cpe-188-129-46-99.dynamic.amis.hr. [188.129.46.99])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-381ed970e18sm4281443f8f.10.2024.11.08.03.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 03:23:59 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	lee@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 2/3] mfd: at91-usart: make it selectable for ARCH_LAN969X
Date: Fri,  8 Nov 2024 12:22:35 +0100
Message-ID: <20241108112355.20251-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241108112355.20251-1-robert.marko@sartura.hr>
References: <20241108112355.20251-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_032402_020520_9ABCCBDE 
X-CRM114-Status: GOOD (  12.17  )
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

LAN969x uses the AT91 USART IP so make it selectable for ARCH_LAN969X.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/mfd/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index ae23b317a64e..f280ba28d618 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -138,7 +138,7 @@ config MFD_AAT2870_CORE
 config MFD_AT91_USART
 	tristate "AT91 USART Driver"
 	select MFD_CORE
-	depends on ARCH_AT91 || COMPILE_TEST
+	depends on ARCH_AT91 || ARCH_LAN969X ||COMPILE_TEST
 	help
 	  Select this to get support for AT91 USART IP. This is a wrapper
 	  over at91-usart-serial driver and usart-spi-driver. Only one function
-- 
2.47.0


