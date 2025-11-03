Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF0FCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 16:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WBF6BigqDGHpLohygKEBk47de1/glpe+s9mh/hweIEs=; b=INF1MR+i9WEuw6pdIrftXBhnUk
	GXipfcVo+YjfUvpyuDOpf2FY8CIaGZGo0AqrcFjj4GBF1yylH/Z90d/cfC5EnXJBkLyQDwxKB5Hjh
	wDf3u9hHhLY6XDhWUxHo+TTPMqgIx/2c6ztKIs0ycuUODL5LmY6TEHaylTOFFYnRYnRBUyIso7Xq0
	ma5FgKbG+XHL0wXeqwxiorDiukXkfuTGv520lPX5Rziz0KPO0UIWNLZP9C/9L1H/bxNZvsqbzQMhH
	ANBR9K/wCYbYmYnPBPAqgd0sMTgawh5I+ClU7WTRNZR0PMZDEWZWzwvr2bKY7PTOk+slAsb7CW15P
	dPq09Ulg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxoA-0000000AJii-00ZB;
	Mon, 03 Nov 2025 16:53:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxo8-0000000AJic-1wPa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 16:53:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 85F706013C;
	Mon,  3 Nov 2025 16:53:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54741C4CEE7;
	Mon,  3 Nov 2025 16:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762188807;
	bh=ZkLFIz0vvjDeD2wJOSQTr9Q/o5xR6ot5EVcHo9EzqcM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SqZuypYw81+njFxxCaYsGfEQYd+kxBwe0YRsRX1hV1YGEqo96Hxh0inlgQEfMWrJn
	 6tlXxeQY1lRmbVuXqstLs5+OTEyM8aZZuuVQuvjau7xitn8ECPIez/gTYYXyUZS8u5
	 DPrfzr0DXatM368eGnaT8jMeWvQtaWucQ0DEy/NOeaWu8+mIez5c3j2BA2nmeqd6R8
	 9XqUzerFozM0V/f7uS02Xk4gapLylS2u/Y8kgHCV1cfDAjWq2DCRcLa54SsQHZuahi
	 mRFXsM2qTglPv8wsD8hMi8b4s6SlHNR5ovQ/F/9PxU3YZLgxUMEqACdk/9RerJs/mC
	 /MmH3dF3KIP0Q==
Message-ID: <e323f1f3-f543-4e81-af6b-243fcf9ba750@kernel.org>
Date: Mon, 3 Nov 2025 17:53:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/2] ARM: mm: support memory-failure
To: Xie Yuanbin <xieyuanbin1@huawei.com>, linux@armlinux.org.uk,
 akpm@linux-foundation.org, david@redhat.com, lorenzo.stoakes@oracle.com,
 Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, linmiaohe@huawei.com, nao.horiguchi@gmail.com,
 rmk+kernel@armlinux.org.uk, ardb@kernel.org, nathan@kernel.org,
 ebiggers@kernel.org, arnd@arndb.de, rostedt@goodmis.org, kees@kernel.org,
 dave@vasilevsky.ca, peterz@infradead.org
Cc: will@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, liaohua4@huawei.com,
 lilinjie8@huawei.com
References: <9c0cd24c-559b-4550-9fc8-5dc4bcc20bf7@app.fastmail.com>
 <20250923041005.9831-1-xieyuanbin1@huawei.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <20250923041005.9831-1-xieyuanbin1@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 23.09.25 06:10, Xie Yuanbin wrote:
> Arnd Bergmann wrote:
>>>> It would be helpful to be more specific about what you
>>>> want to do with this.
>>>>
>>>> Are you working on a driver that would actually make use of
>>>> the exported interface?
>>>
>>> Thanks for your reply.
>>>
>>> Yes, In fact, we have developed a hardware component to detect DDR bit
>>> transitions (software does not sense the detection behavior). Once a bit
>>> transition is detected, an interrupt is reported to the CPU.
>>>
>>> On the software side, we have developed a driver module ko to register
>>> the interrupt callback to perform soft page offline to the corresponding
>>> physical pages.
>>>
>>> In fact, we will export `soft_offline_page` for ko to use (we can ensure
>>> that it is not called in the interrupt context), but I have looked at the
>>> code and found that `memory_failure_queue` and `memory_failure` can also
>>> be used, which are already exported.
>>
>> Ok
>>
>>>> I see only a very small number of
>>>> drivers that call memory_failure(), and none of them are
>>>> usable on Arm.
>>>
>>> I think that not all drivers are in the open source kernel code.
>>> As far as I know, there should be similar third-party drivers in other
>>> architectures that use memory-failure functions, like x86 or arm64.
>>> I am not a specialist in drivers, so if I have made any mistakes,
>>> please correct me.
>>
>> I'm not familiar with the memory-failure support, but this sounds
>> like something that is usually done with a drivers/edac/ driver.
>> There are many SoC specific drivers, including for 32-bit Arm
>> SoCs.
>>
>> Have you considered adding an EDAC driver first? I don't know
>> how the other platforms that have EDAC drivers handle failures,
>> but I would assume that either that subsystem already contains
>> functionality for taking pages offline,
> 
> I'm very sorry, I tried my best to do this,
> but it seems impossible to achieve.
> I am a kernel developer rathder than a driver developer. I have tried to
> communicate with driver developers, but open source is very difficult due
> to the involvement of proprietary hardware and algorithms.
> 
>> or this is something
>> that should be done in a way that works for all of them without
>> requiring an extra driver.
> 
> Yes, I think that the memory-failure feature should not be associated with
> specific architectures or drivers.
> 
> I have read the memory-failure's doc and code,
> and found the following features, which are user useable,
> are not associated with specific drivers:
> 
> 1. `/sys/devices/system/memory/soft_offline_page`:
> see https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-memory-page-offline
> 
> This interface only exists when CONFIG_MEMORY_HOTPLUG is enabled, but
> ARM cannot enable it.
> However, I have read the code and believe that it should not require a
> lot of effort to decouple these two, allowing the interface to exist
> even if mem-hotplug is disabled.

It's all about the /sys/devices/system/memory/ directory, which 
traditionally only made sense for memory hotplug. Well, still does to 
most degree.

Not sure whether some user space (chmem?) senses for 
/sys/devices/system/memory/ to detect memory hotplug capabilities.

But given soft_offline_page is a pure testing mechanism, I wouldn't be 
too concerned about that for now.

> 
> 2. The syscall madvise with `MADV_SOFT_OFFLINE/MADV_HWPOISON` flags:
> 
> According to the documentation, this interface is currently only used for
> testing. However, if the user program can map the specified physical
> address, it can actually be used for memory-failure.

It's mostly a testing-only interface. It could be used for other things, 
but really detecting MCE and handling it properly is kernel responsibility.

> 
> 3. The CONFIG_HWPOISON_INJECT which depends on CONFIG_MEMORY_FAILURE:
> see https://docs.kernel.org/mm/hwpoison.html
> 
> It seems to allow input of physical addresses and trigger memory-failure,
> but according to the doc, it seems to be used only for testing.

Right, all these interfaces are testing only.

> 
> 
> Additionally, I noticed that in the memory-failure doc
> https://docs.kernel.org/mm/hwpoison.html, it mentions that
> "The main target right now is KVM guests, but it works for all kinds of
> applications." This seems to confirm my speculation that the
> memory-failure feature should not be associated with specific
> architectures or drivers.

Can you go into more details which exact functionality in 
memory-failure.c you would be interested in using?

Only soft-offlining or also the other (possibly architecture-specific) 
handling?

-- 
Cheers

David

