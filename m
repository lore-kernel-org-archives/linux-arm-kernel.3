Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D12CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 19:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x7/xT89VRoxrwQ0JjRMfdexoGV/szCvyMNhLAm5kJvo=; b=k17xCgWSIlDUh8r0RLMAOtWHwD
	TqCFYgV7ZWe+I2u+iJhsZ4M0Rjurl5HWdF/qY7AlD4j2fM5oqcpAlk0qVZIbheumnCL2WztQYCfbG
	KVzzQyI9t9iW7NxpjLQJjlIO2xIuzS5fDDScWab+SeKeWkQwCYVz5P/gKBW7U9waszirhFeHZqiwR
	kaCih/1aF2Y6g54YnBmsDVL8Suz9vhprorhFogEDvF8Zc9Gn8jZ683/pvYu/PLOljkEhk6HmRCAXk
	ADCur+sR8HaaIANg+GvIaqh6Z0eDDAsONqdr+AoyBizb359WFBS3Azl+A2EtVFU+5g2+xQK6a5yrd
	JigtJNHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuG0b-0000000E2pY-20d8;
	Thu, 04 Sep 2025 19:52:37 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuBMT-0000000CMiV-1XNR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 14:54:54 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cHjDz3FWNz9sZZ;
	Thu,  4 Sep 2025 16:54:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1756997683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x7/xT89VRoxrwQ0JjRMfdexoGV/szCvyMNhLAm5kJvo=;
	b=dS8o7BL3kNMLXteZvbaVNmebE192YJHpiG1f0n6N/iFe9hDbOT3arEQNITXZukWMDsgTSL
	0z5FaMijFHTnVCIirKjw/tY0tm23a7W3diqJQKuAEBXK5qqkXBIJXGvYILT3YRW/xuGMT9
	7xlEeNgCHLVVRDrVnYDWHxd2TSbmYX+qets+CCrPKkyU1+O78LKHcSjup/179xKhSvYhru
	Dg6jOiI/28TYyGNsG83rysZmK8Mky/i3P++bmGoaxVg5WxygFHSDW4s3JrxWjhtJ9iG1v4
	S8J4mynpBTHHi35cjxBVKNPODD1QDS+WKA6owP3V089toxOoeba/93Ea+g1s5A==
Message-ID: <36298ed9-05e4-4871-8e99-dfe814342c29@mailbox.org>
Date: Thu, 4 Sep 2025 16:54:38 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2 4/9] drm/panthor: Implement optional reset
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Peng Fan <peng.fan@nxp.com>
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
References: <20250321200625.132494-1-marex@denx.de>
 <20250321200625.132494-5-marex@denx.de>
 <20250324094333.7afb17a1@collabora.com>
 <c1de2afb-3559-4fbb-b13b-2373175b420b@denx.de>
 <20250325084349.344a0f11@collabora.com>
 <7aadf355-edf0-46fc-b969-65c3789375ca@denx.de>
 <20250325153507.61d82e39@collabora.com>
 <4c06aef3-a254-437c-aa15-8e3eb7bf5951@denx.de>
 <20250325155231.0d1b1000@collabora.com>
 <838a0c6b-845b-428d-86b3-1480e5b8080f@mailbox.org>
 <20250904082224.113d0cd1@fedora>
 <7d4e773b-64ac-49ce-8d8b-7a39c353d18f@mailbox.org>
 <20250904160445.1671f140@fedora>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20250904160445.1671f140@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 41491fbd7aa62595225
X-MBO-RS-META: 9cri59ifc448dxba9poz1bm6pht8k5af
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_075453_544042_6B1972F2 
X-CRM114-Status: GOOD (  18.63  )
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

On 9/4/25 4:04 PM, Boris Brezillon wrote:

Hello Boris,

>>>> I suspect the extra soft reset I did before "un-halted" the GPU and
>>>> allowed it to proceed.
>>>
>>> Hm, not quite. I mean, you still need to explicitly boot the MCU after
>>> a reset, which is what the write to MCU_CONTROL [1] does. What the
>>> soft-reset does though, is reset all GPU blocks, including the MCU.
>>> This means the MCU starts from a fresh state when you reach [1].
>>
>> I have a feeling the write to MCU_CONTROL does nothing in my case.
> 
> I believe it does, otherwise you wouldn't be able to kick the MCU
> and get things working until the first runtime suspend happens. I gut
> feeling is that there's something fishy in the FW or SoC integration
> that causes the FW HALT request to put the MCU/GPU in a bad state
> preventing further MCU_CONTROL(AUTO_START) from functioning correctly
> after that point.

I wonder who at NXP could chime in ... Peng, do you know ?

>> Is there some way to probe the MCU state before/after setting GLB_HALT,
>> and also before/after the MCU_CONTROL write, using
>> gpu_read()/gpu_write() register operations, to find out what is going on
>> with the MCU at each point ?
> 
> Yes, there's an MCU_STATUS register [1].
Is that the only register I can use , or is there something more 
detailed ? This register only returns values 0..3 which is not very 
informative.

