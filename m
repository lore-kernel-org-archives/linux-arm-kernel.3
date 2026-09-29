Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47FB4CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 10:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vDzNTT02zt+wvaM8pqF5ydSpcFMbs2MwM69X6UfbOQA=; b=2nwFHXnZrRbG6v1D9ehox81xoE
	i2MCe68Rj6P0Zc81O6HOx6dBLZnqmt9NpR4d3XQFEq/+thI7guSoBF4+4j/FLieAgchGZJbAbHh5B
	W3J0j1nnzpInkudzdUpBykRGY8umQEFWscwZU38dj0G/0YYDfcF+RRISzQulnBoPJI3ZeDO0zCx9B
	drucQnDkS8aYV6w3wM5KVS0MRU9/4ltxPHt1okQhPQO+sarXCgV1d6m5ro2IJSLjlKMTjTAs5jFrl
	v7mil/cFd2vX0LEA/et2HDAu1fWrY2SSgZnPwBumgMwdhMdtOwo70QHzHp5phY9YVuK8OIxwjC/Xt
	V3Z5RoYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBVNB-00000003JTP-1PQj;
	Tue, 29 Sep 2026 10:47:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBVNA-00000003JT4-1brB
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 10:47:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=vDzNTT02zt+wvaM8pqF5ydSpcFMbs2MwM69X6UfbOQA=; b=cYffetYMfvxkMz7pcdSCDwIccI
	45gyBfx4NXdnttbEdxPGoJgrMmjmyHUCN3g+ir2f0UxWDpvPQ8aRv58VkE2yU/U35Lyzk2HXNGO8l
	fqEWBSeIZHDRize6h9Xn4kl75Hmb+AK50utupqFIBEeFe0SoYp2WfHtmUZoZ2T+gSwRdIFwLtb/VV
	+AKcNUzAREUJ/JOsaJPBRQa5REp60KmjQPao60L2qRDyq13MJaoxsnGsJs8/zyYotPNUGGr9Y41U7
	wxeP8aywGChISvXH6AgU0aLLO6npFIFw3g/bgFdAEFKGqGIR7ZU4JstqaBtQ8+Wy4YyzAl5oe2yhA
	RtjUtoBw==;
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBVN6-00000002WCJ-12bo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 10:47:43 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [120.85.96.244])
	by APP-05 (Coremail) with SMTP id zQCowADnUDs4l7tqMf2qCQ--.2178S2;
	Tue, 29 Sep 2026 18:47:21 +0800 (CST)
Message-ID: <e11d8db56fc0633598d191c49b96d286046c506f.camel@iscas.ac.cn>
Subject: Re: [PATCH 2/7] drm: verisilicon: stop using deprecated
 devm_drm_of_get_bridge()
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Frank Li	 <Frank.Li@nxp.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Andrzej Hajda	
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman	 <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Dave Stevenson	
 <dave.stevenson@raspberrypi.com>, =?ISO-8859-1?Q?Ma=EDra?= Canal	
 <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance	
 <kernel-list@raspberrypi.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Arnd Bergmann <arnd@kernel.org>, Doug Anderson <dianders@chromium.org>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>,
 Thomas Petazzoni	 <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, 	imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, 	linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Date: Tue, 29 Sep 2026 18:47:20 +0800
In-Reply-To: <20260929-drm-fix-of_get_bridge-build-regression-v1-2-ccb7e602daad@bootlin.com>
References: <20260929-drm-fix-of_get_bridge-build-regression-v1-0-ccb7e602daad@bootlin.com>
	 <20260929-drm-fix-of_get_bridge-build-regression-v1-2-ccb7e602daad@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-CM-TRANSID: zQCowADnUDs4l7tqMf2qCQ--.2178S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuFy8CFyfWw1xWr47Xw13Jwb_yoW5GFyxpF
	4jqa98trWUXrWxXa1jkF4jkFy5AasrK3yrGFWUtw1FvF1FqF1DGF1kAry5AFW5CF17GF1r
	tr4DArWS9F18AFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvlb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvj
	DU0xZFpf9x07jTc_-UUUUU=
X-Originating-IP: [120.85.96.244]
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_114741_116035_4E6488C7 
X-CRM114-Status: GOOD (  16.54  )
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

=E5=9C=A8 2026-09-29=E4=BA=8C=E7=9A=84 12:36 +0200=EF=BC=8CLuca Ceresoli=E5=
=86=99=E9=81=93=EF=BC=9A
> devm_drm_of_get_bridge() is deprecated, switch to
> of_drm_get_bridge_by_endpoint(). As of_drm_get_bridge_by_endpoint()
> returns
> a refcounted bridge, ensure it is put by using bridge.next_bridge.
>=20
> Fixes build failure when CONFIG_OF is disabled.
>=20
> Fixes: aa8a8c7e4641 ("drm/bridge: panel: move all code to
> drm_panel.c")
> Reported-by: Arnd Bergmann <arnd@kernel.org>
> Link:
> https://lore.kernel.org/r/20260928161605.2271412-1-arnd@kernel.org
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Acked-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>

Thanks,
Icenowy

> ---
> =C2=A0drivers/gpu/drm/verisilicon/vs_bridge.c | 7 +++----
> =C2=A0drivers/gpu/drm/verisilicon/vs_bridge.h | 1 -
> =C2=A02 files changed, 3 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/verisilicon/vs_bridge.c
> b/drivers/gpu/drm/verisilicon/vs_bridge.c
> index dc7c85b07fe3..f1e8112f0ed2 100644
> --- a/drivers/gpu/drm/verisilicon/vs_bridge.c
> +++ b/drivers/gpu/drm/verisilicon/vs_bridge.c
> @@ -29,7 +29,7 @@ static int vs_bridge_attach(struct drm_bridge
> *bridge,
> =C2=A0{
> =C2=A0	struct vs_bridge *vbridge =3D drm_bridge_to_vs_bridge(bridge);
> =C2=A0
> -	return drm_bridge_attach(encoder, vbridge->next_bridge,
> +	return drm_bridge_attach(encoder, vbridge->base.next_bridge,
> =C2=A0				 bridge, flags);
> =C2=A0}
> =C2=A0
> @@ -303,8 +303,7 @@ struct vs_bridge *vs_bridge_init(struct
> drm_device *drm_dev,
> =C2=A0		return NULL;
> =C2=A0	}
> =C2=A0
> -	next =3D devm_drm_of_get_bridge(drm_dev->dev, drm_dev->dev-
> >of_node,
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 output, intf);
> +	next =3D of_drm_get_bridge_by_endpoint(drm_dev->dev->of_node,
> output, intf);
> =C2=A0	if (IS_ERR(next)) {
> =C2=A0		ret =3D PTR_ERR(next);
> =C2=A0		if (ret !=3D -EPROBE_DEFER)
> @@ -326,7 +325,7 @@ struct vs_bridge *vs_bridge_init(struct
> drm_device *drm_dev,
> =C2=A0
> =C2=A0	bridge->crtc =3D crtc;
> =C2=A0	bridge->intf =3D intf;
> -	bridge->next_bridge =3D next;
> +	bridge->base.next_bridge =3D next;
> =C2=A0
> =C2=A0	if (intf =3D=3D VSDC_OUTPUT_INTERFACE_DPI)
> =C2=A0		enctype =3D DRM_MODE_ENCODER_DPI;
> diff --git a/drivers/gpu/drm/verisilicon/vs_bridge.h
> b/drivers/gpu/drm/verisilicon/vs_bridge.h
> index 70fee1749699..2b0ed94e4520 100644
> --- a/drivers/gpu/drm/verisilicon/vs_bridge.h
> +++ b/drivers/gpu/drm/verisilicon/vs_bridge.h
> @@ -25,7 +25,6 @@ struct vs_bridge {
> =C2=A0	struct drm_connector *conn;
> =C2=A0
> =C2=A0	struct vs_crtc *crtc;
> -	struct drm_bridge *next_bridge;
> =C2=A0	enum vs_bridge_output_interface intf;
> =C2=A0};
> =C2=A0


