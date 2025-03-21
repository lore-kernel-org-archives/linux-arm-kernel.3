Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7514CC36007
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 20:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=drWgqDtEwtRQ/AqNec+865/QoSBEzToGMlvzXdRpbRc=; b=Vxm/yXKXCBo6xpqLZOMleI8lpZ
	WYl70MJtvhKAp8dnFQKOSNUIBXr1uIXAcs3OyatLCgmCglHPRWKGI6V5KVPwgZ76fuK1eIT/QolNr
	0q0nD64vQwApozlcm/DoDRo01RBzFrqvzdIhwL2Vgsryws12MOvPdXDDdrkjADXvf04iPojkVqaqG
	ZS79T/aWYF0PxjI0udZ2XHwtxh5nhsYqz9KA4Sn+4pq7GSjcpLucy/KUHD1PJ6fyMYotLEeQ7Q/HB
	H9tB14R4AWsxkfhnj8Mhzc5g4D/JikUaZndZ1d8XpnKOfI5Y30LDenOxhhYReBJEBZoUTcn5qf6qJ
	K3fDsN7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tviyx-0000000GAIL-1uPY;
	Fri, 21 Mar 2025 20:28:43 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tviZR-0000000G6qX-0srI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 20:02:22 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 635FF101E8FE9;
	Fri, 21 Mar 2025 21:02:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1742587339; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=drWgqDtEwtRQ/AqNec+865/QoSBEzToGMlvzXdRpbRc=;
	b=UAPj7u9D99BzWdmrqugwwfMF1kOr649TjzIBIrq4luHu3EKIxBSYIlVak1XBT5eZi8IlIx
	WH8Lb6E04i0EDXTUyFMYBabrxds3rJoJtAgSWLBRbbFg1/qhgZztdq2LGVCXJBvbyq+wc3
	KCVQSBu2VkznmY8lFrQcOqkpiG86I7rhBwo/QO2z86gNO5Q+jqWpP+GH2Zkr1wAGUnmEu3
	S9rvJQSGNl/aRqgtlG67xsnIuhxEIt5cFLHpccdkvSHaWRMeymOyJtuNiE0rhWoJytV8Jo
	4GAR5ZO7/E7pOVsavK64sbJ4OFsnVYm/NtqDV/yWRBm3yMYvCUFpfBCvDKZ+QQ==
Message-ID: <12a0c285-8f1a-4014-9253-0129a3a6ba21@denx.de>
Date: Fri, 21 Mar 2025 21:00:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] drm/panthor: Reset GPU after L2 cache power off
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
 <Z8GY0nWXOxCKF-XL@e110455-lin.cambridge.arm.com>
 <fa88c1c1-89ba-4a10-bd57-0819d7740c0a@denx.de>
 <Z8Wb05rmGW0ORnJB@e110455-lin.cambridge.arm.com>
 <20250303133523.2c5153ed@collabora.com>
 <20250303134250.5ba726fc@collabora.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20250303134250.5ba726fc@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_130221_394813_6A904604 
X-CRM114-Status: GOOD (  13.66  )
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

On 3/3/25 1:42 PM, Boris Brezillon wrote:

Hi,

>>> This looks like it has been part of a R50 release of the DDK, which is recent
>>> enough to consider it up-to-date. The issues you're seeing with fast resume are
>>> probably due to some integration issues or other quirks.
>>>
>>> Boris has the most recent experience with playing with fast resume, maybe
>>> he can share some tips on where to add messages in Panthor to try to debug
>>> your problem.
>>
>> If you end up with fast_reset=true, that means the FW claims it entered
>> a suspend state from which is can resume quickly (fast-reset), and in
>> that case, we're only supposed to power on the L2 block at resume time
>> AFAIK.
> 
> Can you try deasserting the reset lines at probe time and keeping them
> deasserted until the device is removed instead of re-asserting at
> suspend time? If that doesn't work, try doing the same with power
> domains.
I'm afraid either of this makes no difference, no.

I'll at least send a V2 now, so others can use the latest state of my work.

