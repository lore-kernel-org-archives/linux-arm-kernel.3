Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC5C4C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 16:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NMTfagBvOJ/X0U4hLNTqE+o7JZO5KBtrHGmCDcMdaJ0=; b=VAdR9+jMJlJ6uswIfP6916RXKU
	ERJLGM+HKWqVzdKDr6MKYli6GowRcL/a2FIae2djhCKrjZ2WeTk/iHnI+o290nGFxOkg8cUNkgu8k
	cv/SERsS2a4Zi5siB4FoEIvu4k1rJYqNvbbxvqB/wVANXVN0CL80hwtjRVdJs90zNyCTGN6noLspm
	UW+kMQZ4zdgN1oSAAhuoshjs89r+XJlQjmXXGy04be4XDt5+qb9ZoXj8Rx95pw4axWb1vUs/Vjrk1
	uOK84k8jKFo8kT6lQbOOUeq6kkQ9QrGAK8wyz9lyq5bulpq2YGgcvrfrhZFdRL6RCeKjOoQX6LbNp
	Cug7NifQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Rln-00000006zse-05gK;
	Mon, 28 Apr 2025 16:55:51 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9RiS-00000006zMs-1Pz3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 16:52:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=NMTf
	agBvOJ/X0U4hLNTqE+o7JZO5KBtrHGmCDcMdaJ0=; b=D0ZV+GRzXb35ajd6ChCZ
	olHBJCrGbpWPddVQ4dwrqCRU+yMcIzQs4vEGfrXJgSa5gKdzmsSRYocrTK7DY7Hq
	Pc+qPk3EDSRsnaaDKOZpYK6WY+Ncw2xqszgbh+BXZQsMGTHQjUmxI9ZAkEjDX+Ar
	7aISt4vJSo2tS0VoNOXbieN7uyCuQIPsWclH8ZCX/CHwZ7RpYOVeAnIbBipm1J3m
	6KwO8n1C4HJYRiBjLNePvczmbosqpRP+3KW7CdHvMDXZV+hmIbtJSopELlX9jHul
	hYvhRwhm4WrFavm9tW+xdEtvM6CX1aBxrB/KepF1hAnzL4JM/uzGRE9BM4kTa2ts
	fA==
Received: (qmail 656501 invoked from network); 28 Apr 2025 18:52:20 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Apr 2025 18:52:20 +0200
X-UD-Smtp-Session: l3s3148p1@ulXkgdkzEpIujnsd
Date: Mon, 28 Apr 2025 18:52:20 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-mmc@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Aubin Constans <aubin.constans@microchip.com>,
	Ben Dooks <ben-linux@fluff.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Fabio Estevam <festevam@gmail.com>, Haibo Chen <haibo.chen@nxp.com>,
	Hu Ziji <huziji@marvell.com>, imx@lists.linux.dev,
	Jaehoon Chung <jh80.chung@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Michal Simek <michal.simek@amd.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, s32@nxp.com,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Viresh Kumar <vireshk@kernel.org>
Subject: Re: [PATCH 00/11] mmc: rename mmc_retune_* to mmc_host_retune_*
Message-ID: <aA-yRD3FX5Nr9ypK@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Aubin Constans <aubin.constans@microchip.com>,
	Ben Dooks <ben-linux@fluff.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Fabio Estevam <festevam@gmail.com>, Haibo Chen <haibo.chen@nxp.com>,
	Hu Ziji <huziji@marvell.com>, imx@lists.linux.dev,
	Jaehoon Chung <jh80.chung@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Michal Simek <michal.simek@amd.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, s32@nxp.com,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Viresh Kumar <vireshk@kernel.org>
References: <20250425111414.2522-1-wsa+renesas@sang-engineering.com>
 <CAPDyKFqxHd85DsUH6eZVyoocTDrvwNu+wTLRBq-jUwDY+2iFTg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o5qLCpm8WOWShP3M"
Content-Disposition: inline
In-Reply-To: <CAPDyKFqxHd85DsUH6eZVyoocTDrvwNu+wTLRBq-jUwDY+2iFTg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_095224_654224_791F58CC 
X-CRM114-Status: GOOD (  13.33  )
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


--o5qLCpm8WOWShP3M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ulf,

uuuh, I overlooked this mail, sorry!

> Sorry if my suggestion was unclear. I only had the MMC_CAP|CAP2_*
> related functions in mind. I think we should leave the mmc_retune*
> functions as is as they are not "can" functions.

I agree. I suggested that in my initial series, too.

> mmc_host_cmd23, mmc_host_done_complete, mmc_boot_partition_access,
> mmc_host_uhs. All in drivers/mmc/core/host.h
>=20
> According to your earlier renaming series, we should rename these functio=
n too:
> mmc_host_can_cmd23, mmc_host_can_done_complete,
> mmc_host_can_boot_partition, mmc_host_can_uhs
>=20
> Does this make sense to you?

I don't know these functions well, so you are probably right. I'll look
into it. One question: do you really suggest:

mmc_boot_partition_access -> mmc_host_can_boot_partition

or should it be:

mmc_boot_partition_access -> mmc_host_can_boot_partition_access

? I tend to think the first is better, just making sure.

Happy hacking,

   Wolfram

--o5qLCpm8WOWShP3M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgPskQACgkQFA3kzBSg
KbZvrQ/+LPEzaS2oX6voGtGK+EtDoheeu/trBb1qVzlci3uL4fywdNc9C1/XTsmX
bdfSNj6jRXTZ82tTT6kz/50Vdq/Eqw6Z8sAryK50bwG9tPgumH0pKRdX8wYdrsnF
Z8wuhfxQ4v+1pMNu4HIKXzxrQC6jA7FtQg83ntmHARwAQcQ4xBJB0/Jw6DswVpD/
zu4tKzLQeKmkVcfBt9JBaVLoV7iAHkYuZSg4h8iXL5ekF7V6Rv3o8siMi5HOiprz
57BD+JOsbO5n+H4gfFpW3R+Pg5AjL3d0cklnb8LRnbaCNNMI1DpptYuQ9F5IHnD7
VhFqOVsqrU37TthPTkmRmNyTgFcs+zB5e/iq7bMLgQsuOsw7hTJe117c8EEOTSAr
9wkP31mpJW9t6jp+sl5DTxJbeOf5alN4FrlgPbh3LONnnCgb5pwYoI9AKHS4XzzA
qshyCA6gLUAv8cH/m2pKuC3vBuc0gqdmiQl85X7Z0czAxeYe2NONA7PECQ3JN2+v
OWMBFhVnY9pjMVkzc9LK+5I66HdZGs4dLFs/ta/OqTZX4gq1A+fT162ftKuD4mn+
QjftHdJA103mEDU5H2vPzYRqp9jpSviPi+i0YRoE6xvVoEP2Ydln9q4iT28Bi7/9
wSfl7Mekr9rKanJSSnzozRE0LNmY5H3BU/YyUvFf7BuV++VL/44=
=/Qxa
-----END PGP SIGNATURE-----

--o5qLCpm8WOWShP3M--

