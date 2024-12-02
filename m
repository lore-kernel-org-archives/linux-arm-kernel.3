Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28244D78305
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 10:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bxf7ptTN3ZmAyqiKVcm3TU75y1Lyq7wLy3EsFVgDkGI=; b=gC8+Vm5adnZfX+PBRStDp1OErF
	XRWhlHOWGBt+Apmn77WMU+pKYRWCYJQVY5i5Y9AIfoVA9NlLnK1D69f3+bURNE32UN78v6uo4YFoo
	7fzuprvMXjqMhdxLy0xDZMYiwHxQQtG7PymE3QLK+9HMelwhtEAh1STZTGi5TzJe5TEn3sZwLY6Ps
	qvf6XfMx48XXZig7vKx1KDmDzJcyPZy/K8LbG6ESmdmmMp3FebAcJiTEUXid+fbOhodFZ3tf4d8LR
	GoOy3CmLuMr/ooz9UP+kBf6rv2SgtpNRdB3v64Nw2OgwelmKdd7WUlkzWcuX+p4KygRFCxqkmMtqO
	GBiLP7Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI3kF-00000005kAh-2oV8;
	Mon, 02 Dec 2024 10:33:35 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI3j7-00000005juw-11an
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 10:32:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 21149A409EA;
	Mon,  2 Dec 2024 10:30:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5FD1C4CED1;
	Mon,  2 Dec 2024 10:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733135544;
	bh=YNX+vtim4wPZJIk1OfZDjYYPEiiBQR0VOr9a8vWD2QI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I63s1N3zfrfrbvkEfMtGs435oMJwprLnFVwyqZGSUHQWnx0D/JaOjCQ2O+6PPA9C9
	 EwC7O5rtJBaZR4eUArUUJ/+7q1n2WALsdEnRHSGva1EHwPg7yiSmpFoYO3Ep7q43/S
	 lUQBDtk2TfOpunkcn61IIS95BWSHPFP58kc8MuLbJNZYRAgmEKwpADKq16qXNLIze5
	 CtluBevWFNMxVf4Hitg8FJ3kRLoWWrRY5L5fXdTdSu3u51+1OR1L4CxpTFWeaAiVkW
	 AuRFHNnIWMVJMQpstRhHlGboHN8bBbyOJ23v/riDQPRs9jYYkeDjbHimeZy/UcUKtf
	 2vaNkplqCFosQ==
Date: Mon, 2 Dec 2024 11:32:21 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Sean Nyekjaer <sean@geanix.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Yannick Fertre <yannick.fertre@foss.st.com>, Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
	Philippe Cornu <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 1/3] drm/modes: introduce drm_mode_validate_mode()
 helper function
Message-ID: <20241202-nickel-rottweiler-of-hail-c9ec8b@houat>
References: <20241125-dsi-relax-v2-0-9113419f4a40@geanix.com>
 <20241125-dsi-relax-v2-1-9113419f4a40@geanix.com>
 <20241125-gleaming-anteater-of-perfection-42bd2b@houat>
 <bfuj6w6hsbfpdw24th6dl3ugvj45op6jb45gx5ab5pulud7hiz@o2zbn45z3lt4>
 <tzcjzgp7xalhhezcv5hfa7cjscxg44phqcw2ap54lesly4gk6o@6dtco2d3jahj>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="ivbwnrarbwqca5xp"
Content-Disposition: inline
In-Reply-To: <tzcjzgp7xalhhezcv5hfa7cjscxg44phqcw2ap54lesly4gk6o@6dtco2d3jahj>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_023225_410714_1CA8558A 
X-CRM114-Status: GOOD (  16.44  )
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


--ivbwnrarbwqca5xp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/3] drm/modes: introduce drm_mode_validate_mode()
 helper function
MIME-Version: 1.0

On Tue, Nov 26, 2024 at 02:30:53PM +0100, Sean Nyekjaer wrote:
> Hi Maxime,
>=20
> On Tue, Nov 26, 2024 at 08:36:01AM +0100, Sean Nyekjaer wrote:
> > Hi Maxime,
> >=20
>=20
> [...]
>=20
> > >=20
> > > We probably need some kunit tests here too.
> >=20
> > Good idea, will be my first :)
> >=20
>=20
> Would something like this work?
>=20
> diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers=
/gpu/drm/tests/drm_hdmi_state_helper_test.c
> index 294773342e71..26e4ff02df85 100644
> --- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> @@ -1364,6 +1364,7 @@ static void drm_test_check_output_bpc_format_displa=
y_rgb_only(struct kunit *test
>  	struct drm_connector_state *conn_state;
>  	struct drm_display_info *info;
>  	struct drm_display_mode *preferred;
> +	enum drm_mode_status mode_status;
>  	unsigned long long rate;
>  	struct drm_connector *conn;
>  	struct drm_device *drm;
> @@ -1408,6 +1409,9 @@ static void drm_test_check_output_bpc_format_displa=
y_rgb_only(struct kunit *test
>  	rate =3D drm_hdmi_compute_mode_clock(preferred, 12, HDMI_COLORSPACE_YUV=
422);
>  	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
> =20
> +	mode_status =3D drm_mode_check_pixel_clock(preferred, rate);
> +	KUNIT_ASSERT_EQ(test, mode_status, MODE_OK);
> +

Not really. You need to test that function, and ideally only that
function, with a bunch of random inputs, including the error conditions.

Maxime

--ivbwnrarbwqca5xp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ02MtAAKCRAnX84Zoj2+
dsuWAX0eSysvVggNKHnyuBE+8Rz7YOBscN6mBZYUgtssEAyp5cpCoqjzQx8yMf5Z
kDz+dB8Bf2t8VtXvAAOtTW5epqM0PuPE2F67EoJN+5eQBc95ywPDx51OucBNqL3Y
Ja65ubL3mg==
=gqfV
-----END PGP SIGNATURE-----

--ivbwnrarbwqca5xp--

