Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E29C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 14:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mVgBuvwlTjig0oSmPB6BQKFdvM38TG/M7XXOVQoAWGo=; b=JFNxIXEj0jn4V+njbLt9WoFOhf
	K+8hXzJzHnyo4dcVLX4u/aGn2OvVWhBFc9s9fKgc46OqFp1nCgbxzhKC9nzdpGh5nH3uXa0YQIbSu
	6xHsIa8hxXt1IVcZflMoc4/UL8P3NJjR0b5kSgRpdhmcAOBFXbsHDgxNnrHT1oNCTyv4ZAT3q5T1d
	BFmV2JuBixs0yfc2+h2DaaQ1rRg4Ow/W9N7Hp77FjCLyHmcJAR3IyvHzAyXlp1XSHv8yH8Qh4i9r1
	it9UB2tl/jmdXiL0FVmIPlGwmpjAJ4xqcRrDJUlDiaBGp3km945KQkNXxXFo+m5XMUR4UBjfIVcO2
	v+l32FOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx5H7-00000006CHt-3Urj;
	Tue, 25 Mar 2025 14:29:05 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx5FP-00000006CB4-0t0L
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 14:27:20 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BB247102EBA49;
	Tue, 25 Mar 2025 15:27:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1742912836; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=mVgBuvwlTjig0oSmPB6BQKFdvM38TG/M7XXOVQoAWGo=;
	b=h8mxzJOUJNe4zDuFBuk4WSVlR1MP4YPHN94AvvdVP8/HeTviSAij+0yoyOlAiTqC1PZd+1
	DYMXeaNmqBrD+Bofx4bbFOjfLiKkkqMUY8aM/crN9XyBiZN+62LmcRvDdajK5zDPDU80vT
	L8fgD0eajwg4l66xHAyIK3DR413TwDeMZXixGQfXruUpaVUAyNQXrmtV3u71JnmUJYeTZ4
	W/61WRvMhOHEgeXsoo4BeeFl2gAmduhB/eSKxZr/7q9nokMBqVaYnBrqSiZUBCCQ6zN4+8
	nxA3IJEAz5BcZ1wu42KB2Ls7BFnRB2PO2iZ43hjimhge5T2UbRgWYsIhcETcIA==
Message-ID: <7233d56f-d07d-46c3-9954-57eb583a36ac@denx.de>
Date: Tue, 25 Mar 2025 15:27:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] drm/panthor: Implement optional reset
To: Philipp Zabel <p.zabel@pengutronix.de>,
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sebastian Reichel <sre@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Steven Price <steven.price@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev
References: <20250321200625.132494-1-marex@denx.de>
 <20250321200625.132494-5-marex@denx.de>
 <20250324094333.7afb17a1@collabora.com>
 <22187ae5-7486-416b-b612-53021bfca11e@denx.de>
 <13376dff8d861389464b7ecdb2f82fe211638500.camel@pengutronix.de>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <13376dff8d861389464b7ecdb2f82fe211638500.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_072719_402645_9B56B82B 
X-CRM114-Status: GOOD (  18.66  )
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

On 3/25/25 3:12 PM, Philipp Zabel wrote:
> On Mo, 2025-03-24 at 20:05 +0100, Marek Vasut wrote:
>> On 3/24/25 9:43 AM, Boris Brezillon wrote:
>>
>> [...]
>>
>>>> @@ -563,6 +585,7 @@ int panthor_device_suspend(struct device *dev)
>>>>    
>>>>    	panthor_devfreq_suspend(ptdev);
>>>>    
>>>> +	reset_control_assert(ptdev->resets);
>>>
>>> Hm, that might be the cause of the fast reset issue (which is a fast
>>> resume more than a fast reset BTW): if you re-assert the reset line on
>>> runtime suspend, I guess this causes a full GPU reset, and the MCU ends
>>> up in a state where it needs a slow reset (all data sections reset to
>>> their initial state). Can you try to move the reset_control_[de]assert
>>> to the unplug/init functions?
>> The reset on the MX95 is not really a reset, it is clear-only
>> set-never-again bit which goes only one way, the "unreset" way, so I
>> don't think this has any impact.
> 
> This sounds like the bit is initially set to 1 (reset asserted) and can
> be cleared by writing 0 (once, to deassert the reset). But in the
> reset-simple patch it looks to be the other way around (active_low =
> true)?
> 
> If the reset control can't be asserted again on this hardware, it would
> be better to have custom driver that doesn't implement the .assert()
> callback at all.
Maybe the reset-simple driver can be extended with some mode of 
operation like this instead , to make it skip assert once deasserted , 
for specific reset controllers ?

