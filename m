Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EF49D2FEF9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 23:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0EYUPUdzEYikNE0CX0GI1sT0yihuPvSnNBwTP43+N8A=; b=Rrsgatb6fePI8wvbEHlaFptEJ7
	fWsB0/9/hMv/6AOQ/x/5rHNudChcL8DL0Ut2IFdiWNiQaTw76MPynsNp8DKKHz2QZNnUo5dcZ+lh+
	4gs2oP00Tx9zQgwlinigVxkOValmWT+A/lvYgMIqpakR9cBnFbN9Ked3lHRpwsZkQPlVxbiLwmunJ
	xYgS1qiESH0SI1ZZiDf5STMQBdliUqz7JSi06LK5K8TDCwKKG89OifqwHE+Zs537SSHuKoCr4Ngj1
	xelPqPPznJwr5s4K7pnY4T9JEiUlq0fw3dFyTEPiwJeRF98Ilo8tfNafrdndg+bkMxRL7HSO3cJiS
	p+IMQMXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vksGc-0000000F9U1-2jAK;
	Tue, 27 Jan 2026 23:14:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vksGZ-0000000F9TS-2ekt;
	Tue, 27 Jan 2026 23:14:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DD03643EEB;
	Tue, 27 Jan 2026 23:14:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8C36C116C6;
	Tue, 27 Jan 2026 23:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769555674;
	bh=lqGjeRJOOzbn2aNNwZF3ZUIE//glBDeRc/EymDCY/oU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XRrqoY0HY1rd+7oIyEmMd1s8RxC6ZmyxVP1V3A6vmlKSlhMCNqOBMEx6SBPFIKpLS
	 t1YKeY4VVfEWkvauBpePcx6dnAcpe+8uzBKWdNIJqY1u4DGgGYeZcRmx3LhScrex/8
	 Gsb//82WvJQG11Sd+Qu8vvhlLhec8dg3xpgaTAUxqnFlZzLLIRrh8AdH7jZIzaiBFd
	 8UDoXjcyDV1sFOPFmVFWpkn5Ri+GF/anLsmWazsD5lpPoLWjBcK5BrQwbB137J5GjU
	 irxnqlNWYLleLGajbvFZC2vVHq3QL/gTAJzC4LTexexmxSIAI1BlfrijcfkHVo5EOM
	 Mge8OQN0YTA7A==
Date: Tue, 27 Jan 2026 23:14:29 +0000
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
Message-ID: <1cbf0f37-13de-46a5-a3c0-0509048c519e@sirena.org.uk>
References: <20251010-mtk-pll-rpm-v3-0-fb1bd15d734a@collabora.com>
 <036da7ce-6487-4a6e-9b15-97c6d3bcdcec@sirena.org.uk>
 <4ea31b0d-af6e-44f7-86e4-35a43b8c71e7@sirena.org.uk>
 <6800096.lOV4Wx5bFT@workhorse>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MCyY9aE0n3Y5i22y"
Content-Disposition: inline
In-Reply-To: <6800096.lOV4Wx5bFT@workhorse>
X-Cookie: I brake for chezlogs!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_151435_693955_610063DE 
X-CRM114-Status: GOOD (  14.13  )
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


--MCyY9aE0n3Y5i22y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 27, 2026 at 07:18:02PM +0100, Nicolas Frattaroli wrote:

> Can someone let me know which clocks (with which parent) in those
> affected devices is causing this? I'm wondering if this change
> unmasked some undeclared dependency that it's now stumbling over
> because it's enabling the parent earlier than ever.

Do you have a debugging patch we could run which would say which clocks
are impacted?  I guess it's more of an issue for the platforms that give
no output but for at least Avenger96 I was getting earlycon output.

> To not have me break everyone's -next for days on end, feel free
> to drop this patch. MT8196, which this was added for, doesn't boot
> with mainline yet anyway.

Please, this is making my test lab miserable.

--MCyY9aE0n3Y5i22y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml5RtQACgkQJNaLcl1U
h9DT4Af9H5KfN9aVa29dFU6jbyVXWwck19anfXKhQzIfvchEMsZ5KMAIgbBV5EmK
hUM3KNvyUhjwoURJEXuxgi04z0WFIlAbbJ4/w9LAfBaFQGR57GlyF6VQGqhasxsR
guZub6177/4RjZ+IVfEniKsKdSlarac9XzKhWLCSzpSM6vKwMRwEU59N2dEPklOM
DJa4MRkqm0U1z/njEH6r//49UDOTB9mHTiJ7ysDHJ3FCnzWXDAEeED5kLKILRbJq
v3RGTh3x0yt8MvnO/gnZFSkx/R/xlPidk0aY5ytelWxqK10zNZUa3OLGMwVXuN/+
ulPx6atTjVbUUiG2r4Xc05kzyTNluQ==
=wXYP
-----END PGP SIGNATURE-----

--MCyY9aE0n3Y5i22y--

