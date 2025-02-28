Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D7F0C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 18:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ebfjXjv+bqlFowxWgcxVBRPIFf+y2ZFstbhRFYQ+B3o=; b=2r1YmKoZpS/YV7Cz2QGUs856dR
	FOxyQO1IDBGeoebVOCCXGZTKAbJ+iVVaQ7O2ZSnBSc3aeUWUuQ/Ach8uW8iZCGMFS5WbGzFgr1CkV
	JrL7J/XetYS1XkLcRi9J97Jraa6VXdcHLz1K1ipA7+IYb73HVsxmQxyO0JBhB99BYiNk4DZLSl9m+
	OWBWaMtlVw61xFTPG6hayApScOon23gQOhbJYmAWVCHuzJSWHcE6uj/bdgLaxfTorZ4hlBu17+NBA
	tyM0sxT+C7pdvv/u/f8y3APWPD7ntRwMnh8JejQO10koRkHXHgUUAU1+eDPQgqYXvDz1KkdLxGqGw
	w90gDbMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to5Do-0000000CBCb-25sb;
	Fri, 28 Feb 2025 18:36:28 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to54n-0000000C8Ef-2sjH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 18:27:10 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B356E102901CB;
	Fri, 28 Feb 2025 19:27:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1740767226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ebfjXjv+bqlFowxWgcxVBRPIFf+y2ZFstbhRFYQ+B3o=;
	b=SMx0uDl2Mwn6/zecOEx6MQdyi0SH0kKNxIGNAfTZlFCp+iLnWFeP8mL1NQbqE9vBcwy/EA
	c59tK9X19cLR6C01stMKronJmlaTYccJe2s7OGzf3Bhfav4cncfDu2e9Sw65+JFdilJ11n
	j6HQT+DQYgi6QAFzpneNjPd1sFp/T9opiQZVYH4nXnvAMrcoUhzazc8HDqxYfJJry0Ujxw
	W4yHOYyE7zde/azlb7UohiwEy7thG/Ofuf+xYNWbzUDCgdyTZTvEVT9sm4WwJDYhoaCcbE
	GlgEtgDW2NFaNm97s7/KNeyle8S7FGEZxa/sJbSoBYve3u9mbM5AeK2jh4h/Uw==
Message-ID: <b0bfbb84-a3a8-403a-ad5a-95ebcd1eb00f@denx.de>
Date: Fri, 28 Feb 2025 17:48:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] drm/panthor: Implement optional reset
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, devicetree@vger.kernel.org, imx@lists.linux.dev
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-5-marex@denx.de> <2180166.OBFZWjSADL@steina-w>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <2180166.OBFZWjSADL@steina-w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_102709_891281_96C32383 
X-CRM114-Status: GOOD (  14.12  )
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

On 2/28/25 11:06 AM, Alexander Stein wrote:

Hi,

>> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
>> index a9da1d1eeb707..51ee9cae94504 100644
>> --- a/drivers/gpu/drm/panthor/panthor_device.c
>> +++ b/drivers/gpu/drm/panthor/panthor_device.c
>> @@ -64,6 +64,17 @@ static int panthor_clk_init(struct panthor_device *ptdev)
>>   	return 0;
>>   }
>>   
>> +static int panthor_reset_init(struct panthor_device *ptdev)
>> +{
>> +	ptdev->resets = devm_reset_control_get_optional_exclusive_deasserted(ptdev->base.dev, NULL);
> 
> If the description as a write-once register is true, wouldn't this
> already write to it?

It would. I believe the reset handling in the GPU driver should be 
generic. The reset has to be deasserted here to access the GPU registers.

The question is, whether the GPUMIX GPURESET bit should be modeled as 
simple reset, even if it really behaves as a 
set-and-never-can-be-cleared latched bit.

>> +	if (IS_ERR(ptdev->resets))
>> +		return dev_err_probe(ptdev->base.dev,
>> +				     PTR_ERR(ptdev->resets),
>> +				     "get reset failed");
>> +
>> +	return 0;
>> +}
>> +
>>   void panthor_device_unplug(struct panthor_device *ptdev)
>>   {
>>   	/* This function can be called from two different path: the reset work
>> @@ -217,6 +228,10 @@ int panthor_device_init(struct panthor_device *ptdev)
>>   	if (ret)
>>   		return ret;
>>   
>> +	ret = panthor_reset_init(ptdev);
>> +	if (ret)
>> +		return ret;
>> +
>>   	ret = panthor_devfreq_init(ptdev);
>>   	if (ret)
>>   		return ret;
>> @@ -470,6 +485,10 @@ int panthor_device_resume(struct device *dev)
>>   	if (ret)
>>   		goto err_disable_stacks_clk;
>>   
>> +	ret = reset_control_deassert(ptdev->resets);
>> +	if (ret)
>> +		goto err_disable_coregroup_clk;
>> +
> 
> This wouldn't work at all on a write-once register, no? Same for resume.
See above and also my reply to 2/9 .

