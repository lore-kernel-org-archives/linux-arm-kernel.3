Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F90C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 04:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d4zGUQOdnJ69KAUBlNTKEGfxN8OGbSwbnbCSpcFHfJs=; b=XnSUJkjPaNrPw9mNlB1ewFOcCC
	X3Ks2YEzCtXjYBVphvMysXiNOopeKsNUbGFKZSlofXOe46CThFx88pR7C4+Gh05+1E+xOM1ClQZhJ
	v7IjKT4VwhNtAFz494d7UqamEOyeN3jJUNAx4aCHm7WYhiSzWA0vg5ZNcoEfrgL1xR6Cn/rdNVQZg
	+747qPQjvrCv8tat3SSC92R9aUf/8EATOapfa3iMIx+pt+Z0sFFu8D3EVb8gPRQrpXOW7jGqnRFZ+
	TeEwtDgt6yp6kG1Ogmh4+puS8A723i0u06Q0hImOjIpZINjhrJzx1LF38/XEAE5LfMYUCrwXkhqfH
	WIUC/jWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYHBR-0000000HNb2-1h7W;
	Sun, 06 Jul 2025 04:40:57 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYGvL-0000000HLiq-2znN
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 04:24:20 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-74b27c1481bso1214073b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Jul 2025 21:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751775859; x=1752380659; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d4zGUQOdnJ69KAUBlNTKEGfxN8OGbSwbnbCSpcFHfJs=;
        b=fPf61dFAcN32QRbuYhwciYSWeEVMtZ87ZkNXRyVqm2meK01wlI9ED6tvrms8zt+ZG/
         Y2LuWoNtB4qZj0UHCfuBGgpkZflE44Sbcoz0kfOuc4qt9LT7qebaEyRrLmmDI2cqDHQP
         BVkCqwBm8syI0lclO8C1VviiRewqNKA+PfvQIyeJREmjICCwTcArO72aqJBhJWf9D0F/
         jzfGgeZnjGxP1N+BGJgLmoXqt0wA0zUdRHwKhPvft2l45NAhF2DBMyoYi3BShfwwjgR0
         KJwpuDID3M+yCPvFoljmQXt2MIMe3nKB2DTGmS8Gwt5jVjxYC2lo7y8AXv9ym8tSLcVv
         xEkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751775859; x=1752380659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d4zGUQOdnJ69KAUBlNTKEGfxN8OGbSwbnbCSpcFHfJs=;
        b=OjURpIi8NhLWWMln7tIk2LKcjRfOiUg0dQZAnDDpNYO7VIlT5pC8A5XIjnCuqPhqm0
         fXD3Bubjz4dDVFOPOME1A2EhxWpiU168xzOIlD/j5hc4Tt7GXAwMNuRZu+En9dtMwu2M
         5AI4PCZYhN/hmMb6n6DAGgfv0HISzK7JOPKkCiIk0DoM3wJHlr+se6GG2WtrijwiM6km
         Z4a01lSR3d/mpgSjj3QZXTWcenYOM0wBrqwl27zaqfTxkpWFUFdk3JK09tf4r1bfyoLW
         AAMJts9TNqP1NBBKfUih2NQUnGxwksZ+5jhREA9ujch6HqSZ6jm09coiHNMqObFvtqPi
         IEOg==
X-Forwarded-Encrypted: i=1; AJvYcCXQIenSW2XfW353O6h0AJBFNw2UMkJbJJngzSlkb660kWmP7TatSoJMCX/8Shs75bKBxyD6yHbwvQ/POwEbdlff@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0k0ktZr8rBR24ra1c/DVBf6q5jApKwEHonQsSXGLP/AfzniDr
	J6xbWN1uxt5ftSt+Dxj3blakS+YfLhwyXwFYwzAyitcw3F4IrQ4yETuS
X-Gm-Gg: ASbGncsdGAZ26LCvAAuSZ4S6lC9TcEJn4PKCu0qF0OP9lzcoE9gg3SSMjKRllxOmO+K
	URPhtajrtQsiP6xJxZVUviTdke/P1ZsO/6kPLRtCGi+KpyfIxKGQ2zDjQfKHVnov7s1zRZe4kQR
	lqhR0TxTaIo9gfCrUMeB7WRFnXA6vVaUy73+cSIyhjhlrCFu0QXpN11Pps/iVwwLf3iGkNN6Qip
	79qH6EPv0BLqd0mKRCFGMtqOok437vSkEYB4Oz2LflquXgf0z5g7zGT586X6INiSomGX0Da1dbs
	OrBt3aEHXK4Iohv+oYDnIM0POX9fq25jAtQnIY4ca83IfqQ9j6y+mJuicW9UJ0XCr6uc4Twj2hL
	1RPtYbA/AppX+2Ya/WwDVDhhDdGEgCWrms4pUVMs=
X-Google-Smtp-Source: AGHT+IHRyoxO9wJjn3WxYHJI0BaRuQ8jiymleujUzsWOOYUm3nMO8dl2iwjV6yLqVVunAz/SEaHFiw==
X-Received: by 2002:a05:6a00:23c6:b0:748:fd94:e62a with SMTP id d2e1a72fcca58-74cf6f17155mr6130664b3a.1.1751775858985;
        Sat, 05 Jul 2025 21:24:18 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce417f206sm5287067b3a.76.2025.07.05.21.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 21:24:18 -0700 (PDT)
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
Subject: [PATCH v2 6/9] ARM: dts: aspeed: Move flash layout out of Facebook netbmc-common.dtsi
Date: Sat,  5 Jul 2025 21:23:56 -0700
Message-ID: <20250706042404.138128-7-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250706042404.138128-1-rentao.bupt@gmail.com>
References: <20250706042404.138128-1-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_212419_756386_181DF225 
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

Move BMC flash layout from ast2600-facebook-netbmc-common.dtsi to each
BMC platform so it's easier to apply different layout settings.

The fuji data0 partition was already extended to 64MB in Meta
environment. Elbert flash layout is not changed.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
Changes in v2:
  - None (the patch is introduced in v2).

 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dts     | 6 ++++++
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts       | 6 ++++++
 .../arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi | 2 --
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dts
index 74f3c67e0eff..673cabbec92e 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dts
@@ -50,6 +50,12 @@ spi_gpio: spi {
 	};
 };
 
+&fmc {
+	flash@0 {
+#include "facebook-bmc-flash-layout-128.dtsi"
+	};
+};
+
 &lpc_ctrl {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts
index 840d19d6b1d4..71f58ad1ff06 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts
@@ -223,6 +223,12 @@ eeprom@2 {
 	};
 };
 
+&fmc {
+	flash@0 {
+#include "facebook-bmc-flash-layout-128-data64.dtsi"
+	};
+};
+
 &i2c0 {
 	multi-master;
 	bus-frequency = <1000000>;
diff --git a/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi b/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi
index 208cf6567ed4..4f819bf8c909 100644
--- a/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi
+++ b/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi
@@ -54,8 +54,6 @@ flash@0 {
 		status = "okay";
 		m25p,fast-read;
 		label = "spi0.0";
-
-#include "facebook-bmc-flash-layout-128.dtsi"
 	};
 
 	flash@1 {
-- 
2.47.1


