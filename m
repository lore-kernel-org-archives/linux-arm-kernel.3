Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97DC8D2CE17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 10:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RTBglI0YGfawGwb4/35MKrAl87UMJbCIeSXIoQF2HDk=; b=4rhSDygmSO4VBDJP6AlTfaoG+q
	H371kKkdw6Zxos9PVZQVBT4xgad2+AeySJG1BTgUVB1lOCwgc63xg++/h1knjTID/ndH8pQvTTxpn
	3fEe0Evt3cuYgx70TKXW6MznraWr0z63u2mg7Ci/5jmL9JFHrVOZoVuXH3sv67Da9dzZlZwLBr3C1
	HHLJxILPXMcgXQggaeLzXCRsBZrx7rTiy1dMBBppZ+Dict+tbs5sou3/hlaxEx5ddi0HrmOiv4k33
	xF8T89LZWWOjhIwZyWTJI6pmz4rWtSRXOrCslpiAU1YeCcfy4/CrtJSSR0RdNUAIX06YZtqd3NwJi
	aFVC2caQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTHjj-0000000FLfb-1zSg;
	Wed, 10 Dec 2025 10:47:59 +0000
Received: from mail-m32101.qiye.163.com ([220.197.32.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTHjg-0000000FLey-1sfw;
	Wed, 10 Dec 2025 10:47:58 +0000
Received: from [172.16.12.51] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2cb688fed;
	Wed, 10 Dec 2025 18:47:43 +0800 (GMT+08:00)
Message-ID: <e7b2ceaf-1fbd-4f02-9d75-be4feab724e3@rock-chips.com>
Date: Wed, 10 Dec 2025 18:47:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Issues with DRM_ACCEL_ROCKET (Oops, power-domain, probe-ordering)
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Quentin Schulz <quentin.schulz@cherry.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Heiko Stuebner <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <0b20d760-ad4f-41c0-b733-39db10d6cc41@cherry.de>
 <77685900-2c34-49b8-8c7e-14718841ef17@rock-chips.com>
 <fa82d11f-ce11-4feb-bdb4-c31d360a2a62@rock-chips.com>
 <CAAObsKDYLXVf1GdYUNeaOya+pWD4jTOEf55ouXAL9iM_kWCcMw@mail.gmail.com>
 <75166475-d6a8-45b8-8092-f31d292d4206@rock-chips.com>
 <CAAObsKABYQnw9rUfxwTS-yiQSoH9rdxZ_ffUBtp2H3tMJqMb7w@mail.gmail.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <CAAObsKABYQnw9rUfxwTS-yiQSoH9rdxZ_ffUBtp2H3tMJqMb7w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b07dfc1c103abkunmca64904d3d50d50
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0kdQ1ZOH0tPTE1DSEtJGR1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUJCSU5LVU
	pLS1VKQktCWQY+
DKIM-Signature: a=rsa-sha256;
	b=TTsBySDauc4RTbYe5EhC7K4j01jlT2OcKOuh76Zuc/ZPet61WIaJ88X+kag1tWleJLVww49BC54QA5br0pqv/bKHzLKy/86Hqnle+NKezwlRI/URbqHBwZPOU4TjKGrDvzTuJDXLcEjj7kitByinbmnqyShuhKN72nDZD1oDo/Q=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=RTBglI0YGfawGwb4/35MKrAl87UMJbCIeSXIoQF2HDk=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_024756_989907_6D909549 
X-CRM114-Status: GOOD (  14.77  )
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

Hello Tomeu,

On 12/10/2025 2:50 PM, Tomeu Vizoso wrote:
> On Tue, Dec 9, 2025 at 10:31 AM Chaoyi Chen <chaoyi.chen@rock-chips.com> wrote:
>>
>> Hello Tomeu,
>>
>> On 12/9/2025 2:55 PM, Tomeu Vizoso wrote:
>>> On Tue, Dec 2, 2025 at 8:00 AM Chaoyi Chen <chaoyi.chen@rock-chips.com> wrote:
>>
>> [...]
>>
>>>
>>> This need was questioned during the review process, and during my
>>> stress testing I didn't find a need for core 0 to be treated
>>> specially. So it was considered unneeded complexity and the code was
>>> dropped.
>>>
>>
>> Oh, I just noticed that the commit comment in the devicetree still
>> contains a relevant description.
>>
>>> My testing involves running the supported models as a whole, and also
>>> their individual operations as individual tests. I run them in 8
>>> parallel processes, in batches so we have continuous bring up and down
>>> of clients.
>>>
>>> I'm a bit surprised that that testing worked stably but we have still
>>> failures in some setups.
>>
>> Could you please describe the failures that still exist? Thank you.
> 
> I was referring to the ones that Quentin reported when starting this thread.
> 

I believe this pmdomain patch can alleviate some of the problems [0]. 

However, the problem Quentin mentioned still exists. For example, if
there is an invalid device on core0, while core1 and core2 are valid, 
accessing the relevant data on core0 will cause problems. Quentin's
patch can fix this, but he doesn't seem to have time for it lately...

[0] https://lore.kernel.org/all/20251205064739.20270-1-rmxpzlb@gmail.com/

> Regards,
> 
> Tomeu
> 
> 

-- 
Best, 
Chaoyi

