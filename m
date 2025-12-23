Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C363E6F086
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 20:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MElNA+evLW3q9gh9PLqoqAuYhUoiUgxuy1qDVWGw3Ao=; b=k/DGx0lPSHiCSY2v/MFFmsbEGm
	kfKmNSdmpe4eGLp7lEr2f8odz9MK9OzJ2oeWsawz8YbtvEfAzAjH4+43vmxkG+JZ9cuX0wyy2MOxi
	WBxZiVtTeCUzE8Y2KJ7Snlkgoj5am/6933nxhqueInT/09/VjurpYkof53//7CE4Ee6aEftOhcQl2
	BA32cOmhQjvBla4CkBP8qMZc15t4YVJaKRXTYsnTCSCdv54Rm2zndkfhdBRcNuVv0y9uXjxWW9aIz
	0RjhwrfUVKZOp1Y8G8Z4U7bLkEFJDbtNFAC20+wXteDO2zwVf/zVgNz7mMHFZJltbv5s9c9+qyMDD
	yUyjJLwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY8sT-0000000G3CJ-3Mk1;
	Tue, 23 Dec 2025 20:21:05 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY8sP-0000000G38j-0Ul1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 20:21:03 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7d26a7e5639so6112623b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 12:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1766521260; x=1767126060; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MElNA+evLW3q9gh9PLqoqAuYhUoiUgxuy1qDVWGw3Ao=;
        b=CfOocW5zsdocPKRsjXmPNIQ1nOMmI/smQ9s9sSbPmFPViqFXOvknbyK2DLtWQMU2WQ
         +hvG90hJFIAD+Or8niloH0q2Ng60sOVuQBVLX2j51VThRocHjUMg7dfCNjrBbHrjlQOy
         bfgZLkUbDZB86vHaziTxefh+5Xy3xgeiThHL3XE2A2eiI6Pjc0avst4lW4c7WpuqSY2p
         yWGB3WuEoEvCbnB/X8gTv5gMyHc+EZm0V2vomRs8k3Jh9fpTtQYfKchFGco0VDm5roHr
         QyHlOCLwWK3LTqIUSvDHkSDCM8e8nFTANlPrsI1XXwDuaYbCvpoDtQL+9aBbvAKNmNA0
         tiFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766521260; x=1767126060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MElNA+evLW3q9gh9PLqoqAuYhUoiUgxuy1qDVWGw3Ao=;
        b=Tk8bx0Cg66Q7MRQNBYgQENV6OWZPASqSGPR75rwwQw5hKZMry9FR8i0fB4458qPHJ3
         N1CA7KT/twcIW6F7l3WwJEvskLrNNkiPOPXPI4x0wEictJ/cA2ddiMXFxD6fPcKJE7ag
         ZH126vMjEo/XUXcB9OcyksAPuMDz/BgsYyHXaPn4jQQz+u0Er+GIQqobv14sqf3tYxD4
         Ev2fLvhg6VUFoTXlLiKklkZ0v9PHypdfy39chnjEmiRGWEnizs6cMb2/5/Ey97lioOmb
         W9TOKNRW8iXAGHrdYv2SXC+n3JmMT7y7RUDGXTE5bCmhuqK1ARLD/RRozWCIjqJXnFEX
         T6mA==
X-Forwarded-Encrypted: i=1; AJvYcCV3N51bgIyiLlEzYTW+Z1LaGZ3xj02yROmdVsEE/eajke9Lcrfrr1gC2Hby707+6F/9bEjc/FflR06bbKMOQy+s@lists.infradead.org
X-Gm-Message-State: AOJu0YzcOjljLM9tUAT+HpKO81yPWuNVI7AjSn8lTEqFis22VNSCCSVl
	p3GugZAx9inprMVi8cwFlUoXStHODqOAWU3+z4Ek2jtBoZAnfF+HoGZvyNqORa9i/Ps=
X-Gm-Gg: AY/fxX66T7OPGVsHQX0BJPIDcGMlg/4GPYbUkemjbtt/xZEs1Kd2SH88YZvgtoA+kSS
	a8sM8X6U+M9zdSeriAMYzx/QFkvmMDxz8kFQO91rsuUVmDkkA+nsZOhJr2HC8ET17B4jHNOO7N2
	vV7HihOR/roqulVscBADUkwzgn0xf4YdsttpveU63sGh/Irc+0LyoZiwetC9H3ksHiYIn301E6V
	oH4zKX6hAbQFEkG27Ew4POeBqypqw8EzBq/p0Dcj42jQWXpWODyoHFToDnvoVYoLaNy6QNI7slL
	gSqQzBrf87BcJe5YN/W0xq2Jzy6N1w7cDNC5TuyCyrJGizRcCj5TMa3PSsRwWFYwKdSC9vjNKrZ
	njrwxORgYug6MVRAnwc4zKm5yd5Rimffn1tyAjwE9k/72bt90z2+mfE71VuXqxIVHJm81Tk+uFD
	y4tCswwMF/gxshSqvaKSUQ74uzUeR/N3qBtIWitdoY6jLNpSHL4W/6uIU6Mz+8QNSbHHatGTlbc
	0lCkdOq
X-Google-Smtp-Source: AGHT+IHKfwHDjFbBjFoOP1ZNZG2yYIy8Xdi86MslAqVbrnS76U8emwCJO7CURd8duOcxnItzlu++Ng==
X-Received: by 2002:a05:6a20:7289:b0:366:1880:7e06 with SMTP id adf61e73a8af0-376a5449622mr15082294637.0.1766521260025;
        Tue, 23 Dec 2025 12:21:00 -0800 (PST)
Received: from fedora (dh207-15-53.xnet.hr. [88.207.15.53])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c1e7cbfa619sm12567549a12.36.2025.12.23.12.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:20:59 -0800 (PST)
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
Subject: [PATCH v3 09/15] dt-bindings: crypto: atmel,at91sam9g46-sha: add microchip,lan9691-sha
Date: Tue, 23 Dec 2025 21:16:20 +0100
Message-ID: <20251223201921.1332786-10-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251223201921.1332786-1-robert.marko@sartura.hr>
References: <20251223201921.1332786-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_122101_190874_E4005256 
X-CRM114-Status: UNSURE (   8.40  )
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

Document Microchip LAN969x SHA compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v3:
* Pick Acked-by from Conor

 .../devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml
index 39e076b275b3..16704ff0dd7f 100644
--- a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml
+++ b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml
@@ -16,6 +16,7 @@ properties:
       - const: atmel,at91sam9g46-sha
       - items:
           - enum:
+              - microchip,lan9691-sha
               - microchip,sam9x7-sha
               - microchip,sama7d65-sha
           - const: atmel,at91sam9g46-sha
-- 
2.52.0


