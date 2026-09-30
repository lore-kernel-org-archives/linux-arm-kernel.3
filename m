Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B99CA5FC1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 17:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NekGYTMsQoN6Q698XRZubdgz89ZkfcStE+gd4rWz4JY=; b=iziKt8yA3BUznVgGtXobyldjo1
	0fr6XP3w9eHQ2eu/OJVqT1lbn1+skUVFEAZa959bkYpjX85EgVnLoNocUNWI27Rr2FeqPfYenohjV
	K0NEPADfK/q5M87gmfSNEzMOHhXZzIDgTyZ6hsStfGrSTEoPqxH4veaJG7KTqcseVZaKMi7M0CMzC
	YArC+jvwvJ0izcS9YCcImc93bnRNt+eI0D9EUVNF78ALTLYI5tjoBGwWJdrWGFjjizBpZ7FrtlN66
	L7RMM6ToiUzlMwKa+dLDmUIxUKM2srQ19OW684r3j9i4v9gh2dRNTDu3tIj75+GIZh2V0YWbbqu/z
	DgvXwbaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBy9i-00000006qR0-1QMl;
	Wed, 30 Sep 2026 17:31:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBy9h-00000006qQb-0UvV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 17:31:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3CE16601DE;
	Wed, 30 Sep 2026 17:31:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 130CB1F00899;
	Wed, 30 Sep 2026 17:31:41 +0000 (UTC)
Date: Wed, 30 Sep 2026 18:31:39 +0100
From: Mark Brown <broonie@debian.org>
To: Shih-Yuan Lee <fourdollars@debian.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>, Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v17 2/6] spi: pxa2xx: introduce clock enable and disable
 helper functions
Message-ID: <4fafe6fd-b97d-4887-8788-b925cf7167eb@sirena.org.uk>
References: <20260930160629.1822-1-fourdollars@debian.org>
 <20260930160629.1822-3-fourdollars@debian.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kKefU3zr1yzK+k5m"
Content-Disposition: inline
In-Reply-To: <20260930160629.1822-3-fourdollars@debian.org>
X-Cookie: (null cookie
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


--kKefU3zr1yzK+k5m
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 01, 2026 at 12:06:25AM +0800, Shih-Yuan Lee wrote:
> The driver enables and disables the SOC clock during probe, teardown,
> and power management callbacks. Directly calling clk_disable_unprepare()
> when the clock is already disabled=E2=80=94such as when removing a device=
 that
> is runtime-suspended=E2=80=94causes an unbalanced clock disable warning f=
rom the
> Common Clock Framework.

> Introduce pxa2xx_spi_clk_enable() and pxa2xx_spi_clk_disable() helper
> functions that track the clock state with a 'clk_enabled' boolean flag
> protected by a 'clk_lock' mutex in struct driver_data. These helpers
> make clock toggling idempotent: repeated enable or disable invocations
> are safe no-ops serialized by clk_lock.

What problem is this solving?  Usually if something is dropping a
reference to a shared resource like a clock without knowing if it took
it then whatever else might have been using the resource is going to be
broken when the clock suddenly vanishes underneath it.  If we are
coordinating properly we shouldn't need the flag, the refcount should be
good enough.


--kKefU3zr1yzK+k5m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq9R3oACgkQJNaLcl1U
h9BgaQf9GKUrZjBxMYFeduDpMZivWsKGhWAQfS09vbG6cAlOgj6pHjVr39I8Rar4
ujG/YQSqeMlV84iVKuASSZrDXCShHolBrCI2gqXlWXhdUx4E/r01bmj6N6dbUY4H
3d5PJAGhPmOGMy2ZtoHbH+hkK4nq4ojlLI8wnAD6m8yHJXZHOWKimYlunYjC3SnQ
jOng8rJY1Y8z1f70hs3thctQrG0SDB7sTNEZDlE9XG6uzK4VVz+AIOT4AVEnsyu9
iJVBj1PxW3vKvw4HvcqJQUlshwimBZYkMJcbGoEv8BhjWj3FONc47TTdMB47lu92
0AvsySe5Pdk7TIXSFZa3W0tG6N4Whw==
=eMDF
-----END PGP SIGNATURE-----

--kKefU3zr1yzK+k5m--

