Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83919C4453A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 23:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pIR2aZg+xSlzdC+THihRnIZxjcQHJIbSYqES+kLIcgE=; b=ZQymTkFTnePdpes0lroK9GdCH6
	yhwMQje7ULP12gSfRqu4m4JDVOflK9UXtxCW974RAlPytgGKUTDXasuHfmSf8LK1UaiW/w5VDfgtr
	HJHy7UX0pGOVw510EvG87kGPr79Q2VbcJLoRKpzqUtobmQYJLGQC0cGU0I6V3/7N0NWo2lIPJvPrU
	9bN6jXzomzorX0AJlcT0WObYKBLW6tPYU/BEnL+k+2l3DiMIHcQLnQDRJ47wWbuq1N4U29SDJ7pPQ
	gRZT6fSh6H6u/8xNff4mIY/+zozhQT1JhTAAdAAeeHMWXgat5/xtXKPIj7XQ58FJhFW8AuumxyL7h
	tWKr6/EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmgIS-0000000Cx5v-4AIH;
	Wed, 22 Jul 2026 23:24:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmgIR-0000000Cx5d-1wd2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 23:24:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E883443B07
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 23:24:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC5951F00AC4
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 23:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784762654;
	bh=pIR2aZg+xSlzdC+THihRnIZxjcQHJIbSYqES+kLIcgE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Dzw40YWRKT8n+7ectGuV1OCFrsqCpe78u7qy5n3lG/JprJTuImlHxiZFhTa4fJYzj
	 ziaawODn6aQCc3c61+F0HgkuFbbGtazOU5aikQBaosQWYlT6Tlj+P9aju5zcVxLlpD
	 fXRCE4MxXOwy+xeFbcuTxfvyVKvjr9+CwMVnXCOR7spwMuV2lp2GB3C0zlzS4qkJ4S
	 teedKg+xABAJmCciQGeA0bvn9q2ys5W2fd95ZjSJh+kQYAJfvj4Df0eNpl0woZtPOH
	 1+2AModLUfxf2HZy0mfeSTYBNWkfDJMb3yTV/rbVQRTIiLk/AvXfrqq+sSAad05SOm
	 Nv4gXx/W+jmuQ==
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84e04df8c46so18139b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 16:24:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ros0af/+b7+DtPMr5eh96sZV0ljTcxR5RsBI4h/oc4yRJEasfChK8eFPJUVd35bJjkF/eIS219eNX9oiRH9IEhg@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8g9cczWUSlj4576jIgzYKB9iELaDqysrkRBjEwOYOPiUO9A+E
	c1AbXE/F1a/C5WL2WRr0OiL8LRyi2kHvhmQaZSbFzo0FLwh8OMhEwRkKnV3/Fpnfls3J0GBanSB
	k8Bab3Ltx8AdPD67xL5p/HhESK0ez7w==
X-Received: by 2002:a05:6a20:b786:b0:3c3:724d:ae7a with SMTP id
 adf61e73a8af0-3c44afb4d98mr594092637.9.1784762654438; Wed, 22 Jul 2026
 16:24:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260707150528.2270739-1-ruoyuw560@gmail.com>
In-Reply-To: <20260707150528.2270739-1-ruoyuw560@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 22 Jul 2026 23:24:01 +0000
X-Gmail-Original-Message-ID: <CAAOTY_9C2H4hJX0c5PAR8ucMYemPQcgYraqk37m0MbD-5BkL6w@mail.gmail.com>
X-Gm-Features: AUfX_mzXfIMvg4FClh2R9zHPqGW4oykaN4gfuRtC-scHkPiIE15gTbt7k6lUwDc
Message-ID: <CAAOTY_9C2H4hJX0c5PAR8ucMYemPQcgYraqk37m0MbD-5BkL6w@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Check CRTC state before freeing
To: Ruoyu Wang <ruoyuw560@gmail.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Ruoyu Wang <ruoyuw560@gmail.com> =E6=96=BC 2026=E5=B9=B47=E6=9C=887=E6=97=
=A5=E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=883:05=E5=AF=AB=E9=81=93=EF=BC=9A
>
> mtk_crtc_reset() destroys the current CRTC state only when crtc->state
> is non-NULL, but it always converts crtc->state to struct mtk_crtc_state
> and passes the result to kfree().
>
> When reset is called without an existing state, container_of(NULL, ...)
> does not produce NULL. Keep the mtk state free in the same crtc->state
> guard as the helper state destruction.
>
> This issue was found by a static analysis checker and confirmed by
> manual source review.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: 2d267b81898e ("drm/mtk: Use __drm_atomic_helper_crtc_reset")
> Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_crtc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediat=
ek/mtk_crtc.c
> index 8e552cdc3b53b..97e3ff412e6ee 100644
> --- a/drivers/gpu/drm/mediatek/mtk_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
> @@ -154,10 +154,10 @@ static void mtk_crtc_reset(struct drm_crtc *crtc)
>  {
>         struct mtk_crtc_state *state;
>
> -       if (crtc->state)
> +       if (crtc->state) {
>                 __drm_atomic_helper_crtc_destroy_state(crtc->state);
> -
> -       kfree(to_mtk_crtc_state(crtc->state));
> +               kfree(to_mtk_crtc_state(crtc->state));
> +       }
>         crtc->state =3D NULL;
>
>         state =3D kzalloc_obj(*state);
> --
> 2.51.0
>

