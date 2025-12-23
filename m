Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA11E6FE29
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 20:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qfMU7MT4/V4GUajmsYnn75DFErJTnupop06HbanZvHw=; b=jN93L+KSa0C739LZbzypYsAcGh
	t018yUzbRsaxASlW4b/dmvYqw4guNY41PdyhR1dfXdqPn4o5LEQvRX8HuMjL8TLpOwpuNrUBpLsOU
	X1r9/qafyorudiHdhG0kFKrImOIR4EPSZQz3zAOo8tXOOfhLLRM76LI5h5ydqopNtZMeuNH60Lmkz
	79JyhGZBKMd6pohAl4W1OVOACX/inrxXXmFQyvgljnAS+ywqrX5YM3k4KJU/S/VskF7OkJdIpy+yk
	ij6KKo3HENqSUwneWiInDRiV2Ma49TwcoGdgrOcK+5BMSvkM0LOzgXuX4qrSUtdYk8NZCAQR2qQX5
	3LSwVIMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY8tA-0000000G3iP-0oXj;
	Tue, 23 Dec 2025 20:21:48 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY8t6-0000000G3g9-3CQH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 20:21:47 +0000
Received: by mail-pf1-x443.google.com with SMTP id d2e1a72fcca58-7d26a7e5639so6113102b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 12:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1766521304; x=1767126104; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qfMU7MT4/V4GUajmsYnn75DFErJTnupop06HbanZvHw=;
        b=W9MorLwYkCMoigXlNmVR4CbR3ew/mJ9WW66sUN8g/hT4sCqGgUE0hgKmCjoi6LQMnX
         7lM99JIjwCs5vdmSZ2rgX3foEwj9XZ9YwkPDM+X9bbppuINElUz+t3p81AEAO/hexiLj
         VIrNnM2QYYKXdwm01zexG305vWNR/lJjMVjN+gpBwS/LRuGCPrG4L5L7CIZr3n4N+gan
         IGAmV7IFud8znu6Saaf0ISEIhTezgulehGX0QXx97KZYbuBYLrxsATkKPN3qXc3A5jJF
         cSrz5Lo4DfRwr3vaqWLZw8IivxU4LT3LtbLBc3dE4x9cnj5U2SofUHBEM4ew34qbcsjw
         hlWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766521304; x=1767126104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qfMU7MT4/V4GUajmsYnn75DFErJTnupop06HbanZvHw=;
        b=jY6lMYqAgUg5JmNyIOctvUb97aB0VRop8adogP53Psg+YpLfEw7q6bQjuMenNknFtu
         vYkAMaaxEOphMYLOa2+HG7kX0CUov39qrq+coETI006noYkb/X1GVipgraqp1g1qf54y
         +Q1fDBbsbJb0JBNmV4AS/Q/z0ApDIBwkGBgKwykljLGZ+38gA0SBVjLFPuEU1EXqmp/s
         D70YQaCL+F1kL9fd5spswVFLFH9bSsRzQD1xdfPmVdDAAotqQSK+HdnvDnBfzmaBY7RD
         E+M9MKMYSPVeJ73xbdbaxF7M01+U9ZH2YvUOBAmi/2SznmlnLTxmXHBV9MX+ESkhe06W
         Q5Tw==
X-Forwarded-Encrypted: i=1; AJvYcCUF5EC1+1j0P6/ZW0vBqOz5uSLQnqYDWDNj6/yitbCGxRXPkeRRbBs9xeqNe2q0x7hoYTghe9UVvJgWbSm9vApG@lists.infradead.org
X-Gm-Message-State: AOJu0YxTq7lLMLWXQSG5Bt+u6cAbWFh4Id2ocZiZM73KNDemlh3PTTok
	uQQqqYzNIYsLujn7vC6UArs4em7h72Rj/NGX/k+djme6BznR7b/I30ShH33FTY4atyM=
X-Gm-Gg: AY/fxX7CZjQcXcBempx4yYM2eFEh8uBXfJdPv7XyXdT2n3sHd0MuANW1Q6p70ZU1OmK
	Ie0JoCurYoI46obrshbUn7s8bsDIiwtWNaBv7kJ1bJ5lLVzVklq1qFpg7q+pBpuStfFTr/LX245
	fx97QMzlw6ij1a0bAqjBS9mIi8BqZKzGQF9TOF91+5xxRyEBL24cFKZpgmUe0SvIGqQb9IeEMqL
	azdELJ2NjPfUiqQyqn1Hrd53ZkzVXkHQs91ehNQS6BNOBNs/MaRjNM/KuPk83q0UdoNyaepQ2kq
	4q+xNKwh3zLVYWnbP6JrJJjIXIJHJ6T+wFx2ZKpbyHaSqX3TQyytBg9y+NhJj/JBsy3v3gNYh2u
	QgI9xMA/neWvNPDsI3krrtS012aq0tGe+lzaimqfGMmAEVYu0CzwS+KNRqZhtHIrAPFescHalNz
	amVVUGObcBBmxi0l68xVtyocQFSrPPrNm+BOgiYPlLvNa830jSflshxWNOAcs7Fdr3TZ03WUrT7
	MFeZNmZ
X-Google-Smtp-Source: AGHT+IFrLV1OA+vGIt1Qeh3SInjG9m4lWsVJ7UMsa9ff7itN29HXneV9Wlv0pR5HcnrOBgJnEjlG2A==
X-Received: by 2002:a05:6a20:9392:b0:364:14f3:22a7 with SMTP id adf61e73a8af0-376a9de5935mr12020799637.42.1766521304022;
        Tue, 23 Dec 2025 12:21:44 -0800 (PST)
Received: from fedora (dh207-15-53.xnet.hr. [88.207.15.53])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c1e7cbfa619sm12567549a12.36.2025.12.23.12.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:21:43 -0800 (PST)
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
Subject: [PATCH v3 14/15] dt-bindings: arm: AT91: document EV23X71A board
Date: Tue, 23 Dec 2025 21:16:25 +0100
Message-ID: <20251223201921.1332786-15-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251223201921.1332786-1-robert.marko@sartura.hr>
References: <20251223201921.1332786-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_122144_811110_6BF8AE82 
X-CRM114-Status: UNSURE (   8.06  )
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
---
 Documentation/devicetree/bindings/arm/atmel-at91.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.yaml b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
index 3a34b7a2e8d4..b0065e2f3713 100644
--- a/Documentation/devicetree/bindings/arm/atmel-at91.yaml
+++ b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
@@ -241,6 +241,12 @@ properties:
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
2.52.0


