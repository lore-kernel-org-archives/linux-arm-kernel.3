Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56849EA3F35
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 09:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t12lxM+brFyq0KY7Nz/qV0/1FHoQ9NnONI3XMskNk5E=; b=fW1x679tbZK8D9qzi1idnWFnPC
	FWlmiFBusC4Lr2CwI/bl2ivHAilYG2KMEDP7sZi/Mku2msR0ZJ67qdutUTXT4x4qh2WLVz/cGsO7U
	4FRqtW/6VvtupGpDVQdthtb5VZ/NsABJPr7HoyV1y4GCHhK3rbmH2szMSdcN7YZBDmaKVSu3fjzek
	gg3xsyj/yh7lm56uYaDez/qMXD7xssB+gm9lMEMM5r633Aun9+KaxbcSF4Pqnp6YAp815K4HVEUdF
	Y7Q40Qy20zSMzLJ1LjbiwJI6R0W2f3/ped6J8q8uthdyhrkm5/NS/0mlQNi+c96oXXTLZR3nkoOlE
	JSsad6AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpkSg-0000000Gmr6-2KpO;
	Tue, 10 Feb 2026 09:55:14 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpkSc-0000000Gmph-1xv4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 09:55:12 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-59dd490be5fso6050505e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Feb 2026 01:55:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770717308; cv=none;
        d=google.com; s=arc-20240605;
        b=FLjT/R3OjzlWREBBO26TJ01SclUNI5fF7HQnffzL8Rody8QM5uRr+MEFIGDxy67OMq
         dKmcg7WXgK7t2UueTe798K6iCCTUGxPBkE83YRgF8LSjg/yP1HvHqXveHtpBOX7N+jLK
         3mOwgMpJSlCxHf+LiqC7V9l+ork6jXahOlD4iZTF2p+RYN3jOV6Mav6kywnZOBN3dMRo
         i0Mf2aOS/G4wEp6GEniMj5dmWv5tAU64exGdf6vDQyDST6XFDCFld3DWxlGWaw/LHp8b
         Mqc0FdRNvowx7WbxBs5XdMhZS0BVqFvymXV888dpR/yy3MxErBqTAvjz9cGhYamUb7Cn
         2kHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t12lxM+brFyq0KY7Nz/qV0/1FHoQ9NnONI3XMskNk5E=;
        fh=GYZbPEbhXC+73Iae7POr+4AIP0ahvjgbzc8usfHnzcY=;
        b=LUrKfYR4AmAI0ITOjTu5LLb4VPNV+/g4Oe57PyVWtozdyoiz218fqndPJRuWY1Rkwl
         +DC9W/CHWH/4PB7HT00C4dnBQoB9Q1F8F7+FyrlmrRsOV1W1YHmMMc2zxi52bNj2uknu
         nSO6YtpoyfofbkksN6sd1qOEDni65UKKw6fljy7NPKcs3zVrh4Gtq9s/9BnQETRKYZds
         wfb4+C2mGXRl2qOVXP7kvcwaBUfUMdYfP4bBAJqO73fwENtqO5Vqtkpi8Nlj6RIOwgPx
         Z7R9ViStjGu8YSS6na12BX1bi5fZ2aOGhciyzIcWhPxPVHnKywsmVtrhXlfYrerpAliW
         OAOw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1770717308; x=1771322108; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t12lxM+brFyq0KY7Nz/qV0/1FHoQ9NnONI3XMskNk5E=;
        b=Lrw60HJD0O/qDsruRs+RA+frIxWkrSRwFhU3D6AK0G1p2t9VNUnsjv+7+X/eHi/WTR
         KCn7oZe9Jarp2Z4NwT9DjELYhT68T5tCWIgkpqiyRfp/K+Q8gXLcPwDj6nXQyoLG9s70
         C66O/oIkTweJqyr5PFp2mBHsJzuVoDwrtoDnQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770717308; x=1771322108;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t12lxM+brFyq0KY7Nz/qV0/1FHoQ9NnONI3XMskNk5E=;
        b=mabGz4VVwABbF6/v0fiX5NUUm/89WHgA8U6MbCH3uB6B1n25kZcn10LYePhxydyCWg
         l2LLknBv0PChDMKCZWC65s3kX5jN5Uac2AN3JucqK3jWf510eNdtv3FW7RBaHPtEWctV
         sVc8aeunvBcKOSsGL//8eD/jZdOis7yXmkDYaYxfCMfdvwJJWzJdMBBGUKmvIMKLdYm7
         wCPG/9EJ8QOj6SqHkfm3ma0PBeZNiiHiYmTdb7sEu3L5veBd/1m0f4D1eR43MH4B20xV
         lz1JrGQHT7D2PZCcE7Op8gI7IM9gMEMm8vQqFqLVgT7VlJR2xFDowxzCNwefhv8rywV4
         l/5A==
X-Forwarded-Encrypted: i=1; AJvYcCUgfzN78j/fEDJz2GgrUQtz8iQDHAP3h1XCj3ngyEk7mW3vfnBslllFhk5+OhiOAyZcWevMM2ULENzGI0zamXgf@lists.infradead.org
X-Gm-Message-State: AOJu0YxZ7PGspn/LHw3CvREZRxNvU18FHE0Y4C0JO4hx2LkEF+JT80X+
	IUHR6KHBSjnCVOtCQKmAvi+aMnuOwNnEbO0qVKVOhsEHqRMnE+C307JPS+3Tk13HAKnOpUf/6TQ
	XLE6lCM+I8MpkElD/ax7QzCb5lubWNNah0LOSu0KR
X-Gm-Gg: AZuq6aJarWvfOC3N5b447ztm6qr3eBMSqFB+rzgrfGaJ1cxJ05i+7UtIuyndcJGtlNG
	c1672gdcwvZM+29c0quV/anVDjH37TCt9qIfzjmCfyw2yrvODnaTraOyQHiy8Iv5Kj2cyh2b196
	AenKv0FI8/ZYZ1C57SxjCySAh6BZTWppEKGuPNdtEvWvo4wZvYB2vFP/DhF6ZICmA5OJxkiSy9D
	DDUpaSJTPosaKrtspvv/qMH6ADB01q/hJzCkle6zGiN00JX3NBy14z2HyHU2mDfmdlXhszH8xWU
	Vj8VrWMB4d6vZKenv+lwfdP4xjcsBNMN3xEUdA==
X-Received: by 2002:a05:6512:32c8:b0:59e:24e5:a3a5 with SMTP id
 2adb3069b0e04-59e55bd0c28mr479672e87.29.1770717308202; Tue, 10 Feb 2026
 01:55:08 -0800 (PST)
MIME-Version: 1.0
References: <20260210093333.5112-1-l.scorcia@gmail.com>
In-Reply-To: <20260210093333.5112-1-l.scorcia@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 10 Feb 2026 17:54:57 +0800
X-Gm-Features: AZwV_QhvCuo8DxUPuUh7S4r_8wwpmJqqu_YbBa1qxu1eyMYPq5mPl5vB5s7VIBQ
Message-ID: <CAGXv+5Ep+YGsqZqWB3HXES07sFw8YtoTEPDxkq1yHQPJpFDTUw@mail.gmail.com>
Subject: Re: [PATCH RFC] drm/mediatek: Remove all conflicting aperture devices
 during probe
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_015510_614498_CF6C4A5C 
X-CRM114-Status: GOOD (  33.63  )
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

On Tue, Feb 10, 2026 at 5:34=E2=80=AFPM Luca Leonardo Scorcia
<l.scorcia@gmail.com> wrote:
>
> If a device has a framebuffer available it might be already used as
> display by simple-framebuffer or simpledrm when mediatek-drm is probed.
> This is actually helpful when porting to a new device as
> framebuffers are simple to setup in device trees and fbcon can be
> used to monitor the kernel boot process.
>
> When drm-mediatek loads a new fb device is initialized, however
> fbcon remains attached to the initial framebuffer which is no longer
> connected to the actual display - the early fb is never removed.
>
> We can gracefully transition from framebuffer handling to drm-managed
> display by calling aperture_remove_all_conflicting_devices as we probe
> mediatek-drm. This takes care of unloading other fb devices/drivers
> and disconnects fbcon which then automatically reconnects to
> mediatekdrmfb as soon as it's available.
>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
> This patch has been tested on Xiaomi Mi Smart Clock, however
> I'd like to get some feedback from more knowledgeable people,
> especially about those points:
> 1. Is aperture support on mtk-drm desired at all?
> 2. mtk-drm does not know about the fb address therefore as far
>    as I can see we can't use the more specific function
>    aperture_remove_conflicting_devices. This means that all generic
>    aperture drivers will be unloaded. It might not be a real world issue
>    as I can't see why one might want to load mtk-drm while keeping
>    other aperture  device drivers active, but my experience is very limit=
ed.

This is pretty much what all other platform drivers do. So that's fine.

> Thanks!
>
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index a94c51a83261..17e45b93fe49 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -4,6 +4,7 @@
>   * Author: YT SHEN <yt.shen@mediatek.com>
>   */
>
> +#include <linux/aperture.h>
>  #include <linux/component.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> @@ -1116,6 +1117,11 @@ static int mtk_drm_probe(struct platform_device *p=
dev)
>         if (!private->all_drm_private)
>                 return -ENOMEM;
>
> +       /* Remove framebuffer owners, this will release fbcon if active *=
/
> +       ret =3D aperture_remove_all_conflicting_devices(DRIVER_NAME);
> +       if (ret < 0)
> +               dev_err(dev, "Failed to remove conflicting aperture devic=
es (%d)", ret);
> +

I believe this could be in mtk_drm_bind() just before drm_dev_register().
The idea is you want to kick out the existing framebuffer as late as
possible to reduce the time the screen is unresponsive.


ChenYu

>         /* Bringup ovl_adaptor */
>         if (mtk_drm_find_mmsys_comp(private, DDP_COMPONENT_DRM_OVL_ADAPTO=
R)) {
>                 ovl_adaptor =3D platform_device_register_data(dev, "media=
tek-disp-ovl-adaptor",
> --
> 2.43.0
>
>

