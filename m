Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B73E92FC4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 18:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oSHOwUHbn+hH9B++ik+7Uc56KzBi+PoNlqJWxebInus=; b=4Rk1xseaA4a12Qh/5FLQYufgg+
	CQnqw68xO9oMSnxbj1h5OgIECkGe9yk01Dpb74MCWXk5is9y4o3MUtJgOdpvybdxsXSECYihnEYyW
	YpIurS26mLZMvCoesIBwL9g/DVd+FdSBNl9WK1lbgXflacFdWjHit/OgR/X7Biox0HEh5gHAtmNjp
	yXADGKdJt0li8mPcOgJmklt0Ol5cK36pBLGQfHQ83hRUYLbv+6IJcIAiPRjOqSPl/9h/y00UO4eUn
	yq94TWK8d9USC3eoPbNUZTiCo7TMnJGno/zDbwsAZL7/pfCgF/pyzz1AWZPkD3EZyLBghhEGMQ2iA
	vVGCNVgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaIAW-00000003xbA-2Xt1;
	Mon, 29 Dec 2025 18:40:36 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaIAK-00000003xV0-3KVt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 18:40:28 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-477563e28a3so57267135e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Dec 2025 10:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1767033623; x=1767638423; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oSHOwUHbn+hH9B++ik+7Uc56KzBi+PoNlqJWxebInus=;
        b=FKZvfjBHQRWZK/G4dKoq3Xpe8Xe7Bh+vWx9jX8HhLsWk2CByCqOw3diAXD2/nJpDl+
         wMDtlmIGaF62hJ99ZN1qxFRbhl0DJQKrrdwTbNLnpqglf7Hf2OJqGJLJlQeUKOlNb3Ki
         aqk7xh/rUvGCgDjSzvyECrtIC2FuslVO64Lr8o8kjAdpEpxr750/YV0bccjQB6rU0vsO
         nh+Cem6iKpsXVwU22ObWCzz9LCmM+EScbAurwcObthgYL+cuUMXjJLCzW22twkSSQF+P
         5IqxHkCPqujTAZtVssgw7pbtxBd9FdqaulQZ36Dp9rxXwjf+EKfeA9NjIQYmXIxFMRPS
         2FWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767033623; x=1767638423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oSHOwUHbn+hH9B++ik+7Uc56KzBi+PoNlqJWxebInus=;
        b=JJBRHaoUKXE8mFK+/REGO1+JwLkhJ1DX2mTREU8Onj7OmFL22UhcjMC51eapoGPRLI
         2U8PbfFvKLyGybWO9/m0n6WPWcoSVeDPVYgQHB3dYtr66YqaUVN66eaYJ7nG5DgyrvA/
         otS4SAIiiSCVjFP483R7wCg1RN2e8djxbS9qy2DcNbbg33C3Q6nPSrMyWkTYuycXiPHG
         mkDf0AKkAHwSLc2w9IGr5Ic9PnzzYaWVkBIq23EVfako/ccbFEkKzTD9Mqls41SN0JX6
         JTon4Tz6WDP4F3gwKZ8QUoG0YlE7d8/u3dn26ODvPN+qSdvD+qy+11QXWaNsDsiDtI1G
         fsZg==
X-Forwarded-Encrypted: i=1; AJvYcCUEYqqZO4oI2yoDCZNt7qZRUjpmtvW/98TSKhlgV9oYjuDEs4xRX+AnAdpinp7xpud29GnnIc/WqfZeLQF+WXRS@lists.infradead.org
X-Gm-Message-State: AOJu0YzqR8aTPcfHp7iUWAmqmOcjiGjFa1N1mCs1Fyxu709ulADszDS3
	4/wdULfBN7M2uSZSNognmNyFS2pf5Ag+uT/d0uX51rJo2CGew1a+r7vaMA+7mvbW97w=
X-Gm-Gg: AY/fxX5KecT8oJ4XunqfRoGky1nijYF5N7W5q4XGM2WKR1GrYmvNHYTyrrQNOkHEslE
	Paayfs627yF1XljlyYxC1B/wKPFudvWh458F2EKlFWqv+emytuZ1qaZH15yVnpATyWxk3xxQqfC
	UXmO5K9LQi3ILBvngb5cV2yWVQ4abzN8d5UmP0MLSXL9diky6Y1l+vFLKvfRDoBOWPO/NU1xFDf
	q2CosOyYDGkuiVoDCSrX4NGedbgAiSE15DcgXg9hj6XitlEbC41SSyofa5A4LhbiBLQZ7L7rf2N
	xlmuCQagoyE2uUy0bkXVw4L1qWKPutFYyHVdFN7bLcmnW88I4Em6jm682ZVa8ogCI3V+pQYp+IA
	/4/g4iINxH8KOfqFo8Z2j6ypGVr2mhuaSJhG7E2hXTGMYFA4XWDBwbZQhgGGHOHrPbbXwCiBDGW
	BpznEkxVGh3rMr6KU9eQWnRBhoUhHQ6NbuGFUTX+meYnMcgfGSz62KD7ruwRI090tcJ6rFJFBAi
	txcqCHKgjT50hynkcCo2Xg77ShHD5QJGK+jKws=
X-Google-Smtp-Source: AGHT+IFdXHJQRkzLbrbudz/rrSLgg0wPVHDz1vodIiRpC++haL2go1AcyrpRC3xryHs5U31bxn6MLw==
X-Received: by 2002:a05:600c:6749:b0:471:665:e688 with SMTP id 5b1f17b1804b1-47d18be89d5mr452022195e9.17.1767033622859;
        Mon, 29 Dec 2025 10:40:22 -0800 (PST)
Received: from fedora (cpezg-94-253-146-116-cbl.xnet.hr. [94.253.146.116])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47be27b28a7sm604907455e9.12.2025.12.29.10.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 10:40:22 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	vkoul@kernel.org,
	andi.shyti@kernel.org,
	lee@kernel.org,
	andrew+netdev@lunn.ch,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linusw@kernel.org,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	olivia@selenic.com,
	radu_nicolae.pirea@upb.ro,
	richard.genoud@bootlin.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	broonie@kernel.org,
	lars.povlsen@microchip.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 05/15] dt-bindings: i2c: atmel,at91sam: add microchip,lan9691-i2c
Date: Mon, 29 Dec 2025 19:37:46 +0100
Message-ID: <20251229184004.571837-6-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229184004.571837-1-robert.marko@sartura.hr>
References: <20251229184004.571837-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_104025_632609_354E5A28 
X-CRM114-Status: UNSURE (   8.54  )
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

Document Microchip LAN969x I2C compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Andi Shyti <andi.shyti@kernel.org>
---
Changes in v4:
* Pick Acked-by from Andi

Changes in v3:
* Pick Acked-by from Conor

 Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
index e61cdb5b16ef..c83674c3183b 100644
--- a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
@@ -26,6 +26,7 @@ properties:
               - microchip,sam9x60-i2c
       - items:
           - enum:
+              - microchip,lan9691-i2c
               - microchip,sama7d65-i2c
               - microchip,sama7g5-i2c
               - microchip,sam9x7-i2c
-- 
2.52.0


