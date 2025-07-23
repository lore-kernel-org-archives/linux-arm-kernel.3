Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B37C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 23:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ctQnw4T9aGCXVWE9viBmqQcA3jC8U36JYDmPl4dskAY=; b=a4+FUGVXOpOnTIC+950RQapK4T
	QFalpt+d9tJV0iLdhjjI01dolg2nXU+RoXQi1JxxXaIAaIJnLD8FnwzdpVLEMQOzaGIihVuJYIeKn
	r7ku8Bj6xVYB/eEszNCbxmZnGGDp7RZU55E1+z18QtyKwBENsIDaCyMu5/VNxD7RX2buL7CVbFiWt
	7u6H6nXnprSi3Hq0xo3TIjgvzozZQ3lshgr/RCLv6Xco4qk7n8xztRBEH4+xJxPSDNtnJj01MuneG
	Qy1fg4r0vof8LKOshlHYCPChQPOs3ETZuguRe6CnoJRJkLoSnftwuaUiq14OWqPgCh3pt60kp93Vq
	0B02+Anw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uej1z-00000006AIz-3wcH;
	Wed, 23 Jul 2025 23:37:51 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueiul-000000069I9-3ZFu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 23:30:25 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-b3182c6d03bso548355a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 16:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753313423; x=1753918223; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ctQnw4T9aGCXVWE9viBmqQcA3jC8U36JYDmPl4dskAY=;
        b=W64+kUa5CJxF8rHSe/hVem7Ntsxye96KaUKrw+4dMmQ9eps4Yq/lGsAPeqMaoAi01E
         KfHcKQPYd8duPoQsDNEOtr2OsQ5jfgVuzV7fizaWKEY7kxdC3p6lomFk/Zn+4oUUBi+m
         rlnMcvcG3Aacs22XUgbvmx3wFXFy4s0qr4+kDrJ80eRCTaCA8Z/3p0Eai6NxpflJxh86
         qT5PDwAZhMUjYNqNCk29lv4VMh7bm8quZ/PjHRcpYKe3NWcMHaecLfKcodCx2hEHojHS
         7C7BRmT35GL5aJVt+DPYEKU47lCb1bS+VChoMrjDO3yqA8vk7PuT+PE8Lm6tKaSD+fZR
         6RHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753313423; x=1753918223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ctQnw4T9aGCXVWE9viBmqQcA3jC8U36JYDmPl4dskAY=;
        b=IVuB6mFTZl5dWM+eB4+XiHn6haMYh2C3o5fQVTxOOe/Dw7IIzzzsnG1FbUxmP5YVBf
         gR+X4MIQlZVknNjHawy9KBpMYm72XUmpw0/V/fFLZRZ9tFFw6pnORv0VfgYz8rIpGerU
         3KKYw6sLQw/RYQ1kFVphortY3B1RpkLaedlGg9+7btZlk2EMF/EeESf7UQxIvrVw0Fxq
         YOOnSKDOkbD3LmHRqDiAHtl7DOjnhWN/xuhqvBls4c3jrQqgo2/wcTkchGBTG4xllLYT
         f657V0iPkvDEe0iu4Y4F+bvRsGFYbmwgfxwWMR4MmLqyRdprrghnNawQfrRfTQxa8bM4
         2Rng==
X-Forwarded-Encrypted: i=1; AJvYcCWGuTEza/MjuetuNHWHuHgBiawelGNQl5EaS5deUDE9o3wPkegNTzpy5Mxg65vJdAXmmyHLAFyElRrunCyCKG9R@lists.infradead.org
X-Gm-Message-State: AOJu0YwFDnuvun8sKCCDyE/jopAvQIYZUQ3fcFaEQ4DmKVr7KfAzb4Ei
	0pCjmsws5tcWEVsBFyHP9S3vuQPvDiEUkn+gCI7uIec/AiUGadmdOfK+3Jrss5n6
X-Gm-Gg: ASbGnctYFp/68BKYNa6vMx/SMrb1h2hqklMzg+ppX+cXDe4bPhw0M83FTFFVyKA0Dcw
	VBQlWbQdjEyNZLMa722xY7lHjjkdPwpCEF2o4usnzxohYGmxCLvSVaz9l3FLUT8uFSMIALpE9Ex
	Z/aBB2d3hF7mlcqxBuuMnCuegetdiAEj5bfyhH9cz24kuOqioM+EVCDq1KhVpYw9dB89g8TrI7Z
	l3QHFSfSG0op7/1OQ8tuQMVghhwJXpE8idaQcyf29cW69x+6SrLpZ/l3WwzgDVn25X0dn38DWPC
	nJYJFSmkZJPr2PjwZQwdZLneJy1MeiPJzZ4IxoY7l/nq7cYdpFMJCzAtg6m+TxQNsdXJtsaAT76
	sN2DzirxRZUgoFAl+1DzCg/y3a3HBisxJhzhNDlmNa36DNnOn9CxY4zftzvPaeOBGqFWsP9enT7
	PyqFy97ZMnfw==
X-Google-Smtp-Source: AGHT+IHZCkMRvU1ebyh0sGVf2NLMMyqLlu90qCowRnMKoLmMxtKGnQfXhTbY0WtI4zdzMW1NJgaPSQ==
X-Received: by 2002:a17:903:40c9:b0:235:f77b:4b0e with SMTP id d9443c01a7336-23f981b40aamr66297385ad.41.1753313423090;
        Wed, 23 Jul 2025 16:30:23 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48bc6fbsm1260765ad.120.2025.07.23.16.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 16:30:22 -0700 (PDT)
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
Subject: [PATCH v3 02/13] ARM: dts: aspeed: fuji: Fix DTB warnings
Date: Wed, 23 Jul 2025 16:29:58 -0700
Message-ID: <20250723233013.142337-3-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250723233013.142337-1-rentao.bupt@gmail.com>
References: <20250723233013.142337-1-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_163023_890448_A504B8F4 
X-CRM114-Status: GOOD (  10.51  )
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

Remove redundant adm1278 properties from fuji dts.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
Changes in v3:
  - None.
Changes in v2:
  - None (the patch is introduced in v2).

 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts
index f23c26a3441d..840d19d6b1d4 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts
@@ -248,8 +248,6 @@ imux16: i2c@0 {
 			adm1278@10 {
 				compatible = "adi,adm1278";
 				reg = <0x10>;
-				#address-cells = <1>;
-				#size-cells = <0>;
 				shunt-resistor-micro-ohms = <1500>;
 			};
 		};
@@ -577,8 +575,6 @@ imux67: i2c@3 {
 					adm1278@10 {
 						compatible = "adi,adm1278";
 						reg = <0x10>;
-						#address-cells = <1>;
-						#size-cells = <0>;
 						shunt-resistor-micro-ohms = <250>;
 					};
 				};
@@ -648,8 +644,6 @@ imux75: i2c@3 {
 					adm1278@10 {
 						compatible = "adi,adm1278";
 						reg = <0x10>;
-						#address-cells = <1>;
-						#size-cells = <0>;
 						shunt-resistor-micro-ohms = <250>;
 					};
 				};
-- 
2.47.3


