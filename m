Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C01E77199
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 13:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h6vO1yS6GPlqptdbWrGJbZkPRuaiwDL4rtqMZJkGpRI=; b=mHrdov0Vk5LoGr
	h8Suij9p1JmjLwti3OzkiVB/26WYNcNf2zHAoJIFRWDhTclZrmJp7AyK742oXoVRPuC91OhBfshxZ
	KSEyZ3jQY4M3R+ET7syEnLoz01kGwOYvzTgN0W13e4lGXgKp8ji9BJ64V2FkjW4hO0cTCAdV8/Ig/
	/q56c9tu5gycT9wgOu2Li/KKpODE90sQRYbNfQLSBihhUVR87m3MjVpl2lxwtSxggnAr3HlWHnrpF
	eS1+v37drPyJaFUAoNZkaVIh9y0b9WU4+Q4dxhQKj4j8eoG/j08x/buloasS7sLSeavnTeDBp7HI3
	/UikTfIO1+3Xmi2sULLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVW0p-00000008b3G-007X;
	Wed, 08 Jan 2025 13:22:19 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVVpn-00000008Yj0-1fZH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 13:10:56 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5d647d5df90so13945465a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 05:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1736341853; x=1736946653; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h6vO1yS6GPlqptdbWrGJbZkPRuaiwDL4rtqMZJkGpRI=;
        b=N5ckYwdkp/KKvAsoJbSKD6lJvWuNbzbJ+yJSG7uLAfoCWIzKWao+dmfmlzEI6Psu/3
         dKQINS2ZSwggX7YwpEXtfCAJXiyic82C7Yrd3/WqKeZkaXZx2RlMFYFZ9M+2LkK8zOlC
         IiTKtFL2eEUG/F5o/dzDvpKzhv4pjcJ+lWRW/lP/fos4kI0ByahwWpPf5c6U+8WdADNq
         i20BM3t3KNRtxjDeYk+CQnEvmCNQP16cnhOu6MqvrQORHEs/85Dp/HFQwvYaGEzTzehn
         WoCjTyp7RREcg0LfL2/qFiMonF6dy5DkmXxxw+Bc7fKeKMvcLPIyzNV2xTPT0/rAfmDc
         0VcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736341853; x=1736946653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h6vO1yS6GPlqptdbWrGJbZkPRuaiwDL4rtqMZJkGpRI=;
        b=t/ybsCIa89OdIWqt4Ys3sYnBnaS6dqUSDa90Evv5z0OkbZS5vD3irYeZepd77grVt5
         u38Y1CBgv4kTuKD/E8MH/+qldQeN4LjSC4jQcz+agwrr+G6L+kjR5lqm2Hth6Ekf/G3n
         Rfjj3xSBdiqn2wjz+AvrlHBq7aMQsWk9/ImLI2VXDqIO4eqrBCayXWu8v2udhX8eOIE1
         eslMbhJ8mxM44eGxv+p2+nqlyyHqOoa3Q0O0LvXSm5eYk1rweq5x6xO6S68oSOtHq1e5
         7Mz+c4a8WXOCCDI47Ayvv6EeaicFk1nTPxfxugVFHO3oVN3T9GtBn1gKUm16hvzoi0Gz
         Ealg==
X-Forwarded-Encrypted: i=1; AJvYcCVGPuzcfrenaYlw0uUsW8XwC/O1xFZquHVPiV8Z01ACGQ+IEqhdIWOkayRCN8mxTfxsT2o6dDoA0woo7C+GyQRR@lists.infradead.org
X-Gm-Message-State: AOJu0YwspnhXyrZXkO2X8iJAthLENQbCuMlLalnPNcif8foWSZLQGvPx
	Sz39Zvmx9pCTj7OAQzxgHyBeNrVksV1XZIW6tWD9JJCL8663VnL96ildeOZRij0=
X-Gm-Gg: ASbGncscgnxC0veLv+5TXIJltpAdfm0bx8okGQsOPABTxdecnltwAX680EY5YFlT6Jd
	3CrH3kC70lVyOoFk/N0E7m+TfGgqkcFy9xOnx6Mm/whVu9reXST6k/4KMfhBLGQewtNCzFZB5se
	HcZRCgObYYleOydjI8lK2jSMnIRZcm6h/zRkIGd8Aaklkc4n5VzPs1qJA3DB2Nezi+xHZJqaruD
	qQOlmL6+qk7yag15qCktZNx67D8ETLF6Nru5ysdnjsPpGyjH6u7/cwP8Utzy6cUite3zT9U2CBD
	JQ==
X-Google-Smtp-Source: AGHT+IH01FPYKyvnpHvBBmc5ech/bov1311UfrV70T3kwaAdvQJCOLPViymPRE1YxoO4XH05S0VA5g==
X-Received: by 2002:a05:6402:2550:b0:5d3:bc03:cb7a with SMTP id 4fb4d7f45d1cf-5d972e4c9b2mr2569981a12.27.1736341853470;
        Wed, 08 Jan 2025 05:10:53 -0800 (PST)
Received: from fedora.. (d-zg2-023.globalnet.hr. [213.149.37.23])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5d806fedaebsm26159761a12.57.2025.01.08.05.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 05:10:51 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: catalin.marinas@arm.com,
	will@kernel.org,
	lee@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	arnd@kernel.org,
	lars.povlsen@microchip.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH v3 2/3] mfd: at91-usart: make it selectable for ARCH_LAN969X
Date: Wed,  8 Jan 2025 14:09:27 +0100
Message-ID: <20250108131045.40642-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108131045.40642-1-robert.marko@sartura.hr>
References: <20250108131045.40642-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_051055_433881_E6D85764 
X-CRM114-Status: GOOD (  12.04  )
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
Changes in v3:
* Pickup Acked-by from Lee

Changes in v2:
* Pickup Acked-by from Nicolas

 drivers/mfd/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 6b0682af6e32..ef32ac5ed75d 100644
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
2.47.1


