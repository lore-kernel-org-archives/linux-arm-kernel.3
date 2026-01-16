Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE2CC982CD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 15:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2/Qkt6WqYRHJqQsgzLyZZh6dzc7S9YDfykp9BItlRdk=; b=MpbrrluGRjj3dvXPYP7OBREHsy
	7hC06jlMQHgz2r1BIe0ZDwrGpnEdhU/dSz4DRTFxmPYUhdrLjQa7/DZ69dv4Ri9pxdwKEcqYsONo2
	RlK1VCfjmC2vcr8UHJ9FCawIoIOX7+UUE5TcYFKh9gmBa78POhq2BBijYVF0DcuDrD11BR0mwEkv4
	mqpmz0Y1m9YTSOgFyCZJAh/MEIRBWy5PY9nQwKEa+FsseRUiuLogHhzSA43opoqvQrvIatEcfIFqg
	POkUkofhiwVsR+soiE+PY2JiYGPTHUT7GB9CE850POAzEk6RAcDASyyVVWtgUs2Q45Pn+V4nQJBlA
	V49iuKLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgleV-0000000ELrq-03Gk;
	Fri, 16 Jan 2026 15:22:19 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgleR-0000000ELrL-44Gm;
	Fri, 16 Jan 2026 15:22:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768576932;
	bh=nMzG4VYsPxThyemGmauGTpz3/79R6uHQXsAVyIDCY68=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=V0E6xz9bBqQb0j5WBYTwr3DT1kb3tap53bVIQAYhjbhs3C6uXAfqno/ktp1Dw/IBf
	 IjvqzclP4eyH1K3oLBvSMGDiFvXeB4OZqKl4sn5IdwrLjzmxsILUjI6lij215+FbEC
	 ibHgQlRgvXCfkVIvHYx5Yl7ixIgXYMuVJM1FPjDedXrMM/3f4fXHiBA54tMw+Q9mES
	 RJVFznGjlZ6dukcNpwA9jpF3iGrf6sEgcSh7Ow38uLn7/gKs7Au9p9rP5T3w7THdWE
	 zRy3SVtUd6MfUCYiVd1st5X1HYSvzvVJa0Pyc2LQJdqj3tkwmJKqXn8EDrNOZYUEen
	 9obLkDk8JeFYQ==
Received: from [192.168.1.90] (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AD26817E0456;
	Fri, 16 Jan 2026 16:22:11 +0100 (CET)
Message-ID: <67fb66b7-eee7-4109-8127-385593e88425@collabora.com>
Date: Fri, 16 Jan 2026 17:22:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] drm/rockchip: vop2: Support setting custom
 background color
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Andy Yan <andyshrk@163.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Robert Mader <robert.mader@collabora.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20251219-rk3588-bgcolor-v4-0-2ff1127ea757@collabora.com>
 <20251219-rk3588-bgcolor-v4-4-2ff1127ea757@collabora.com>
 <2750b73.10b0.19ba61052c8.Coremail.andyshrk@163.com>
 <9e4c8514-63e9-4ff7-85b1-b5af7dff9a2d@collabora.com>
Content-Language: en-US
In-Reply-To: <9e4c8514-63e9-4ff7-85b1-b5af7dff9a2d@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_072216_215563_FFF7CE7E 
X-CRM114-Status: GOOD (  20.58  )
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

On 1/10/26 11:58 AM, Cristian Ciocaltea wrote:
> Hi Andy,
> 
> On 1/10/26 6:00 AM, Andy Yan wrote:
>>
>>
>> Hello Cristian,
>> At 2025-12-20 05:47:01, "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com> wrote:
>>> The Rockchip VOP2 display controller allows configuring the background
>>> color of each video output port.
>>>
>>> Since a previous patch introduced the BACKGROUND_COLOR CRTC property,
>>> which defaults to solid black, make use of it when programming the
>>> hardware.
>>>
>>> Note the maximum precision allowed by the display controller is 10bpc,
>>> while the alpha component is not supported, hence ignored.
>>>
>>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>>> ---
>>> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 13 ++++++++++++-
>>> drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  4 ++++
>>> 2 files changed, 16 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>>> index 498df0ce4680..3a232d0d4acb 100644
>>> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>>> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>>> @@ -1554,6 +1554,7 @@ static void vop2_post_config(struct drm_crtc *crtc)
>>> 	struct vop2_video_port *vp = to_vop2_video_port(crtc);
>>> 	struct vop2 *vop2 = vp->vop2;
>>> 	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
>>> +	u64 bgcolor = crtc->state->background_color;
>>> 	u16 vtotal = mode->crtc_vtotal;
>>> 	u16 hdisplay = mode->crtc_hdisplay;
>>> 	u16 hact_st = mode->crtc_htotal - mode->crtc_hsync_start;
>>> @@ -1599,7 +1600,11 @@ static void vop2_post_config(struct drm_crtc *crtc)
>>> 		vop2_vp_write(vp, RK3568_VP_POST_DSP_VACT_INFO_F1, val);
>>> 	}
>>>
>>> -	vop2_vp_write(vp, RK3568_VP_DSP_BG, 0);
>>> +	/* Background color is programmed with 10 bits of precision */
>>> +	val = FIELD_PREP(RK3568_VP_DSP_BG__DSP_BG_RED, DRM_ARGB64_GETR(bgcolor) >> 6);
>>> +	val |= FIELD_PREP(RK3568_VP_DSP_BG__DSP_BG_GREEN, DRM_ARGB64_GETG(bgcolor) >> 6);
>>
>>> +	val |= FIELD_PREP(RK3568_VP_DSP_BG__DSP_BG_BLUE, DRM_ARGB64_GETB(bgcolor) >> 6);
>>
>>
>> the bit31 of  RK3568_VP_DSP_BG  is bg_display_en， that means when we set a 
>> background color, we should set this bg_display_en bit.

I performed several tests on my ROCK 3A (RK3568), ROCK 4D (RK3576) and ROCK 5B
(RK3588) boards and noticed that by setting bg_display_en bit to 1 or 0 doesn't
have any influence on RK3568 and RK3576, the background color is always active
and cannot be disabled.

However, flipping the bit to 1 on RK3588 has the unexpected effect of covering
the whole screen with the configured color, even when there's an active plane
displayed on top. Switching back to 0 makes it work as expected.

Therefore I think we should keep this patch as is, unless there's something else
we're missing here.

>> The default value of this bit is 1, which explains why the patch currently works 
>> properly even though it doesn't set bit31.
> 
> For some reason, the RK3588 TRM indicates 0x0 for the reset value.  I assume
> that's a mistake, as RK3576 TRM shows 0x1.

Considering the observation above, it kinda makes sense now for RK3588 to
default to 0.


