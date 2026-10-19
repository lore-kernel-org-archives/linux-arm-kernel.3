Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16946CCF2E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 12:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EDFACtr3joZkKek48vhVDUWWppSHXimH9DiDBJeDnxE=; b=s+XIbPf/SOzLXyFYexsZLtJ5Am
	/APyCO9f/RfYRZggsJlHkyuWRNbq1EoYHprPj2URqDTqOef9D2Ju93NYAnZRmKBcxFaxkfjHq2pcg
	NTZDm55F+Pfq0doDaKHhE7QyFTZ6cQk4+sE716gsx1ZngvXPnIuodt95SYByRHsV46yg1GcdbFW/Z
	X1LDfNluRnQ5tGPg2zY/Wz/WS57tS3c5rqDXYD2XUToZe7yewEzd0uWzMa7Xw7zZnqAg1fDyJcGHo
	jDrlzBnvrvRKc+JmfKj7tPm1GP+QloRQkijr8Af4Z9oa6i9xxlncW/HnXZkkpcKw7J+d7mFZ+F2WN
	38HfRYKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xImtj-00000007RQ0-3eRY;
	Mon, 19 Oct 2026 12:55:27 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xImtf-00000007RO6-0Wdh;
	Mon, 19 Oct 2026 12:55:24 +0000
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 631DE201B55;
	Mon, 19 Oct 2026 14:55:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792414521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EDFACtr3joZkKek48vhVDUWWppSHXimH9DiDBJeDnxE=;
	b=gepNrz1U6+E8DSXqJNpla4aXDaQwIAZnouL+bQeaRSWSAnv2PkKkBDIfOu+/sUKzcSIb69
	Vb3gNn7tFjTsoSAdFA9FAC1jK5tMR/cYy8zNGtOj9R0kLVV9AEV0atx2vQR0hkuIRecLCo
	GGZg/l/BkkQXqi2qah6aklRy1TpfVXdcwjb3RnHha1JokSF6VVy29R9/r1XK7QDjXBlpfy
	ud42s54DCGMykv2BFWruIe/Oa3Kp5kB5gJplt96g1mFC1Ka6F9cijJo8605D3aJ0AD6T7w
	URe84NPQPBiddAqyK5z3YB3p1mnPJgINxVlBVF0vS0JPFRssVrf6vtTvEjrolQ==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1792414521; a=rsa-sha256;
	cv=none;
	b=M+hY0bCqbBjAqkJiO2Dr0W85cayLgKDgnezkb8w7P8Kbnfem5o4rkdVs+OO5MYoRU1GhyY
	1emQfM7kAJ7J/0Du2oa+qljCtBrlE+muxwidb+1I0Rzp9det36UkWsn9F72JYTjMFicR5r
	3BDmGClKSVFcl4ZxDKWlQVNT8oPYgu0pvsvb9oPfch6QM97vUbkokmNUl2y8ZccmpwJw52
	T4X/FIfYiE4E11R0m9JaQXOccNBdLul94VMjlfthBlzujHddG61+0ArW8R8qbgYuawyALt
	ZIB+uJ68KX3UzMV7mb0bw/h/aEZJsNH/xmJBJljzNxVETGf7yhI+THk8vvkiMQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792414521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EDFACtr3joZkKek48vhVDUWWppSHXimH9DiDBJeDnxE=;
	b=SUHVSVb/QsnfjboxpMPWcd1QAf94pumlmEDKgHK+WWDxGpOuKE7pQW7TXFJWTXqcf/dmQH
	YG7xgdA+2RnWlMj8FDVd6/IZ93shS0Si6MPewJztTSRrEq+tSGSKpM0JdzGNpYn+Y0Ejhc
	osYs7kdzZXtj9PuQBcmmrSr7QJd8q0Ol9Pij963siJ6W3WM+bT2Wwhb0dncClsMgGvTRwo
	kI3VVPwSQ+xfY5gum4LASWgNwQxbe7edm/DEItkd1W0C7MIx5tjqhrvTuLsqYM8t5jya54
	8aomFz9pg01MLE9NmR6a0PX/m0w0TVzYWCIC+RWrNEhYzyU1v+04FQiPExG6Zw==
Message-ID: <62860351b9ae360c174d36dd54d4110417f395ad.camel@pengutronix.de>
Subject: Re: [PATCH 05/20] i3c: dw: switch to array-based exclusive reset
 control
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Jisheng Zhang <jszhang@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stephen Boyd	 <sboyd@kernel.org>, Brian Masney
 <bmasney+clk@redhat.com>, Jerome Brunet	 <jbrunet+clk@baylibre.com>, Andi
 Shyti <andi.shyti@kernel.org>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, Lee Jones
 <lee@kernel.org>,  Linus Walleij <linusw@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,  Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Sebastian
 Hesselbarth	 <sebastian.hesselbarth@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-i3c@lists.infradead.org, mfd@lists.linux.dev,
 linux-gpio@vger.kernel.org, 	linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org
Date: Mon, 19 Oct 2026 14:55:21 +0200
In-Reply-To: <20260929061417.20733-6-jszhang@kernel.org>
References: <20260929061417.20733-1-jszhang@kernel.org>
	 <20260929061417.20733-6-jszhang@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_055523_325365_771D7FCB 
X-CRM114-Status: GOOD (  18.55  )
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

On Di, 2026-09-29 at 14:14 +0800, Jisheng Zhang wrote:
> The Synopsys DesignWare I3C master controller can have multiple reset
> lines, such as a core reset and APB reset.
>=20
> Refactor the driver to use devm_reset_control_array_get_exclusive()
> instead of a single named reset handle. This automatically manages all
> resets allocated to the device node sequentially.

Note that this does not guarantee any particular order. Are you sure
that this is good enough for all implementations of the DW I3C core?

Otherwise it may be wise to at least specify the names in binding, to
be able to switch to the bulk API or individual control later, if
needed.

> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  drivers/i3c/master/dw-i3c-master.c | 24 ++++++++++++++++++------
>  drivers/i3c/master/dw-i3c-master.h |  2 +-
>  2 files changed, 19 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i=
3c-master.c
> index 4563d8761ba0..1c6c870f5bb3 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -1657,6 +1657,11 @@ static const struct dw_i3c_platform_ops dw_i3c_pla=
tform_ops_default =3D {
>  	.set_dat_ibi =3D dw_i3c_platform_set_dat_ibi_nop,
>  };
> =20
> +static void dw_i3c_resets_assert(void *data)
> +{
> +	reset_control_assert(data);
> +}
> +
>  int dw_i3c_common_probe(struct dw_i3c_master *master,
>  			struct platform_device *pdev)
>  {
> @@ -1696,10 +1701,17 @@ int dw_i3c_common_probe(struct dw_i3c_master *mas=
ter,
>  	if (IS_ERR(master->pclk))
>  		return PTR_ERR(master->pclk);
> =20
> -	master->core_rst =3D devm_reset_control_get_optional_exclusive_deassert=
ed(&pdev->dev,
> -										NULL);
> -	if (IS_ERR(master->core_rst))
> -		return PTR_ERR(master->core_rst);
> +	master->resets =3D devm_reset_control_array_get_optional_exclusive(&pde=
v->dev);
> +	if (IS_ERR(master->resets))
> +		return PTR_ERR(master->resets);
> +
> +	ret =3D reset_control_deassert(master->resets);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D devm_add_action_or_reset(&pdev->dev, dw_i3c_resets_assert, mast=
er->resets);
> +	if (ret)
> +		return ret;

This looks like we are missing
devm_reset_control_array_get_optional_exclusive_deasserted().

regards
Philipp

