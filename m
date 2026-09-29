Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61FDCC9832A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 15:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bK1kRsPsOXdZFtj24JVUR5GYlNpzvwaq05tohnScRrQ=; b=Da/gp3xZZABQCcrsM4SHdjTaf2
	sL71sVUY8aJu2zjhjen3VeV9d5XT/ZprKSDRCymJwI8m3m3WIGjuM4UI+R5+EhmeYP3TzHW9cY4zW
	6HZVf45gqoSPkZQ1HF8YPCPLRuv2U0AFz84NiU/lK4++q9jXMSirb5tjkO1UDcDs0LP6bMdV38JBq
	fYb+MbcFKh52obj2bT3TIfK4oq8MA4G9Zvr5LBinS4LGl1jL56YBS8ZUssWHFSqqzu+CDL0aHA/5G
	PGBQ8iUdKKpQ/vSElAmLy9js+uUoRsXGDzxaXl/0pF+q3VNihJsn6eR0FPFIIfnYvRhMsDre0iACn
	K6gkIfqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZr9-00000003wqH-1LxL;
	Tue, 29 Sep 2026 15:34:59 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZr6-00000003wpN-2iUs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 15:34:58 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so23960645e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 08:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790696094; x=1791300894; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bK1kRsPsOXdZFtj24JVUR5GYlNpzvwaq05tohnScRrQ=;
        b=hd7gNXgxuw8C4BCeP/pYEdK5RfZTmrBALhwC2gidfJCRJg0bsUduUvV5T+bhpSs+TN
         hh419ABlIRcxAp92syhxOyidc79yABIyT+i6hW3CP5tfpK7WBbN2GKP60JLlJeN6gKRl
         8IlTyN7sf61TTQR3OeO3g9OJVL1ZzStno2Cn+UJ1/5Sal9NNUuhY1qFxMSgg5u4JOhdM
         I2i1Uao21CYTtHefrSzD/e3F4eUeZH0hODl1Qhu0coJ9z1H10IBpoq1hDqWsuhU4jnFD
         kLJLIcQN5nBT3G55srQsR9cd7VtssqpHLoQEE54GPoBTi6Bt2N1NN2jPw4olktodcXoO
         5D3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790696094; x=1791300894;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bK1kRsPsOXdZFtj24JVUR5GYlNpzvwaq05tohnScRrQ=;
        b=BWmIpseeJd+6NtG2Fvkij7rWa1xfYXHfaa9mqWeLdZYwGcUnPdALpPG09QBb/oeInO
         1jxV46wWymyRewXYiSWr0yhaI4OeWQpZZzMipKVJ+z06fXjfehjgfyFkNbmQN3T1e0Hp
         eirKYibQywei/QLyS/tX7TDs8qgHfSpuPPvw4loY+iauxHdaar8kA4myY8Ql6wOhy3ZF
         PvRJXWW0t+hc8EXWCJMHu7XMs2PXZTin8A/smhMSC/MD6HdC8T59MxYqb9CBc3pFXo9I
         UdeFDJCW5f44M/QdcNhEvwmFLpRUudcvQByKCyaN6lT8+owLsFdcN0XCOy/Rabg8Vqke
         uhlQ==
X-Forwarded-Encrypted: i=1; AKwUvBwRr3rQdc+5MubFtTauL/Oif3Ow2u2K0GMckd0DfaKpS2UpaNCwGFU+7JJ9FmnzbYWydMlFUAW/xnp5QDY/e5Vg@lists.infradead.org
X-Gm-Message-State: AFuF++kmo/i/YDKAq7U3XJ/xyd0wao28XcUfnJ18lHGfaXOH0nC9xvfA
	Igwhhs7pJ8Z6RIZOvzM3tC/HVTC90tMmsyaRK+/9PHf1qJwONS6+dDL5ac4rGRUY+Nw=
X-Gm-Gg: AYBFou2OFERWFawFNsfOvEBLZS58HPc1XyPedqq/KgIMtdp7oJCJBDbuThtDcRJiRpC
	laT4B/XK9lTPLdsniKSHcU4KddH0+8rE0nJ5JzdN4vi/UaFINoteY/2qc2BlCQLYTdEBzif69DG
	y9IwRbN0nUa8J77UM3Hfw/ivA5dEbRHLDdVNs8T0GEIhQ2R84Ya/Y0wdgoxf++vCRTX8E0S4CDG
	0DgSYmYrU6inlgynwGkrqFoEyiag1aK9pw0VMS9VC9MDLARSh1ED7xrCZ9h9aNfqFae7ziAd//g
	IqeUXwE+u10KQpnX1fgrAzKj3iTVjSjhyIqvBAh5ZqPEIiGmFpOOu5t+pV/h5ytsWMZf2LCWvCN
	ppbuGWGGjlnI9vUuij4pC6KxIxAhyv5qM8qQWTzSCMk8Gvmez+SPhphiml5VFL3pV/OF4VCe+D9
	+Jnzu/SZ+nZ08UoqwwHsyQ6F5gSJ+jT98L+zt9uogwuaSZrLppm1PrnjHWLjQFWnwG9Md8Yst2d
	YRLqGHWkRiIEIv8tN7AjiLmjQO97d20wY+k6RbMkuuIk7MFyyTJE/5yqxue95pkTBmhBwzg
X-Received: by 2002:a05:600c:8b6c:b0:49f:ffd0:9a9a with SMTP id 5b1f17b1804b1-49fffd09b09mr145822235e9.25.1790696094266;
        Tue, 29 Sep 2026 08:34:54 -0700 (PDT)
Received: from localhost (p200300f65f19a904123cb16e9a8bb736.dip0.t-ipconnect.de. [2003:f6:5f19:a904:123c:b16e:9a8b:b736])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a00d0f442dsm81897025e9.13.2026.09.29.08.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:34:53 -0700 (PDT)
Date: Tue, 29 Sep 2026 17:34:52 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, Lee Jones <lee@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, linux-i3c@lists.infradead.org, 
	mfd@lists.linux.dev, linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 14/20] pinctrl: berlin: support Synaptics SL261X SoCs
Message-ID: <arvZnEsAdJ5R9mBi@monoceros>
References: <20260929061417.20733-1-jszhang@kernel.org>
 <20260929061417.20733-15-jszhang@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qdr5pu2vmyb2k4sk"
Content-Disposition: inline
In-Reply-To: <20260929061417.20733-15-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_083456_695912_2582C0C4 
X-CRM114-Status: GOOD (  18.86  )
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


--qdr5pu2vmyb2k4sk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 14/20] pinctrl: berlin: support Synaptics SL261X SoCs
MIME-Version: 1.0

Hello,

On Tue, Sep 29, 2026 at 02:14:11PM +0800, Jisheng Zhang wrote:
> +#include <linux/mod_devicetable.h>

Please rely on <linux/platform_device.h> to pull in the definition of
of_device_id and drop the inclusion of <linux/mod_devicetable.h>.=20

Including <linux/mod_devicetable.h> creates a bunch of unneeded
dependencies on subsystems you will never need in this driver.

> [...]
> +static const struct of_device_id sl261x_pinctrl_match[] =3D {
> +	{
> +		.compatible =3D "syna,sl261x-soc-pinctrl",
> +		.data =3D &sl261x_soc_pinctrl_data,
> +	},
> +	{
> +		.compatible =3D "syna,sl261x-system-pinctrl",
> +		.data =3D &sl261x_sysmgr_pinctrl_data,
> +	},
> +	{}

Please use { } (with a space) to match the most common style for these
arrays.

> +};
> +MODULE_DEVICE_TABLE(of, sl261x_pinctrl_match);
> +
> +static int sl261x_pinctrl_probe(struct platform_device *pdev)
> +{
> +	return berlin_pinctrl_probe(pdev, device_get_match_data(&pdev->dev));
> +}
> +
> +static struct platform_driver sl261x_pinctrl_driver =3D {
> +	.probe	=3D sl261x_pinctrl_probe,

Not a fan on aligning the =3D, still more if it's done inconsistently in a
single struct. If you ask me, just use a single space before the =3D.

> +	.driver	=3D {
> +		.name =3D "sl261x-pinctrl",
> +		.of_match_table =3D sl261x_pinctrl_match,
> +	},
> +};
> +module_platform_driver(sl261x_pinctrl_driver);

Best regards
Uwe

--qdr5pu2vmyb2k4sk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmq72pkACgkQj4D7WH0S
/k6pzAf+PhNU58V7LTtOu13Q7FpXZuGYfITE5o06ZTODsXEE48OgW8ZdwP7VY1Rr
OASvkk8I0b2igulZlmDQF6y/Uo8vr7BFFtBnDNLOlskSrwtGlRdlA+OxtblggT3/
ZtDs4aXeswkygIA/WvR5ypgSrpFZbf3ulmLpJxoG7wyWd2z20AE0RMgHMxWnRRRK
u1HPQWxqFS3vW0NsDLIGQ8yxAhuvL3DkQrfMVQONTNlqb9YbbJ5Ei9pHPDcYiggC
2NvAR0+Iczq3x7p1plWpq1ism4qNBPatzP3vOw+KMQXMHzNrOEICQ0lR54jlGDtd
U3aErEDsuZZpCY/HwikxQiabfzr3uA==
=ieOW
-----END PGP SIGNATURE-----

--qdr5pu2vmyb2k4sk--

