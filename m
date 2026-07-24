Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDB07C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 08:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2rw6y/sxs9sPzKNdYkOwUr8B9CRiLfuTdglKA4rmF4E=; b=BoVdxu3r6YPuoM28/fVawWtCJk
	kXt7LtLdLNhVGJ11ujdU75/LehfMuOjFu1Wk0V44Jd2PbE9ldBF2NgC9ID2SeQlwfdTuFcONFBl68
	Epy2bku0WqaGJmRegnAQnJ0bwieIW7yGDBaTb2GUu1GVfTfqVqYzUh6vJRm4Lb2+6l4X2gQFPWuJ3
	FY2EjPhKX8xj+n5lOEOejJUxrMsVjQC5H/huqRxqS/DQbqGRQEbTS7IcZl8aw4r63VVIabX8dpHul
	/RediYJfYpNGJ0ibRAuHU470jotCcervFE2RWqnezpPfXS+g8CpJxOlD9LmS2jnQ5iJKWWBeQyzp4
	arDEtyJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnArC-0000000FkXG-136v;
	Fri, 24 Jul 2026 08:02:10 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnArA-0000000FkWP-0ssm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 08:02:09 +0000
Received: from [192.168.0.105] (unknown [4.194.122.170])
	by linux.microsoft.com (Postfix) with ESMTPSA id 983A520B7167;
	Fri, 24 Jul 2026 01:01:49 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 983A520B7167
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1784880113;
	bh=2rw6y/sxs9sPzKNdYkOwUr8B9CRiLfuTdglKA4rmF4E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=McSP4NbPaH1W9QrlrA4uRWhgzCvqGUOr0rwwS0HZSABmzWZa3g9jN/sch1Vr6vR39
	 7R2wd6DQNvaiGpMES2vE7YANQCD5R+7AHLTpQRG5mUJV6XVziw9WtKB1KWCeTxGXNK
	 7g0Qi8Db1YgWlgymJYltA2dTxU+qq3ONay0RSaA8=
Message-ID: <8ddb4f1e-eb14-478e-a76e-8483b75bfa48@linux.microsoft.com>
Date: Fri, 24 Jul 2026 13:31:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: smp: distinguish secondary CPUs that hang after
 reaching head.S
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 Jinjie Ruan <ruanjinjie@huawei.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, Thomas Huth <thuth@redhat.com>,
 Fuad Tabba <fuad.tabba@linux.dev>, Thomas Gleixner <tglx@kernel.org>,
 Pengjie Zhang <zhangpengjie2@huawei.com>,
 mrigendrachaubey <mrigendra.chaubey@gmail.com>,
 Saurabh Sengar <ssengar@linux.microsoft.com>
References: <20260722113044.1835365-1-namjain@linux.microsoft.com>
 <6e13c10f-ccc2-48c3-bf8a-d65133a33e17@huawei.com>
 <70e8596f-7316-4cc9-90e8-ff06a94c4616@arm.com>
 <d52431ea-3166-459c-8f3d-988fdef63c32@linux.microsoft.com>
 <a465cf1e-8466-451b-b0ab-ecc84c211756@arm.com>
Content-Language: en-US
From: Naman Jain <namjain@linux.microsoft.com>
In-Reply-To: <a465cf1e-8466-451b-b0ab-ecc84c211756@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_010208_284954_69A2A0F3 
X-CRM114-Status: GOOD (  23.76  )
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



On 7/24/2026 10:53 AM, Anshuman Khandual wrote:
> 
> 
> On 24/07/26 10:16 AM, Naman Jain wrote:
>>
>>
>> On 7/23/2026 11:26 AM, Anshuman Khandual wrote:
>>>
>>>
>>> On 23/07/26 8:19 AM, Jinjie Ruan wrote:
>>>>
>>>> 在 2026/7/22 19:30, Naman Jain 写道:
>>>>> When a secondary CPU fails to come online, __cpu_up() falls back to
>>>>> __early_cpu_boot_status, but boot status 0x0 is ambiguous: it cannot
>>>>> distinguish a CPU that never executed head.S (firmware/hypervisor never
>>>>> dispatched it, so it never ran a single instruction) from one that
>>>>> entered head.S, started executing, and then got stuck somewhere in kernel
>>>>> bring-up. Add a change to let us tell those two cases apart, which
>>>>> narrows down where to look when a CPU goes missing during boot.
>>>> I previously encountered this issue when debugging the parallel startup
>>>> of ARM64 secondary cores. It is difficult for the kernel to determine
>>>> whether the secondary core is hung in the firmware or whether it has not
>>>> executed a single instruction. So I think this motive is reasonable.
>>>
>>> Why should kernel determine the difference here ? Would not the firmware
>>> know if it has started any secondary CPU for the kernel which must have
>>> come inside head.S ? If the cpu gets hung inside firmware while starting
>>> up then the debug responsibilities belong there instead.
>>>
>>> Still wondering what's the rationale for this change.
>>
>> Hello Anshuman,
>> This sounds fair to me. Let me elaborate the problem, beyond the scope of this patch. In production, we occasionally see these crashes where one of the CPU fails to bring up online, with 0x0 status code. Hypervisor may be missing the telemetry, but the problem is that we don't know if the secondary CPU ever started executing the instructions or is stuck somewhere between the start of head.S and marking itself online at the end of secondary_start_kernel().
> 
> Why that information is useful ? If firmware is sure to have dispatched
> given CPU then should not the early kernel boot failure be debugged via
> generally available methods. Is this trying create an alternative ?

I am trying to cover the cases, where the kernel does not know that it
is stuck, and can thus cannot handle that scenario. Existing
CPU_STUCK_IN_KERNEL status with CPU_STUCK_REASON_* are applied only
after the kernel detects that something failed.

Generally available methods, like adding breakpoints, debug logs and
traces, is not always possible due to production system limitations and
limited reproducibility of issues.

>> There are couple of places, where we get those other status codes, but not everywhere. If the issue is not easily reproducible, experiments on local setups do not yield anything. That's where I am attempting to add some more information in kernel to debug these issues.
> But wondering if the intent is to further classify failures including
> entered ASM, but failed else where during boot for ease in debugging
> why not add more into CPU_STUCK_REASON_* ?

If we agree on the requirement for this, I can then reuse
CPU_STUCK_IN_KERNEL with new CPU_STUCK_REASON_* variables, to
proactively mark the CPU as STUCK first and then making checkpoints
based on the boot-up progress, and finally changing the status to
CPU_BOOT_SUCCESS as usual.
I would be adding these checkpoints only on a few logical blocks of
secondary CPU boot flow to narrow down the problem.

Please let me know your thoughts on it.

Regards,
Naman

