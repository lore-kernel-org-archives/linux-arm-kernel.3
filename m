Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A618CD49771
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Dec 2024 16:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wzpydyWYDeRq3YCadaVmg/DECTRQ6H8rjbCBdAJ5buk=; b=JlXf0fyKiWiFbTO7KoYwLsV6qa
	HW/Ug/uyLYk4jdY5n+f4BtIUFZRD/ov45tyD8bWZDQr/CD3NkzL6MgCUk/0psW+UME2hBwdVqNrs7
	TS21t7RD5MOLZpHT1rLekOBR1n/Jrl1Ddi93w3FbAsUfgWPxw+DxGkXzVtrg9bgsu0BJED2Ycwhyw
	sn2aL9405CNMMnd2MsBfJSoa8MyapV8hQOhGqChTMo3K76FBBMCbk3QhRL0/2vxQWjcZSAS7hyPin
	CroWJigAVAkHfQC48N2AiiXy1euz7A7F5c6+kcmOoZjetCl5EQ1Nhm5Ik8NCy0zeaNAmT8VXGoKqK
	msbIqe9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHmht-000000043Gc-2Zdb;
	Sun, 01 Dec 2024 16:22:01 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHmg1-000000042y8-1Bze
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Dec 2024 16:20:06 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2ee69fc0507so1521358a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Dec 2024 08:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733070005; x=1733674805; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wzpydyWYDeRq3YCadaVmg/DECTRQ6H8rjbCBdAJ5buk=;
        b=eOgtmfEhQ16wLN2WqjGl9iojCUEFqsyqsGMEp6MOc4ccRPRlZJzBHFnyzOGJep0cjz
         bQ3LPU7P7440axPKKvckIzMRuaizgR0iRaaovJRTbAAf7UsiqIif5+R35X+aUNlkcUEp
         hQFW3cQjQB/FT4MlCVXxLwUjyMR48KxNYv7Ncq1kx+BGvQNroJbQ5+kphm5yLDCo10E6
         PZnROMPpRQvMhMgw4vzsdg83av2S1WrXN3OxeVmdlYIGpUVTWN3wR5xAhaMV23ArcM3I
         F7DmSUWjDzUre3IAQMujOvUbQA65G53wnhMltnmBWETS5gAjenGGc3FBOyDxTy1i+5sh
         iR0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733070005; x=1733674805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wzpydyWYDeRq3YCadaVmg/DECTRQ6H8rjbCBdAJ5buk=;
        b=QMtCgmXV9CScEZqDtJXDe7mqrDnIQbBunAC6S0OV/zvJByf1vG3fPAEnbdYUYzsZ6A
         B9017yaTQuB7sO0TstlFCDOFZXcL7h3Caja/6SUbq1Vh4wVLyojia0ZFj4lmp1kEdLwM
         rkV+q9kwgpC1rWc6FpRPpLGDCu3DoGhQf4OXzCTKASMX9thn/S5hfYEtUHFqfXQtxpjU
         B4J8GEfNbXembuzirByjouEFgdp1Wk+MvHPi3ZYTtDZ84uTF3meqr5HcoyvGXK2+1ZnV
         VUDsiHRpekwMHMxk16j4kGqqxicsgi+p2DjUelL7odUgrXd9JGE7uDPqBrXWsvV4Ey41
         5fPg==
X-Forwarded-Encrypted: i=1; AJvYcCXWWpKTqgO1FDWoNoiF0isO1tm3v4Y3NtZ11T2O3NL6v1JfPeAqLBClGyIG/t8MU5TbLdi3HkcV8+SweYUWxXbN@lists.infradead.org
X-Gm-Message-State: AOJu0YwBDRR+FXKjVTclrFQEOwNG0euAt+mxUU1ZE1xIajymKz3kzgt0
	jW9ZE2jY5suWpsEUgIPPCNM7KlTHTvPbAY3MpD2EDn/FyKImL2eq
X-Gm-Gg: ASbGnctGUOz230sTekcKQ+RIElsMWb8Z+VKhWx0kt0IJin2GvsUHKrthbZvniYcvmdJ
	DJAE1e5CWHHRFrmUlLyfY9Zg3P4XLuNdDq71XbVeAXXR5GPilmoHBUNv4AZo+RAqmOxJIzY6w2q
	+CFZ9LBkIATE6I2OMd3XrYhpegJnZrkeRXl/aUBcaaXDQB5oMTEMgXICtLRIIjPYVrnkNHbOqYs
	L5i2TXdsrgS1RFYQWQ5iffSqikfEgYTfRMwazPYRVgbxAZXqFrn3T7zZ5s8Q1TOaQ==
X-Google-Smtp-Source: AGHT+IHq9b8W+oSYCY1CBrS1ggU9W4leeGRpQXf5UGHbqBGatazOzI4Ta2e2XSmCmZ/hxVKKjaERsQ==
X-Received: by 2002:a17:90b:4ad1:b0:2ee:b2e6:4276 with SMTP id 98e67ed59e1d1-2eeb2e64643mr3056803a91.27.1733070004725;
        Sun, 01 Dec 2024 08:20:04 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2ee78834450sm3007392a91.6.2024.12.01.08.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 08:20:03 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH 1/3] dt-bindings: arm: apple: Add T2 devices
Date: Mon,  2 Dec 2024 00:18:41 +0800
Message-ID: <20241201161942.36027-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241201161942.36027-1-towinchenmi@gmail.com>
References: <20241201161942.36027-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_082005_319861_CE789936 
X-CRM114-Status: UNSURE (   9.74  )
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

This adds the following apple,t8012 based platforms:

- Apple T2 MacBookPro15,2 (j132)
- Apple T2 iMacPro1,1 (j137)
- Apple T2 MacBookAir8,2 (j140a)
- Apple T2 MacBookAir8,1 (j140k)
- Apple T2 MacBookPro16,1 (j152f)
- Apple T2 MacPro7,1 (j160)
- Apple T2 Macmini8,1 (j174)
- Apple T2 iMac20,1 (j185)
- Apple T2 iMac20,2 (j185f)
- Apple T2 MacBookPro15,4 (j213)
- Apple T2 MacBookPro16,2 (j214k)
- Apple T2 MacBookPro16,4 (j215)
- Apple T2 MacBookPro16,3 (j223)
- Apple T2 MacBookAir9,1 (j230k)
- Apple T2 MacBookPro15,1 (j680)
- Apple T2 MacBookPro15,3 (j780)

These devices have no offical names, the naming scheme is from
libirecovery.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/arm/apple.yaml        | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index dc9aab19ff11..da60e9de1cfb 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -57,6 +57,25 @@ description: |
   - iPad Pro (2nd Generation) (10.5 Inch)
   - iPad Pro (2nd Generation) (12.9 Inch)
 
+  Devices based on the "T2" SoC:
+
+  - Apple T2 MacBookPro15,2 (j132)
+  - Apple T2 iMacPro1,1 (j137)
+  - Apple T2 MacBookAir8,2 (j140a)
+  - Apple T2 MacBookAir8,1 (j140k)
+  - Apple T2 MacBookPro16,1 (j152f)
+  - Apple T2 MacPro7,1 (j160)
+  - Apple T2 Macmini8,1 (j174)
+  - Apple T2 iMac20,1 (j185)
+  - Apple T2 iMac20,2 (j185f)
+  - Apple T2 MacBookPro15,4 (j213)
+  - Apple T2 MacBookPro16,2 (j214k)
+  - Apple T2 MacBookPro16,4 (j215)
+  - Apple T2 MacBookPro16,3 (j223)
+  - Apple T2 MacBookAir9,1 (j230k)
+  - Apple T2 MacBookPro15,1 (j680)
+  - Apple T2 MacBookPro15,3 (j780)
+
   Devices based on the "A11" SoC:
 
   - iPhone 8
@@ -211,6 +230,28 @@ properties:
           - const: apple,t8011
           - const: apple,arm-platform
 
+      - description: Apple T2 SoC based platforms
+        items:
+          - enum:
+              - apple,j132  # Apple T2 MacBookPro15,2 (j132)
+              - apple,j137  # Apple T2 iMacPro1,1 (j137)
+              - apple,j140a # Apple T2 MacBookAir8,2 (j140a)
+              - apple,j140k # Apple T2 MacBookAir8,1 (j140k)
+              - apple,j152f # Apple T2 MacBookPro16,1 (j152f)
+              - apple,j160  # Apple T2 MacPro7,1 (j160)
+              - apple,j174  # Apple T2 Macmini8,1 (j174)
+              - apple,j185  # Apple T2 iMac20,1 (j185)
+              - apple,j185f # Apple T2 iMac20,2 (j185f)
+              - apple,j213  # Apple T2 MacBookPro15,4 (j213)
+              - apple,j214k # Apple T2 MacBookPro16,2 (j214k)
+              - apple,j215  # Apple T2 MacBookPro16,4 (j215)
+              - apple,j223  # Apple T2 MacBookPro16,3 (j223)
+              - apple,j230k # Apple T2 MacBookAir9,1 (j230k)
+              - apple,j680  # Apple T2 MacBookPro15,1 (j680)
+              - apple,j780  # Apple T2 MacBookPro15,3 (j780)
+          - const: apple,t8012
+          - const: apple,arm-platform
+
       - description: Apple A11 SoC based platforms
         items:
           - enum:
-- 
2.47.1


