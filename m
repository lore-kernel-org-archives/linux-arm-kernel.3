Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED200D13C1B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 09:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qN+tpQ1BiZ+//HmA3wCEosCk0bNBvxeWcXDKb6cigNA=; b=tNLXchDCWUjeV0rHrmeJ7oGoj4
	fDCrPgF3NF3AfDA5qPLTSPuk28YStU21HKFSwYlv+QVRYxC/2NwkYKrXMFfSS3Ctvae1huo0w9yS6
	/Rk2aPPMxH9rWnNu+0KdlRHIh2PZY8xVWNfmSw9RjML4PUkkZot6mLplAF7C4hXSXWmyVxgduyGh8
	qmqB6Rp7+hXIzbcoTrfj0DFInz4w6ehZiJvoeiB1m+kf7JRJGnU003erjZK3yh/e2DhP8Uj5iKvLo
	3york8ZcU87/G1EUfOzzpKKVaBeBMS30sP0exaVqVi9Z3LCwj726+8PBzD2YffyqBOj/46ZQXjb23
	mp2FN1Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfVu-0000000DxI9-3Xs5;
	Tue, 27 Jan 2026 09:37:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfVm-0000000DxGl-3oC1;
	Tue, 27 Jan 2026 09:37:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EAEBE60097;
	Tue, 27 Jan 2026 09:37:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23707C16AAE;
	Tue, 27 Jan 2026 09:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769506645;
	bh=kW6QRj1KHFAisJA+DUtpLIHXA+CHWOk19fvX1z86acc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pBesd8suneqE+ep6Zoo3I2+szbwRdxAk4WqwcxQkPkgMbp5jjSbSk2ViOlcOKpBf6
	 YJbJTsRlq2tFyCFaZNpNwj4AZwaYFShutMjSLNGy/5cubxB/hDF2XDKHA/VbbcAYlM
	 EyF8uQSegvrjHjqZbosTR3TNc5ozp02n2KkYKCAPkUvdThL5ljW2xSBF/T+tEnAVod
	 S9AT8dTaT7I/u1NtNYxO3nO9WKSHanC+2ckfWNS/oNZQ6Za7dvs+Ayz55Z+uNJbh6y
	 VgELspYxfOhH35nDjZr/y9+Gm0jJbm4lwxfaCyPApA+aR8w2xKTI+V0jk+s0VLxhWb
	 XdWApszp5PH3w==
Date: Tue, 27 Jan 2026 10:37:22 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Ryder Lee <ryder.lee@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org, Felix Fietkau <nbd@nbd.name>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH wireless-next v2 1/2] wifi: mac80211: Add eMLSR/eMLMR
 action frame parsing support
Message-ID: <aXiHUlHmrKz8JgXS@lore-desk>
References: <20260125-mac80211-emlsr-v2-0-466329d61c88@kernel.org>
 <20260125-mac80211-emlsr-v2-1-466329d61c88@kernel.org>
 <01e62344994a34daae0666b3873aa98e72fb5850.camel@sipsolutions.net>
 <aXftjdCtqnQk69ys@lore-desk>
 <b592a6c9a8f59f112b2221b9a46568769b1e9dcd.camel@sipsolutions.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tGRs4KgtXgG4/Ty3"
Content-Disposition: inline
In-Reply-To: <b592a6c9a8f59f112b2221b9a46568769b1e9dcd.camel@sipsolutions.net>
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


--tGRs4KgtXgG4/Ty3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Mon, 2026-01-26 at 23:41 +0100, Lorenzo Bianconi wrote:
> >=20
> > > Per spec I'm also not sure what the MCS map should be when it's not
> > > included in the frame?
> >=20
> > IIUC the mcs map value are supposed to be in Operation mode notificatio=
n frame
> > just for eMLMR. I think the driver should check if the bit is set in
> > ieee80211_eml_params control field to verify if mcs_map_bw values are v=
alid.
>=20
> Yeah you're right, the MCS Map is always present if EMLMR Mode is set to
> 1. I thought it was also optional and then what values should you use?
>=20
> Can't mac80211 validate the values?

I guess we can validate eMLMR Supported MCS and NSS Set subfiled according =
to
the table 9-417t available in P802.11be standard.

>=20
> > Reading the standard, it is not clear to me if mcs map values are suppo=
sed to be
> > added in the Notification frame sent by the AP. What do you think?
>=20
> Hmm. I thought no, but then the language says it's present when the
> EMLMR Mode is set to 1, so ... it would have to be? Strange, because
> it's not really defined (well) in this direction.
>=20
> OK, I guess the memcpy was right after all:
>=20
>    An AP affiliated with the AP MLD that receives an EML Operating Mode
>    Notification frame from a non-AP STA affiliated with the non-AP MLD
>    should send an EML Operating Mode Notification frame to confirm the
>    mode switch at the AP MLD to the non-AP STA with EML Control field
>    set to the same value as EML Control field in the received EML
>    Operating Mode Notification frame from the non-AP STA before the
>    transition timeout expires.
>=20
> But I think better restrict memcpy() then to just the EML Control field
> and build the action header etc. directly.

I guess we can just memcpy() control field + link_bitmap (if present) +
eMLMR Supported MCS and NSS Set subfiled (if present). Agree?

Regards,
Lorenzo

>=20
> johannes

--tGRs4KgtXgG4/Ty3
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaXiHUgAKCRA6cBh0uS2t
rPFrAP9U5RInNCg8lzoLRgQI/9uuSh9XghVNRgnh/e9FWA2hgQEAxUM+Se7rKHSk
yA0+GV3G+INjnnXvmkBzfwRINc9uJAE=
=iYd0
-----END PGP SIGNATURE-----

--tGRs4KgtXgG4/Ty3--

