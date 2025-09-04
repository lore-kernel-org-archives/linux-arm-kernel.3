Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2857CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 19:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7YMf+k/Bsp9owswsYg5LCXeOuKmxxash92C94JmMNFU=; b=PCD4TeoCNXa+T0HHfimEk9nE9k
	KPoSB48x1xYxkrKf9u4YqK8F28bAwHm5wblkwCW8PxYjGqcrkaJ2mPTWiwe3NzfjMdBdztzMlhHSj
	8ENu1dfMKtxPB5k7i+T1oFQ3CaRxs8oIv4WegaIXT9DCSEJhJai64nHuvOlho7tnaSfE+zA2FTxcU
	MIV3LQxti6eT7xK0jSuexFJpYWjF+0GbE0QpZDrD+PQ7tAIP8BSjZMEs1wPIlmVCOv5qluBeJco16
	yNz3Qzvk19241LL3cNvmNBgHi17A5nb1ZxxOKQ7qadIwkJTOL5DkXzAMtVRpUDI5wBKofZGkhjNP0
	N1ipI0WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuG1I-0000000E3nT-3X39;
	Thu, 04 Sep 2025 19:53:20 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuBtr-0000000CXpX-20i5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 15:29:24 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cHk0r5nppz9tNF;
	Thu,  4 Sep 2025 17:29:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1756999756;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7YMf+k/Bsp9owswsYg5LCXeOuKmxxash92C94JmMNFU=;
	b=YyyUUybUO9ZToCy1ozjYe7nM6hGgPqUd8qbdtc2cOc6VU3Qq5i6fb0BTkmf2GxT8dlZaxc
	5yhGTaCCc2iVy8WhS+2hBtGOQVuNExftXz+0f4+w7aO40ncNqj/BRG37Xq4FWIQF4zS2M2
	RTAwGslv5Xx0+EYkB/htXz0gxV5vh9izbIJwrLAFWDtSyojX4GMDusoXHYCLgFT2EKN2k8
	lgeeI+RLgCdnR+l3KN9lSzu+sUJ2ki5H42Ck9Bzh8vKqIXpwOHeK3yUv/MJPwYVAuAFBLS
	V9xV6M8cW5xMvzIOW+wa8hymS1Rol8hK3HHTiq62NtIkBn5nsVHgX5MUr9UBvg==
Message-ID: <4147d10f-fb54-4f1b-ac1b-58cf657a3aeb@mailbox.org>
Date: Thu, 4 Sep 2025 17:29:11 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2 4/9] drm/panthor: Implement optional reset
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Peng Fan <peng.fan@nxp.com>, linux-arm-kernel@lists.infradead.org,
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
 <36298ed9-05e4-4871-8e99-dfe814342c29@mailbox.org>
 <20250904172019.58e5f589@fedora>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20250904172019.58e5f589@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 92bfdf50c7c1f6425f0
X-MBO-RS-META: fgg6a1e587wkiek1uhzomehqkz1go8k6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_082923_665850_B620AEEF 
X-CRM114-Status: GOOD (  19.75  )
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

On 9/4/25 5:20 PM, Boris Brezillon wrote:
> On Thu, 4 Sep 2025 16:54:38 +0200
> Marek Vasut <marek.vasut@mailbox.org> wrote:
> 
>> On 9/4/25 4:04 PM, Boris Brezillon wrote:
>>
>> Hello Boris,
>>
>>>>>> I suspect the extra soft reset I did before "un-halted" the GPU and
>>>>>> allowed it to proceed.
>>>>>
>>>>> Hm, not quite. I mean, you still need to explicitly boot the MCU after
>>>>> a reset, which is what the write to MCU_CONTROL [1] does. What the
>>>>> soft-reset does though, is reset all GPU blocks, including the MCU.
>>>>> This means the MCU starts from a fresh state when you reach [1].
>>>>
>>>> I have a feeling the write to MCU_CONTROL does nothing in my case.
>>>
>>> I believe it does, otherwise you wouldn't be able to kick the MCU
>>> and get things working until the first runtime suspend happens. I gut
>>> feeling is that there's something fishy in the FW or SoC integration
>>> that causes the FW HALT request to put the MCU/GPU in a bad state
>>> preventing further MCU_CONTROL(AUTO_START) from functioning correctly
>>> after that point.
>>
>> I wonder who at NXP could chime in ... Peng, do you know ?
>>
>>>> Is there some way to probe the MCU state before/after setting GLB_HALT,
>>>> and also before/after the MCU_CONTROL write, using
>>>> gpu_read()/gpu_write() register operations, to find out what is going on
>>>> with the MCU at each point ?
>>>
>>> Yes, there's an MCU_STATUS register [1].
>> Is that the only register I can use , or is there something more
>> detailed ? This register only returns values 0..3 which is not very
>> informative.
> 
> Not that I'm aware.

Hmmmmm ... is there any way we can progress with the MX95 upstreaming 
with full reset , as a hardware implementation workaround in the driver, 
or some such ?

