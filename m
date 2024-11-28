Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4528D6911B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 15:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=apa6Big0Z5l/aZMDMWZ6kxq8kzcmESoz2p8x+wFwwzw=; b=EN6oUdat0Vbdur4wjAkM4UQws3
	/OIAua0W4pR/R/GxEl4NVTJZyx1VCCi1IIooBQxuqd06/QaC9PD8aLev14unHOUW1b3C6/JIs7BgD
	SKlNFrpC++qjW0/lwMoCVrdowaphEeMgE5VuZ9UJyJXs22A1sXKXwNHTtyWIDLKY+5/YlEVUkcZte
	f7rvPG1oVcntxJPqYUhNJSS4HU1XlIuBI96sPmXVpcvm62j4ybHrbUHh41540QrEK/HBvX8lkDY8u
	CdNfs0IvZP5ofovRMnHsRfJna6FrFu9NHGr8QAcuO5BoMvYZPqKBfkisANBXBDYsZVpd334ZPENFq
	LIieEzIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGgqE-0000000FwLo-0MTl;
	Thu, 28 Nov 2024 15:54:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGgpE-0000000FwA3-3muz;
	Thu, 28 Nov 2024 15:53:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 24CB95C5768;
	Thu, 28 Nov 2024 15:52:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D532AC4CECE;
	Thu, 28 Nov 2024 15:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732809184;
	bh=DYMoUVWceQPmAtjDphSIYmwZJAv7qhg+wtzpXScpSfA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DXfAU+EFfvj399EZCxpifxsss0HLLTkhbcOf5Bh1AWukLN7SYstYrwOX72JNOFUe2
	 bbdsmWbnbmPnldlxsBfl0jq3sKXinHWk9439JdFmq/z9Gs/umuoc2RPpjPaKjYTV//
	 xUWJ91VPjv/1XZCKNwsmHErl01rUWTSTVJY0aASnd2mR7/lNKGL1sqzMcTONlS7NvE
	 rX4XFTZ+mJgdv13d/xK197md9zf5mVD2JXO00VJiP9ln9TUio2s1VucM/RANZ797Ic
	 SRl39jpEBIWj+8bDs1Et0Y4D8mmx+qhlYc0RtvfVLCM3xd+Vyzt1lM5SBAyuKw9cbk
	 3KMAkfbIsUQQA==
Date: Thu, 28 Nov 2024 15:52:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: amlogic: axg-audio: select RESET_MESON_AUX
Message-ID: <30cd9a80-e9d8-4387-ad28-451f7f95637d@sirena.org.uk>
References: <20241127-clk-audio-fix-rst-missing-v1-1-9f9d0ab98fce@baylibre.com>
 <12f29978-c8ce-4bee-a447-dcd086eb936d@app.fastmail.com>
 <1ja5dk2y5l.fsf@starbuckisacylon.baylibre.com>
 <f8de4a2a-776f-4c10-b75e-e845bcc38dde@app.fastmail.com>
 <1j4j3r32ld.fsf@starbuckisacylon.baylibre.com>
 <306b0b30-5a32-4c7c-86b4-57d50e2307e8@app.fastmail.com>
 <1jy1131kxz.fsf@starbuckisacylon.baylibre.com>
 <c06317c6-b2b2-4b6d-96e4-0c2cfc6846de@app.fastmail.com>
 <1jplmf1jqa.fsf@starbuckisacylon.baylibre.com>
 <ce67e512-a15b-4482-8194-b917096f4eeb@app.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VgxPLBsQjrLMBW0m"
Content-Disposition: inline
In-Reply-To: <ce67e512-a15b-4482-8194-b917096f4eeb@app.fastmail.com>
X-Cookie: Close cover before striking.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_075304_984245_CC261C12 
X-CRM114-Status: GOOD (  16.75  )
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


--VgxPLBsQjrLMBW0m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 28, 2024 at 04:34:46PM +0100, Arnd Bergmann wrote:
> On Thu, Nov 28, 2024, at 16:06, Jerome Brunet wrote:

> > My initial rework had the creation in clock (note: that is why I
> > initially used 'imply', and forgot to update when the creation moved to
> > reset).
> >
> > I was asked to move the creation in reset:
> > https://lore.kernel.org/r/217a785212d7c1a5b504c6040b3636e6.sboyd@kernel.org
> >
> > We are deviating a bit from the initial regression reported by Mark.
> > Is Ok with you to proceed with that fix and then continue this discussion
> > ?

> I really don't want to see those stray 'select' statements
> in there, as that leave very little incentive for anyone to
> fix it properly.

One option would be to get a change in defconfig for -rc1 and then deal
with moving things about later.  I would very much like to have these
systems working in my CI if possible.

--VgxPLBsQjrLMBW0m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdIkdoACgkQJNaLcl1U
h9CHrgf8CqA9sf4sAjvbEdL2zX3cOMrPt5ihQvdVHNhH60Y4Jw7vPM5JiNGf8f3u
xx0LSyViOjOrH0EBeEaWsKp3zN1Dn68NPJhi55EaNCKCIh8zX5EHuDxEEImgnpSS
C21JUbEYQ5Xd6EgtFgDUAQzQ8DDZLWqQzdUQQu+LJ9otUTLleiNht3oqk1SMz+Xy
mkK+koXFqdBkPDxWC4jKHPItUAm1oASEDU+R2bS0oAOVqkWz2DmSrkM5WNdM0EGJ
IoNvABSoO4xRy+ku+LfQ5ECtz1R10x3d1jDKU4edmqVeIgObD0ovojsv9scArjqN
qc2W4uEswYAnJdl0+BdjgzxF8ZMBoA==
=kZIi
-----END PGP SIGNATURE-----

--VgxPLBsQjrLMBW0m--

