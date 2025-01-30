Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C788C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 05:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gFQ7g+YN21EUHYN7l+aFFtAggeW26EdwSPTQBPw5JIA=; b=T8fwUy/IdL33MhD0UMh2k35//5
	dnCGfZM6pddy0o43w82brlUhL1SpSKpZ0aLyNWQ6wdt+BRzUWLChWN+qrQd4bKDsZci7c6d0vQr2Y
	dZnt0JryaOrhBYmcObzzKGlikssHCLxrChxvESDIEIhbtdsYVk5iXdxGjzxldUv3jjADfH706BbHE
	6yckirJ+4KD/PznqwarNd564rAJV9tDYgpdZFudWrYwLX7F5j77Eqe8i6DtkC1AWp/WMhhjE4aXyy
	G/gGGHtlm9as1iUzYEN4wEZwCyVYx7BvTg4zsUK3AZdKQCnuGlWrQit2tPWwCGlCNa3XBcp+zx7CN
	595QKsHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdNBK-00000008GNR-29xR;
	Thu, 30 Jan 2025 05:33:38 +0000
Received: from [203.29.241.158] (helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdN9z-00000008GHV-0F1E
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 05:32:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1738215126;
	bh=gFQ7g+YN21EUHYN7l+aFFtAggeW26EdwSPTQBPw5JIA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=LlkoPShMIY3IbkAOzb1KgLzgG8YOLulzUiA6dqoqMW35xYM1vY4FUxuyCclGILpYC
	 IJdPkr0eO2aU1S4RZJ82yPuiFDJg5q2lE1bfAyD+54vhNauy/40V0JqAiOYMuAxYT/
	 Q2k+tCOwgqrz3bJvt6XPO1WtELw104gr2JBqDUcfgndWOAnOkSOG1gA3spVGBKw2X1
	 9aURVXj532gT/Q8Joss7WwNumv9lyGY6e597x3LGlGCDJpIVT4x8a5TyuK54JK0ELB
	 enXAG4EEYPp5fOHwx2er0mYGSdpYRP37/eC5/pGcc86wWKG0w6xtA6DqfWNlWyjDAC
	 nRayZo2kLifTw==
Received: from [192.168.68.112] (58-7-158-64.dyn.iinet.net.au [58.7.158.64])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2E8DC73836;
	Thu, 30 Jan 2025 13:32:02 +0800 (AWST)
Message-ID: <daa6bcaf1e612f667c5d5d26b9d515f43985b595.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2] drm/aspeed: Use
 devm_platform_get_and_ioremap_resource()
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: oushixiong1025@163.com, Joel Stanley <joel@jms.id.au>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>, Shixiong Ou <oushixiong@kylinos.cn>
Date: Thu, 30 Jan 2025 16:02:00 +1030
In-Reply-To: <20250122030155.57802-1-oushixiong1025@163.com>
References: <20250122030155.57802-1-oushixiong1025@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_213215_302608_F0694349 
X-CRM114-Status: GOOD (  10.75  )
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

On Wed, 2025-01-22 at 11:01 +0800, oushixiong1025@163.com wrote:
> From: Shixiong Ou <oushixiong@kylinos.cn>
>=20
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to
> devm_platform_get_and_ioremap_resource().
>=20
> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
> ---
> V1 -> V2: Add Missing commit message.
>=20
> =C2=A0drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 3 +--
> =C2=A01 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> index a7a6b70220eb..33f81b53771d 100644
> --- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> @@ -146,8 +146,7 @@ static int aspeed_gfx_load(struct drm_device
> *drm)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct resource *res;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int ret;
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0res =3D platform_get_resource(=
pdev, IORESOURCE_MEM, 0);
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0priv->base =3D devm_ioremap_re=
source(drm->dev, res);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0priv->base =3D devm_platform_g=
et_and_ioremap_resource(pdev, 0,
> &res);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (IS_ERR(priv->base))
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return PTR_ERR(priv->base);
> =C2=A0

I think I prefer this one:

https://lore.kernel.org/all/20250128-cocci-memory-api-v1-1-0d1609a29587@red=
hat.com/

Andrew

