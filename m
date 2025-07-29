Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FFECC87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 07:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JrYaUMFIZ3r48ANuqZ7TLj/nVH+wJNlb++VCZqUZw9M=; b=3FBaIfO/DFzzufLfOou485+Uk0
	ZJLU80y8N434YWHWX88YMSmdf6REZ+H5gXqPemtwQrjDDirD6yTx9h+bwsF+Hf8ovVsLKzWla1GjX
	1n+a27HCi5r86yi4oruNrMzUoZ8Dh7rF24XhYaeOdXm7P7ebAB9dzM2s7kzQwxsEXSO+oLZQ4RfaM
	PEhhzIU9SumFqP6EHJElF53wC5RsZY9ClgmoZebF/d7GOzRkR+nIV0XaaDLEqyF5cmpk1e6BTgav3
	HSXrgkMTubTxkhEnAVXFW0hpMxjZtoTw1We1X8Oo0gEjRH3KLGb6PtDyNx6Hy+Uqj5p7puJknd+/d
	KU19dmSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uges6-0000000G8WW-1coi;
	Tue, 29 Jul 2025 07:35:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugenN-0000000G7jE-3qFJ;
	Tue, 29 Jul 2025 07:30:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1D7E5601EC;
	Tue, 29 Jul 2025 07:30:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F4FEC4CEF5;
	Tue, 29 Jul 2025 07:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753774244;
	bh=coKTsMLVDBf6r0VF8A4W9McCs0iZm5oFPtW97NBjROg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hn+DvuJy941T5WWhLwdlgRzqUOzSLP9y1hoWzClJzJ5vVihcN4mAJ/fDyXYHjI/EM
	 ht9c+CGHWAofkr9umRMI3SCH5yrzYfr3SU5OTs1MZLiNkFu3gLShgdDjHKBohYn3X3
	 1brGoebiG7IwHSs1sCsh0KjiPQ/4q8cTf6bjbvK6gQUiVx1C0zw7tXMKJVyc/FtYCd
	 bS4XOIOpcq2rVSvaWSYwA13aZnPRnxrKCPwvN2ta1SbuAaDubmbDMtvSogLtT4e+w/
	 zjaLgc6oMH6pwaCByx64pQrnRVGEBkRh+AcvIR7Q9iHvpu4ZoQUWp+OmtsjYB3MnO5
	 aT0k8AE/UEYkA==
Date: Tue, 29 Jul 2025 09:30:42 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	jingoohan1@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com, 
	kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com, hjc@rock-chips.com, 
	heiko@sntech.de, andy.yan@rock-chips.com, dmitry.baryshkov@oss.qualcomm.com, 
	l.stach@pengutronix.de, dianders@chromium.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 04/14] drm/bridge: analogix_dp: Add
 &analogix_dp_plat_data.bridge
Message-ID: <20250729-wooden-opalescent-baboon-f24fa2@houat>
References: <20250724080304.3572457-1-damon.ding@rock-chips.com>
 <20250724080304.3572457-5-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="oafxeh4vinfkct5o"
Content-Disposition: inline
In-Reply-To: <20250724080304.3572457-5-damon.ding@rock-chips.com>
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


--oafxeh4vinfkct5o
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 04/14] drm/bridge: analogix_dp: Add
 &analogix_dp_plat_data.bridge
MIME-Version: 1.0

Hi,

On Thu, Jul 24, 2025 at 04:02:54PM +0800, Damon Ding wrote:
> In order to move the parnel/bridge parsing and attachmenet to the
> Analogix side, add component struct drm_bridge *bridge to platform
> data struct analogix_dp_plat_data.
>=20
> The movemenet makes sense because the panel/bridge should logically
> be positioned behind the Analogix bridge in the display pipeline.
>=20
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  include/drm/bridge/analogix_dp.h | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analog=
ix_dp.h
> index cf17646c1310..15cb6b706e9f 100644
> --- a/include/drm/bridge/analogix_dp.h
> +++ b/include/drm/bridge/analogix_dp.h
> @@ -27,6 +27,7 @@ static inline bool is_rockchip(enum analogix_dp_devtype=
 type)
>  struct analogix_dp_plat_data {
>  	enum analogix_dp_devtype dev_type;
>  	struct drm_panel *panel;
> +	struct drm_bridge *bridge;
>  	struct drm_encoder *encoder;
>  	struct drm_connector *connector;
>  	bool skip_connector;

So it's not the analogix_dp bridge, but the bridge after that if any?

You should probably change it to next_bridge to avoid any confusion.

Maxime

--oafxeh4vinfkct5o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaIh4oQAKCRAnX84Zoj2+
dny6AX4lOggIEb8lQNPrxNej+S0dVv7qskx+vSl0C36fU5HUiF0+6CBKZiz3el7U
6s5d/OkBfjGyQ7uwq5vKT0ASCi71FHRzNGynDjVQB1ShScAr+kp4qhm/0+swkWfl
/Qwui0BIPw==
=5MI3
-----END PGP SIGNATURE-----

--oafxeh4vinfkct5o--

