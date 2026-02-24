Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC441F357D5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 17:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=miD05eK+0103K0nqV0VgvBQv0vF5WAuglrfoXelY66M=; b=o5y/s+nPd6nk/JMN7PotcAXbpY
	+kaYBu4EZo8EXuOZ98+eM+8Ht8uBJFXeQAo12nG0Seza5wYlQuhByOgoJ7Xlpwkt1Qi/d+A1FuBUA
	9bXu3NGcVRzHco3l8lBRDrc8yxG+sYaAzIJdVaNNMY4Vjt9Il0Ba11YRLXyuletLmZjq2PZTrM9q2
	GHC1tW8nsSPcaqikfUU4P+yZy61Ooz5L3uDXLOy9JHBbZ/an4J5WraKz27XVdxhC0iTo3Ls8wPErK
	SMHXRg1+Jh5CzV1XyDCb84IjbQspjQs8lxFkivk1AOGSIcqlMirAu5YPgJUeVXtkriO6EUgIuZ6vz
	fn6P21tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuvyl-00000002S61-1ovB;
	Tue, 24 Feb 2026 17:13:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuvyj-00000002S5f-171b
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 17:13:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0828140D5E;
	Tue, 24 Feb 2026 17:13:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CE31C116D0;
	Tue, 24 Feb 2026 17:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771953223;
	bh=miD05eK+0103K0nqV0VgvBQv0vF5WAuglrfoXelY66M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aTWq6TyhfT8xVGZ9JC9piET/yP5vfFHniNb9mu0CM8jwvVmrW+IOK/yHJJU4MYocG
	 LuKN/56l0sWVn3L3SDAlKQ41JhoJ3P81g4G4FMWPch2FhI/W9EkJts+MSxjln1tPdn
	 tUHcqdwJrdE61Uaj++we57CDoWXyyiJVyudtn432cMQJA18y0WbmmBMlijq6kHxFR2
	 b2RpoUlW0G9CP10SZ8Ti6hRjp5Up1nnlOQz8fuXA+NBz/0sdL9bMI+hENaJzD4f1U/
	 e+3UxUgrX9mbkGtF3kzMWwpoYVNCAys/HSI5rPQVuPZ2IPCvqTCosiOtY6zYoR1RwB
	 35zDU8obSvw+g==
Date: Tue, 24 Feb 2026 17:13:36 +0000
From: Mark Brown <broonie@kernel.org>
To: amitsd@google.com
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Lee Jones <lee@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Badhri Jagan Sridharan <badhri@google.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
Subject: Re: [PATCH v7 4/6] lib/linear_ranges: Add
 linear_range_get_selector_high_array
Message-ID: <57891cf1-a7e2-42ac-98e4-25fd548ee765@sirena.org.uk>
References: <20260218-max77759-charger-v7-0-e8d907ce69c5@google.com>
 <20260218-max77759-charger-v7-4-e8d907ce69c5@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ajqSXpJyr7gIDnad"
Content-Disposition: inline
In-Reply-To: <20260218-max77759-charger-v7-4-e8d907ce69c5@google.com>
X-Cookie: An apple a day makes 365 apples a year.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_091345_354818_1F17658E 
X-CRM114-Status: GOOD (  11.73  )
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


--ajqSXpJyr7gIDnad
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 18, 2026 at 09:59:12PM +0000, Amit Sunil Dhamne via B4 Relay wr=
ote:
> From: Amit Sunil Dhamne <amitsd@google.com>
>=20
> Add a helper function to find the selector for a given value in a linear
> range array. The selector should be such that the value it represents
> should be higher or equal to the given value.

Acked-by: Mark Brown <broonie@kernel.org>

--ajqSXpJyr7gIDnad
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmd3D8ACgkQJNaLcl1U
h9BxqQf8DP6wjyYdfOSBrB5Xn9eXDFFW1jGwmmgn7p3tf87vwRhXtNxKhIkQmKV4
4tQDBl6ZEV8G8obl3pRNVamOHkMoWofw7EG5hpLjz0k/lGLAWvDUg6SeZk6BsUd3
04xpHoM4SxTGD01C8nt6yEjLplF0OkYS03haPQ6ldgh4hc0fW5/qlaDX8WSvvYzH
vetuB1RA8iTews7LT8/YhArFzkJqhWyG12rKXgWXnPz2Joz0k2k279nlGs+lRVLV
g0V5ali3JRtXREfFXSL28UuHCAAmBrYPR4KEF4paAdV7h8Gt3UB9KuU/Gi4HjRkV
chKB8nn1mKHLgOU/N0yXycpQ/fr25w==
=blQU
-----END PGP SIGNATURE-----

--ajqSXpJyr7gIDnad--

