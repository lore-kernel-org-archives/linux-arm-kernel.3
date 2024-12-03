Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E63E6C606
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 05:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zbp/SL17C/U69/mM4spr+KWpbV3+Jo5FoO9b1T7Q5mk=; b=At9nP1pb8VEzPJQAV+gBA36RLh
	sT1CPL9aJpb02H84Hb8K/rc0v6XhjuE3C3s66KBUcP6uoMd9Q6c0V5yphF9MV6p+MIZZhN47RHKkR
	XgykuYUF3C6YcpIbwk2xlKptWqjDZoEod6ZExVdUDP1OyrRF5FHb83aaft8YhOhugUgFDBizOKGbw
	dCXJsVVPDMJ6RC4LMcrynET5/Ia8krbGbP11mfZFvd8NZlGCRHBICGJvJGakiWFjxWuVI8tckLxTe
	Vusl6/XsWnFi9YDcabJT2eKGjupZSmxWxhHmc/v9hH7MyFC8McAL5FAVwCp6+vxTZmABePWqh6XDo
	2TIDW08g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tILKd-00000008Jcn-0eyP;
	Tue, 03 Dec 2024 05:20:19 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tILCj-00000008ILd-3ZcO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 05:12:10 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7252f48acf2so3605596b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 21:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733202729; x=1733807529; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zbp/SL17C/U69/mM4spr+KWpbV3+Jo5FoO9b1T7Q5mk=;
        b=b1q+movYvn5GAK44j+s78dzuM3p60XlJG8SbKNP8KU+9L09V4PtrJyBnrioJkEuMGT
         QICMnZJzfahaQPJVfUnoAg4iXynIbqTEk2c6AsFkiILx/9y8ACmkhvLzFOTzuawgnTtv
         eyDq8HozcdmdGboTRPw2yb8Cc8hL1pWVX+g8u44D4NspWfulRcsvq8eheRmw0Lza5+ca
         czOMEdylm7CqnNlKLHHspwt+z4/0XB4nNpsmzYo7RookH1v/PpzQPUzHKaYqi4r4TGWN
         ZIOg0io3LHuXkNpXiyZLW1Lfdagw8UWQcJLd6hEbASfJmpfh4rvWeX1rd18ohXqkixFY
         xi8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733202729; x=1733807529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zbp/SL17C/U69/mM4spr+KWpbV3+Jo5FoO9b1T7Q5mk=;
        b=bh/R9WFvTqOT631Rkc2V0TfQKZ0vQirVDP5tYp6YfsY+XBM2P7kPdXAQKdUeC1KJ8V
         0Y8zCsLnyD56sytgtZjf68l0QH0ssA3GRug5myCRGKIap5/mEVWP7K5bvLaZZX4g7Bch
         tL18cm2QsWuxdzShMnH+EaGMgrH5smqigr9+sQuONV4M2lseKMxjRqP8+93zk0aOIS7d
         NMl96Gug7c/19RrRL02rL2+mxpv7UnRN9+kvOQ4ZxXGj0QnIfwl7wRRFrKc7bhARR/Ea
         bMNByhoJ+SoNwd7romMaomo1boaWm0Hv/mz23+dDfWNs8gnOy5+wiP3QyQnAii3krNa+
         v/VQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAqoxRPZTCSiMvgkNI71W+7FTCnwSSsHPgQn4JiZi3UxCsXXBzHATgchnFpQNmXpvOKFbpGP1+wXX513UF2bzI@lists.infradead.org
X-Gm-Message-State: AOJu0Yyp+1LU0zzFGedkfu361rMD7ocMwmM81Q7/duO7Uij3pHvHUjYK
	0nLcpOWK9dQR3ooJnlpPQQhVqtxonXeCyn1y0/J3B7cma0J1wUUT
X-Gm-Gg: ASbGncupoq+98OwKZYmOW9zdmLLOFB6lfYRtTuGETXUswtwSj4y6rdNhBH8DYNBUIkE
	4X47kcgD4MEEva/Yd1d+82WwhywopeEBOVJGdzv3MKpQLzYeHWqs4hIn66XWnY1sVBeq24xwutp
	ebWOQXLctms8bQax/AZFbqwvCdAAvo6feAdO+kWi2cRGFNc/mQDxfGjIVgmEMKgelO8apVBrt3E
	M0jzUjfLh1sPDPGFMBJOXhWXreAEAa/XabWiIvi2q2CWT0Vob6yEH+nMpMvW7Zb8w==
X-Google-Smtp-Source: AGHT+IHa2D6F1wVcNR9basJsPDGbsJTvLncGUr3XXRt4xi82659gCSs3b7qvxB6i6firh4TNGuWY5g==
X-Received: by 2002:a05:6a00:1893:b0:71e:7294:bbc4 with SMTP id d2e1a72fcca58-7257fa753f8mr1643490b3a.13.1733202728883;
        Mon, 02 Dec 2024 21:12:08 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-72541848916sm9525047b3a.172.2024.12.02.21.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 21:12:08 -0800 (PST)
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
Cc: Aun-Ali Zaidi <admin@kodeit.net>,
	Paul Pawlowski <paul@mrarm.io>,
	Nick Chan <towinchenmi@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/3] dt-bindings: arm: apple: Add T2 devices
Date: Tue,  3 Dec 2024 13:10:27 +0800
Message-ID: <20241203051147.110980-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241203051147.110980-1-towinchenmi@gmail.com>
References: <20241203051147.110980-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_211209_887994_0E5100A6 
X-CRM114-Status: UNSURE (   9.86  )
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


