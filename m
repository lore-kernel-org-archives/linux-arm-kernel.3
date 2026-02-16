Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B1E8E81A3A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 15:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZWzPWZxwT6T3Dy9250yQqgOiJzayCf9BdoAZzi1Up9U=; b=T7ChLeNUvCeEjIhi7NlZmZguo3
	Cts6vYj0TQl5UwDSYT0tDtdLlhQZOSdaJtRd6FwlK0zAXNH0SQSLRuBN9ozMPfCe4JxX6aJjHraH6
	iX1++NxD/K+oouGltyZbseIF2kr5QdWXwCV9N/WXQpmnZ8PdX+Um/80Rmblq29ugEYkG6mHI7YMpK
	eJTGTKedqF6QWeRgFIzrnBD/m63TztDI16upxXo+XIRH6xlumDxyLpVGrg+A87bzCmnyom6A5y/8d
	k3Xs8dXF+N3PZN81PVY+rfjJqzMekH6YeAVDqKSnE3Wq1xfoTy16XEq2ArkmWCiqa5f1/eBwyXn+9
	kSHB83nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs0P2-00000006sPb-0ZlJ;
	Mon, 16 Feb 2026 15:20:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs0Oy-00000006sP1-0vl7;
	Mon, 16 Feb 2026 15:20:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 90E5F1570;
	Mon, 16 Feb 2026 07:20:35 -0800 (PST)
Received: from [10.57.56.155] (unknown [10.57.56.155])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9EDB93F632;
	Mon, 16 Feb 2026 07:20:39 -0800 (PST)
Message-ID: <acacf0a5-faff-4036-ac7d-011581668fa8@arm.com>
Date: Mon, 16 Feb 2026 15:20:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] drm/panthor: treat sram as mandatory except mt8196
To: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260215100302.136719-1-work@onurozkan.dev>
 <20260215100302.136719-2-work@onurozkan.dev> <20260216103743.626c71e3@fedora>
 <20260216174107.1b9c03a4@nimda>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20260216174107.1b9c03a4@nimda>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_072044_350598_A39530D6 
X-CRM114-Status: GOOD (  20.96  )
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

On 16/02/2026 14:41, Onur Özkan wrote:
> On Mon, 16 Feb 2026 10:37:43 +0100
> Boris Brezillon <boris.brezillon@collabora.com> wrote:
> 
>> On Sun, 15 Feb 2026 13:02:51 +0300
>> Onur Özkan <work@onurozkan.dev> wrote:
>>
>>> If sram-supply is missing, Panthor falls back to a
>>> dummy regulator with a warning. This implicit behavior
>>> hides missing DT wiring behind regulator core fallback.
>>>
>>> Make SRAM handling explicit: require sram-supply for all
>>> Panthor compatibles except mt8196-mali where GPU supplies
>>> are intentionally managed outside Panthor and DT does not
>>> model sram-supply for that compatible.
>>>
>>> This keeps DT power modeling explicit and avoids relying on
>>> dummy-regulator fallback.
>>>
>>> Link: https://lore.kernel.org/all/20260213155937.6af75786@nimda/
>>> Signed-off-by: Onur Özkan <work@onurozkan.dev>
>>> ---
>>>  drivers/gpu/drm/panthor/panthor_devfreq.c | 13 +++++++++----
>>>  1 file changed, 9 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c
>>> b/drivers/gpu/drm/panthor/panthor_devfreq.c index
>>> 2249b41ca4af..5f6075f18fe3 100644 ---
>>> a/drivers/gpu/drm/panthor/panthor_devfreq.c +++
>>> b/drivers/gpu/drm/panthor/panthor_devfreq.c @@ -206,12 +206,17 @@
>>> int panthor_devfreq_init(struct panthor_device *ptdev)
>>>  	 * But without knowing if it's beneficial or not (in term
>>> of power
>>>  	 * consumption), or how much it slows down the
>>> suspend/resume steps,
>>>  	 * let's just keep regulators enabled for the device
>>> lifetime.
>>> +	 *
>>> +	 * Treat sram-supply as mandatory except for mt8196-mali.
>>> It manages
>>> +	 * SRAM outside Panthor so this driver must not require
>>> direct control
>>> +	 * over it.
>>>  	 */
>>> -	ret = devm_regulator_get_enable_optional(dev, "sram");
>>> -	if (ret && ret != -ENODEV) {
>>> -		if (ret != -EPROBE_DEFER)
>>> +	if (!of_device_is_compatible(dev->of_node,
>>> "mediatek,mt8196-mali")) {
>>
>> Rather than checking for specific compats here, let's go for
>> a dont_need_sram_supply bool in panthor_soc_data.
>>
> 
> Makes sense.
> 
>>> +		ret = devm_regulator_get_enable_optional(dev,
>>> "sram");
>>
>> If we assume SRAM supply is mandatory, should this be
>> devm_regulator_get_enable() instead?
>>
> 
> That was the first thing I did but when I tested it, it didn't work as
> expected because devm_regulator_get_enable() fell back to the dummy
> regulator without returning an error.

My understanding was that devm_regulator_get_enable() would output a
warning in that case.

I'm not sure it really makes sense to deliberately fail the probe just
because the regulator isn't there: we know in practice it often works
and it can be useful for bring-up purposes. The issue was that we don't
want DTs submitted without the "sram" regulator and the dt-check hasn't
been sufficient in the past to catch such errors.

So a dmesg warning seems (to me) like the right sort of balance -
there's obviously something to fix, but it doesn't block bring-up
(unless of course the hardware actually requires it of course).

I also note that you've lost the -EPROBE_DEFER check, meaning that the
log message you've added will spam the logs if a defer happens.

My reading for these threads is that we need:

 * A new field in panthor_soc_data for the mt8196 case.

 * To check for new field, and if it's not set then use
devm_regulator_get_enable() so that it generates a warning message if
the regulator isn't present. Otherwise we skip the call.

So no need for panthor itself to log any messages, and we just return
any errors from devm_regulator_get_enable(). A missing regulator will
generate a warning but no error.

What am I missing?

Thanks,
Steve

> Regards,
> Onur
>  
>>> +		if (ret) {
>>>  			DRM_DEV_ERROR(dev, "Couldn't
>>> retrieve/enable sram supply\n");
>>> -		return ret;
>>> +			return ret;
>>> +		}
>>>  	}
>>>  
>>>  	opp = devfreq_recommended_opp(dev, &cur_freq, 0);
>>
> 


