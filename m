Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1686BCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 03:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oAJYYsubH767ZAAG6Ssy/u0Z9S4icmj/JgueQ+Oc+lI=; b=hzcohR4i7J0NQ+O8JXtkwMmHEJ
	3UBRiBi/TAS06lUOoDxRwStr55kZGvqD8rWkQCrAMUj5g/ukAbpnnn8oCGzyROHiQLAJ48EcVepCi
	0E3LkPcRLOwilC9utxuLNlQMNORQYJkntS1R9CaBycTCRTAe9v15quGNeiAYULwE7cDEhwH5SHSFd
	AYpS7lafQia3l5OuXCkJwEuDWdZFkLjGbIwM0IHzuQccf+PsU7SSILq4JFa1gP0zWmiTe/WcxZ4lu
	i6OlfQ2XX15gKIN9LfuAs4N6eh38r/dZszyiX9Ke2JXm2fQRss1TB6XxyW+sd88ZbQBEWNXxEXSoG
	0Tdb0ufA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1yjA-0000000FDnv-1oHE;
	Fri, 26 Sep 2025 03:02:32 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1yj8-0000000FDmB-2RkD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 03:02:31 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-77c1814ca1dso1369995b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 20:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758855749; x=1759460549; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oAJYYsubH767ZAAG6Ssy/u0Z9S4icmj/JgueQ+Oc+lI=;
        b=dER/DPzoi77rZyLHQ444KbqIhzEnTFW3nkB2lKuxa9oaVELuSH20DjVUurIHosaiPl
         sMAe5ptE9iN+IJiTFFRkUdqLcDKpS6Aukcm7W2iw5bJqdL0q2IIFf5irZTIynYKsI2dc
         d3YjvtpvHO7Z2SH6exKQkI6FZfLz3rpz6Vkp0yjv+1t5gXHnVzGdtGCU1N+jAsvya6yc
         yeVMtfLZstM5u9k+/mhVIj5ALs85gh8j4B/j0CxHEBduSIn5YwARxdpvWUPxJGw9AxdF
         IZrG1FmZx8MB/7f3Weaankb45VMREEvAncAkWH0V/foz9TXUhKP34w992wbSBI9Jthra
         CBLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758855749; x=1759460549;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oAJYYsubH767ZAAG6Ssy/u0Z9S4icmj/JgueQ+Oc+lI=;
        b=IkF9RLtOlEkC1XQIYQXSAyF/Yxs40yoHvDLiQToIIodbeXt5uTN/tZEQlNnpUFaSfW
         zqsDC1gdZvExS960ofQVDjxhcOgV0ecsR+21zZKscUbnszKcz1erK9YkfwJ7KDg46C2q
         v81w1GPYk33iwO4gspLTm5+1YBrW86ENRft6Gmcnd9H/0km898TEQsAxMKdYmLcxembK
         co47UZq4xc3UmPFhcLvmjboGC5roa+o7OaUalg1FcNb9jyJYS9KrFIyKLmaD9PZpVC/w
         kFKN/EDbyUIGYjifj9JE5TwTo9S37ZTQMJWUaimoEq3JND8iYpIpitg0wLxMvAuuJATT
         fN0w==
X-Forwarded-Encrypted: i=1; AJvYcCVGs33YZS5T8pxy7D+GJAy7yDOqAbZByD+UJGyu+KIiYoR8+vi9n+UL9EZlFeKu4Vzj6+NzlGlX0rZdXm5R5m8S@lists.infradead.org
X-Gm-Message-State: AOJu0Yz57kejjIJAgXyQ8cCgb5xMj5KRjIpj8C51gELYDeh5YbRcrUnr
	WPPtV3OTeXwq/YydRnLwpt/g+1LEw551pR6eTjv5194lvrzSDlZTv7BN
X-Gm-Gg: ASbGnctdOZqjZm/X8tvjpetmugJs1+OcKpyeCzvcz4yUsuKz2DyT+AEKlWsjdeo76Uj
	dRX3RfBBKI0dhnS/1zmd2ydUd7S26JK8ntcsJba1FrLEdNUB+eoendsVpPAitN2oybGTrVsubcV
	vRgWJ95V0e9Cg1fTAB6mLk45/WO9O7dCRYpoCeLN0E7SCBkSST4oao+AleKiqJMbVxg40FEQyTO
	vZNIePm0aw2dIuuKX3GjYej7gUoiYAsfbYUeHigQGxzK802JsYDua19HaPOLo1/4uEo4PAYEkG1
	8h5f5wrTK9YSdjbehoj9OScW5P904P1Yn2ZL+IxAo9lrESQWWAwLCbi+sYZuf+at8CaH09NsGGl
	wiRMG7DTX73gG9D67cgv3Ru2g3GtDkzHvI7pYlzYswSdVYhqEot3v0DgZwj3yxKNZ2wfLjrRv+d
	HCQIig7mfqIw0iNfex6A==
X-Google-Smtp-Source: AGHT+IGVVE0b3+ap6KgQf8MQgQkYuBpIvq9eSH0KSUWAfnMr6DmONE0rdbX167dWHQYcpP6jeWd61w==
X-Received: by 2002:a05:6a00:1ac6:b0:781:15d0:8848 with SMTP id d2e1a72fcca58-78115d09690mr1084933b3a.13.1758855749399;
        Thu, 25 Sep 2025 20:02:29 -0700 (PDT)
Received: from bu9-daniel.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810238c1e8sm3225384b3a.12.2025.09.25.20.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 20:02:28 -0700 (PDT)
From: Daniel Hsu <d486250@gmail.com>
X-Google-Original-From: Daniel Hsu <Daniel-Hsu@quantatw.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Daniel Hsu <Daniel-Hsu@quantatw.com>
Subject: [PATCH v1] ARM: dts: aspeed: harma: Add MCTP I2C controller node
Date: Fri, 26 Sep 2025 10:59:52 +0800
Message-ID: <20250926025952.3098933-1-Daniel-Hsu@quantatw.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_200230_621842_56E96F22 
X-CRM114-Status: GOOD (  10.41  )
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

The Facebook Harma BMC uses I2C1 as an MCTP (Management Component
Transport Protocol) bus. This patch enables the controller by
adding the `mctp-i2c-controller` node under I2C1, with multi-master
support.

Signed-off-by: Daniel Hsu <Daniel-Hsu@quantatw.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index b9a93f23bd0a..2b7019c55eb6 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -242,6 +242,14 @@ gpio@12 {
 &i2c1 {
 	status = "okay";
 
+	mctp-controller;
+	multi-master;
+
+	mctp@10 {
+		compatible = "mctp-i2c-controller";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+	};
+
 	temperature-sensor@4b {
 		compatible = "ti,tmp75";
 		reg = <0x4b>;
-- 
2.43.0


