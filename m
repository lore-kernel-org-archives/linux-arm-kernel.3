Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA6DDE9B36A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 11:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P5eHw3BS810lHNeg7f4xIwnSQSat/sp8IElQzLbapwg=; b=XANUAJOAmb8moSuQK14usjgnxZ
	lJ0Q1BTKfxj96XoUGkOuFI8u06lzrniS+JmTVLeaBeqpsIpbzjZobJgUvmaDsNW8hV9CMfwJtnNpO
	zXiyjIEKT6P4VMqrCwVoDz1ACz7v6/nb2vb7Eg52VSqinyV7Pdj8tkxfRsUdQa5CuZz9WsvrNDdbA
	Ha5lLTfVOIOKc2vsFjtdI9tpPOw0dfK3B7QexIOK5xUrCCyPYMzZZ7VFZFHL5LH3n7NzgZ0NUcNBl
	VMgI1z4yN79fI+vLA3tnuEPX5hhhxjtlR54dFHNBuSng1tDOCkW/BEshptf1LEBMKjWCtqEXfXVsr
	lkN1L10w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1Lk-0000000Co5q-1wQ8;
	Mon, 02 Mar 2026 11:22:08 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1Li-0000000Co4P-0KCt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 11:22:07 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4836e3288cdso29768555e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 03:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1772450524; x=1773055324; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P5eHw3BS810lHNeg7f4xIwnSQSat/sp8IElQzLbapwg=;
        b=U79G9+N3OA2G9NDnOEcXjcnC8+ZPwShfZbT4FQ1lYtIuCftij42boAVgvJ2UHoOx0p
         +x7Ft+C70SlrmwhWuqUrNMnUr7XLeaVV7eEumBcobx6CItScyT8axoOnLKfpolZKT2U0
         YwyPPCQRd3RIEyMxLxASVOLN+WTiCKummsS0/KQaZr9N1FzxDk+Kng+T9VKjcXAfl9K1
         VvKE9vR60r7UaWHJ5Vair+OPSlQsMNtm2MGRSBIrjDKC4SKCctYZPhwSSDT9MtxeYJLY
         oYRGkTUY20xmdRgdZMCHbbPFZrCttICc/V/RG91kKeSoMx8lyK+OZmEwoupVZTL6JSa7
         OOkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772450524; x=1773055324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P5eHw3BS810lHNeg7f4xIwnSQSat/sp8IElQzLbapwg=;
        b=Cr4ttEzQHzmk/IhSebdSYPONBBCRhn/dN+hsy9fS94aCGQ4ZRDPCCTqQB75fU6qhfT
         C0NonA4+XXkUDViztNqaP99fU47krqxkSzXMzA1SSa0EaMNvyFS6p9LhswdltpIhYtB6
         XeztW1rULSm8vtXqyba+RpwTgAg0FFsYBNmWYY/JZmyYZpbw143axcbMBcs0SxC5zGK3
         Bh/IKduWLFk0nZqSfGAnnwJJux+AsoSXeo3fmcfK3+xjHtVjlkaNFz5ovu/5tqhmUZZF
         H5qL/YubPegXtw6JT0M1hKablbYVLi0L49OZoyotzykHcpCiM+M6WkOf+WKzpN06Dxuc
         g+ag==
X-Forwarded-Encrypted: i=1; AJvYcCWp6iA4JpBB5OCHsW8/Fv7QR4iXYZMmNTwAeuRTw9JqgIvNbRk/LT+jpb/KqGUz37eCZamjzKQt1Ky6cdvSXKDr@lists.infradead.org
X-Gm-Message-State: AOJu0YxiDZHXi9XRpF4Zwj4gdXVojtKlSBL10tcCj7VMeFtXZx5lyXKs
	lTCwKBXy29EIcXeZ5IqWwt5f+/bnw4lr1t9OOZR+MDnMF5era1nfxEjnWOxkLmG1JuU=
X-Gm-Gg: ATEYQzxuf2kIAsy8JincKaA5lPpnazqqQ8Hbt4SsnTou+6kZiKdDhwP6aZ9SRkChdY9
	R+hm64n89ZVOJCArSkKPoqBqTK/vJH/1wxjstdmhcDHpObJJkEq6+Ii7GrBGKjgBIxj9VZUouth
	U5llyT5NmQYWdcizgowjEn2+oh15d+SRjnwp6xSqCbLF0T+EMwowHnmxQ0eLir1z+5T9y0mkmZK
	JTBXKQTL8yyWA7wJAZWc2Q/haQgmhvNewu80litBu4DDuDZXJ1cv4gJNGk4Xmeiv/gUFMn4ispt
	l86tnv7b+pvs5ixiSZwMGFqJH5Dm4AUKkkvFIkaIkyz6gUJovIKQx1+viN5wyXlwDv8YB+45EHI
	arYuRLAgdS3u8ghUZV85QpRU3nBM4w5f5S3aRttXE+WzxJ/MxAvNgZNS/0Uz+9FZjTHvfONVvBR
	tu1ihwPYsRAS/lYHofAfGoyZhTp9m73w5hCnH4XjXMmzfXpfK9l3yqzp0rH60Pz/z9dyV+8/Q7S
	mmqQGu+28PnGgApxc7PHigKhMPb8wo0IXl03xukj0g=
X-Received: by 2002:a05:600c:c8c:b0:479:1348:c63e with SMTP id 5b1f17b1804b1-483c992e3a4mr192566935e9.9.1772450523941;
        Mon, 02 Mar 2026 03:22:03 -0800 (PST)
Received: from fedora (cpe-109-60-83-135.zg3.cable.xnet.hr. [109.60.83.135])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-483bfbb465bsm292493035e9.3.2026.03.02.03.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 03:22:03 -0800 (PST)
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
Subject: [PATCH v6 1/6] dt-bindings: serial: atmel,at91-usart: add microchip,lan9691-usart
Date: Mon,  2 Mar 2026 12:20:09 +0100
Message-ID: <20260302112153.464422-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302112153.464422-1-robert.marko@sartura.hr>
References: <20260302112153.464422-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_032206_124369_D6347168 
X-CRM114-Status: UNSURE (   8.66  )
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

Document Microchip LAN969x USART compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---
Changes in v5:
* Pick Reviewed-by from Claudiu

Changes in v3:
* Pick Acked-by from Conor

 Documentation/devicetree/bindings/serial/atmel,at91-usart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/atmel,at91-usart.yaml b/Documentation/devicetree/bindings/serial/atmel,at91-usart.yaml
index 087a8926f8b4..375cd50bc5cc 100644
--- a/Documentation/devicetree/bindings/serial/atmel,at91-usart.yaml
+++ b/Documentation/devicetree/bindings/serial/atmel,at91-usart.yaml
@@ -24,6 +24,7 @@ properties:
           - const: atmel,at91sam9260-usart
       - items:
           - enum:
+              - microchip,lan9691-usart
               - microchip,sam9x60-usart
               - microchip,sam9x7-usart
               - microchip,sama7d65-usart
-- 
2.53.0


