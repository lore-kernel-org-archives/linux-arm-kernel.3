Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF4CC19F2E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 16:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/KHeoNLpbwWVmI8VTFHd3vA+lQd9P18on6Ecq2tweso=; b=JubS0AuKuKTUhjqK1Sgn9u4jC+
	hBbSx9Szqgg4zKw6MDP8YhXdrYajkdE6nbissc/a8orlJZSODzfHogu6aUhYlONhaf/kvT8sQh1ZZ
	sICL0OzanINYDN34woFi03SRiQRPU+BIoKssIXNasBowoekzmE7QP7Cqz8lsvbzI2oojwXoBr2Hc8
	WEK6aoDXxVRQvA4qE+y3ieTnI9vRylihzSNLZPqtgQr4L5gm0ZvfmW5GnDeFp1kIbfyv3US2LF4e4
	NSSDhmDUD/mWVzsLLpe0Pof1xdQqR/8KEgtgq6qdcoK604mlTGkD6eLmNJs/yv5kGJfXJhOIlKfG4
	DU1F2bPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnKN5-00000004YCU-1R6z;
	Wed, 26 Feb 2025 16:34:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnKKp-00000004XUu-24Ub
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 26 Feb 2025 16:32:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/KHeoNLpbwWVmI8VTFHd3vA+lQd9P18on6Ecq2tweso=; b=W+yVu8uIK6fvbLLsrKHeDfdz6T
	1yjeglXkKytyJUFs8sNXMQDrZeyOkjLveW2c+2/bv8Z1lohwR+md3bgbxs7hMGzl2Qb9WfiB4NW1Y
	E4a24LKGs3Yaa2TTq2wEIsdkvMJMosQ+hZGLdC5CelIHERU/O9gxlxhgBqlyjS0/EJUZICLbjGC3y
	Vyj0BD6ItauFMTeqUDEZ4uh84OUFFhFPz/+IbrUmKBKWxdTBS04NzDFtlmhsZZMfCoXBXRuqe6GuF
	JE3pHNSxRHpVBK/Zu4YQy8NIaag8xPdJJI5FyiykYMc3k9hwxgP4suiwG9BO3BwqimcIWvC/sugZM
	XYD5oHFA==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnKKm-00000003edI-0djX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 16:32:33 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tnKKd-0005Fo-3P; Wed, 26 Feb 2025 17:32:23 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tnKKc-002yqg-2M;
	Wed, 26 Feb 2025 17:32:22 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tnKKc-000CSv-27;
	Wed, 26 Feb 2025 17:32:22 +0100
Message-ID: <5cc5cd05e0a481773212fff0bce574dcfea3f74d.camel@pengutronix.de>
Subject: Re: [PATCH v3] reset: mchp: sparx5: Fix for lan966x
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Horatiu Vultur <horatiu.vultur@microchip.com>, 
	Steen.Hegelund@microchip.com, daniel.machon@microchip.com, 
	UNGLinuxDriver@microchip.com, herve.codina@bootlin.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 26 Feb 2025 17:32:22 +0100
In-Reply-To: <20250226144645.1950451-1-horatiu.vultur@microchip.com>
References: <20250226144645.1950451-1-horatiu.vultur@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_163232_298979_74EA23AD 
X-CRM114-Status: GOOD (  25.45  )
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

On Mi, 2025-02-26 at 15:46 +0100, Horatiu Vultur wrote:
> With the blamed commit it seems that lan966x doesn't seem to boot
> anymore when the internal CPU is used.
> The reason seems to be the usage of the devm_of_iomap, if we replace
> this with of_iomap, this seems to fix the issue as we use the same
            ^^^^^^^^
The is not accurate anymore.

> region also for other devices.
>=20
> Fixes: 0426a920d6269c ("reset: mchp: sparx5: Map cpu-syscon locally in ca=
se of LAN966x")
> Reviewed-by: Herve Codina <herve.codina@bootlin.com>
> Tested-by: Herve Codina <herve.codina@bootlin.com>

Is this still correct?

> Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
> ---
> v2->v3:
> - forward error from of_address_to_resource
> - use devm_ioremap instead of_iomap
> v1->v2:
> - make sure to use iounmap when driver is removed
> ---
>  drivers/reset/reset-microchip-sparx5.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/reset/reset-microchip-sparx5.c b/drivers/reset/reset=
-microchip-sparx5.c
> index aa5464be7053b..176b3f46e9243 100644
> --- a/drivers/reset/reset-microchip-sparx5.c
> +++ b/drivers/reset/reset-microchip-sparx5.c
> @@ -8,6 +8,7 @@
>   */
>  #include <linux/mfd/syscon.h>
>  #include <linux/of.h>
> +#include <linux/of_address.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/property.h>
> @@ -72,14 +73,19 @@ static struct regmap *mchp_lan966x_syscon_to_regmap(s=
truct device *dev,
>  						    struct device_node *syscon_np)
>  {
>  	struct regmap_config regmap_config =3D mchp_lan966x_syscon_regmap_confi=
g;
> -	resource_size_t size;
> +	struct resource res;
>  	void __iomem *base;
> +	int err;
> +
> +	err =3D of_address_to_resource(syscon_np, 0, &res);
> +	if (err)
> +		return ERR_PTR(err);
> =20
> -	base =3D devm_of_iomap(dev, syscon_np, 0, &size);
> -	if (IS_ERR(base))
> -		return ERR_CAST(base);

It would be nice to add a comment here that devm_of_iomap() can't be
used because the resource is shared with other devices. Do you know
which ones?

Otherwise, this looks good to me.


regards
Philipp

