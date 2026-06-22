Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99BC0CDB46B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 09:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rNXWhIqCnCiuZjgJcEM9gRULbQI8ONKE9bL7itt2wxE=; b=hDjUdbUQhHDUYyH979+/Z+qcR4
	loAnlXq8ZZQZZhpTAtudQ/wckg5J4XkYWUA1F/vOYakfjkaQfawjLp6wktptGyshE4WyrjpFq12ak
	evF0fcrU1OrToyY6Fpx3uolKIuOHoTZfZQ43nsybV+6l5uM2usH6CQZS9vgUc7onY16zW+uFqL2RT
	kITL+pghQVUcNslcbWcQ19qKac8iRmRuCoFlu/wD5Xanu4bP04JnL9Ap/kBhGU1eLll7hOduEshPY
	FEjMBBmlu+AO8ISoGCmj2cKgMwfkPTWks1FahXU6CJBwOjvjFaW9MGPC+U7kMggwhQy9TEOHSJBmq
	3fqakEfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbany-00000004k6K-1wEp;
	Mon, 22 Jun 2026 09:18:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbanx-00000004k69-3ltO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 09:18:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4425E600AF;
	Mon, 22 Jun 2026 09:18:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B789B1F000E9;
	Mon, 22 Jun 2026 09:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782119937;
	bh=rNXWhIqCnCiuZjgJcEM9gRULbQI8ONKE9bL7itt2wxE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LEkQ9XtmIrZkFEhkooQbXgFQHG77Bd28aPmHUdYP5v2g93YlcLZxCQ2vX3rE+JXxB
	 ntQuYtwCXa9ZLKEX5W7dqzMS2dYd3zAkOHcWQq2cjbibjSw2BuwNsnhrJ96pfG8/da
	 /wM19OEfkOlPNCqm49mh0XV5/7e6MNE6SC43y6cPNqT6n+NDEB8LMTXxtSzB1FhCIA
	 7x4hQ8EtRWM8vFQpvVZlN0MS5TeqcxZ8moesBkezQEfKe6gnLp6Vw/1LlFeyYCBHon
	 xe1+Hk19xFNbMcBRriFpD9vSyaiQOSz/cpvV7QrNmBKd2xZNGBfW4Ly4Q8RfyMlis+
	 1K4mhSYXuW4gA==
Date: Mon, 22 Jun 2026 10:18:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Ulf Hansson <ulfh@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Christian Loehle <christian.loehle@arm.com>,
	Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-sound@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] mfd: db8500-prcmu: Fold dbx500 header into db8500
Message-ID: <6a1c6e6f-b2a4-4953-878c-2f2f3744d320@sirena.org.uk>
References: <20260619-mfd-prcmu-merge-headers-v1-1-8ea0ee23b4d6@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="F21+nkoAYpsrTplW"
Content-Disposition: inline
In-Reply-To: <20260619-mfd-prcmu-merge-headers-v1-1-8ea0ee23b4d6@kernel.org>
X-Cookie: Now I am depressed ...
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


--F21+nkoAYpsrTplW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 19, 2026 at 10:27:10PM +0200, Linus Walleij wrote:
> Move the DBx500 PRCMU definitions into the DB8500 PRCMU
> header and delete the wrapper header.

Acked-by: Mark Brown <broonie@kernel.org>

--F21+nkoAYpsrTplW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmo4/fkACgkQJNaLcl1U
h9BceAf+JnRRZo3CC7dY7ixwk7zpLhaOOcYrfPWC7UPLCHezOGDW4mYKWhJCKed4
opIBNonasXPS4Q3MuElsJo8eLwxS5HhDkmVX7k0CoEoPdeTGkbqih/6ZLU0vk0e/
PTbTPGGJFQj6ewMSK6TZMnor3CNuqVSYDhYD++Wtkpy2Bc+HM46Pj2xGADsWkAk5
rJTCldPiov2ztl7LN5YsUax/+xulcuqnxvw1yXrS1AExqFqnkLX3AEFdC1p3ycoh
Lbwo5s6c+lChx+Owkt5DeYeDJ9CQ3qrmiZRZUtHKLb1yd120zbWEXa7CXk5mk8e1
EGKSYIKOunlL6yCr6AOb+fsg9njECA==
=27Qz
-----END PGP SIGNATURE-----

--F21+nkoAYpsrTplW--

