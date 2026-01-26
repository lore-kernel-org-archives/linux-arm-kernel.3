Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34988CF65DD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 11:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZuODv4byBDoO7r5ORDZZKB4tCzJ8s4CMikv3WI8hr/Y=; b=HukqJkjoW5ij1+qNScpnD5UuTj
	i4LzTcXJqMTS0jra3+8b9zdUyvg/2bO9fzz1hhKFeVTSPUvBEBolL4W1Q80ls4jRecj+/jwTVz9Dd
	VGwwHsOIL5YqPsVU7PraKX1bX3qeHHQ3LOzK9ZPA3DoptwRe21gXYcLbYfJkDD4t2Eg058zARoVqx
	2tZdNLgkJPWjbiQsx0nu/HPXDQlm/q0HewpqD5QS/jL+UQs9AFk+Yd90Q47/Xylc5Jc/pBYjBDZ75
	vke6V9FDA9EAh98R7DIftFpnm7l9KpyB5iI1/sUEXTFB/bxIjagA+zyC7jWFYPY/QQzRIiEE5ceWb
	M0q5tcnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkKPx-0000000CNuS-0kaN;
	Mon, 26 Jan 2026 11:06:01 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkKPq-0000000CNtj-2lU1;
	Mon, 26 Jan 2026 11:05:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZuODv4byBDoO7r5ORDZZKB4tCzJ8s4CMikv3WI8hr/Y=; b=DSJXpNivAlcWV1w9ugI0E425/J
	kXYNh+EOtBME+oBjgHiDyVQ8WB+b7+X3Vbl91kXX6p4aY8QSY5ax2S2V8JTT2v4Fid9/suotJvhI3
	sb3/WgcwAW3bzibDOyQrncYSBkXVPJiU8TjNKc2Q2XBky730iUAQ7G4i+kK12aPMLsY0J/b1JNaoD
	vhCcWvfBz3TFKMskx23Y4s2Bl4NDGcQDfZngO59bOpIWhxd9B9IbNyryFYl2bxWC+mH4ZVPYnY4sq
	zdfr0I89VW3ohxuB/nzTCPtw3YqniJK/VDLVMFY9QVH66fVpKTdS97MDtJxmIcVHwRRLtYFIxyzrf
	5byoU4gg==;
Received: from [189.89.57.42] (helo=[192.168.18.14])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1vkKPZ-00A0Ol-V5; Mon, 26 Jan 2026 12:05:38 +0100
Message-ID: <9ee3b7f0-9262-4f6f-bec6-6fd9978e3754@igalia.com>
Date: Mon, 26 Jan 2026 08:05:30 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] drm/v3d: Allocate all resources before enabling
 the clock
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Stefan Wahren <wahrenst@gmx.net>, Maxime Ripard <mripard@kernel.org>,
 Iago Toral Quiroga <itoral@igalia.com>,
 Chema Casanova <jmcasanova@igalia.com>, Dom Cobley <popcornmix@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com
References: <20260116-v3d-power-management-v3-0-4e1874e81dd6@igalia.com>
 <20260116-v3d-power-management-v3-3-4e1874e81dd6@igalia.com>
 <b652e476-af2f-4af7-aa95-3b987f6e1bde@igalia.com>
 <dbd3c9e7-c60f-4223-8ca6-c55d2398cc3c@igalia.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <dbd3c9e7-c60f-4223-8ca6-c55d2398cc3c@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_030555_007039_EF9CD98C 
X-CRM114-Status: GOOD (  12.84  )
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



On 24/01/2026 14:48, Maíra Canal wrote:
> Hi Melissa,
>
> On 23/01/26 12:53, Melissa Wen wrote:
>>
>>
>> On 16/01/2026 17:19, Maíra Canal wrote:
>>> Move all resource allocation operations before actually enabling the
>>> clock, as those operations don't require the GPU to be powered on.
>> What are the benefits of doing it?
>
> This is mostly a preparation for the next patch. In the next patch, I'll
> move all code related to powering on and preparing the GPU into the
> resume() hook. Since resource allocation must occur before resume(),
> this patch prepares the necessary groundwork for that.

Can you include this explanation to the commit message?

>
>>>
>>> While here, use devm_reset_control_get_optional_exclusive() instead of
>>> open-code it.
>> Overall LGTM. But I think this patch could be split into smaller units.
>> Maybe something like:
>> 1. remove open-coded part
>> 2. split gem resource allocation from initialization
>> 3. move all resource allocation
>
> I can certainly do that. My initial thinking was to keep these changes
> together, since they are closely related and all serve the same
> preparatory goal for the upcoming resume() refactoring. From my
> perspective, keeping them together helps preserve that context.

As a reviewer, splitting these changes into separate patches would make 
review simpler.
I think the open-coded improvement isn't super attached to the resource 
allocation, right?
And you can preserve context in the commit message.

Melissa

>
> Best regards,
> - Maíra
>
>>
>> Melissa
>>


