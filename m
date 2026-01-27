Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6321ED2FEC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 17:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=epLIJhkrys+CiHq6G2TqBF8RMwxjfAZPQFgcjmq43pA=; b=BDueOdVGp9OB+RYhAQWtXb+hAH
	+lXxQmJ2VOAhJHpPUNWvwH2C56u6CWrPC0O7qsUn8dO3wBSusa/0VaA2g0DSQQDNqd6JGzBw02t2u
	2pJhfH3S2S3ubn+Af7q7VpasRujyWLkcVGSR+xbgAiSKpw91PLqdgRkRfEdMDeSxRKFAazMqsh6LV
	can0chmqus5xLbzf7GBxvZn2560kjxKgHx6oP43yTxPL6t9kNZUP7SU2oUeOko8u2HiO3F/+xHIc3
	fgTFoBlmbaqT//UmbLXkBhj4++M4PkU35gSk9Q+1gSH2bQoUrLNnguvhmKOSUhhM3KFxz6bXPu2dh
	4MWfp3JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkmom-0000000EjAE-10Dk;
	Tue, 27 Jan 2026 17:25:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkmok-0000000Ej9w-21rD;
	Tue, 27 Jan 2026 17:25:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8AC4A60132;
	Tue, 27 Jan 2026 17:25:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEAA8C116C6;
	Tue, 27 Jan 2026 17:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769534729;
	bh=rW38RPoI3oC7pNCyY0rJv3O6uYwRPEMNoNEw8/xECFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=broqQYSUyCZFqhUBVTkrR+dH3UsWbklfnhuW3B0HJf/2US/ZGqbFoSwMfI9QS1+AU
	 irWM9QESApcK+/HViaWyDz080JoEFiS0H+7X2Yim/C5wv1xUlffScWUGE/g8LVxGIV
	 TVN+um2U/fSPVvxp2GsbZgXoVXkLUd6HMzxhYuAeiu0e69LTvhBCvSO8gVgSXU6hjC
	 Dab1HZsAECYGVgpU0E+i1X6hDDlJp680ohEBrUC3Il2mZdg3kKCYf6oqZsIBefj5Eb
	 qbpJC/mdaHmzKFtpfLnH58a+cPtH8mXxN6l0b8KiaQUE9PipMMwAYCJZXz82bLnZVB
	 d0oMLucv9S9uw==
Date: Tue, 27 Jan 2026 17:25:04 +0000
From: Mark Brown <broonie@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Laura Nao <laura.nao@collabora.com>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>,
	kernel@collabora.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 1/5] clk: Respect CLK_OPS_PARENT_ENABLE during recalc
Message-ID: <4ea31b0d-af6e-44f7-86e4-35a43b8c71e7@sirena.org.uk>
References: <20251010-mtk-pll-rpm-v3-0-fb1bd15d734a@collabora.com>
 <20251010-mtk-pll-rpm-v3-1-fb1bd15d734a@collabora.com>
 <036da7ce-6487-4a6e-9b15-97c6d3bcdcec@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RF8mwgvq6/WUQAl0"
Content-Disposition: inline
In-Reply-To: <036da7ce-6487-4a6e-9b15-97c6d3bcdcec@sirena.org.uk>
X-Cookie: I brake for chezlogs!
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


--RF8mwgvq6/WUQAl0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2026 at 05:01:35PM +0000, Mark Brown wrote:
> On Fri, Oct 10, 2025 at 10:47:09PM +0200, Nicolas Frattaroli wrote:
> > When CLK_OPS_PARENT_ENABLE was introduced, it guarded various clock
> > operations, such as setting the rate or switching parents. However,
> > another operation that can and often does touch actual hardware state is
> > recalc_rate, which may also be affected by such a dependency.
>=20
> I'm seeing boot regressions in -next on the Avenger96 which bisect to
> this patch in -next.  The board resets during startup:

I am also seeing some similar regressions even earlier on i.MX8MP
platforms, though they're resetting even earlier before any output is
produced (even with earlycon).  Didn't confirm yet with a revert or
anything though.

--RF8mwgvq6/WUQAl0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml49O8ACgkQJNaLcl1U
h9DWogf/Z6f+ynVN93YYO78VeYBg+sDQozhRTPncQpjvglNt8Mq+zTZKAzdWU8fo
jwbjNVtpH6kamkMp5b/tIVaFzuD8cHU0B0AdnVcnueJXNJ49AxUy9oIZlKCJTS6f
bMFQoiJ6nniK04tIBXw7KUjIOqetkXLva4CtzYO7Lp/CHsp6nJF6ExXMxodiy9R9
EFOwyOMcWNtVg+C/ekXKzvtoYWOWBZ7ug39ftHJwnpUYLLX4tqj4e2F3UWTT6zd6
4BiaA6euXIAGpX+ndLto43Ecm2QwSMrZ+r3KGQelFMY3G7GnGkzZxAgb1G1dlE4I
wUCqqcDUxVEXsebEpYs7GbyDTI+Mhw==
=uEAl
-----END PGP SIGNATURE-----

--RF8mwgvq6/WUQAl0--

