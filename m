Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D85CCE7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 07:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7QTF0rM+w5EQbe0dkyUe0EzmXHLlCV/ymZQZNrVKoto=; b=AVDvqp4827UE3YkjbHW35fj3Ek
	4pRY53wdQNe97kJ6kCBiZxqs44yTc/F5J2lPnz8PZGfPTpBopuMXFLZxEB9Vbdnj+0gw4PbBaJFPV
	RNuXr88lYI5PdtE/SCH9svGtLYMdj2p7hnm9X4pI4vwYqmkjZotr9cPhs389La9S1bmm4JrCpsdIX
	7gNNhQGoNEY9YDyTKs2HkWHe5w43WCr92WWRq9p1zGdtIPbFQ35jEnSqo9xRKMIBoq9VSgxo26C7l
	H+XII2vrQ6Hi+Sj8CZIKqW4J/Ekqa4tcs5nCzvYLBad+1IuAHGupYQFcQOGxXaU4V0buICPXUqnYG
	GU2I/uSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIjq3-0000000Biqz-3tPJ;
	Wed, 04 Dec 2024 07:30:23 +0000
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.20])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIjnj-0000000BiQs-3Ns4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 07:28:01 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1733297268; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=DW+Ixa3XQxtFxQfckZJV97A9gxX7U1xrO7Qh11l17QsQpXEL5809FG4grREDbp91Wd
    AHl6BQB+GimvuXaAfQRPC86hbw158Fbix1yk+WUVQJ6OiPcqzNXt0/CZCcwnH3g0v893
    hcU57Bedo/hgJmec5lBvhq5XoscbsrPHqVSjeHeE53XIPZXa4o+OeFeLdurN918ni2lF
    fJSGr5bLjZRPj3KYY2gfFfp8rthgDJ+XkkhiouIN5oue8UNTLh5FZTClvhMxMy3fLo2i
    vM61nXznsTnKAoTOwNcwf5iYn4O/XwUu+Frulrwmh79nXfCQ14+W90PdsA5cTtDYJBME
    RQfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1733297268;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=7QTF0rM+w5EQbe0dkyUe0EzmXHLlCV/ymZQZNrVKoto=;
    b=AZySPL+UH1afjVxjYrO+xin6wVfi8z5SctW/Dk7eVxnG34ynmiXI4aP6UUZJw7slEI
    VgvWtAX/h6UnJnGIW3/ae49uZO+eL02dHPrc5TvrayF8TqsuVP3AmbpxiQ6Jr3kxaxtA
    w40gwdNm9o8vM754f6TIpTyl3A7di5qQ3pShzq4aei9CERwt8z3lcOZV1KpluFy3H0AR
    /jo96/tCi9eMB2SNDj3pbFmCq+ItPFwoE6mQSEW+KymFE8oRuLKXW1wBX5XDfIIeuda4
    HXrE8JYWDcV417NY2KyXgRh04QNE0bd5Md2ciibi7SCBlae6Vvn9ycIrNulAGRPZDJa8
    4MRw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1733297268;
    s=strato-dkim-0002; d=outer-limits.org;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=7QTF0rM+w5EQbe0dkyUe0EzmXHLlCV/ymZQZNrVKoto=;
    b=QFQokjf7U6HgALX84BrA/qhbM1YOMUP3OSMvIgqsBzSCj2ACkmP880wtCZTCAa8SxQ
    kFz7GpagWtoYKH0ctFM6hWNc9/Nzqp5o/MaBUUhXeKAoaVsNClRyDWrIe4VD6sqhYeIA
    QDr8mJIMsiNLm4PKDU6vqR00XAlbwfs27p0J7iH0Ci0bYRxDoXhrW6T4n1QK2QtM2sVx
    RAxYlalY7VTywW/U0g+v3tmIjcP614ARydN5FXNucj+o2oMmgtx1/1Y5X3Ut85QlJb1r
    6o0KEwxdoeyc82xErKBAf+xuO+w/ye3/+zXUoPfF4THbLqvN3ELVBckj8+4Z/CIElNqQ
    Otkw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1733297268;
    s=strato-dkim-0003; d=outer-limits.org;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=7QTF0rM+w5EQbe0dkyUe0EzmXHLlCV/ymZQZNrVKoto=;
    b=pDac4oALLSCJWwi2Zc4IMR1V0n1zxBNs0rdh1Uqkl3kq2KLWgXavwjx5lu3zHNwjVl
    dtv55yj5hQs1ZDXj6FCg==
X-RZG-AUTH: ":JnkIfEGmW/AMJS6HttH4FbRVwc4dHlPLCp4e/IoHo8zEMMHAgwTfqBFXdk5Zv9blcw/Guou9tnmlcuycxXU9rVIojJAYOMzGkPFeCwPebw=="
Received: from [IPV6:2a02:8429:5895:8b01:5ea:3d78:a142:af08]
    by smtp.strato.de (RZmta 51.2.11 AUTH)
    with ESMTPSA id Ja0a030B47RmQWc
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 4 Dec 2024 08:27:48 +0100 (CET)
Message-ID: <8d674373-0f30-4d0b-aac7-53eb38c81513@outer-limits.org>
Date: Wed, 4 Dec 2024 08:27:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm: Remove IO memcpy for Big-Endian
To: Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>
References: <20241203083838.3260036-1-jvetter@outer-limits.org>
 <609b026d-d54c-4a11-b7df-6ef0ac315f25@app.fastmail.com>
Content-Language: en-US
From: Julian Vetter <julian@outer-limits.org>
In-Reply-To: <609b026d-d54c-4a11-b7df-6ef0ac315f25@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_232800_149631_755BA8B2 
X-CRM114-Status: GOOD (  29.53  )
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



On 03.12.24 11:08, Arnd Bergmann wrote:
> On Tue, Dec 3, 2024, at 09:38, Julian Vetter wrote:
>> From: Julian Vetter <julian@outer-limits.org>
>>
>> Recently a new IO memcpy was added in libs/iomem_copy.c. So, remove the
>> byte-wise IO memcpy operations used in ARM big endian builds and fall
>> back to the new generic implementation. It will be slightly faster,
>> because it uses machine word accesses if the memory is aligned and falls
>> back to byte-wise accesses if its not.
>>
>> Signed-off-by: Julian Vetter <julian@outer-limits.org>
>> ---
>>   arch/arm/include/asm/io.h | 11 ----------
>>   arch/arm/kernel/io.c      | 46 ---------------------------------------
>>   2 files changed, 57 deletions(-)
> 

Hello Arnd,
first, sorry, that I messed up my sender email while sending the patch.

> I'm not sure if this is safe on all platforms. Big-endian arm
> is extremely rare in practice, and in comes in multiple variants
> that behave slightly differently:
> 
> - On modern ARMv7 the byte-invariant big-endian "BE8" mode
>    generally well-behaved and works as one would expect it to.
> 
> - There is one ARMv5 "BE32" based platform, the ixp4xx, which
>    works differently, and this in turn allows multiple configurations
>    for its buses where a byte-swap is performed in the PCI
>    controller.
> 
> When the little-endian I/O string operations got optimized to
> calling the word-based helpers in commit 7ddfe625cbc1 ("ARM:
> optimize memset_io()/memcpy_fromio()/memcpy_toio()"), Russell
> intentionally left the big-endian versions alone, which I think
> was done for the case of PCI on ixp4xx, but could have been
> out of general caution.
> 

Wow, thank you for the explanation!

> Before we apply your patch, I think the minimum would be to
> have Linus Walleij try it out on an an ixp4xx with a driver
> that uses these functions. Maybe Russell remembers the exact
> constraints that led to using byte access for big-endian
> mmio string operations, and whether the new lib/iomem_copy.c
> version causes problems.
> 
> I also looked at the little-endian arm32 version, and
> it seems that here the generic code would work fine, but
> the custom variant is likely much faster when both the
> source and destination buffers are aligned, as it can
> do larger MMIO transactions using ldm/stm instructions,
> though the generic version would be a bit better if the
> in-memory buffer is unaligned.
> We could get the best of both by implementing optimized
> arm32 versions __iowrite32_copy()/__ioread32_copy and
> using those in the generic memcpy_{from,to}io.
> 

ok, then I will wait for now, to see if it works with the current 
version. If not, I will have a look at using the 
__iowrite32_copy/__ioread32_copy functions.

>         Arnd


