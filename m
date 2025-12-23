Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B37B7E6FE29
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 20:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m2FSF4N3N2MYzlByPoECc2cAz8v8tXyMKGpnQtUm3aY=; b=c1ZwZp6gI2R1W+jYCNTeXH9CtA
	cwKbSnGQBSTMWqMJFu3pjRNnYNhed+JxynuW5IYD7766jMcYS4COAo8ptjOT53ITh3fBhH/2ZgCsD
	kSVbv9i/NmSFnR44/roJM4pHPSX0wQJug1oPTOovPQzJg/CpsTnHefiXP39MFUCZnj+aAk/9xvukW
	Iqc130GkCi/b1AIJ+imrLr5KO7fAa2F0+4DL9rSuadoYNZ08j0C6kwH50ql273mPPDZhDl0F4ad/N
	OvYpQQLc76XHPJO5mA+QqSNdmJVMynCpq6M4tmK6oVj/cdljLOOO3PnbxvzWBvwZUVXiYKR1Vn3Io
	jH6ztW9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY8rh-0000000G2iL-1TLb;
	Tue, 23 Dec 2025 20:20:17 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY8rf-0000000G2hG-1frr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 20:20:16 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7aa9be9f03aso4489484b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 12:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1766521215; x=1767126015; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m2FSF4N3N2MYzlByPoECc2cAz8v8tXyMKGpnQtUm3aY=;
        b=wexWc97NPQN8XuqT5umpFGAaLpKFr+hcBcuzaRHY4LMiyRSVxwkH6c0K7x2lwsbKYW
         leyu1XlmXAhVSL3jiLS8cNk7hqbMvPd21YJTgUCYGdwqy11oz+b9D8YpXEUFhyepRDXP
         sy1Bu/F4KFbXMk2ZGPVH6LpiyjREo0gP9XXUh6eqDP1kLq9mI6eQNYzLDS+ZOExBbtFm
         95ll6u1gLIi55lCWRXVPhqiBpeUYpDWAEt8BKq7P1Cieqh2RBj1GH3s4aovE6UTf7R1+
         SDQGfOoHOu81b5Fvy6Gr7mXWOexJ0fd+hwRzgz379S5BYHDxP9apUuRqd0RsOovqZ5Nx
         PNKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766521215; x=1767126015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m2FSF4N3N2MYzlByPoECc2cAz8v8tXyMKGpnQtUm3aY=;
        b=HdprClbT2QZAHcXBbzBoaOaphmpUiQOrtHHvyoWz8C1qNWAZ39AHLEoFgBzr7M3sHl
         QxH5Mp34/c2GN5FZX/m+/vim8+mYWDyZdRblKLAvDoiKz0ZxSaIrkR8PhBCU3tSB7fB5
         sdTF6mEW/wScIxBmyWolpcj23FXiVUK5achgsJjNvFXM3NdFcrDrCMc/S8xM5KQ3woLJ
         AcGF8bxHiqkX9iMtf/ry0zfuyUOGFrERZ9zdClcSN3r4vh6MMhP2FhVfa8PKo7nyOh3u
         fZYss3zPkbIdHfJ/heOyYG7MxwD0R6ROjt9mGAQSCT5qCLBykLmMOrndBXaxBVzoZNFs
         i4HQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8egrAZ8iQ3ejRoTWUXwAI4j8N/HROm8GYjwfhHfM2rtkrody8TJV6Joz11ob43Mdi7GXpGmLI+S7HhhU8oT1H@lists.infradead.org
X-Gm-Message-State: AOJu0Ywc3WzKjBU5XTLUQCoZuP9clzdUvfPOSBHvH1I6FvPEvoYSxKjt
	rhMaXkBTOouE9L+kRXFkzqTdO+oWpyH7VrDKcatcM7W/eMJXAsp5ike41JeY3wpRvDc=
X-Gm-Gg: AY/fxX5jEV4nZKa3ccrMrFI0XI60NLe1VAUJRjaXxTTOh5r6w8GAnjpIZvrvHiUIc2v
	uvmgyiRPyzf9chE7BHrAzfNDIq4pDCuzU+fi1mG5pmMCZneRPcFBfDK2OOXPJ3Cajnr7cCyGQPr
	BYQONVvI3aYtXoAi+913e0WV4qaZZ5/uzzseV+Lx1GaLoRdda1LPsulmE+YyNFJIB+fyuDvGMPZ
	LNEdCFlJOUsjOG+N0OJvdC0rCbsJjpNqaZ3Ke5FWStER7sfvaxcVbSON3Bvfy/tI5OX+VznVYEz
	1KVX8yu4vHXKMw+IGsuLOFzl9utdE8st1kwPPxFPBmvM/qv0MM41FxBawsiSgcxuI19VyrbxG/H
	zEquAYjSLaofEukxIrwjzFhHfJ80WvuoZmqSVs8AhIzp9zsJZ/hN/rNI9f2O8TeYqupglqfgBGf
	LFvQ5PUWSR1Pvw5W5x8E56HozqeXZ9UJpXEWashK/bFipdrox6BmSyALJ9P7hHQYi7aIrAJj1RV
	wVGfd0B
X-Google-Smtp-Source: AGHT+IHTipKQ2GYkfIzCrgEkT5HgaT5cetpxH7RTkCWDpkBy3UcCKVeG1Kf0FvBM/eI9Sln/VDayPg==
X-Received: by 2002:a05:6a20:9149:b0:347:67b8:731e with SMTP id adf61e73a8af0-376a77f12e8mr16762772637.14.1766521214766;
        Tue, 23 Dec 2025 12:20:14 -0800 (PST)
Received: from fedora (dh207-15-53.xnet.hr. [88.207.15.53])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c1e7cbfa619sm12567549a12.36.2025.12.23.12.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:20:14 -0800 (PST)
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
	Robert Marko <robert.marko@sartura.hr>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 04/15] dt-bindings: serial: atmel,at91-usart: add microchip,lan9691-usart
Date: Tue, 23 Dec 2025 21:16:15 +0100
Message-ID: <20251223201921.1332786-5-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251223201921.1332786-1-robert.marko@sartura.hr>
References: <20251223201921.1332786-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_122015_442063_E246B9BB 
X-CRM114-Status: UNSURE (   8.29  )
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
---
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
2.52.0


