Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E1C310854DB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 09:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1gxzWH3BLaNkVhNWIYrhCBuNRvksYdyzaZYh9Ztxet4=; b=PcAQ3Xr1mp4M5r9Z7HDZyl9Dln
	Y9pQiV2u4lTUlUVreYNHPbd7yb8Ch1kA3u0GN3H3WyCS0DqpII+MFkS+DF/oCgiIWzJYBS9aWi/6Y
	MHGExdVJHUBiy6TzzRUbwTGfp8GjwpePZvqDIaI4JjTNxznHyp6aRvzAb7d3y3SV56oBVooWfyERM
	AEv9zbw0Gxw/WTKiBaA+vxZmfOB6P7FceZ/plgaf9P9VCHA+LHj6caH4+8HpgzKv3ZcF0WdL1SwdX
	pwt9pJyV478UoWbZwGCJINdQVdxUnInKZVntyODmkTJHqjDmavRKTsDj3gJ0D5eh9l6ekZewMLNpN
	PQCgAQOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2nID-000000089Ty-1k9E;
	Wed, 18 Mar 2026 09:34:21 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2nIA-000000089S6-0tZh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 09:34:20 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D1A0FC55069
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 09:34:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 605E56004F;
	Wed, 18 Mar 2026 09:33:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B61E11045072A;
	Wed, 18 Mar 2026 10:33:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773826437; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1gxzWH3BLaNkVhNWIYrhCBuNRvksYdyzaZYh9Ztxet4=;
	b=LWHA/kQguU697L9GowKQ/AxwVfWAMvEX9E8RbOhyjxnWLkypze7Sl4H6gK46tEFCUp+dKQ
	xIXvN8Il+nZwBLjU6/tNwpI6MS9TdAN7oYZy/p3cjeE+f2XcnjFt323tIEhBcVd+RcOgsr
	Ox3Lm4JUc6XP9ZqBiV3zQyDXgVxn+gIyaB0zmQBwyhjyNLWe2f+cA9YdhZ4H1DKX9vzH6l
	73HJkpQM6G/GVVuc0apBnRoRiWjpVa0zrZM9dde2J0yH6C65oLdcGOhD07feBdWb+Cbgv8
	7PuJ1GXy9nsRR1Ve7zZiChROBOeTGV/fANLMgIa1ey+jAEYdoWnWQI6zkoo61Q==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Li Jun <lijun01@kylinos.cn>, andrew@lunn.ch,
 sebastian.hesselbarth@gmail.com, linux@armlinux.org.uk,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lijun01@kylinos.cn
Subject: Re: [PATCH v4] arm: mvebu: fix null pointer when access
In-Reply-To: <20260318085923.2610585-1-lijun01@kylinos.cn>
References: <20260318085923.2610585-1-lijun01@kylinos.cn>
Date: Wed, 18 Mar 2026 10:33:53 +0100
Message-ID: <87a4w55vni.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_023418_535010_8AC4F1DE 
X-CRM114-Status: GOOD (  15.86  )
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

Hello Li Jun,

This patch looks very broken, see
https://sashiko.dev/#/patchset/20260318085923.2610585-1-lijun01%40kylinos.cn


> the kzalloc&kstrdup may return null pointer, will cause kernel panic.
>
> -Fix null pointer.

You could improve this commit log.

>
> Signed-off-by: Li Jun <lijun01@kylinos.cn>

When you iterate you should add a changelog here.

Gregory

> ---
>  arch/arm/mach-mvebu/board-v7.c      | 10 ++++++++++
>  arch/arm/mach-mvebu/coherency.c     |  6 ++++++
>  arch/arm/mach-mxs/mach-mxs.c        |  4 ++--
>  arch/arm/mach-versatile/versatile.c |  6 ++++++
>  4 files changed, 24 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/mach-mvebu/board-v7.c b/arch/arm/mach-mvebu/board-v=
7.c
> index 04ad651d13a0..a3b1aa48162b 100644
> --- a/arch/arm/mach-mvebu/board-v7.c
> +++ b/arch/arm/mach-mvebu/board-v7.c
> @@ -128,11 +128,21 @@ static void __init i2c_quirk(void)
>  		struct property *new_compat;
>=20=20
>  		new_compat =3D kzalloc(sizeof(*new_compat), GFP_KERNEL);
> +		if (!new_compat)
> +			return -ENOMEM;
>=20=20
>  		new_compat->name =3D kstrdup("compatible", GFP_KERNEL);
> +		if (!mew_compat->name) {
> +			kfree(new_compat);
> +			return -ENOMEM;
> +		}
>  		new_compat->length =3D sizeof("marvell,mv78230-a0-i2c");
>  		new_compat->value =3D kstrdup("marvell,mv78230-a0-i2c",
>  						GFP_KERNEL);
> +		if (!mew_compat->value) {
> +			kfree(new_compat);
> +			return -ENOMEM;
> +		}
>=20=20
>  		of_update_property(np, new_compat);
>  	}
> diff --git a/arch/arm/mach-mvebu/coherency.c b/arch/arm/mach-mvebu/cohere=
ncy.c
> index a6b621ff0b87..2c1668f3174c 100644
> --- a/arch/arm/mach-mvebu/coherency.c
> +++ b/arch/arm/mach-mvebu/coherency.c
> @@ -191,7 +191,13 @@ static void __init armada_375_380_coherency_init(str=
uct device_node *np)
>  		struct property *p;
>=20=20
>  		p =3D kzalloc(sizeof(*p), GFP_KERNEL);
> +		if (!p)
> +			return -ENOMEM;
>  		p->name =3D kstrdup("arm,io-coherent", GFP_KERNEL);
> +		if (!p->name) {
> +			kfree(p);
> +			return -ENOMEM;
> +		}
>  		of_add_property(cache_dn, p);
>  	}
>  }
> diff --git a/arch/arm/mach-mxs/mach-mxs.c b/arch/arm/mach-mxs/mach-mxs.c
> index 6e017fa306c8..16506d9392b4 100644
> --- a/arch/arm/mach-mxs/mach-mxs.c
> +++ b/arch/arm/mach-mxs/mach-mxs.c
> @@ -178,14 +178,14 @@ static void __init update_fec_mac_prop(enum mac_oui=
 oui)
>=20=20
>  		newmac =3D kzalloc(sizeof(*newmac) + 6, GFP_KERNEL);
>  		if (!newmac)
> -			return;
> +			return -ENOMEM;
>  		newmac->value =3D newmac + 1;
>  		newmac->length =3D 6;
>=20=20
>  		newmac->name =3D kstrdup("local-mac-address", GFP_KERNEL);
>  		if (!newmac->name) {
>  			kfree(newmac);
> -			return;
> +			return -ENOMEM;
>  		}
>=20=20
>  		/*
> diff --git a/arch/arm/mach-versatile/versatile.c b/arch/arm/mach-versatil=
e/versatile.c
> index f0c80d4663ca..07f2a299c770 100644
> --- a/arch/arm/mach-versatile/versatile.c
> +++ b/arch/arm/mach-versatile/versatile.c
> @@ -147,7 +147,13 @@ static void __init versatile_dt_pci_init(void)
>  		goto out_put_node;
>=20=20
>  	newprop->name =3D kstrdup("status", GFP_KERNEL);
> +	if (!newprop->name)
> +		goto out_put_node;
> +
>  	newprop->value =3D kstrdup("disabled", GFP_KERNEL);
> +	if (!newprop->value)
> +		goto out_put_node;
> +
>  	newprop->length =3D sizeof("disabled");
>  	of_update_property(np, newprop);
>=20=20
> --=20
> 2.25.1
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

