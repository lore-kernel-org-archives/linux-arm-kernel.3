Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C2FBC02185
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 11:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dEETbdnKlsxmZe5oB6rAoR/Y3VNUS2QT7unKpMA9HfA=; b=jxvUor2MIt0s8wqfsz2lu59VjE
	iVOA1vIX7nHpWiNHpUJiFJLOZgtGiNa4hT0RblG7j5QZGiJNCavaim5ocBFNboOS9Iu4Wm2uq0ezs
	iMMEW953PepnPtRfPhSzLscjPMWlzgjyXxW4DIlxzXBCKbcC/EE9LP29oRVu8EVv2nxzJhNfKnDjZ
	BlYrG7+CzbY3qpLTrGFVFBc+ZnffQkYLFQ7jJnoS7cz0+42tgN5BV4FFqbzH67XxU3EMdL8aVSxQH
	2cF+o11WT59s/YA0Epd3ASdOvzhxMPBuvttbOB0TWjwOo3CZS2lcy1eO35NhPbyx+OZ54mRxS2B77
	sn2TokAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ7JV-00000002Inq-0xIc;
	Sat, 18 Jan 2025 11:48:29 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ7ID-00000002Icm-3yJw
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jan 2025 11:47:11 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5d414b8af7bso5766966a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jan 2025 03:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737200828; x=1737805628; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dEETbdnKlsxmZe5oB6rAoR/Y3VNUS2QT7unKpMA9HfA=;
        b=eu+9KzwM0/+o+sQUAGMrxlIK0z9XF9qxHq/he/epwC/kaolB+g0TUoIC8xU1Q9IQz1
         bDVZLD1RurIfuKqfSyTZdeB5+Wekqtk6wgWObFLl/YqNyc5gj8Bx4er123IQ1qq3gU53
         YIxM9Z+2godq9sGsr/30wlpaD+l+Ad64KehlBHew5irugEzNBP0aYvZ9JYzaDa9fquU/
         O6N8fnTWhFxEWZw8QpAfY/TuEE4GI4Y2OjUpnIa5DBZLxYRiK5ZzfY2vItdfE3PRfyLx
         pCIhojoWxol/8gKjpUAFuoJFxSM6HyVTaPTrMvvPq0wi3C9VyK2AZ5LfMBStY5jkThz6
         TmGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737200828; x=1737805628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dEETbdnKlsxmZe5oB6rAoR/Y3VNUS2QT7unKpMA9HfA=;
        b=WDLYmPSNXijzDiFF7tDWI4Szz7DvOcrGzxvrRFqlnDyh604VGvrAed3vuuAJImOHWV
         ljmiv8S3GMQixJs6/fEd4PKbs+WhpNY/E1srVY3DYgiMRX+rsi11Z2SHR48nrjyyIugJ
         Lwaad2tpRiWLWAIrhuUfzVKLqA2RD4/yxKgnRjA83SL8lRHT3gBkn2TWMr6yktbDfz70
         +Gz1SwI+pB67T89OD2muWrJI055YfNQMGqMVEO5Izkk+1WDTTU41c+xD2o9X/asfDTiz
         EmYc2+cZ0CN17VkWHGkazlPbeWWDgh65eaQHSvebRecXlujPPLOtYy7l3FJFRkMstZih
         b1Rg==
X-Forwarded-Encrypted: i=1; AJvYcCXc0F7DvIxUJvDB+nguz4iykI6bhVAp9FkzurW1z93rHPztWvyw2Wxn2dE3CFyx+kk0DmO7z86NePotJ867pgqv@lists.infradead.org
X-Gm-Message-State: AOJu0YxJQn27Y3MdBhVBgJsmGn1cn9RxAGP1KLJPB64gf/BUArkVh6+F
	LNQ5TxflJZBg+k3xTMGcqBGyINjI5xAHuOck0gK5wLcP3s3NokrH
X-Gm-Gg: ASbGncvs7HM7IYEnK8Y0bbX11Da7zOw/xq77svTiJGcYahLFud8hMXtjHjsrI2WBvy2
	XHc96/CxYeI7QHQGYuhW6Q/g1Z7jHyNYVomJnIoPK6feR429tEJ/VV3iftG7i5YQxA2vYSBcMbr
	Gy1l+3lkZ5Jd/lKBESJ7imJ7rZUNdqWQ3vkoIHi9+u2QSWZwc370DxxOkgbtt2KN57iBztCA4Ff
	7o+FYAvQxabEjK5qTBmqbBzyiUjV12DWgHAUL9pRng8Q89Hq0sDgzyy3ZnaFhEm9oCwXv5wl64p
	0M4ROV04dR5y/ls=
X-Google-Smtp-Source: AGHT+IE/jKdo/VLXGSTwqZLRban4tKHtpH41BP/bx4E15bq4lS0FrHpTEehBdX2Yz4BsnqkbLRGFRA==
X-Received: by 2002:a17:907:7faa:b0:ab3:30c5:f6d3 with SMTP id a640c23a62f3a-ab38b0b7f5amr554823466b.9.1737200827845;
        Sat, 18 Jan 2025 03:47:07 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384ce17f7sm323829966b.40.2025.01.18.03.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 03:47:07 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 03/14] dt-bindings: watchdog: sunxi: add Allwinner A523 compatible
 string
Date: Sat, 18 Jan 2025 12:47:06 +0100
Message-ID: <5534097.Sb9uPGUboI@jernej-laptop>
In-Reply-To: <20241111013033.22793-4-andre.przywara@arm.com>
References: <20241111013033.22793-1-andre.przywara@arm.com>
 <20241111013033.22793-4-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_034709_986113_D19D733F 
X-CRM114-Status: GOOD (  13.99  )
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

Dne ponedeljek, 11. november 2024 ob 02:30:22 Srednjeevropski standardni =
=C4=8Das je Andre Przywara napisal(a):
> The Allwinner A523 SoC features a watchdog similar to the one used in
> previous SoCs, but moves some registers around (by just one word), making
> it incompatible to existing IPs.
>=20
> Add the new name to the list of compatible string, and also to the list
> of IP requiring two clock inputs.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>


Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  .../devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml   | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a=
10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a1=
0-wdt.yaml
> index 64c8f73938099..b35ac03d51727 100644
> --- a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.=
yaml
> +++ b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.=
yaml
> @@ -32,6 +32,7 @@ properties:
>        - items:
>            - const: allwinner,sun20i-d1-wdt-reset
>            - const: allwinner,sun20i-d1-wdt
> +      - const: allwinner,sun55i-a523-wdt
> =20
>    reg:
>      maxItems: 1
> @@ -60,6 +61,7 @@ if:
>            - allwinner,sun20i-d1-wdt-reset
>            - allwinner,sun50i-r329-wdt
>            - allwinner,sun50i-r329-wdt-reset
> +          - allwinner,sun55i-a523-wdt
> =20
>  then:
>    properties:
>=20





