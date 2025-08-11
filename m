Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B591BCA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 18:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iK2McGU9OO4eh35vhn+HE9Ge1tIJXywTspirp7UkxHE=; b=b7rfhcKaA1zax8
	TBpFKJOtqINxDlfjin7x+j7SAAuuuo5d0ODj16GbQm2PwveLLQ90v7YE9j/vQOyRa4ePM5e2hIy11
	XZg64TSkKfGYhpzQFDte2WqxoODZWGVrqCWPMl0KAfxMfB/TZ1UA0dvQUf+fMYDK+kJpPm3dpGKW2
	i96S7X2Q8TOHtj/KkJPbJb7jBuHYrKYxDQA42iEOzvFDLr18jjNzT6KOfi+RnjlE704eFb34/5ym4
	++NVxbAJbhQ+wdmnxy6DH3/mLbsdSzzE/nt5STKRyGh49/Ekny6CINL4qp09n05b+RAXwvoFTxcg4
	3HcV+6L/7fRcpII9BRsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulXg2-00000008qbe-4AQ0;
	Mon, 11 Aug 2025 18:55:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUzP-00000008K15-1Jya
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 16:03:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 387D9266C;
	Mon, 11 Aug 2025 09:03:02 -0700 (PDT)
Received: from [10.1.28.163] (e137867.arm.com [10.1.28.163])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4CEB73F738;
	Mon, 11 Aug 2025 09:03:06 -0700 (PDT)
Message-ID: <a3a8c0b8-e953-4c93-ab4d-0d9a4b3e47b1@arm.com>
Date: Mon, 11 Aug 2025 17:03:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v7 0/7] arm64: entry: Convert to generic irq entry
To: Jinjie Ruan <ruanjinjie@huawei.com>
References: <20250729015456.3411143-1-ruanjinjie@huawei.com>
 <6bd09b5b-9830-42b4-ad9e-9ad1e153e564@arm.com>
 <94757d00-5a8e-ac6b-f832-030f33ccf771@huawei.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US
Organization: Arm Ltd.
In-Reply-To: <94757d00-5a8e-ac6b-f832-030f33ccf771@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_090311_402175_039EF286 
X-CRM114-Status: GOOD (  13.78  )
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
Cc: mark.rutland@arm.com, sstabellini@kernel.org, puranjay@kernel.org, anshuman.khandual@arm.com, catalin.marinas@arm.com, liaochang1@huawei.com, oleg@redhat.com, kristina.martsenko@arm.com, linux-kernel@vger.kernel.org, broonie@kernel.org, chenl311@chinatelecom.cn, xen-devel@lists.xenproject.org, leitao@debian.org, ryan.roberts@arm.com, akpm@linux-foundation.org, mbenes@suse.cz, will@kernel.org, ardb@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 06/08/2025 09:11, Jinjie Ruan wrote:

> On 2025/8/5 23:08, Ada Couprie Diaz wrote:
>> Hi Jinjie,
>>
>> On 29/07/2025 02:54, Jinjie Ruan wrote:
>>
>>> Since commit a70e9f647f50 ("entry: Split generic entry into generic
>>> exception and syscall entry") split the generic entry into generic irq
>>> entry and generic syscall entry, it is time to convert arm64 to use
>>> the generic irq entry. And ARM64 will be completely converted to generic
>>> entry in the upcoming patch series.
>> Note : I had to manually cherry-pick a70e9f647f50 when pulling the series
>> on top of the Linux Arm Kernel for-next/core branch, but there might be
>> something I'm missing here.
> It seems that it is now in mainline v6.16-rc1 and linux-next but not
> Linux Arm Kernel for-next/core branch.
You're right, I misinterpreted the `-next` of the subject, thanks for the
clarification !
>> I'll spend some time testing the series now, specifically given patch 6's
>> changes, but other than that everything I saw made sense and didn't look
>> like it would be of concern to me.
> Thank you for the test and review.

I've spent some time testing the series with a few different configurations,
including PREEMPT_RT, pNMI, various lockup and hang detection options,
UBSAN, shadow call stack, and various CONFIG_DEBUG_XYZ (focused on locks
and IRQs), on both hardware (AMD Seattle) and KVM guests.

I tried to generate a diverse set of interrupts (via debug exceptions,
page faults, perf, kprobes, swapping, OoM) while loading the system with
different workloads, some generating a lot of context switches : hackbench
and signaltest from rt-tests[0], and mc-crusher[1], a memcached stress-test.

I did not have any issues, nor any warning reported by the various
debug features during all my hours of testing, so it looks good !

Tested-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>

Thank you for the series !
Ada

[0]: https://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git/
[1]: https://github.com/memcached/mc-crusher


