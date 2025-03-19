Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF31C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 16:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XyUIVOLZhlVIcgING8aBn5z7brc7JiCZIt0y5wEI684=; b=4/PkeAdMxu5c+7MSFsWSH+V6Ev
	7DjiVAPiHefiS4fULjJaO3AMRSangkYEhmiebhf9ExBl9KqwFtUTy0E0EmApuasa3Hi2AgrzvEv+i
	SuskM1IFMVhj7kPCNGhE26H8JNoSeRL2aCR40xW3r7FnXWfzMMGrSLCl34xy4R/bj6Voy1E4/4XaS
	aUunL8V4RxWjvUWbQ/oLFzynjpOivR0DzLqsWPKaWlW3XajKCGHDESwgjPQMzWrjp2EUohEI3B8c6
	ycUV0ozacbV3mp3RrLhm2PBa0RStTc9LVNUEkEbjgvkFa/6zEO03uTclxxxpRjD8p69YRDwrpNQvs
	ZM/1HTVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuwfV-00000009bbR-2AmX;
	Wed, 19 Mar 2025 16:53:25 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuwc6-00000009aq0-1aFf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 16:49:55 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-300fefb8e06so8906928a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 09:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742402993; x=1743007793; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XyUIVOLZhlVIcgING8aBn5z7brc7JiCZIt0y5wEI684=;
        b=R8IR74dPfuqLjBFdMsxrL72QvhxYH/4h0MdA6oxsEStvjk19gQjzNDRINIYTAlu8gU
         9MsV4fl7rhIFZUWlJ/QyEbvKpAP3Ud/BTbG+8b5v/jrqgfuM7Ur4GAHbj9KrIKmWfNky
         OhThWzaXUv2uW5PINdowP7Py1OeC3ACQl3um44frhQcAJFHY94yw9EjYpsd8G/lCiPRN
         IMv/dWhgL2O5jy7/gUOw07hA5jvVio66Vsn/WJ0rI3MXuEyUL23AMTMniHd3dipaEYcp
         fZQNlKD4bZoWXlKsiTlCYWtp/HZarMMp6cgNbiF5n9/2LzU6D+elcSZE4JDPWeMUUhHE
         w7Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742402993; x=1743007793;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XyUIVOLZhlVIcgING8aBn5z7brc7JiCZIt0y5wEI684=;
        b=q9ivYhM/YPb7Dd402YthFhKYUfH7TRRV8LxoSVlnWWcghnSRyM9Y7NzUHYS316XuZv
         zYt+jFjx03ntqNATf+Ck6cGuK0PsOlT5+GMJA+nsjgregmiRbgspPcUaEE0/KhT3WRjE
         qhtIQYpOGzbZzqxfuLIM8bU0nnOJ104/FpCDgvdsfnOJPCyKai578vvQ/0xH47km9ZNY
         514vRSkdAnW0WNrQfWQQ1vopH3jVEC2wBhQAAdYF0/gTTIdQO/DO7YtZSi+x6sxTNZN5
         oA3TELosFa8zlyyl/BJGm6b9DBoDX9bsjlKjBv96S8Kkx3MfiQ/MPLa785s5HA7iA3Q4
         CaLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaRyboB+tkY8OSgACo2Sio4jgr4Kd1rfk60+RHjBcFucwxAdd35qlSyGepCcvRrpIF3sv6lGs9G8S3SU75Zv21@lists.infradead.org
X-Gm-Message-State: AOJu0YwG7f7kfQZM6qvEObJmPJfxYH+nNqyhFrA/T2mIf2yUvXM3/7zR
	CBie8I95pb+EsazcKq4sBG1avRfz7Cv9mDqfbnOBHYLbx867DuSI
X-Gm-Gg: ASbGnctHOcFxn7AKyKu4CBrPDwd8yTvjML2SQ+XHJObNLXMMDTaAMFKxpb7prJayR4F
	waKpPeGldjWZrnCLv8y1W2vTCgEC1+LDDu16Bmrb+Grdy1RXvIyWt+Xdgovw9wpw4kVIkZQxAWk
	70+m+LT50/+9OC0/z3c55ryZAvPiraaZ7plDv7+xWy+c7l2jZhiAI++oQZf9fkIT/gO8fFXKBq4
	bpPjKhEcPvPS36OTOPsGmBzy2X2O1FUrhi4d6kdJftQ5aBauHaTbnlINRl7yRQFiUidhX702m0o
	W0Z6s2TFs3kkGu+iIVjd/3ZlddxJrkTTZN10ZoBz001oNWb9cVaZ5UNVSfBQKZydsJBzluJW+93
	SJrBtMEQULBxZEji49J2kErWzb65u9NZq
X-Google-Smtp-Source: AGHT+IHhdqRvGiRnM02XFEBX0cT/Yyoc/AZdF4bSUHhB9t9As2aIDMWD+63C8qtFZMUEBd6evCXPOw==
X-Received: by 2002:a17:90b:268a:b0:2fe:9e6c:add9 with SMTP id 98e67ed59e1d1-301bde76a0cmr6126690a91.18.1742402993479;
        Wed, 19 Mar 2025 09:49:53 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf576bc2sm1863641a91.5.2025.03.19.09.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 09:49:53 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Thu, 20 Mar 2025 00:47:22 +0800
Subject: [PATCH v4 1/8] ARM: dts: aspeed: catalina: Add IO Mezz board
 thermal sensor nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250320-potin-catalina-dts-update-20250102-v4-1-7c34b8139014@gmail.com>
References: <20250320-potin-catalina-dts-update-20250102-v4-0-7c34b8139014@gmail.com>
In-Reply-To: <20250320-potin-catalina-dts-update-20250102-v4-0-7c34b8139014@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742402988; l=1855;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=abmTlOlW8yHuHGZo8Vfx2BNiu7X70YAM3VxyVW2QeUw=;
 b=AmSie4wj+dx1uYqkqheVZm6XmYA2naDZizT1XoSzDVfNXANH9iEsSE+cuwJPhKnXlARR5KtMO
 rDRQS0FYu2gDx54jdp4YhRlS4Nnm9oDcaEvqWKEXcTvCS/FKw4BTONI
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_094954_419833_D622B729 
X-CRM114-Status: GOOD (  11.15  )
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

Add thermal sensor nodes for the IO Mezzanine (IO Mezz) board in the
Catalina platform device tree. These nodes enable temperature monitoring
for the backend NIC, improving thermal management and monitoring
capabilities.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-catalina.dts    | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
index 3822bb3c9243..75c3906d9654 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
@@ -190,6 +190,12 @@ i2c0mux0ch0: i2c@0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0>;
+
+			// IOB0 NIC0 TEMP
+			temperature-sensor@1f {
+				compatible = "ti,tmp421";
+				reg = <0x1f>;
+			};
 		};
 		i2c0mux0ch1: i2c@1 {
 			#address-cells = <1>;
@@ -200,6 +206,12 @@ i2c0mux0ch2: i2c@2 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <2>;
+
+			// IOB0 NIC1 TEMP
+			temperature-sensor@1f {
+				compatible = "ti,tmp421";
+				reg = <0x1f>;
+			};
 		};
 		i2c0mux0ch3: i2c@3 {
 			#address-cells = <1>;
@@ -361,6 +373,12 @@ i2c0mux3ch0: i2c@0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0>;
+
+			// IOB1 NIC0 TEMP
+			temperature-sensor@1f {
+				compatible = "ti,tmp421";
+				reg = <0x1f>;
+			};
 		};
 		i2c0mux3ch1: i2c@1 {
 			#address-cells = <1>;
@@ -371,6 +389,12 @@ i2c0mux3ch2: i2c@2 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <2>;
+
+			// IOB1 NIC1 TEMP
+			temperature-sensor@1f {
+				compatible = "ti,tmp421";
+				reg = <0x1f>;
+			};
 		};
 		i2c0mux3ch3: i2c@3 {
 			#address-cells = <1>;

-- 
2.31.1


