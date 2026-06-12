Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5546CCD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 15:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9RAbFIw0jamNPl6PD31GkbyejBwj+MRucx19vqfzlvg=; b=I39RSUZLMytSNUxcAVhw1uKfHl
	/rXrW0F5Yz+7mZMOGZGSG9gpzIo2lK534GrMblgByquygI5GRuMuT1P+azFd5qP2g1AQs1N5fFcSP
	oPq4133fNFhVZOpMsQBKJvt02VnEZm8/FAdyERRz0D1TuIa8rm25tpejtrg5O8DrnSP3S1LEihE3S
	y4jV1WzNv5ZsR9IvE391h8EM+b7+D5qi/WJ5x5GR1UTDgf8nm+A1qShcsa5qtKFEmK1kkCCXw+LaP
	QpwzRhat+nM1ZpXmZhcHqfryXPwowpZPWUxu8dkIbq/6lQLPGRQgLkOKMQI+jGm+Qij1wx2J+VYF2
	Fa6C4xQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY3Ra-0000000B7xt-1saY;
	Fri, 12 Jun 2026 15:05:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY3RY-0000000B7xn-2GJ5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 15:05:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C913A40C21;
	Fri, 12 Jun 2026 15:05:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72C8C1F000E9;
	Fri, 12 Jun 2026 15:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781276711;
	bh=9RAbFIw0jamNPl6PD31GkbyejBwj+MRucx19vqfzlvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BV3KTv5DAe7pofu/YoU+7QCEDYAss1lut0QgGf+ZAw/YLG+VjpmDtd+ZNmOg4aXrp
	 a8O4jgwr10lulxIMSmAu8QT3H/CREASd4ANPG2zE8sqdpMmQqerVn330n3jqfvJeHO
	 Csz4PW9uwgaInmQgdJr0TvRr6wWBGGnh2Rmu+PrO0JQ9GSD5dpWMrx71luE8HxJ1TF
	 MRuqUhd977WEf0QMV0/VksoJhILqD21C+qkSGjCnJ8iXYFReZxqSsGu9mZpmp7REnz
	 dVdywULgKQ0homL2sVlf0B3M9jWEmLG3mFfdjHg1qyimse6FfdTye6/HCpq5VNZb/w
	 ApMpj2vjiRfMQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 681511AC5ABF; Fri, 12 Jun 2026 16:05:06 +0100 (BST)
Date: Fri, 12 Jun 2026 16:05:06 +0100
From: Mark Brown <broonie@kernel.org>
To: phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 11/11] ASoC: fsl: mpc5200_psc_ac97: Use guard() for mutex
 locks
Message-ID: <aiwgIjVqa4PeGjRQ@sirena.co.uk>
References: <20260612132639.78086-1-phucduc.bui@gmail.com>
 <20260612132639.78086-12-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="78eYuAPeqMdiQgRf"
Content-Disposition: inline
In-Reply-To: <20260612132639.78086-12-phucduc.bui@gmail.com>
X-Cookie: Nice guys get sick.
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


--78eYuAPeqMdiQgRf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 12, 2026 at 08:26:39PM +0700, phucduc.bui@gmail.com wrote:

> -	dev_dbg(psc_dma->dev, "cold reset\n");
> +	scoped_guard(mutex_lock, &psc_dma->mutex) {
> +		dev_dbg(psc_dma->dev, "cold reset\n");

mutex_lock not mutex?

--78eYuAPeqMdiQgRf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmosICEACgkQJNaLcl1U
h9BWkwgAhUG/BmHjT9vHm05/5/nin4LjC8fo8dB0dxAhqUOforJ+jokmjumsPz9h
2ZIsrszudxyiYPjue+UatceR/7Jjt3fAQSGKO5JeOPF+TWKW/O9LhpNPG0PFxoX3
6JIvxheh6qUaQgcu6I2opGcWRkNsUogX0ms9EqaKqMqdl9GsXaB+DsebpRpT+ig6
IesvG+gspxw6bxf0zQJ848CK2TDYnYC6pIeh1sfTTpOKXEq1cpiov+ub9GkmprH6
huycDqa5UDHqqRmfSaERRr0JO/dKd6OxYG5rLGFBT9c/te3hhgLDZcqFh2Czp5er
lBlS5G0zOAZKOmQW6E5Wxh3YgRh+0Q==
=f0Pg
-----END PGP SIGNATURE-----

--78eYuAPeqMdiQgRf--

