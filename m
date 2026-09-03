Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8256FC624D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 15:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uWKbj06GMxVM1AmFAtNOW8Qq7f96OKxmUAD1isOqei0=; b=2zLCCLQloZxj3uKwSZTzuaqwC7
	xOOZdByVWGPsHbUgchKqfX0j4AiUO4eAU3S5v4dafQBv9d7FKuda7FuPjMKLN/49BVCTLeKZemxnV
	AK5y0ZjhF47k52xPao/VQ4yi72jh6zEEa7LnWjtramBQZhera79brUp++3VVHZHb0Qm3JzUavIN4i
	FxQkuHZ9Hnmy6FvJU8YS9p8JTgaN3HVUk0p20T2c/r6Kvki5ma5cNmr4H4XSo8FnXfhMiBhMRqsPS
	QvySonKkuvmytsUdo1lYsafF29Kr2BKmEpaKtbHRJ4uB5oKQJ86H81/BvidQ32vLZ25loIDalfD5t
	w/07a1tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x296w-0000000HaFi-205L;
	Thu, 03 Sep 2026 15:12:18 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x296t-0000000HaCd-3s6P;
	Thu, 03 Sep 2026 15:12:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=uWKbj06GMxVM1AmFAtNOW8Qq7f96OKxmUAD1isOqei0=; b=TLDBITNR1KF/EL7KvbL44EZnS9
	TzA/Ndl1x7WVjwCVMd5kR8ifD3PzJsBsYgLZZHVYp/sr5iUMlaTZRMiX71hXoxQpEn4cPN/KtxYeG
	nOcLmRoDFMKcRk3Zw1ZwZ8M8q6ot5H6H9OQPjpgV4DADjNzRZVtcwkMIOkrsH1s4QEAKTL4hKtLtL
	wbi9+Yzrw59C88C/SJdVcMAgBY/P+RDbSd7+79n6ivpWHpFjfju0Ba2iioznX8OfzLHf7pE/Ye0As
	1aQeDLw92XgmkD40iZS8vSPrsH1PV5ZaDlM216ASOBIrxA5KXFwbgD9v7A6YPzONlQ/VpytHxsvXU
	N0U7IpgQ==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 jbx6244@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?B?SMO8c2V5aW4=?= BIYIK <boogiepop@gmx.com>,
 Johan Jonker <jbx6244@gmail.com>
Subject: Re: [PATCH v2] drm/rockchip: rk3066_hdmi: convert to devm_drm_bridge_alloc()
 API
Date: Thu, 03 Sep 2026 17:12:02 +0200
Message-ID: <2814844.6tgchFWduM@diego>
In-Reply-To: <20260824-drm-v2-1-7f9273c6020b@gmail.com>
References: <20260824-drm-v2-1-7f9273c6020b@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_081215_978584_846E621E 
X-CRM114-Status: GOOD (  16.08  )
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

Am Montag, 24. August 2026, 12:21:19 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Johan Jonker via B4 Relay:
> From: H=C3=BCseyin BIYIK <boogiepop@gmx.com>
>=20
> The function devm_drm_bridge_alloc() is the new API for allocating DRM br=
idges.
> This conversion was missed during the initial conversion of all bridges to
> the new API.
>=20
> Signed-off-by: H=C3=BCseyin BIYIK <boogiepop@gmx.com>
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
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

If I'm reading things correctly, the parts in rk3066_hdmi_register setting
hdmi->bridge.driver_private (should use the container field of struct
drm_bridge instead) and hdmi->bridge.funcs are redundant by this change?


Heiko



> =20
>  	hdmi->dev =3D dev;
>  	hdmi->drm_dev =3D drm;
>=20
> ---
> base-commit: 2709dd5ae32f0828f386327c76bba9f39f63a1c6
> change-id: 20260824-drm-e4689f65ab8c
>=20
> Best regards,
>=20





