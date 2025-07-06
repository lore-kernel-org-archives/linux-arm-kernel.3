Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32039C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 04:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1/nsEzkMIZE8SZ9hqeEaMWmjFodhjCqtmCwZs7Lm9Pk=; b=YQt+v8JGCI82T6MNONXDjVpdiD
	rea0bGIiICVs7jOvXn4KkTr4vn3dvj1BbRx4ZnDFQdqB9kKu5SUZbioxiGh1Ihpowx4sA6qw13QJC
	CmN0HCeyK+Pvu0LROmwYIuwM8k6vRlwdH6ggjSvVRffBM4bQ2T3UZMWkDBP5N/nQFKKnhuQhLcv5a
	LzjBxp0RC+fmkD9uq2J1OwTNFIw/Jw+VlkP2lma5RUp2qx4OqCz5gGL+4xk62/uWtVoZIS0g2iwfq
	nGJOzfjiVGsaQ//fcZ6HhHgabwMrbkEZhkzaJwTbm/RDIkaHAxwe6obJsfGzn7dMnUPlWcSC0q5K+
	se62LPgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYH4Y-0000000HMdY-0Uho;
	Sun, 06 Jul 2025 04:33:50 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYGvG-0000000HLhN-3jB5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 04:24:15 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-74b54cead6cso1255654b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Jul 2025 21:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751775854; x=1752380654; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1/nsEzkMIZE8SZ9hqeEaMWmjFodhjCqtmCwZs7Lm9Pk=;
        b=gXfDYzTMTQHFLKqaYsWPoIyY6DaZ1Hr0OYOQPsx9/KJaOvnvggKhKGXL8vAGcyY/2p
         McPGT0X1VhNFor7Upu5eVwYqVVVtwFUqMhaXk7tKicQEyWOtV6CY2vy9SIEYWC9/QnLX
         1Ov2kZKmeTi/8nvlB+EddtOox+SKYY4x9y5bQ3TXvNaQyXyRiLzaICESghq5rnvSyabb
         WhDQvgTUDA1DjGx6qS8K1zxHe7/m81yeBk8E12nZUkHcq6oZ5anNQJcmMDVLxQ05tmdM
         oy9n4YmiZtqDf/3nS1MO9GMfXcxxFBJcppFLQUWy0EzHPP8zZB4AIBYZ5rJNB2ynaaMC
         z95w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751775854; x=1752380654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1/nsEzkMIZE8SZ9hqeEaMWmjFodhjCqtmCwZs7Lm9Pk=;
        b=S++NDNpg9KMhIxqi6H291g0L8cDe53hZDMzStqnM7SwuF31Dk3i4yj7SjBVfQB7MkB
         KeJxS4PmQbjJKEvNghjGcmJVZ5IgNSjpgVq1Tyg+tpbgoYXuFNoMjo6xbYmbcvC49cxo
         nSHxNvWux+mrlO8IESCrZ3CljgIGKBwEKU966MX9mF2XO1fwdFVIM5LjLT9GUY+rjull
         H8V7zX0qM2OxzCzlUKq2E0u5G4qLDZTyj/fYqWlwoEeFsrAIcwwtxVWX0dBpBOFGw6pE
         En5HU1PODEtddXWdYzvEmG/mvuUPaAfXaPNADHIJS4wfKKYWSYsB7iy3pBumCxGcB1wN
         xftw==
X-Forwarded-Encrypted: i=1; AJvYcCWqVFt6DioV1sNiLyuWxiT3X5TqQ0ObhV7smx0tsutTCDG5FVEdz6k2xaPV9GOkDq+QcjRXl8i84KVADZWnWDj9@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/o+JCzqL03xpzZe6PZ/OuKWKpcIcgJeqT/v4bcdEjdpxqa1WS
	KgPILSUGXvrbalcgJ+2NgddFTR3waFc94QCSzb6o1FT7wvyvNd++2dgZ
X-Gm-Gg: ASbGncvW6y5Bo4QUxWDRA7VxqnBhCuIcaVCPR1jkxfid+i1N27CySRxG5jHMpXlYJpx
	ShBIRSxQOlLs2YjQuc9CTT360+10Q9NCIqgAwBsCgoqLN1ABngNUwvwr1pGOemec4+2tzMGyUP9
	qjJYVgh6FI/M3AznEAoDYQookp7eV95Iyd/YjLV3BSMQejOb5vX4fo0FWRrQ+hVGoU/r90962y4
	rtGpXWzQ+lE+EfSjZw2s0CJnn4SjelTQCsds2gBQVtL9im0WJV8nJByA6P01RhxcqT+o1N3yyhR
	U8smgNlpEcOortJX3XfiGH0p1TWeHZpJDfjFXYxdUWPuDePc5TXGsGPivkqDOVrMb1SX14lUqsy
	7Mkp2W/Jmgu4LO8XvT3bZt4BpJ2zNL8YiXk3/OD8=
X-Google-Smtp-Source: AGHT+IEjl+yr878AvrYNBjUfIgoQ/EbccqkuBkxrKmYuvGD506F5090znUS4nJqBcY59mIfrNTOXHw==
X-Received: by 2002:a05:6a00:2e21:b0:736:51ab:7aed with SMTP id d2e1a72fcca58-74ce65c5262mr10425610b3a.16.1751775854164;
        Sat, 05 Jul 2025 21:24:14 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce417f206sm5287067b3a.76.2025.07.05.21.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 21:24:13 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Tao Ren <taoren@meta.com>
Cc: Tao Ren <rentao.bupt@gmail.com>
Subject: [PATCH v2 3/9] ARM: dts: aspeed: Fix DTB warnings in ast2600-facebook-netbmc-common.dtsi
Date: Sat,  5 Jul 2025 21:23:53 -0700
Message-ID: <20250706042404.138128-4-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250706042404.138128-1-rentao.bupt@gmail.com>
References: <20250706042404.138128-1-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_212414_927404_53A1DD26 
X-CRM114-Status: GOOD (  11.87  )
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

From: Tao Ren <rentao.bupt@gmail.com>

Fix deprecated spi-gpio properties in ast2600-facebook-netbmc-common.dtsi.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
Changes in v2:
  - None (the patch is introduced in v2).

 .../dts/aspeed/ast2600-facebook-netbmc-common.dtsi     | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi b/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi
index 00e5887c926f..208cf6567ed4 100644
--- a/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi
+++ b/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi
@@ -31,9 +31,13 @@ spi_gpio: spi {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		gpio-sck = <&gpio0 ASPEED_GPIO(X, 3) GPIO_ACTIVE_HIGH>;
-		gpio-mosi = <&gpio0 ASPEED_GPIO(X, 4) GPIO_ACTIVE_HIGH>;
-		gpio-miso = <&gpio0 ASPEED_GPIO(X, 5) GPIO_ACTIVE_HIGH>;
+		/*
+		 * chipselect pins are defined in platform .dts files
+		 * separately.
+		 */
+		sck-gpios = <&gpio0 ASPEED_GPIO(X, 3) GPIO_ACTIVE_HIGH>;
+		mosi-gpios = <&gpio0 ASPEED_GPIO(X, 4) GPIO_ACTIVE_HIGH>;
+		miso-gpios = <&gpio0 ASPEED_GPIO(X, 5) GPIO_ACTIVE_HIGH>;
 
 		tpm@0 {
 			compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
-- 
2.47.1


