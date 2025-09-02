Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B4AECA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 12:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d8XZj58AfuffXLo74Vy8aYlA//3fYOnrLNQd7UOnLAM=; b=WyDxThag+sfE/Z97b+QO2kxsEU
	2ESPvDkHZgTQ7xv0I+shbf8JijjOJWvjU+md4nhwE1CcDaIjdb/VdmWgbGxzFAW+Jra2A8bUz6sGT
	Nm2CVlm3KcY67+q281OmXOEZH03HzrWZbgOdjr51N7BnD/mwBaVSVgHBOvWOxsB6pQxL64kTaCUBM
	/P12P0GVoUm/pW83wbJAm84y0So7YNTw0o/vKLFghes8bzZrgeJVCoYbZw8zY9bEBmmCTHV99KoTx
	/nzTIiud68sjmTGWWCEOzSlDapjJhJ/AhufEfI0YxJ38PhQP2HNhjZrH4oIbmTDQzLBY5vbFwTZwr
	BsSs+KZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQ6x-0000000HEJf-20FX;
	Tue, 02 Sep 2025 12:27:44 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utN79-0000000GIxv-0880
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 09:15:44 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b04260d72aaso25140566b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 02:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756804541; x=1757409341; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d8XZj58AfuffXLo74Vy8aYlA//3fYOnrLNQd7UOnLAM=;
        b=MJm7snnzrN6z04JlEBBqzkHjaekF63PYI+5PCmApo8t/7eYL8VKjrUU1TZm2s3lJz9
         0nDBFlT3q8RRreRd/5GIeqggGzGbyXqpQQX1YbCSOdHcTWVs4Pr8AViiCBEuNvVCQSgF
         H7XGE3Zoc7VZTkVdvFGL6fo0pkO6FshJ0wfud3e8sOTDmFzZotiHYklCHm7PrQvPArxJ
         7/hsngOTYODbs3aSZdHFNPviyS1xs+PYCmMkzqa8KYbfOJtze7UTswCYtYuxypSDKDlx
         sR3zgAjDX6BFRiS/k3opf9U41Bh4c3T5rBEZVJ1e2Mz7QzRieWo0/3/SR5yv5ROH2At2
         IYVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756804541; x=1757409341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d8XZj58AfuffXLo74Vy8aYlA//3fYOnrLNQd7UOnLAM=;
        b=d5aPkc5Ii+s3ZcHN8tpCEjK7zUTXDnC5RpNBLE0wY2Aw0XPLGoQo0XhE28QjavvCKd
         /toGc0njUX6l66Ym7xgIMgl/n9sdH+ySnn9HAkq2j3LbixS6SuS5qiqZRcok80SXP1bs
         te5GQLNZigsNqqwuIXXm86Q3GOdVYuaFt0bUWV8ewC0mkXJNcZ+kQgskYdcCNgvER1a4
         8wBZhDXHa5CQPyveRKcnDyf+j0pvA7dNCcnFIChHg0BEWW5HTbNNaBRvql+POqFcdvkc
         K8hq1GoK4PVikMkN5MZvhgq7ichZGN5NsvhsysDFCIWTZMQDe9SxvtQaP/TzFkLugL++
         dTeA==
X-Forwarded-Encrypted: i=1; AJvYcCVLykYCBx6UXY611tH186Onzj4+B0s9yuOhxZ05FVQhoObe50aW8o2tmW9nSaQigLJD2WBP3LNVQhUImUVAQjVk@lists.infradead.org
X-Gm-Message-State: AOJu0YyMXZQG++0gaxc8D7q9gvaS3XGoqfYoheskIyhMUqkDTAnaX2zu
	Bx5Zt22Yl+97/ExYWhIGcduHljwSmlByeGNApyR4PxReVjT+RaeHUd7RCyPtzFLgLxo=
X-Gm-Gg: ASbGnctIVGW6HoIruMDASZPp8q6Xoj2D309VEVWL73KQLs1N/wTezqqCEfzByxXBKy8
	rpVCg6NWrdv7f41HV/PgKOMG3wY04mPNpGaI05KyjgUrEqqzs9h1haS2+zVu8n3cISrFkZHUeQK
	UjqAODGLrEcAuHk4/bhxKJDRrdvFA8X021Ne+L71yHmsxzhX9Tt2LqAawi4QUYkHpN6MMtN+91u
	JQby+5YGLRoVb73j8mtjikL6JMd+I3uOxiP9Al4Glj5nksQ/6VR1iORHpE10RujSxkg9CeCmCVZ
	FOyDrHfZxDxL1oMUlYYeX7Bx0Poh7l45dtGqwbJiwP48KqzUXVs2Yav6culhJQNpi1RjmKvsDn/
	8r2oTGVjwOEmuCYw3YFS9IQcLU/VZGHA1iw==
X-Google-Smtp-Source: AGHT+IH7ISdvmk9LdLXUfb47YUHhoUHT34kW8bHgs46FMafpaBt9DhVN+MYvqleNA7oVddSWHu0KMg==
X-Received: by 2002:a17:906:ef05:b0:afe:872a:aa5d with SMTP id a640c23a62f3a-aff0f022fa9mr729067566b.8.1756804541416;
        Tue, 02 Sep 2025 02:15:41 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aff15fccb15sm877008866b.98.2025.09.02.02.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 02:15:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Matthew Gerlach <matthew.gerlach@altera.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH net-next 2/2] dt-bindings: net: renesas,rzn1-gmac: Constrain interrupts
Date: Tue,  2 Sep 2025 11:15:28 +0200
Message-ID: <20250902091526.105905-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250902091526.105905-3-krzysztof.kozlowski@linaro.org>
References: <20250902091526.105905-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1016; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=pK9+ijRl2j6HN0tN4nwtWsdeKYO080hTPBOS7dCkey8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBotrWxaTzC0t9SB2cO/DTD22p3u2YbOPnNDsqYC
 JeNdd+LesuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLa1sQAKCRDBN2bmhouD
 1/h2D/9Sc3syBi5afN5lHFwOrNyVsaCUZeb7toIaCPz5fDF/nnBxaDdqMiyBKHv+oWOPmQJcWXl
 J5Q7rx9JPyBEC3B2rKaONy95EOxJaAFqrC2rGq1OL8BlgWGSnl5MUK1xX9pFC6oqM4rSoAxbpUI
 LCikfUeSYsAK+9M9Ej0b59qoAjb3fXf3pK9s/WY118krSdhyuWzfXLWchmkPxsrSSubHCYncveI
 O1qKtkRVG8+hrDE3h5Q0AAQ709zYOi7sh2kcDOxsX1EVdnkuCotvvJy6Hs0nDsxb9NrQ/gQj0fv
 L+2Zq9YiQrrv3XYDZsGx9C5eb1ZT6EhIbqXTCL1s6cECGTHXwANAQa4k5nqe5B/QV7WMyayJ6zu
 iQEiNDEhurJ0corFkb8SQJeov67WpP5pR4+1AOHxcABobdrHitKZ6HkNFivVjRuPEZ/hrk5Ls8H
 97EzieU88wgVgrnZ1l9BDz0xvjQcQELkttmXFIUBSagjLbdvX8074/XpxaelVnEhYtX68CRmpci
 2XBOhGrWS9sSd9ftltSwznhq9BBTVL/taAp4hZdq3uZXfoEEGahSihXA98O0n/oiMOaJJn7Yuoo
 +zS0+m38Zk6zbpnex4B8FJsk2zB2accitUUwpoHH/AtazIZAcxo44rYPPKKLJvBcZR4+GwPQFQX GubCOLzxqThca5w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_021543_070501_AF50626D 
X-CRM114-Status: UNSURE (   9.84  )
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

Renesas RZN1 GMAC uses exactly one interrupt in in-kernel DTS and common
snps,dwmac.yaml binding is flexible, so define precise constrain for
this device.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/net/renesas,rzn1-gmac.yaml       | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml b/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml
index d9a8d586e260..16dd7a2631ab 100644
--- a/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml
+++ b/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml
@@ -30,6 +30,15 @@ properties:
       - const: renesas,rzn1-gmac
       - const: snps,dwmac
 
+  interrupts:
+    maxItems: 3
+
+  interrupt-names:
+    items:
+      - const: macirq
+      - const: eth_wake_irq
+      - const: eth_lpi
+
   pcs-handle:
     description:
       phandle pointing to a PCS sub-node compatible with
-- 
2.48.1


