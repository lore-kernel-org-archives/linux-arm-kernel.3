Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B6C1CC6B2C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 20:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QMDqN9lUNJYAv7hFugtzWfD8cPTp+VesYYa39/Jkf94=; b=1FS4dLBOcS/KUAZtTUjdXu26xt
	1WB3TmC41pa1xbwgQJe4VsRYN2uVbEOGJRdMJovXAMUHBVxhPq4jZPielBNi4iFCRU85hpKOD+TV0
	E0BvsLfahW7q+SloIFtvEGjoIb8ZnCePSBWPwi2llEF8FtMk2sBbOyV/k+nbTtibmhd4JXe8sYK76
	snyudOnU76aZ3SOxV7O2fzXZGdWEIfhlSRN9R/Xs4voNk6A/iDyz+xeIqKXZw7qrM8hl9kQZ8eb57
	jhuWgzneKWQOv9jVf21gcv7OChzN9ZFDmJ05cneV0lH60Ag8GWOxohRwVUHREvoZJfSOXEUobY2D4
	qP7NK3Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH5fC-0000000GGmj-3XrE;
	Wed, 14 Oct 2026 20:33:26 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH5f9-0000000GGlu-22ES
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 20:33:24 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a17baef589so12648745e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 13:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792010001; x=1792614801; darn=lists.infradead.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QMDqN9lUNJYAv7hFugtzWfD8cPTp+VesYYa39/Jkf94=;
        b=GuuoyXga4LtwQL01DthyW4YX3IypDSaZQC/ee3AsLaJBSFsvpKxASOB5al5elcKQjK
         FiJuhBtdIiCzzJ+VlhUaAYVKErRf4EE8wIrY/xZWohIOotPYLiCZWELtJG14IgIzO9F7
         vWE40KVdz/gbQamhaEQLcnRZAD7FPzSF3arH90/FUsPUFnhDC6/XLJLn5VdxtVSWRSFg
         96cFh5LIiHl+CR9zynLwFBCnNwkb2gMW1YDDYN9x8+bn3SCRu2whV3SOS8EHvukB5qpD
         3Y0S6k8GoTG1sM4VdfNTJI4VwrWIoIl1qoVOXnV1jNl94Ir9N/LaGZAhEih1ylpOHHIx
         Mq/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792010001; x=1792614801;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QMDqN9lUNJYAv7hFugtzWfD8cPTp+VesYYa39/Jkf94=;
        b=r+lZmbycTVvoAGyTTxrVwDQ3Pw86ij9whWr5XEBo2KbNCcoCWPkXxk4Ulil52X93lo
         7PAdWE4g1/VSydWUJARLBbGxiKv66kiCpD9gpLzPZjjJSe5N7Oukes/4e0KxyWeH/Yu4
         8Hpo4Q8NC69QxDxOqD/jOE7nxuRmfCt0hQy2DOqUKb+ljfUD2TWmwe8+lsWYUiinqppQ
         xPJqsi+XWspjbUD2CXq+SlyfV//tJeBI8SA9LIOcDccFM5EF+QgGDeap8XQrKJBXTKCQ
         7MumdeBWWgsqDSsDVKof8U7/6BMCRyiyDzNvrB9/wRKTo1ecc6WLAlivVlt7iT3AjUE1
         08XQ==
X-Gm-Message-State: AFq9FYIbXst8VcJs1tAMmtyEBQH/whFXUBj+AAvsQTfOrQZ2w0UdzjMN
	d/dWJOCR5eYe9P0gpfMO+iPtXwL6/YlwaLZZ4nfAzlsym14VMriqK0F6vzOxxBrs
X-Gm-Gg: AYBFou0XQTXCV9Mytn1w8Va2F9rhF0N/i2D7MJs9Zh40a7ukJBIVs3qVz3JshWC/AV5
	bt4bPH6g8AU3JlUauk6Eqzx+7F7UZX5SoUUWd+5ipdnW4PH8/uXpo/tf3MqS4SHNJMiM78rMvBc
	tfJfNzYYrukjQMZF++WfcJaoRIWVWvEnA9sVPLX4b3tUjCOE/lNX3eUPxO5tS9nhVSBf1ZhFt6Q
	pK1vaSSOTw0eDpAM+Xit3/8XIVwOlmfyUVD+75p9s+7GSfbFvOr0bOymM4ldOmZuL6e9B59v4nO
	gjAvLY5u2OKbi88GIb+CHt5APBjBO/i8y4V+IOoVaU5KLr6gwbfW6fcmFD+cq1tnQExM9lTgGCq
	fBxdV65k0fUOGYLfDIzOouv9PATRCaDKxLF3QrD5elw5npKnEG1ixWRhIVDkAVQSjXw/9WGDjd2
	K4f9+Xfv02XS1rBRrFghcMyTeWatTtgp1H3Hy+VD7ngTZeyONrddeSYRsVPHFMZUVY6opiwuEuN
	25pDI807tDHTmohNJWtFft+mwLcV6S6lMlsVC+kFI4PLvQWPN4=
X-Received: by 2002:a05:600c:8105:b0:4a1:714d:eed with SMTP id 5b1f17b1804b1-4a18e4841c1mr348140235e9.14.1792010001180;
        Wed, 14 Oct 2026 13:33:21 -0700 (PDT)
Received: from silicon.doe.home (91.141.74.240.wireless.dyn.drei.com. [91.141.74.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd6834dasm16939225e9.4.2026.10.14.13.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 13:33:20 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
 Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: arnd@arndb.de, krzk@kernel.org,
 Navid Ghahremani <ghahramani.navid@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 19/24] dt-bindings: spi: Add ZTE ZX family SPI flash controller
 binding
Date: Wed, 14 Oct 2026 22:33:01 +0200
Message-ID: <0hKeGS29RSCCKJETWWv9dA@gmail.com>
In-Reply-To: <20261014072109.1759502-20-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
 <20261014072109.1759502-20-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextParttwTE2U3XQbmQGd0wk4ry0w";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_133323_876878_185BF0D3 
X-CRM114-Status: GOOD (  15.04  )
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

--nextParttwTE2U3XQbmQGd0wk4ry0w
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Date: Wed, 14 Oct 2026 22:33:01 +0200
Message-ID: <0hKeGS29RSCCKJETWWv9dA@gmail.com>
In-Reply-To: <20261014072109.1759502-20-ghahramani.navid@gmail.com>
MIME-Version: 1.0

Am Mittwoch, 14. Oktober 2026, 09:20:59 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb=20
Navid Ghahremani:

> +      - zte,zx29-qspi
> +      - zte,zx279128s-spifc

Unless there is a hardware difference that matters to the driver I think on=
e=20
compatible should be enough. Probably zte,zx-qspi. Although since this=20
controller is very specific for flash chips zte,zx-spifc or zte,spifc are w=
orthy=20
considerations too. As far as I can see this controller only has flash memo=
ry=20
ops and can't even send a generic byte stream.

Note that at least my board, and probably yours too, has a "normal" SPI=20
controller too. In my case it can talk to SPI displays or a SLIC analog pho=
ne=20
controller. It has a different hardware interface and needs a separate driv=
er.

> +
> +  clocks:
> +    items:
> +      - description: work clock, the source of the SPI clock
> +      - description: register (APB) clock
> +
> +  clock-names:
> +    items:
> +      - const: wclk
> +      - const: pclk
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names

I think the interrupt should be required by the binding too. The driver is=
=20
still free to ignore it, but the binding is supposed to describe the hardwa=
re,=20
not the driver.

My hardware has two DMA lines too. I don't know if they are always there. F=
or=20
pragmatic reasons (the DMA controller is its own beast and for usability le=
ss=20
important than the flash controller) I'd make the DMA properties optional.

--nextParttwTE2U3XQbmQGd0wk4ry0w
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmrP5v0bFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMywyAAoJED0TvMhUTxoi2R4QAJrkefuQh8NSuzy0O/W9
qb5I7KRk0N26kgWskLDtuWqXqefXm6Oskjmc8yQ9+nzbWVXGn79+aGItk3ttv1a0
nBkSRSt3U9zm5+vo5A7oOKaCEo3cjOEsMTDmu8Z5lJ66EAuNNIds3AM+/YR1nYuC
IdIUYdWcK0HlBqoq66pAD6/3xjRyVzlT7t4LBRmk+hC3cl+TrJM8O7weNidq7RiW
FGst++ElWV1RmZVgZTDmlBlf1ThJLV9v27LzOonW4u9hg2U3GOtobvV70QyFEVen
/ixuJyOsuo8lxFwl9SA9Xl7JNOMImNQ1tPFAPh2WiVW065ovdTUZ/3ElEz5AVOlZ
BjvU+eNAmGhWHsi9Ubwl8o08Bj45MVDaA4OONRzpzi3CyllYUuZr5UqS0aPRRk75
382FFCDCd+vW+K4sfgwqhxSV5X7BYnynfPuHWr6d0e97zg2tzXBbXHlP0XJEvozs
xS2pl76i+xFzPjQPyhtU0LFiYpGxYJwJg9oxjLa2IesafouvmcR7X18kp2VwfsjX
ZWsvHLrr80HevR6I1FXyt+qVO+WnaTiFoj2/Rw9mPSg5HT/EWkrUCgINZ+iwiVIS
TbFGV3QGFtV04PpdSY8i+hvcQBlE2Yyv/StywaqZEB0P65ZykVfI6JvDUFnkDzkL
utvIuPk6/MSMNwQBQIOwV7Bp
=7T89
-----END PGP SIGNATURE-----

--nextParttwTE2U3XQbmQGd0wk4ry0w--




