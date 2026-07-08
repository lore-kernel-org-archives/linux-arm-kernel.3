Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ADD5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 10:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pzBGdYre102SxzBRBVsSXANIHfowi1woZp/qLsvrIFc=; b=3xNedgfqB6QX9KVExDLTnw7qH6
	wojxmnmFvO8aEkYE2b23eJe4wsUwOdKSry/HWkFjzRGFGYHHdQMbCsF6XpLUswxHOYdhKGQdDB4Rt
	vQ8oxGn/nh5RCadOXRFwndnwQOGYSoZgu6PZO4rP9pI1ulcuJSpWCKckjroU/MBwVRBXXdT8tajUX
	a23LitnCNTQMYyQ6vm5NdoXZPtWE7ZwJcT2jPUpUdr/FIq1e0VeJhSe0JjKHSXdrrZpbiNovTM/Ke
	/REvh9qIVpfn2/+/VGubFwvdw0Hz8VHDLo1FJ9A068py8TQkdg/NpbTPN6qIOYV1jyfSLZqtSDrwG
	NaclchaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPNL-0000000GsDY-3IGW;
	Wed, 08 Jul 2026 10:19:31 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPNJ-0000000GsCc-0czD;
	Wed, 08 Jul 2026 10:19:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783505964;
	bh=t4DOSQvYZTk4aogo+c4G+/9IKm4UAqiMw36o1jDkqKc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=a08YaQTjh/lmoGKJCUBgd5xcipF4vvRTVqpmEgm5tN2tQ8FCVo2rbhVH4cbGrENXd
	 LuEKARrfWMtakQXhdbthmdrUoVfhqwvNRHqT0gmMT8JnL5O0HjKGr8DnVIv/gkCiqV
	 YJU3OjZzhSUaBGvPBZc5LrPo40m5AwLHbY5VS5FwYvNUfsAQ0nfJd1+xpuRlmKSc8I
	 1TlRt8c/FHHZ30ynN+OLRZ4doGvL3DkdAQw/b5H3fKEoDnMz+wnWkjSrOyZaYrcItO
	 qkMtQmrZvQdLbMI8HhoiMi25hvaTQg94FcU1EKJbgexlwCzLwQQsbw/VdPAkV1RClf
	 dQ4gOYNZTG90g==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D83EC17E00F6;
	Wed, 08 Jul 2026 12:19:23 +0200 (CEST)
Message-ID: <dfe104fb-a132-4871-9dc0-52c157a2f08c@collabora.com>
Date: Wed, 8 Jul 2026 13:19:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 03/39] drm/display: bridge_connector: Pass HDMI
 capabilities through caps struct
To: Maxime Ripard <mripard@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
 <20260702-dw-hdmi-qp-scramb-v8-3-d79890d00b6a@collabora.com>
 <eqnr2hfclbdkry2jqe2kuufss5kus6qpjblewq35upnjwlhxhl@4awqxpwrnxk2>
 <f74ffd53-5776-4fae-a6fe-eeace5c3fc5f@collabora.com>
 <20260708-bold-ruby-potoo-c6c949@houat>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20260708-bold-ruby-potoo-c6c949@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_031929_347930_005AA27E 
X-CRM114-Status: GOOD (  13.29  )
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

On 7/8/26 9:46 AM, Maxime Ripard wrote:
> On Fri, Jul 03, 2026 at 10:55:09PM +0300, Cristian Ciocaltea wrote:
>> On 7/3/26 5:19 PM, Dmitry Baryshkov wrote:
>>> On Thu, Jul 02, 2026 at 05:46:16PM +0300, Cristian Ciocaltea wrote:
>>>> Switch drm_bridge_connector_init() to
>>>> drmm_connector_hdmi_init_with_caps(), collecting the bridge's HDMI
>>>> properties into a stack drm_connector_hdmi_caps so future HDMI 2.x
>>>> capabilities can be plumbed without growing the argument list.
>>>>
>>>> Introduce struct drm_bridge::supported_hdmi_ver to let bridges declare
>>>> the HDMI specification version they are conformant with, and forward it
>>>> to the connector layer through the new caps struct so HDMI 2.x features
>>>> can be gated on real source capability rather than guesswork.
>>>
>>> And it's left uninitialized by the bridges, which doesn't mean anything.
>>> If you don't want to touch all bridge drivers in one commit, please
>>> provide some migration path and hopefully get rid of it by the end of
>>> the series. 
>>
>> Sure, one question though: at the end of the migration, would it be fine to
>> stick with drmm_connector_hdmi_init_with_caps() and just drop
>> drmm_connector_hdmi_init()?  Otherwise I'll rename it back.
> 
> Absolutely, it doesn't make any sense to keep both variants.

I was referring to whether option 3 might be the preferred choice in the context
of the earlier patch discussion.

Cristian

