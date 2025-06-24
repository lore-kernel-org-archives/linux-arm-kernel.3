Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3BCCC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 22:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lKbThwTsY1P7KFQMbDvtgsT2FnCwQe8p9lZusqk5xYk=; b=5AzXqGYDgJ918Uj7bIJKNy0Y0u
	UjMy3up0sDArQKkfR33rp6iRf6y3zfOdNlT+u5gPI/K+c3aJnmkkoJ4EWiUsQK4IBVwhEDjceSFeG
	Tz47LV3SvkJKusekMjno4Ld9tUZk3E8SMouGnzgwNVAxO1CIZeQtWG1YmH5OPVkpkN9wujJyVmMyl
	1SOMbZoGT5gZKY0vy+uBbR0/dXXPce2RVtoKcArVXgIX+0pCJ1dnOx3mnVihw60UoKD5+VDEZhUp8
	CetC1+eud86U+UQWA8jZJ/8HtRaBrbyy/E+0HBL5+a/uvXwbqztu3Hlv+TfCRbARnRrnoCp4jv/ld
	o9jTQu1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUCE2-000000070F4-1jjf;
	Tue, 24 Jun 2025 22:34:46 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUAoy-00000006pgS-2I5b
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 21:04:49 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C291F102779C2;
	Tue, 24 Jun 2025 23:04:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1750799083; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=lKbThwTsY1P7KFQMbDvtgsT2FnCwQe8p9lZusqk5xYk=;
	b=Wc0nyWpM9El1+10CWZ74uWfVcdDt0SYtJYSHGHEUpe2tX1dYOoTTvOzgkIaIIzCKKSVq8Y
	lf9S1OrrWOhGJt7x8LQnA3Vp7MopCmav2C8Y0sjQR6g4s0jWq0PPb1X5Y1AMUlI3o/eXke
	LmAZqppYww2wyiM1onpYxD5+3IAAJ/mYrY8S2YfUIqiCvAx3o9aGh56ChulgTPdXlIlT6p
	EZ9+sEvaur5PHc0xbaAbWMGbtqeHLXVWkIsmQrK2NHLU1pf4x4mSEY+fpjBkrvMVnY19rG
	qOzZM+eTOISjJolWT8wL5K1rBYznXr25yP5lesENk5uFVZx7+NF62feHxP+Z/A==
Date: Tue, 24 Jun 2025 23:04:37 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Richard Cochran
 <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Stefan Wahren
 <wahrenst@gmx.net>, Simon Horman <horms@kernel.org>, Andrew Lunn
 <andrew@lunn.ch>
Subject: Re: [net-next v13 04/11] net: mtip: The L2 switch driver for imx287
Message-ID: <20250624230437.1ede2bcb@wsk>
In-Reply-To: <b31793de-e34f-438c-aa37-d68f3cb42b80@redhat.com>
References: <20250622093756.2895000-1-lukma@denx.de>
	<20250622093756.2895000-5-lukma@denx.de>
	<b31793de-e34f-438c-aa37-d68f3cb42b80@redhat.com>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/L9I8TrK5V8LcSsjLhyb23zO";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_140448_874109_C97763D0 
X-CRM114-Status: GOOD (  26.28  )
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

--Sig_/L9I8TrK5V8LcSsjLhyb23zO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Paolo,

> On 6/22/25 11:37 AM, Lukasz Majewski wrote:
> > +static void mtip_aging_timer(struct timer_list *t)
> > +{
> > +	struct switch_enet_private *fep =3D timer_container_of(fep,
> > t,
> > +
> > timer_aging); +
> > +	fep->curr_time =3D mtip_timeincrement(fep->curr_time);
> > +
> > +	mod_timer(&fep->timer_aging,
> > +		  jiffies +
> > msecs_to_jiffies(LEARNING_AGING_INTERVAL)); +} =20
>=20
> It's unclear to me why you decided to maintain this function and timer
> while you could/should have used a macro around jiffies instead.

This is a bit more tricky than just getting value from jiffies.

The current code provides a monotonic, starting from 0 time "base" for
learning and managing entries in internal routing tables for MTIP.

To be more specific - the fep->curr_time is a value incremented after
each ~10ms.

Simple masking of jiffies would not provide such features.

However, I've rewritten relevant portions where GENMASK() could be used
to simplify and make the code more readable.

>=20
> [...]
> > +static int mtip_sw_learning(void *arg)
> > +{
> > +	struct switch_enet_private *fep =3D arg;
> > +
> > +	while (!kthread_should_stop()) {
> > +		set_current_state(TASK_INTERRUPTIBLE);
> > +		/* check learning record valid */
> > +		mtip_atable_dynamicms_learn_migration(fep,
> > fep->curr_time,
> > +						      NULL, NULL);
> > +		schedule_timeout(HZ / 100);
> > +	}
> > +
> > +	return 0;
> > +} =20
>=20
> Why are you using a full blown kernel thread here?=20

The MTIP IP block requires the thread for learning. It is a HW based
switching accelerator, but the learning feature must be performed by
SW (by writing values to its registers).

> Here a timer could
> possibly make more sense.

Unfortunately, not - the code (in
mtip_atable_dynamicms_learn_migration() must be called). This function
has another role - it updates internal routing table with timestamps
(provided by timer mentioned above).

> Why are checking the table every 10ms, while
> the learning intervall is 100ms?=20

Yes, this is correct. In 10ms interval the internal routing table is
updated. 100 ms is for learning.

> I guess you could/should align the
> frequency here with such interval.

IMHO learning with 10ms interval would bring a lot of overhead.

Just to mention - the MTIP IP block can generate interrupt for
learning event. However, it has been advised (bu NXP support), that a
thread with 100ms interval shall be used to avoid too many interrupts.

>=20
> Side note: I think you should move the buffer management to a later
> patch: this one is still IMHO too big.

And this is problematic - the most time I've spent for v13 to separate
the code - i.e. I exclude one function, then there are warnings that
other function is unused (and of course WARNINGS in a separate patches
are a legitimate reason to call for another patch set revision).

I've already excluded bridge and mgnt patches. Also moved out some code
from this one.

>=20
> /P
>=20


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/L9I8TrK5V8LcSsjLhyb23zO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmhbEuUACgkQAR8vZIA0
zr1eeggAn5xkytdRo6m9s2AP7CCf+2DLpUC+BoaHahBz9mSN7/URkVcaHdze2/iF
Js8HdHNNN+MMqzBxg6sKga9RDwGBRv9/kc1LnJz1+BiQGLIGe4sv5DS8ZwdQ2v72
dZ0TDq7rIIMNbGC5jvBXZ+KsuWsjUAMGB4UrnppIMei4fNI4PIZQlWWM6p9bAKtW
f8eqEmwIjW8dfH8fPlv0JwgIw7eGMecjMDbFk1Vcrd9HhLN7MV36CXVIHu4dV9Q/
3SUpxnQpkL6HoPSbROu+MaR/t8W15KN1iSF2fUbBmDvDFHIUu7qsVfXlcLr9SIio
69O3l2adUEiFwSicuYxlrKol0M2bVg==
=bmNZ
-----END PGP SIGNATURE-----

--Sig_/L9I8TrK5V8LcSsjLhyb23zO--

