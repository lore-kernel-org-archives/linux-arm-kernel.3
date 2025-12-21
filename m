Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D93DE66886
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Dec 2025 18:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EkFUuskD3aXQcMoKgf00kBQMcF6mPoLg5bi7MGfjH3A=; b=oribPKH8vHoHx4fi0WmWXJbFlw
	9octEQ69+PhLMq2ZFVJ31b18Womrjz/eI9/1oVKYRosYdn+/KXF39EZfI09vYnIrVzYVEOC832Oru
	rKu1jEaWBd23zkIH1YAUDt25+of2Muf0FhCFB/Pvh+gY/GvmGuDaXBCy0kHon++JUT+5fSNGbe8L6
	8KF8bgX1+PJDpcsh7tre8+E4U1fO0SOCs6nezAJWi8xPr9lQl60OWFzgNOWAXs3zWRKQ+oeATQyha
	sqcoSi7L5SGUoROOJOQG83gHkB/jfq9LVYZo2XP9W3MHP7RHpTyANCGjmtP7QXndb3R0uEe6b2jvl
	tNi3dTDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXOY5-0000000Ceph-00Rs;
	Sun, 21 Dec 2025 18:52:57 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXOY2-0000000CepK-0Du2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Dec 2025 18:52:55 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-42fbad1fa90so2718054f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Dec 2025 10:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766343172; x=1766947972; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EkFUuskD3aXQcMoKgf00kBQMcF6mPoLg5bi7MGfjH3A=;
        b=B+6y6uSnqfA6cP7rAmIRu1o4EXUB+Nor1tug1ZvfemrbPrA6O/ffZ8QrGA7Pizf8OX
         4DFh+/OV7riFQ0+ownnVcGTWD2Q6fauTyRf927Luzs/LK7D6sBxvR5bUOxLlAg42oXmj
         tyR9QvWbP8Rv0Pa21sckLtFZfB/ysPpFn2bZ1PA8/jOiS4H5Ysc4SsNGMkdBzNEf8/Q0
         tTSUNoWcvfekS9FubtbFUnAd67smA5X8Mo77AeyuKSo/kDJ7Tpp1gXuvFu1KAbkfMBFl
         5UmyLBL2ZcQsQHEqEQ/E1HbJHDMNgt9gWOJ0FKe5bUpN8+nQZ3Nn7ZbEr80G3oa1pKbI
         YJoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766343172; x=1766947972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EkFUuskD3aXQcMoKgf00kBQMcF6mPoLg5bi7MGfjH3A=;
        b=H+hHxqhZ5vXQRPQrVXTz0RuWK/aD2AvAEP3G0xVg6bBoenyJWp0i4z0tMWLFamkvIV
         wwnSLDuwYKzGbTdk3/c3cbZug6PYEizEjSSORDfiMLWT8p1FnGr5llpQ921YWp1KoDbA
         rqLGo91vgunmM2RaR93AVyHqtOwtKlOJIypqujyaavMQJidtQc+Iv+B1En+uLi+0SsZH
         IECL3Xb8eH4LYv39/j12aZkq7kGM0GSECVjMjPoh7aUm1abbbIBROsgyoBl1iBC7wdu+
         7erLrDc/m7gqanLkU7pWmK62c8Pnmx67OheZH3QPvjdzKbTgxAq27QdutS2IQh6sLAq8
         Qy9w==
X-Forwarded-Encrypted: i=1; AJvYcCWLh6EJ0DAlyiOrIWNx3PYFBzvrqqactHqSO0280JNwYpY2inl7UNkYTzD5Otv+ZGiqcGQIa4gswxl69RjBd2Er@lists.infradead.org
X-Gm-Message-State: AOJu0YxMLykDxyzCVPD7FfRD4a2SAdbF5FoniY9sAqsSr5ueGzFwfBtK
	Cie9T9U494YCSEwm5fpfEfC0odeJaGL/ShjoFjFK332XbXYgxMNj48aw
X-Gm-Gg: AY/fxX4eMmzjGquIq91lKKfvvDOSBGtBC7bJZGHoOSYYgWsqQSjFpN2uThV1QVGjyzW
	HjYMEZ9rhwZCMrkIiikaTAeJmfOvw/BcpP+SBRlR7U0eZNXZnGpWNyimISvwap+qY2lr9Rd8cSu
	IDIcHhp1bCBxYQ1oS180IvRKXdxZrcNtRelkVk2RfoR9iGMiqbvlwY9oJWM2u37dU+6xaZusGqx
	KEyhmxjj0EfyxUKJK1UTBnx9qaNrC8jVAqSOtqTs/OuRp7Hyae/+ORDBvLXBYFcu23sAxFsqF9Q
	xxulI7Nm95UADy5+vc+EIW90nd8rg4XU1KJfUZmoJ/rWvLprVy+VdxXbUHSDrLzAAlUvcTaJ3rA
	7/H4rEalYtonDgnlnluOb39Oc7J8ES25GJIVqOUmy4HxSf2oVP+wCHLRaCQT4SiiPopKxesMHhK
	TUJTx6JeTmttM0XvTw7HR6V5Hi8QIjkxjgItar0lGyfBdKrIKyqwNQnFZMOBbpaAxx1NMX
X-Google-Smtp-Source: AGHT+IEkkDr9J9+zdibSJ3aQ9iWL0xgIJ5GrJUheHH61EjSouzXE+O5/goeHQ+aazrE5IYrzxVO9HA==
X-Received: by 2002:a05:6000:4008:b0:430:f241:a11f with SMTP id ffacd0b85a97d-4324e4fa8a7mr8787306f8f.30.1766343171984;
        Sun, 21 Dec 2025 10:52:51 -0800 (PST)
Received: from jernej-laptop.localnet (82-192-45-213.dynamic.telemach.net. [82.192.45.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4325d10cc48sm7775667f8f.16.2025.12.21.10.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 10:52:51 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Richard Genoud <richard.genoud@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Richard Genoud <richard.genoud@bootlin.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: pwm: allwinner: add h616 pwm compatible
Date: Sun, 21 Dec 2025 19:52:50 +0100
Message-ID: <10771871.nUPlyArG6x@jernej-laptop>
In-Reply-To: <20251217082504.80226-2-richard.genoud@bootlin.com>
References: <20251217082504.80226-1-richard.genoud@bootlin.com>
 <20251217082504.80226-2-richard.genoud@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_105254_114776_365D829E 
X-CRM114-Status: GOOD (  15.53  )
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

Dne sreda, 17. december 2025 ob 09:25:01 Srednjeevropski standardni =C4=8Da=
s je Richard Genoud napisal(a):
> Allwinner H616 PWM block is quite different from the A10 or H6, but at
> the end, it uses the same clocks as the H6; so the sun4i pwm binding can
> be used.
> It has 6 channels than can generate PWM waveforms or clocks if bypass is
> enabled.
>=20
> Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
> ---
>  .../bindings/pwm/allwinner,sun4i-a10-pwm.yaml | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pw=
m.yaml b/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
> index 1197858e431f..4f58110ec98f 100644
> --- a/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
> +++ b/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
> @@ -14,6 +14,9 @@ properties:
>    "#pwm-cells":
>      const: 3
> =20
> +  "#clock-cells":
> +    const: 1

Why #clock-cells? I don't see any reason to add it.

Other properties seem fine.

Best regards,
Jernej

> +
>    compatible:
>      oneOf:
>        - const: allwinner,sun4i-a10-pwm
> @@ -36,6 +39,7 @@ properties:
>            - const: allwinner,sun50i-h5-pwm
>            - const: allwinner,sun5i-a13-pwm
>        - const: allwinner,sun50i-h6-pwm
> +      - const: allwinner,sun50i-h616-pwm
> =20
>    reg:
>      maxItems: 1
> @@ -62,7 +66,9 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: allwinner,sun50i-h6-pwm
> +            enum:
> +              - allwinner,sun50i-h6-pwm
> +              - allwinner,sun50i-h616-pwm
> =20
>      then:
>        properties:
> @@ -83,6 +89,17 @@ allOf:
>          clocks:
>            maxItems: 1
> =20
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              const: allwinner,sun50i-h616-pwm
> +
> +    then:
> +      properties:
> +        "#clock-cells": false
> +
>  required:
>    - compatible
>    - reg
>=20





