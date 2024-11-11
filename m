Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B833D2E9D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 09:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Moeko09cNn/tBMWxRyaAP4nMoxzoQVrPZMKwS5ag9u4=; b=FnWPP7pSMqvJPL5CzgTephbvfO
	StHV8BOS2D029n4boT7yjsq2QH6yiEKtPv77cmBskfUey7cGdXisigGN4Vr830Nc13oDkqxicatsZ
	R/65tEX8NBvvBm+GqDMVrFjeBt0zeLwO4+mGsfHPeojiPaeBYOpFGw5LFnJqIY5WhvN1Kjx+u8fmx
	Kt5bF4YCEGsfllay8CI5DMP2uSeYuBamfUP49ItJZJZUwlbzk3tdp+KJke6RUZWqd3zh0wIA6nD8t
	wstaqpfsNNtpKoiTvcyQX0xTXG01/SyPIfK9rB2I3vf4tG/Es4/0ubyjoEPZUOVI/krkIGjyITMEr
	mHytgnEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tARB3-0000000HC3U-2QMz;
	Mon, 11 Nov 2024 09:57:45 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQzk-0000000HA6v-1X0q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 09:46:06 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-20ca388d242so43392485ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 01:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731318363; x=1731923163; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Moeko09cNn/tBMWxRyaAP4nMoxzoQVrPZMKwS5ag9u4=;
        b=VgcOiS+JfpLPsZNJNROYCL62usBpBljE62U914dSNYZB/e7S1Audh97kOwUXUQk/VD
         SyuEf8rYewm84lPFIB9mO1c59xvLUQHxYyhavaxmXYLXBkp04QUHFk4PgNGs06girb3N
         SXVD9mXvT4XDmTIaVS8TNf4T9jksAbP3GPnRvTNxhWzx8aqntXnaokTAeEu4hh3LX195
         9Iy9L/AzkggBN8VHN/V/zoLyzaFhLtumcrJY13+WccWzB/H+r307xWlqdur8wkl4Op1T
         AxVn9X0uaL31ILlu9FEemOTlsP4wULTJGNyHY3akcSj2fTufSCk8QjF142HzZf2ldQbS
         7eKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731318363; x=1731923163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Moeko09cNn/tBMWxRyaAP4nMoxzoQVrPZMKwS5ag9u4=;
        b=SKpAYyWMBmd4OCtUZ+QtV2kCjqeQavWtgKsG4+0lvNp0Pim0kUxFwMrBrLES5+RhJc
         0jgL59dThP3+/SZdt9ifOFRUb6f6u9YLeeMkOOhlAgZ60oX5MsP/oqbFKrDTVtvXCdjQ
         bW0tkrxFOyekLK05TNH7bvh8RwKc9A4BEZwaTkWDAMPQl6oCLDf6KCjgPQreN660YZva
         vsMYTUAcaY9FT0D5PXIWU3vMLoOnLvuPilzjYqnxXVdxc7aVcB/NX24yx4R/K5CfgcHX
         ZHrOa0Rou4J2fy3IBnnrVhUOojq7YMQh0h4iFm8dHorImrFFVQ0JKoo8fLfcbAnnyB0/
         r2MA==
X-Forwarded-Encrypted: i=1; AJvYcCXk4iHrg0m3bvTCA8YuHOBs3DnMoTxzKlUYSmfWmly64sk9C+gHzhG+FGZ1rPm3Hb+Dk6whMCDaSq/2IKCTY8/R@lists.infradead.org
X-Gm-Message-State: AOJu0Ywu7d6xSTkImvny4rgDCT5k6PM65I09maXHzb/RoK73+vToKA4a
	PU9rTZJky7/gFaVDKDxclsM0AXjmgfVyODmzT8RSWASwO/fL7rza
X-Google-Smtp-Source: AGHT+IESsUyRzaYuCfvnsyqDABRyOahsKXzjXNQUOb+dN8bhzGQnX6lynJCsKMqXKxgd1GTq7ZrUHA==
X-Received: by 2002:a17:902:fc4b:b0:20c:f9ec:cd8a with SMTP id d9443c01a7336-21183d11392mr184701115ad.7.1731318363232;
        Mon, 11 Nov 2024 01:46:03 -0800 (PST)
Received: from peter-bmc.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177dc826fsm72248725ad.11.2024.11.11.01.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 01:46:02 -0800 (PST)
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
Subject: [PATCH v1 4/5] ARM: dts: aspeed: Harma: add e1s power monitor
Date: Mon, 11 Nov 2024 17:43:48 +0800
Message-Id: <20241111094349.2894060-5-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241111094349.2894060-1-peteryin.openbmc@gmail.com>
References: <20241111094349.2894060-1-peteryin.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_014604_481605_EBCDF5C0 
X-CRM114-Status: GOOD (  10.11  )
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

Add E1S power monitor device.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 .../arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index ce1731bdc1af..9d7e7208562b 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -354,11 +354,22 @@ imux22: i2c@0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0>;
+
+			power-monitor@45 {
+				compatible = "ti,ina230";
+				reg = <0x45>;
+			};
+
 		};
 		imux23: i2c@1 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <1>;
+
+			power-monitor@45 {
+				compatible = "ti,ina230";
+				reg = <0x45>;
+			};
 		};
 	};
 };
-- 
2.25.1


