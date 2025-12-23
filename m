Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB026E6FE29
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 20:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZY5t/vT8/2JoNFBpsoZEjWJnrTyKVma3HFBR0NVkIKs=; b=sk9FWAt49bFwI9UKXiY3CUx4vQ
	Evk4MiBy27xaEno14ifpJK9uyuKbJufU3il+QItpNiQDn/fS/3Cpk9LW+zfVd+KeLWG3x0V8Y3G7z
	UQIyvhWCS+b3cX4Ua0U8fazvg0svMGaOcRAn6DA0Vxt+DQNtqzTGu/b5SK10Q5ECT33cbPhbRZWuf
	Dg1Lw0XWj5gRLiOHdQWhUVDovT/Z9i7eKetkbM/0d+dYNL+LZlk+Ixj0sTtFR9HIIw3H3+X92XL7J
	C4Ok8ESu81mu6EPTKYsRHI4LTOOXW584Ae5Yvd9IGpg5amjILA+/QjvPKuLvOElJBHohl5PTXS58n
	y4RwNToA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY8sh-0000000G3Ni-0WfE;
	Tue, 23 Dec 2025 20:21:19 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY8sX-0000000G3FN-32M1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 20:21:17 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2a0d0788adaso48071615ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 12:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1766521269; x=1767126069; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZY5t/vT8/2JoNFBpsoZEjWJnrTyKVma3HFBR0NVkIKs=;
        b=R8IQSQS4Rj5MWcXdzRWbmxziATmMPOQ/wNIc4omY7g6DZhOq8ShkqgYx0CKU6aU2Zm
         2DjL86zZqv3q2jD8kwgH5Yh3iTsRpNeybKzLDL+uzSGSV+MpOI7LzVzoGN9WNcpO9gFq
         66dAYV8oUadpguKmP3+NLTaJuL2WmsRYirjhQqoVepW8pny+hHL0chowkSSp/Cccpmt0
         hsFFDR+cdNSaI+Hj7Inr11/Unzdbsyv5oDOhPz03NpGIfx8ItCkIIZhUwsutqmceLAGN
         i5/uRQk5v0rb0FBM8o/mpv/ECf62BJTb4Veq/s7FKtRyVzrU/kiLi7n77rbcgbXVUk88
         0MsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766521269; x=1767126069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZY5t/vT8/2JoNFBpsoZEjWJnrTyKVma3HFBR0NVkIKs=;
        b=dcfP+/gZOoLElPOP3rRaRdW9oCLP+shGolrfDG0eaSvarmTx4y/F4DJUWiD9+q95ZU
         Hx0ztXlZzSBvkE/hfR/JKe66mSJwrRKT2uehemezNUiFi3VMXyVSXLzo/pz8z6HhL8Ce
         +hExJ8+TxU/jakM/HTvefQXuI1+k2DhTTlfk1WqLbWl9foP/sXg3dgbuj7fRSBrYK+gs
         9sIXD7fjaQPdJ+rdef080I3GY7Iz/CYTKjUmDzdWvuhNxnbZRFNaHI5yThqkRqcUCZg+
         ZkAZTFy7fvj9sT8xgXcBGtgZv1TQtr8mkfRaFLezGI6pwjqWXKwG5YqVkz4SRgkecMSH
         CFNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbcfy+vLnTGmk6D+o2+moswxX/P9HN+l6QOV8mrYfA8u6AwvwfH0IkoSpkm1zb+RFllC5JEJqT3xNXqhGsUgOw@lists.infradead.org
X-Gm-Message-State: AOJu0YwotNboDxN3g6KYRbdDnOxpCMohbqX07Akdz8S4/d/Jf7G9POpT
	hgZ/Zk98MTzm8byJTgU+HL61Ka7BhxXEqh3wuF7dqopVkQhxQmdPoiTkVGeih6oXUxU=
X-Gm-Gg: AY/fxX7YV4czOOFkJjNIqc2sV5SCNSRTgATE2dtqhIyRSr6GWdwnVQ2c12b/vNbV9Ci
	kUK6IfvyWXWyW+aDICAz7+wCenmiO8jaOFXdLEQZdY2gypXoPARzx9FISrhjAsL8nRhs7DP2et9
	bu8yd0Hh/3H0w2NA5iCc23JtsGuhg48ohvGD7t4uVdvOvjNyCi/8h9lZcfWprGDvx+46k+CObWJ
	ADcU3KNtbpFPZVrqnEwQt/Q5PXQsfzjMt/aktTe+JKYIc2hWBc3biBH93iDIyN4JKl3FsPh3UHC
	T0gm3MBe30mnaQ8fEK/JwEo7VA3Z/yVOtjyeRzPy4cTkjYodIyHfRp6HvfD42cYQtBd5NdBOlNf
	cB3l1K8bsXKdunFb9g+L5h/Gytt+HHRurCz5FJl1f3wpUxcW4ZW5ADjb5htiDQKkF2CbevNxxXM
	RO2mXACWzPzbznGbF35P7JQeHXGgPVZnTvfyk14m8LenLRbKdn3BvZhxM5XrRjECUdcB905Ieyl
	QA0xth95DtE8iZIGgY=
X-Google-Smtp-Source: AGHT+IG1vVzPBAn5k790jfykavL0vRFl8+h9Eo75I4DE3aZwMJ8QtXRL/RgKMb5SBrHdzfjqO29A2w==
X-Received: by 2002:a17:902:ccc4:b0:2a2:f0cb:dfa2 with SMTP id d9443c01a7336-2a2f222a763mr171273565ad.13.1766521268730;
        Tue, 23 Dec 2025 12:21:08 -0800 (PST)
Received: from fedora (dh207-15-53.xnet.hr. [88.207.15.53])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c1e7cbfa619sm12567549a12.36.2025.12.23.12.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:21:08 -0800 (PST)
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
	mturquette@baylibre.com,
	sboyd@kernel.org,
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
	linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v3 10/15] dt-bindings: dma: atmel: add microchip,lan9691-dma
Date: Tue, 23 Dec 2025 21:16:21 +0100
Message-ID: <20251223201921.1332786-11-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251223201921.1332786-1-robert.marko@sartura.hr>
References: <20251223201921.1332786-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_122109_832654_791FFDBA 
X-CRM114-Status: GOOD (  10.12  )
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

Document Microchip LAN969x DMA compatible which is compatible to SAMA7G5.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v3:
* Merged with microchip,sama7d65-dma since that also falls back to
microchip,sama7g5-dma

 Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml b/Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml
index 73fc13b902b3..197efb19b07a 100644
--- a/Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml
@@ -33,7 +33,9 @@ properties:
               - microchip,sam9x7-dma
           - const: atmel,sama5d4-dma
       - items:
-          - const: microchip,sama7d65-dma
+          - enum:
+              - microchip,lan9691-dma
+              - microchip,sama7d65-dma
           - const: microchip,sama7g5-dma
 
   "#dma-cells":
-- 
2.52.0


