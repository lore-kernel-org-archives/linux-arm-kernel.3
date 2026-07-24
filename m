Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C339BC531FC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 18:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E7TvtJzRcRw2DNiEVSBV+87jxpIm3RIlwa5Grydb1Ek=; b=iX5Z2apFi2fJlcQ5o/1IJHDHS4
	vY1nPx+/JJJtHfeuJfk5O+xy3qg+V4st7e6ZEVSirmzZHUfpCq+tgAUXh/NnljeE/V2VbgYKOmax6
	Khhptkiqx7evlZPmHGwzj34m5FV1sgBIQMxin48UncVgkcUTbR1xqdFbHivmmKNNtIUys6y9zT62s
	IgqO3df8B29pcUCck3k0I3rTvH4NcrbMTJ4J6InzKZLw0n/0plFlWeL7Iq3ceBHhNLm9CmQvEPTgp
	j4zYb8SEzNoHMxeRyDD3qWqCHEJQrvmH3S6L8dzOAyVu2q9TJJ58Pyo/1N8WNLZ5jRIplflqy2c/l
	Vy8uXfLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnKSH-0000000H2ww-01wF;
	Fri, 24 Jul 2026 18:17:05 +0000
Received: from fhigh-b3-smtp.messagingengine.com ([202.12.124.154])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnKSD-0000000H2vB-2G9w
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 18:17:02 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 243F17A0144;
	Fri, 24 Jul 2026 14:17:00 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 24 Jul 2026 14:17:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1784917019;
	 x=1785003419; bh=E7TvtJzRcRw2DNiEVSBV+87jxpIm3RIlwa5Grydb1Ek=; b=
	fczEDv87UPjDV1BsgmrlxO9qFNGyoqjPa6a2ZHkpDxHHsma3iQHOyKYnCodJxX+9
	3JZn7UkPKNPSEyM9lVwaZ+5fcz8iv0unIafGPeci4R6tZ8OE+9xlVECUkccQjv6+
	03cWWvFNTG0LrO5R2VeB+HFe8R09rJdbFTfOVk31FpkBbeORG93bUr+7FbyCwmeF
	VOiTEQUk6xosQOP49yyGHfrXC1kBUjjFiLLUfUi06VrENIz4dvnpz9VkyjRk74Mu
	eWkNk0+seMa2fnjJndhLJjTYfhlwhka5E+Njmh7FMIzhDBZt8gSN9YEqa9Ztk5+d
	bCCbn+khXxtcqVBpI/s2CQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784917019; x=
	1785003419; bh=E7TvtJzRcRw2DNiEVSBV+87jxpIm3RIlwa5Grydb1Ek=; b=E
	02OSiRQQKIq8kEc8ySUUONk33Z6yyrsK6+NobZ4/nJNsSVOcpHJ5QOJz56rltqba
	ec7X1Cjle1hKaQPgLo/gRX+6uYlYJq3f7WziBebX6xB0saCwgW8H9/njdcQ7KUA2
	s8+QayK2GPY3VbM9iYwOALotYCKlo/vkJhLDZN4o62S1NlePu96dXtgnfRi8pJZG
	97/c0AEPd4rg5OhZGauvMwaxzbSU5pdxwO6GZbEQtCjohH6RIGN/QNv28VsgKPUT
	obZkTazIY8PfodqEm65zmBE0ur9B4zg4GqY1n7HOqYQ/JtwcalEyjX3Yuq3YTC0r
	ADWBqvEgSSKqFGPiXK0ZA==
X-ME-Sender: <xms:G6xjano_jni6IPDUkpoiNdw_3S_ZPt5mqJwt3jPQrEfSnIvGeEj4Nw>
    <xme:G6xjasV7tpRUoUIqMgeidLg5EtQyYCkSlf5fDinwnew4iJGTTL9BWNi4AZ6jrWJTO
    -3xt14lYgMdcMbgaii9959AMY4pFas8cBZ85a7wYjicGRg6PaR-QikS>
X-ME-Received: <xmr:G6xjaq1jQUEEBjr5LsJBqVLS_z6Ei6z1sqpspTvdDCHao4QNsls-SGytgRXjlt7rR5vk_XQMKlMeZnTE4ETMN0Rib1L6KXqcLWk>
X-ME-Proxy-Cause: dmFkZTF1FX2rMAzDkHprU+9SOL/dAhdcZMnSKVMN5sSZpEXUKt0tpgGTqps5g9gzvwIbS9
    s+sfCmoO948cbdaFVKnKsFQZWlQG5l94gQ3OMj/lpmOBEFweLBWIwVRLX2N9lNc3poNr7O
    L977RANIhWLezmIkgwNFbh0KndpYGeRMYxoZTX0qtVRW146Bj7liiLUvZi0nEietp5Cetj
    sJsRGwTLW9VSWvYD3J5JA907Ht+C8uVy8a9gtIre/v7Ls/lg7fJiukWLBXmui4C8aVyG7o
    /Kp+oo5oKDhOQFee530ewC3yY4DxTEPsylZrAsmd6ePp8Q01nTX08+81q9r13bu3UjqCCB
    p3tcB3mDIsdqlX+l2czNK5xu2Qr3BPFqjKlY+pqcrh3nieZ+W64k+u+T+IBDUWnsVmYrWg
    /kQwTH1EzY9b0c4Ep8Gs2tGj9mEN8bCxZpJdbHig7ffIlFFfipkZRW0/Hsd5zivqOzgSPM
    onl8n1EgshwMpSqDQO+QuDvprVdrZakrm/3733D/f/WSxvZCLj9bDSJ9oUMkyOXeqP9PgP
    OsLqTxRxrXmiFrvTfml2Vo2pdG06YP/0xwrAF/X5qzKprZMicGlfkKrNwWoDis1PRsCMUJ
    ct4TQieTSkeWAS5RLvhqYeM/ChDUxAWhjexHpg/OXwTDJ8OyNgPOcuZLgAsg
X-ME-Proxy: <xmx:G6xjal16CQ9yr3w0IkyJAT8k6QTvQZc8UTQvOPqcNW-CKD2qwO9R0Q>
    <xmx:G6xjahnHU6n7mS9OrizTInLxxH35imFDcG0S4HjHDvkLk7pWFKhKyA>
    <xmx:G6xjauPSsviCMYVpRyADuWbFZN3bB9ulZZMbRbq11WQIs7gns1np5Q>
    <xmx:G6xjag58lmxLgX4UyezVPJRt2H9rYwcIJ2OuNMWHajC8wKE5QHKjXA>
    <xmx:G6xjagsLro3xvzqEDM4uKVfIExXPQ49XHGX86_gfoj0zKX7A0BcmJbNN>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Jul 2026 14:16:59 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Fri, 24 Jul 2026 20:16:43 +0200
Subject: [PATCH v3 3/9] dt-bindings: interrupt-controller: apple,aic2: Add
 apple,t6031-aic3 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-apple-t603x-initial-devices-v3-3-bbeba0420603@jannau.net>
References: <20260724-apple-t603x-initial-devices-v3-0-bbeba0420603@jannau.net>
In-Reply-To: <20260724-apple-t603x-initial-devices-v3-0-bbeba0420603@jannau.net>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Sasha Finkelstein <k@chaosmail.tech>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-pwm@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1233; i=j@jannau.net;
 h=from:subject:message-id; bh=GDAcLzUVKgsaSayFIqUH1HECZbzpn/awNHaCk0rT/Bg=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqzkNXwBMa9cOg70/o84fHtXeN12dmFlE67YpR+Nihfp7
 ZaIbdnRMZGFQYyLwVJMkSVJ+2UHw+oaxZjaB2Ewc1iZQIZIizQwAAELA19uYl6pkY6Rnqm2oZ6h
 kY6xjhEDF6cATLX5cUaGWyKVN27cOWysv7D3SX6+WWav0rOgd0ZKZbu2fbrM+PhHCyPDfPYGifq
 oM9eZZd4U9xj53nI0izOO+Xi65aGPm9KFk7E8AA==
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_111701_627409_06D22663 
X-CRM114-Status: UNSURE (   8.56  )
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

The Apple M3 Max and Ultra SoCs use AICv3 as interrupt controller. It is
compatible to the base M3 AICv3. Add "apple,t6031-aic3" as compatible
and add it to the list for 4 #interrupt-cells used for multi-die SoCs.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
index a94787939d34..726a6720e05f 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
@@ -44,6 +44,7 @@ properties:
       - items:
           - enum:
               - apple,t6030-aic3
+              - apple,t6031-aic3
           - const: apple,t8122-aic3
       - const: apple,t8122-aic3
 
@@ -130,6 +131,7 @@ allOf:
             enum:
               - apple,t6000-aic
               - apple,t6020-aic
+              - apple,t6031-aic3
     then:
       properties:
         '#interrupt-cells':

-- 
2.55.0


