Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43BD8D41176
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 11:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jyqWPUPdksTIWYuKZmgo4nd2lHSjHXcu6SXb4jlQ4Xc=; b=gyUMli9z6MJ3z278huDk+uTdlx
	SfXqCU7SqaUjeHwYvTGvRkSVDtjzU1G5NIeR2v9jALGzb1pIKVdX1yQjvJh5zJ6MwR+Q2/it5j/a9
	1Ml/jGrLcgHvg5yeLt/AJPVheMeybP9H2JRQ4Ry+pbpJBpzWTHaNicJZYHzhTc02ktdGNI6MghpIP
	oRWxHpLlicptHOyXnJqlDKZa+ARjCO8qV4S8qzD7a5pod8FkGL6aOdfyqTGaZPVbnWzmGuP94hzcC
	Daj8FmYiv87dMvY5XoxVZefxfTa2KHxJ/qghYocZE4vLEBqugtrgqbI7uqzJJDbguamJ64l+uiFza
	OCTUDrFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgLiy-0000000CFEz-3J4Z;
	Thu, 15 Jan 2026 11:41:12 +0000
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgLiw-0000000CFDx-3Ga4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 11:41:12 +0000
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-12336c0a8b6so1524282c88.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 03:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1768477270; x=1769082070; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jyqWPUPdksTIWYuKZmgo4nd2lHSjHXcu6SXb4jlQ4Xc=;
        b=sFGL+qii3EHiKnAZnbqkqoXANm0VWivGyf28Q+5EhnZQSTZAYIMDTq8SVbYsNF0rF5
         1zDG5D2u8UhwGA1/qVG/O1Z36wXcXncPTg5bNpJBU0dCqXNd/HK+5THuXQdhn06mSWZp
         PokUMV1F/rjuo8wUVoa9UnN0DXdALzyYrGkL7gl4kyT5jFlI936j+TsvdYJ85M0JpSbY
         h+nZgSIJTj4ekh+95tWdqwkcDlnD3T+YjEeq8AHLwRhOYGYpLD99qUxIW/Y1fDKo5gbP
         Ohf5fQuiH127J26c0cMTXSYD3VJLdTrwA1NwAoM8bR86qm/sO05/rXOv8gzExbNt7VQM
         i7Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768477270; x=1769082070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jyqWPUPdksTIWYuKZmgo4nd2lHSjHXcu6SXb4jlQ4Xc=;
        b=ZFZP15xJkjVKOzEv4dCQTVGqzIzUoSnqsoG9k8NqddmFzGCRtdXLgwSQJ8dx0rejIF
         Wkv0yg2T+Ww+pJ1N98huyUVeFpnLABvV7w6xRnMjT23hnd4yuRJuaHJcaEiDieF37PPm
         Nk9ZfmL5HHqgpyfdBcZCMJgGmD/VW5Mt/cZbcBKvPBFv1xPUjNCqUwQfQN5xUIXL5JVD
         GlXvJ0Svud+PgbLxMo7yXBDkP4Adc0pNmekCoEi84mX34uvAHodEiTbf+DUSFffI5V4O
         8MFGVFeAHy7VOuR2kkqIyzOWHPsi2jwJUDnL6J714oWgLmL9RddsMvJqVbNmK6OWP1sg
         h9Gg==
X-Forwarded-Encrypted: i=1; AJvYcCUtt4n3JnOXt0EZMmPQBYO8at301e9HkVRSOVio8yJsSGsdaQO6XUx7LLOulCVynFUWhJfgAFjXjXCCzVfPMQ4/@lists.infradead.org
X-Gm-Message-State: AOJu0Yzy9RSgipH9JhKG7GbwVl+2/nqm5tM0cbHUjxysRitnGGsn6onf
	0WWtWmVWr75CBCcwKINASkTcXfdISgrlOsY9A21P6Z1SH0MD2F2Bm3Snqd1zBINdsFU=
X-Gm-Gg: AY/fxX5o0ien5vLDCwnfjJMOToEX6uwJgK3GYuRXpfZO+fvHBubjJUiqhV8QD/YCvux
	xa8M4fqiAw6lf0sTnUIvlep2YyqWQa3EBnqS7u3EjnG78/apqcjJwK4OqHYwbGTh0VsHJRbMA4x
	RHxIaJSgHqVOceRZVS4O0FYcXYuRvNs1fQQlFQaCQp1tmbCCfIuP3SVFk6/sKEn6hE1/+uRNddQ
	O6KDZTCjW8qrKDb/DG53cOEFePduI18wmXeIUa0qNKVi76H7m9qzsEFUPlZxinXa8IAy5J4NdZP
	5zhvV0uqlHs0tISETNIUisrFCvtIyH6sE6geB46O99HeK9NHFJRBjn3a63Boyvue3Zi9SIzFsHF
	KSoMVu/iV4fQ4tLXAuviCJJLp/5nwbnHR8azosql2H3dSvy7+nXue5TduWyTudTzGcSU34BehBB
	B2rHgsdJYuws3bvwWZ+q5yegwCN9swCtIymdBTWabG4pGpm23ys/MEU/WHA2Kc1m/JaXnWEV/C6
	OLwR8x3
X-Received: by 2002:a05:701a:ca0e:b0:123:2c98:f6af with SMTP id a92af1059eb24-12336a45a0bmr7461678c88.14.1768477270097;
        Thu, 15 Jan 2026 03:41:10 -0800 (PST)
Received: from fedora (dh207-14-52.xnet.hr. [88.207.14.52])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-123370a051esm4875347c88.15.2026.01.15.03.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 03:41:09 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	lee@kernel.org,
	andrew+netdev@lunn.ch,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	linusw@kernel.org,
	olivia@selenic.com,
	richard.genoud@bootlin.com,
	radu_nicolae.pirea@upb.ro,
	gregkh@linuxfoundation.org,
	richardcochran@gmail.com,
	horatiu.vultur@microchip.com,
	Ryan.Wanner@microchip.com,
	tudor.ambarus@linaro.org,
	kavyasree.kotagiri@microchip.com,
	lars.povlsen@microchip.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 04/11] dt-bindings: crypto: atmel,at91sam9g46-aes: add microchip,lan9691-aes
Date: Thu, 15 Jan 2026 12:37:29 +0100
Message-ID: <20260115114021.111324-5-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115114021.111324-1-robert.marko@sartura.hr>
References: <20260115114021.111324-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_034110_824786_6342D866 
X-CRM114-Status: UNSURE (   8.43  )
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

Document Microchip LAN969x AES compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---
Changes in v5:
* Pick Reviewed-by from Claudiu

Changes in v3:
* Pick Acked-by from Conor

 .../devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml
index 19010f90198a..f3b6af6baf15 100644
--- a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml
+++ b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml
@@ -16,6 +16,7 @@ properties:
       - const: atmel,at91sam9g46-aes
       - items:
           - enum:
+              - microchip,lan9691-aes
               - microchip,sam9x7-aes
               - microchip,sama7d65-aes
           - const: atmel,at91sam9g46-aes
-- 
2.52.0


