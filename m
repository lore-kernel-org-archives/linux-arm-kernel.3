Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30602C83038
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 18:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EqVl9Ee+gdgIYW4U9KBsQA5cjlpA6HFFkBsSrdowJh4=; b=jbKZoHcDSRFfa8rB6guxuPuahD
	hNBZMiFGSJLsVcLNmE0s/iSKksLvzrlVHssy0AmjqNVzb5/KzPROy1pRSwr4wyGz7d2enbjNdr1f2
	qAvFCYSLYU502TX6XKDplhVsMFeMWCI3CtmqY90NQ5X3tb0baEjqvWzVSHCQv3uJnTIv1zBwK9lyN
	zcKSnC6ClSxtR15WOfcVu0pvbWEl69weJa7eOCZoJ6KqiKJlenRUNG8lRJ0tB09SFnjJ4+cnXzEOn
	d+iZYOQusVdWqoIVhpFwY3G72T5GfWmYwXP/yK5JsmEnFfjU3OTyFPJz7A+1+UzEgwixdItBXKCnm
	CY1C8SuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX25k-00000009Ffp-0hbv;
	Wed, 02 Jul 2025 18:21:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX21R-00000009FBJ-0bSW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 18:17:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 370CC45EDB
	for <linux-arm-kernel@lists.infradead.org>; Wed,  2 Jul 2025 18:17:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 149ACC4CEEE
	for <linux-arm-kernel@lists.infradead.org>; Wed,  2 Jul 2025 18:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751480247;
	bh=VOX4noNm5hdr9//VV8fJuTw8qZlpN0KBl19xUJwzM0g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WbEdL3RAX7oh0LBqkU3I3xP9rxn+OnYM54L831FAt+pVpseWAnxG9do6M0hFrTw6V
	 JzhR5pI+UY5MbjHtc84RUu8yHKAJpECxGX6va3IKYIH9a1q1mwa1q02Vlfe6zP4Eyc
	 ZzcgLvQlzIW9LnRbQuE1v5pOnJknFded/cQTn/r9/hXtS0sBrH7BNZzjGiHYZJwMmz
	 FRev7V7GBEpBFphCi9Oa0z1+Y8tLKN53iH/iqz18S90j8xm4UZj3NGYVkVYRAO6BfD
	 6GxrzN9gjLGGChImowxx6JhrruR0uBxUHLLEb8FSoGwAiLoFd89GPoSmXzfsRGa8VW
	 DHbOiS6ok/W4A==
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-73a43d327d6so2464934a34.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 11:17:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWF6n7tVWSz4Ebmp5cPwIJjpth32Uc9L+g7/5h77O/DDQalR/VfdhC3WlaxjWnhenVM+u/KL1/iDYfoCm+Gj5GK@lists.infradead.org
X-Gm-Message-State: AOJu0YzgPsq7emxnamH8gONWslwryWSTA1SfUN8h6zVyBu9pr8YdnD4u
	83z+rvQ8bax9kPQxU3PngSRKeuvKrglGPo6552nDUMWtcN1Ldv1Zs83H08a1drBByLSnNGFJk6m
	3n4piRm3auf8jJ9c1gB/gENZJhk9i1FE=
X-Google-Smtp-Source: AGHT+IFE15rcuOH+m5poFA5DuefTIa1FPtQnOGtl5tYQRl/dPKV6mXQEiFHJyvorY6w4piWgIZxb7JHJlha8CbYbuSQ=
X-Received: by 2002:a05:6830:8008:b0:72b:ae42:3530 with SMTP id
 46e09a7af769-73b4d10411fmr2321774a34.15.1751480246377; Wed, 02 Jul 2025
 11:17:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250613134817.681832-1-herve.codina@bootlin.com> <20250613134817.681832-3-herve.codina@bootlin.com>
In-Reply-To: <20250613134817.681832-3-herve.codina@bootlin.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 2 Jul 2025 20:17:15 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0iaqT5VY3=UCkTGQKjE7thEPmsSqsrEw9ntWEpZ6bNR3A@mail.gmail.com>
X-Gm-Features: Ac12FXwDgJ7Vxx3Bq6Wnh6b7GRhQ7F_SCrOgcKmm9L_ptDl7NqzS0VvNcXasFf0
Message-ID: <CAJZ5v0iaqT5VY3=UCkTGQKjE7thEPmsSqsrEw9ntWEpZ6bNR3A@mail.gmail.com>
Subject: Re: [PATCH v3 02/28] driver core: Rename get_dev_from_fwnode()
 wrapper to get_device_from_fwnode()
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, 
	Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, 
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Wolfram Sang <wsa@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Davidlohr Bueso <dave@stgolabs.net>, 
	Dave Jiang <dave.jiang@intel.com>, Alison Schofield <alison.schofield@intel.com>, 
	Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-cxl@vger.kernel.org, Allan Nielsen <allan.nielsen@microchip.com>, 
	Horatiu Vultur <horatiu.vultur@microchip.com>, 
	Steen Hegelund <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_111729_231411_E3DDDFA3 
X-CRM114-Status: GOOD (  23.61  )
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

On Fri, Jun 13, 2025 at 3:48=E2=80=AFPM Herve Codina <herve.codina@bootlin.=
com> wrote:
>
> get_dev_from_fwnode() calls get_device() and so it acquires a reference
> on the device returned.
>
> In order to be more obvious that this wrapper is a get_device() variant,
> rename it to get_device_from_fwnode().
>
> Suggested-by: Mark Brown <broonie@kernel.org>
> Link: https://lore.kernel.org/lkml/CAGETcx97QjnjVR8Z5g0ndLHpK96hLd4aYSV=
=3DiEkKPNbNOccYmA@mail.gmail.com/
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Saravana Kannan <saravanak@google.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/base/core.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index cbc0099d8ef2..36ccee91ba9a 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -1881,7 +1881,7 @@ static void fw_devlink_unblock_consumers(struct dev=
ice *dev)
>         device_links_write_unlock();
>  }
>
> -#define get_dev_from_fwnode(fwnode)    get_device((fwnode)->dev)
> +#define get_device_from_fwnode(fwnode) get_device((fwnode)->dev)
>
>  static bool fwnode_init_without_drv(struct fwnode_handle *fwnode)
>  {
> @@ -1891,7 +1891,7 @@ static bool fwnode_init_without_drv(struct fwnode_h=
andle *fwnode)
>         if (!(fwnode->flags & FWNODE_FLAG_INITIALIZED))
>                 return false;
>
> -       dev =3D get_dev_from_fwnode(fwnode);
> +       dev =3D get_device_from_fwnode(fwnode);
>         ret =3D !dev || dev->links.status =3D=3D DL_DEV_NO_DRIVER;
>         put_device(dev);
>
> @@ -1960,7 +1960,7 @@ static struct device *fwnode_get_next_parent_dev(co=
nst struct fwnode_handle *fwn
>         struct device *dev;
>
>         fwnode_for_each_parent_node(fwnode, parent) {
> -               dev =3D get_dev_from_fwnode(parent);
> +               dev =3D get_device_from_fwnode(parent);
>                 if (dev) {
>                         fwnode_handle_put(parent);
>                         return dev;
> @@ -2016,8 +2016,8 @@ static bool __fw_devlink_relax_cycles(struct fwnode=
_handle *con_handle,
>                 goto out;
>         }
>
> -       sup_dev =3D get_dev_from_fwnode(sup_handle);
> -       con_dev =3D get_dev_from_fwnode(con_handle);
> +       sup_dev =3D get_device_from_fwnode(sup_handle);
> +       con_dev =3D get_device_from_fwnode(con_handle);
>         /*
>          * If sup_dev is bound to a driver and @con hasn't started bindin=
g to a
>          * driver, sup_dev can't be a consumer of @con. So, no need to ch=
eck
> @@ -2156,7 +2156,7 @@ static int fw_devlink_create_devlink(struct device =
*con,
>         if (sup_handle->flags & FWNODE_FLAG_NOT_DEVICE)
>                 sup_dev =3D fwnode_get_next_parent_dev(sup_handle);
>         else
> -               sup_dev =3D get_dev_from_fwnode(sup_handle);
> +               sup_dev =3D get_device_from_fwnode(sup_handle);
>
>         if (sup_dev) {
>                 /*
> @@ -2225,7 +2225,7 @@ static void __fw_devlink_link_to_consumers(struct d=
evice *dev)
>                 bool own_link =3D true;
>                 int ret;
>
> -               con_dev =3D get_dev_from_fwnode(link->consumer);
> +               con_dev =3D get_device_from_fwnode(link->consumer);
>                 /*
>                  * If consumer device is not available yet, make a "proxy=
"
>                  * SYNC_STATE_ONLY link from the consumer's parent device=
 to
> --

There are patches in flight that add new users of get_dev_from_fwnode(), se=
e

https://lore.kernel.org/linux-pm/20250701114733.636510-1-ulf.hansson@linaro=
.org/T/#mc45a73769821cc520c35d8eb92d4bac75412bb7c

