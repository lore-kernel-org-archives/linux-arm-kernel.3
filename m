Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D65F6CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 13:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:Cc:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FPEMzOztpJUvojsoCi0pzhR593btKmY4mmBboMedZFk=; b=TB9mWYsjLUbvDLra13iKk6B6KK
	PMPYvPIwVmJQVF+sHKlUPYdCWoEoiTULE9++K3MPDLcNSJJDBz+UUmWlvGY18OpvIFGOPHlp8dboy
	LP1PDR87VRBpH5Dbl8hqWxje7S6al5punWyXKPWqIgs25ZQufhGKuWgnj76QtnvCaCAh2RnJtN2N+
	iStgD8GjewkfvQ1lIUBkYHRkNpRkcCJhOtskyFwH5NVSgfm2PP6iGkWFlIhpuxnnhcrrDLlIIXzh3
	biIQnOCv4w6kJo1skhXamUoV6tuZXiuhtj4st3jkWRhLz0EpOxFMB+BwB1QGXzk2w+3AJ61vAZCUM
	fZsmCA6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJApI-00000008q9X-3M2R;
	Wed, 12 Nov 2025 13:23:56 +0000
Received: from out-180.mta0.migadu.com ([2001:41d0:1004:224b::b4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJApG-00000008q8a-0AyX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 13:23:55 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1762953831;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FPEMzOztpJUvojsoCi0pzhR593btKmY4mmBboMedZFk=;
	b=FUj2SeR3Zs+ZRsouks+uTMRzsGS/+tSLpSv253fR3UUjDL+BQ2S3m34Yh0dI7DCEZI7Cfu
	55dAosTlW4PwMF/bGCNfazJAgDxKDz1/Il8+5JSJ3O0vfxl2CFzZuf2YOTPFJi3GCSeUvX
	mJy2TTAxM593CxFrMyJbdyuKlCumHyAaHFJqlDw7SXhj54fcFzCcX2zRx6aUDOIwpI6ULo
	bQ4aYDtlnPjSnv87GRO4e0QfCf8vPmrfw2jNGOEZFuE/syUzmA7B+lfpsIcits0RLGdQM2
	MtRYv/ZXy837jnNB7kpR78SlcKgjvquiQDGJmXLH0n+2VW1X5ys7euxSSsrBUg==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 12 Nov 2025 14:23:49 +0100
Message-Id: <DE6QZ4EILEX2.1MQSX07ZMQLCW@cknow-tech.com>
To: "Andy Yan" <andyshrk@163.com>, <heiko@sntech.de>
Cc: <hjc@rock-chips.com>, <diederik@cknow-tech.com>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-rockchip@lists.infradead.org>, "Andy
 Yan" <andy.yan@rock-chips.com>
Subject: Re: [PATCH] drm/rockchip: vop2: Use OVL_LAYER_SEL configuration
 instead of use win_mask calculate used layers
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
References: <20251112085024.2480111-1-andyshrk@163.com>
In-Reply-To: <20251112085024.2480111-1-andyshrk@163.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_052354_365780_520304F6 
X-CRM114-Status: GOOD (  29.17  )
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

Hi Andy,

On Wed Nov 12, 2025 at 9:50 AM CET, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
>
> When there are multiple Video Ports, and only one of them is working
> (for example, VP1 is working while VP0 is not), in this case, the
> win_mask of VP0 is 0. However, we have already set the port mux for VP0
> according to vp0->nlayers, and at the same time, in the OVL_LAYER_SEL
> register, there are windows will also be assigned to layers which will
> map to the inactive VPs. In this situation, vp0->win_mask is zero as it
> now working, it is more reliable to calculate the used layers based on
> the configuration of the OVL_LAYER_SEL register.

Thanks a lot for this patch!
I've tested it on my PineTab2 and the 'black box under cursor' problem
is now fixed :-) So feel free to add my

Tested-by: Diederik de Haas <diederik@cknow-tech.com>

Cheers,
  Diederik

> Note: as the configuration of OVL_LAYER_SEL is take effect when the
> vsync is come, so we use the value backup in vop2->old_layer_sel instead
> of read OVL_LAYER_SEL directly.
>
> Fixes: 3e89a8c68354 ("drm/rockchip: vop2: Fix the update of LAYER/PORT se=
lect registers when there are multi display output on rk3588/rk3568")
> Reported-by: Diederik de Haas <diederik@cknow-tech.com>
> Closes: https://bugs.kde.org/show_bug.cgi?id=3D511274
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---
>
>  drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 49 +++++++++++++++++---
>  1 file changed, 42 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/d=
rm/rockchip/rockchip_vop2_reg.c
> index d22ce11a4235..f3950e8476a7 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> @@ -1369,6 +1369,25 @@ static const struct vop2_regs_dump rk3588_regs_dum=
p[] =3D {
>  	},
>  };
> =20
> +/*
> + * phys_id is used to identify a main window(Cluster Win/Smart Win, not
> + * include the sub win of a cluster or the multi area) that can do overl=
ay
> + * in main overlay stage.
> + */
> +static struct vop2_win *vop2_find_win_by_phys_id(struct vop2 *vop2, uint=
8_t phys_id)
> +{
> +	struct vop2_win *win;
> +	int i;
> +
> +	for (i =3D 0; i < vop2->data->win_size; i++) {
> +		win =3D &vop2->win[i];
> +		if (win->data->phys_id =3D=3D phys_id)
> +			return win;
> +	}
> +
> +	return NULL;
> +}
> +
>  static unsigned long rk3568_set_intf_mux(struct vop2_video_port *vp, int=
 id, u32 polflags)
>  {
>  	struct vop2 *vop2 =3D vp->vop2;
> @@ -1842,15 +1861,31 @@ static void vop2_parse_alpha(struct vop2_alpha_co=
nfig *alpha_config,
>  	alpha->dst_alpha_ctrl.bits.factor_mode =3D ALPHA_SRC_INVERSE;
>  }
> =20
> -static int vop2_find_start_mixer_id_for_vp(struct vop2 *vop2, u8 port_id=
)
> +static int vop2_find_start_mixer_id_for_vp(struct vop2_video_port *vp)
>  {
> -	struct vop2_video_port *vp;
> -	int used_layer =3D 0;
> +	struct vop2 *vop2 =3D vp->vop2;
> +	struct vop2_win *win;
> +	u32 layer_sel =3D vop2->old_layer_sel;
> +	u32 used_layer =3D 0;
> +	unsigned long win_mask =3D vp->win_mask;
> +	unsigned long phys_id;
> +	bool match;
>  	int i;
> =20
> -	for (i =3D 0; i < port_id; i++) {
> -		vp =3D &vop2->vps[i];
> -		used_layer +=3D hweight32(vp->win_mask);
> +	for (i =3D 0; i < 31; i +=3D 4) {
> +		match =3D false;
> +		for_each_set_bit(phys_id, &win_mask, ROCKCHIP_VOP2_ESMART3) {
> +			win =3D vop2_find_win_by_phys_id(vop2, phys_id);
> +			if (win->data->layer_sel_id[vp->id] =3D=3D ((layer_sel >> i) & 0xf)) =
{
> +				match =3D true;
> +				break;
> +			}
> +		}
> +
> +		if (!match)
> +			used_layer +=3D 1;
> +		else
> +			break;
>  	}
> =20
>  	return used_layer;
> @@ -1935,7 +1970,7 @@ static void vop2_setup_alpha(struct vop2_video_port=
 *vp)
>  	u32 dst_global_alpha =3D DRM_BLEND_ALPHA_OPAQUE;
> =20
>  	if (vop2->version <=3D VOP_VERSION_RK3588)
> -		mixer_id =3D vop2_find_start_mixer_id_for_vp(vop2, vp->id);
> +		mixer_id =3D vop2_find_start_mixer_id_for_vp(vp);
>  	else
>  		mixer_id =3D 0;
> =20


