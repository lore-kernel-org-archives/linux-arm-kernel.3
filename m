Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 013A3E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 11:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ll6kImbemzHgzysNRe/B4ZjSKDdlmM1jCI9QSTOFJgQ=; b=dGE/ppnlxJPveyGcaB6tD/sZgE
	s1rj7dNXoz52vLfUhy0+1eLWVp5R61obPF4NcSAGmIy/GoI7St5UBc2I2BfsxsoROS9f+GHnXdsAs
	kcPAuLsEjMLEw7UtvKpOAiSmlzDtPP4CeNTBNrA6QMOVMEqfA9lf++lHYPt0tagFclxvmsMH566FI
	EgnoJI1Qp6/RlY1jyXVrmWsCJPZyYoBUuu+R0BHLZAVpHxjggQuA0ZE3G8VX1Sp3eAbfIyq8pUxLl
	svMrbT9bm0CZ6qkuIX63SbqXX65/rcqCyM+gfTOV/Louw6zv3BA63sZwUNq5R1A96RsDbt23xc3iH
	RLLiY4uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLL4e-0000000Ejlx-2Kyu;
	Wed, 11 Dec 2024 11:40:12 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLL0L-0000000Eiz8-2pRs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 11:35:47 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-20cf3e36a76so58082345ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 03:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733916945; x=1734521745; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ll6kImbemzHgzysNRe/B4ZjSKDdlmM1jCI9QSTOFJgQ=;
        b=L6HjjKpTezHUDpqEDDc0SfjfbUQCEbYmsFUEFxhl5LLpt4d5M+2fZd3LbHF+EbwsF1
         q4dtc5wfXo1TVMHSViy4wqWWJuYbcNqMMJeo2yGRe3xIH9gt6caIEjDW+eZQrBA87fIj
         xO3+Fv93CVZffCudWoqJ+K5eorw2fPMgYyjN+urwnRr6j2bl5UwKoFmgQwG/Y9xRAdGj
         e1X7G7CrdNOsf76B0kod7/xsmWKbsx+1cCcykj4wOJX6ecpGDaY4REf9ejK1sQ4Hevjq
         kUtSn8vcvd/VY2EiBsz1q9Tvu2Z9SVqdrT5q5dmnQsUwHLnf0WGHyVhQg/Tbu0nzinmG
         XoDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733916945; x=1734521745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ll6kImbemzHgzysNRe/B4ZjSKDdlmM1jCI9QSTOFJgQ=;
        b=DzRJuDBRBLbt/fwKTOFlSG9NUsMjFsYxkhdUDLKxVMYMsEbI5zusjC/AQ8FpJmuSIS
         A0tsE3MI7cagQCjRJ2hJRxVNPq33haCfDCR550ckhM2M3NNO5LfP7fb8ylrojDXGqzLh
         jWeHbEop/wEJs5erQ35ohlQ/URbdrtkVunH2vxTuzJJbDIxctuHz0flwI90KU+IR7Vo5
         HbqhaWMTHk+ANv6hU1+MnNIcR+Qq3ftAKJcHWIWOWFAbE21VcUhLsCdCHKHCU/rpreEU
         ZnCpbpdYHj/8oKFwS2PvS0YJvrUAh/47n8d6GiKYDNyE11IDBxW21oJLogwV4bupaPs2
         O2Uw==
X-Forwarded-Encrypted: i=1; AJvYcCU1h2mVaPNnhONQuERDi0ONp1TR7vxZ25hDBM+5V5rD5h1/8nTghraD1JwLh8bGvegl9PBAKY7OP7ggPIgcckMs@lists.infradead.org
X-Gm-Message-State: AOJu0Yyg8YRIhzUvcGTu/0zKafTV0I0fiN58MisipCnft0cSrAthBjkt
	TI+5Tdnfq59ibJcpVOUcayhLBdFQiyAYFtX+07oulGNz+KCsWlQ7
X-Gm-Gg: ASbGncsIFsK9D4Yq816WPb65uiLTNx5i1aR5f7VQY7B5BqzqNq209IPmginzSGYfMTa
	ye6ZQVId6ycij10IcL8VeCNHSVdky0qjkAvOZzjb/i5I6lQWaGZBZjvKnaylttaP6fCrEjthFZS
	ySO8Yutcks4CHTL842IXoYfzzgNrW3/9KZO8lQeQPUsM35PmiBiXfdE9SsZ3PsZfY1R8s5dLZvv
	9KZaJBNcU8vr+gBRttgnUn7e3Cf+PO8d91Usvn6VF2VSvSFc+JGZS7eHJwntZXnVEE4xw==
X-Google-Smtp-Source: AGHT+IHPAoO6sweD7dzjHfcotRsgZIyMZdFaVq66RcEqv2cWXKrGq8y5aDUwVllnUENLHzeU5YMTvg==
X-Received: by 2002:a17:902:d2c5:b0:216:2f91:92c7 with SMTP id d9443c01a7336-21778393b92mr49397375ad.12.1733916944690;
        Wed, 11 Dec 2024 03:35:44 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-216404df131sm56765635ad.203.2024.12.11.03.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 03:35:43 -0800 (PST)
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
Subject: [PATCH v4 3/3] MAINTAINERS: Add entries for Apple DWI backlight controller
Date: Wed, 11 Dec 2024 19:34:39 +0800
Message-ID: <20241211113512.19009-4-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241211113512.19009-1-towinchenmi@gmail.com>
References: <20241211113512.19009-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_033545_733477_473DB77B 
X-CRM114-Status: GOOD (  11.18  )
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
index 17daa9ee9384..3a7dec3f9a5a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2196,6 +2196,7 @@ F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/apple,*
 F:	Documentation/devicetree/bindings/iommu/apple,dart.yaml
 F:	Documentation/devicetree/bindings/iommu/apple,sart.yaml
+F:	Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
 F:	Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
 F:	Documentation/devicetree/bindings/net/bluetooth/brcm,bcm4377-bluetooth.yaml
 F:	Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
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


