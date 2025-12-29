Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7997EE92FD7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 18:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ClyoGQdLbQ+NSakHU5SbIxGsiXAmeIUAvdUGZfMfHas=; b=dqtjBZhT2invXNjIG+tcMfTxpC
	C20fctt6B6AW8Zr+hWPlxlI3ThcQneCoJLip7b8gbHHWcyF1uuogdafGuVEEQlaWC9Zv6A6Xtp8WJ
	B2v6CaSxWHPF49JQFWnW1W25foFeJpt98TT2e7AZt91dDbwpddeK2Zx2HH9HZDnbEBB3so+HuVAJZ
	xMvN8hiQ22s12X4xuImfg9kXQWz4FgRPGgvJ7SuAP1rCAqslMmeSR8b5+AjqPgDHviaRgTwg1ilJt
	jXRZgdxDm0InnXy8ID0OcIFzCorwuMSs+04xLTb+EXUkmu/VYCFUdNxYvFiHFYY+AOlBk1vSR3uvX
	YF4uEPlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaIAW-00000003xbl-3rWX;
	Mon, 29 Dec 2025 18:40:36 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaIAM-00000003xVW-1usl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 18:40:28 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so93000415e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Dec 2025 10:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1767033625; x=1767638425; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ClyoGQdLbQ+NSakHU5SbIxGsiXAmeIUAvdUGZfMfHas=;
        b=0UKBVkX6WIb/0iFP+8qmV9OzaFlOpfR3D0BJHCfUDLpr3X4azPpvzqb3qjZysN8v9a
         HiYAC/YhdcsabZypP0Wfg06RGgkvC1b2UIJk0QfUuhsiKEcs6tJZXMu0sMbAz/S/5ECJ
         kR4wb8hJwGFrNZeV9ATace+vFPeP1mYWw/cZSbnLn65yviL6U7mqs/lCGDHEsAaBWBab
         G7GTerumeG8kj+d6Nh9OUslj/cqLI1A3eSSkGjBInuuG5vQKsjkWyw3JsNR37wK6AMM9
         4lCpcVrbufl3y1DDl+bYTjD0ZccKnNTxLDSQq3W4UEPQo5lJf3qB6ASM1R4a/YrzIrZh
         /dFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767033625; x=1767638425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ClyoGQdLbQ+NSakHU5SbIxGsiXAmeIUAvdUGZfMfHas=;
        b=LfBcHPFBRUyUjyQNMr3/gvvh3HNVVQDt1gVaBn89aO4+79TCMEvzr3E0wsT+us9cDc
         65nOApcgvwa6n40zYk74+uUYtCDiNF+DkIW3xR/PAW37qJU1cZcu+xvmPYakRkEgtwo2
         3unw6QFtJZ8SkTaM8IcSBNYhCptfAciyrTp7LQ4zHy8uQ3zfbH4iDZ0E0OQx/iavDXZu
         D9A/WhQj/HQpB8WrjpYX6aiUAqTorEQVHwKGFSfE+BX4rWb9c0vJezNHBxp29VOAAU45
         xf4K2gIlmnN4dz56PrQdoIa4D1MmSR0crrtPM7DbRwx+5aWOmyqLVIOL4OghoMcseE7H
         HR3w==
X-Forwarded-Encrypted: i=1; AJvYcCWQvIgFdI7WIEB5M7ndEKD+JQp1aDFi+9YyxpR2hB2cXKdTQE1HjsVLasirQ7rQdNPaLRnWlvQLad2NIJYf0N+H@lists.infradead.org
X-Gm-Message-State: AOJu0YxEUgQBK3TDn/rBzfrCgkQn3TEXgIGZ6xB6aPlaSbW33G1wW8+F
	bdh4dEw6hX3LEitV5sI3NdoxfsaIyKB2Wga+5NAyiLKmKDOo6jvgNQL9JoG3x9zYrQ4=
X-Gm-Gg: AY/fxX6L77bxe5A3cUQAaxuD+5ib8CMLgknPgv41VzRrV6aFxtSrP6mtAWflI/UiGaq
	alTs/LlovfMic7W/3l254Mw7rpi0JJpF7U7ee8LZRXUxM75FXNeO73fso37JhaepYiY738NTKqC
	Di5dj2XzlUyWEQ19UGPyEgupxcFGs4tUCJEeWFVNE9rh4SbXWkUjTxTXu02C/8Wqi5utagv2qvC
	PcikcTRbMTnHZbm6ZzuukWeuxg9HxRy3rb8oXdHowDg2c/mPP+xMo0BkwDtWOqDbiP31cE2Hf8e
	q+dJF3tKtCStV0SBwOzhvjjLcPGhbdPvYpStC8L41oIssuR/+970Ak9xcmiLGDPCuT2Om6ygiDP
	tjfYh7rRpxIxl2zmCvAT+lU0ocKul87e5m8JCwk1xRP8B0f3wQQkN1CC5GGx3q09+Zr8zjPbImc
	fhxnIET+X3I4gXATbtxiVlkLyh05WBzKVdyRpjjkbHbp/J5u4V+XrAnSLG6bSOmujiRh/kUJH6S
	miyCBOS0xqmGDUx29ZadmLjElOf/tWlWv3YNnE=
X-Google-Smtp-Source: AGHT+IE/qB6NEHP1QqGV5PfcwRRofx95tVM5do9NhE19foMR/57boxHx8KStBk+G0GxCGRT1W9RoKA==
X-Received: by 2002:a05:600c:444b:b0:477:9814:6882 with SMTP id 5b1f17b1804b1-47d1953b77fmr317021115e9.5.1767033624761;
        Mon, 29 Dec 2025 10:40:24 -0800 (PST)
Received: from fedora (cpezg-94-253-146-116-cbl.xnet.hr. [94.253.146.116])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47be27b28a7sm604907455e9.12.2025.12.29.10.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 10:40:24 -0800 (PST)
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
Subject: [PATCH v4 06/15] dt-bindings: rng: atmel,at91-trng: add microchip,lan9691-trng
Date: Mon, 29 Dec 2025 19:37:47 +0100
Message-ID: <20251229184004.571837-7-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229184004.571837-1-robert.marko@sartura.hr>
References: <20251229184004.571837-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_104026_505273_2B13A684 
X-CRM114-Status: UNSURE (   8.34  )
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

Document Microchip LAN9696X TRNG compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v3:
* Pick Acked-by from Conor

 Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml b/Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml
index f78614100ea8..3628251b8c51 100644
--- a/Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml
+++ b/Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml
@@ -19,6 +19,7 @@ properties:
           - microchip,sam9x60-trng
       - items:
           - enum:
+              - microchip,lan9691-trng
               - microchip,sama7g5-trng
           - const: atmel,at91sam9g45-trng
       - items:
-- 
2.52.0


