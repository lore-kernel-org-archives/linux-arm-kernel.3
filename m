Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA28AC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 07:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e4+m0DQrar8QI/tlP9bedfL21OK40rHqMTDJEYU92jM=; b=uPc6a+TX7gUYtnjLkCEiJO1oaj
	cW1qAE3p/sA6MF3QlwotvRLFowWj0A/ipWJgHiOW+NsMszIlevxLycLo8eYuqc1PTPFJOwe7Y+4hm
	780VIpYvRErANLk2YWnY6TJmUb5C7sfKBVd0Lv73vaSM/jz+ZPCDkQ3OMWO9QkGCjdcbM35nA0hjR
	EnH4D33qm/C84eQX0IpAtKzMloLHtEY0wYn5z7YbPAUKr+x7GJGkihkneYZExNmTKEKKOgQiSLjjn
	OFIRFI3BuNCJWFpGl8Lb2zb9hp1xptDbJhVzqf3aXE9/NmfODuNPNPjNHLDa7EJjABlFb5kFKAhvv
	bc8B25Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty4Sz-0000000Cq8t-0wXk;
	Fri, 28 Mar 2025 07:49:25 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty4Ns-0000000Cokz-1Dhw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 07:44:09 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-54addb5a139so2098046e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 00:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743147846; x=1743752646; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e4+m0DQrar8QI/tlP9bedfL21OK40rHqMTDJEYU92jM=;
        b=EWkbLRGVc37oEskI3xmTLDQa7y8oqhMmOrrrPRKI4xzVu9WM3uFu8txIK7PFf3FnRg
         ThQw1vov/TMPJebPXhavhTJ0aUiMyijkbmHmU3izpN2v6xGIRe0Re/qsSPJYtm1KHfAc
         0anLdLAA0JlS8o5PGWJac8iyO1jxSlFZf5UvtyvvNqSe8P+dLK7kCpL6epfZsUAtOVlh
         lqWgLpK3DH+7vAqiaqp8LEkvt90HiXg3Ep17OV/IOsA3XvpJm4gsAL6JcU59vnhKEXWA
         41p70u9AlCGdDn7Z9gyhTa7fs2sB52CTSPiiBcNM4Em7qsYxXiXvVZQn6uz9fNbXg2x+
         mAtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743147846; x=1743752646;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e4+m0DQrar8QI/tlP9bedfL21OK40rHqMTDJEYU92jM=;
        b=FOf0/4QML/Lv55BBmXovj019dR1dLpWoVmq2ZRy9aaceoW9Pvf0viQcqSZzhCe3Hxw
         X2TpeMs6zDoSYDR4aq4zZI8yEZ9ynxmjVyDQLcZirwjI3f22c114mbVaBV5O4k4/qRyC
         pTRGQqsdv2GW6Mdn04aPsQddTjU30s9CeFJUzwrJI8+/YzSiZxKQgcLoPWF2s/g/vY7n
         c8PeV3aJnrqalox996kJ9GNKVlH7b9zC5zbot0aUSgD8V0VF2Xjwsi8tpJKZMWWkgmxm
         snyODP8rxUyz31dXGeC6LZNz3Ec3hXXNqLPfbOJGr5nP51Qp75TB9UJVxmY1DCoGquMu
         0dHA==
X-Forwarded-Encrypted: i=1; AJvYcCUo5iDt5gOz98P6VZItiDKDJ6CxRshPeOZfjzY1Y5mp3xir3Ef8g1eK89e3AQUvIqirZ+VClC/X6UfKNutz8+r/@lists.infradead.org
X-Gm-Message-State: AOJu0YzeRq8P1sUcIS1N7Gpz02A5g3PA6OPFLncGxnYV0Z32/Uy3Q4nz
	mO2GyWHoK9Cbrp7HxKMRr7WVkM82yjHxqv4o4fFtkUz30ESrz3+ErqrZTO2L3/4=
X-Gm-Gg: ASbGncv56JeNpKzKtWI/AlY6SagTcNwcn3/9JvRsjTfOe2dSbxqWWzV4K2avgEAJoxP
	v1d/o/qAK30IbJjZnnBDVnvtojP72DpSyTIV7lJYf/4e5yXNzpKabgMQz1EKRyvWpywYOmQF9TQ
	wZHoYKpbwropeW1VIJFUVVxfY6laKU15aQ5/JqEEhk6Ydm7of5fxuRWkzdSKyA0ycG7DhfHplT8
	+CNezUrwR+9CUs+fByWLzrRpyadkQUEp+Eh4I9KhzmP9HAi+JHCQBCu0AtHZnAmHAzG7nLi9Dud
	tEyeDtiE/FB5VUfD2M9c8CRuoh2aqB+W9F7pGQpPyj1DBTHK5K6h9TxCK2rnHEI0Dg==
X-Google-Smtp-Source: AGHT+IGEJLYduYUPeoDkIamTghfK6td5L59kTNjPxXBCyjG4pfVB1wPpXcD2GVk/GNmyMa7totuByg==
X-Received: by 2002:a05:6512:1196:b0:548:91f6:4328 with SMTP id 2adb3069b0e04-54b011d5afamr2870433e87.15.1743147846331;
        Fri, 28 Mar 2025 00:44:06 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b094bb32esm215589e87.26.2025.03.28.00.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 00:44:05 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Mar 2025 08:43:52 +0100
Subject: [PATCH 02/12] dt-bindings: rng: r200: Add interrupt property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250328-bcmbca-peripherals-arm-v1-2-e4e515dc9b8c@linaro.org>
References: <20250328-bcmbca-peripherals-arm-v1-0-e4e515dc9b8c@linaro.org>
In-Reply-To: <20250328-bcmbca-peripherals-arm-v1-0-e4e515dc9b8c@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Olivia Mackall <olivia@selenic.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Florian Fainelli <f.fainelli@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-crypto@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_004408_330965_B8BFB032 
X-CRM114-Status: GOOD (  10.38  )
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

This IP block has an interrupt. Add it and add it to the
example as well.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 Documentation/devicetree/bindings/rng/brcm,iproc-rng200.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/rng/brcm,iproc-rng200.yaml b/Documentation/devicetree/bindings/rng/brcm,iproc-rng200.yaml
index 827983008ecf707019f45847cd86d5686e3b2469..817cbdaa2b2d75705eda212521186c40a9975ea0 100644
--- a/Documentation/devicetree/bindings/rng/brcm,iproc-rng200.yaml
+++ b/Documentation/devicetree/bindings/rng/brcm,iproc-rng200.yaml
@@ -20,11 +20,17 @@ properties:
   reg:
     maxItems: 1
 
+  interrupts:
+    maxItems: 1
+
 additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     rng@18032000 {
         compatible = "brcm,iproc-rng200";
         reg = <0x18032000 0x28>;
+        interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
     };

-- 
2.48.1


