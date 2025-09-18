Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB0BCCA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 15:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PSI7DGOEFV5mSagems7vJu+ZOBe3Z/EsOJYCo+hXzkg=; b=CzNC5ehkPuf1zksQV4hTvUo57v
	wcaCnsjQfWF+2OUhK2mGsQ6drtbbkMGQNOfZ8IHT4H4OzuI1OI5taIu0GnZeWI5v4fju6/aoXWvV4
	N95ui0K1VwGf7DwJuHr1NS+TG6exWxoXbk5sVqF+KV3S++h2qlTqSeqo1t9Gm6JAYnnCynJxRshKi
	PB3dCjAiE/mhNCfbVekiCQcZXpIn8x7Q2nbj7D/eF4j7bBDFNud7BQNbQIp2i+We+67vepuWPvAOr
	FGQYJLq40HV8B5p7ypWRjYk1K5obAVKOQ7YvZzfXNWF0lxn3TViFpmaqDn1eK85TSiZmDri/K1n29
	N94h0Dlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGTZ-00000000MFC-3Uzu;
	Thu, 18 Sep 2025 15:23:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGTY-00000000MEV-2jIK;
	Thu, 18 Sep 2025 15:23:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=PSI7DGOEFV5mSagems7vJu+ZOBe3Z/EsOJYCo+hXzkg=; b=S0PhHvxcvIzuP4nXQbGkydgnSL
	YScgdq4xyEbQliQE+eT91GJo/yWgZelu+BMiCs9B8d79eGDJFtPsjbeMW1+kWNXhyXJsNgpdgFUwo
	6qbAgJTu7iql2lfQvbMcoepoblNcZOYzhAye3oe0ro6IJCWilDHkaEqrH99n18pN5uQUrfe4srH6g
	qeYmB043paniAn71Wy8WVVNBsm8qMvsfdY+LQJvruip2QAjsI6AHQiSmKUXpKL5/LubLu+3TZrnQs
	nX6vFGB0IZZGwyXfwRV9GfAWUhx8bXaLbBucDjSlqhf5YJQIbFB7mhLU7n3r9cp/aRCf58xW3dknF
	CsxE3wfg==;
Received: from mail1.nippynetworks.com ([91.220.24.129])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGTU-00000007dKE-2PTo;
	Thu, 18 Sep 2025 15:23:10 +0000
Received: from [192.168.8.153] (unknown [94.228.36.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ed@wildgooses.com)
	by mail1.nippynetworks.com (Postfix) with ESMTPSA id 4cSKCF469Rzkd2v;
	Thu, 18 Sep 2025 16:23:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wildgooses.com;
	s=dkim; t=1758208986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PSI7DGOEFV5mSagems7vJu+ZOBe3Z/EsOJYCo+hXzkg=;
	b=f8g+AwyDcY/V/u2x7YuRP4H+FweMjYMcQZIyTWhPYoC63sqHOEFPmZLeILIB+Z0QovN3+s
	8jIZgcUsmy54Sf62aewL+vzFk7B8Fsvn0JmdfDs/6fRmzMkEvDKosQD1DOj4CGGO6sEhho
	G4ocJQ0ConiBcABb8AYM6T7gdO0yb1Q=
Message-ID: <adbc2396-d5f0-4dd6-a65e-0dd78a58b9a4@wildgooses.com>
Date: Thu, 18 Sep 2025 16:23:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: rockchip: correct uart mux for Radxa ZERO
 3
To: FUKAUMI Naoki <naoki@radxa.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250917114932.25994-1-lists@wildgooses.com>
 <20250917114932.25994-2-lists@wildgooses.com>
 <FBB5B30DE8FEABD7+59ee6f48-2ad1-45dd-8cf1-8b58a03513a9@radxa.com>
From: Ed W <lists@wildgooses.com>
Content-Language: en-GB
In-Reply-To: <FBB5B30DE8FEABD7+59ee6f48-2ad1-45dd-8cf1-8b58a03513a9@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_162309_110293_B6A85B66 
X-CRM114-Status: GOOD (  27.35  )
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

On 18/09/2025 05:53, FUKAUMI Naoki wrote:
> Hi Ed,
>
> Thank you very much for your work.
>
> On 9/17/25 20:49, Ed Wildgoose wrote:
>> The rk3566 has multiplexed pins and the uarts can be moved to a choice
>> of 2 pin groups. The default rk356x-base.dtsi appears to default to mux0
>> for all uarts, however, specific hardware might choose to implement
>> alternatives
>>
>> The Radxa zero 3 shows that is uses M1 for uarts:
>> - uart4
>> - uart5
>> - uart9
>>
>> These aren't normally enabled, but we should at least correct the
>> default pinctrl definitions. Without these changes there will be
>> conflicts with mmc0/mmc1, leading to the SD or eMMC going missing.
>
> Sorry, but why do we need these definitions for disabled nodes?
>
> Or why don't we do similar definitions for nodes other than uart?
> For example, PWM12, I2S3, and SPI3 also use M1. Are they not related to SD/eMMC and therefore
> don't need to be defined?
>
> If users want to use UARTs on pin headers, they will refer to the correct documentation[1] to
> determine which pins are UARTs and will of course write the correct pinctrl definition.
>
> [1] https://docs.radxa.com/en/zero/zero3/hardware-design/hardware-interface#gpio-interface
>
> Best regards,
>
> -- 
> FUKAUMI Naoki
> Radxa Computer (Shenzhen) Co., Ltd.


Personally, and I'm saying this as a user who is technical enough to fix the definitions, it took me
quite a few days to figure out what was wrong with the definitions and understand the intricate tree
of dtsi includes, to finally figure out why I couldn't just do a "status = "okay";" to enable the
UARTs... (which is roughly what is shown in several radxa supplied overlays to enable uarts on
various boards)

So my vote would be to correctly define all the hardware for a given board. Then users can simply do
a status="okay" to enable and off they go. Phrased another way, I can't see a disadvantage in doing
this, rather than leaving broken definitions in place which don't work correctly. Ideally I think
you should add at least the I2C defs as well, as that is something I would like to use for another
reason and haven't even got to the point of discovering that was broken?

I might also (gently) add that it was not easy to find all the documentation to fix this. I located
the datasheet for the Zero 3 via google (it's not obviously available on the wiki?), then there is
the reading through and I must admit I missed the multiplex difference the first few reads through.
Eventually I fed the docs into a LLM and it pointed out what I missed and we got there

So in summary, I'm hoping you will adjust the (really very well structured! thanks!) dtsi include
tree to correctly define all hardware on each board so that we don't have a situation that every
user in the world needs to be a really decent level kernel tech just to use the board! Pretty please!

Thanks for listening

Ed W



