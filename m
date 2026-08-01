Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77EBCC55172
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 21:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8oEGy8rqwZ/gqYzJNGC0Im+DxBJzFqohOOWzha3aJP0=; b=S6P2gsbmUb0FHbSM44NzqRc4Fe
	8Xf5p57Huy0y+6OBMX/yP82Mb1sXO0iu4Bl2HNSRx/AdJ7V/z7HlpOlxFKYX9XHzrvCYoevZloYex
	jgUD7T9y0d8z2pvB+rDmwmYpukksGB+wZ/KG1NydQKNixVKgycw59zVwvw6qHrNDUsYrrLZpkEdaC
	GCOcXv8QsHgrSeQH/cEkLRbiS2U2F9DkAQz+qXDVLPI+jl8RIqhNFmUZFwx/IhTCUkfVbuABzerOq
	LOLOHZ6Q8irwLaWlZ2gR2PGQjaxI9NwslFTQdetSP151Omqs0x7hfbuhq4+4X4tpNI9BdZlQUAOUb
	yRO9+I1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqHhF-0000000F9Iz-2W6J;
	Sat, 01 Aug 2026 21:56:45 +0000
Received: from mail.cyberchaos.dev ([195.39.247.168])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqHhC-0000000F9Ie-1z9N
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 21:56:44 +0000
Message-ID: <03eb4c22-045e-470e-8259-ebf9b1cfe2ed@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1785621398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8oEGy8rqwZ/gqYzJNGC0Im+DxBJzFqohOOWzha3aJP0=;
	b=Xmddp+7GQRTeX/CMdkkJE6vw4Zyu/9477fXl54HZRSDhJInS9Ax5tLWR0X9sCOkZ/OIk/D
	DgwY4x69kYBw+2X2mAi6YDH1umCIvjCrb47alfpFuLgGU8krLzUPrd8newkgtva2O/gaYW
	lHaQ6KbmX3Dgj+Bl6ZryVS/IGtW9Ek8=
Date: Sat, 1 Aug 2026 23:56:20 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 08/10] HID: apple: Add DockChannel HID transport driver
To: Michael Reeves <michael.reeves077@gmail.com>,
 Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Jassi Brar <jassisinghbrar@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Hector Martin <marcan@marcan.st>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, iommu@lists.linux.dev,
 linux-input@vger.kernel.org
References: <20260630-apple-mtp-keyboard-final-v1-0-506d936a1707@gmail.com>
 <20260630-apple-mtp-keyboard-final-v1-8-506d936a1707@gmail.com>
 <05d39c4d-8405-4fe7-a798-c8a9c92699ed@cyberchaos.dev>
 <CANpmGNs3s2yLw05jkpZ9mscQNZ9JvfbqEgyW8V=cMD29aU8c2A@mail.gmail.com>
Content-Language: en-US
From: Yureka Lilian <yureka@cyberchaos.dev>
In-Reply-To: <CANpmGNs3s2yLw05jkpZ9mscQNZ9JvfbqEgyW8V=cMD29aU8c2A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_145642_697756_C33EC35A 
X-CRM114-Status: GOOD (  27.72  )
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

On 7/1/26 16:32, Michael Reeves wrote:
> Hi Yureka,
>
> Thank you for the review and the feedback.
>
> On Tue, Jun 30, 2026 at 11:21 PM Yureka Lilian <yureka@cyberchaos.dev> wrote:
> [...]
>>> +     strscpy(hid->uniq, dchid->serial, sizeof(hid->uniq));
>> If the keyboard appeared before stm, dchip->serial might be uninitialized.
> Yes, true, thank you for picking this up!
> [...]
>>> +     /*
>>> +      * Prefer to enable STM first, since it provides device IDs. Some
>>> +      * firmware versions do not expose STM, so let the keyboard start
>>> +      * without it.
>>> +      */
>>> +     if (iface->dchid->id_ready || !strcmp(iface->name, "stm") ||
>>> +         !strcmp(iface->name, "keyboard"))
>> I specifically asked for a mechanism to let the keyboard probe even on
>> devices which do not expose/have stm. Thanks for adding that!
>> However, I think this might need some more sophisticated mechanism to
>> decide whether the stm is still going to appear after the keyboard, or
>> not at all. I'm not sure if there is a way to tell this at this point,
>> or we need to add a timeout for the stm to appearing, which needs to
>> expire before we create the other interfaces with fake serials.
>>
> I do not think there is a way to tell at this point, unfortunately.
>
> I think the best way to resolve this would be to implement a delayed work
> item that is scheduled during probe. If STM appears and initalises before
> the timer (I'm not sure how long it should be right now, I will prototype and
> experiment) we cancel the delayed work, get the real serial, and spin up
> the keyboard. If the timeout expires without seeing the STM interface, we
> assume the platform does not have one, mark id_ready as true, and
> proceed to init the keyboard.

I see three ways forward (no specific order):

1) Implement the timeout as you described.

2) Use the approach that always waits for the stm to appear, and is 
proven to work well on the M2 devices targeted by this series. A 
different behavior that does not wait for the stm / determines the 
serials using other means can be added at a later point in the same 
driver but with a different compatible string.

3) Add an stm subnode (like the downstream Asahi device trees have for 
their dockchannel-mtp nodes [1]) which indicates whether the stm is 
present. Check for the existence of this subnode to decide whether to 
wait for the stm or add the HID devices with fake serials. Support for 
other methods of retrieving the serials can be added later and indicated 
by other subnodes.

I would appreciate feedback from all of you on which of these options we 
should move forward with.

>
> I will work on this and experiment to see if it's the best solution or
> if there's
> any others as well as to find the ideal timeout, and submit as part of v2.
> [...]
>
> Thanks again,
> Michael


Thanks,

- Yureka

Link: 
https://github.com/AsahiLinux/linux/blob/asahi-7.1.5-2/arch/arm64/boot/dts/apple/t8112-j413.dts#L260 
[1]


