Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 877E9CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 20:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FTDiYUkL2CUr9l6jV622a3f8KP7BPruwWZ5gte8PmvI=; b=IBbY2kRdP5wOrJ9Q97G8pHlruD
	dZ+jT7zERABhZEgF2m+Vcw2zCJlCKKNU4i5J4FC987zb0c4gDAw21an6J1oZKtA3jRUQV2CerfGPG
	2Q3oG9Tb3Vuw6MjuLyhZVHFWN1/tsRIGhaSWIJk815DHKqzK6a7cbPJDa0YzBebswRkosedqn1E0E
	BLyWBBTwptYrSl7ybE94Jn5UKt6gE0us2rXjHAsLzAaDq11DHMr5PIXcVPMzJKXO9SIKDBaVYGwaU
	MfBhUe2TrqDh3BMsJSO9t4wQC78MrX4UpbjB23YMNHzJm/0SqFgSOr0mv/rndk30mOc/lXWXkifKz
	Qq/jkNsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uviO5-00000002AHp-2Drk;
	Mon, 08 Sep 2025 20:22:53 +0000
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvezB-00000000qC3-1yrF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 16:44:58 +0000
Received: by mail-vs1-xe36.google.com with SMTP id ada2fe7eead31-52a73cc9f97so1382488137.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 09:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757349896; x=1757954696; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FTDiYUkL2CUr9l6jV622a3f8KP7BPruwWZ5gte8PmvI=;
        b=RlZXOVeL7DsfihQmUj3sVyA6SwfCL8BXcU2lNCQnzGUvvaJhI7WBD/f3btAVZg8nuk
         b5lH0WTJ+2TJbH7keLNMAKfRWskBTPHfaJSIQoYDwjh0kGOwAKiOHeHHtE9ZX5UJVMzT
         RzBL9Pr3X3EGb3KchOsZmG5H302232JOZqgq9ysoKpnerxwhIO0kYxxLzFrrUkma8vl4
         iNsgZkpSUAqNcvnapA2Kph6GNTQzMf6i1bQ8xIAZQKQ7Pa00OhY3txU4Kt5mQlDt6Egg
         EfD3R4PxaCw7S0GC3Rocfbkqrp3JoTwxzCZ4xyRpod8kTpum6lN9S2/0NxZtVq2mHTU4
         j4dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757349896; x=1757954696;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FTDiYUkL2CUr9l6jV622a3f8KP7BPruwWZ5gte8PmvI=;
        b=R6cdjN/T1PoNjXFvjECQfsMLUnlW76EOh66A975CuE7TNSNcU6jZ2VREab+sfODpyB
         iBG9BV3WFqhbX5lsG2JiXRDJNHXfy+6jonatjdqtb0IfgL8QI3h2LCgYz2wG9TaGg9JK
         Zdbkec50HLYwu1NDYbIlAwZ98yl9S78uW7CQYec6w71cgCJtO8zgh3SYejuodUjJbEui
         ae++b8faUZUV3O8RA3bZLVM4J8H7eLorM1C9QXnpmcymWDX/MbdtavIjS2mSVrWJo9c9
         0yMafQGNn+0YY3ZPuv/bPHYAv59ILGO6z0HRh0BarhgNcb8SlZe45PV6b+Rsz39qAHG/
         uTTg==
X-Forwarded-Encrypted: i=1; AJvYcCXeeXJBuXGzJ4VvvW7pokk5ljrAmoSrE+ZYMfoxgto+Y3RoOH/+KOkyWLMwltC7+p+ZVqzMUlU/KAgz4eryV16p@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2KsR71QP1rPXh1sxiGSKc5eB51UIENgiY0t7KJuFJ3oLScXVA
	JWE5QVpcjFYNq8i4OLX4aKUDIYZlbQCH21zBA58W4Zw+eTTZWnXm0tKn
X-Gm-Gg: ASbGncuHNn5NMi0p2jJepJP4DEy70ByKHFl/nFC1jOsf2FZUWe7BLODaD+Fgr+MZerY
	h5JZJTyjJImSVdKPm17ErG8OBXvPHTBuSrtpQtknVrzc4258hN0byVl3AuBEpS7cQbiHCM1VjRr
	DsZrIdjW14ci8Wy7kZUmXJ3hWoM+Ov+s5f6eH3E0EtglZpVidqYVW9JdYZvjK5vfiIPncAcUwnH
	QGclu5vBUiENX+ugKdDvi8Hc1QP775gqjzz1DwnzFiZT2hRmS/vyYUI4kG6fL//58umY/czzFOP
	z51sIJqz13aWKm1MDWTLV0ICQly4YB9rfo1Rjq2l1NjtZJ57yDXT4l/aqqEeePozkDG1ZxVV3TQ
	6OK3AbiEBN3MU19TBR5kxLcYHoWvDUH255Vdr
X-Google-Smtp-Source: AGHT+IEaTNiP+f9nKLoXBeh5yoJCXM8uvjtKSeIiQ7v3ifbHJ4bT4AcLveiBFitDVMsUfEgSA1p9QQ==
X-Received: by 2002:a05:6102:ccf:b0:51e:92cc:6e6a with SMTP id ada2fe7eead31-53d160d3f9cmr2416721137.33.1757349895788;
        Mon, 08 Sep 2025 09:44:55 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:c727:aee6:b2e8:7953])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-52aef458d62sm10689214137.3.2025.09.08.09.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 09:44:55 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] ARM: dts: imx6sll: Use 'dma-names'
Date: Mon,  8 Sep 2025 13:44:31 -0300
Message-Id: <20250908164431.67052-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_094457_511381_8326C6F8 
X-CRM114-Status: GOOD (  11.79  )
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

'dma-name' is not a valid property and causes the following dt-schema
warning:

dma-name: b'rx\x00tx\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'

Fix it by using 'dma-names' instead.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 arch/arm/boot/dts/nxp/imx/imx6sll.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
index 8c5ca4f9b87f..704870e8c10c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
@@ -309,7 +309,7 @@ uart3: serial@2034000 {
 					reg = <0x02034000 0x4000>;
 					interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
 					dmas = <&sdma 29 4 0>, <&sdma 30 4 0>;
-					dma-name = "rx", "tx";
+					dma-names = "rx", "tx";
 					clocks = <&clks IMX6SLL_CLK_UART3_IPG>,
 						 <&clks IMX6SLL_CLK_UART3_SERIAL>;
 					clock-names = "ipg", "per";
-- 
2.34.1


