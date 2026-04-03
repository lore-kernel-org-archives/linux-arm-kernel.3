Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB9D3E85372
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 14:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H0tEXlBaZBiF8E0b5zGSo7wSNH6PmxzoT8wdn5Wle4c=; b=4BDiRHqAr8e/b28ZbNXZRpd+uP
	UvCPHs67KpDg+SL7fbjwvVI0IWPpi8fKWaKs5VoM1ZSY58RCvoRn20RdW+zK/ZXD25up234JIyfag
	UFwpLWfXPx9OLsUfA62X3/Zv6uzUqgiTh+n0zzR8FF6rNV1/+qbYsK07sf7LsblE6NLLHs5MKBw3e
	Qa116IktEmPA+54GAvN5X8F8g4apDTVlH8uevVyKOcGmer7AfmMMAonkM/ggaw04ZGNJfMxxqDr5S
	ZtEupLg6zLHPk9bB6UxqFPkNqX4TUnNgNP77JS/rlj5TUNSDkUZ8NOfJSSdiy/1Uvib8j3IV7zZUs
	8xc1wNtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8fi1-00000002A5D-0oGt;
	Fri, 03 Apr 2026 14:41:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8fhz-00000002A4e-0eoV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 14:41:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4A24E60123;
	Fri,  3 Apr 2026 14:41:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A93C3C4CEF7;
	Fri,  3 Apr 2026 14:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775227274;
	bh=ibcg/0c32l63ELnz6pcHv0xUM+Jh8xoFMgT/DG4WjUw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g47xt+fcI3o8MMhA00xZZwUrsUSzoh1yTpVBh9ylCfGHL/vbpmh0jmCb91bGhW346
	 YANfjpgBZxHb8M6Co7KELDSiSpSpyQNzjlEci+PcLlXvjrq4W87fqtBCW1wEc2Cq0b
	 v0dHgJMaiALVkCrUQdl1WkyUjA/FOyZc1+cPuOsNcmJI6rXN4LqBoX0OSUQ28NGJRB
	 izkDjMe/BANOiECIky5Bar9XTnJiRAvnuZaTSWiYTxrmzqYd9UjFhRvgy3HTyM39K0
	 E1OmQSWB8m9Yefusd85Lr6SRfGcBaK5QX/D6UEXFomexVicVAdRmt8yxmVGc8baicf
	 zN9lJMPbsrbMg==
Date: Fri, 3 Apr 2026 15:41:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Tomasz Merta <Tomasz.Merta@arrow.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"olivier.moysan@foss.st.com" <olivier.moysan@foss.st.com>,
	"arnaud.pouliquen@foss.st.com" <arnaud.pouliquen@foss.st.com>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
	"alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>,
	"linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Subject: ASoC stm32_sai: fix incorrect BCLK polarity for
 DSP_A/B, LEFT_J
Message-ID: <fe1e50f4-30cd-467c-8db0-8af7a9a3abb8@sirena.org.uk>
References: <SA1PR04MB8467CE79DCA58DF65FD9A798935EA@SA1PR04MB8467.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zmpnob42kQqUYH2A"
Content-Disposition: inline
In-Reply-To: <SA1PR04MB8467CE79DCA58DF65FD9A798935EA@SA1PR04MB8467.namprd04.prod.outlook.com>
X-Cookie: The Korean War must have been fun.
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


--zmpnob42kQqUYH2A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 03, 2026 at 02:07:52PM +0000, Tomasz Merta wrote:
> From 553c09cfa84fa801fbd8dcd5c9ae96e94a54ee31 Mon Sep 17 00:00:00 2001
>=20
> Tomasz Merta
> Software Engineer
> E: Tomasz.Merta@arrow.com
> Arrow Electronics | arrow.com
> From: Tomasz Merta <tomasz.merta@arrow.com>
> Date: Fri, 3 Apr 2026 10:33:11 +0200
> Subject: [PATCH] Subject: ASoC stm32_sai: fix incorrect BCLK polarity for
> DSP_A/B, LEFT_J
>=20
> The STM32 SAI driver do not set the clock strobing bit (CKSTR) for DSP_A,
> DSP_B and LEFT_J formats, causing data to be sampled on the wrong BCLK
> edge when SND_SOC_DAIFMT_NB_NF is used.

Your mail is pretty mangled here, there's a HTML part and the patch
appears to be appended after a signature, it looks like all the tabs got
converted into spaces too.  If you're having trouble sending b4's web
submission API:

   https://b4.docs.kernel.org/en/latest/contributor/send.html

bypasses your mail infrastructure which tends to make life easier.

--zmpnob42kQqUYH2A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnP0YQACgkQJNaLcl1U
h9CehAf+KeIAvH9Na4hWFjXfP9Vk5S2dwRr3ytLXIbhh7UH/s2xaoP70u8WyBDSl
4OQapxRTHOuPfq8a/o/or1KXCgl+zsOFW3WOfwYIAd5yiqjcQQCFwUfv/yuzurAh
ungTZRxN6rqEKKgeUbbFHAPU+5SIB9+wD1S2P4IVRDf3vrpW3FsOmh1uPmh9wM7b
QGZpUu3MHHJhUXMJ2smG5MIaTY1+47VPCPjsqNo/xIn1iFBsSx8ibuFYJRXBz11O
0fxpLliVt0IZUmHjhRSw3DsmUbZUA1SgNX63JTGc+bVarqrnHqF7z8tTKdot6UeQ
6nFxKe5DR1YdEAD9wKW6XfoTaV9HYg==
=Gdk7
-----END PGP SIGNATURE-----

--zmpnob42kQqUYH2A--

