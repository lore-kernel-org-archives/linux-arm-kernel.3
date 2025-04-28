Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32354C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 19:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kZL+y4O4nVB6WkTciMzCG9+Q8Gw1aprj/ilNSB+S7lA=; b=Mj2kXpwaZs0W9u5JCiOOICqir6
	iLj72LFg00i+5HRg4wAx9WV+45ewEwstX6AuSpT4o4QKpoGL/7e7U+pgCenYA185iNK/lGrX6BEdE
	wZY7FOGbmuSZxRe9t+jtfUgRu5N6m/E+J48wkUsZlj1o7vIZzpwhi8/CKoQx1dhYJl+tT5OGElHm+
	YpqGuh/2iuq2UG0DmqFhzf6GRwetG++L/SUCQqI9XaJ6fWRl3wohcjquSxbwV+E+hfvwj4tkESTiD
	0GoTyl2dHxabTQsGk8D1j/MtM57zpIymY2PIHAjdXZpOj9AqC1VWlw/01Gi0rINtRIVD3O/BAuj4Q
	rWMz8vUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9UKp-00000007N1q-2mhe;
	Mon, 28 Apr 2025 19:40:11 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9UIr-00000007Mk1-1xms
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 19:38:10 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-22409077c06so83942925ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 12:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745869088; x=1746473888; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kZL+y4O4nVB6WkTciMzCG9+Q8Gw1aprj/ilNSB+S7lA=;
        b=IszaJKvlI+d/2NsvkC2n13BWmDGhKbZRYiYhdMBZR7vGelN/SuPh3WyOYWkb7wrFaH
         bHhZNisIPHUz7TmFx2UElHiRozQXTLcM9xTBhOhlZ0cPNyU6e4EMp69NSH4aT1hdcV0b
         vIY0tAwFO7DoSLaw5ZlfnLY2VDVr80buNNL3fd05xzi0Uuo4JvApaRs/H1raaqkPUAt6
         v+hbt8jUnBzv8dHjqlb+pEFmdDqu5HBGd6gDlAScxbAM+CPIubdxCGb4pYjsxlOGOvcC
         U/rx2YOM/GZRWE3lw0a9PgW+FtFgRmLupNY1P81wKf1oOmZ2cA8IGgVpchdekS+BKta0
         9JBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745869088; x=1746473888;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kZL+y4O4nVB6WkTciMzCG9+Q8Gw1aprj/ilNSB+S7lA=;
        b=oM+HAZkmUg1kCfOx2yKsJikVl22+F8yXy6IvKB0aZw2HmX+hXNyYbPdJGYJ/5A4UPf
         2W6waeDxt9y8zpLUH26nkQ285ey43lPQdev9v7jSCh5ang4HiRiAMCpPJwEIL2UISG6H
         srenGwoWYzDXsXD804L46WDFy3VCG4966hCHKKobwvwlY1CFrwuejqBaRP0R3FIlgP1v
         dlaJ9zN90XfSXGUnTczoO4OmnIjhtjG5QrRsu10/N2Swo+4GPNEApuYLFiXpkjpoueB2
         QcGa1scu5PMtZXVyBk+b2TVUY7Ub6jhrTL2GbuUxefczGw1x3AtqoY2yIisIhzUzoQ6B
         +XKg==
X-Forwarded-Encrypted: i=1; AJvYcCWQ5IlCj39HVfow2Q+8CKezXSgw8odTkrTvnK2SfogwOgN5TCeUsQToEibrk8Up54FWAT3cz8lQ7oEhl3HH7pTB@lists.infradead.org
X-Gm-Message-State: AOJu0Yzg050C5bqG5S4ZM6U6HKrJMaIWwGGCqlpgVnKc3/tzBJDBMxdQ
	Vrn/sIEOHfcReJnoLK3akcKMRMGBO16pyq+/Ii0RjKEr2HuKRpIxQfws6lAnNA==
X-Gm-Gg: ASbGnctf3e5Z9PvS1OVchtS9m28wozMCX5T9/2PGcfoY4UORL8iN21gvKBrrIoCbIC0
	IgmeIQb9bW5Ml3iGulbCsWTEH7upMsopRfnf2O3rhZIpUbqjcLLilmdOdFj42TTAxP0Oc19D9PY
	uHd3UT4y2tGU94MqzGxiOtNmPYWHhWO1DY2XweE8skrh901qh0IJ7XYQjRAJc4eKRQSDB1H89kC
	2wCrHZ1tMcx60kNWYacvNf3gYSLhjUYADa8+L/uDa5hczGzIeCV1D5jhYk3YQtEi9/GAA1BlNtV
	q3LPixQwaNIlTTU7na3y94T4+AxTr3BJDru9OP81Tlj9DpT/HXNg+9BBdgH/BoMZr7MnLMQ6TA=
	=
X-Google-Smtp-Source: AGHT+IEb7sjPxHBoM6DBUpDHrBYIpIDFqqlG7FLfEAc+dm0pnpCG2yrmeVJ4VnqTunSOtGlfHUdVJg==
X-Received: by 2002:a17:903:4405:b0:21f:164d:93fe with SMTP id d9443c01a7336-22de608f23emr13724175ad.53.1745869087882;
        Mon, 28 Apr 2025 12:38:07 -0700 (PDT)
Received: from google.com (28.67.125.34.bc.googleusercontent.com. [34.125.67.28])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbdb4bsm87169915ad.92.2025.04.28.12.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 12:38:06 -0700 (PDT)
Date: Mon, 28 Apr 2025 19:38:02 +0000
From: Benson Leung <bleung@google.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 2/8] dt-bindings: arm: mediatek: Merge MT8186 Voltorb
 entries
Message-ID: <aA_ZGndUwSLY9yQ3@google.com>
References: <20250421101248.426929-1-wenst@chromium.org>
 <20250421101248.426929-3-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="coaj1VmWJVD9+zVN"
Content-Disposition: inline
In-Reply-To: <20250421101248.426929-3-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_123809_505513_CBB4B532 
X-CRM114-Status: GOOD (  17.72  )
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


--coaj1VmWJVD9+zVN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 21, 2025 at 06:12:40PM +0800, Chen-Yu Tsai wrote:
> There are only two different SKUs of Voltorb, and the only difference
> between them is whether a touchscreen is present or not. This can be
> detected by a simple I2C transfer to the address, instead of having
> separate compatible strings and device trees.
>=20
> Drop the SKU-specific compatible strings and just keep the generic
> "google,voltorb" one.
>=20
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
> Changes since v1:
> - Added Rob's ack
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 3 ---
>  1 file changed, 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Docume=
ntation/devicetree/bindings/arm/mediatek.yaml
> index 108ae5e0185d..49ddc504c160 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -339,9 +339,6 @@ properties:
>            - const: mediatek,mt8186
>        - description: Google Voltorb (Acer Chromebook 311 C723/C732T)
>          items:
> -          - enum:
> -              - google,voltorb-sku589824
> -              - google,voltorb-sku589825
>            - const: google,voltorb
>            - const: mediatek,mt8186
>        - items:
> --=20
> 2.49.0.805.g082f7c87e0-goog
>=20

--coaj1VmWJVD9+zVN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCaA/ZGgAKCRBzbaomhzOw
wnOoAQDrlivFR72rlTsDjXpRDqb5IDQN68oHJxMoVtwn/gvj5QEAwGk6b5hoLf1D
239knHKArUipas1DEpyXfJVjZk3+VQ0=
=L6Rm
-----END PGP SIGNATURE-----

--coaj1VmWJVD9+zVN--

