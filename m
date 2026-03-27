Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B3B10BA42D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 05:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=55gQ8UIqNu/4Lu8sOqkpH3txb+MxNaA75AvyR+3jJZk=; b=bfewZgW7BMH3xjkk/+TcEADkpb
	41z4+plKJSuXYOSqiWniqDEsULwXv22ncf9xtEgmOgnYnAG/Kf6qSIA5QyYecVKhOUoFw2s16lHtA
	xzLCDLuzGlU+5r4QWsIeyNO2mqoibAjKmB7tv9Tsnfl96isNwxCLmi0LYlA/ufF2wDgSluQFc8iS5
	uXaSUwmoUsDRdNfUSB6n5qo13olz8tva4c7Dj8SQWJmhMjrttBah3HRFstKckd/xLsewDbaLcPukj
	6O9+7wLSnnBJZ3IWbsjXYfQT/Xyai/Vs6zHyJwwK8GylER1tov5i9NfDZpRHhj5gUeRxvDzJv4rE9
	MbdS3WXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5zzV-00000006iVd-25Zz;
	Fri, 27 Mar 2026 05:44:17 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5zzS-00000006iVB-2bIP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 05:44:15 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5a297a69089so1965729e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 22:44:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774590252; cv=none;
        d=google.com; s=arc-20240605;
        b=kvaUwQV5NT5xmDjRZpiJKk+iqLEo3NvqWomB5kw8493omRod8m4WDOsYZZRTPoroAm
         TDL4Bj8TydhjpiFjf3HqKiXEAPhXyWTB6sdw0gtkk5dyoyGWEOWzKIznqMtclKFjAQrD
         8yu2nhY7RcsdWwTefMML8xyWW9GYx/KzUkhNAoV2cDWHYqW9PvMR1pKTkNTzBaHDEwOl
         Ku3FHVx1H+H+NAYvXkPYxftTFsneclREIEM6qmIpn5vgmM5lji41Ix8E+xAMLrwE6bh+
         8PPJXGbsipRs8GTQ1lqMF8hJxV5MfJ2Bz17Up4459Rfi4GwakhCP/5jjDlMlwXkMhHlE
         Ssxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=55gQ8UIqNu/4Lu8sOqkpH3txb+MxNaA75AvyR+3jJZk=;
        fh=50XawvnMv/qkFC11UCdYl+qt7lYPtr1O59i6dOPoSaA=;
        b=EibYX13H8QErfwzavXhQiP918U218ItKy32ygCC9prCNN8JhcLtV4v6nw1oPJRwhtL
         Szak3bAI+N6FaR0NWxViijVxaePAk9HFOfVkOqL4vo8XA/pqjrjBlUmAXyCWGxzMrIf2
         X8vl/FPs4iyau5oTGlQKp8cRPnwoDCSVXymQi2fPv+B0MI75oI42U107hWxgJECcqU1l
         T1jPHWByo8YOQz0ALzkVyiDoOpqbOnzhxPyPEGsvezVQfSGqAzS6eT31F9MBNHrUw0hK
         AziBBRAWgsVP+iWyQZum82/Tt6idlnqs818+M7OuIJJSnxyXgFfZtWBoZ8RZUlpL0G/s
         1KOA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774590252; x=1775195052; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=55gQ8UIqNu/4Lu8sOqkpH3txb+MxNaA75AvyR+3jJZk=;
        b=diEHzOMQJq58wEsKSZYlD4AFDloR82pKh3dBoXNjh+JXKzWQ7T+9fYbQFMl1uHLhcz
         og+k08vL19XW6bfLrhRdXap5ONhyp0r6F9NH5t/+FSl8nWN2lmoDHMAa4QJXc+Z6euif
         aaoiTEiUXIonXci+kUlhzRKQGiTtaH44o3swU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774590252; x=1775195052;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=55gQ8UIqNu/4Lu8sOqkpH3txb+MxNaA75AvyR+3jJZk=;
        b=FZKsnMXGUKgNLaco+OuiuacjbgqUHsegcN7Og8dYa0ieKIYN2dXmwDeJKxskCG0HTN
         /Q4KXOiPkAg2nhx56hY6TTCPEjKAAKgPiJx7/WohyuW9HjaXO2A/CLYoigvrydwFyzak
         fU3BfVk6DclrLNbxNC4Q/QAS5I0vdnEzwzg42oZL2hIoLvh6SBawIcqC7IkjFJdN6suL
         76o/IAhTSbbUd+zus3piJ6vumA9bjqt60Y47ZV0+95cUCCj4C3ftMrTVIZi2PvpEvBv5
         +U9ZD3JVzo+MDMmhnmJX8vpqS6TwHSDfy+wBfWMx+89ict13kmOqbO1nt84vqnW8TG4J
         HmEA==
X-Forwarded-Encrypted: i=1; AJvYcCVY9ipx5CbbVoaqF7rlwILV8fW/e648SmG/Pq/PxAbUnJh+jMAUHUeYH8UMVS4IXnHzs5OD7cZb3ESpEpihfkej@lists.infradead.org
X-Gm-Message-State: AOJu0YyPOX4/Dar+BKEeqEKTuVQKZUAwuBBpEjUtGOT6y/NgzFrgA2zU
	dQ8Ndx1bUNW6SpEto8UhPvQ4eLyVwdKmN6NI0g1uDtmwc2gj1FNxQQfYj9QWpEf9WcQcXLXzzqw
	/uzUTJCOWR2JgT8oIrNCyyW4ISvbu4hhw0LSDtWrc
X-Gm-Gg: ATEYQzw1HrK/PHyRFvA07rCSbE72TCrwaFjqrZw2itnnTv7nlCS3DQsl+PKyJibTira
	4zY+usdfaBNRdHxwn3ELFBnntvRacSnVDmFbQoQxaFxztxBa2w3QhrHG3U2RQdRS2A4eH7Lyjb4
	o7glJV2z1gofv6KUl4b/ZYX9Y4jBzjQ+DGMd7oVWJFVSstqyGNxf3AatcV2LlsFGRoW9SOCGUuJ
	BPrquFmVLuNWdfbFVSU5BF6Gxjt+LMTubNr7dGA6lv3lqWelW1xGZIXOoBpr39gEMeFHEkxMpAF
	IilXzkcUEVrRBV6oSEgo7tkLBKw/0uD8kC+9ps7CIwkmLVRM
X-Received: by 2002:a05:6512:2242:b0:5a2:a36f:3ef4 with SMTP id
 2adb3069b0e04-5a2ab928fe7mr379815e87.31.1774590252148; Thu, 26 Mar 2026
 22:44:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260326094308.1161335-1-wenst@chromium.org>
In-Reply-To: <20260326094308.1161335-1-wenst@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 27 Mar 2026 13:44:01 +0800
X-Gm-Features: AQROBzCaR6O-grRzEn_50j3NpZXhobkBat-wP0370vcp2B9JGLmH6YnTu6gaOu8
Message-ID: <CAGXv+5G2H3CSic5hCSd2g6RrfGyNSbpYS7Z9uo-XUn6No3a4Rw@mail.gmail.com>
Subject: Re: [PATCH 0/4] drm/exynos: Random cleanups
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_224414_715456_BA09F9F4 
X-CRM114-Status: GOOD (  16.66  )
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

On Thu, Mar 26, 2026 at 5:43=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> Hi,
>
> Here are some cleanups for the exynos drm driver. This was done as part
> of the conversion of the driver to GEM DMA helpers. These patches have
> no dependency, unlike the actual conversion, so I am sending them
> separately for inclusion now.
>
> Please take a look.

I should add that these patches were only compile tested.

> Thanks
> ChenYu
>
> Chen-Yu Tsai (4):
>   drm/exynos: Internalize exynos_drm_gem_free_object()
>   drm/exynos: Use DRM core dedicated DMA device tracking facility
>   drm/exynos: Drop exynos_drm_gem.size field
>   drm/exynos: Drop MAX_FB_BUFFER in favor of DRM_FORMAT_MAX_PLANES
>
>  drivers/gpu/drm/exynos/exynos_drm_dma.c | 11 +++---
>  drivers/gpu/drm/exynos/exynos_drm_drv.c |  1 -
>  drivers/gpu/drm/exynos/exynos_drm_drv.h |  9 -----
>  drivers/gpu/drm/exynos/exynos_drm_fb.c  |  6 +--
>  drivers/gpu/drm/exynos/exynos_drm_g2d.c | 13 ++++---
>  drivers/gpu/drm/exynos/exynos_drm_gem.c | 50 +++++++++++--------------
>  drivers/gpu/drm/exynos/exynos_drm_gem.h |  8 ----
>  drivers/gpu/drm/exynos/exynos_drm_ipp.c |  2 +-
>  drivers/gpu/drm/exynos/exynos_drm_ipp.h |  4 +-
>  9 files changed, 41 insertions(+), 63 deletions(-)
>
> --
> 2.53.0.1018.g2bb0e51243-goog
>

