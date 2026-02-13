Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD82EDF150
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 11:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5PY/PDkzPkXdYz4yf2i4/U2DRJK06ntsFOSUnN+RRmc=; b=BoLGFUwh58LxWUT8iAkAszLHjW
	i9ZGx2WK++1RAW74xQ/W2IsS567k2WW5RvDW6wi04aW4YYUFAXQT0SKFsEagNoQtLzGwxptvaJXKh
	mcqF7hXSOVCbgoU5uI+uPRqZmwJpyj/BkLcx+PqjHda8HyJRgbka60asK9RnhxPqI4CiAgc13gl1s
	1YL0+BWAvtQzL80ooo/dPETeA01LyccCtQZnKUG3s4woMvBYxeqbthiOaEuLXmFLwmBVTRbzlRhR/
	4w2xX/d8kHdSOYDXh2hHT0fWKAmkZ78gCcQY937O9KqF6XOr7Ykw00+6saWu/xZybAQ8oORnG+Q/5
	Qz0V/VmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqqyH-00000003MR3-1SoB;
	Fri, 13 Feb 2026 11:04:25 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqqyC-00000003MPy-1iYk;
	Fri, 13 Feb 2026 11:04:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770980657;
	bh=4nZFI6B+4DaZ1xwgKXUjqRowetvZjkztwjYyqHMz+xc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=plpyxtUIxFe/gOImlgAHoJUSgVdLvn0eJMXXj/FJyqzIalCK1zIypr0FQ1HGJ1pAY
	 3jUR1T9E4is+Xl8N6JbB/VRPv7MsKU5+j0vmn2JyNglpCU2cE5iS1l3xTAuhuIWZdr
	 zTUxqpABXVdGZDyZWcLcwXosI8VcXrm0GDQWJvxB9pNXEBYLgXrWIvoeFy+QblZR61
	 pJFzBWwLlgs70SJ6t/5WgXMN0faGiFqECbVfofSI9U4Xxtfter8u3iERgGxBCt+Kq2
	 l6SxBhdXnys+wtZtINxvexBOgSd/WW9dk1ljzueIJh0+RXPUc0ogy0bjladzq17/aO
	 FAnQ+k1oNXTOA==
Received: from [192.168.1.90] (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9B4A217E1406;
	Fri, 13 Feb 2026 12:04:16 +0100 (CET)
Message-ID: <f73fe751-5812-4f27-b4ad-19f214c6e49a@collabora.com>
Date: Fri, 13 Feb 2026 13:04:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] drm/rockchip: vop2: Support setting custom
 background color
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
 <67fb66b7-eee7-4109-8127-385593e88425@collabora.com>
 <539febc7.2cf9.19c55d3dfb0.Coremail.andyshrk@163.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <539febc7.2cf9.19c55d3dfb0.Coremail.andyshrk@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_030422_066138_E6ED69F5 
X-CRM114-Status: GOOD (  20.75  )
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

On 2/13/26 9:07 AM, Andy Yan wrote:
> Hello Cristian，
> 
> At 2026-01-16 23:22:11, "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com> wrote:
>> On 1/10/26 11:58 AM, Cristian Ciocaltea wrote:
>>> Hi Andy,
>>>
>>> On 1/10/26 6:00 AM, Andy Yan wrote:
>>>>
>>>>
>>>> Hello Cristian,
>>>> At 2025-12-20 05:47:01, "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com> wrote:
>>>>> The Rockchip VOP2 display controller allows configuring the background
>>>>> color of each video output port.
>>>>>
>>>>> Since a previous patch introduced the BACKGROUND_COLOR CRTC property,
>>>>> which defaults to solid black, make use of it when programming the
>>>>> hardware.
>>>>>
>>>>> Note the maximum precision allowed by the display controller is 10bpc,
>>>>> while the alpha component is not supported, hence ignored.
>>>>>
>>>>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>>>>> ---
>>>>> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 13 ++++++++++++-
>>>>> drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  4 ++++
>>>>> 2 files changed, 16 insertions(+), 1 deletion(-)

[...]

>>>>> -	vop2_vp_write(vp, RK3568_VP_DSP_BG, 0); +	/* Background color is
>>>>> programmed with 10 bits of precision */ +	val =
>>>>> FIELD_PREP(RK3568_VP_DSP_BG__DSP_BG_RED, DRM_ARGB64_GETR(bgcolor) >> 6); +
>>>>> val |= FIELD_PREP(RK3568_VP_DSP_BG__DSP_BG_GREEN, DRM_ARGB64_GETG(bgcolor)
>>>>> >> 6);
>>>>
>>>>> +	val |= FIELD_PREP(RK3568_VP_DSP_BG__DSP_BG_BLUE,
>>>>> DRM_ARGB64_GETB(bgcolor) >> 6);
>>>>
>>>>
>>>> the bit31 of  RK3568_VP_DSP_BG  is bg_display_en， that means when we set a
>>>> background color, we should set this bg_display_en bit.
>>
>> I performed several tests on my ROCK 3A (RK3568), ROCK 4D (RK3576) and ROCK
>> 5B (RK3588) boards and noticed that by setting bg_display_en bit to 1 or 0
>> doesn't have any influence on RK3568 and RK3576, the background color is
>> always active and cannot be disabled.
>>
>> However, flipping the bit to 1 on RK3588 has the unexpected effect of
>> covering the whole screen with the configured color, even when there's an
>> active plane displayed on top. Switching back to 0 makes it work as expected.
>>
>> Therefore I think we should keep this patch as is, unless there's something
>> else we're missing here.
>>
>>>> The default value of this bit is 1, which explains why the patch currently
>>>> works properly even though it doesn't set bit31.
>>>
>>> For some reason, the RK3588 TRM indicates 0x0 for the reset value.  I assume
>>> that's a mistake, as RK3576 TRM shows 0x1.
>>
>> Considering the observation above, it kinda makes sense now for RK3588 to
>> default to 0.
> 
>    I further confirmed with our IC team: for RK3588, RK3528, and RK3562, if
>    the display_enbit is set, the background color will indeed cover all
>    layers. For other chips, this bit has no effect. So ACK

Thanks for clarifying!  

This patch is the only one in the series missing a review, hence could you
please provide your R-b (or A-b) tag on the last revision [1]? 

Regards,
Cristian

[1] https://lore.kernel.org/all/20260204-rk3588-bgcolor-v7-4-78d1d01c5ca1@collabora.com/

