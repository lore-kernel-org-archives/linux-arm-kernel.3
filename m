Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED4CC54F30
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 07:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nC+HhywLhja+geZgrACU7GlqxjOQzMPIjfQPseHiQK4=; b=MHhRNS5gcDEh9F6qus6VWqZd1R
	gpSGcelUDv3EVyZB+pEFcr4aTadBLLTt6G6myxo85Vg2ffU7Mq0vE0ySV2MmV3T+m7uc7Lz2GvSHm
	DWrlPPvo+0NN7z6d+G020L8N41Uw4qR1OTZFJMhe94c1glH3fVt80KVIPtat9CdSbSsLMB2AZdCXZ
	+OWig/b0iE+ar9Ro0OSdOlEH5DlE6FwSUz4pPDPUReWkQwiP4tS4aQ5uKRMKeuTLegRGMqJu2Cg4E
	aBHdzoZfaLoZKwaQo4j/rvE1NqZnFRjdTy1Hpl8+i+J/d1Khb9zP7pwmaAu6eJmkf6SNaeChXAZ7U
	q3dcs0xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKu2e-0000000HQll-3Wtc;
	Fri, 30 May 2025 07:20:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKtzS-0000000HQBJ-1BqW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 07:17:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 700BF16F8;
	Fri, 30 May 2025 00:17:00 -0700 (PDT)
Received: from [10.57.95.14] (unknown [10.57.95.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7A91D3F5A1;
	Fri, 30 May 2025 00:17:15 -0700 (PDT)
Message-ID: <1cc04c6b-ba0f-4e7f-ab85-46c364c66300@arm.com>
Date: Fri, 30 May 2025 08:17:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 PATCH 0/6] arm64: support FEAT_BBM level 2 and large block
 mapping when rodata=full
Content-Language: en-GB
To: Yang Shi <yang@os.amperecomputing.com>, will@kernel.org,
 catalin.marinas@arm.com, Miko.Lenczewski@arm.com,
 scott@os.amperecomputing.com, cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Dev Jain <dev.jain@arm.com>
References: <20250304222018.615808-1-yang@os.amperecomputing.com>
 <4794885d-2e17-4bd8-bdf3-8ac37047e8ee@os.amperecomputing.com>
 <5c6d9706-7684-4288-b630-c60b3766b13f@arm.com>
 <4d02978c-03c0-48fe-84eb-0f3fa0c54fea@os.amperecomputing.com>
 <912c3126-8ba7-4c3a-b168-438f92e89217@arm.com>
 <2ab5f65c-b9dc-471c-9b61-70d765af285e@os.amperecomputing.com>
 <239d4e93-7ab6-4fc9-b907-7ca9d71f81fd@arm.com>
 <1141d96c-f785-48ee-a0f6-9ec658cc11c2@os.amperecomputing.com>
 <9cdb027c-27db-4195-825d-1d63bec1b69b@os.amperecomputing.com>
 <e3e6a3e0-3012-4d95-9236-4b4d57c7974c@arm.com>
 <0769dbcb-bd9e-4c36-b2c1-a624abaeb5ce@os.amperecomputing.com>
 <e8d74579-2e32-424f-bfed-5d3eb33b0a07@os.amperecomputing.com>
 <c44cb356-112d-4dd8-854b-82212ee4815f@arm.com>
 <936cc91a-b345-4e52-9cb5-922c9810c469@arm.com>
 <a1ff2646-f429-4626-8541-19c7f301fc23@os.amperecomputing.com>
 <d1226612-7ad8-4405-93a7-28148699ce45@arm.com>
 <c2625558-a63e-4a63-a893-d2a31b3cc559@os.amperecomputing.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <c2625558-a63e-4a63-a893-d2a31b3cc559@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_001718_412159_7E2DC126 
X-CRM114-Status: GOOD (  33.22  )
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

On 29/05/2025 20:52, Yang Shi wrote:
>>>> I just had another conversation about this internally, and there is another
>>>> concern; we obviously don't want to modify the pgtables while other CPUs that
>>>> don't support BBML2 could be accessing them. Even in stop_machine() this may be
>>>> possible if the CPU stacks and task structure (for example) are allocated
>>>> out of
>>>> the linear map.
>>>>
>>>> So we need to be careful to follow the pattern used by kpti; all secondary CPUs
>>>> need to switch to the idmap (which is installed in TTBR0) then install the
>>>> reserved map in TTBR1, then wait for CPU 0 to repaint the linear map, then have
>>>> the secondary CPUs switch TTBR1 back to swapper then switch back out of idmap.
>>> So the below code should be ok?
>>>
>>> cpu_install_idmap()
>>> Busy loop to wait for cpu 0 done
>>> cpu_uninstall_idmap()
>> Once you have installed the idmap, you'll need to call a function by its PA so
>> you are actually executing out of the idmap. And you will need to be in assembly
>> so you don't need the stack, and you'll need to switch TTBR1 to the reserved
>> pgtable, so that the CPU has no access to the swapper pgtable (which CPU 0 is
>> able to modify).
>>
>> You may well be able to reuse __idmap_kpti_secondary in proc.S, or lightly
>> refactor it to work for both the existing idmap_kpti_install_ng_mappings case,
>> and your case.
> 
> I'm wondering whether we really need idmap for repainting. I think repainting is
> different from kpti. We just split linear map which is *not* used by kernel
> itself, the mappings for kernel itself is intact, we don't touch it at all. So
> as long as CPU 0 will not repaint the linear map until all other CPUs busy
> looping in stop_machine fn, then we are fine.

But *how* are the other CPUs busy looping? Are they polling a variable? Where
does that variable live? The docs say that a high priority thread is run for
each CPU. So there at least needs to be a task struct and a stack. There are
some Kconfigs where the stack comes from the linear map, so if the variable that
is polls is on its stack (or even on CPU 0's stack then that's a problem. If the
scheduler runs and accesses the task struct which may be allocated from the
linear map (e.g. via kmalloc), that's a problem.

The point is that you have to understand all the details of stop_machine() to be
confident that it is never accessing the linear map. And even if you can prove
that today, there is nothing stopping from the implementation changing in future.

But then you have non-architectural memory accesses too (i.e. speculative
accesses). It's possible that the CPU does a speculative load, which causes the
TLB to do a translation and cache a TLB entry to the linear map. Then CPU 0
changes the pgtable and you have broken the BBM requirements from the secondary
CPU's perspective.

So personally I think the only truely safe way to solve this is to switch the
secondary CPUs to the idmap, then install the reserved map in TTBR1. That way,
the secondary CPUs can't see the swapper pgtable at all and CPU 0 is free to do
what it likes.

> 
> We can have two flags to control it. The first one should be a cpu mask, all
> secondary CPUs set its own mask bit to tell CPU 0 it is in stop machine fn
> (ready for repainting). The other flag is used by CPU 0 to tell all secondary
> CPUs repainting is done, please resume. We need have the two flags in kernel
> data section instead of stack.
> 
> The code of fn is in kernel text section, the flags are in kernel data section.
> I don't see how come fn (just doing simple busy loop) on secondary CPUs need to
> access linear map while repainting the linear map. After repainting the TLB will
> be flushed before letting secondary CPUs resume, so any access to linear map
> address after that point should be safe too.
> 
> Does it sound reasonable to you? Did I miss something?

I think the potential for speculative access is the problem. Personally, I would
follow the pattern laid out by kpti. Then you can more easily defend it by
pointing to an established pattern.

Thanks,
Ryan

> 
> Thanks,
> Yang
> 
>>
>> Thanks,
>> Ryan
>>
>>>> Given CPU 0 supports BBML2, I think it can just update the linear map live,
>>>> without needing to do the idmap dance?
>>> Yes, I think so too.
>>>
>>> Thanks,
>>> Yang
>>>
>>>> Thanks,
>>>> Ryan
>>>>
>>>>
>>>>> Thanks,
>>>>> Ryan
>>>>>
> 


