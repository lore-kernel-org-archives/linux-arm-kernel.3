Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 540F3CD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 10:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nUAA1E2BDC/m8Qh4zriU+H1O4lzzxO0FeBLvDHoZgZc=; b=K8BdkYd9heo5IQMiymYcEJo+TN
	B+3T7quIdY3fnW8AesYcaQTeI6YM/0K/f9tF41nzZDGk0B/ndhiiy2k9eoWFBBSpVoNAgQcbYfiUn
	H7j+meUb6ceI6f1ADFfNmWFSWlKvxBOsVJ4XetAjNCdZmZBzuEY6a6ibzUh5p/XROnN1dwmzb9KeD
	Ce5WObZUx5OUUEL19BAh5XbUBkRT+mwzrxzWFrSLm4ADlUYIIP+DUnEf0naXRYMP7V9ewlZmmQBXY
	yjwJYVL867jjdkLYeb/SnMkkc9LnabXYl3NIkL1nkgiX8QzstOmIFQxH1Khk7weOefJQ/ZVlUhLC3
	vhVuydCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa9iS-000000014MY-1KHw;
	Thu, 18 Jun 2026 10:11:20 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa9iQ-000000014Lz-0fca;
	Thu, 18 Jun 2026 10:11:19 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 03140200275;
	Thu, 18 Jun 2026 12:11:16 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wa9iN-003QAS-2z;
	Thu, 18 Jun 2026 12:11:15 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wa9iN-0000000065I-3Quw;
	Thu, 18 Jun 2026 12:11:15 +0200
Message-ID: <ab7fd447a05ab86e889c401350b83c3c85569f5c.camel@pengutronix.de>
Subject: Re: [PATCH v8 02/10] reset: Add Realtek basic reset support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Yu-Chun Lin <eleanor.lin@realtek.com>, mturquette@baylibre.com, 
	sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 	cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com
Cc: bmasney@redhat.com, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com, 
	cy.huang@realtek.com, stanley_chang@realtek.com
Date: Thu, 18 Jun 2026 12:11:15 +0200
In-Reply-To: <20260610080824.255063-3-eleanor.lin@realtek.com>
References: <20260610080824.255063-1-eleanor.lin@realtek.com>
	 <20260610080824.255063-3-eleanor.lin@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_031118_346875_281850E2 
X-CRM114-Status: GOOD (  17.86  )
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

On Mi, 2026-06-10 at 16:08 +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
>=20
> Define the reset operations backed by a regmap-based register interface
> and prepare the reset controller to be registered through the reset
> framework.
>=20
> Since the reset controllers on Realtek SoCs often share the same register
> space with the clock controllers, this common framework is designed to
> extract the regmap and device tree node from the parent device
> (e.g., an auxiliary device parent).
>=20
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> Changes in v8:
> - None
> ---
>  MAINTAINERS                    |  1 +
>  drivers/reset/Kconfig          |  1 +
>  drivers/reset/Makefile         |  1 +
>  drivers/reset/realtek/Kconfig  |  8 +++
>  drivers/reset/realtek/Makefile |  2 +
>  drivers/reset/realtek/common.c | 90 ++++++++++++++++++++++++++++++++++
>  drivers/reset/realtek/common.h | 29 +++++++++++
>  7 files changed, 132 insertions(+)
>  create mode 100644 drivers/reset/realtek/Kconfig
>  create mode 100644 drivers/reset/realtek/Makefile
>  create mode 100644 drivers/reset/realtek/common.c
>  create mode 100644 drivers/reset/realtek/common.h
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 613ca7e95e47..80e840a6691d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22484,6 +22484,7 @@ L:	devicetree@vger.kernel.org
>  L:	linux-clk@vger.kernel.org
>  S:	Supported
>  F:	Documentation/devicetree/bindings/clock/realtek*
> +F:	drivers/reset/realtek/*
>  F:	include/dt-bindings/clock/realtek*
>  F:	include/dt-bindings/reset/realtek*
> =20
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index d009eb0849a3..45a4227b5f44 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -418,6 +418,7 @@ config RESET_ZYNQMP
> =20
>  source "drivers/reset/amlogic/Kconfig"
>  source "drivers/reset/hisilicon/Kconfig"
> +source "drivers/reset/realtek/Kconfig"
>  source "drivers/reset/spacemit/Kconfig"
>  source "drivers/reset/starfive/Kconfig"
>  source "drivers/reset/sti/Kconfig"
> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> index 3e52569bd276..7330fee91365 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -2,6 +2,7 @@
>  obj-y +=3D core.o
>  obj-y +=3D amlogic/
>  obj-y +=3D hisilicon/
> +obj-y +=3D realtek/
>  obj-y +=3D spacemit/
>  obj-y +=3D starfive/
>  obj-y +=3D sti/
> diff --git a/drivers/reset/realtek/Kconfig b/drivers/reset/realtek/Kconfi=
g
> new file mode 100644
> index 000000000000..bb6dd856a64a
> --- /dev/null
> +++ b/drivers/reset/realtek/Kconfig
> @@ -0,0 +1,8 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config RESET_RTK_COMMON
> +	tristate "Realtek common reset driver" if COMPILE_TEST
> +	help
> +	  This option enables the common reset controller library for
> +	  Realtek SoCs. It provides shared reset control operations
> +	  (assert, deassert, status) and a registration helper function
> +	  that other Realtek-specific reset drivers can use.
> diff --git a/drivers/reset/realtek/Makefile b/drivers/reset/realtek/Makef=
ile
> new file mode 100644
> index 000000000000..b59a3f7f2453
> --- /dev/null
> +++ b/drivers/reset/realtek/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_RESET_RTK_COMMON) +=3D common.o

That's an awfully generic module name. Id doesn't match the config option w=
ell. Please rename this to reset-rtk-common.o, reset-realtek.o, or somethin=
g similar.

regards
Philipp

