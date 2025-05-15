Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03CC2C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 10:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u4vCEhf0tuofP/FlACuSL9U1yPeXWj9GPXSjiFndkNs=; b=PtBgnRWq+VF9CEqQCfGdXYYxAY
	leRzTCt4NAveOezrD3NxIfvNPAk2URGeAjgdqwDk+WmCWnjB1/221QTD30QHkjsH4mHtNHGfy92mS
	GBxLAF+N1/pPECSA1R9Ok0bWOqsFst9A9kfoLqrlfYZvONhklRtFtMxXe7Ta2DiZJU8KzV1Bj3ei5
	L2mf0nxjqzgCCakotmQ3FZX1B1e6o7A8zGaGlJyHQy9GpbpgVdBF8qMkVz+zt8z1LDQLGhJJ7Yc4G
	paIfAy9xy8atBaMLAYa2+lYfrdxh3/olJTwiU0Jhyoh/JZWrkVzrUCxbcUCWWdbwCsvWA5wpom8Xr
	YbxiNIRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFVXK-00000000GE2-2Zqg;
	Thu, 15 May 2025 10:09:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFV0Y-00000000BEj-0HWM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 09:36:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7C9DD614BC;
	Thu, 15 May 2025 09:36:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E3EDC4CEED;
	Thu, 15 May 2025 09:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747301765;
	bh=jMrgzyHH+4V9t/iPtHENc2OSX0TATtWm0B0KKLwDmC8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r4gfy4j4xEx5H9jAzEyhxdiQ9ifxSASjtba1zdKjs1BNs98NwIFL0NIaHt3U/9+xM
	 csrpFI4J6CbH9YwJECNPaCUZC4NKipnyDyPt8sJa3iiVMg9IllfvP9ePu6fgV+TEwr
	 03SEi6uwBRS7M8AiK1neXCTeK0ReaVBsfU1rqZvrR41QwpcS59b1VYvRYxm6lFi+8f
	 2uo/25Jg8fUkgKwEph20KLl1mCtM2CtzceS41jXwjug05/g3X77TJ7Basi2la/whFy
	 fBQB0w5JQFW/uTaIUCgCqosD1N8ICNuzx/wAxCNzQebwRupXzWZd541z3MYZsIgg9r
	 SzsCaFDsdbvkQ==
Date: Thu, 15 May 2025 11:36:01 +0200
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?B?Q3Pza+Fz?= Bence <csokas.bence@prolan.hu>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Vinod Koul <vkoul@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: Re: [PATCH v6 0/2] Add `devm_dma_request_chan()` to simplify probe
 path in atmel-quadspi.c
Message-ID: <aCW1geupMxr8Ft_k@finisterre.sirena.org.uk>
References: <20250515083132.255410-1-csokas.bence@prolan.hu>
 <aCWpjplhAXUvr9fj@finisterre.sirena.org.uk>
 <e4e6c7a9-9b7a-4012-8bda-75804229ec95@prolan.hu>
 <aCWyXsJ2iRXRUmOi@finisterre.sirena.org.uk>
 <9d384301-3f73-4120-a82b-580eb5f1a4ed@prolan.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NxtmzHfUyS5BkEzS"
Content-Disposition: inline
In-Reply-To: <9d384301-3f73-4120-a82b-580eb5f1a4ed@prolan.hu>
X-Cookie: Well begun is half done.
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


--NxtmzHfUyS5BkEzS
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 11:26:57AM +0200, Cs=F3k=E1s Bence wrote:
> On 2025. 05. 15. 11:22, Mark Brown wrote:

> > Wouldn't it be simpler for me to just apply both
> > patches at this point if there's no conflicts with the DMA tree?  We're
> > at -rc6 now...

> That also works for me. I should send 1/2 to you as well, correct?

I think at this point with the merge window likely to open on Sunday
it's probably easiest to just resend the SPI patch after the merge
window, it'll likely take more time/effort to work out what to do than
it will for the reset changes to land in Linus' tree.

--NxtmzHfUyS5BkEzS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgltYAACgkQJNaLcl1U
h9BBaQf/Y2QB39oFyw1a8a615Yo/UKKHjc5SIVYLNpWPvaUCfqwEMIDB3TIb0cz3
3EfT+LI7v7qk0Fzz7n0f+t/zy6pPD2MjhO7Fd3KH1K+v7hmRmJMe7Nz9iaUM6OLQ
1A6p5SIr67X/AgQM4+whaAoR6ZWuRfNYv02Qg5b9jPF57Ih0YWym6x0HfwHJHUoC
nSpTAHjL3ZNlcNc5PprSsjXRo/i8rhbUWZ2+Lzkx5e0PsYILC5Tw2TZ/iHK0PjVz
5k5kroQd4xBiVLcWpBloLrH7zUOz7ti1rODFes28up/FStyALrKVzZj4nr3E9DiZ
XgFw3I8px7JESImWR9zH1H0C3rRtcA==
=tWy1
-----END PGP SIGNATURE-----

--NxtmzHfUyS5BkEzS--

