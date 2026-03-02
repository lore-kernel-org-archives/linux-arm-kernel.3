Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC44E9B36B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 11:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QOxR18o2+9ulYS4r73qXsZYgHJUpIGAEfbN7mi92aLE=; b=rGPgzGXdGyZw/cfEGKKf9OF4bM
	+epMzKk7zDoEVSGHsrfRoFGTdrHeYjzKGBO2s0hrCRz3J+pOYbsVmeVo5pLvq7/hXg2XzOJtrIrhH
	6zuKMblxyNrui+wJtQDz67BS8My2xLOTmm8d3s4lRuyRaNsrdjDF8yHgoBpr8Pbh7Uj62A8dPQJpC
	Dclv6Jyae6kUWDiH7IOQpAVgGbLnqhd+g/oXlkWcFKs6WmI0A3opIftQU1HR52I13bn3wmOgHQ5HR
	uWYXKlNzzG2VIUTk3rZIJ2ps1UBIzaXQgDDHBP/X8MjAtNsUG6MXyEFIYTXnR4UPmb8mBxNYnnbfc
	mgWW4Fkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1Ll-0000000Co6l-3lO7;
	Mon, 02 Mar 2026 11:22:09 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1Lj-0000000Co4z-2x2V
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 11:22:08 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-48371119eacso54168935e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 03:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1772450526; x=1773055326; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QOxR18o2+9ulYS4r73qXsZYgHJUpIGAEfbN7mi92aLE=;
        b=sUaR4cYXHX6YeJHuYXn87wPYNPaBIPLC9dhVU3P5pGO6paON8RbH0tcVyMJ2E1sGkA
         C5bBww8a5YoM5SxOiJdg6gN65CHCluKXg477tBrCr8A9qpXklMN9CU66fD1O00dYGcns
         i+loI/7o6HncdajyFcC6l3Uh+LhPYYICwbbiTEQh7kOCRelIHnKzjJfIFe6yEL7MOBXZ
         rH1U9nJFqHVzSN23to44RFOs0D85Wn4/jEajZInrw34bULLI8NbWMmvmCBXrwBO9UYqO
         +YA08kwkXerq501E74KWHFXSuzHZ2HtSHKAvZ1sZOpDz8LrhDumiMSbmWgemspz0bHJ6
         wh6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772450526; x=1773055326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QOxR18o2+9ulYS4r73qXsZYgHJUpIGAEfbN7mi92aLE=;
        b=g0bujxaG5U/it63NwsNA7mAvtRCyALSGPL9YRMgkitXKXv7opP1Ge0okKxpLRZ3HfR
         vexzR1ANWnciIrSYYDgmoILPbayxw8XRIjcrrji9WlRDE4rGzgEWP8EczGswrJra0QKS
         JzgMO1d+1v0ejLlGxhZWmRIgZPjgJabmpWKjS36kQY0qMujhqxmG+nwoMEsaf6JRzi27
         aalJJrWyohAsQwbSO4yhn0XozrBFaJq1Dy6am8HxC5h/QOfBvi5zzj7HdTqRmIz+D7sl
         xHQMO/rSs4iML0WOTFzdgFwxsnvSvn6z+SnmDWqiDzx/9VvTOD6gtbilh9emoRLEs3Wr
         +xTw==
X-Forwarded-Encrypted: i=1; AJvYcCWaaaQtfLwx/y/5mXZnMVL885AGMshRmUCjE+1pat8p+nhbhDA+3zQj+S69YaaXbNgFJeNB2oO6fQHRva5LwKvg@lists.infradead.org
X-Gm-Message-State: AOJu0YxRr+EXb3Yyt3gPEGOVAU9NybrTAlCJ+meOaLBSwkcXfLLpymIs
	kougyl7E+nq1b0y6rowoyaSucnoPqlFrKGVS5UaFYKmppT0QBxikEi4kCNOAnRGR0/A=
X-Gm-Gg: ATEYQzwIxT2Dm5DWeBaoc2uTFYUP6tYFyKzj1xLLfgd7PlOeubZdOnZ0tStLt0/A1tn
	V+7BnJ/lIG+2ItDou85epb0jTyljWIKhYPouRZ6oQuLGzhl+4pKuSawkADhWrTBpb9KlJB2YeSU
	B5yJ4yX7QzVVtGj1pL6XfinSph+/5MUW74OLJ0JET46DOGtIsJa2oAIuegrxio6I19iyurrJjFQ
	XI6hnsnwGlI5Z9T+vLtwvF1h8kWlec0fS4ZpAXIrzcKVQOZ7SjQUIlgET6BAMk7nmbexfEZjhXO
	Gmu4GR1OaY0k2hYJjQPzF5FbK/ILVEai3bDjEkq15Fu0umB+5syngpFzdI7+NJErEZq6/0BXQv9
	YPpdmo3YunlRKhsllJCVXpiCFDOhwxpC7umWhXPZTx4+5ROmyETLNOXZ6XqjppaLxOH5uDfnzJ2
	ZXih+7HIa7fJK7h9u7Knt0g1yoYVQ3UGXXw9VjxiuoGf0gge5eEGRLkAv9WUE2tBtpozngBV6eP
	k8gZ1vJMIBEdxxbe1w9CP4u0BKclKFQs3XqukOsLG4=
X-Received: by 2002:a05:600c:8b53:b0:47e:e91d:73c0 with SMTP id 5b1f17b1804b1-483c9c0bce5mr211979425e9.19.1772450525627;
        Mon, 02 Mar 2026 03:22:05 -0800 (PST)
Received: from fedora (cpe-109-60-83-135.zg3.cable.xnet.hr. [109.60.83.135])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-483bfbb465bsm292493035e9.3.2026.03.02.03.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 03:22:05 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	olivia@selenic.com,
	herbert@gondor.apana.org.au,
	radu_nicolae.pirea@upb.ro,
	richard.genoud@bootlin.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	horatiu.vultur@microchip.com,
	Ryan.Wanner@microchip.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	daniel.machon@microchip.com
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 2/6] dt-bindings: rng: atmel,at91-trng: add microchip,lan9691-trng
Date: Mon,  2 Mar 2026 12:20:10 +0100
Message-ID: <20260302112153.464422-3-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302112153.464422-1-robert.marko@sartura.hr>
References: <20260302112153.464422-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_032207_756165_262ECE6B 
X-CRM114-Status: UNSURE (   8.76  )
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

Document Microchip LAN969X TRNG compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---
Changes in v5:
* Pick Reviewed-by from Claudiu

Changes in v3:
* Pick Acked-by from Conor

 Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml b/Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml
index f78614100ea8..3628251b8c51 100644
--- a/Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml
+++ b/Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml
@@ -19,6 +19,7 @@ properties:
           - microchip,sam9x60-trng
       - items:
           - enum:
+              - microchip,lan9691-trng
               - microchip,sama7g5-trng
           - const: atmel,at91sam9g45-trng
       - items:
-- 
2.53.0


