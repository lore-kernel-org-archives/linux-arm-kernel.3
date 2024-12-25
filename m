Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFAF2E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Dec 2024 15:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H1XtrJQwRPm0QMWKerx/Coonn7zQT39or/6OtaS8fbI=; b=tgFYbAD3azLuA56Ll/1hYXBN3O
	xMs8mlr6ZP0ZkSKmUfv8dMgymwji4MAbvRROhDoyXMaUQzPdypiffcEqBxuz5vzJV+tPuQO0BYhOe
	2ejkp14QclP45dWCQAuz61Am6a9ggl0/vZFY4Lv9jygGo1w9OdXPRebUEkNLoyOpGDvh8pn8tkGS2
	8Ag6mHzIyrUkqd2caTzWJuRfRC6ZbZU5sME7w3HnK3PmfS0w2erwql2zKensJlaQTmbIewHDpjGfF
	kgnOqdZIPXChp7quZZXGamfuv/CNFczVRSqA5SiSGrPEc1waYSCUb/X4MCiNdCRXG5FHMSbyfw0ra
	HVhW3jRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQT1Z-0000000Dyj3-2JbS;
	Wed, 25 Dec 2024 15:10:13 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQT0N-0000000Dyct-2pHg;
	Wed, 25 Dec 2024 15:09:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7ACA5A40464;
	Wed, 25 Dec 2024 15:07:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B38D1C4CED7;
	Wed, 25 Dec 2024 15:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735139337;
	bh=OMb/rpLM+V5DGueRzdj6awBuZkMVY5pC2pMU/jT0yaI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PTRpjynZzSzHVMJL/fd7dlJHLslIuElBkF5DWGBuQzoj+rHhk3MFXS59Gut+vxiwn
	 tdyD9o583fJG/r1ZX69Ir4aZaOxRDF0WcmwFZT7QQMUMYb/dRzTaE91K2KMrOFedt7
	 LNaSZq0m0qWYAc1bgUVLouLSFew3yPjVBBkBY3nYFGXx3KIMezKF0T4yuBTqcHZ4Cm
	 fXUdOF++TDzBUzDJbRBFeIunqe3AQ4r28qnYrFSAe3j3wnuQVMtZdyXipguwodjiOt
	 IohDZ+v1oFCu/FBPp2HaqrOM3ssbkKQMhytkRnYPy6RN721ZXqKFapMG5iyiOETZqU
	 PdC6PzT47povw==
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2ee709715d9so5106580a91.3;
        Wed, 25 Dec 2024 07:08:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCULhIaDC+VyMcEZDZNu8/TorYUo/C/5lv9y9PCWLtZ5VPSIiEehNjHwDM8+dP5OFOSnIRm6wjJN6e2usXKFZPNG@lists.infradead.org, AJvYcCX3WckeqeeUUk+RZ8B5UTBBDBjXYbKUNgrosnEbQ3T/YyqShkvQynYuqU0EJfuJxoerXxN67e1dVOzaAvPNBNk=@lists.infradead.org
X-Gm-Message-State: AOJu0YybqNmzWgwU+RtUuJF0sl63b7OqEwGQHrMcgEjASzW2Ur3s0mWY
	tD1fROF0QTdWeUt0YWfjcjTY2lpIK00oNMQ6Q9HGjZ6JyEAEdLZLrz8U1CfSKNvFrWOMz6VpSk/
	hQwog1RgQgdCFQlwQmRzDr9FKQA==
X-Google-Smtp-Source: AGHT+IFNohSARnz7/AmpMrxWwtTihcrjyxAynE3EZ/j8OawR4Ys3V/MW+8rDZzV9qlPF3PkrQnE8ZYRou//whw1yFVY=
X-Received: by 2002:a17:90b:534e:b0:2ee:7a4f:9265 with SMTP id
 98e67ed59e1d1-2f452e22c53mr32774802a91.15.1735139337257; Wed, 25 Dec 2024
 07:08:57 -0800 (PST)
MIME-Version: 1.0
References: <20241211034716.29241-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20241211034716.29241-1-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 25 Dec 2024 23:09:29 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9SKy0H8Kdhu81_4kxa14RgKhCcnW3FJyKbwraitR5NrA@mail.gmail.com>
Message-ID: <CAAOTY_9SKy0H8Kdhu81_4kxa14RgKhCcnW3FJyKbwraitR5NrA@mail.gmail.com>
Subject: Re: [PATCH v4] drm/mediatek: Move mtk_crtc_finish_page_flip() to ddp_cmdq_cb()
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, fshao@chromium.org, 
	Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
	Shawn Sung <shawn.sung@mediatek.com>, Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_070859_850738_C689989C 
X-CRM114-Status: GOOD (  19.39  )
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

Hi, Jason:

Jason-JH.Lin <jason-jh.lin@mediatek.com> =E6=96=BC 2024=E5=B9=B412=E6=9C=88=
11=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=8811:47=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> mtk_crtc_finish_page_flip() is used to notify userspace that a
> page flip has been completed, allowing userspace to free the frame
> buffer of the last frame and commit the next frame.
>
> In MediaTek's hardware design for configuring display hardware by using
> GCE, `DRM_EVENT_FLIP_COMPLETE` should be notified to userspace after
> GCE has finished configuring all display hardware settings for each
> atomic_commit().
>
> Currently, mtk_crtc_finish_page_flip() cannot guarantee that GCE has
> configured all the display hardware settings of the last frame.
> Therefore, to increase the accuracy of the timing for notifying
> `DRM_EVENT_FLIP_COMPLETE` to userspace, mtk_crtc_finish_page_flip()
> should be moved to ddp_cmdq_cb().

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: 7f82d9c43879 ("drm/mediatek: Clear pending flag when cmdq packet i=
s done")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_crtc.c | 25 +++++++++++++++++++------
>  1 file changed, 19 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediat=
ek/mtk_crtc.c
> index eb0e1233ad04..5674f5707cca 100644
> --- a/drivers/gpu/drm/mediatek/mtk_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
> @@ -112,6 +112,11 @@ static void mtk_drm_finish_page_flip(struct mtk_crtc=
 *mtk_crtc)
>
>         drm_crtc_handle_vblank(&mtk_crtc->base);
>
> +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> +       if (mtk_crtc->cmdq_client.chan)
> +               return;
> +#endif
> +
>         spin_lock_irqsave(&mtk_crtc->config_lock, flags);
>         if (!mtk_crtc->config_updating && mtk_crtc->pending_needs_vblank)=
 {
>                 mtk_crtc_finish_page_flip(mtk_crtc);
> @@ -284,10 +289,8 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void=
 *mssg)
>         state =3D to_mtk_crtc_state(mtk_crtc->base.state);
>
>         spin_lock_irqsave(&mtk_crtc->config_lock, flags);
> -       if (mtk_crtc->config_updating) {
> -               spin_unlock_irqrestore(&mtk_crtc->config_lock, flags);
> +       if (mtk_crtc->config_updating)
>                 goto ddp_cmdq_cb_out;
> -       }
>
>         state->pending_config =3D false;
>
> @@ -315,10 +318,15 @@ static void ddp_cmdq_cb(struct mbox_client *cl, voi=
d *mssg)
>                 mtk_crtc->pending_async_planes =3D false;
>         }
>
> -       spin_unlock_irqrestore(&mtk_crtc->config_lock, flags);
> -
>  ddp_cmdq_cb_out:
>
> +       if (mtk_crtc->pending_needs_vblank) {
> +               mtk_crtc_finish_page_flip(mtk_crtc);
> +               mtk_crtc->pending_needs_vblank =3D false;
> +       }
> +
> +       spin_unlock_irqrestore(&mtk_crtc->config_lock, flags);
> +
>         mtk_crtc->cmdq_vblank_cnt =3D 0;
>         wake_up(&mtk_crtc->cb_blocking_queue);
>  }
> @@ -606,13 +614,18 @@ static void mtk_crtc_update_config(struct mtk_crtc =
*mtk_crtc, bool needs_vblank)
>                  */
>                 mtk_crtc->cmdq_vblank_cnt =3D 3;
>
> +               spin_lock_irqsave(&mtk_crtc->config_lock, flags);
> +               mtk_crtc->config_updating =3D false;
> +               spin_unlock_irqrestore(&mtk_crtc->config_lock, flags);
> +
>                 mbox_send_message(mtk_crtc->cmdq_client.chan, cmdq_handle=
);
>                 mbox_client_txdone(mtk_crtc->cmdq_client.chan, 0);
>         }
> -#endif
> +#else
>         spin_lock_irqsave(&mtk_crtc->config_lock, flags);
>         mtk_crtc->config_updating =3D false;
>         spin_unlock_irqrestore(&mtk_crtc->config_lock, flags);
> +#endif
>
>         mutex_unlock(&mtk_crtc->hw_lock);
>  }
> --
> 2.43.0
>

