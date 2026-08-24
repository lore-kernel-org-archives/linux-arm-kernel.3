Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D961C5DF9B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 13:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vAE6rfAHaXAtrVTJwnoUcnHs4BjSY9cziCo40xej1Wk=; b=IhkPZ+3oL+9Su42EmJ9E12X1t9
	SItcfGRzOEiZtC0aVZuHggcS+36lahRuJ/cVqet29C9r8NoFo+v3hIxNWA1FhNGiMjXtQzu9eMaAn
	i9Snuta5VLBkGwPZEtZT5EjeGnqQ7e0H8u9EVs/EmoakR5HswzB6AcmA0SEGsgDlMkzHjLAhY0a0Y
	fn+RbLHt12jNtnrELU8CExvZAlMfsRD6yDm9yqixJuICRVQAn0dTkRUsL4zySPXneGU14bNtJyqNs
	bkYSCNplrDCTI9ZDbO7XJlohVvQrwOHDOE/QrTgBeEK14+CYab/nMo19FpLQXxrbeOM6TyEZdTwCJ
	jGBUdS2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyUsd-0000000GiKO-2vMw;
	Mon, 24 Aug 2026 13:38:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyUsa-0000000GiJi-2fm3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 13:38:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5FC9116F2;
	Mon, 24 Aug 2026 06:38:17 -0700 (PDT)
Received: from [10.2.198.93] (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C1E2E3F7D8;
	Mon, 24 Aug 2026 06:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787578701; bh=GYHYebrAL0+TRGK1g/XM7dg2jWMltwNxv4cPMxYybAM=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=RWUiqeLt7NX7jbsLD82QYFKmXgk2WxNgYjzJ3ekuCXsrhEXDkcW+uYrXfIfvQxHq7
	 2U+0v99DzGABm3HSj5KMTL6yM9MrCnAEVnkpTGTR/WYkC6h9JmJuF1FVw+fgGBOV57
	 0iTGwq0s0qiaXaxLuMA0MmLt4wRf+rXHS5zxmH7Q=
Message-ID: <67ab6c51-4511-46ab-931b-a4323551147a@arm.com>
Date: Mon, 24 Aug 2026 14:38:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: usama.anjum@arm.com, Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev
Subject: Re: [PATCH] arm64: clear_page[s] using memset
To: Linus Walleij <linusw@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Ryan Roberts <ryan.roberts@arm.com>
References: <20260306-aarch64-clear-pages-c-v1-1-77c1bb0f1c21@kernel.org>
 <ac7YJPo4Np2zxxEp@arm.com>
 <CAD++jL=G81=ueo7djqUETToE459kpFGniWvBwnYbJtmXrm8MFw@mail.gmail.com>
 <adULAT2xus5z3HdQ@arm.com>
 <CAD++jLmMxj1C7sGz-Yt8Y+NC1CbrUTTSH4QvcZfYuJAcNoYYCQ@mail.gmail.com>
From: Usama Anjum <usama.anjum@arm.com>
Content-Language: en-US
In-Reply-To: <CAD++jLmMxj1C7sGz-Yt8Y+NC1CbrUTTSH4QvcZfYuJAcNoYYCQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_063824_779690_66723C4F 
X-CRM114-Status: GOOD (  19.48  )
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

On 08/04/2026 8:47 am, Linus Walleij wrote:
> On Tue, Apr 7, 2026 at 3:47 PM Catalin Marinas <catalin.marinas@arm.com> wrote:
>> On Tue, Apr 07, 2026 at 11:25:55AM +0200, Linus Walleij wrote:
>>> Quoting my own commit message hehe:
>>>
>>>> No performance regressions can be seen, the fastpath
>>>> benchmarks differences are in the noise.
>>>
>>> This was tested on hardware with Ryan Robert's fastpath tool.
>>
>> BTW, have you tried the perf bench mmap test again with the new
>> clear_page? Both with single page and multiple pages scenarios. And
>> ideally on more than one platform.
>>
>> Will pointed out (in a private chat) that current clear_page() uses
>> non-temporal stores while memset() doesn't. It may not make any
>> difference in practice but it would be good to have some numbers.
> 
> Hm interesting point, the perf bench mmap test isn't specifically
> in fastpath but since it tends to come up I guess we can add it?
> 
> Ryan: is it easy to add this test to fastpath? Or easy for me to do
> myself? I looked at the instructions but they were a bit intimidating...
> 
> The test is the following:
> 
>     We boot the kernel with cmdline like this:
>     "default_hugepagesz=1G hugepagesz=1G hugepages=32" to make sure
>     we have ample hugepages. This was then tested with the same
>     cmdline as the original series:
> 
>     perf bench mem mmap -p 1GB -f demand -s 32GB -l 5
> 
>     The first run was discarded as the memory hierarchy is cold on
>     the first run. Then I ran the above command 5 times and averaged
>     the throughput

I've ran tests for with 1 warmup and 3 repeats in 4 sessions (12 times). 

Results for SUT Class aws-m7g.metal:
╭─────────────┬────────────────────────────────────────────────┬───────────────────────────────────────────────┬───────────────────────────────────────────╮
│ Benchmark   │ Result Class                                   │   next-20260821 without this patch (base)     │   next-20260821 with this patch           │
├─────────────┼────────────────────────────────────────────────┼───────────────────────────────────────────────┼───────────────────────────────────────────┤
│ perf/mem    │ memset -k 1GB -f default -s 16GB (bytes/sec)   │                                63932542232.12 │                                     1.92% │
│             │ mmap -p 1GB -f demand -s 32GB -l 5 (bytes/sec) │                                63272579168.03 │                                    -0.57% │
│             │ mmap -p 4KB -f demand -s 32GB -l 5 (bytes/sec) │                                49692830849.48 │                                    -1.11% │
╰─────────────┴────────────────────────────────────────────────┴───────────────────────────────────────────────┴───────────────────────────────────────────╯

Results for SUT Class cesw-aarch64-ampereone-1s-a192-32x:
╭─────────────┬────────────────────────────────────────────────┬───────────────────────────────────────────────┬───────────────────────────────────────────╮
│ Benchmark   │ Result Class                                   │   next-20260821 without this patch (base)     │   next-20260821 with this patch           │
├─────────────┼────────────────────────────────────────────────┼───────────────────────────────────────────────┼───────────────────────────────────────────┤
│ perf/mem    │ memset -k 1GB -f default -s 16GB (bytes/sec)   │                                33895562998.71 │                                     0.25% │
│             │ mmap -p 1GB -f demand -s 32GB -l 5 (bytes/sec) │                                34338454210.17 │                                     1.16% │
│             │ mmap -p 4KB -f demand -s 32GB -l 5 (bytes/sec) │                                25687107580.90 │                                    -0.85% │
╰─────────────┴────────────────────────────────────────────────┴───────────────────────────────────────────────┴───────────────────────────────────────────╯


> 
> The x86 commit cb431accb36e51b64ce34b5cc4d5ed292895fd84
> also mentions this test:
> 
> perf bench mem memset -k 1GB -f default -s 16GB
> 
> I tried it on QEMU, no real benefits with either the previous or this
> patch, and no regressions either. (x86 passes -f x86-64-stosq
> which are some optimized memset instructions)
> 
> Yours,
> Linus Walleij
> 

Thanks,
Usama


