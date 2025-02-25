Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 668B3C021B6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 01:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i4TOCMT9A63jLoOCD33qtnm1uXyI2TNmIj6w6+0Voco=; b=z3Z3Hne4fOT84B09085IW+k5xJ
	gSmAWkxMx+LnQ+seo2N7R6SLmXEv1kuIyE8j8CqYn7fbEM+Bgq5vPNibqFvQU9nmc1mIFX4NM1d9y
	S7nFbIWac+pyxhZAKHMyxPsR+8aJW1CdwpVbqGrxbiirtCBujomemt1MJt5GmC7PMXrtFVSH2Ct7J
	kGfDo4C7rKsUSX1qQmPP3eTYtexlqUrFV0lwjp97NBsSHczrxsk6MHwFGhGB420IkAN01UfhDcpol
	fRcLV7SMOEyoMC9H5YS0J6SXCkMAPP11L6QdX5apu5igo21UlAiXawckR6Za/uHBzsYUEvorM+9tU
	6byz+n3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmjzQ-0000000Fj68-0Hoc;
	Tue, 25 Feb 2025 01:44:04 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmjwh-0000000Fijz-3cLE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 01:41:16 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5461a485aa2so4669379e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 17:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740447670; x=1741052470; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i4TOCMT9A63jLoOCD33qtnm1uXyI2TNmIj6w6+0Voco=;
        b=A0nC7tV8FwMSut0sbsHaqENe4kt0WlRvKTdFi2ftMqh9gAUmYD30CY4GVkP0+njmxH
         5C0UanakxGGE3szYBmmaPUOiwHGIWnz/eRIs8SKZfavz2fmRNH7++lFc4Vp9mJJsL5jr
         OqbcwZR9PU3m4jUfgo/fVZEByiV/Gh+p8KSgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740447670; x=1741052470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i4TOCMT9A63jLoOCD33qtnm1uXyI2TNmIj6w6+0Voco=;
        b=TLjkikhN0+UfAKTjVb9cx+9u1Ub+LtdQY/U9Iu6IXSqBg+RPzb/Z/iBw1RBLVa2lcg
         SeDGwErhh7xSU9z6OUT0FwQE+FiRFBiB1yHrQKzxClYUTipCnZXUjpaN6Xk3HZftJCs7
         DfXN9P8ZumFIFPSqsA5J9QbO40anagMA9EKLZPNR2N8EKKMAo0P/GwPuKN3qqDQPKFNE
         TPcyBCf4PiGBkIAmleVJiO5bOL7uZm47tnNP0liXJzT9iXRGzPrwccp4OUuaNQJ1rx4Z
         p6cVk4+4fjKSHi6mHWYbcNmhJThHckoKtryARvsWs5KwXiZFhVrPebCnUTjOnJGTSdkv
         2r5A==
X-Forwarded-Encrypted: i=1; AJvYcCVA6YJU5GSguE0Pfor+lo5Hvc1opN5WvvZ5iq7KsTayco+qyG/5olhmqt6vw+ktCups2qqV+GreiNRvRIlp8pdy@lists.infradead.org
X-Gm-Message-State: AOJu0Yz15USPDzBpjKCljl1TSuiHPdD6cuT42Ny0jEfzIItF0lL3oqMi
	gz0GhnxpkyIAW5Y5oGTDPNSdeHi1+k6GwpOc/fZXuZxVLdz3GRywXM08oFCmE6pYcz31Kc3nCo+
	NBA==
X-Gm-Gg: ASbGncsAMt9YKxbPeBfXISkD0i+8CeX4TP3XJDgDC21Qbz2d1ZtaDg/ok4sVj6QZHaD
	z6EWlZmin5rqaobgmv76qETndZ+dmkV/CjZMVDmaMNTiUta6bhWO7l+Z0FM2S2JT7Nia/SU4lBi
	tnvBhq9iSDK3cmx1mhipWSXWd6Hm8jQQhiJlOZEH/iSCjHeajipPa4zK5O/KOb4+5mTPOc69jnH
	H4G+e7wp5OnuEh7hamX25x0eejvlBWNKTDSWrmIf54V0CUi4zfyFMbXXjuJC/BEqBm2cYCVZL4z
	Oess2nCOyT1shZryzIq1dNbEXZeXHBCfVTqPqPihisoZU2Pc5fRPYuwBiikVm5CvkQ==
X-Google-Smtp-Source: AGHT+IGcXGJ8XXAsU0qjqqD6ks6WHNqnyJNgEKPzMMLkR0ZNCyWKoG/fBUQWe7nnQbyJV3c21sVGYQ==
X-Received: by 2002:a05:6512:1193:b0:545:22ec:8b6c with SMTP id 2adb3069b0e04-54838f5a59fmr5895821e87.35.1740447669894;
        Mon, 24 Feb 2025 17:41:09 -0800 (PST)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514b9d36sm51308e87.93.2025.02.24.17.41.02
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 17:41:07 -0800 (PST)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5454f00fc8dso4717506e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 17:41:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXNKjPhpSfzFjb5h+21VNzRocP/ND7cMgKDZb1Ivh/Bt34v+K+pOhXzYWBPrxHIOWuvi1NEn2MoDf6sS8z8LCl5@lists.infradead.org
X-Received: by 2002:a05:6512:ac3:b0:545:f69:1d10 with SMTP id
 2adb3069b0e04-54838ee1c94mr5432801e87.8.1740447662279; Mon, 24 Feb 2025
 17:41:02 -0800 (PST)
MIME-Version: 1.0
References: <20250224081325.96724-1-damon.ding@rock-chips.com> <20250224081325.96724-5-damon.ding@rock-chips.com>
In-Reply-To: <20250224081325.96724-5-damon.ding@rock-chips.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 Feb 2025 17:40:49 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X7iWOyAvdfRDyFA9kdr+utU_aAaJ5F7nAsaHp2fMQgVw@mail.gmail.com>
X-Gm-Features: AWEUYZlbdiIhJLMaGbE9FR34Ygo4r4AydhTgMaLe8qb8EcM7igmYbqK2w54Qn0U
Message-ID: <CAD=FV=X7iWOyAvdfRDyFA9kdr+utU_aAaJ5F7nAsaHp2fMQgVw@mail.gmail.com>
Subject: Re: [PATCH v7 04/15] drm/bridge: analogix_dp: Remove the unnecessary
 calls to clk_disable_unprepare() during probing
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, andy.yan@rock-chips.com, hjc@rock-chips.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	dmitry.baryshkov@linaro.org, sebastian.reichel@collabora.com, 
	cristian.ciocaltea@collabora.com, boris.brezillon@collabora.com, 
	l.stach@pengutronix.de, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_174115_895787_9CD18964 
X-CRM114-Status: GOOD (  15.83  )
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

Hi,

On Mon, Feb 24, 2025 at 12:14=E2=80=AFAM Damon Ding <damon.ding@rock-chips.=
com> wrote:
>
> With the commit f37952339cc2 ("drm/bridge: analogix_dp: handle clock via
> runtime PM"), the PM operations can help enable/disable the clock. The
> err_disable_clk label and clk_disable_unprepare() operations are no
> longer necessary because the analogix_dp_resume() will not be called
> during probing.
>
> Fixes: f37952339cc2 ("drm/bridge: analogix_dp: handle clock via runtime P=
M")

When possible "Fixes" should be pushed to the start of your series so
it's obvious they have no dependencies when being picked to stable
kernels. That should be possible here.

> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  .../gpu/drm/bridge/analogix/analogix_dp_core.c | 18 +++++-------------
>  1 file changed, 5 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers=
/gpu/drm/bridge/analogix/analogix_dp_core.c
> index e23af674d91c..d9dafb038e7a 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1608,10 +1608,8 @@ analogix_dp_probe(struct device *dev, struct analo=
gix_dp_plat_data *plat_data)
>         res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>
>         dp->reg_base =3D devm_ioremap_resource(&pdev->dev, res);

There is a context conflict when I apply to drm-misc-next because of
commit 43c00fb1a518 ("drm/bridge: analogix_dp: Use
devm_platform_ioremap_resource()"). You probably should rebase and
re-apply.

Aside from the context conflict, this looks great to me:

Suggested-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>

