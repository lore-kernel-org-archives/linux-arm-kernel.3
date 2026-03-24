Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 442BFF532FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 09:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AQWLMORUnkVbiNjJGAhEshPKUTqZoxqhRKKnwPG0jLg=; b=CvohZ1opgMRdt9HuNcDLU1wZDW
	HutMZbT6SSbBcv2ux50Lh/Wa1jF7jUiPPhWXxnyWT1v6Xpir3SKH98MyH6RHn45gWrVilyIY1sUVL
	wOjABarxjFRDTbaHwQuNy2ch/giOGuOtHSkswn2qD2DCegiXkq6/uuWGAM3MHqSCbJcgZex959TxS
	VNqvmRaq4ZmDA6xZlZkmIIbx0+FQcsBlkjYLQ/BHkfeSsx7Lk2Tt9Kdzwk1rBW7cl2lWHr54905vp
	ex7BvwzgpjzXg65I4p9thQPUWjmRZELRgyzOIg25+ZzOmn8cEDbB7cP/2xhzkpiJhxSA9HAcat4Iy
	IBllUewA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4xoF-000000013Q8-0Nsf;
	Tue, 24 Mar 2026 09:12:23 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4xoC-000000013PZ-23F2;
	Tue, 24 Mar 2026 09:12:21 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1774343500; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=d8MnFBQkKpHJ4TH23zDPo4o46LfLDPrpOVdPHNE8ffXdXoFxGc7Z2FEQ4wf6xDvr2cm7f+ehIE1nYTny/bZbLEgXKPGNowaLSVzidCx+RDP0QVrCp1rUpzEgSWZboLirKnaw3feRFwxKdgLPp9qDSBWOC9EQ+PdE64D0Fb72wRo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774343500; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=AQWLMORUnkVbiNjJGAhEshPKUTqZoxqhRKKnwPG0jLg=; 
	b=NH0ufGdazv3xhvW3Ffcl7B4X+OXgsO2OwuF9YchQH2o1qCxwFwAHLOp6Zc9AN4bYNWjkBXcO8A/Gl4hBfRmU2ZDpNdH4anSXnKBrZDzPcZvm1CE1utnQ6TUPnwdidE/PxAo/b5tjhVe35PQLV7xLoUd4trRPY7FM8r/TZMm+Zzk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774343500;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=AQWLMORUnkVbiNjJGAhEshPKUTqZoxqhRKKnwPG0jLg=;
	b=d35X0UtaEM7Po2FmSfpYS/6GcdVCuoJdv3y7/qdxC4D7X6PAayQR7Kq9dY6FsyOk
	EqCn9VqIS2DDtW5r6H2IvfwLjVfCoPmKAaXUTbFOlMt00Gc2rXszoXyC6oQA7gOJ0jf
	iE+gFM6eC7gQYaMiIKr+UMRYfL2+ysQVrvP/2n1E=
Received: by mx.zohomail.com with SMTPS id 1774343497883801.6427108884712;
	Tue, 24 Mar 2026 02:11:37 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andy Yan <andy.yan@rock-chips.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>,
 Liu Ying <victor.liu@nxp.com>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v3 04/14] drm/amdgpu: display: Convert to drm_output_color_format
Date: Tue, 24 Mar 2026 10:11:29 +0100
Message-ID: <7113873.lOV4Wx5bFT@workhorse>
In-Reply-To: <20260305-drm-rework-color-formats-v3-4-f3935f6db579@kernel.org>
References: <20260305-drm-rework-color-formats-v3-0-f3935f6db579@kernel.org>
 <20260305-drm-rework-color-formats-v3-4-f3935f6db579@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_021220_560342_3DFBF40B 
X-CRM114-Status: GOOD (  21.70  )
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

On Thursday, 5 March 2026 10:04:56 Central European Standard Time Maxime Ripard wrote:
> Now that we introduced a new drm_output_color_format enum to represent
> what DRM_COLOR_FORMAT_* bits were representing, we can switch to the new
> enum.
> 
> The main difference is that while DRM_COLOR_FORMAT_ was a bitmask,
> drm_output_color_format is a proper enum. However, the enum was done is
> such a way than DRM_COLOR_FORMAT_X = BIT(DRM_OUTPUT_COLOR_FORMAT_X) so
> the transitition is easier.
> 
> The only thing we need to consider is if the original code meant to use
> that value as a bitmask, in which case we do need to keep the bit shift,
> or as a discriminant in which case we don't.
> 
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index a8e4e3ab5e40276b3c723297ca6520688079e0a7..2fe9044e1e91d7581fd5032b9883548f8e5e1b43 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -6723,15 +6723,15 @@ static void fill_stream_properties_from_drm_display_mode(
>  		timing_out->pixel_encoding = PIXEL_ENCODING_YCBCR420;
>  	else if (drm_mode_is_420_also(info, mode_in)
>  			&& aconnector
>  			&& aconnector->force_yuv420_output)
>  		timing_out->pixel_encoding = PIXEL_ENCODING_YCBCR420;
> -	else if ((connector->display_info.color_formats & DRM_COLOR_FORMAT_YCBCR422)
> +	else if ((connector->display_info.color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422))
>  			&& aconnector
>  			&& aconnector->force_yuv422_output)
>  		timing_out->pixel_encoding = PIXEL_ENCODING_YCBCR422;
> -	else if ((connector->display_info.color_formats & DRM_COLOR_FORMAT_YCBCR444)
> +	else if ((connector->display_info.color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444))
>  			&& stream->signal == SIGNAL_TYPE_HDMI_TYPE_A)
>  		timing_out->pixel_encoding = PIXEL_ENCODING_YCBCR444;
>  	else
>  		timing_out->pixel_encoding = PIXEL_ENCODING_RGB;
>  
> 
> 

Tested-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

I've been running this patch as part of my color format work and it
works precisely as it's supposed to (which is also quite evident from
the simple conversion in the code.)

Kind regards,
Nicolas Frattaroli



