Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2749EE4989
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 16:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sEexHvifwpuu0gCGXPTmPyw/pi+rizji68oy60ALU9k=; b=fK+h7d3ZVaYMrESVDrnmaLXve8
	lCSS+sT4xwteJgQ9xGT8bTS4080TNzgDjxgqVsuaQsT/ID8uEWI58ixAnC8BqUeqpBWBFThWIRIGM
	VWcjTH9hd5vjJik1rFsV8gDgALKtKtxovVXyDGBUiYmTNiylDtYoYuTXZz3VJyd6TZz1XwbVU8zMD
	xAIhh6nNeoD29yOCyh1KIN40Wck1CIBby760K+gWEqZOX0Oxc75ZZV7hyh2uuJLr1b99AsZGvOBbP
	caBAps1qw+BuLVOCQb/39ZLeQZQ/n+NkreoqlubwXIiH0Fov3IiyssqXDkpb6a7NApAhR5SxxY0aP
	45QtfusA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vacLz-000000052fv-1LfI;
	Tue, 30 Dec 2025 16:13:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vacLv-000000052f9-3yso
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 16:13:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 26B1644492
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Dec 2025 16:13:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D872DC19425
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Dec 2025 16:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767111222;
	bh=e3Y7PvlCXny5HY/zO4XJqYOFNhrFeGMo/eEwU263cIc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YJ+SKav7TlhC+fYgiCDffsvumiDC3Oa/+TMfjzLKZj2D5ut1cZTYa7qmdGpHfr0wR
	 l/ZmikTRFjefQtXB9BOw8RfmpZ/71oAspAr2znDFuiDUlA9S72P5neWR9A6SRMXcrU
	 vG0EWPhjGYQUceVhVCVL0HcvE9hZ26U59dsio20GoO5XHBGrdCW9JZ4A+OWFew8f3/
	 D9SaIRgQhT7eD3orO8a/iSt4tihlluV/PGj7iH9PxohGidQ+zlq3mJqZrzdaFAnC3z
	 nY5kH9N+oKrKFFj5WMtN7ScExLrd7uieIJlK/hmP6yCPUQVBv5jQ0jmIJYI3N4RiFb
	 /C2MJy5vp6iCQ==
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7baf61be569so10479652b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Dec 2025 08:13:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUb6eANq9IVimE3O+/jsBBVP9/xZb0LlnIHCEhbmdTqeuPYOzBURGVAyIMDIrVL/8gLrS2NkQKcZ/ajRptBZQPX@lists.infradead.org
X-Gm-Message-State: AOJu0YyBWfVm7nK98Pnc9t3mhC2YnChKHHMVP5AYw0GkTP8APt9q+92h
	fn5py4hg0QaT+2SGuN8b1oFvXsCtQaDWDDcp9NRzczAEBeght2AgHqXi8J/hA4mHlA9cQjQ1qU1
	B2BX7cBd7m1Ky07c3DYkaQUD0sqajJQ==
X-Google-Smtp-Source: AGHT+IEup5gdGsOSOv7nok9dBhDmVXHpDHc43eYOM4Gi81iFLLQNZUV7qK63UI8Vb/H5oqnzA7mwA0HBcErTyU7yPJ8=
X-Received: by 2002:a05:7022:698b:b0:11b:ca88:c4f9 with SMTP id
 a92af1059eb24-121721acbfdmr31596779c88.2.1767111222307; Tue, 30 Dec 2025
 08:13:42 -0800 (PST)
MIME-Version: 1.0
References: <20251223061755.7717-1-liankun.yang@mediatek.com>
In-Reply-To: <20251223061755.7717-1-liankun.yang@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 30 Dec 2025 16:13:30 +0000
X-Gmail-Original-Message-ID: <CAAOTY_9VL6U5TM6hnMZ8sJKO5rDUHuMPtNwOs_B7LwJQt7_-VQ@mail.gmail.com>
X-Gm-Features: AQt7F2rpHVt9-A7lt1JblSGNXGVjkgs3E4hy6D-urEpWE9u1DUGmMEB_b9EEP9g
Message-ID: <CAAOTY_9VL6U5TM6hnMZ8sJKO5rDUHuMPtNwOs_B7LwJQt7_-VQ@mail.gmail.com>
Subject: Re: [PATCH v8 1/1] drm/mediatek: Move DP training to hotplug thread
To: Liankun Yang <liankun.yang@mediatek.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, mac.shen@mediatek.com, 
	peng.liu@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_081344_032496_86576D33 
X-CRM114-Status: GOOD (  38.06  )
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

Hi, Liankun:

Liankun Yang <liankun.yang@mediatek.com> =E6=96=BC 2025=E5=B9=B412=E6=9C=88=
23=E6=97=A5=E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=886:34=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> By adjusting the order of link training and relocating it to HPD,
> link training can identify the usability of each lane in the current link=
.
>
> It also supports handling signal instability and weakness due to
> environmental issues, enabling the acquisition of a stable bandwidth
> for the current link. Subsequently, DP work can proceed based on
> the actual maximum bandwidth.
>
> It should training in the hpd event thread.
> Check the mode with lane count and link rate of training.
>
> If we're eDP and capabilities were already parsed we can skip
> reading again because eDP panels aren't hotpluggable hence the
> caps and training information won't ever change in a boot life
>
> Therefore, bridge typec judgment is required for edp training in
> atomic_enable function.
>
> `mtk_dp_parse_capabilities` is related to DP training, it is
> used in `mtk_dp_hpd_event_thread` before DP training, and then only
> used by eDP when read edid.
>
> -Modify part of in `mtk_dp_bridge_atomic_disable`
>     if (mtk_dp->train_info.cable_plugged_in) {
>        drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POWER_D3);
>        usleep_range(2000, 3000);
>     }
>
>     /* power off aux */
>     mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
>                 DP_PWR_STATE_BANDGAP_TPLL,
>                 DP_PWR_STATE_MASK);
>
> -Modify part of in `mtk_dp_aux_panel_poweron(mtk_dp, false);`
>     if (pwron) {
>        ....
>     } else {
>        /* power off panel */
>        drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POWER_D3);
>        usleep_range(2000, 3000);
>
>        /* power off aux */
>        mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
>                         DP_PWR_STATE_BANDGAP_TPLL,
>                         DP_PWR_STATE_MASK);
>     }
>
> The `mtk_dp_aux_panel_poweron` function fails to align.
> Within the `mtk_dp_hpd_event_thread`, if DP is disconnected,
> the `mtk_dp_aux_panel_poweron` function will write from `aux`
> to `DPRX`, causing a failure and thus preventing symmetry.
>
> This shows the current timings after the DP cable is plugged in,
> as well as the modified timings.
>
> current timings:                Fix timings:
>
> mtk_dp_hpd_event_thread()       mtk_dp_hpd_event_thread()
>                                 (including DP link training)
>         |                               |
>        ...                             ...
> mtk_dp_bridge_mode_valid()      mtk_dp_bridge_mode_valid()
>         |
>        ...                             ...
> mtk_dp_bridge_atomic_check()    mtk_dp_bridge_atomic_check()
>         |
>        ...                             ...
> mtk_dp_bridge_atomic_enable()   mtk_dp_bridge_atomic_enable()
> (including DP link training)
>
> PS:
> 1. "..." represents ommited steps;
>
> 2. `mtk_dp_bridge_mode_valid()` calculates the bandwidth using the
> current lane count and link rate, and then filters each mode to
> determine if it supports returning a status.
>
> 3. In the `drm_display_mode_to_videomode(&crtc_state->adjusted_mode,
> &mtk_dp->info.vm);` function, within the `mtk_dp_bridge_atomic_check()`
> function, `adjusted_mode` sets the currently selected display mode for
> the DRM.
>
> 4. DP link training tests the signal conditions of the link between
> DPTX and DPRX, and selects the lane count and link rate that meet
> the signal conditions.
>
> 5. For example, the platform support DP 4lane 5.4G,
> but panel A support DP 2lane 5.4G.
>
>    This is a time sequence:
>
>    a).Plug in panel A. According to the platform, it can output 4K60Hz.
>    b).Timing mode set 4K 60Hz(Including in mtk_dp_bridge_atomic_check
>    function).
>    c).Atomic enable(Based on panel A ability, training pass 2lane
>    5.4G).
>    d).Finally, due to 2lane 5.4G bandwidth limitation, the platform
>    cannot output 4K 60Hz, resulting in a black sreen.
>
>    If apply this patch.
>
>    a).Plug in panel A.
>    b).Training pass 2lane 5.4G
>    c).Timing mode set 2K 60Hz(Based on the 2lane 5.4G bandwidth limit
>    and including in mtk_dp_bridge_atomic_che

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Signed-off-by: Liankun Yang <liankun.yang@mediatek.com>
> ---
> Change in V8:
> - Update the commit message.
> - Update the commit title.
> Per suggestion from the previous thread:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20251104085957.=
1175-2-liankun.yang@mediatek.com/
>
> Change in V7:
> - Separate the edp part.
> Per suggestion from the previous thread:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20250822120506.=
15486-1-liankun.yang@mediatek.com/
>
> Change in V6:
> - Fixed power on in atomic enable.
> Per suggestion from the previous thread:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20250630080824.=
7107-1-liankun.yang@mediatek.com/
>
> Change in V5:
> - Fixed the issue that the 4th version of the patch caused DP to have no =
screen.
> Per suggestion from the previous thread:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20250625095446.=
31726-1-liankun.yang@mediatek.com/
>
> Change in V4:
> - Tested the internal eDP display on MT8195 Tomato and it is fine.
> Per suggestion from the previous thread:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20250318140236.=
13650-2-liankun.yang@mediatek.com/
>
> Change in V3:
> - Remove 'mtk_dp->enabled =3D false" in atomic disable.
> - Remove 'mtk_dp->enabled =3D true" in atomic enable.
> Per suggestion from the previous thread:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20241025083036.=
8829-4-liankun.yang@mediatek.com/
>
> Change in V2:
> - Adjust DP training timing.
> - Adjust parse capabilities timing.
> - Add power on/off for connect/disconnect.
> Per suggestion from the previous thread:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20240315015233.=
2023-1-liankun.yang@mediatek.com/
> ---
>  drivers/gpu/drm/mediatek/mtk_dp.c | 57 ++++++++++++++++++++-----------
>  1 file changed, 38 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek=
/mtk_dp.c
> index b0b1e158600f..5e67dab6e2e9 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -1976,6 +1976,7 @@ static irqreturn_t mtk_dp_hpd_event_thread(int hpd,=
 void *dev)
>         struct mtk_dp *mtk_dp =3D dev;
>         unsigned long flags;
>         u32 status;
> +       int ret;
>
>         if (mtk_dp->need_debounce && mtk_dp->train_info.cable_plugged_in)
>                 msleep(100);
> @@ -1994,9 +1995,28 @@ static irqreturn_t mtk_dp_hpd_event_thread(int hpd=
, void *dev)
>                         memset(&mtk_dp->info.audio_cur_cfg, 0,
>                                sizeof(mtk_dp->info.audio_cur_cfg));
>
> +                       mtk_dp->enabled =3D false;
> +                       /* power off aux */
> +                       mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
> +                                          DP_PWR_STATE_BANDGAP_TPLL,
> +                                          DP_PWR_STATE_MASK);
> +
>                         mtk_dp->need_debounce =3D false;
>                         mod_timer(&mtk_dp->debounce_timer,
>                                   jiffies + msecs_to_jiffies(100) - 1);
> +               } else {
> +                       mtk_dp_aux_panel_poweron(mtk_dp, true);
> +
> +                       ret =3D mtk_dp_parse_capabilities(mtk_dp);
> +                       if (ret)
> +                               drm_err(mtk_dp->drm_dev, "Can't parse cap=
abilities\n");
> +
> +                       /* Training */
> +                       ret =3D mtk_dp_training(mtk_dp);
> +                       if (ret)
> +                               drm_err(mtk_dp->drm_dev, "Training failed=
, %d\n", ret);
> +
> +                       mtk_dp->enabled =3D true;
>                 }
>         }
>
> @@ -2168,7 +2188,8 @@ static const struct drm_edid *mtk_dp_edid_read(stru=
ct drm_bridge *bridge,
>          * Parse capability here to let atomic_get_input_bus_fmts and
>          * mode_valid use the capability to calculate sink bitrates.
>          */
> -       if (mtk_dp_parse_capabilities(mtk_dp)) {
> +       if (mtk_dp->bridge.type =3D=3D DRM_MODE_CONNECTOR_eDP &&
> +           mtk_dp_parse_capabilities(mtk_dp)) {
>                 drm_err(mtk_dp->drm_dev, "Can't parse capabilities\n");
>                 drm_edid_free(drm_edid);
>                 drm_edid =3D NULL;
> @@ -2366,13 +2387,15 @@ static void mtk_dp_bridge_atomic_enable(struct dr=
m_bridge *bridge,
>                 return;
>         }
>
> -       mtk_dp_aux_panel_poweron(mtk_dp, true);
> +       if (mtk_dp->data->bridge_type =3D=3D DRM_MODE_CONNECTOR_eDP) {
> +               mtk_dp_aux_panel_poweron(mtk_dp, true);
>
> -       /* Training */
> -       ret =3D mtk_dp_training(mtk_dp);
> -       if (ret) {
> -               drm_err(mtk_dp->drm_dev, "Training failed, %d\n", ret);
> -               goto power_off_aux;
> +               /* Training */
> +               ret =3D mtk_dp_training(mtk_dp);
> +               if (ret) {
> +                       drm_err(mtk_dp->drm_dev, "Training failed, %d\n",=
 ret);
> +                       goto power_off_aux;
> +               }
>         }
>
>         ret =3D mtk_dp_video_config(mtk_dp);
> @@ -2392,7 +2415,9 @@ static void mtk_dp_bridge_atomic_enable(struct drm_=
bridge *bridge,
>                        sizeof(mtk_dp->info.audio_cur_cfg));
>         }
>
> -       mtk_dp->enabled =3D true;
> +       if (mtk_dp->data->bridge_type =3D=3D DRM_MODE_CONNECTOR_eDP)
> +               mtk_dp->enabled =3D true;
> +
>         mtk_dp_update_plugged_status(mtk_dp);
>
>         return;
> @@ -2407,21 +2432,15 @@ static void mtk_dp_bridge_atomic_disable(struct d=
rm_bridge *bridge,
>  {
>         struct mtk_dp *mtk_dp =3D mtk_dp_from_bridge(bridge);
>
> -       mtk_dp->enabled =3D false;
> +       if (mtk_dp->data->bridge_type =3D=3D DRM_MODE_CONNECTOR_eDP) {
> +               mtk_dp->enabled =3D false;
> +               mtk_dp_aux_panel_poweron(mtk_dp, false);
> +       }
> +
>         mtk_dp_update_plugged_status(mtk_dp);
>         mtk_dp_video_enable(mtk_dp, false);
>         mtk_dp_audio_mute(mtk_dp, true);
>
> -       if (mtk_dp->train_info.cable_plugged_in) {
> -               drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POW=
ER_D3);
> -               usleep_range(2000, 3000);
> -       }
> -
> -       /* power off aux */
> -       mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
> -                          DP_PWR_STATE_BANDGAP_TPLL,
> -                          DP_PWR_STATE_MASK);
> -
>         /* SDP path reset sw*/
>         mtk_dp_sdp_path_reset(mtk_dp);
>
> --
> 2.45.2
>

