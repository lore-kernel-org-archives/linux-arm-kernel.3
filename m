Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9091CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 19:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AIKfRBAjkq4MCd8D+gkX2LCb/4tsenWcayR30SDin1I=; b=nta59AQwC/wRUwdVxKY6vfxbum
	3IO+Tr4rzClzQlwzXzbWPmwQ2Ux4xftdUSoXAePkhh/+1FO06WpKrVZsjGttQFYc8KpLP0tO00pa3
	FTYu3F7q8M/M4qxoWx46BhcKvxan8XDiVYddm6Ln9q+RRY0gLQr/cec1kH8T0gVU5pBfSvt8oOnRw
	hiAY00TYMJW0b0CfV0/zRaCBsl5nSIK0zknAQJjjmyz57yAcjElEw1usfhK2NCSN/DlfeyVuZERP+
	PlCLz0zEV1hCMpTy2GZWglNf2MdRADVBXuXtpfYfq6aHkrFDhz5tTWmfEXA8oyXXpArQN91rHf0xb
	P1PImR6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whuNk-00000003Shd-3yH5;
	Thu, 09 Jul 2026 19:26:00 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whuNi-00000003Sh0-0c7c;
	Thu, 09 Jul 2026 19:25:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783625155;
	bh=379VPeZ7FJzRIPM44QI1fIbrI6BdI/1sSIoGX7SU7uo=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=NDtsAi6SFCzsfusBVFEaLQNXauQq2QA860cF7SdgYg6CQFvJCjh3Pb61sHTlHGAk+
	 iUQ9COCxg0dEhW22QH8SfKyNEMq297wq2UoqbXgOB4ZO0TY8adghP2LEzM3xBunKzr
	 Z7QWy1FosslOf5ZOClGxaNhftc4hnlP8unMaT3uy7/+BC68Ro6ES8YnEkPuPogyRX8
	 bFqq0uByFNvoOdISf2mmFTEKDnCMXU7NT4lKXHN/bEUQy2CcTqeeHiz3NzxXw2T2/l
	 nXUOYUlnvj3IpQYUemYOeE3vdu+QLHC2VEK2hRE6juQMwMFc3NfQmy94jsV04f2cZK
	 xi6Yb5JjA4qVQ==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ADB5F17E0177;
	Thu, 09 Jul 2026 21:25:54 +0200 (CEST)
Message-ID: <534b921c-638c-4fc3-b89e-5dfc1f269f96@collabora.com>
Date: Thu, 9 Jul 2026 22:25:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 04/39] drm/connector: Add HDMI 2.0 scrambler
 infrastructure
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
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
 <20260702-dw-hdmi-qp-scramb-v8-4-d79890d00b6a@collabora.com>
 <tjsidlnvswo2rdhqa6jybxrnb47lxgmxdlfrfbasuh67wjbqoy@3a45n3zawvnf>
 <17753a1c-824a-4835-ac2d-8b2796bba1eb@collabora.com>
Content-Language: en-US
In-Reply-To: <17753a1c-824a-4835-ac2d-8b2796bba1eb@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_122558_385920_26ED4491 
X-CRM114-Status: GOOD (  13.76  )
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

On 7/3/26 11:54 PM, Cristian Ciocaltea wrote:
> On 7/3/26 5:34 PM, Dmitry Baryshkov wrote:
>> On Thu, Jul 02, 2026 at 05:46:17PM +0300, Cristian Ciocaltea wrote:
>>> Add the connector-level infrastructure to support HDMI 2.0 scrambling:
>>>
>>> - A scrambler_supported flag to indicate whether the source supports the
>>>   scrambling capability, in which case the newly introduced
>>>   .scrambler_{enable|disable}() callbacks in drm_connector_hdmi_funcs
>>>   are mandatory
>>
>> Do we need a flag? What would it mean if the flag is set, but the
>> callbacks are not? Can we drop the flag and use the presence of the
>> callbacks as a way to identify that scrambler is enabled?
> 
> The flag is intended to be set only within drmm_connector_hdmi_init_with_caps()
> when drivers advertise HDMI 2.x capability, in which case it also ensures the
> callbacks are provided.  
> 
> We could drop the flag and instead have the init helper clear the callbacks if
> they were provided for HDMI 1.x.  This might slightly reduce code readability,
> as it relies on checking the presence of individual callbacks - especially since
> we plan to extend this further with HDMI 2.1 support, providing four or five
> additional FRL-specific callbacks.

I tried to replace the flag with a helper that checks the presence of (one of)
the callbacks, but it's not straightforward to unset those for non-HDMI 2.x
cases since the hdmi_funcs argument is immutable.

Also, rejecting that use case is less than ideal, since we would restrict
reusing the struct instance, e.g. to support HW revisions with varying
scrambling capabilities.

Therefore, I'd keep the flag for now.

Cristian

