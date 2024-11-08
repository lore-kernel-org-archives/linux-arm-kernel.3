Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0789ED5C0C8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 14:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kn7pAJeAjAQBKS7X66mfb/roOZgIjXWBw7c3PZeLLVI=; b=ujnQfAU1daKqj9
	JLCB+rcb/MAtoUt6Na9ZRuXCRKM6NyfnvnfPinB8xCJRsik1hlwXNnSgQdbm9XzJyoT/KfmfA6+Oh
	Oxm0PIljZD3IsWPavFr2mBtCnJjxlZ2GJTY5VANc7C55GNuZdXXuLs2Bc46OjuyODrXU0f+BGD5zi
	oHOKNKhtvQdkpfzQHqjX2IvO73yzh3vijQHIcpxcdAk5ZWSo/UQFOE5og4H2B31rALya02nJAcbz/
	83Omp0468D0lPAmePE3fMkEzeLDTW/SnVZwJeKjpVl84r4YSaY3PfLl/ZKK/8q2WLWWu/+2MYgQvy
	UUVAgS3jrRAyNacgnJ6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Puf-0000000Aq6c-1n3O;
	Fri, 08 Nov 2024 14:24:37 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9PVx-0000000AmND-09iv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 13:59:14 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4319399a411so20042595e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 05:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1731074343; x=1731679143; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kn7pAJeAjAQBKS7X66mfb/roOZgIjXWBw7c3PZeLLVI=;
        b=etsQb9lY0OLMFMsl3E7mYanwB3+odXGexCD53zVc2FaLFxNMHBa3mVJFCwh/urqGuK
         itfXZlIq0A5SRyBiEDPtujef+Zz+5k8vvvii6W1IeSZVg6OYpi6dbuPEgA3FRjIIhHed
         p33TTvD5pOPaKgCqdH9M2rjR30rA/fFTEyYlsNaoJP+5/sHSYqWPeOdEmLya8Ma/ms6m
         X3Boe/2Achpzo7986CHeibmM1Hpc6zPm1ms/4VcFuY0qBaIPB7x/dbArKV4Z5b1CkPj/
         onxbVv3UgWm0VyxXTx/zxCFYZZZbLe+FZ0SCY7Ti0zS7Z4y4cogc4f0wWfpERXx2oyoh
         jfhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731074343; x=1731679143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kn7pAJeAjAQBKS7X66mfb/roOZgIjXWBw7c3PZeLLVI=;
        b=K03htIjeLwxfYd879QfT+XE7PXc/y4T2qzRIIhmfxlNeTgNzP1l0lg4pyJe60wlJQl
         Fg+5nQuCc8jmvU1523vuovdVkDj68mqL9nPdj0EPwuvMJCHLSKAR5E6wA03HxChlJlEL
         p4D5m0aHNsPmOO2007GXtUdyAELxTonJnA2lQrDmNqkj0FPBSsK9VnAmrNjMe85BcXYB
         c+Uib6sEF+Hn4P588LwKPgEdXQFwFR0d9f5++Gb1o5E/ITQHZYAtukxQCrOS00WdVunl
         vsRQHXIQHPi/4q8ZjDhliwGJykKoI0hw7ioWmEZAqqWuO1ET2KzVZaXUNTR1vPcNJqiQ
         NmyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlbKOgSDVlxrZcTlvr7znyM5xdZO2f13gvVtdm/3XpLJRGNCuDVxRWmB8yKKF/ZEVuSgaAWZrN4NILfr+IpH0u@lists.infradead.org
X-Gm-Message-State: AOJu0YxZazHzBWOhTsSZGTFLxEXgc9DPSxSiiSMuDystdcDnfJZrr9UJ
	iHX/5hITKydnBvu1Q+sf8uahwryO5wAGohsrXDvEBJbTV6Jfoyuy4ckpzarRZDDUR0fKNXcZXTW
	t
X-Google-Smtp-Source: AGHT+IHrDQs0PBQTgCK63DboffAmrhsTnn7i995FZLXxkWto266aljsAzoWEwTEOFu6My3noEjNsLA==
X-Received: by 2002:a05:600c:354c:b0:42c:ba83:3f0e with SMTP id 5b1f17b1804b1-432b74fcb3emr24421625e9.7.1731074341213;
        Fri, 08 Nov 2024 05:59:01 -0800 (PST)
Received: from fedora.. (cpe-188-129-46-99.dynamic.amis.hr. [188.129.46.99])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-381ed97cd97sm4924431f8f.27.2024.11.08.05.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 05:59:00 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: catalin.marinas@arm.com,
	will@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	lee@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH v2 3/4] mfd: at91-usart: make it selectable for ARCH_LAN969X
Date: Fri,  8 Nov 2024 14:57:33 +0100
Message-ID: <20241108135855.129116-3-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241108135855.129116-1-robert.marko@sartura.hr>
References: <20241108135855.129116-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_055905_147856_F9D7208D 
X-CRM114-Status: GOOD (  12.49  )
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
Cc: Robert Marko <robert.marko@sartura.hr>, luka.perkov@sartura.hr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

LAN969x uses the AT91 USART IP so make it selectable for ARCH_LAN969X.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
---
Changes in v2:
* Pickup Acked-by from Nicolas

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


