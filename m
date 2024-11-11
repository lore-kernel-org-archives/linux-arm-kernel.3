Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 105E4D2E9D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 09:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eNks32tb/xOghmG+mNYQSKO0C3AuMd7n2d+nPZVJVl4=; b=QOdk0awtHQcjGjJjPclhsek6Ue
	+M7Vl2z2A8PdddZTkmw5s6tIzCqxX6Qt2SIY/eiwxXYF+Pyrr8SMA70lrZPv/Vvwa/voUaTnpfGQJ
	4ZhXtkl3PBQBEoHlcfFdMpXYcKeg0jWvfDc3vW7mCY6a7FW5jtYy/8Z6r0OJh3kmoXbUxQagzF2at
	ft6iIFWi5Y4a8zE9T6/xyZy7eAsX5e12TjRMZBuAzZg8VkXZTNSlmJttHwxcHiXlrzQ/0hY1Cp+jQ
	KeNrkWstk32xiBolAmb7humX5JvWFPE4VsMjwKyUV68OcMozeXn9Bo5egxWRa4iS38Ztt3jZfklol
	GI6/nugw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tARCm-0000000HCF2-0ndU;
	Mon, 11 Nov 2024 09:59:32 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQzn-0000000HA7z-00Aj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 09:46:08 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-211a4682fcaso2805045ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 01:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731318365; x=1731923165; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eNks32tb/xOghmG+mNYQSKO0C3AuMd7n2d+nPZVJVl4=;
        b=HrOQPe3ekX08h7hauuzcxSxkB4YRfoCNt6g0OgSzJJ2xiHVG4ePc5OdKSeNzhWIHWd
         ih17uQqhhDsmqRCN/slzNpSwOaDaTVvEOm5XKxLNJ52Iltx9++RKphVza0x4gG8nxGvf
         /4Vxw2IH2AxNoNa/VjqxWUInaLqKIpxG5bhL5GY1asguEyOCppKMgfk/SuB5JDK8ekcZ
         FEZ2nfVHgv/FL/goH9C2ZkFuq5AvPv2quOTFtfKJRHhyU8eETcdcFS6GY3KtFS/DHmur
         1PhNW9GedumRTZjbMS24Y//HQzCI5x0RP3w/P2OT27r1rTPrURY/pNhHCmZI+ZVznwqx
         /FdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731318365; x=1731923165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eNks32tb/xOghmG+mNYQSKO0C3AuMd7n2d+nPZVJVl4=;
        b=bpgMeBX5efbfZrPeBsi3awWL8rexbC7feQFAACUcytKn9ev94oL1eN+OJjwkOaZ6cA
         XkdFls45jmuzVZDeqDk5/sHRrvP+GTc7mdZGAoWoQctRGamIQ/dKTMGVKBpUp+vW/GWC
         8l2F2/oLlCg3TilJLajJjtEYNhyOvJ9pkF0rync3gPCqmAUj7+sK+fPJd2zg9azl1pPz
         YOZ+OB5OQFMf3OsKqwWX0EzzNh3wj30Pdd2l3mbxbvcJ1kJkHH6wom6V1XVD9qrFf/PD
         8Bn5mLE2ACyIyNioXk8jekNnPWeLKzpj3KT2N/GpedLQesr/+vpaOcgn7a/qM/Xu4qDR
         kbxw==
X-Forwarded-Encrypted: i=1; AJvYcCUjp2ucV1whN+eQmEpp7Xf3RN1iPVGh88SOvTiT/lcirmtKoDwjtVrv7xiZOK9+77ljVIRWZCwPo2WDazouLAsx@lists.infradead.org
X-Gm-Message-State: AOJu0YzlrQCG3QzBIooH9oLqY5FdI+ZBzvi4RN3me5bt4zWyvDfUR5gC
	TGTyksT0XqXEe7u5Qp8dXtEm84g9JpWrd3zt7aJPDcZE0bFzaqko
X-Google-Smtp-Source: AGHT+IE1c5elCHCi3OEQodIARSHjGMgZMZMY65tQlUc5wZSO5OedFsdVLtGbaV9F3x5W+AiCReKDzg==
X-Received: by 2002:a17:903:2b08:b0:20c:f292:3a21 with SMTP id d9443c01a7336-21183507b88mr163069235ad.15.1731318365569;
        Mon, 11 Nov 2024 01:46:05 -0800 (PST)
Received: from peter-bmc.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177dc826fsm72248725ad.11.2024.11.11.01.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 01:46:05 -0800 (PST)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 5/5] ARM: dts: aspeed: Harma: fan board io-expander
Date: Mon, 11 Nov 2024 17:43:49 +0800
Message-Id: <20241111094349.2894060-6-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241111094349.2894060-1-peteryin.openbmc@gmail.com>
References: <20241111094349.2894060-1-peteryin.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_014607_086371_0920E60F 
X-CRM114-Status: UNSURE (   9.69  )
X-CRM114-Notice: Please train this message.
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

Add fan board gpio io-expander to check fan board status.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index 9d7e7208562b..58eba5fb6262 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -218,6 +218,25 @@ temperature-sensor@4b {
 		compatible = "ti,tmp75";
 		reg = <0x4b>;
 	};
+
+	gpio@12 {
+		compatible = "nxp,pca9555";
+		reg = <0x12>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&sgpiom0>;
+		interrupts = <116 IRQ_TYPE_LEVEL_LOW>;
+
+		gpio-line-names =
+		"","",
+		"","",
+		"","",
+		"","",
+		"","",
+		"","",
+		"","fcb1-activate",
+		"","";
+	};
 };
 
 &i2c1 {
@@ -273,6 +292,25 @@ temperature-sensor@4b {
 		compatible = "ti,tmp75";
 		reg = <0x4b>;
 	};
+
+	gpio@12 {
+		compatible = "nxp,pca9555";
+		reg = <0x12>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&sgpiom0>;
+		interrupts = <114 IRQ_TYPE_LEVEL_LOW>;
+
+		gpio-line-names =
+		"","",
+		"","",
+		"","",
+		"","",
+		"","",
+		"","",
+		"","fcb0-activate",
+		"","";
+	};
 };
 
 &i2c3 {
-- 
2.25.1


