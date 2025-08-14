Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D54C0CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 10:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ygZfgiTZMV+EL+IfOMEjIj+juU7ohm0BwyhvsotlUBk=; b=xR9lTWUERi7MTf/+XQ94AMFNZU
	mpC/vW1IWeJCft4r/6fVBM+xfvuWGb1UfkQLwhKC5C6E7nnDIYLe4RpJOALgtJD9e0FpdY0nBdYvH
	9AwRM80PvonzjRPPMhlB4RivLshERq48a+f3VW6DkDzRS1OPTeS2ROmjlSeqsdshgBEfIe5dsmkzZ
	RS3dQWCcA+FYSRbBmKJiDE+SfZdQmVn21VBoA7hEFBT1/WAPQkJ+C8i+XQtD1UHUQEzxeK3Yf7N94
	CaCRiGQtQpqJTfOjo55jOB6Ai+WH9lu7bH1ISr0/diPexqlAMNLWmC6QLjRDNvng92dHP4V6ecEra
	aPC4cy6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umVYX-0000000GfAw-1b3M;
	Thu, 14 Aug 2025 10:51:37 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umUPA-0000000GQc5-1XBX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 09:37:54 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4c2g7t6B27z2TT7M;
	Thu, 14 Aug 2025 17:35:06 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 51B151A0188;
	Thu, 14 Aug 2025 17:37:48 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 14 Aug 2025 17:37:46 +0800
Message-ID: <2530ba09-73eb-c0fd-5d77-4e6c5a0810a6@huawei.com>
Date: Thu, 14 Aug 2025 17:37:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next v7 0/7] arm64: entry: Convert to generic irq entry
Content-Language: en-US
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<sstabellini@kernel.org>, <mark.rutland@arm.com>, <puranjay@kernel.org>,
	<broonie@kernel.org>, <mbenes@suse.cz>, <ryan.roberts@arm.com>,
	<akpm@linux-foundation.org>, <chenl311@chinatelecom.cn>,
	<anshuman.khandual@arm.com>, <kristina.martsenko@arm.com>,
	<liaochang1@huawei.com>, <ardb@kernel.org>, <leitao@debian.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<xen-devel@lists.xenproject.org>
References: <20250729015456.3411143-1-ruanjinjie@huawei.com>
 <6bd09b5b-9830-42b4-ad9e-9ad1e153e564@arm.com>
 <94757d00-5a8e-ac6b-f832-030f33ccf771@huawei.com>
 <a3a8c0b8-e953-4c93-ab4d-0d9a4b3e47b1@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <a3a8c0b8-e953-4c93-ab4d-0d9a4b3e47b1@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_023752_719391_AFCAC56F 
X-CRM114-Status: GOOD (  15.89  )
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



On 2025/8/12 0:03, Ada Couprie Diaz wrote:
> On 06/08/2025 09:11, Jinjie Ruan wrote:
> 
>> On 2025/8/5 23:08, Ada Couprie Diaz wrote:
>>> Hi Jinjie,
>>>
>>> On 29/07/2025 02:54, Jinjie Ruan wrote:
>>>
>>>> Since commit a70e9f647f50 ("entry: Split generic entry into generic
>>>> exception and syscall entry") split the generic entry into generic irq
>>>> entry and generic syscall entry, it is time to convert arm64 to use
>>>> the generic irq entry. And ARM64 will be completely converted to
>>>> generic
>>>> entry in the upcoming patch series.
>>> Note : I had to manually cherry-pick a70e9f647f50 when pulling the
>>> series
>>> on top of the Linux Arm Kernel for-next/core branch, but there might be
>>> something I'm missing here.
>> It seems that it is now in mainline v6.16-rc1 and linux-next but not
>> Linux Arm Kernel for-next/core branch.
> You're right, I misinterpreted the `-next` of the subject, thanks for the
> clarification !
>>> I'll spend some time testing the series now, specifically given patch
>>> 6's
>>> changes, but other than that everything I saw made sense and didn't look
>>> like it would be of concern to me.
>> Thank you for the test and review.
> 
> I've spent some time testing the series with a few different
> configurations,
> including PREEMPT_RT, pNMI, various lockup and hang detection options,
> UBSAN, shadow call stack, and various CONFIG_DEBUG_XYZ (focused on locks
> and IRQs), on both hardware (AMD Seattle) and KVM guests.
> 
> I tried to generate a diverse set of interrupts (via debug exceptions,
> page faults, perf, kprobes, swapping, OoM) while loading the system with
> different workloads, some generating a lot of context switches : hackbench
> and signaltest from rt-tests[0], and mc-crusher[1], a memcached
> stress-test.
> 
> I did not have any issues, nor any warning reported by the various
> debug features during all my hours of testing, so it looks good !
> 
> Tested-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>

Thank you for your comprehensive testing and code review.

> 
> Thank you for the series !
> Ada
> 
> [0]: https://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git/
> [1]: https://github.com/memcached/mc-crusher
> 
> 

