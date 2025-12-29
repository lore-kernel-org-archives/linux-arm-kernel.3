Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1ACEE92FD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 18:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XldW6lxnsgyAezmPBHgoeGUpbHtzZudWE9rMzsQl4gQ=; b=w5ZsE2iNFuA0eUaNXZI0dVEM+t
	tl0DOHDVkw8ytk0ADtwO7vQYyWS+7r3ozTyorUtscy/N/jNXujh5DkcXXSIgQMXE8buwLNr3Fp74Y
	8gCVr7egYN4i06+k3u3QUW/91h5N4IMkqD5zXk7D7wNpNv3PmE1sTBnwqRh0GbOqBz9drKg+SRU9L
	XNaE/W6tZyhOzq9zJ8a4KXbv0KsOde6P7MsJlnJk0Z9oDWVbTrQGK48uGSGY201S8nWqtxWC6nQlh
	csBRNxiLMUAHUYAz6YvMgBLk4ul2tZVOYVDTEYwTfQNWqoHizRhTw4/KEfZifWJSEurLcFPaI2/Hd
	zW4D9Qog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaIAX-00000003xcD-0vBd;
	Mon, 29 Dec 2025 18:40:37 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaIAO-00000003xWV-2bAV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 18:40:29 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-47d3ffb0f44so22430855e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Dec 2025 10:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1767033627; x=1767638427; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XldW6lxnsgyAezmPBHgoeGUpbHtzZudWE9rMzsQl4gQ=;
        b=EKVAYtsfZkVxf17dDEoLwsYO2TiLeE0hwMcTu033DW9Y7CxGFw5UMV9IMOucBIGnMI
         65BPkq5oBi3kQpsAcJi0aKDOwGC+3tiNzJUHyPwZILwOdM1/7+yA54dWvcaRD5vYRcge
         wknM8inYEynpzHSjmnYGyGB6rNH7r07U7QWrb+KmHKJMSDm3yZS5PCm7NCnK/9YCqKLp
         zAKgidjVF0Jm9HH3IqOeludcM4J5Bbxy+gNUenq4aeKy3BadlXEp71ZuteYF+U1bGIzq
         KZ7XMA335ZBvUiAHzS7s1ZKwGkqBg2YAgNwYjkie01n7jvyOx4ZrX6SF6gCKrgGvSYKC
         7TRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767033627; x=1767638427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XldW6lxnsgyAezmPBHgoeGUpbHtzZudWE9rMzsQl4gQ=;
        b=RTi7vvGkB5pnmWx+glLUME+8Zkfpwu88tzTdbti/it3yTkcDxYwZfEoW0xaSu25WZO
         X8SQmhtapLOqKqcIVp9Uh6/V3xvT7BUdzBeilZ1goZN50vkcGHFT04fQBPUYG/+w4wt1
         rmOIaVoJasPMILUvVHVzPEtwDPy1Plc3Wm33eCaSyhiNOX6R6SPcRtKfM5VWgrLWWkpO
         vfnEYle2c4aOnN8AKRiscRG4JzYr7a7knC2FDyqlKs3Ht9bh24fumq0U7d40Cl1F675A
         oyAK58TGTNAVPdhGQeuBl5Cjnp/fJ3fIm8Mo/Msf8Yh1aVPaoLUmrK4vnhnXcmv8reKX
         Ct3A==
X-Forwarded-Encrypted: i=1; AJvYcCWxt/0FxVMdlTPO1aCZubpNcpjB4Y/A0CDsje+kHA7z0uis5n/LZj495glY7abOxL7hpiYNg5lgNJgRq8Sy9ot8@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0ezb82k4qYi7ocG9Wuy9p4ZyN2bj1JiQIOdzlkjbcHRbbthSh
	6nS8Er4TyxNIThKcZtTcD3gn6qCacRfCGw4mhIgyEKejBQHNF0v5IZstuNAbEAQOaC0=
X-Gm-Gg: AY/fxX6v0wq2ik2Pi4TQ2xnjCXJWQBRNv41J9AQ03oo5xbbjIMiqyVzGTxdfuTE+sdt
	mx9u8Q2d6wPKRcdDNo0gF6FbAz8KDFP3qBHHNlVyoQTvWieDAYqxYtUAtRMG5S4IAEtwDteukz5
	2PgWmyBs0Z74xEqsopQMh3AbFffqX1NFXcQkMxqne31mDJOYqAz6cA97djYduFHVcZBS9J1wDlA
	JZxdoUJlqWM+V4YAmUfRYyR1rGnQY2YWrKIKGfJmhMN+vkTaO/b97dcHpvxV876hKyEQlQs7+B3
	HjxJLDCMj/k3RySmMebQ/n26LW+0A5CpCWmiHXe3eaXpmQI76HkG8cP3n+Kvr/2LWuiZKDBmQSb
	Mf8EGyilYyFmjeVehHH4idntsyMESSz1JeBjKzrgsZiNsmpOcdmvhGVfNacQYJcXFhqH3hMGWH2
	ti1L6Sg0AU+zdz6je1/ruO4Jkkksi8rJbJDPODBzCEPaHcHtl/5fPFxzJfRtEh7uZqLm4hN0fgY
	Rr4yul/ZVP03110o4qORXNEhjBC
X-Google-Smtp-Source: AGHT+IHcFjQCCkIHzURsiMd4ZffbXQCjBanKlfgaAMAIAjZSkOlosZ6OaPn7ElCbfUOqooZC1IjlJA==
X-Received: by 2002:a05:600d:108:20b0:477:9986:5e6b with SMTP id 5b1f17b1804b1-47d1c038664mr255230805e9.28.1767033626661;
        Mon, 29 Dec 2025 10:40:26 -0800 (PST)
Received: from fedora (cpezg-94-253-146-116-cbl.xnet.hr. [94.253.146.116])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47be27b28a7sm604907455e9.12.2025.12.29.10.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 10:40:26 -0800 (PST)
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
Subject: [PATCH v4 07/15] dt-bindings: crypto: atmel,at91sam9g46-aes: add microchip,lan9691-aes
Date: Mon, 29 Dec 2025 19:37:48 +0100
Message-ID: <20251229184004.571837-8-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229184004.571837-1-robert.marko@sartura.hr>
References: <20251229184004.571837-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_104028_667472_135AFBDB 
X-CRM114-Status: UNSURE (   8.45  )
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
---
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


