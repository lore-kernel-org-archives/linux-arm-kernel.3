Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F51D3B987
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 12:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X1ZW6fAmw9BsbKNLM84F8Yh9PGsgTv9DvBZGDJRKcPQ=; b=qHnFftCssHVhrQaZXwSUvEJu7P
	d9sHyyQFxmb4atJelIKC2/763y38d47F4R9GvpoFLNe6VNzw0N07QeYdsqFeFPryEe8VEj+fbHyOw
	btZUHv3fR72Ge0yf64j+7UC36uWb7R6eBdEJTuQti16ezzEJJkB4aeult9Cx5/XxnLF7rY9m9VuKZ
	A1wHIVPEqp9FmcaAFWC1YS3c5wIls2/q7Uuab1EgUlzPLJ+DHNeP3Yk0c6N3iEXVUhL17sgoTvNHW
	IMET0diNoZjOBFohqLFklU7Waz2n9WQydPzueyQ6nYmoxM3aAewgnUmtV+GR17dtBcxT6/EKR2khu
	BZPeopMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFuPP-0000000AXNV-38pG;
	Tue, 26 Nov 2024 12:11:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFuOJ-0000000AXAm-2DXe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 12:10:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 75C565C4C12;
	Tue, 26 Nov 2024 12:09:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4227AC4CECF;
	Tue, 26 Nov 2024 12:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732623002;
	bh=X1ZW6fAmw9BsbKNLM84F8Yh9PGsgTv9DvBZGDJRKcPQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZJYxmWMrgHFfFMx4SZZpmRSPoxZkpZdW9Fzl0DNJVl9iZcJ9LACkFNimQ/Zl9Ggy3
	 SYCmCDCBy3wYS/4BAHyvqBSpdevfR2A8+Cl0poDBsaqFAiVPtYI4ZQNn2Ms/nXmQS5
	 B/UrH8sh1oOZZQLERhS2NMh5SThIcY98v8FukZxyJm5VP1r2O666m32kVPiCbDWwMI
	 NeeMi+iCzohnE5XpteEv/7Om1Ca0sbx5DmiPYy2VCMROZDM0dKBJnbXfWeQXAyW6i1
	 GaqOFZ7w3KO5d/7R8FWJR/goyXglI4rOOwcqF6zVI3DKQH1O1UjUQx+UM9YEv1s9DQ
	 YGDLHXsFjAikA==
Date: Tue, 26 Nov 2024 13:09:59 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Sean Nyekjaer <sean@geanix.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Yannick Fertre <yannick.fertre@foss.st.com>, Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
	Philippe Cornu <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 1/3] drm/modes: introduce drm_mode_validate_mode()
 helper function
Message-ID: <20241126-spry-wildebeest-of-cubism-da0a9e@houat>
References: <20241125-dsi-relax-v2-0-9113419f4a40@geanix.com>
 <20241125-dsi-relax-v2-1-9113419f4a40@geanix.com>
 <20241125-gleaming-anteater-of-perfection-42bd2b@houat>
 <874j3uxptp.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="qwww7zw5ccyu53nk"
Content-Disposition: inline
In-Reply-To: <874j3uxptp.fsf@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_041003_657289_D87CC47F 
X-CRM114-Status: GOOD (  18.77  )
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


--qwww7zw5ccyu53nk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/3] drm/modes: introduce drm_mode_validate_mode()
 helper function
MIME-Version: 1.0

On Tue, Nov 26, 2024 at 12:16:34PM +0200, Jani Nikula wrote:
> On Mon, 25 Nov 2024, Maxime Ripard <mripard@kernel.org> wrote:
> > I wonder about the naming though (and prototype). I doesn't really
> > validates a mode, but rather makes sure that a given rate is a good
> > approximation of a pixel clock. So maybe something like
> > drm_mode_check_pixel_clock?
>=20
> Quoting myself from a few weeks back:
>=20
> """
> Random programming thought of the day: "check" is generally a terrible
> word in a function name.
>=20
> Checking stuff is great, but what do you expect to happen if the check
> passes/fails? Do you expect the function to return on fail, or throw an
> exception? Or just log about it? If you return a value, what should the
> return value mean? It's hard to know without looking it up.
>=20
> Prefer predicates instead, is_stuff_okay() is better than
> check_stuff(). Or assert_stuff() if you don't return on failures.
> """

Both is_stuff_okay() or assert_stuff() return a boolean in my mind. If
you want to return a mode status enum, I don't think they are better
names.

Maxime

--qwww7zw5ccyu53nk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ0W6lwAKCRAnX84Zoj2+
dpfkAX9rQ95STenTbFaPTqzNs0f3hXHKnVKDzQwlwme3v/FEzAw3GEWZWO1BNFdE
ChoLbYwBf06ASgUEBRxVk52nFUsJogUobfhi2/VS/xGu8+SOUnSsG50ueId2dS+n
zeEpgo7ogA==
=OHka
-----END PGP SIGNATURE-----

--qwww7zw5ccyu53nk--

