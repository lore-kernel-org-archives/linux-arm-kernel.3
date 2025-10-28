Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F20CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 10:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ls9js8pk1OxApOPfHjg+6OhXCiFAAL8Poa+LHhv8b+I=; b=Cp5hXDwx8Skz5LXyB0fVKNHPmV
	OxTl9YZCMjkFyfovwV7QpwIkWiqT4NVW3gGL1fgQMypPt62wDW2tQEL9zpJ5Qe1JIIPDJW6uxtYa/
	Fp50pq2idJO+MNIY+pJ+L6SVCSbxicgWXMwlP+741CDaOVrTecUK/+71hsQhqDjFKczOmdbiDYpNh
	egl+gAufiZJUa+GTYcEFGWi9SSWKP6e6ANYIRg/t4T6pQY6N1YmGX847SHa6UdWL14kPaPpzeY2bk
	uJVjwn8XAXiSbtgWXrsAY6ncdjerav7GUY4SGwdtyeKchFPEqd9YnQ2vpWThGcxp8mX7cpTWkbMFR
	AjAkb92g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDgl3-0000000Fjga-0Qbo;
	Tue, 28 Oct 2025 10:16:53 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDgl0-0000000FjfA-3itx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 10:16:52 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5E34E1A16F9;
	Tue, 28 Oct 2025 10:16:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2EE15606AB;
	Tue, 28 Oct 2025 10:16:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2EABC1179B169;
	Tue, 28 Oct 2025 11:16:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761646605; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ls9js8pk1OxApOPfHjg+6OhXCiFAAL8Poa+LHhv8b+I=;
	b=T2mWuyF1Qd8XV3vwoWIodU+brS+15SaCjgzWX2XlEE5kUJTtJQyb0GGWuqTyZhH+FFDKpc
	Xqqvn5L2mdvJ0MNnISgT0M6sIU8mXNXeLM9S2z65uY1z3ukIyHZ0Xwr68Hha+oAXOtfkIq
	aA/mFYHiKksHLih9RQc5ooPMSLYOf1Ml8ex93rbVOk7S95p5VZ8JzIBngXxbW6J82SowfD
	DOv2auU7aXka0nHFhn9wPan+sLhIOmuRtM3yeXOFknGNV3rsdnAvD2eS2hBfT0jIApcrSG
	H/xvyhnJEHWwN3EkGE8s920SdZ66mHv5s4MtvnLKB7JooqhGCynqXJP8+XQIbA==
Date: Tue, 28 Oct 2025 11:16:36 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Vadim Fedorenko
 <vadim.fedorenko@linux.dev>, Alexis =?UTF-8?B?TG90aG9yw6k=?=
 <alexis.lothore@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 2/2] net: stmmac: Add a devlink attribute to
 control timestamping mode
Message-ID: <20251028111636.7eaba25e@kmaincent-XPS-13-7390>
In-Reply-To: <20251024070720.71174-3-maxime.chevallier@bootlin.com>
References: <20251024070720.71174-1-maxime.chevallier@bootlin.com>
	<20251024070720.71174-3-maxime.chevallier@bootlin.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_031651_062372_1993B7BB 
X-CRM114-Status: GOOD (  18.39  )
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

On Fri, 24 Oct 2025 09:07:18 +0200
Maxime Chevallier <maxime.chevallier@bootlin.com> wrote:

> The DWMAC1000 supports 2 timestamping configurations to configure how
> frequency adjustments are made to the ptp_clock, as well as the reported
> timestamp values.
>=20
> There was a previous attempt at upstreaming support for configuring this
> mode by Olivier Dautricourt and Julien Beraud a few years back [1]
>=20
> In a nutshell, the timestamping can be either set in fine mode or in
> coarse mode.
>=20
> In fine mode, which is the default, we use the overflow of an accumulator=
 to
> trigger frequency adjustments, but by doing so we lose precision on the
> timetamps that are produced by the timestamping unit. The main drawback
> is that the sub-second increment value, used to generate timestamps, can'=
t be
> set to lower than (2 / ptp_clock_freq).
>=20
> The "fine" qualification comes from the frequent frequency adjustments we=
 are
> able to do, which is perfect for a PTP follower usecase.
>=20
> In Coarse mode, we don't do frequency adjustments based on an
> accumulator overflow. We can therefore have very fine subsecond
> increment values, allowing for better timestamping precision. However
> this mode works best when the ptp clock frequency is adjusted based on
> an external signal, such as a PPS input produced by a GPS clock. This
> mode is therefore perfect for a Grand-master usecase.
>=20
> Introduce a driver-specific devlink parameter "ts_coarse" to enable or
> disable coarse mode, keeping the "fine" mode as a default.
>=20
> This can then be changed with:
>=20
>   devlink dev param set <dev> name ts_coarse value true cmode runtime
>=20
> The associated documentation is also added.
>=20
> [1] :
> https://lore.kernel.org/netdev/20200514102808.31163-1-olivier.dautricourt=
@orolia.com/


Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

