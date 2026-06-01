Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD739CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 16:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CMbEMaZmm5DzcaRqIrqpHmw1qqVVtZkx8RZDINIam10=; b=VZPstlyqUplZNQuFyGzmqrVSn2
	qWVAThK4emoAScbnOtWwbqX56sGIlcWw/EKdLOLqOnwre6hR2yDrmgVe1wjr80OMKoii2PwVELVaI
	A8WS1VlWErzBNWRgCKGhQrVDOObfcGXAmHS1eW+9QilJMRB00X7pMajdXnKvHw5DFxmgkjLdJ2KL1
	5PyAtO5qESiGywKRv5l9DuGJH/IfFF4Mlkeg10D+SjyGapUI3PNRG7Yt4QmOkCiVIYOlhWjdDpV3J
	XCKrrkDVzR7FOMpo5tp9WFKUBVhnQ5rGamshPFRWlzELDiT1qjn63E4dL+v0fPQXVCLY+0H5HzkGB
	OgqIYxQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU5oM-0000000BVvJ-04wq;
	Mon, 01 Jun 2026 16:48:22 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU5oK-0000000BVup-0n4E;
	Mon, 01 Jun 2026 16:48:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1780332497;
	bh=NTaDUY8eOQHTKjUFmYcoOIApWjAEo5g8l7ZWglNrbgg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cTx6tHwSAwb12yUdGuysgtaNxR2kcZf+aFA7QEYiBEPU/dwAXu061YuogmpUM9OYI
	 i+ZmW75pd8GMbtbnbUxcG6X1bB2xvsiu3SD/43Wge4xiEoGmsVsXVh51dG4pojfigA
	 lxfbbmepqndjGWCzz8xZFEAdSsCWcMuGcADbvu45bhLcZwZHTN1kCngRERDjyW5SiT
	 3CVPXoqHR3dTf/FkTN8wywdqYM7RzypQN0cdqlHZSXxDOcC42UbhHX++eS1pPSuPTn
	 VVuMWYFimBO/HOxWoAgJnmNa9X1E2SlCgPsHOamAFk65ORURMfcUR5XZTTfNaFQsDM
	 yAW+rVThjVhCg==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1447C17E0157;
	Mon,  1 Jun 2026 18:48:17 +0200 (CEST)
Message-ID: <47cf1380-e36b-4e09-943d-88351cbc7915@collabora.com>
Date: Mon, 1 Jun 2026 19:48:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] drm/rockchip: vop2: Fix layer cfg done timeout on
 multi-output setups
To: Andy Yan <andy.yan@rock-chips.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260504-vop2-layer-cfg-tmout-v1-0-730226a7331e@collabora.com>
 <2d2b6308-ae46-46fd-b1ce-e4f199b6eb27@rock-chips.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <2d2b6308-ae46-46fd-b1ce-e4f199b6eb27@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_094820_377650_A5336009 
X-CRM114-Status: GOOD (  14.07  )
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

Hi Andy,

On 6/1/26 1:54 PM, Andy Yan wrote:
> Hello Cristian,
> 
> On 5/5/26 02:23, Cristian Ciocaltea wrote:
>> On RK3588/RK3568 boards with multiple active display outputs, start/stop
>> transitions may trigger a timeout during overlay layer configuration:
>>
>>    rockchip-drm display-subsystem: [drm] *ERROR* wait layer cfg done timeout
>>
>> The shared OVL_LAYER_SEL and OVL_PORT_SEL shadow registers are committed
>> to the active configuration at the vsync of whichever Video Port is
>> selected by LAYERSEL_REGDONE_SEL.  When two Video Ports race through
>> atomic commits, rk3568_vop2_setup_layer_mixer() has two issues that
>> cause the wait to poll for a value the hardware might not be able to
>> produce.
>>
>> Patch 1 fixes passing the wrong target to the wait function, since the
>> expected value was already overwritten with the current VP's new
>> layer_sel before reaching the wait.
>>
>> Patch 2 moves the wait before the LAYERSEL_REGDONE_SEL switch, so the
>> previous VP's vsync can still latch the pending configuration.
>>
>> Patches 3 through 5 contain only minor follow-up cleanup.
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> 
> 
> Thank you very much for your work, these fixes all look sensible.

Thanks for checking this out!

> However, I haven't been able to construct a scenario via weston that
> reproduce these issues. Could you please tell me how you triggered them?

It was really tricky to reproduce - a customer usecase repeatedly restarting one
of their apps under a customized Weston, and all that when having both HDMI
output ports active, where at least one drives a 4K display.

Regards,
Cristian

