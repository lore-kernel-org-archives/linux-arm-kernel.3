Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C62AC5DF8C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Aug 2026 19:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/W6mkeoXvnonMNZUI3njI0qG2gH3SwBOtWLJBh8UHlM=; b=J0yNqeGCjys3uqm913rDGYWRHF
	LJNubKrXkYqPn9zcEk7nkF0GLn2U2u9Mzt11amA02AkL7Kjwi18H+EiAQinQLCuHtXAt3pfLpUIFq
	u3ol2IkdMlaBRrxvlJ5cNCMqRkltyAvqZ9pCv1PSAvpY4zvWyb4df9tV/hnFrkOqzzLnmcwg1/FB/
	LzvfbaMJWz81wuCTBfVD2LgcMbgoT7tOVt6AHnP7QL24rWa+bUc5eX+xuKKdHE+3SAagJrpurNe6O
	U+9zyBfvgojLN15U6iYIgFgFIfel372fHFJImaybjmSaRWtym6YQg6Fv0TJzhPHdpSfT92eSHEtbC
	YC8mqLvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyDap-0000000FY6M-3tJJ;
	Sun, 23 Aug 2026 19:10:55 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyDan-0000000FY5s-3tIk;
	Sun, 23 Aug 2026 19:10:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=/W6mkeoXvnonMNZUI3njI0qG2gH3SwBOtWLJBh8UHlM=; b=o6pulzMO03REegWhuuub+t8v3d
	fsJQF+E0p8GSd/S95Kwk/5mdjKiT0tPOtr3GvhNT+YDv6MiP6wpgBzKBT9JQjUtvPr0JFQNcnb6ta
	r5cJZQYy7vXGMgiyppwKTAxnTN9wfgUoGNaV9o1NqbAxEU1i66C0thPUmBlS4c5cJ7vQnExVl6mVk
	xPkijEuj3K2TuqXest7lqlNETwhQ6mH+OorjXwNflJek0MQiSy+HXpCQvohTq4ZviqXU9Ji4YL7yh
	npchf11iQcDW46NEXtLXcJHWntRZIPPnLY8ch9lN/wzs6yJuI9m+7mmHA2OmVQSxS2Un3YT9MN3Em
	ZyZ+uCrw==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Johan Jonker <jbx6244@gmail.com>
Cc: hjc@rock-chips.com, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] drm/rockchip: rk3066_hdmi: convert to devm_drm_bridge_alloc()
 API
Date: Sun, 23 Aug 2026 21:10:31 +0200
Message-ID: <9306866.NyiUUSuA9g@diego>
In-Reply-To: <dea8a038-577b-45da-bff3-703e9099b7e1@gmail.com>
References: <dea8a038-577b-45da-bff3-703e9099b7e1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_121054_049359_B01C2C46 
X-CRM114-Status: GOOD (  16.58  )
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

Hi Johan,

Am Sonntag, 23. August 2026, 14:47:25 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Johan Jonker:
> The function devm_drm_bridge_alloc() is the new API for allocating DRM br=
idges.
> This conversion was missed during the initial conversion of all bridges to
> the new API.
>=20
> Signed-off-by: H=C3=BCseyin BIYIK <boogiepop@gmx.com>
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>

the authorship is ambigous here. First Signed-off-by should be from the
patch author, yet this one makes you the author.

So either the author needs to change or the signed-off-by line
needs to go.


Heiko

> ---
>  drivers/gpu/drm/rockchip/rk3066_hdmi.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/roc=
kchip/rk3066_hdmi.c
> index f28d6a883e09..39c65ee07caa 100644
> --- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
> +++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
> @@ -703,7 +703,6 @@ rk3066_hdmi_register(struct drm_device *drm, struct r=
k3066_hdmi *hdmi)
>  			 DRM_MODE_ENCODER_TMDS, NULL);
> =20
>  	hdmi->bridge.driver_private =3D hdmi;
> -	hdmi->bridge.funcs =3D &rk3066_hdmi_bridge_funcs;
>  	hdmi->bridge.ops =3D DRM_BRIDGE_OP_DETECT |
>  			   DRM_BRIDGE_OP_EDID |
>  			   DRM_BRIDGE_OP_HDMI |
> @@ -747,9 +746,10 @@ static int rk3066_hdmi_bind(struct device *dev, stru=
ct device *master,
>  	int irq;
>  	int ret;
> =20
> -	hdmi =3D devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
> -	if (!hdmi)
> -		return -ENOMEM;
> +	hdmi =3D devm_drm_bridge_alloc(dev, struct rk3066_hdmi, bridge,
> +				     &rk3066_hdmi_bridge_funcs);
> +	if (IS_ERR(hdmi))
> +		return PTR_ERR(hdmi);
> =20
>  	hdmi->dev =3D dev;
>  	hdmi->drm_dev =3D drm;
>=20





