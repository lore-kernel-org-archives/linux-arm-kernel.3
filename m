Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A30C87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 06:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+vkeH24+gNLlbvhdNPWZDqLWHaKhUsYjVBX3EEgueV8=; b=W0r5AMrKhkjd5BnWLzlbLVdOtD
	PXVNbXpM/xGaItrglVRdD/tUCCGQDDvoUw3oHC5icjHhNfWbWEi/CtsoT3JtMSOIEfde5BOX2iwBg
	DvyyV+hpbucnWWNj6esPDZoMAOCp9o8onIoHNIzYqbx1IkrT1A8LqwXAB0xtBqRvNctqCWqWPPNPX
	mp3m+dUaVO9Y13ect3rYQwMZu/KNG8oZ5NVvYuPFg5cRL5SxcyRbSfgv8FDdP1yLOqR/7jwKNv5Hc
	iSCRCUUZEGpC7mpuXatQsYBP8OwqIFJNH7TUzbjl7zwgjmrOt4n/snZTIHpoJBqtdwc8URlzDg92M
	hjIr/qQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugGwy-0000000DieS-1CkR;
	Mon, 28 Jul 2025 06:03:04 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugGqX-0000000DhKt-0b0G
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 05:56:26 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2402774851fso6265175ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Jul 2025 22:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753682184; x=1754286984; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+vkeH24+gNLlbvhdNPWZDqLWHaKhUsYjVBX3EEgueV8=;
        b=cAY8w4I3Fa+J2DRlljSfq1DtDRRHsQrAFwcFSMvVseILVqdmtcwyCcsmkZdHuQkp4h
         eaj+mwca1G3qGfqPaYHbsPce8J52NwEVWDWM4yZDuSkoi7vvTj39J3lxuNUi7aNi6rdH
         PiSEnRdujW6nEzF73o17LPn09IUxWg4PwVpcHD8YGlsqaYh8VutrfFepNGZsxs5W4hQw
         k5wA/FrqmJvoKjuXPhTkQ+6r3nGHONZFsAwyW19mL7DdD8Lon2zf1hFhtJz4FxO5fDBT
         eu05nj5VOz0p9Tyv7tHCcYGnLqDpiP36Y1KmlzG/q9HJ4k6henBSy/P+lKxoTAQTjv7Z
         48cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753682184; x=1754286984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+vkeH24+gNLlbvhdNPWZDqLWHaKhUsYjVBX3EEgueV8=;
        b=pPOZkgkeSQMEsgg5cJ2HB4KSC+/gxAMcLiXdZQ2A7whMMXvpRrDRiYgV0X9lEBS3tx
         APq+BBHYgrRoeqienCFpJ8I3MqmBS7w+zDab7Be3lUpiceJDhTQxNwK/APH104jJQN7O
         pEckC09QYCsWo+ziVnti4L/i+slYPFv8jUn+xiS4cM4voL/75LEsJhFpqKcRsBdutZQ3
         45rlFXroH7cC5DMDjF2hTutDwxQA2uDmaezrkyARF26ECN3kiGBjm8b5UuV9KkWR4JsK
         BbAjaWMn/BPm2LPVrYiR8uPG5RqK9rZJC8zpRCv0eszq/6IhdgJDm96ryKnWZJjuJ8jH
         dmiw==
X-Forwarded-Encrypted: i=1; AJvYcCW3UT5X9h0BzTgJBvpd9yHaqUNe9i7jSS3rqmVaBww2hgwZvQ5hN0EK7R+C+wTPArV0kV6QKMZC8iUbCEr21/sL@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5wx/dHdsZsa4FYS7fzIA+OKBZsH913B3fZYPza1gWd8EPzjPD
	JW3KpbL2lj7NoRtaDgd108IV8MhC+l8SEPmYgspI+oThWK6d5T+t08wv
X-Gm-Gg: ASbGncsReVFOzghWnl4Da8LodAaSO3lTNpr89H3f6Gl8lT4nJ6I/X0pLXnR/GI1OuAB
	OxuTFf/kqakSycshte0fNPQAf5VjdYs4U+c3DZrrG6xmZBz633vTEbWSWAJwQnERSFwm/nahUL6
	65JJ0VF3tb/9+32yCYEAORKAvj9wfFmF5idM3SgYD5qMsFtBaCRkuSh2yqnil8ZYANaIPmZ8DJp
	S4xYJ2GlHfCWievGJZT8ZIrqILrMo6f/pvE8VX2VJi5KKTn4QPIX/PvW8zq/OR95srUb9Wu0tPc
	tOjSnio2EtzXFje6lh2Kf7nTY7mlTsW/ONHudY4V/Y7uWaU6WZ/mouYDXglracqyjg0CpibZVQM
	j7/1G5YFtgCmgmENabVvDD86854oo5BxzpVk98/gp+Aek6hpWYrS59cPD50bABJUimOqcPnvG9p
	M=
X-Google-Smtp-Source: AGHT+IEe4NPcl+6E+41WcJkDUHNM9DOXgmDHX/lVp0PVK2XqtqJdjesfJx4tkgXmB0ihpgb06l3TIw==
X-Received: by 2002:a17:902:d591:b0:234:d778:13fa with SMTP id d9443c01a7336-23fb30ab963mr126148285ad.26.1753682184183;
        Sun, 27 Jul 2025 22:56:24 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe514b59sm45091795ad.128.2025.07.27.22.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 22:56:23 -0700 (PDT)
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
Subject: [PATCH v4 01/13] ARM: dts: aspeed: wedge400: Fix DTB warnings
Date: Sun, 27 Jul 2025 22:56:03 -0700
Message-ID: <20250728055618.61616-2-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250728055618.61616-1-rentao.bupt@gmail.com>
References: <20250728055618.61616-1-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_225625_184434_935856B2 
X-CRM114-Status: GOOD (  11.58  )
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

Fix the deprecated spi-gpio properties in wedge400 dts.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
Changes in v4:
  - None.
Changes in v3:
  - None.
Changes in v2:
  - None (the patch is introduced in v2).

 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts
index 5a8169bbda87..3e4d30f0884d 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts
@@ -75,9 +75,9 @@ spi_gpio: spi {
 		#size-cells = <0>;
 
 		cs-gpios = <&gpio ASPEED_GPIO(R, 2) GPIO_ACTIVE_LOW>;
-		gpio-sck = <&gpio ASPEED_GPIO(R, 3) GPIO_ACTIVE_HIGH>;
-		gpio-mosi = <&gpio ASPEED_GPIO(R, 4) GPIO_ACTIVE_HIGH>;
-		gpio-miso = <&gpio ASPEED_GPIO(R, 5) GPIO_ACTIVE_HIGH>;
+		sck-gpios = <&gpio ASPEED_GPIO(R, 3) GPIO_ACTIVE_HIGH>;
+		mosi-gpios = <&gpio ASPEED_GPIO(R, 4) GPIO_ACTIVE_HIGH>;
+		miso-gpios = <&gpio ASPEED_GPIO(R, 5) GPIO_ACTIVE_HIGH>;
 		num-chipselects = <1>;
 
 		tpm@0 {
-- 
2.47.3


