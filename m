Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD0B7CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 17:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d1t5bVZUzm488Yf6C5K+jVPU5FU9HqkWcLSsN4zkVoU=; b=yEGQT33/dU4r8Mzl7W6HWF6inY
	HxuKC2U8Kqh8s7AY4acH7nbHvKR/bcoP5eSJzwqQc25T+Y9xgcL95ZCgad7zcrfdRCKbMgJiwTF5I
	+VLIIhH+fZEGizlilSHqv3CmNoSIa2HA+/uyNEAv3YhOq92xAp71g4mKrl0BznpWBGeszy5km6U0P
	tN8u8f3fjnOmMVxftC/1BCsP6zsSlQsAt4sewmYjmgJ0scKd3i/KoU53UCh//IfuVwCpd3Z6E550n
	iJqFrmeztD4yK6pBBUGM28m6hRF3GcRZUDIIwxfwS/OVJW4atcIcTdIIbXO6B8AL/ftaU3KSElH3w
	4XGl4bTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP1XI-0000000GO1T-0xEm;
	Mon, 18 May 2026 17:13:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP1XG-0000000GO0y-2jeU;
	Mon, 18 May 2026 17:13:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3855443898;
	Mon, 18 May 2026 17:13:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C68B9C2BCB7;
	Mon, 18 May 2026 17:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779124426;
	bh=r7lglwV4YwDD/QEcv/dilMUnEHiAk1JwFYHmSq6gX08=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=udyZ5G6FTMb4+S07+r6ZpAPJ5RrnJa4qX56JhasfA1/uPE5w8eaP5ffRJVtlVWNp3
	 6FQlyoVTMyaiSuqXPSaBZdgWr/uBCB/OVy5K6lgLN10Wq2p4NBeLw2XOYksC2JPkRP
	 z0hOIowrXn/uUI4ZRSr/cFxVnpVDyR+mSlZ4VaNkmakZJErodFC6/6g8+r37JR5zTG
	 AGb3PGjq+QV26BvDNL4/ddK6wxGx5HJYRxIuvGls9NTeGngGwp3LukuSw4rWPP/2Mt
	 vAvw6kgDjzGP8eEX/MghrcgZEn+BH+jGv8wRGz2YmfOw9lEt8WNIr9k5K+mxwYPYtB
	 s3jXgYGfxDGzQ==
Date: Mon, 18 May 2026 18:13:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Woody Douglass <wdouglass@carnegierobotics.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Markus Schneider-Pargmann <msp@baylibre.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Saravanan Sekar <sravanhome@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Icenowy Zheng <icenowy@aosc.io>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v1] regulator: Use named initializers for arrays of
 i2c_device_data
Message-ID: <43a185ee-06a2-4cb8-b978-7f9fb19fae82@sirena.org.uk>
References: <20260515103150.164887-2-u.kleine-koenig@baylibre.com>
 <20260515122816.GB52035@killaraus.ideasonboard.com>
 <54168033-c968-4565-afe8-2f1f8547ddf0@carnegierobotics.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UPAvI50FP47clfJO"
Content-Disposition: inline
In-Reply-To: <54168033-c968-4565-afe8-2f1f8547ddf0@carnegierobotics.com>
X-Cookie: She sells cshs by the cshore.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_101346_711776_1BB525E0 
X-CRM114-Status: GOOD (  10.84  )
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


--UPAvI50FP47clfJO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 18, 2026 at 05:07:46PM +0000, Woody Douglass wrote:
> On 5/15/26 08:28, Laurent Pinchart wrote:
> > CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender.

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--UPAvI50FP47clfJO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoLSMMACgkQJNaLcl1U
h9CdmAf8CZKlR5k8GZroDpyzwUUN8pMF/nolTKDwsljqF41zVg+Gp31MEQQ6BImF
VuF3sI9f3Bk83VWtdI76MJBOq0+DZesPdMEh+TCT+g7bCwYf1aImNOwcuzoZrMZW
qDUuXmoODStoHFus/AY9cPgaKjysui538fFZdjMuVNEjZHeKtQcbZp8JXWLI9JX7
TsI7xaA9KYoqNrABYWzOUHcESvw/yYAd8SbRpnNmEQEoyO6ZKZeMjQJ+PlvLTMVf
0VTh3XQQ6Lx0LR9kKtjufzbSEuNkzAhcCPeok8mBw1VMfmCoHlg/T3SbcbN6A9dn
xvTCYhFKtZWxgYIJlLg324K9mIQVbA==
=Rd4d
-----END PGP SIGNATURE-----

--UPAvI50FP47clfJO--

