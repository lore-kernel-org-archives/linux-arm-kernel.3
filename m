Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA8E3CAC599
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 10:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k3lwBMTCg1xkGzoFZzilNGQBuvChETr/ISTszxUGZzo=; b=Rz787Hdx2yXHhFMIylakTJTdcf
	DAm1b+NiVzcz9hUaT4hXRZKv071Ziu2jJA4YqSkpj393b5uuNKQYB0nRMpKCJT+Fy2DyPAziHGYRa
	j+U7QbF/c+sBRNLDrc2+NHbQI8Z9I3Xl1Jt7hsghivrFDwtyjnUxS8NGYYDFXHdjPIfJ6r9Y0epjF
	jVGmVPhLsCmwaCq8WKhPVEWB6j1IwZqJf4eFXbb7IQsIo0PCh99nUl3cfcJYKZrYt1F62c/whVmV5
	ICD9B8VCIgsyMFEK0szQZSOe1VesfdcHv8sFiwZmB2pnx5JOtUmEG6xkqP6XzKzYzKnYoOBi0JUbF
	JOX5ABMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uypFM-0000000Awzm-0LzF;
	Wed, 17 Sep 2025 10:18:44 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uypFI-0000000AwxB-3e1H
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 10:18:41 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2445826fd9dso77245555ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 03:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758104320; x=1758709120; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k3lwBMTCg1xkGzoFZzilNGQBuvChETr/ISTszxUGZzo=;
        b=dRKSrKmlfDGIOJ40tQhYj8HkpolXWTFqX53X0lLdVWGluIk3uD8FE2gzpnrQ9SCRMJ
         R6TG70BNnzyza16uwEP7uiSjCrQ12JzDaYznbB10ioYaIUkqrVQjA5qgYE7NSdVqcxcD
         pSWavct5uij0xTIP0NDKuoUGBu9Y14Knnn7seF4txhrnl31tz16FVl1jKKiulFW3wTLL
         DYB87CfIvgFjW4NPxkV2xAQeEhxy5yN9EeYSw/LZf0h3OlGAb00BqwYyja2TIyaFHkpR
         uXFxzyelVvwCAhaqKjZ/PEt56Sl9gTeOf3gI366jOwuQRlc3+7dgtOhtecc/Bb6NFNdV
         +aDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758104320; x=1758709120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k3lwBMTCg1xkGzoFZzilNGQBuvChETr/ISTszxUGZzo=;
        b=BVNBJssPduRk1tTN2zYE61srwf8K3AbD4CpSg+UArc9VyDk9A72QuDrWG9EPY48qaE
         R9g+2PFxUv373YJJp5MhOWGHVo0Yj+JUhiGtbPwCGA5NaUioF3wSpyg1yh0K1kFvD/Sd
         TuQuO/8+GnJHuM/NqLQSxbq08fqwn0hdKjGGyK29QqODgbHn0zs1zJuvklHESeKZqDcv
         IrbJVrhKr6B7iREZD5UOEufMVEfVFhvPXjC9yo/+ECAuESKU0GkkUqIL6D+vwE15xxhs
         C5IOx7Ose3qJDAnqsI6J5k17AGB3eKlKOQI4hj9Sb9u5yiVZ/FGRROIPbgCWWYcQctey
         I77w==
X-Forwarded-Encrypted: i=1; AJvYcCUriXKGoI77sNhIDxpufKWm2EoqXcwcIJYb5tsMwiy8JnqRUGAvg9B0+q+iBr5NXC/5ZCnhVh1BA2+Cwxkmce5k@lists.infradead.org
X-Gm-Message-State: AOJu0YxIJervnxIfHAWLsfiHm2gGYany4aA1MeaAvxXAxxjgRO3oEVZ2
	LSGD/e/U5EOECh0GURXJAtqa+5neps/kHGNU/U/Ekn6mKfViL0e3UJtZ
X-Gm-Gg: ASbGncu1KOzu55rWksF+UxTKlUrK9P/p5kEU8Jl62HFGPx0cxMYtzu7ZbB00U3pu2DM
	DQY1Ht/lHT+gdXYYEEuY3caKQ8ibr3ojhEJK+MwOILc+Kk35z9uwfz5L9LTV/SMRvFREanaNMEJ
	h0nQ7Aj3BgGKQ3Pxssrp93WVZ6q/d+bx1hhzluBYYnezogCHw+gzziyQGtlloHONZ2358SAbF/Y
	dgIezj7MdW/vY7WNdxsG+5Ou2LZS6GFBTGG2to38wcmxi8kdzFOc5M9evZLYDSTm7BHUPtB435+
	26rM/XEjHSu89B2bxKvlTXvW1xBUUoRbRtaP+Epk36AZZ7+t3GMkFzB9sqSQgZqbQzBNsgZBRxL
	1psbdNkyZtkg4isu2b3sNjmb7/qXI5VYbkIKkvuSzRe/8orUscRrPRiZZJsbmqc3KwXBQrBRVMc
	b4OCY0tZZkX+5wkHvWZ+MaMcd6a9GRhLalK0zW
X-Google-Smtp-Source: AGHT+IFpwu5XMkJV8ZMehKfE4Wk0PNKKgC3/i2DNW5XrT0jCQFnppvNab6Czf66Re5ST81k11mqhQg==
X-Received: by 2002:a17:903:11cf:b0:24d:f9f:de8f with SMTP id d9443c01a7336-2681216b692mr25942835ad.17.1758104320167;
        Wed, 17 Sep 2025 03:18:40 -0700 (PDT)
Received: from eric-eric0420.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-267f4d286aesm28588755ad.63.2025.09.17.03.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 03:18:39 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: peteryin.openbmc@gmail.com
Subject: [PATCH v1 3/4] ARM: dts: aspeed: harma: add sq52206 power monitor device
Date: Wed, 17 Sep 2025 18:18:24 +0800
Message-ID: <20250917101828.2589069-4-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250917101828.2589069-1-peteryin.openbmc@gmail.com>
References: <20250917101828.2589069-1-peteryin.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_031840_909967_FF131B79 
X-CRM114-Status: GOOD (  11.42  )
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

Add the SQ52206 power monitor device and reorder the sequence.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 28 +++++++++++--------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index bcef91e6eb54..fe72d47a7632 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -353,14 +353,15 @@ eeprom@52 {
 		reg = <0x52>;
 	};
 
-	power-monitor@69 {
-		compatible = "pmbus";
-		reg = <0x69>;
+	power-monitor@40 {
+		compatible = "infineon,xdp710";
+		reg = <0x40>;
 	};
 
-	temperature-sensor@49 {
-		compatible = "ti,tmp75";
-		reg = <0x49>;
+	power-monitor@41 {
+		compatible = "silergy,sq52206";
+		reg = <0x41>;
+		shunt-resistor = <500>;
 	};
 
 	power-monitor@44 {
@@ -369,16 +370,21 @@ power-monitor@44 {
 		shunt-resistor-micro-ohms = <250>;
 	};
 
-	power-monitor@40 {
-		compatible = "infineon,xdp710";
-		reg = <0x40>;
-	};
-
 	power-monitor@45 {
 		compatible = "ti,ina238";
 		reg = <0x45>;
 		shunt-resistor = <500>;
 	};
+
+	power-monitor@69 {
+		compatible = "pmbus";
+		reg = <0x69>;
+	};
+
+	temperature-sensor@49 {
+		compatible = "ti,tmp75";
+		reg = <0x49>;
+	};
 };
 
 &i2c5 {
-- 
2.43.0


