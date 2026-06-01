Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E567ECD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 16:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f5grpTLjdLEKgMKQnQs2cBqM6Bai6N+nsrE/JCwOT0s=; b=zFSTzDgEQCnOJxpW+BHpX6z3Hu
	ILxdQDPbgiiTA1bPKyUIg+057DbJRzNyaGJF7YCkIEMHok7V2NnhFw0maSN6DN4/d5c/Xgb8A2FJE
	ssEuJun5g5jSSeF/BjL6U9gjeQXwuAF5ot17X1NGInqaCivjKc+QhiBA97IuVK4XjAG9/FIb/B+8d
	i/7ysKrEJSq5Uguqof1WUdptmSKY4++QoPe5wkRhesAkkwelEaOPoIg2+uLWlgnHCrWlvVqIaUJmj
	deMGtX+q5n0YPX8e+EXNnDUt+fUpEN+6Bc1pjsJVVVE+M1kwQaTNVLZLRcr+n4WdgBrsrFhovLapd
	Ezixjw2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU5W9-0000000BUNW-0b8R;
	Mon, 01 Jun 2026 16:29:33 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU5W6-0000000BUMm-1sPW;
	Mon, 01 Jun 2026 16:29:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1780331365;
	bh=PZdBZiNLVlObz9gIrGHHxQf6Y+iC4DcySdXN9+n6CRY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pr5OgAn/UEt4PWmI+wiOEBwRWMriWCL5/bihJWujDGLVriMS6CRzxjKXj1mPcqvfC
	 r6kznu2r94sxfHvK5P1s0vyaqKbCLtrMv1mkPAsfY4y9MzX/5S77dljyhQ9Eo/g+Ai
	 yBy3TgxWm0zkFhXgWmvrFvnb/0e2M6jhYVzARpEoHO5hB9JbT72mFx6wmy1dpReWXI
	 6igJBLRgPj0Scx2BRxGMQx0QOnFA1KmSkW0ZCHnLCtuU/YeQJZbQQv99hiyQdsrB4g
	 1zBhW1L8CCKyThvLEJrVTQ5ZZQfzUCAcsTGsK/7aCLwl9lgtvxySDGoNcDSoFEeq4y
	 ga3CnwA0Dut3A==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C139317E03A6;
	Mon,  1 Jun 2026 18:29:24 +0200 (CEST)
Message-ID: <b0fc7c12-51e3-4bb7-9ed7-fda1a30d4e9d@collabora.com>
Date: Mon, 1 Jun 2026 19:29:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/10] drm/bridge: dw-hdmi-qp: Add HDMI 2.0 SCDC
 scrambling and high TMDS clock ratio support
To: Andy Yan <andy.yan@rock-chips.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 Diederik de Haas <diederik@cknow-tech.com>,
 Maud Spierings <maud_spierings@hotmail.com>
References: <20260426-dw-hdmi-qp-scramb-v5-0-d778e70c317b@collabora.com>
 <20260426-dw-hdmi-qp-scramb-v5-5-d778e70c317b@collabora.com>
 <9a7855a7-6b0c-4aa2-8516-13d94beabac6@rock-chips.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <9a7855a7-6b0c-4aa2-8516-13d94beabac6@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_092930_735425_4E57ECDC 
X-CRM114-Status: GOOD (  15.23  )
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

On 6/1/26 7:06 AM, Andy Yan wrote:
> Hello,
> 
> On 4/26/26 08:20, Cristian Ciocaltea wrote:
>> Enable HDMI 2.0 display modes (e.g. 4K@60Hz) by adding SCDC management
>> for the high TMDS clock ratio and scrambling, required when the TMDS
>> character rate exceeds the 340 MHz HDMI 1.4b limit.
>>
>> A periodic work item monitors the sink's scrambling status to recover
>> from sink-side resets.  On hotplug detect, if SCDC scrambling state is
>> out of sync with the driver, trigger a CRTC reset to re-establish the
>> link.
>>
>> Reject modes requiring TMDS rates above 600 MHz, as those fall in the
>> HDMI 2.1 FRL domain which is not supported. In no_hpd configurations,
>> further restrict to 340 MHz since SCDC requires a connected sink.
>>
>> Tested-by: Diederik de Haas <diederik@cknow-tech.com>
>> Tested-by: Maud Spierings <maud_spierings@hotmail.com>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>   drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 188 ++++++++++++++++++++++++---
>>   1 file changed, 172 insertions(+), 16 deletions(-)

[...]

>>   }
>>     static const struct drm_edid *
>> @@ -832,12 +986,12 @@ dw_hdmi_qp_bridge_tmds_char_rate_valid(const struct drm_bridge *bridge,
>>   {
>>       struct dw_hdmi_qp *hdmi = bridge->driver_private;
>>   -    /*
>> -     * TODO: when hdmi->no_hpd is 1 we must not support modes that
>> -     * require scrambling, including every mode with a clock above
>> -     * HDMI14_MAX_TMDSCLK.
>> -     */
>> -    if (rate > HDMI14_MAX_TMDSCLK) {
> 
> The locally defined HDMI14_MAX_TMDSCLK has been removed, we should now use
> HDMI_1_3_CHAR_RATE_MAX, and I think we should apply the same change to
> HDMI20_MAX_TMDSRATE

Yep, already addressed in my local dev branch.  Please note this revision is
obsolete, there's already v6 available and I'm going to submit v7 a bit later
today.

Thanks,
Cristian

