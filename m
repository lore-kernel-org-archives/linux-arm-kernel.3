Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9277C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 10:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gwcOaLjnfGRXuIW66wEpFWYwG1/TE5MickAibh96L3s=; b=Bf4V0cvRstzQ/xsafr8RBmkFvo
	ERyfQQvJxu/K+9ekhiJmeRVCYPNnq+rzlruDGnJx24wEYB086kEbI/VjQF2XpI4Gi78jZyaDTKmrq
	XVoCKtNfeYM45WhbDQXKIPHinFK4WTU7E7yACyW5P54G6+dpIWl9oEmoMbWACXrfd7Xg53RUI3ISy
	tebbpmrkCdg7KpWeHWb29ds2en+ck56NXVg4EuUSmzLDU2qxWLKLmtLRjhHhgzoxgiB8qUhJLjSqV
	fS4KRWRMUar2FqA/FxoG7azmvD/3tlSFOC7lIqt/hUHpAUfyIbljmA9MmTEhg+NQLokAAWSTP6l9b
	6+N/6JIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x24IC-0000000H1cU-3w5G;
	Thu, 03 Sep 2026 10:03:36 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x24IA-0000000H1au-0rIg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 10:03:35 +0000
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 83FE620177F;
	Thu, 03 Sep 2026 12:03:32 +0200 (CEST)
Message-ID: <9d734e555e9f074ffd93791a73c054ce92212f67.camel@pengutronix.de>
Subject: Re: [PATCH v3 07/12] reset: Add
 reset_control_get_from_provider_exclusive()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stephen Boyd	 <sboyd@kernel.org>, Brian Masney
 <bmasney+clk@redhat.com>, Jerome Brunet	 <jbrunet+clk@baylibre.com>, Sudeep
 Holla <sudeep.holla@kernel.org>, Cristian Marussi
 <cristian.marussi@arm.com>, Saravana Kannan <saravanak@kernel.org>, Ulf
 Hansson	 <ulfh@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Marek
 Vasut	 <marek.vasut+renesas@mailbox.org>, Bartosz Golaszewski	
 <bartosz.golaszewski@oss.qualcomm.com>, Konrad Dybcio	
 <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>,
 Vinod Koul <vkoul@kernel.org>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Kuninori Morimoto	
 <kuninori.morimoto.gx@renesas.com>, =?ISO-8859-1?Q?Cl=E9ment?= Le Goffic	
 <clegoffic@baylibre.com>
Cc: devicetree@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 03 Sep 2026 12:03:32 +0200
In-Reply-To: <619a6e41495adfdae3e2e6c0fee97e0550a5c404.1788338320.git.geert+renesas@glider.be>
References: <cover.1788338320.git.geert+renesas@glider.be>
	 <619a6e41495adfdae3e2e6c0fee97e0550a5c404.1788338320.git.geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_030334_389802_37B39BB4 
X-CRM114-Status: GOOD (  25.33  )
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

On Mi, 2026-09-02 at 13:29 +0200, Geert Uytterhoeven wrote:
> When stacking two reset controllers, the upper one should go through the
> proper channels: request exclusive reset controls and use them via the
> reset_control_*() APIs.  However, unlike the clock subsystem, which has
> of_clk_get_from_provider(), the reset subsystem does not offer a way to
> lookup and obtain a reset from a reset provider.
>=20
> Hence add a public helper reset_control_get_from_provider_exclusive()
> to lookup and obtain an exclusive reference to a reset controller, based
> on the recently introduced __reset_control_get_from_provider() helper.
> This will be used by the R-Car X5H Module Controller driver.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3:
>   - Replace reset_controller_get_provider() by
>     reset_control_get_from_provider_exclusive(),
>   - Add kerneldoc,
>=20
> v2:
>   - No changes.
> ---
>  drivers/reset/core.c  | 37 ++++++++++++++++++++++++++++++++-----
>  include/linux/reset.h |  8 ++++++++
>  2 files changed, 40 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/reset/core.c b/drivers/reset/core.c
> index 8af7cd2e8a5029df..6d4c95b3edb18248 100644
> --- a/drivers/reset/core.c
> +++ b/drivers/reset/core.c
> @@ -1141,6 +1141,7 @@ __reset_control_get_from_provider(const struct fwno=
de_reference_args *args,
>  				  bool gpio_fallback,
>  				  enum reset_control_flags flags)
>  {
> +	struct fwnode_handle *fwnode =3D consumer ?: args->fwnode;
>  	struct reset_control *rstc =3D ERR_PTR(-EINVAL);
>  	struct reset_controller_dev *rcdev;
>  	int rstc_id =3D -EINVAL;
> @@ -1154,18 +1155,26 @@ __reset_control_get_from_provider(const struct fw=
node_reference_args *args,
>  	if (WARN_ON(args->nargs !=3D rcdev->fwnode_reset_n_cells))
>  		return ERR_PTR(-EINVAL);
> =20
> -	if (rcdev->of_xlate && is_of_node(consumer)) {
> -		struct device_node *np =3D to_of_node(consumer);
> +	if (rcdev->of_xlate && is_of_node(fwnode)) {
> +		struct device_node *np =3D to_of_node(fwnode);
>  		struct of_phandle_args of_args;
>  		int ret;
> =20
> -		ret =3D of_parse_phandle_with_args(np,
> +		if (consumer) {
> +			ret =3D of_parse_phandle_with_args(np,
>  					 gpio_fallback ? "reset-gpios" : "resets",
>  					 gpio_fallback ? "#gpio-cells" : "#reset-cells",
>  					 gpio_fallback ? 0 : index,
>  					 &of_args);
> -		if (ret)
> -			return ERR_PTR(ret);
> +			if (ret)
> +				return ERR_PTR(ret);
> +		} else {
> +			of_args.np =3D of_node_get(np);
> +			of_args.args_count =3D args->nargs;
> +
> +			for (unsigned int i =3D 0; i < args->nargs; i++)
> +				of_args.args[i] =3D args->args[i];

This should error out if args->args[i] > U32_MAX.

> +		}
> =20
>  		rstc_id =3D rcdev->of_xlate(rcdev, &of_args);
>  		of_node_put(of_args.np);
> @@ -1257,6 +1266,24 @@ struct reset_control *__reset_control_get(struct d=
evice *dev, const char *id,
>  }
>  EXPORT_SYMBOL_GPL(__reset_control_get);
> =20
> +/**
> + * reset_control_get_from_provider_exclusive - Lookup and obtain an excl=
usive
> + *					       reference to a reset controller.
> + * @args: Reference to the reset controller provider with all the args l=
ike
> + *	  reset number

It is implied, but should this explicitly mention that this must not be
a reference to a GPIO provider?

> + *
> + * Returns a struct reset_control or IS_ERR() condition containing errno=
.
> + * If this function is called more than once for the same reset control =
it will
> + * return -EBUSY.
> + */
> +struct reset_control *
> +reset_control_get_from_provider_exclusive(const struct fwnode_reference_=
args *args)
> +{
> +	return __reset_control_get_from_provider(args, NULL, 0, false,
> +						 RESET_CONTROL_EXCLUSIVE);
> +}
> +EXPORT_SYMBOL_GPL(reset_control_get_from_provider_exclusive);

regards
Philipp

