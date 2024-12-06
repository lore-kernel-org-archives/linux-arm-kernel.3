Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD42FE77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 17:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TFVSrkNiEMMJAigz7OiMiNZjcf3pYxRxO/MhDZIhBgc=; b=1c2wOqHIq3wlC4wFuWMBOXGqam
	ZjtSDJCgp5YnU7EJVz+n59EL02kXX0acJznxUuOBFTPLpeiR9Y3b5Y9tYeAhjs8lGlbEBP7L5Mzin
	vLNy4uJ7okMmm8cMmU0Lc0J4UMDfhtm93VEkmOjFaZ/pOG4WNWkcNLxrYdsF8PhEQb4kHQLgzQjZS
	2Gv2GIXga7wAPP0XGW5LO+Drp9n84o2YYzTo/5WlCVx/GMaM6KHzsyRU+XXX299beIA/HJLR6nzgr
	ClsxP65gXqlHGkV2kbgA8iJwHHQgYXp9U4Rc13Xwob4m7qxEFujiAWBAitBR4Ip9SHz0b2sx8uhpl
	y4yCOvfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJcBd-00000002LtF-0sDa;
	Fri, 06 Dec 2024 17:32:17 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJc7p-00000002L12-030S
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 17:28:22 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-21577f65bdeso19798065ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 09:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733506100; x=1734110900; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TFVSrkNiEMMJAigz7OiMiNZjcf3pYxRxO/MhDZIhBgc=;
        b=U7R0lq/OR2YqQPLGD2FWmK8NWRiSUmEm1vuFJ6G3unhvBNFyK4oH9DkZGrYSiFYRU6
         APrq+BLMwTAvpUVQTRo1ikWKShtAkvyTNdf6+9s3ElF/pT6afFNdZ9/XSX65TS5DBKP7
         qHsjdQL/OH3DQIVg/XVNxMifnJHx2NFp6X+Sa4mMIwFCGdRfj66/jvl2BNuO79ZXgTnI
         T3XlO6WVjehfPdYyBusqkiVTdVWoqnEFFXxAzb5laSCAK25Yk6MTXNmWg54T8SXfdnnD
         7cV8s1aTEuzPkuXU5TVeQaOqoHsHMF0i/euzp79RPwWb0YBwQwVi+Zv/ucdpDA/2lZJS
         RfyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733506100; x=1734110900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TFVSrkNiEMMJAigz7OiMiNZjcf3pYxRxO/MhDZIhBgc=;
        b=j6ZGm/AfUzvfMlucS7T4XaqwXj3IpvppGWflkd4nw972wJ9HGdEQwwc3myTO/p3/vy
         6Z67I1Jt3Wgqx+0bGQZrzj5CxLlmCBBh60Rg7FVWCR6vcjRz84beiI1z+Tk4uTSY0S8E
         FECcKEroEm5m6wKi93Jx3Ydi0qPEvf1JFbpI57cs9q9bKq9wTHJFLXjONooxMbnLgGpq
         3hx71QBZWHL0vN2/qJRAqPQaYKnf6AGPCvpt/z0YhWjwKCQ/VpFcj37olrNOX32YwNf3
         BesaBVlqJEAoVEwLF0DAzd2ln6aNtCPY0m0Bu7lTwSXab3HJXlLlcaYxsfSqtrDn4sEi
         tZIA==
X-Forwarded-Encrypted: i=1; AJvYcCWaGTPHXBvT9xVWxI9OYroq7WBLvNjOGTPkRM1/DISTo1GZGBKY9nLyZri2Ksp21AL2Nuwcq84XUMno7SqYt5qP@lists.infradead.org
X-Gm-Message-State: AOJu0YyI+qkfBl39TCMZ56MbwrUqRfpk5DsJOGecEZQ++VdlztFlfezU
	zLi6+L9hf8xo5nzI5KNlUrHHbbH3UH/GQuNcl1F196nqKtkzqrK1
X-Gm-Gg: ASbGncvu1fkK964gMEJ2rzX3NW7pS3FpkJN4Oi2l9Bt8azniHtjLt/ZyNYeKue6c+7B
	HnjVh6+d9Z0Y8Dftdk7duGqllCZELoRdbAEDfqZ8EtH8i+cxjbx8GHZpf3lQLFrBh3y+XwVIfKB
	lePuRhLltYh9xmzc9lxksbqNZz8CuNf+G5Zf0sK/aX0GyueywfMPzESkeHrdZxS4pwMizsz3O0a
	XeIWRbzkem4ho3mLe++QsaaI58xbwMnc2weaQmcmIoIp8+zfN94uYyn8TOf3KwG
X-Google-Smtp-Source: AGHT+IEVb+55XJwsVSf3sPuxfD1Q4oPqF1cheGO9d/Bp3KK/wuSlgII2poZhwuZv0OaHB03V7/rOhA==
X-Received: by 2002:a17:902:e3cd:b0:216:11cf:7b1 with SMTP id d9443c01a7336-21611cf2958mr46087885ad.15.1733506099695;
        Fri, 06 Dec 2024 09:28:19 -0800 (PST)
Received: from localhost.localdomain ([49.130.54.203])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-725a2cc6950sm3204512b3a.173.2024.12.06.09.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 09:28:19 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Nick Chan <towinchenmi@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/3] MAINTAINERS: Add entries for Apple DWI backlight controller
Date: Sat,  7 Dec 2024 01:24:35 +0800
Message-ID: <20241206172735.4310-4-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241206172735.4310-1-towinchenmi@gmail.com>
References: <20241206172735.4310-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_092821_047316_71A16400 
X-CRM114-Status: GOOD (  10.79  )
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

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1e930c7a58b1..36de76bc6fd4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2204,6 +2204,7 @@ F:	Documentation/devicetree/bindings/pci/apple,pcie.yaml
 F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
 F:	Documentation/devicetree/bindings/power/apple*
 F:	Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
+F:	Documentation/devicetree/bindings/video/backlight/apple,dwi-bl.yaml
 F:	Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
 F:	arch/arm64/boot/dts/apple/
 F:	drivers/bluetooth/hci_bcm4377.c
@@ -2221,6 +2222,7 @@ F:	drivers/nvmem/apple-efuses.c
 F:	drivers/pinctrl/pinctrl-apple-gpio.c
 F:	drivers/pwm/pwm-apple.c
 F:	drivers/soc/apple/*
+F:	drivers/video/backlight/dwi_bl.c
 F:	drivers/watchdog/apple_wdt.c
 F:	include/dt-bindings/interrupt-controller/apple-aic.h
 F:	include/dt-bindings/pinctrl/apple.h
-- 
2.47.1


