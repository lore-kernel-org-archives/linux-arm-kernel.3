Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA2FFCDB46B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Jun 2026 21:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HTAQ0YVnmRPUTpM5kMc2Jmb3ZZIxno5dgQysePNdwmo=; b=E5R1gOQ5UuYqLjUMdmSFxcU79o
	8PPNItgO1HQoAIbl4OkzQKp6IPrKm4b3b782kddR6ZKsL8JLxaWsM92ER/fjBa49D45AWDSHkZOs9
	SlAIrPy64GWL+j+PSdiLuqLgVryiVV1XQKUf9pQaT9DmHBEyULzcSBmOdFQ4PxknAY3XTZK0IwPWr
	tbQubXPYuB7I3O1tLcBq3khuvNwQ2nx+nXspAfZS1NpCwPPiqDmEsfVMphqsPhBVQWHL1NmHKR4bK
	Pclj04ZWMQ2DVZRcPvX0xYXnYydkzPjkNXw94C08iaATFiItY9t0S5xrZLPuoniziGA9yh2g0S39d
	m2c3ozeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbPv9-00000004AvW-0kZ5;
	Sun, 21 Jun 2026 21:41:39 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbPv5-00000004Ash-2paA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Jun 2026 21:41:36 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-8dd3fe9cf10so34737746d6.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Jun 2026 14:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782078094; x=1782682894; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HTAQ0YVnmRPUTpM5kMc2Jmb3ZZIxno5dgQysePNdwmo=;
        b=Hjd9SnwDKNmdsBu3YN7d4PmELO5s8mO+iHiqcjHc2YClwt4NxDzDA8a+fFGByiPkTJ
         057vFhYWRxZEoW9tVMc/S7CfGm5LvtaIl15l/8upz2bupznqqj2ahBFrKaBQwZaFtqfk
         24CeHkUTQ60HpR1+RjKZA7HlmwVAYaPkG5nHW+1VM7INedSnMbLz1fGItqk81Em9KxCV
         ulrcncvYoAQlUlCg5Fg8278qARBn6pWS1Q8aR96Qdb+1JLqG62Y+Fcr0YL3Et81yl9YH
         F/odk8IdwswoQiCTbyETdPnCqGqjievkA7etrJlRdXtfRDEQAsFOy/SwTDV4fks+gvsA
         DBiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782078094; x=1782682894;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HTAQ0YVnmRPUTpM5kMc2Jmb3ZZIxno5dgQysePNdwmo=;
        b=YpBqGTR9eXQ3HlCZUazFDI64nZOWcuHleBQwSsJJIxvZlBmleGUWmyu4x2VIt5Zy4p
         rRpeCbqBVO4529Wzd9UhdwRtis1JG3esJgOo0+rU8IE4WIfuFuc5EtBBJqg4e2kArjLB
         r2/EmMXH3MOt5e5bkseQaFpHKWqeXyowOLwYRZ3dGf10vEBVAXncDjCoIOgnJBkOwBy2
         PKCBw3zPy96sWHgkEy0g91xb7lIbu/Yv3AMsVjk7NOY4ElBnC/Cu8EyOQHbY5hdl4NNT
         qYq4z84+OQl21+dcQjrvhpn5QVdr0QTWyt5OMjuwokJvb270ilXa+sQNGnKex3j6Ecv0
         7iWQ==
X-Forwarded-Encrypted: i=1; AHgh+RoTbbVkelPfHkkodvU3xGTbzRZ3a0fcnNKbFi4jDfRQwzT2QsSQ1FqdyWfT19L1ddl0RuD8ZfUSobbsELD355cn@lists.infradead.org
X-Gm-Message-State: AOJu0YzC3OvfMI9SfSFYRzTghDO5Ij9Oca0cZBxZdyakmlk6UMyvzgPu
	+k+MmBuwx2bb9uCniJeb1hoNOC4QmKmCacpLHsC+4UywxlVlPLKWVVVb
X-Gm-Gg: AfdE7ck+G8SEk5dqeSXd5W5NZ5wRlrIcFPrDZiojC1M6J//HxrRgfKwYeYXQeljii+C
	JpKKS2jgdQHqrAb0NC2NIAcnidcxuInXECFTDMMoEJWUpKa6fgSP9TetE2Zu+WVzcHN9A8CuxbU
	MTYIg42KktwNUPRnn7ddAduapP11whFCT+rXJ0guVp8dWuyGb8ZHOaGNARaa8kAO1CZpoD3SdgL
	mY9L2vcfYtmHjGaCz2QkdV/2kAc+bQBIvjEPyeEmtNoQPAluvsag1vxwDHRoB0NkYPCxr6DBrnC
	oxzlm1QACyrEp5DbNkmyNqIBS//SyFj2OzYNrMUj9LT/ENW2HHuLw+kJ8yadpQ/EWIqTMBxDuLR
	sx6sy39Cr0HoadL2IjKJmIyAmAfubXh5TjdYSQ/WvlneNe0jMPDtGX7G35doCuBxAZUEan6q+Vg
	D6n1UabbOJrz+uhQ==
X-Received: by 2002:a05:6214:124a:b0:8a1:8b0a:6678 with SMTP id 6a1803df08f44-8de415cc13fmr219484556d6.31.1782078094430;
        Sun, 21 Jun 2026 14:41:34 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df81cde9ecsm76274676d6.24.2026.06.21.14.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 14:41:34 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Sun, 21 Jun 2026 21:40:57 +0000
Subject: [PATCH v2 4/5] dt-bindings: dma: sun50i-a64-dma: Add
 allwinner,sun60i-a733-dma compatible string
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260621-sun60i-a733-dma-v2-4-340f205891cc@gmail.com>
References: <20260621-sun60i-a733-dma-v2-0-340f205891cc@gmail.com>
In-Reply-To: <20260621-sun60i-a733-dma-v2-0-340f205891cc@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: Yuanshen Cao <alex.caoys@gmail.com>, dmaengine@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_144135_738897_02AF76C8 
X-CRM114-Status: GOOD (  10.46  )
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

Add `allwinner,sun60i-a733-dma` to the list of compatible strings for the
`sun50i-a64-dma` dtbinding documentation.

While the A733 DMA controller shares many similarities with the sun50i-a64
DMA controller, it requires a specific configuration due to differences in:
- Interrupt register layout and mapping.
- Number of channels per interrupt register.
- Support for higher (32G) address widths in LLI parameters.

Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
 Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml b/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml
index c3e14eb6cfff..1cc3304b7414 100644
--- a/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml
@@ -25,6 +25,7 @@ properties:
           - allwinner,sun50i-a64-dma
           - allwinner,sun50i-a100-dma
           - allwinner,sun50i-h6-dma
+          - allwinner,sun60i-a733-dma
       - items:
           - const: allwinner,sun8i-r40-dma
           - const: allwinner,sun50i-a64-dma
@@ -70,6 +71,7 @@ if:
           - allwinner,sun20i-d1-dma
           - allwinner,sun50i-a100-dma
           - allwinner,sun50i-h6-dma
+          - allwinner,sun60i-a733-dma
 
 then:
   properties:

-- 
2.54.0


