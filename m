Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56EB8C3600D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 16:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gx78FzdSuoxvydX3OAmJrDm5VENfMIagJMouDlZNW7Q=; b=4xmX1PiYjI8Pr54L+/PqqIQhgW
	GsP6+l0Zqr2Om1bens1k2LxBwcB4h1cD1IR0DRB3tII2LUF639uuILoYbILTOVCY9q8VRn59nP9Y5
	RD5yTdwMM1L+Jt1CbLdEwctmClApxfkaJ3l4hVak/sqNM/dppy7AjyyU78p9rVWNn4/TN/49qPY9P
	Fyf55QC4Sk1pUS+o29K1nLn0RILGuhc4QpMO0kgIS6wXwAUVkXMBiZqiEkWFV+hu18UvA99qaAJhI
	o8fvKcKGpyF96x1aYz2RmOHHk1PDBDnOvlHN4BQRoPBHZa80K5wFyO8t3EDyzZYA+HuvWtYMXOdJT
	UnSAaiBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx7X1-00000006Xkt-48er;
	Tue, 25 Mar 2025 16:53:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx5PJ-00000006DK4-0FV4
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 25 Mar 2025 14:37:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Gx78FzdSuoxvydX3OAmJrDm5VENfMIagJMouDlZNW7Q=; b=jAdSEy5gcM+D9u6mxQQDYE+XLG
	MRzy7Lf68KBhP9VbaCLyRn4zBsIba2Rdk89PKv/DgYz47bWUE9RFwsLHOpKFCaJQJEV1TaJGeIsDd
	Ey0klXEJ4oDL1XF94nignl36pX7rIQCkNN9nEYSCBaCZNPBpSA694sUXvP9udB2qQ+V9SpH06W6+x
	cAQLDcv/8MzHTE0sOAeyJFND7HIWgniK4eR8svusij+mfedG5SvWLmKMwczGyPHNMVI4NlM9KiBxx
	urG/+0do564U6p3l+L1ljdj5QCgE7QRvM1NPlr6NxSejdgihh2LmprawFIlSo0ZnGHMKylh2sdFrC
	mE2ThWnQ==;
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tx5PF-00000005VwA-37GZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 14:37:31 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A8859102E64C4;
	Tue, 25 Mar 2025 15:37:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1742913446; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Gx78FzdSuoxvydX3OAmJrDm5VENfMIagJMouDlZNW7Q=;
	b=J9EvbRS7UMr+zUOmz1lpNCnS04jKWkny9gRjE9/DZxMR7SGO59p02E0PT6z3LTMHwA4W49
	54fLn2HkHZv+2PuokIiMXas2nul6iahBgtwliBB6NNTURWfCT6ZdLrinmjo6NVdUnQ+TZE
	A8v527EIgWxqby2cLTzJ8CY82tYT1MI6ATmsCG+QkU2ALC75a+WDhut8xjSQjx+TaPSn72
	wEoymXg6ih7DAvPIuykuQ3j1GglTo4PzyTQRtc7Hk6qUng0I5Gt64Xs+6yrWrP7ATGEGgS
	gsoB/9uCV9EvBYqa9ZF0Cg88EiAkeGlxzTezuncvwUt/6RLWGXPH1F25kuvFmg==
Message-ID: <4c06aef3-a254-437c-aa15-8e3eb7bf5951@denx.de>
Date: Tue, 25 Mar 2025 15:37:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] drm/panthor: Implement optional reset
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
References: <20250321200625.132494-1-marex@denx.de>
 <20250321200625.132494-5-marex@denx.de>
 <20250324094333.7afb17a1@collabora.com>
 <c1de2afb-3559-4fbb-b13b-2373175b420b@denx.de>
 <20250325084349.344a0f11@collabora.com>
 <7aadf355-edf0-46fc-b969-65c3789375ca@denx.de>
 <20250325153507.61d82e39@collabora.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20250325153507.61d82e39@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_143729_929635_9209BEBE 
X-CRM114-Status: GOOD (  15.74  )
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

On 3/25/25 3:35 PM, Boris Brezillon wrote:
> On Tue, 25 Mar 2025 14:50:32 +0100
> Marek Vasut <marex@denx.de> wrote:
> 
>> On 3/25/25 8:43 AM, Boris Brezillon wrote:
>>> On Tue, 25 Mar 2025 00:37:59 +0100
>>> Marek Vasut <marex@denx.de> wrote:
>>>    
>>>> On 3/24/25 9:43 AM, Boris Brezillon wrote:
>>>>
>>>> [...]
>>>>   
>>>>>> @@ -563,6 +585,7 @@ int panthor_device_suspend(struct device *dev)
>>>>>>     
>>>>>>     	panthor_devfreq_suspend(ptdev);
>>>>>>     
>>>>>> +	reset_control_assert(ptdev->resets);
>>>>>
>>>>> Hm, that might be the cause of the fast reset issue (which is a fast
>>>>> resume more than a fast reset BTW): if you re-assert the reset line on
>>>>> runtime suspend, I guess this causes a full GPU reset, and the MCU ends
>>>>> up in a state where it needs a slow reset (all data sections reset to
>>>>> their initial state). Can you try to move the reset_control_[de]assert
>>>>> to the unplug/init functions?
>>>> Is it correct to assume , that if I remove all reset_control_assert()
>>>> calls (and keep only the _deassert() calls), the slow resume problem
>>>> should go away too ?
>>>
>>> Yeah, dropping the _assert()s should do the trick.
>> Hmmm, no, that does not help. I was hoping maybe NXP can chime in and
>> suggest something too ?
> 
> Can you try keep all the clks/regulators/power-domains/... on after
> init, and see if the fast resume works with that. If it does,
> re-introduce one resource at a time to find out which one causes the
> MCU to lose its state.

I already tried that too . I spent quite a while until I reached that L2 
workaround in fact.

