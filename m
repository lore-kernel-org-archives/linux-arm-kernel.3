Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 269F3C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 11:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j94Yf4ZljPIn55Egi5iO8+J8Nze+hzJTmB3wDQVymRc=; b=X+qhfZbGvRp/7iWCtJ39W1xvsY
	wBoZMWADwZpm7KZbEnbxsDZ8U9ugalc5zoIFX128PG76yb11R8KXtqYxAHpyh8iTzQXHpftxhy04E
	pxoh+BtIZvJiyFY4piJ5Yp4c5fG7fijiSiQeX2+dUQLQZq0PYQbaU4bgl8LB3Z4NgyWB6wWN7boPf
	QM8bDuOwEhFDLcAzbaJy3qQssdjLmGEsR32K/aVYLdZuchVGEPRfw4TKBbHG3JDVqUQTl4LgPUjnr
	iUHeAOQFo47h8S4MJ/ITLFA+zH5lHcllponMJIr9C5J+737xrVFu8F4kogjzlnhlEFfQ/4pIRQgu9
	MjDwTOmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teuvk-0000000FH8J-0PGg;
	Mon, 03 Feb 2025 11:47:56 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teut7-0000000FGf1-3lXf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 11:45:14 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2f44353649aso5421337a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 03:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738583113; x=1739187913; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j94Yf4ZljPIn55Egi5iO8+J8Nze+hzJTmB3wDQVymRc=;
        b=lzJCgyDxOlPE7pNEvtDDsejQ3FsNQ6J/fmV6Wqsg9zdxkNhCh34sbp5KTrepgCJQ0l
         YFS0cK+ys4eNrgjWPV3ZEXIJiAJ2qvDAboxVgHC0OkD40blSqYu6t7GpqJ2+OY4kO+B9
         vKORL3muQTfB72Ggu6VG1nz4Z15/XlkshXJt20FItmvXsjc5VzE+yN0t3GHlluIIOVFy
         aEQo83KE0TLZE9vjkG/TU/YRugdkFGJplsDAR+yJ8/EabraWLYFeXGHf1FiLk00n3SFt
         wM78kD2VK8C6X1orD2FyoumgfN4ohWLtAaEB1XrcwT0zwKG6vByhtiEaliVhE+L42p3R
         Sd6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583113; x=1739187913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j94Yf4ZljPIn55Egi5iO8+J8Nze+hzJTmB3wDQVymRc=;
        b=Oxe0w7imLCUXw8UdNNzt7WC4uJ9dyfgjS8nLRzmvad9uVc/FyMVr4frG/B3eeyPMSY
         fZH4EY9A2NiXzoqtkSHTdb0uE8iF9RXoPhbIDzW4rvUxuIjYoRpN/M8nJVyjMYl2dKDp
         GC4Q9zjoP8NyZIzXXv6cj288lUZDfuSDUo2z23UGIp4/7YBEdWH0g5JDt56uLsk009vt
         GDnMDHsHLenaG/UkF9mPJQeP7IZskrUWB1+kad2qfkJfCUDNAGYF1fLS8nWJ8sfzAHXW
         bn8X+SmUtWyyxBmI4CONOLdR1UWbJQ10iytZ9l93NP1hPOKyd9c+99k1aKtNQ4NeKq3Q
         /8yw==
X-Forwarded-Encrypted: i=1; AJvYcCUymAcaLTHajoUIkBgDC5l1n14n2MmoTzrBh/iZ1APWsuRD+8rUckkEYnYh+X9I1JlwWuRHto1LE0y7PKorNrtM@lists.infradead.org
X-Gm-Message-State: AOJu0Yyl1Td7TeU3FlP672lE9M7lNGrjNUbx4aIeXKRUVgj3dpkBH/4v
	VUqrTrYr9CPCZkRTH+faBVAHkJBZxNo/NSN4t+1FpBp+yYPKFnMi
X-Gm-Gg: ASbGnct9Ztrbp62a4B9zTsw+P18PSC7iZUK4ATS6ZyBju5OydkvbmfrVmjBKSebep8C
	bAizuK+E9riDJ3gevagqrsdVXDa7S15IDUlgMdBMFJdcHbxt7Grf0k4YdYbGkrOK3Z01bU4wk3t
	CKY1yOp0F6TCbPJ/Hom9q4Bkr/WuaiXDqaU3oD29YXSejFfI7FDJYnq4FTPgwAXs1seH9cNBJn+
	jd/t31cvKndYP1vrZ9Xw7DOVTo5rVkfExqX4xEFr1hQYEtCr+BmeAJP9AmKRSbNSBNGJYhiko66
	cz9gMvJA6uMiYuDd
X-Google-Smtp-Source: AGHT+IFnveO9s5+KK6gY4LWAb4g+uJSFbjRZNtLOZaf363lRPvUyR79U3NW2XRf8Dv4Bb1w/KxOYGQ==
X-Received: by 2002:a17:90a:c2c7:b0:2ef:33a4:ae6e with SMTP id 98e67ed59e1d1-2f83abd996dmr37969938a91.12.1738583112982;
        Mon, 03 Feb 2025 03:45:12 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2f848976d1fsm9712490a91.3.2025.02.03.03.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:45:12 -0800 (PST)
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
Cc: Nick Chan <towinchenmi@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 RESEND 1/2] dt-bindings: arm: apple: Add T2 devices
Date: Mon,  3 Feb 2025 19:42:52 +0800
Message-ID: <20250203114417.16453-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203114417.16453-1-towinchenmi@gmail.com>
References: <20250203114417.16453-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_034513_934602_300614AA 
X-CRM114-Status: UNSURE (   9.19  )
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

Add the following apple,t8012 based platforms:

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

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
2.48.1


