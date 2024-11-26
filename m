Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA38CD3B9AC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 15:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Rt7X6trwtI4ie0hc51FZJdn4GbvbMtfe8wO6UjtBzw=; b=v4I8Fe2jW4uvAc5nqG2DAVFXk1
	gtr2e5hk2oQ7jALHAExFCrveoVwKnL3CUwyabpYVaCN730LC7VthNWACQuFfvB3Z6jpI/25pnmXrb
	raPMeWalwV9SJag1GZyFlmFNhE7a/Nai9nu3+x3bfBp5AEDU0FKiZE6OoIjuuyOs9Ry6jzxqTox3+
	E/v+zthkvHdN6xZpaUmJA6YcO3ysNERpshMtRd1yPeKAxm/1Lzs0JB+8rFu5i9dGZBwaJT+jfwCMc
	CJXAjh0uUdlY+vF1jYzHZUJWlAk8Dzn3ZOmaCWaRnqXZSQkQyqF5c1KHFVBITx4V4+TUTZKI/Wmf1
	DHlebNXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFxq2-0000000B3SX-13nD;
	Tue, 26 Nov 2024 15:50:54 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFxp4-0000000B3Jt-2zd9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 15:49:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D3E6AA4068C;
	Tue, 26 Nov 2024 15:48:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2231EC4CECF;
	Tue, 26 Nov 2024 15:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732636193;
	bh=6Rt7X6trwtI4ie0hc51FZJdn4GbvbMtfe8wO6UjtBzw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P8xuwu7sljAdjyfrf+RgyQtiiUPiAvBND0E7GJKfgtMXKO7b2Dirk9Z69rkLX5U93
	 9oL+NRUzPoh8B66YJTC4vdSy0qsyqrqF23DrC+klqLF02NtyfX2TsVl8bJnovzIK8I
	 qbQJhIVt7w4Etk2f1T8ISxhrDbbx7YpoHn6aaTB+X3i78RofhU4tnTyNY1TFHsqD21
	 iUWgLBqJyuYVgi/a8Ypn/ylYz+u5T3thSUKT5f0OX3evZi2d92ZMdojGOTg+QjBnVv
	 zhUujVEK0bnX655teG4S/T2pY68QY3aqPeGlierI88/+395AN7zrwztaWvOVxiY4R3
	 jAvEAgdK+9bHg==
Date: Tue, 26 Nov 2024 16:49:50 +0100
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
Message-ID: <20241126-tentacled-busy-catfish-c451fc@houat>
References: <20241125-dsi-relax-v2-0-9113419f4a40@geanix.com>
 <20241125-dsi-relax-v2-1-9113419f4a40@geanix.com>
 <20241125-gleaming-anteater-of-perfection-42bd2b@houat>
 <874j3uxptp.fsf@intel.com>
 <20241126-spry-wildebeest-of-cubism-da0a9e@houat>
 <871pyyxjwz.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="g7loz4mo7azlnu2z"
Content-Disposition: inline
In-Reply-To: <871pyyxjwz.fsf@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_074954_878945_1932BB58 
X-CRM114-Status: GOOD (  22.65  )
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


--g7loz4mo7azlnu2z
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/3] drm/modes: introduce drm_mode_validate_mode()
 helper function
MIME-Version: 1.0

On Tue, Nov 26, 2024 at 02:24:12PM +0200, Jani Nikula wrote:
> On Tue, 26 Nov 2024, Maxime Ripard <mripard@kernel.org> wrote:
> > On Tue, Nov 26, 2024 at 12:16:34PM +0200, Jani Nikula wrote:
> >> On Mon, 25 Nov 2024, Maxime Ripard <mripard@kernel.org> wrote:
> >> > I wonder about the naming though (and prototype). I doesn't really
> >> > validates a mode, but rather makes sure that a given rate is a good
> >> > approximation of a pixel clock. So maybe something like
> >> > drm_mode_check_pixel_clock?
> >>=20
> >> Quoting myself from a few weeks back:
> >>=20
> >> """
> >> Random programming thought of the day: "check" is generally a terrible
> >> word in a function name.
> >>=20
> >> Checking stuff is great, but what do you expect to happen if the check
> >> passes/fails? Do you expect the function to return on fail, or throw an
> >> exception? Or just log about it? If you return a value, what should the
> >> return value mean? It's hard to know without looking it up.
> >>=20
> >> Prefer predicates instead, is_stuff_okay() is better than
> >> check_stuff(). Or assert_stuff() if you don't return on failures.
> >> """
> >
> > Both is_stuff_okay() or assert_stuff() return a boolean in my mind. If
> > you want to return a mode status enum, I don't think they are better
> > names.
>=20
> Most functions returning enum drm_mode_status are called
> something_something_mode_valid(). Not check something.

But it doesn't check whether the mode is valid or not. It checks whether
a given clock rate is within reasonable tolerance from the expected
pixel clock.

Maxime

--g7loz4mo7azlnu2z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJQEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ0XuHgAKCRAnX84Zoj2+
dohPAX0YE0oc7Ylv3K+UerPmQNwXmwiAn6twEbExXtsLUXP4id5aKXyzo9JTq04u
X1BMcUcBeKSLYRTuhVuJctlLHOuKqmXClpJuleYA41+uZ/r34Z8EwLT1++YgVE/q
CITAXPq+
=/XnF
-----END PGP SIGNATURE-----

--g7loz4mo7azlnu2z--

