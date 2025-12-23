Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6613E6FE29
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 20:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=akmDQhsi4smXKOu+AQ0134jZY6Y2uyR0jebUNjrF2nI=; b=Ur5a6EPYp85M09f/n6uQf2vSpe
	oL8Op9O+nQS6QY37f9NoLZQ6ahdB9tDO+t/avIyzrlNSfhOniN09IW3bXCD90Fw2x70KjZoRqNSyp
	tCGu0LsMwR5qNJRKPEkxGEAKXnDQuth/vJJXu/bM/YY59/rn9louFjwOMrEuNN7Bjw6K2YZFU1FSD
	4Q84e+nX22lg46+42WvUEbDsCi0TtfD0BZpLEEgFKFcxNp1Ex6VV7Ca0uI0raELHn2Ue+LA5/MmwU
	ogV3DRu+i3wbrH6XdJFma1xzShBwhm+P3RvG05THlQ2SSgVpv3Yt/6ECpSHyb9L8PGr22jgdcT8xA
	Jv+bxhsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY8rZ-0000000G2eI-1TcI;
	Tue, 23 Dec 2025 20:20:09 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY8rW-0000000G2dK-37w4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 20:20:07 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7b9387df58cso8586517b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 12:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1766521206; x=1767126006; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=akmDQhsi4smXKOu+AQ0134jZY6Y2uyR0jebUNjrF2nI=;
        b=AQjBMI9cYax4fKbjyBqXPPKvut0VGxx799wqYtbLmcmDvl00iqlRvmc3N5rp1iZBFA
         d6208DL5BDzkuAGsiosACbYR4dg2Chjw/SoTkaMPxy7ixvTmP+Ice+ur/m3LaTwXqOfG
         KDm7fjQmI/m2cdKl8H6/9NuXBBIun8XSGrCraVXcYgPwdjvWUQXeRP8Wm5gZWIOsSKAx
         JLbrObY0kfE1U3q+V79H3ibDqxNxsG1dEocHBqAfjwOG17iaWvoI0M2U/4yYllYWSIXv
         PlITH07DcDD1qSjHODN4KR6YwzuZCts4o7/rvv1C14BozvrTqWg649xIb0N0Xzl/vjgi
         1Tzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766521206; x=1767126006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=akmDQhsi4smXKOu+AQ0134jZY6Y2uyR0jebUNjrF2nI=;
        b=WIMjbVCOjO9bYaNEJwFUwh6V7Unvb9YNy/JT5+RU8JX2X0Le0lq5kGVQZUarqQhkTN
         7jcWZcXqZ9mtmJaWnlqKRsfD9/KacWDPIaZ4s7FCOLRiuS1JY3fo1XgCyA84WBcjkPz4
         tDbv13RouqKWJCQF7SKDT6bdQ5FgHIKu2wCv5qD20sYkOeacBdafiXe/nBf5hJgYpsGN
         i6s5DHBhJa+945paUJkK8QNIouw20RKRfLTgKJtw1Ajnqcqd0doRDGZE1JuEG0BBIgSm
         LHqII8WDcolLE/XS7STjYLVmEhYHP6UYsbski/bCEL1t/vNcGvxFq3texKnHbK2EaU+F
         Br3w==
X-Forwarded-Encrypted: i=1; AJvYcCU3UjPf0AUYuaxWuxSlkVTYzITuNhmPEzEQjm2auVX1RevWUiTgwa3LnWK3si/tbBPghJhlC4wdSC7awjunUjgz@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0M1ZUSr6HI6u7NgL6eO7ta/CPHaiQerGOTO+iazQI4k7adG5p
	C0x3gNMV+54AAUyqXZrWZXjRiwmRB2kvXGzSsglBawN6tDnRtzAz7pAXlZ9Mhptogow=
X-Gm-Gg: AY/fxX65Y+aVrocGxOPjXVrQ7H4NkKTnTzCFWNC9KT8ev7xfKNHRoKaSgBCbzLFaoLR
	wtW9N1Lmtmnn4bnryf7JfcTveqKKX6PuxWDrbMAfyY69iRP9/0Tcp94kpSRwti022/75OCfHc3B
	saofRW6wiQ0WvzI/E8/Y17VmAdRSbG0u2hzmpUKqP3DeG6qnATINluIawQzryPmzsntlAFMLKcx
	wu0cJD2yzpkxiAjuhfHDccamGis60KuP/jOSwdE9HC/K03LRvhZ0dDGrjW1/w1QPINf67fYMhBA
	p/s5VaX8U70Fgrs5AFgSk2xkFNdATgZuLP0VHCl8ME5L8f7vVetHnc0IfB/AAPUcIJjhrUkqmI/
	zq/ao8tVVvKPwL331+bLgu6/mscQcJWgf0+WA+ITIDX1CdIOWl9VX3rnxT1WRPwv+yHPosvYNKt
	qmRmUUbpvmK9SlUt7cssZwlyHapVeRSZFnDxLYS88Yx9cw6wCx134+x/L+zmELNq0wqFxcQPJ9s
	zIJMF+x
X-Google-Smtp-Source: AGHT+IEAtWdhcWPCbENBvZFgr3c7IxJWeT0r5R2X+lgPN+f3cgKBnmk37uhjXoH7niVY6cpG/hJphA==
X-Received: by 2002:a05:6a20:9146:b0:34e:959d:e144 with SMTP id adf61e73a8af0-376aabf97b6mr15698314637.54.1766521205797;
        Tue, 23 Dec 2025 12:20:05 -0800 (PST)
Received: from fedora (dh207-15-53.xnet.hr. [88.207.15.53])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c1e7cbfa619sm12567549a12.36.2025.12.23.12.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:20:05 -0800 (PST)
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
Subject: [PATCH v3 03/15] dt-bindings: mfd: atmel,sama5d2-flexcom: add microchip,lan9691-flexcom
Date: Tue, 23 Dec 2025 21:16:14 +0100
Message-ID: <20251223201921.1332786-4-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251223201921.1332786-1-robert.marko@sartura.hr>
References: <20251223201921.1332786-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_122006_788916_E0501C19 
X-CRM114-Status: UNSURE (   8.42  )
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

Add binding documentation for Microchip LAN969x.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v3:
* Pick Acked-by from Conor

 Documentation/devicetree/bindings/mfd/atmel,sama5d2-flexcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/atmel,sama5d2-flexcom.yaml b/Documentation/devicetree/bindings/mfd/atmel,sama5d2-flexcom.yaml
index c7d6cf96796c..5e5dec2f6564 100644
--- a/Documentation/devicetree/bindings/mfd/atmel,sama5d2-flexcom.yaml
+++ b/Documentation/devicetree/bindings/mfd/atmel,sama5d2-flexcom.yaml
@@ -20,6 +20,7 @@ properties:
       - const: atmel,sama5d2-flexcom
       - items:
           - enum:
+              - microchip,lan9691-flexcom
               - microchip,sam9x7-flexcom
               - microchip,sama7d65-flexcom
               - microchip,sama7g5-flexcom
-- 
2.52.0


