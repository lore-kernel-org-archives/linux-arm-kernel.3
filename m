Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2BD3C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 05:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I+8F8hBM1FH/hY4FxHKuK4OgjDFeNh9sq1bjn5L2+Pw=; b=oWLsvBBSqFs9ueFl7q1leTjOlB
	PLRRE8vxxxwtCRrCguXxaNPRLZHbQBNrSNW0VdiWLNbvEux6BPpkgwPkWflv/cCGRkEJ1r+tSzpS4
	3N0O4RIMK3o3Xmp83x3KNXwFszhNPjZjQvJren8wb9By4SlSp7LoS6aZheqtacHBUsLPCf9m5qnUF
	gSNZBdNqcqeTLW4X+ZhFOd01X8DT5PsNH62H9Y7uR8Z6ZOCs4fFi2M4XXO1pVyBWW0Ib23946xbvl
	xyapbOGVRq4zL1ZooVSN5OL5CbTFYujfo62cAeNtruWaeRTgeOWB7cZ+F4w3TrcxRsPcjsWQBASBh
	omhmk7OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn8Np-0000000FV3q-1hmO;
	Fri, 24 Jul 2026 05:23:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn8Nm-0000000FV3S-0AOa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 05:23:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B7651477;
	Thu, 23 Jul 2026 22:23:31 -0700 (PDT)
Received: from [10.163.131.137] (unknown [10.163.131.137])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 41F283F86F;
	Thu, 23 Jul 2026 22:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784870615; bh=1i4u4otkVI5znG05EU6gZh0TrJnwKTCfTYyzdv24rFE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iXV06N1Fmke+deu0gjEYmy8zxAhWOLq1NjiYhCnu0JyTg1gEw2MxjO9pVNDrP425j
	 2TlwgT4LFMFGowZ4zAxO9n88vJyaT13yiJhHZlKKA6+/6hAG86GJr99ZXmcNrDQ+2I
	 OhmN5GrlPbEciCOPhzLAZvrnMoghB+r1GTF+2vC8=
Message-ID: <a465cf1e-8466-451b-b0ab-ecc84c211756@arm.com>
Date: Fri, 24 Jul 2026 10:53:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: smp: distinguish secondary CPUs that hang after
 reaching head.S
To: Naman Jain <namjain@linux.microsoft.com>,
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
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <d52431ea-3166-459c-8f3d-988fdef63c32@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_222338_299357_CF5E694F 
X-CRM114-Status: GOOD (  20.26  )
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



On 24/07/26 10:16 AM, Naman Jain wrote:
> 
> 
> On 7/23/2026 11:26 AM, Anshuman Khandual wrote:
>>
>>
>> On 23/07/26 8:19 AM, Jinjie Ruan wrote:
>>>
>>> 在 2026/7/22 19:30, Naman Jain 写道:
>>>> When a secondary CPU fails to come online, __cpu_up() falls back to
>>>> __early_cpu_boot_status, but boot status 0x0 is ambiguous: it cannot
>>>> distinguish a CPU that never executed head.S (firmware/hypervisor never
>>>> dispatched it, so it never ran a single instruction) from one that
>>>> entered head.S, started executing, and then got stuck somewhere in kernel
>>>> bring-up. Add a change to let us tell those two cases apart, which
>>>> narrows down where to look when a CPU goes missing during boot.
>>> I previously encountered this issue when debugging the parallel startup
>>> of ARM64 secondary cores. It is difficult for the kernel to determine
>>> whether the secondary core is hung in the firmware or whether it has not
>>> executed a single instruction. So I think this motive is reasonable.
>>
>> Why should kernel determine the difference here ? Would not the firmware
>> know if it has started any secondary CPU for the kernel which must have
>> come inside head.S ? If the cpu gets hung inside firmware while starting
>> up then the debug responsibilities belong there instead.
>>
>> Still wondering what's the rationale for this change.
> 
> Hello Anshuman,
> This sounds fair to me. Let me elaborate the problem, beyond the scope of this patch. In production, we occasionally see these crashes where one of the CPU fails to bring up online, with 0x0 status code. Hypervisor may be missing the telemetry, but the problem is that we don't know if the secondary CPU ever started executing the instructions or is stuck somewhere between the start of head.S and marking itself online at the end of secondary_start_kernel().

Why that information is useful ? If firmware is sure to have dispatched
given CPU then should not the early kernel boot failure be debugged via
generally available methods. Is this trying create an alternative ?
> There are couple of places, where we get those other status codes, but not everywhere. If the issue is not easily reproducible, experiments on local setups do not yield anything. That's where I am attempting to add some more information in kernel to debug these issues.
But wondering if the intent is to further classify failures including
entered ASM, but failed else where during boot for ease in debugging
why not add more into CPU_STUCK_REASON_* ?

