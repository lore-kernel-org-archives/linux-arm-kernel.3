Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E8AAC197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z4OqO0DlmHTyAuXAgYbGzIkXg36xy2WA6u8k/uPoPPA=; b=iHbRxG3CLyVHxELk+LiTfs0dCv
	JSnPI4GjnyXI5eM4OfXhqdptYg9RAIdKfMtbh4kqqS07P09vdG4/HALaGM184r0m6n4Zwxkby7E1x
	Xq+qkbC5brgt/zvn+vj83UAwWyJzUw81yrvaWokMvO1w/sVddu2i3sH1uvPFll7x8RTHSAwg1MTG3
	LgqYpBt6SfbOE+fQCsaJeBU2CUmokAmgZZbPvAuNtwEFulw8Zek2OiLYB83T/a7+JjFtX+PUwP44R
	cmKNsL0AJJzARFmoSXt4P5W1ql/BtUJdyRhQgeORXx2dOIEOmEE0tPpxU4y6GkcSLvW9lDyY9bwo8
	2zbHhl+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjky-00000008at8-1WWv;
	Thu, 27 Feb 2025 19:41:16 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnheO-00000008Cse-3JIa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 17:26:22 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B722510382F24;
	Thu, 27 Feb 2025 18:26:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1740677178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z4OqO0DlmHTyAuXAgYbGzIkXg36xy2WA6u8k/uPoPPA=;
	b=I52RF/4RmJii3MfN1/Z74h9+4oa9hwjgxOCPH+oHDZwj4E3b6qEDxXRqbxa3A2GutMSz8n
	e8pIozchEVC9K2kZKq13KKYtSmYYsXuA8t4yBFhQ+XfVYVJ/TZHobjR1HIis418UoIV8dQ
	iR7Lz9ep20PlsCmzbPxEZd5J0FzLQSHo5f4sF8whxei2m6WiAgUoH/eLFzfHD/mNuVstvs
	drAsgJd5vut8VFuOo0wAP663gFSltxq+xcAK2wOR/n7CoHaSmAHjFAUte5ljno2pvTp5op
	+AC4aFkDRUlXO1mPjEoMS5GWeBaQcbNtVOBzY5PAW4WRrItNNjkTN10FKmziwA==
Message-ID: <601055ff-6a19-4d89-b4ae-fb437d3f1670@denx.de>
Date: Thu, 27 Feb 2025 18:26:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 6/9] drm/panthor: Reset GPU after L2 cache power off
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-7-marex@denx.de>
 <20250227181748.3f99d67e@collabora.com>
Content-Language: en-US
In-Reply-To: <20250227181748.3f99d67e@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_092620_979552_B7C8146F 
X-CRM114-Status: GOOD (  15.81  )
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

On 2/27/25 6:17 PM, Boris Brezillon wrote:

[...]

>> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
>> index 671049020afaa..0f07ef7d9aea7 100644
>> --- a/drivers/gpu/drm/panthor/panthor_gpu.c
>> +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
>> @@ -470,11 +470,12 @@ int panthor_gpu_soft_reset(struct panthor_device *ptdev)
>>    */
>>   void panthor_gpu_suspend(struct panthor_device *ptdev)
>>   {
>> -	/* On a fast reset, simply power down the L2. */
>> -	if (!ptdev->reset.fast)
>> -		panthor_gpu_soft_reset(ptdev);
>> -	else
>> -		panthor_gpu_power_off(ptdev, L2, 1, 20000);
>> +	/*
>> +	 * Power off the L2 and soft reset the GPU, that makes
>> +	 * iMX95 Mali G310 resume without firmware boot timeout.
>> +	 */
>> +	panthor_gpu_power_off(ptdev, L2, 1, 20000);
>> +	panthor_gpu_soft_reset(ptdev);
> 
> Unfortunately, if you do that unconditionally we no longer have a
> fast-reset. Would be good to figure out why the fast-reset doesn't work
> on this platform.

I was hoping to get some hint on this one, I spent quite a while trying 
to narrow this down, finally got it down to this particular bit.

The NXP downstream vendor kernel vendor Mali driver does not seem to 
have anything interesting regarding the L2 power handling, but I might 
have missed it, the code is difficult to read.

Have you ever seen anything problematic in this specific L2 department ?

Do you have any hints how I can debug this further ?

