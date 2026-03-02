Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9733E9B365
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 11:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ESgBMDji8rov6yYhnHGaS+/+l3/SjDdxdOhefVJEU4=; b=yMTQhXeBBF+DIKIntI7+cwq0YW
	qCY1t42exytq2PZC6zXsuzAN3jQq9sghHxvuVIvOZyO+P03fBtcWwt+6u6J9gIlmSPtSJszLIENGZ
	UZCslykUPx/pPH7lR8N0ohFtyys1Gh/6V7rHPDWy9A5HEJXiDFoCjsoaTNygek+s78VFO8O3h11rj
	5jOlssKgTMDI7sThFbIRFXelp+d+ydiJJ0HE5XcIx2lGgouKGtjGjJ71lBUsTGXGd+ZY9S3wGQauj
	CNZz4MWn+s9tiYxQjVwuAKO3xhMZ9hq2iaTiYKt5r5VNHiUknYETcdpj9YXeq6hzUpgJX39JhH9O9
	zqZcXWug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1Lr-0000000CoCD-2sY0;
	Mon, 02 Mar 2026 11:22:15 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1Lo-0000000Co8J-3uWm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 11:22:14 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4836f4cbe0bso36591895e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 03:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1772450531; x=1773055331; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ESgBMDji8rov6yYhnHGaS+/+l3/SjDdxdOhefVJEU4=;
        b=D4jkriEBf7AXpja/tXbroQnCoWV3qsA+mHEZ5y7Y4EOUeKu9i5Z6O01gLPoBp4SWWo
         g5t7ygCs656UtYFgzxsnXU7WnY22pKR+M1U2r6Hj38V034H7mlqDdn74McZ2IndeR7WJ
         3MOZBSqeg8V0/DfMe0UOYGicuFrcc7yVIqxzf1a2ZtHd9b5RmHJ1wxDYyTIa2aNKpztW
         JU7id0ETxISpCqZO005BvQ3bW6Xx3Yws9hm7OIQ896RKwLilxRwNFyhrEXUJRgPx+hQE
         jC9PDDWggsv5s1Gvj/uVBiJMHxVrddlvF4UlGCB73gQBHfLgwzO2tobMO6CUnmbrpvXP
         B55Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772450531; x=1773055331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9ESgBMDji8rov6yYhnHGaS+/+l3/SjDdxdOhefVJEU4=;
        b=avAOOWzpml5SNNcxyv+Fjle4Ofv51P2FQwIJLwfYB0kGMGfH1gkHD3COYWRjBDVDsR
         CXt5a56e2Ol8SiA/a2wxDuYZdAK44mwcyv3iHw7zPhqTCwoSMTepn+02CfQCxpCSU0ce
         tljQWWtJ8f6mSm9IL0kYLxwYE5JHkYeU5gcdvzZpHuC0A0c1Vmxp1Fh/mlXLYt8QGc+x
         XclOy3yUgf+PsLS+IlfpDY4pCELY+Nw7F8Dvf49qcgIU0nLtQbtug4FGXN7GdHRlp0ye
         Citc8ho7hkOX4FObuk6u8qT3RBaTJuZ4f8MVHpTM3IU/Bn1ZMTO2UKuaRV6WdzP13bNl
         Tfmw==
X-Forwarded-Encrypted: i=1; AJvYcCV6s45VqfV32lZtCNRWs4FDBVG+qyNW+QCFIJnw3O73vzZ/aAfu1Ns+M+KmkyxvEG0vGOvE/DFbXnCSe0zglzR2@lists.infradead.org
X-Gm-Message-State: AOJu0YwatIDyUEPv0k69XRmpLmaIVM+BSHEC8N4ddHUjO7xEvgTzZADi
	s9DaqZozjPzE9XoK+QAdmvT41qNaUtGwu6du2NYlPDvRkMqvKmYcqwfVzsMhCivFOHc=
X-Gm-Gg: ATEYQzxu+WZ1roGwwjXnr2nFsajWOfjVUEst4wDewszmpR/nHNy/1cV5gPI+VYTxpPy
	btZAPdlDsycB7sFtY56a1CxQcMRiB8GQhZKG45UUVAufYMTTVGT7kLqGmyiUT/77VsCN11bvxZg
	hsqmwWweVTbIPz6k877gL9oic/EOlpXHOFqw4oc7ZEWE7+zq/vTkXRHy1v4f9PvuTdDOuL3Sg2d
	0YUxT7dDf3u+/m73ge2wZvTyDTlPhXqbXSy8NELqkqMX9ucpK6T2gE4bhtm+EPB5WTMUULwp0ZD
	HUiDbfsap6+BkGke4RiGdA/EG2AJ597p/F0gRxoUeT3KERxupggGEzL1eSa7quVtG8vu6qORI70
	VzvocOmTTJN+tXn4M3napjRJ2QM9HdUkHTK7gL8B/SEAEE1Fv46JKIz1pW3ild7DAXZU6HGqTZ5
	Qkqv952moZOf1jfGwpI0ybsgMl89iE3YC1oJQicCGEHbP9QtlCFbNzClESUU+RwO3s/yo4sGvm/
	QGpbSH0owJxv4luTjSmwPoCTvZ5iaDPPZIlF7yajuI=
X-Received: by 2002:a05:600c:4fc8:b0:47b:e2a9:2bd7 with SMTP id 5b1f17b1804b1-483c9beaca0mr247748075e9.19.1772450530729;
        Mon, 02 Mar 2026 03:22:10 -0800 (PST)
Received: from fedora (cpe-109-60-83-135.zg3.cable.xnet.hr. [109.60.83.135])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-483bfbb465bsm292493035e9.3.2026.03.02.03.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 03:22:10 -0800 (PST)
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
Subject: [PATCH v6 5/6] dt-bindings: arm: AT91: document EV23X71A board
Date: Mon,  2 Mar 2026 12:20:13 +0100
Message-ID: <20260302112153.464422-6-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302112153.464422-1-robert.marko@sartura.hr>
References: <20260302112153.464422-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_032212_998659_D2FAFEEA 
X-CRM114-Status: UNSURE (   8.48  )
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

Microchip EV23X71A board is an LAN9696 based evaluation board.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---
Changes in v5:
* Pick Acked-by from Conor
* Pick Reviewed-by from Claudiu

 Documentation/devicetree/bindings/arm/atmel-at91.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.yaml b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
index 68d306d17c2a..bf161e0950ea 100644
--- a/Documentation/devicetree/bindings/arm/atmel-at91.yaml
+++ b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
@@ -243,6 +243,12 @@ properties:
           - const: microchip,lan9668
           - const: microchip,lan966
 
+      - description: Microchip LAN9696 EV23X71A Evaluation Board
+        items:
+          - const: microchip,ev23x71a
+          - const: microchip,lan9696
+          - const: microchip,lan9691
+
       - description: Kontron KSwitch D10 MMT series
         items:
           - enum:
-- 
2.53.0


