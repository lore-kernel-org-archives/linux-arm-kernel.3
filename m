Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C03E92FD6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 18:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZY5t/vT8/2JoNFBpsoZEjWJnrTyKVma3HFBR0NVkIKs=; b=zXLpJu/2FjQJy+6TlfQ8u9zQXE
	w0fYZHJRT5etIGkkI6pMXT8XBBjUVNw8koHqTwSS+hPsPAgX367YgMX4Qcg7Z4hlyf98kkKb9re9N
	GHcknvnJBZim2nq8DG8W9PUzPsU8Aurd6cdyEfnRwbzryW5hO4jlSkkQK+v+kOM9Wve+WQayUmtBY
	N0f1YbQVd3VFPZbps24CGc3e8BYeOe5YarFrapFVgDf0+D/Uu8UwHVJ/EAVkjp/6hT5O3uHk5Mf2J
	cuTIk++IhSCRQ4JPLFwCl/kEXvlvDzVPm5vU16DYLXxCt1tXqqwi5MxMTDcOT22uKQdqGlbw8kLAd
	wus3Febw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaIAX-00000003xdR-3Sw1;
	Mon, 29 Dec 2025 18:40:37 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaIAS-00000003xY9-0sKX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 18:40:34 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-47774d3536dso74515585e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Dec 2025 10:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1767033630; x=1767638430; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZY5t/vT8/2JoNFBpsoZEjWJnrTyKVma3HFBR0NVkIKs=;
        b=UMBIkGHEezBoPmlzs63z8C+JlEOFMzNmHXMxb+PddBHsAG5IuHkkAyQx6wen8EYM1D
         TYIMizuxnWEkcaDWTXrpFw0d2gBaFYD+A0py/u7aiYPzzCcqTrlyRfIvQAMsxxzgYm11
         B4kRRGwSJpmh68SuFxT8oIMp3P6OzUP9s2i2CRxlpLGulEDF/c2jdBvartHGUSCLNJYZ
         u9PmkehrtRNBDdpI2RN9P/mBQ4mG8uXC0tQW0fgu8Y0qchgFFMS5M7reLziK9Ap8oHfn
         0JpO9FZo+XTEYTjgi/4sylKZkp/ZbkiXrjm43ciMYj/rTuPp2sw9kMXvpdPUV8uiBoSu
         qUgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767033630; x=1767638430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZY5t/vT8/2JoNFBpsoZEjWJnrTyKVma3HFBR0NVkIKs=;
        b=GnuDcnbuiGuzmTb/NX8OwQmZhH+TlSIw0h7KaecwfMUCKZoEtvbIFpOracdbuwFDtp
         wgfGL++zSJC/+f6GGC7qRCRd4hDATwBmPscqAu4fnEuGfMUW9A9ujEggp7H4gkS1wTs4
         VagKEiWZKEYkpwU7wVtUhUZ4zKVhxs9nh/rqNQ+RjFYtUdZR3Rxzcgnvnq7tkIgOur9Z
         syJ83ZsA0mESO6FvCZegz/TNNKroTzJUyrvuqRSb8JI/7repty07mxjnqrG3ozkNZ/EM
         +mv9qHkcRqAlbPGKNW1ubQEhkY8BgBSrNaVdyvZxADZH1mcDWW5xQrkphPOyj4UyqktY
         h7Lw==
X-Forwarded-Encrypted: i=1; AJvYcCVQKKCsiVsE0BFWgWy4Fnp+zPgUwsOv0kcXcScUpLplLP9nDOuZvYlX8J8gh9j2XiT6dPVMr0aBDBRXDfeN2DLd@lists.infradead.org
X-Gm-Message-State: AOJu0YzUuzvItYEcNputRr+rIMHmgFF6Ksf9XZbrJLTEa1WjoJg0HORl
	I/EPnXZ4coghYpviMvGjRVnXnFLd0Yvnd+xG4MXblFxwYay1G+fMj+7gCVPuKSQOOaQ=
X-Gm-Gg: AY/fxX4gr88FZ0Mmd6fJLAF7a9yxMhkDwwGjgM8MnA3m6TNcyVowpmZoGGx2h4TDWQn
	yARKPJ1ZDCRETdm8PhJ6IEo+RUDPYiKtbiNwYsVrOMxBd2Uv6JMNQkV5N+wJfL0AQrywCgVuV4a
	M5UnvRMIM5zIeGCDU0CQKQH+JHqGu7fJaTdc8PxhOm28XX0yQvrnERhC/FtFRTwSVvi06K1MzyN
	zCRxufx+vFGeuSu8uNNM1WDYmW08nZyOHdPaP50P3O7iVDUoFsLqzCwkToiCSWUcaQzuWTx2fTv
	T3UuHX21drP2yr6QxVFq8RC8svpl76aRS+QRgmQph6F3WVgUAtuQP+8z9EZzOhTR6WD+CBTDoS2
	9kASIXO/dSEX8WXfCjCv0nU6mRJLeNQ2y4epb+3HQjbN7L7wsTYxBNXMA8jhOTeBR6kQOp/6s7/
	2Ic9APD4JDf8IpiASKw0CShdJIevPa9GyjE46pe2QU5u7HmiSAbnBRdexTJXrXgQLr+0jUdA4RU
	V0FY87Y3BD+R6oARCVx9vAl43Q2
X-Google-Smtp-Source: AGHT+IHU5TUgf1GXiZLlNhFvhk9NZs5LXOVfATsL4H0x67DGWgTd0xHPjLFDLe/wLhfc9aOjmrDYdA==
X-Received: by 2002:a05:600c:8b11:b0:479:13e9:3d64 with SMTP id 5b1f17b1804b1-47d2d273999mr360424715e9.15.1767033630467;
        Mon, 29 Dec 2025 10:40:30 -0800 (PST)
Received: from fedora (cpezg-94-253-146-116-cbl.xnet.hr. [94.253.146.116])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47be27b28a7sm604907455e9.12.2025.12.29.10.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 10:40:30 -0800 (PST)
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
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v4 09/15] dt-bindings: dma: atmel: add microchip,lan9691-dma
Date: Mon, 29 Dec 2025 19:37:50 +0100
Message-ID: <20251229184004.571837-10-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229184004.571837-1-robert.marko@sartura.hr>
References: <20251229184004.571837-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_104032_255208_FC33CF81 
X-CRM114-Status: GOOD (  10.17  )
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


