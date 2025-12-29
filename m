Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7651EE92FC4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 18:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m2FSF4N3N2MYzlByPoECc2cAz8v8tXyMKGpnQtUm3aY=; b=3jiS1H9c3IHoHdUGDkTqBNzt4B
	8QPYiCTM1xJDLi5z4QnlCcCuNZSTJo93IuJ9aqihleOgAVyLCPI9L+ZpC3S6A6qpK3KInzdOU4mYa
	PVs+UoCtvaCQidGC79hkEuGi8awuAWydL9EM/NFOM7BKGQbEr/3ttOYuoNf2XGIv9dDNvug6/8xdo
	SrAJnKqjmlMGanbyLpeZnIgT085UOA4UX9kEfhjvtdFji40I0AJg6J2UPUnb0cvu+UHkASli5/YFY
	5XBjkl7azJx2itaaoBHeAfCzhulEsopoX2lC09xi8zIMmbBHWNwHj0lxUl3aSI80mg6whVQYsVdLN
	B/Gi99fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaIAS-00000003xYR-00CO;
	Mon, 29 Dec 2025 18:40:32 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaIAH-00000003xTD-19nv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 18:40:22 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so61106525e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Dec 2025 10:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1767033619; x=1767638419; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m2FSF4N3N2MYzlByPoECc2cAz8v8tXyMKGpnQtUm3aY=;
        b=vIcg5HITcoXMar0CT/D85tKGG/CIbJgTHS5IHrpBnBDIpKbsDfgJTIDA6qnoXtQPDn
         9bjTBVBeNEahYlgXU2fEPPksLzx+jZRj8Qrq5/7G8dsXmpL7krg5PPIeskWagwVBTjtU
         O0DxQh2x4dtnU3zPCjhcRmpdhqPj/+GkYC7f5hCMPscWwZ+Q3jM3ku/M1QrDOmJZw+IL
         8GxWb5P6ATnJXA1UvsH3Wbyj/urdtyAR4tRyzXFY5AB0FKgFZmNokSwLOtGdDk77vNWl
         UbWfqf86TthfDopbTi1O/oyUxh8wlC48xdusLqTF3DIkRjC+Jm7vBIYMtzQi+QId9Nov
         HT0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767033619; x=1767638419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m2FSF4N3N2MYzlByPoECc2cAz8v8tXyMKGpnQtUm3aY=;
        b=l8MJr7ZSZ9QQnVl1F4vgG04Fj2g0oALPmRhOBsItUz/hlSNopcsvkGUHq5lW/jDjn8
         v+bBJNYoYYETR2JMlEYHvcA6MuJd5YtqlAmniRl3Wnp1F2s39iSehP6c9QJlMIe1n0be
         RaOTy4w4IbqmQlaLkxvyrR9dCHKoHpRr1kc2//Hrt+yrPNXkt/dI3CJZDEJpE1LEhSqz
         qdFbBdrRFZ5jNeC8A0fsaK3YV2vPW8RQ7JLWiX11Nb/FkMIa9kVX/ISRMob0JNwCN8/d
         y7DEWUopRWWzXtx57+hFhytQfBQ2oebItvZK0xhIVrGfy5SKNdpI2y0NMKLl1W4XDmET
         KdfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEE6LMTwRM92jY5Q4lI68HgclsPSrcyiiF7okvTpAeANiIyJ1zBso1cVnugDWceLcMGZVaqBqTDHeCCBoKa8vH@lists.infradead.org
X-Gm-Message-State: AOJu0YwzoSycEecyAWwLdoXrNgsIyOeTAsKoZViMwEbWzvVxMqm/Km/c
	CpxHG8LRRALi1u5jl2p67j8UD0K7Rc3rjjQj9qULTz9eUBWtxsZpPC3CSs7MQeA74rA=
X-Gm-Gg: AY/fxX7hG+tHUUXtkB+weL3lNwaJlXBXJVTNQszKzRWLpuQn1xjhjKn4YXPURYdWLTR
	tooM7AV7qWdDaoJ7Vji4R9YUQhu3Rc3ngW0MTzY5WNSs0Yo3n13GGWodTTOB5u/2/SLTRuwTMMY
	AdtP9DHsKR+Tax1BJNdAoU1rmEOZi/dpo00Ati/NgAYcA+y7eWYYRBv/U3ISEdjzIQLLg13Ke50
	cC3dA6DpcRDSV1OrP02EEhw06wQhARNjd8AncTiLDmTgvUh5bBVepr97FfXaplFzgAdNqObmbmJ
	W6p9NYP7FEBGp/glAPuIFyZNr5kgakSjGnkudSSnUwxTPkErMgMJFdbW2vWeGQiA52RPESn9ELO
	f8iukXFY9ZW5z3OzI1XbP2i3VLXDc21PEA3q8Dt0PzVQT9X7uIQbWfF4zHbPyQpkGYGlvCsGr82
	oPOxzTsNde/1e+01MFBQEn69xkzxb2lXPd7xc1H9LQrnN4Pdnb69dJ3CLrt6VR9hjjkN1uVOz6p
	EWO0sOSXg1PDGmzFxVwTDog0uJp
X-Google-Smtp-Source: AGHT+IGouKdEkhppybsCuf/IfO2U2/Dz9wh0+2E3/5N4x/PhA0Nd7PQ1c14nBgJEnbaurS5x35/GCw==
X-Received: by 2002:a05:600c:4e90:b0:46e:4e6d:79f4 with SMTP id 5b1f17b1804b1-47d19557183mr403585065e9.15.1767033618979;
        Mon, 29 Dec 2025 10:40:18 -0800 (PST)
Received: from fedora (cpezg-94-253-146-116-cbl.xnet.hr. [94.253.146.116])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47be27b28a7sm604907455e9.12.2025.12.29.10.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 10:40:18 -0800 (PST)
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
Subject: [PATCH v4 03/15] dt-bindings: serial: atmel,at91-usart: add microchip,lan9691-usart
Date: Mon, 29 Dec 2025 19:37:44 +0100
Message-ID: <20251229184004.571837-4-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229184004.571837-1-robert.marko@sartura.hr>
References: <20251229184004.571837-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_104021_330284_BEB66BF2 
X-CRM114-Status: UNSURE (   8.44  )
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


