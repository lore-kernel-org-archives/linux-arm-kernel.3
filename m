Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 289C2CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 17:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8pS0Ld9uzavm9qCIn3zeBESeNJisq4fm3wOJuKswJN0=; b=vSw88hk7ibNTVz3js/fcccGU8o
	iHsA7K/i4Z85kJidsr66rF+Op89Yr28bWEktbwU/KeADaIHIfdKr7j7KHJc+Ws8z9lmfGo0O5m4FU
	IkgF7nMN6tmxNW94NgHtPDdqQS8AakNQL6Poa4Yx6JYHku6NVJfG2Euzl/t2WkIQLKXCJrlp4SUZg
	G6hTU9ksQw9XtXvFAwNgl//qxxh/ASdT/7RJ37+zRFf1ddDMjxvtvG1PVqfpwU6BeX0Qdtj06zjLQ
	ZjpxLbWuFlFIw0cBrqYpE9YUf2QcxV0IrAhxzqa6G8iZsyFESkXdBsvQPKJHrHzM71Ye8Lb43g3Eo
	ACkOVXJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMrFe-0000000006O-2Rtm;
	Tue, 12 May 2026 17:50:38 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMrFb-0000000005M-3obw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 17:50:37 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-8353fd1cb5fso2869872b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 10:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778608235; x=1779213035; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8pS0Ld9uzavm9qCIn3zeBESeNJisq4fm3wOJuKswJN0=;
        b=osvLqbmGdA3yZYlDiTOo3X6ARN1F5ev1Ee8y0oRUpq/bUZGvrJjRD/QBlWEPMhOj/D
         Foiyj4MY2rTK9+UFFSgxoaxRPnJSGlpGj5gjU79kY+R4xtor1K0JdMmx5w+8/xXsWm1F
         m1kvqL8fxThZ90+NDsb3ZwbCdXhc5eJIJdJLJ6og6JqqKL11DDgh6Gum5kZzB1spD7bS
         2hsoyCqwKie3ms00Z0xxlKzfYI0C3FSwI0IQNcAFxJG1ldC3i/3vagCBWUWP1P8mqGNq
         tc2E3u+Zu8yzyH1T0bhqqzpAzgYiKVpDOGgIep8STmBAbN7bE50+FsupCzKXammvrEp3
         rJkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778608235; x=1779213035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8pS0Ld9uzavm9qCIn3zeBESeNJisq4fm3wOJuKswJN0=;
        b=DxC699UDrkCG02dT9lC4xZWiTboLJASpypA7NOKVfsl/dACxduwkcBzHVQlBF0eBbB
         Odsxm0gqY9HOj0aRlOQlRnTU2x3DbgwcNBDeYl5bCUCOOCnDtHsHGcasYh3LSJzYbKMw
         oAiT9nUVLNxmt3RYFcPj1PD2d8sNIeX1H90rZaGvNDb+25Q84QLllHNPzqzl9iWKGUYi
         dH8muVKcRaTntevPeYXBaLAxHSw+bvT1h6ggrXVZcXe1L85OH+0fObfroFyzJoLhjgct
         T25wkxpHXkfi9znfghMlI80zlPjOHFn3GvEWyhBkGa748OGray3OWTvSENQv0As2E8vG
         JYCw==
X-Forwarded-Encrypted: i=1; AFNElJ+bLjoxB8kBDSssPxyue9l0QBJn01vbc6XcXGBwXgwbDZiZY1YPXBQtSJRJdJzzOVw6V78XydyDTOvWSunoewNq@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6CckejKYXxmwB8Y1CxwvQsTdbkYZjAw1zNlk3QORVdrIT2Fx2
	d/AgM2YFcD5D1lEmQbwSuU4hRCWTUNzwLKTZG1qKP2/DimPJYoNb2UON
X-Gm-Gg: Acq92OGev0UieZD6GyUlD+7NKkkxC8SnWMxu48ClVBV57h5V2FxoBpwvWT1fyF3PET1
	54kpGGYU0G4uB3M3T+i+DKCc/RspZiQbH/Vuw73W5f5pat+oPtBLZSn17T/1ime/0fWiYzIqpyS
	xii6KiVPaefE/dLZVR+BycnmnHkp+Mtfn0sT8RPtuANGOCagZppF+FWREmMqvWFZW23kMsIzf+X
	CGADO6lkBR/12VrwpHv5ZQMUAQmlIxhU/vNCnxavLTI297xn0/oReFomyTXvH4iPg2zdJD/87Wy
	ackTumdE8pBKn5q8eCbEz0bVM0VEvuI6YnVnObDp7uFfw+4lNqBBfNSqaAsdbclP6tpfSmiFq8x
	GV3sgpni1U7eM2os8IgR8V5PEur0p0xNAcQxFXesjuPC0wmWiGXorzclUa0csguPPcRz7lXOGZw
	yyY+36Ey4yJb0ppkGp34U4d/GNaX9nO6rtyox9mC47
X-Received: by 2002:a05:6a00:4206:b0:81f:4e1c:1d3b with SMTP id d2e1a72fcca58-83f02e579admr34477b3a.23.1778608235020;
        Tue, 12 May 2026 10:50:35 -0700 (PDT)
Received: from debian.prasanth ([103.177.82.138])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839682a20ebsm24838732b3a.53.2026.05.12.10.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 10:50:34 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH 1/2] dt-bindings: arm: aspeed: Add ASRock Rack B650D4U
Date: Tue, 12 May 2026 23:20:18 +0530
Message-ID: <20260512175019.47548-2-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260512175019.47548-1-prasanth.padarthi10@gmail.com>
References: <20260512175019.47548-1-prasanth.padarthi10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_105035_951159_F6021643 
X-CRM114-Status: UNSURE (   9.50  )
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

Add the compatible string for the ASRock Rack B650D4U BMC,
which is an AST2600-based server motherboard.

Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 2f92b8ab0..656397850 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -77,6 +77,7 @@ properties:
               - ampere,mtmitchell-bmc
               - aspeed,ast2600-evb
               - aspeed,ast2600-evb-a1
+              - asrock,b650d4u-bmc
               - asus,x4tf-bmc
               - facebook,bletchley-bmc
               - facebook,catalina-bmc
-- 
2.47.3


