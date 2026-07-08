Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B62C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 10:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jg71Yd7tgNPuzfuRQuzaDcmvLXEgrpTxuBWJKiWgB3s=; b=ed1nTURbwAjtybpnhD7FrPPnJ5
	I8yrZT0FMT4DH05NClzYserCTwERLH22ar/ksZnvkAVS6phVS+ee6s548MJm8j9MFHJUQwJTDvRli
	bxM2PMULc6ZUcP1lEJ8TCGJliTNnc15yQy7awJuarkVMpJqBVMsyVyhiiXwyCC3ErkPbDe/HXoY3X
	tiMf+8j8NWtQvVigH/RZZ66AFGsKX/59jcnNKLyAk4OYAa+vdW3q9ySJRjYqbxB7Hs3gXStv8XyLG
	aLWXx+RfifFPIg7YP17XdUG37MuG3lA9kjWQtowbOQM3zZPqaldfi4Q0PVM0EMKtdNtkcjoz/xUVk
	1+0UsUYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPgP-0000000GvTi-08QA;
	Wed, 08 Jul 2026 10:39:13 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPgM-0000000GvSl-3kYq;
	Wed, 08 Jul 2026 10:39:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783507148;
	bh=iwFN7k1l7x6sZkU0ZQcIM16C6PmtP6fEROcDVf8SnW8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=c7219e4rWLH+NttiNekbwSuQ/urAUx9f7qHZWqWQ7lsm7kC/ZXj54eakGLwu6gPbB
	 VIUX2fhwzzbK3xtqcH+hlfX4q+HYzLwZGYsFSQA6J+tcvYAedUDIzPr4q6N3O5OTTk
	 ZEyuHF2rg7PKwJ/PLY2m1gvjg3vruEOHX7lpta7MIqqn9XIa58zeob2rv+6lh7dSgr
	 SnZQQqyo9iHjNupsSDLsZfQGgIry09xpJ79KehJI9WoaaWGJqQQP+/k4HkYU2Bzb6r
	 3ySGC0lMVr5rX0iZnZAy1TxVbbOmzsmZIsxItdx147A+51rDaG7SkGMFujqsHxUtzw
	 sRhpSAH+k7hJw==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9200417E00F6;
	Wed, 08 Jul 2026 12:39:07 +0200 (CEST)
Message-ID: <31117c25-5410-429a-887b-87c767387c58@collabora.com>
Date: Wed, 8 Jul 2026 13:39:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 09/39] drm/display: hdmi-state-helper: Add fallback
 TMDS rate validation
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Daniel Stone <daniels@collabora.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20260702-dw-hdmi-qp-scramb-v8-0-d79890d00b6a@collabora.com>
 <20260702-dw-hdmi-qp-scramb-v8-9-d79890d00b6a@collabora.com>
 <20260707-venomous-helpful-magpie-b2962b@penduick>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20260707-venomous-helpful-magpie-b2962b@penduick>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_033911_093013_684DC628 
X-CRM114-Status: GOOD (  17.57  )
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

On 7/7/26 2:23 PM, Maxime Ripard wrote:
> Hi,
> 
> On Thu, Jul 02, 2026 at 05:46:22PM +0300, Cristian Ciocaltea wrote:
>> Validate the computed TMDS character rate against
>> connector->hdmi.max_tmds_char_rate when no driver-specific
>> tmds_char_rate_valid() hook is provided.
>>
>> This gives HDMI connectors a common fallback for rejecting modes whose
>> TMDS character rate exceeds the connector limit, while still allowing
>> drivers with custom validation requirements to implement their own
>> tmds_char_rate_valid() callback.
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
>> index ce17eeefc2da..db76699093e8 100644
>> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
>> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
>> @@ -566,6 +566,9 @@ hdmi_clock_valid(const struct drm_connector *connector,
>>  		status = funcs->tmds_char_rate_valid(connector, mode, clock);
>>  		if (status != MODE_OK)
>>  			return status;
>> +	} else if (connector->hdmi.max_tmds_char_rate) {
>> +		if (clock > connector->hdmi.max_tmds_char_rate)
>> +			return MODE_CLOCK_HIGH;
> 
> I think we should handle this the same way we do for
> info->max_tmds_clock: if it's set, we always check that before calling
> the driver.
> 
> It reduces the boilerplate in drivers, and it's always a relevant check
> anyway.
Ack.

Thanks,
Cristian

