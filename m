Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D00BFD2CE17
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 02:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=++V9Ih2XOWHzt8kN5tDYhc2K8I+ECObECwQKC4d5xqk=; b=GZgf43ILaUOho22E6ylu1XiBN/
	zc4BPJpwpSs49h20tnJbLI8Vklsq/3/m0sFwp/P0Az525eLhTP5ahwRz/tZuyc0N8m0C5caA2VpyM
	BRNFs0W38c8e3cy411qe9SVc04FOwn3Ou4+G5qE37TfstzfBHmw1sJ/F9tY68FYrA+xsmPsOK44N5
	UdKjN5vqbFMknAFJmYrcoj/HpDLeCVM0cHoJpnDheIvbyvtwySfijCMm6zH/5BJxlsrjsa5tdjKPr
	gluhPJxdlZwn7BRg17o/HgdiTKSuVIcE16nXRXZbHqiODHub6ke8PMklOzQubPF7tcyOriWCO39PA
	m9dIAGRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSRIq-0000000CVEY-08A3;
	Mon, 08 Dec 2025 02:48:44 +0000
Received: from mail-m21469.qiye.163.com ([117.135.214.69])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSRIm-0000000CVCz-2CBa;
	Mon, 08 Dec 2025 02:48:42 +0000
Received: from [172.16.12.51] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2c54a2597;
	Mon, 8 Dec 2025 10:48:27 +0800 (GMT+08:00)
Message-ID: <f9f7b446-8575-4f16-aa96-5197b22846e3@rock-chips.com>
Date: Mon, 8 Dec 2025 10:48:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] drm/rockchip: vop2: Enforce AFBC source alignment
 in plane_check
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>
References: <20251206-vop2-atomic-fixups-v2-0-7fb45bbfbebd@collabora.com>
 <20251206-vop2-atomic-fixups-v2-5-7fb45bbfbebd@collabora.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20251206-vop2-atomic-fixups-v2-5-7fb45bbfbebd@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9afbdc40e803abkunme8c07999276ba1c
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQhhISlZJS01CH0xNSUhIQkNWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=cecY6BMMm/6gQ/2K1RDh5tRiWZKU8O38FISd7rFWq0WnaAzGqbnG74DYW/5OX76YyJibVgxlKUeGLqykw3YxcmsttDzLWEiHTXe6IUFJgUa6FeaW3BIXEZgQvOpXS5Ur6s/5zek/X261ZJ0Ct245V+GgUw3u/kOSfOEZF7DJc+Q=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=++V9Ih2XOWHzt8kN5tDYhc2K8I+ECObECwQKC4d5xqk=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_184841_203927_B40412A7 
X-CRM114-Status: GOOD (  16.01  )
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

Hello Nicolas, Daniel,

On 12/7/2025 4:45 AM, Nicolas Frattaroli wrote:
> From: Daniel Stone <daniels@collabora.com>
> 
> Planes can only source AFBC framebuffers at multiples of 4px wide on
> RK3566/RK3568. Instead of clipping on all SoCs when the user asks for an
> unaligned source rectangle, reject the configuration in the plane's
> atomic check on RK3566/RK3568 only.
> 
> Signed-off-by: Daniel Stone <daniels@collabora.com>
> [Make RK3566/RK3568 specific, reword message]
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> index bc1ed0ffede0..e23213337104 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -1076,6 +1076,13 @@ static int vop2_plane_atomic_check(struct drm_plane *plane,
>  		return -EINVAL;
>  	}
>  
> +	if (vop2->version == VOP_VERSION_RK3568 && drm_is_afbc(fb->modifier) && src_w % 4) {
> +		drm_dbg_kms(vop2->drm,
> +			    "AFBC source rectangles must be 4-byte aligned; is %d\n",
> +			    src_w);
> +		return -EINVAL;
> +	}
> +
>  	return 0;
>  }
>  
> @@ -1237,11 +1244,8 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
>  	WARN_ON(src_w < 4);
>  	WARN_ON(src_h < 4);
>  
> -	if (afbc_en && src_w % 4) {
> -		drm_dbg_kms(vop2->drm, "vp%d %s src_w[%d] not 4 pixel aligned\n",
> -			    vp->id, win->data->name, src_w);
> -		src_w = ALIGN_DOWN(src_w, 4);
> -	}
> +	if (vop2->version == VOP_VERSION_RK3568 && drm_is_afbc(fb->modifier))
> +		WARN_ON(src_w % 4);
>  
>  	act_info = (src_h - 1) << 16 | ((src_w - 1) & 0xffff);
>  	dsp_info = (dsp_h - 1) << 16 | ((dsp_w - 1) & 0xffff);
> 

You haven't replied to Andy's comment yet [0].

[0] https://lore.kernel.org/dri-devel/7b4e26ec.75f3.19a77276b53.Coremail.andyshrk@163.com/

-- 
Best, 
Chaoyi

