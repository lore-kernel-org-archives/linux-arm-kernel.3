Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC27C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 04:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uc4uCqsleGcCsKVC2kCtafnEyIcpxj+3QblkARK4r2c=; b=f4SV+nd7wQxolfxiZvyuAK3Pq0
	o8K2d4Lngt4plKv3VL3ZcRiHhYL8wrQyFuTgK9Gr0FBHYDci97CcsmiMwFkwJ+XVBDH0znV0j3wBG
	Z/xpeaaM/hhZSxvYae80spl7q1sF5FWogmfDBjKIAp3tNH98UUSwzb786unMxwHbEa9WRzK6eg5Qy
	mOJWupjrJZLBA+8Id0MIJ+c5Y8SZ26VPLDd542/eZgT7/eS384RhpLk+2/qjK/JvJugUcEoc207kW
	k1rstvsBxD7WZBC+2n+17IijYFyZ93wnjjYmxzobVp2/MfLTUCyI3grKWSJArQJ3A5PnL4wYpYxa8
	EygdPZhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tin1U-0000000DZNt-0g4a;
	Fri, 14 Feb 2025 04:09:52 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1timw8-0000000DYfw-0Qor
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 04:04:21 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-21f5660c2fdso32443345ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 20:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739505859; x=1740110659; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uc4uCqsleGcCsKVC2kCtafnEyIcpxj+3QblkARK4r2c=;
        b=NBcqwnDngQnMlviqdGGn5q9sCfPJlz1Prz0B5Ij4QekQY8+xpO/ilPnA0HVz8I667z
         s4jcbrV7+jXqdVjc231ao8IOdcN29XB4UZMp/vPwxFyHX+e1LLJ2SP6OfxcVO/S4TPXn
         i4khp1FbOmH7eEVtpvIF2xEhxUacPie0Z8sOtn5MQjKjbKTq/lwoZJpPeBpKnGJQK651
         k07VYIYEy3iE4qiN7hB0VU6EpVYM4xCaZo1BxiBLdWkW54QnpED8cgXDwf/l6c3igIBK
         6hRAMhTxKWOLKxkKUJ04fupBZ9E3GJ6X5etAPLAZIYyZTptSdvhBl2u8hMkMADypCVdu
         FLvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739505859; x=1740110659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uc4uCqsleGcCsKVC2kCtafnEyIcpxj+3QblkARK4r2c=;
        b=JbTHOHyyIhykwp4HiDwYY8mo0TMiXfCp62Dz1rjshLQwnqIUw1/JvUzKa/MnMtC7PL
         uigLSnVqc+gptELKrWy+3p3zKle1BYeklMdsKfHthPyv+gPozBBeUMhwOyPF6LwV9Ava
         MOTHlK5K/FcKo3Uu3whTbU+btPm5woiiu2FvwJh7MFcm5JWX2u4AEy75EHYpSIZHnP86
         lsc5XIf34H+BOLMAWRj/MH6T++CDQABwhPg+SHI6VWpj8kWUVhAALIOGMj+gxQAqmYMF
         Rf42UEoFkt3iWvCHmW37s4nG21Z//nULy9SYtFwDag2Uszu5T9p7MBBOlMt06iZslDWJ
         V4JA==
X-Forwarded-Encrypted: i=1; AJvYcCWV9ZmEHy5HUrr+NqcIfcshG4WAe3R3kif+F/dzoEPJjSztlQb7gLgj4fLdjeg4zvj6Mq2GLzBFGQiVWaQx/PK3@lists.infradead.org
X-Gm-Message-State: AOJu0YxZVsaVAqlqXJSSe+j0Mikkqenh6rSsF8bFi0sByBh0lBA5eY55
	23Ux0WUKqu80JjrQ3UHG9IXS5nWaxVRbnXPayvKKYMuxk3VjcbPJ
X-Gm-Gg: ASbGncsmJ2JEofHdgUMhtMj/TrutFnbue2ayxFZaZazDaXIBRN9Z4EYzTStmqcPjOHd
	ZqabKqB2M/4gr9fQXQoAfk9+RCq59DXWnewRvJVEQLL/AR6m7ZnJEDVn0YOcj2YsgaYVIv2vkW4
	xOtbhyNA5y+uC4vj9hKsB5mxGj6P0WcXvC8IeBM1ivU7kgCKjBfAROTdr0rygrJwRFF7TEyvQlj
	d/jmuvjmJKWW3pcDCdM9CeA7r0gvjac4b6izRrkUNSHrpCr6S5vuwanDEHOoy5f/B9jD++wZUF/
	PQaEU9SaRm9nLGQ=
X-Google-Smtp-Source: AGHT+IHkN1crcRx1umsgU8oqxNqZWEWNVP7TrG7rSyx2t22hQspF82Y6IBy/bUusVKbjj5NHW6Qt4w==
X-Received: by 2002:a05:6300:614a:b0:1ee:1bc6:2341 with SMTP id adf61e73a8af0-1ee6b2fe438mr10767975637.15.1739505859444;
        Thu, 13 Feb 2025 20:04:19 -0800 (PST)
Received: from nick-mbp.. ([49.130.17.220])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7324273e3e7sm2181227b3a.91.2025.02.13.20.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 20:04:19 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Janne Grunau <j@jannau.net>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Nick Chan <towinchenmi@gmail.com>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v6 3/3] MAINTAINERS: Add entries for Apple DWI backlight controller
Date: Fri, 14 Feb 2025 12:02:14 +0800
Message-ID: <20250214040306.16312-4-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250214040306.16312-1-towinchenmi@gmail.com>
References: <20250214040306.16312-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_200420_138292_80D15A8F 
X-CRM114-Status: GOOD (  10.71  )
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

Add MAINTAINERS entries for the driver.

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 896a307fa065..a576324807f5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2228,6 +2228,7 @@ F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/apple,*
 F:	Documentation/devicetree/bindings/iommu/apple,dart.yaml
 F:	Documentation/devicetree/bindings/iommu/apple,sart.yaml
+F:	Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
 F:	Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
 F:	Documentation/devicetree/bindings/net/bluetooth/brcm,bcm4377-bluetooth.yaml
 F:	Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
@@ -2253,6 +2254,7 @@ F:	drivers/nvmem/apple-efuses.c
 F:	drivers/pinctrl/pinctrl-apple-gpio.c
 F:	drivers/pwm/pwm-apple.c
 F:	drivers/soc/apple/*
+F:	drivers/video/backlight/apple_dwi_bl.c
 F:	drivers/watchdog/apple_wdt.c
 F:	include/dt-bindings/interrupt-controller/apple-aic.h
 F:	include/dt-bindings/pinctrl/apple.h
-- 
2.48.1


