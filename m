Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C58FCD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 01:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2oWK8M0wntpnRjBz1cfwtxi/O7HmJFLfA78GqbD2mB0=; b=QhTaPb4s6Zv6zd6ibLIqeN7bqs
	BtiCBbdXgsbgvcjN4NqFQSbUarJdGsmaRG19gF3vsd284yCDmVjAN1HFFfRI5DXqEAZZmpKa2NqGZ
	Ywy9zdqwZmMEUZnJvCLk/b+a4dm1cEq8mKwXBi72EgP7uIW4E43ovIyQOsCuXskFU+PUqFhLFzFQU
	K39BC/+DC+O0RrefeFQMfKRLwnMz0MZprkGfs57gXB0zktBY0bENIyKs/zL9My5PQPCjWBzgT3nEl
	G5q8ugiOGQt9OPz9YkFKFKik4lCLf9i4wBVjkztr8zHJ/vwOpw7nuJSs56aL1s1l/kayBleivcrMU
	Ak6bzDJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYDCN-0000000BtP8-3KsM;
	Sat, 13 Jun 2026 01:30:11 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYDCK-0000000BtOb-3ZNN;
	Sat, 13 Jun 2026 01:30:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781314204;
	bh=A0Fhtf7gjqLJuhoBRBiXhWj0GB7XnVMNfK4IpemDFWI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oRtcAJW/8KbnGXk89e/jzIq16DQOsRVAid2oW1M2rMIgNizldVcQu7EEkMJg6vaGH
	 nBqkwPrnVMBUP2SEpHcJrqfX4J1PDNQYzA9i9nFfuEzjDK2oxpsX3peMPkaVLysDfs
	 zl9FHuMbw5RBTkiMKYDsQHotRUDWzftvaPWIPEGiariaCMOe38XdWUAh5yPdZYsXsg
	 Xr5wimHa+J1VX/GbE3AG6a4ZiUxLOZZisillPJIBZk4vyij0qsvnTIrEKETWCI1o1T
	 K9RWaETDo4JbpKzY6C+PxOBdD0Q9bKQVmgP9pEX93QPDmnHFVEcbIytSpWWnr9Zj/H
	 U5XoBLBqVU7oA==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 30ABF17E03C6;
	Sat, 13 Jun 2026 03:30:03 +0200 (CEST)
Message-ID: <2f5ce8eb-ef47-4238-ad68-ce62981a1845@collabora.com>
Date: Sat, 13 Jun 2026 04:30:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/30] drm/display: scdc_helper: Add HDMI 2.0
 scrambling management helpers
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
References: <20260602-dw-hdmi-qp-scramb-v7-0-445eb54ee1ed@collabora.com>
 <20260602-dw-hdmi-qp-scramb-v7-4-445eb54ee1ed@collabora.com>
 <20260612-cordial-steadfast-cow-fcaf01@houat>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20260612-cordial-steadfast-cow-fcaf01@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_183009_060958_15D62E79 
X-CRM114-Status: GOOD (  19.52  )
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

On 6/12/26 4:43 PM, Maxime Ripard wrote:
> On Tue, Jun 02, 2026 at 01:44:04AM +0300, Cristian Ciocaltea wrote:
>> +/**
>> + * drm_scdc_start_scrambling - activate scrambling and monitor SCDC status
>> + * @connector: connector
>> + *
>> + * Enables scrambling and high TMDS clock ratio on both source and sink sides.
>> + * Additionally, use a delayed work item to monitor the scrambling status on
>> + * the sink side and retry the operation, as some displays refuse to set the
>> + * scrambling bit right away.
>> + *
>> + * Returns:
>> + * Zero if scrambling is set successfully, an error code otherwise.
>> + */
>> +int drm_scdc_start_scrambling(struct drm_connector *connector)
>> +{
>> +	struct drm_display_info *info = &connector->display_info;
>> +	struct drm_connector_hdmi *hdmi = &connector->hdmi;
>> +	int ret;
>> +	u8 ver;
>> +
>> +	if (!hdmi->scrambler_supported) {
>> +		drm_scdc_dbg(connector, "Scrambler not supported, bailing.\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (!info->is_hdmi ||
>> +	    !info->hdmi.scdc.supported ||
>> +	    !info->hdmi.scdc.scrambling.supported) {
>> +		drm_scdc_dbg(connector, "Sink doesn't support scrambling.\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	drm_scdc_dbg(connector, "Enabling scrambling\n");
>> +
>> +	ret = drm_scdc_readb(connector->ddc, SCDC_SINK_VERSION, &ver);
>> +	if (ret) {
>> +		drm_scdc_dbg(connector, "Failed to read SCDC_SINK_VERSION: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = drm_scdc_writeb(connector->ddc, SCDC_SOURCE_VERSION,
>> +			      min_t(u8, ver, SCDC_MAX_SOURCE_VERSION));
>> +	if (ret) {
>> +		drm_scdc_dbg(connector, "Failed to write SCDC_SOURCE_VERSION: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	hdmi->scdc_cb = drm_scdc_monitor_scrambler;
>> +	WRITE_ONCE(hdmi->scrambler_enabled, true);
>> +
>> +	ret = drm_scdc_try_scrambling_setup(connector);
>> +	if (!ret)
>> +		ret = hdmi->funcs->scrambler_enable(connector);
>> +
>> +	if (ret) {
>> +		WRITE_ONCE(hdmi->scrambler_enabled, false);
>> +		cancel_delayed_work_sync(&hdmi->scdc_work);
>> +		hdmi->scdc_cb = NULL;
>> +
>> +		drm_scdc_set_scrambling(connector, false);
>> +		drm_scdc_set_high_tmds_clock_ratio(connector, false);
>> +	}
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL(drm_scdc_start_scrambling);
> 
> This is also pretty significantly different than what vc4 implemented. I
> don't necessarily mind, but claiming that it's functionally equivalent
> isn't true. I think it would be a much better strategy to turn the vc4
> code into helpers as is because it's been merged 4 years ago and we know
> it's solid.

As explained in patch 25, I think there's been a slight misunderstanding of how
the CRTC reset logic was actually implemented.

> Then, if you want to add additional checks and constraints (like the
> SCDC_SINK_VERSION) that's fine, but it should come on top, and with its
> own explanation.

I'll recheck if there's anything that I might have missed from the original
implementation, while moving the additional changes to separate patch(es).

Thanks,
Cristian

