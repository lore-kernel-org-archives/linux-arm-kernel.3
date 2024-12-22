Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F38DE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 17:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zbp/SL17C/U69/mM4spr+KWpbV3+Jo5FoO9b1T7Q5mk=; b=YcLOCI3Emmq6gIBIP3stXk8rJ/
	6S89v25XE2CA0KHUJu5eP6eervCnGFUWXvYxzulPrXMwzZ2d9e+pfDW0WfgLmbwWQaX/REnfja6S5
	m79y2fvVAjmKwIIq25zq1Nr+FV4GWoQAB6UDLbTy7lq8SFFw3bH7cPjbTBGy5THwZ1QwP6mdfcxVd
	doKu1JYYTUfdeRKTrER72GA2dlrrg05ww4FUv6kcMPmVoQdT091IXfXKybB+QXljAjQezBfHSZkPO
	LOhB7b33AvrhgPIJ6XTyAVMgHbCDYRyaEeLlXza+wffqE1OsMJqV+P2yAZPci656tTCUlbgXywA4X
	fYd4wPcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPPsP-00000008bm6-2enA;
	Sun, 22 Dec 2024 17:36:25 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPPpI-00000008bNw-1cs5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Dec 2024 17:33:13 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2ef8c012913so2421236a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Dec 2024 09:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734888791; x=1735493591; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zbp/SL17C/U69/mM4spr+KWpbV3+Jo5FoO9b1T7Q5mk=;
        b=grXmQVScUrvcxyeudOsT31/9KnRw81s/jAIXy0h1KLfeRRwbDxbUNKrqlncbC7pFe7
         eGRsVfK/kMmsy12XiTVd82HA/1UI+4CumcJaxXa7mjwsJ3off6NWHhc1WD+7Ju8Or4Qk
         eodBS152YMqITp/MgzbEjcIFq4KlURmG8ARW/25puVafwbOON2GcXwL4qpCA2IYtx7DK
         8lDWqeiabTcnFnHWqPjqxSL/JRnC6VTBloBHLfDQANQ2IFpCaOG0umvedqt/ljKDaogn
         ctgrWBiNAnIpuQ6i3H0ekdaGAiOG3bZJq7154cOYclyw/29EOXvdp0e4cwB3qQV1rDST
         MJug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734888791; x=1735493591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zbp/SL17C/U69/mM4spr+KWpbV3+Jo5FoO9b1T7Q5mk=;
        b=Zo6y0L8xRGKttF5VN/1hnRCCWwFBTKVroWMQ84Uq9bOeKeIL4WWbx1z1AI222HSvdD
         vZVWzeT/8icdPY8dB0yb121h2JQIcmrTshnWRsA5c8IVk/UeXEQs4A8vs3qCfCTaOKIH
         V5f9NHvclZUXboa4wuh3zwiMjkLgR1EC047RmEFDTSqf3ABXTrqd58HY5cmzqG3DZd3V
         UoJ/tmKgv+kTqqxNIvrn+RXKdFShukLLcmcc7fR2Fagba4AN8q8XGAynNB2bL2FEKXJb
         3AgnrlvMVKqqbV9tIxYdZaa2IO9QM9unb2OLjySIxiQsZzy0+ykAj6t5qX2jWKkSVS+g
         zJ3w==
X-Forwarded-Encrypted: i=1; AJvYcCUQLYjO4W/8800rKl6YPqEK8JKnC0AmjKGF3Y49aOqXl3gTPDQfOnKfzjvFPpDcbMm1dyeGptP3RdBfdBEkunVp@lists.infradead.org
X-Gm-Message-State: AOJu0Yxru+p9oi/i6zsOIjnUHI7I0NLV7qYzCzNWmchrQn43mGuKCzVl
	XM8iAjNEzt8yZX5BemF1I3OYqMg681wStFisxEIRppHF7eFtiUs2
X-Gm-Gg: ASbGnct15cFBNIgwmNnXH1aSuhffRH2u18XWhP0ErR5gJwFl221VSAonxg9YXFzJ+AH
	Xbp5/2Ok9Hsqc0GM2Ltv1K7lAXXZMQ/+iqus12GsoHS8apusyKFSYspmtIxNdOCHk7CoEF6j8l2
	heKUGxkmxhe0QExkmhWrki0CpoGC/ymsUV4F9Td0MxTYVBWduWjbyTF9sD7mAk+PIJmJiknPpNn
	BhcBNtuT+sa/mXxxBpfT5+sRjjovv4O2Jx/fMKlWSN5YTGA4lh9/FjQBg==
X-Google-Smtp-Source: AGHT+IF6wbar4suVMRQ0O12h3Yid2CT3e7XUhszkGbE1EDv1XAzZ3CHXjwf93+a2afmynd1CqIFgXg==
X-Received: by 2002:a17:90a:d004:b0:2ea:5dea:eb0a with SMTP id 98e67ed59e1d1-2f452dea366mr14830664a91.4.1734888791364;
        Sun, 22 Dec 2024 09:33:11 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2f4477987f4sm7567552a91.2.2024.12.22.09.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:33:11 -0800 (PST)
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
Subject: [PATCH v3 1/2] dt-bindings: arm: apple: Add T2 devices
Date: Mon, 23 Dec 2024 01:31:47 +0800
Message-ID: <20241222173240.147675-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241222173240.147675-1-towinchenmi@gmail.com>
References: <20241222173240.147675-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_093312_428518_95B1563C 
X-CRM114-Status: UNSURE (   8.53  )
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
2.47.1


