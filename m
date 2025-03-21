Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CAE1C35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 07:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vsGnq8WpEGq8rItMy0um7W6pcAm/zbCWTBE+mh8Th8U=; b=vnuiDiI3aGafjrAeB67SCXCvsb
	C1YM2ECwZlivUHW9KWuE5SM9YeCJdb+IdFK4uX+ci1rNEzrH/5JCs0yn56fQFa0QKIcASciIcisRj
	8UL5JZz/bWLF+0oLity6Y1iOxV3KuOlBElP+9wR6hMiaryzl1xAGXrUcn82rlCseaOqBXJJw3OHQp
	j2hl0DBvVnr5PO1+xBKtArWE0Ft2rnYZ+PpycSDsQF47zIscjlUAQdIhQWScHOf3UrVPQkLq3nAFS
	1H/aDy4tJExnbNcsIIL/zttqZH6347FwQ3E1Yee+59a8pXaa79d55jAzovjfs/rRg/Za1Jw5lxaHP
	3PzXzzXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvWrD-0000000E6aR-3bUn;
	Fri, 21 Mar 2025 07:31:55 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvWnu-0000000E632-2o1Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 07:28:31 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-22438c356c8so31576245ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 00:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742542109; x=1743146909; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vsGnq8WpEGq8rItMy0um7W6pcAm/zbCWTBE+mh8Th8U=;
        b=nlafflNcweW9ERl3/fW24lGmJCw1ealH7ZxJ+CXSc/dtJnfak+UriElcG8Hx7+dlPx
         rVpGZqxydFbeFh8Qo0JivsxvS+8Jb915NRHaPvVmVQFdb+kPGFnrCFAA1qlopu/A2ieo
         Sd53nF0IG/odXkLLu4XVyxBBVBkHNDscgKzKYZetM6kT+fwV9LeVB2AyN6Ac+ofWiJt/
         JNawmLIypoy5UnYBttdXIUoMu6aqDah1VjZ/GbZsYhz/46tkGHir2/E42dSYfUlH/tAs
         7Tr5oz596l4snr1H26s2Oq7B9khEbKu7ydkRteRG6pYzQcubdBUEcYAbPw10KzI/6yDY
         bkhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742542109; x=1743146909;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vsGnq8WpEGq8rItMy0um7W6pcAm/zbCWTBE+mh8Th8U=;
        b=VMUxrpRY84/tJuEOZUs0RAO29euHBJ/M57qZhsmotAsedNuVPXrvqC7P2hEjQqrdyj
         8kD93zrkTGpuVaAndOMBR8CMdbs4M/f3c6AEJTEUtZ8bA2lNjACybq2D1IoJIKDGgOP0
         yi3HkgOrdgCKZDWqAFJ6HA4+Va+5/ndJ/TTMtSf3BULy8mSpPiqrQbPxnFXferIXaAeC
         Ri/x+O4ndA0QAGo1uyFLGu9AoyuuIyy92IOidnL97qbpzfAlxcHfLlWGf3NDMcbFaZHl
         Ftt4nHNP9Ye5AxkABMSd89KhfCcthCS27AlWsS7eogvNXvnvczACyJRG+Dz0GJ35MMcI
         49XQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdAhQm4k6XjM4zsA0fVO/okLNpXXV1Gm1w064WjMgCijCuv89gfHHcx9llC3jz6XfWBs2KTbRr/yUDvG2DaP/F@lists.infradead.org
X-Gm-Message-State: AOJu0YyRrEcFR23S76+LOwY9zjP/u2rO2vIJ2w3SyOcZYA1h/FhdcHl0
	U3QGRiV5Y5w8PFgLtWnJcuY4RQzfD4ruGGtshyLQBfC7ZXkBDEhr1jaONA==
X-Gm-Gg: ASbGnctwpoEaI8msZE6wT7J3Ww3Zc8uzwCvb16kq0/mElFyij4t0QixWq1VFOXmxUvQ
	zDq4mArknUdHXZYKyM5+EtB8kcHwVfbBjohyEtVkG6FGSGRrHbybcOKUYvPD4MTXuNA8vY+Spnx
	6MTXekAUyzRsnImW+eyBQxaBWGAvZ3clG7aABHgLuEQsvtbj7uQrBCtxSUTqq062pi0AyHjMm2L
	iY417Jnh2DgJvWB40Bfqzj2wPvRyVPgFjy26l3ZggwaQ0imd+uE7ftJ9Ci3B+Z5HPXuXic1XprS
	Y8KGMqr3ekR8opDN9wLhQqgkriG3IRTmbZSwR11VOuehHku001UF4nFrPet6FpULqVNsCrFqcJj
	X0XCrI3TdDF7BoBVrc7GkPg==
X-Google-Smtp-Source: AGHT+IHZwkqqnNy+VPxGo4BdiCjiJgfTxT+uvqFaJnReF+y/mGA7CSLdbLFcCPQBoqccVKLmssYfMA==
X-Received: by 2002:a17:902:da82:b0:224:162:a3e0 with SMTP id d9443c01a7336-22780e2a37fmr35488305ad.49.1742542109028;
        Fri, 21 Mar 2025 00:28:29 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f396fasm9862265ad.27.2025.03.21.00.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 00:28:28 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Fri, 21 Mar 2025 15:26:02 +0800
Subject: [PATCH v6 01/10] ARM: dts: aspeed: catalina: Add IO Mezz board
 thermal sensor nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250321-potin-catalina-dts-update-20250102-v6-1-4bd85efeb9b4@gmail.com>
References: <20250321-potin-catalina-dts-update-20250102-v6-0-4bd85efeb9b4@gmail.com>
In-Reply-To: <20250321-potin-catalina-dts-update-20250102-v6-0-4bd85efeb9b4@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742542103; l=1855;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=ZE8DMnDtK6GtXz/R29k12joihlo+gxEvbFhaGKQky3s=;
 b=hSNSRF8aykCJoZWrCIMBeG6atv69rGcfZy7cKck3omGOD07NUktdt5H/dVqsU4O70JCwkQyrQ
 FiGZEehi0WUDAuOve21El2ZnNN9uElK4xLudO4NPMRmsXKLjsDs8SN5
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_002830_700788_57833A66 
X-CRM114-Status: GOOD (  10.31  )
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
index c151984289bc..d5d99a945ee4 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
@@ -198,6 +198,12 @@ i2c0mux0ch0: i2c@0 {
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
@@ -208,6 +214,12 @@ i2c0mux0ch2: i2c@2 {
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
@@ -299,6 +311,12 @@ i2c0mux3ch0: i2c@0 {
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
@@ -309,6 +327,12 @@ i2c0mux3ch2: i2c@2 {
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


