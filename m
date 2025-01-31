Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD84C02190
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 17:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CL0BxI02OVOAaESH4fyNi8OWq4uuKna8aSMt4xy8CE0=; b=lpTOs4irKOvudA
	OWbuFllsF//UfCwMa2xtuKRIuBVzpe6DsesPJRAIEi0Dv2JBGwaTjGbljGI79vyb4TLbitQg9Io+T
	XMh6RZBGotj8cVV7s5EXG/InyVOnT2KMHouAYg+FJQB21I7d2pdd/rnFxgxwtsAn28WQoOsgFRer5
	ZBiVCHinnw+6bks/eevHeF5gGdgXWZgYO6mE9juy+WDJZksmzbNGZqfnKb0UsHFydNaxdknaAAaUK
	MjZcHclLzN/vYgU8yTW90lUBdW+OV9VKTtBsY7RXvwNiJph3VUwM2QcgAn3L+0lVQZ8Hw0K716e/Y
	ySShO1u/99MKLCmr/zdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdugq-0000000B6ae-2OTE;
	Fri, 31 Jan 2025 17:20:24 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdueI-0000000B6F6-0eE4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 17:17:47 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5dc7425ec5fso4069825a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jan 2025 09:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1738343864; x=1738948664; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CL0BxI02OVOAaESH4fyNi8OWq4uuKna8aSMt4xy8CE0=;
        b=yvHXkC+rlMO8L5nT7OtYJbs/E9bjMEAvNIpRdifHCisncBcbnBBMgOEm08uE1uLBeC
         zZkPYGIlm6urGWYOIQ9FeDS4LpxmnhqNoV/VgJQs5y6NduRqR3XdWEWmHPMM0ptTtg65
         pvg25/rQXQ4rlWa+V3JL9uSNLbkePqQuEETEARU55jUXggboAAdHEV7zZYNYRHwUxy1x
         4kxsRqrYOlZ5Tu2mHCwST4xoB14y1c9aQOoI0HpCmb4rRj552VJ8DmSrKjfy4YQGeMwU
         sSxdmNX7iJImkxBo7ef6M9D81C5qSU2w/jf8JDMJPmMpsA61cq+b+Zf99yoCzuvw3oGL
         ABbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738343864; x=1738948664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CL0BxI02OVOAaESH4fyNi8OWq4uuKna8aSMt4xy8CE0=;
        b=i9cd0CzImJ6zXmi50M1jUAbWzudpnkkNZNiI1fiL6dlGsMZRy7BENB7ehtyiwWbrtA
         /a+prXyDmCEnRqLFVDPfnqz7QyH4FEV9KjyF9OY7VO+gMOzK2sIIHP0SD7DKTJa/1lsV
         mSPegGGpt79sqqLXu9UJkMfWtPHJjELDl0yiEZVp6JIArYNgVlaliL115Om77xogt1jX
         dluUM+P+n84miWwlLfGhUzlfXl+ZlnqYPZAWvLHvtgIpl6g7bbx1tV/K2RftaoAygIcE
         ub0Im1FQDXjMO5r8xzuMYLzuN2ZtWAKGST1oAcZ2bnhrzWf2dk2KL1WRHEQd7A8wizTM
         IXyA==
X-Forwarded-Encrypted: i=1; AJvYcCX7yJBWFuK33v20DT7zZ+5n/mtbZCWvHz1WR643sNO90tyhaJNdKyOD3BVeAnSoL5VGCKxd9meJV0wZq4UQUvmb@lists.infradead.org
X-Gm-Message-State: AOJu0YxNN0Qkk0e/CZ8Y4vUSuKyUcBxGtHfzokJWdIEQ25qCorCcgK8H
	uzG9V0M9Xkn4chGsvPn8T3w65eJha0p3SNHv1HyJc/fPYFneV/fNj6WyjMboRfI=
X-Gm-Gg: ASbGncsD3b6nEHjNnl1f93GxQPQ4vwi/sS9815vZCPs+9AE/GulJ7qI3+ANQ4df3CgM
	oha0VbrdmLM4ABuQ4MFHvO2zHRjMbWYT+oLwYD4YJmEung7NPkmpxmAh5EEp1jbkf1Mab6i8THE
	bWlbsPLe+aAnNZJJPJezoxEJTJbZ09I1YQ8YXmFdqJaaXQDFl9RtPAWauc+g8RCMbwcFweOCOJb
	8BrXjtLL71hE0t9zDu8asywclqw+PMHy8UZ7SGWxujaLk+J1EaVwn418y0mggyr44yK61xnvQnm
	CUe/g2dYRmACtPm05ZLmAHd7/BerdytGYNj+KKXTTbfTyufWsOAhfw==
X-Google-Smtp-Source: AGHT+IEDlONj5YvPq5c9lS9S2mmrtJaZ7pkc214uLF9lHWbxVzsLWKeCtK6iBKu7knG0EUXmxhqoWA==
X-Received: by 2002:a05:6402:5250:b0:5dc:63d:b0c1 with SMTP id 4fb4d7f45d1cf-5dc5effb039mr12390136a12.29.1738343864160;
        Fri, 31 Jan 2025 09:17:44 -0800 (PST)
Received: from fedora.. (cpe-188-129-44-249.dynamic.amis.hr. [188.129.44.249])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5dc723e4b6dsm3142413a12.24.2025.01.31.09.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 09:17:43 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: catalin.marinas@arm.com,
	will@kernel.org,
	lee@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de
Subject: [PATCH v5 2/2] mfd: at91-usart: make it selectable for ARCH_LAN969X
Date: Fri, 31 Jan 2025 18:14:10 +0100
Message-ID: <20250131171739.1044701-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250131171739.1044701-1-robert.marko@sartura.hr>
References: <20250131171739.1044701-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_091746_190453_1B5F47B7 
X-CRM114-Status: GOOD (  12.30  )
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
Changes in v5:
* Rebase on top of next-20250131

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
2.48.1


