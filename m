Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CCA1C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 11:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vkspmsqGRL0kbNhRVlmd69ZLVVxDznKqEBDAyLfVzGk=; b=rOxgRvaREk4gIBnhw+L7T3IrlN
	5mToBiy6uv9wBc0ZgKhq707gflnkvgz0i8Axn3Rd98J/4Llwf+glRPm+GmC2cVlbscMDsazRdwa+Y
	YE+CRSwL2wwk49jvpKz+LC9v0lpD/E3deUL3A64QtMvOl2TA+7MTGxVRSHtwZy8CEHnac9KbXnHzi
	lSBuUD6//KoguHbVWTsiOFb1E/R8u9rYS64+Y+Jl7jcQPz8946fjNmZYHS+t7bpF6RTOKUPKkE8yy
	O7RIukf7Bt8ZBYj0NE8tqFxhCN2DLiH+mHM5qQ6MIYAxjfCoyFtG9/DS3PV0NlN51SsUpSB2046Oy
	193HmT1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYjea-00000002EQt-2fhc;
	Mon, 07 Jul 2025 11:04:56 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYjDK-00000002AwE-3cuB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 10:36:48 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1uYjD3-00057V-F6; Mon, 07 Jul 2025 12:36:29 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1uYjD2-007EWv-1J;
	Mon, 07 Jul 2025 12:36:28 +0200
Received: from pengutronix.de (p5b1645f7.dip0.t-ipconnect.de [91.22.69.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id BB00443955D;
	Mon, 07 Jul 2025 10:36:27 +0000 (UTC)
Date: Mon, 7 Jul 2025 12:36:25 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Carlos Song <carlos.song@nxp.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, "rafael@kernel.org" <rafael@kernel.org>, 
	"mturquette@baylibre.com" <mturquette@baylibre.com>, Frank Li <frank.li@nxp.com>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "dakr@kernel.org" <dakr@kernel.org>, 
	"festevam@gmail.com" <festevam@gmail.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"pavel@kernel.org" <pavel@kernel.org>, Bough Chen <haibo.chen@nxp.com>, 
	"len.brown@intel.com" <len.brown@intel.com>, Andi Shyti <andi.shyti@kernel.org>, 
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Aisheng Dong <aisheng.dong@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, 
	Jun Li <jun.li@nxp.com>
Subject: Re: Dead lock with clock global prepare_lock mutex and device's
 power.runtime_status
Message-ID: <20250707-careful-pragmatic-quail-e1a2d8-mkl@pengutronix.de>
References: <VI2PR04MB11147CCEFE4204B852807AAF2E841A@VI2PR04MB11147.eurprd04.prod.outlook.com>
 <20250707105816.GF11488@nxa18884-linux>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cndeefjy6bsasobx"
Content-Disposition: inline
In-Reply-To: <20250707105816.GF11488@nxa18884-linux>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_033646_909330_E8C99784 
X-CRM114-Status: GOOD (  19.45  )
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


--cndeefjy6bsasobx
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Dead lock with clock global prepare_lock mutex and device's
 power.runtime_status
MIME-Version: 1.0

On 07.07.2025 18:58:16, Peng Fan wrote:
> On Tue, Jul 01, 2025 at 03:16:08AM +0000, Carlos Song wrote:
> >Hi, All:
> >
> >We met the dead lock issue recently and think it should be common issue =
and not sure how to fix it.
> >
> >We use gpio-gate-clock clock provider (drivers/clk/clk-gpio.c), gpio is =
one of i2c gpio expander (drivers/gpio/gpio-pcf857x.c). Our i2c driver enab=
le run time pm (drivers/i2c/busses/i2c-imx-lpi2c.c [1]). System random bloc=
ked when at reboot.
> >
> >The dead lock happen as below call stacks
> >
> >Task 117                                                Task 120
> >
> >schedule()
> >clk_prepare_lock()--> wait prepare_lock(mutex_lock)     schedule() wait =
for power.runtime_status exit RPM_SUSPENDING
> >                           ^^^^ A                       ^^^^ B
> >clk_bulk_unprepare()                                    rpm_resume()
> >lpi2c_runtime_suspend()                                 pm_runtime_resum=
e_and_get()
> >...                                                     lpi2c_imx_xfer()
> >                                                        ...
> >rpm_suspend() set RPM_SUSPENDING                        pcf857x_set();
> >                           ^^^^ B                       ...
> >                                                        clk_prepare_lock=
() --> hold prepare_lock
> >                                                        ^^^^ A
> >                                                        ...
> >
>=20
> This is a common issue that clk use a big prepare lock which is easy
> to trigger dead lock with runtime pm. I recalled that pengutronix raised
> this, but could not find the information.

Alexander Stein stumbled over this issue some time ago:

| https://lore.kernel.org/all/20230421-kinfolk-glancing-e185fd9c47b4-mkl@pe=
ngutronix.de/

I encountered it too, while trying to add a clock provider driver for a
SPI attached CAN controller which uses runtime pm.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--cndeefjy6bsasobx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmhroyYACgkQDHRl3/mQ
kZyo1gf/bNfDioyKAk+LhbS/S8WU2c64fWY5vQcbThj413S7TcSnfnR9IlY7RDK3
yyXLR72WESLDt0+ezCYs/G5H8yWdc5vRjEjorcY/LiIyCkCmqeBDZ+LTRHKcCQTj
c1ueWZ8BN9n6tDpBqNG/BZxRn+NnTEB4/f66ioH0poon8ldWYEXBes3WoCPcwU6o
hKSg5Z0ch/66R1veUV42bRYEf1C2WG1lCkhuG0QBugpR6jH74bYwMyjhmjlwE/nG
8r4DabWOZ1peVEUh0BkRnUDp1qwGmviztuN5gOodGiCCoPn5AvarUIraNcS+x43J
EXQzX+sCwlzPYWX1leAA0t0Albln6Q==
=MHn4
-----END PGP SIGNATURE-----

--cndeefjy6bsasobx--

