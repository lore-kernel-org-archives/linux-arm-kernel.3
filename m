Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD95DCFD376
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 09:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QSChnZKCTndCp+Z+JBrbPozbiUbw03QB0iuRIKe9s/k=; b=Xu8YXt7DHMJBC9khxQ6t3C+bX7
	7NZvBef/4vmgX5mC/vwBykqkLGf3nTLo5eiiSFYOsiBmZ4jWq3eHg1sI/1sSlh48Ctq5eLLAkmexY
	bsU7Arre/jcCd/2uHIWenUqjyHdmHGJxFef0ybQ6pkohO2i94drTVwZPrgEuYzSyXPrRfpUmqsRbJ
	KkeilEFLb1Mv3fZmixKe9805m3j30/dPwszPj1Rr7z8qXx/TofSxNse2+gDpyg0IhuElQV5H/m/sQ
	EYleNdDemv9O3K/Jr5W/tKUesLYwdfwYh+5emK6+SYpMjHMQClQ7rpVVRzWYO70tvjmalGx4v/M2p
	CQQg+zDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOv2H-00000000F7T-02tK;
	Fri, 28 Nov 2025 09:45:05 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOv2C-00000000F6d-2cMM;
	Fri, 28 Nov 2025 09:45:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764323096;
	bh=0LnUX19BdTNrL0J1kCmxSuhg9fo7Au5noTJqd7AdjsA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qtbULuurhDb2FhNugzJGIclzu2CzQCJSjEhRPi4YQo2wshHyxzhO5kK+G+qpLBnIJ
	 Dutmb433ltFVSZpsQxW1X4GLvAx8YH3q7Xl7QeClEd1DuUkYX8h21P6cgZsB8SAjHB
	 zjCiXIZ8IaHVkQ9tRujnviKF5JV8mo/ArdowZc/YcoJUSeDQyMtCsoF6rYp8LuwUJZ
	 j/ypjquW8EMWsR8P9AodwLj7Jc8auJkIlfEnL0ityUE0IWrrNqApxxxoxXfr8jpb09
	 RR1EqntKBgpooIBkC7yq9CzwITxFFctZvGcOCahDsI3oTuOmDoQSn2w9MgGaCOid6n
	 1XLzEbW1l74iA==
Received: from [192.168.1.90] (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D0BD217E107C;
	Fri, 28 Nov 2025 10:44:55 +0100 (CET)
Message-ID: <4a6443b8-d440-4921-8a43-7c20e4e265e7@collabora.com>
Date: Fri, 28 Nov 2025 11:44:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] drm/rockchip: vop2: Support setting custom
 background color
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>
Cc: Robert Mader <robert.mader@collabora.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20251118-rk3588-bgcolor-v3-0-a2cc909428ea@collabora.com>
 <20251118-rk3588-bgcolor-v3-4-a2cc909428ea@collabora.com>
 <0ed71b8d-5a2e-4213-bd2f-7ba317d1e4cb@rock-chips.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <0ed71b8d-5a2e-4213-bd2f-7ba317d1e4cb@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_014500_826876_A8E995D6 
X-CRM114-Status: GOOD (  20.13  )
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

Hi Chaoyi,

On 11/28/25 10:46 AM, Chaoyi Chen wrote:
> Hello Cristian,
> 
> On 11/18/2025 7:52 AM, Cristian Ciocaltea wrote:
>> The Rockchip VOP2 display controller allows configuring the background
>> color of each video output port.
>>
>> Since a previous patch introduced the BACKGROUND_COLOR CRTC property,
>> which defaults to solid black, make use of it when programming the
>> hardware.
>>
>> Note the maximum precision allowed by the display controller is 10bpc,
>> while the alpha component is not supported, hence ignored.
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 13 ++++++++++++-
>>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  4 ++++
>>  2 files changed, 16 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>> index 498df0ce4680..87110beba366 100644
>> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>> @@ -1554,6 +1554,7 @@ static void vop2_post_config(struct drm_crtc *crtc)
>>  	struct vop2_video_port *vp = to_vop2_video_port(crtc);
>>  	struct vop2 *vop2 = vp->vop2;
>>  	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
>> +	u64 bgcolor = crtc->state->background_color;
>>  	u16 vtotal = mode->crtc_vtotal;
>>  	u16 hdisplay = mode->crtc_hdisplay;
>>  	u16 hact_st = mode->crtc_htotal - mode->crtc_hsync_start;
>> @@ -1599,7 +1600,11 @@ static void vop2_post_config(struct drm_crtc *crtc)
>>  		vop2_vp_write(vp, RK3568_VP_POST_DSP_VACT_INFO_F1, val);
>>  	}
>>  
>> -	vop2_vp_write(vp, RK3568_VP_DSP_BG, 0);
>> +	/* Background color is programmed with 10 bits of precision */
>> +	val = FIELD_PREP(RK3568_VP_DSP_BG__DSP_BG_RED, DRM_ARGB64_GETR_BPC(bgcolor, 10));
>> +	val |= FIELD_PREP(RK3568_VP_DSP_BG__DSP_BG_GREEN, DRM_ARGB64_GETG_BPC(bgcolor, 10));
>> +	val |= FIELD_PREP(RK3568_VP_DSP_BG__DSP_BG_BLUE, DRM_ARGB64_GETB_BPC(bgcolor, 10));
> 
> Division is expensive. If we convert a 16 bpc value to 10 bpc using
> direct bit-shifts, that is "DRM_ARGB64_GETX(bgcolor) >> 6" will
> keep the relative error within 1 compared to DIV_ROUND_CLOSEST().
> 
> Should we be concerned about the precision problem here?

The precision was something I initially looked into for CRC verification, in the
context of the related IGT test.  But since I've added the VKMS support, I think
we should not worry about that anymore. 

Moreover, as already pointed out in [1], only RK3576 supports CRC generation at
display controller level, and that is not particularly useful because it doesn't
take the background color into account.  Therefore I had to capture the frame
CRCs at DisplayPort AUX channel level, by using the USB-C DP AltMode capable
port of my RK3588-based board.  However, that solution is not yet available
upstream, as it requires further work for cleanup and improving the overall
USB-C reliability. 

Hence I'll move on with your suggestion and switch to the simple bit-shifting
approach for the next revision.

Thanks,
Cristian

[1] https://lore.kernel.org/all/20251118-crtc-bgcolor-v2-1-dce4063f85a9@collabora.com/

