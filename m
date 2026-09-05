Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39FADC624DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 15:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WkTxrdiPtb120sX9TKnjMh5DPVxZ2gJIoYJu4yxR7vI=; b=PS7Wkmhn8+sfPYjRhPv092mO8N
	rAESs7T259hhlB3BxP2HxkmZqMp4UD5fUtFo+CzHHYv0xhe+q1wTpNAerryiMntRZ5UrJ6RZUuv5i
	pytsPD32ZxShELIACDYaDDFSFz5WRwgSgJYFWkUD4O3QcI4hNlBxq7/SKL+7ASGYmzekuL378uaw7
	MaCWSPaOrKmclwLCsH+Hiex7ZPvjz1ppa0cEMhbN8cStxUBnBPhcnTINck3hBI29+d5YBvcKLvWxw
	b6kdvsVhBunfEEfW4cfEObmFEInhaPePj7a6PYq0gFOqNUVcO4Vm9/PYQRIbrcWYyo2egVYZgHv7D
	y8Squ+Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2seD-00000004F0i-1GNr;
	Sat, 05 Sep 2026 15:49:41 +0000
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2seA-00000004F0J-2Fyh
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 15:49:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788623376; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=WkTxrdiPtb120sX9TKnjMh5DPVxZ2gJIoYJu4yxR7vI=;
	b=N3HMB51826UiNem/Epm7S0sdcbCAFWbkbHkjXCYz+azWNf4T7Em37YKHjPLWRrEG7izT94WffzShOJHCqJtbA1KM+w+qxbLqC0RzoFK+kyTPxLF64AkaHyLaDjSktL4JNbOZbYqPSZwEq8i53Badoboe2nwJDC3QHGs1qhCW7bY=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=xueshuai@linux.alibaba.com;NM=1;PH=DS;RN=15;SR=0;TI=SMTPD_---0XALG-eb_1788623373;
Received: from 30.100.134.114(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0XALG-eb_1788623373 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 05 Sep 2026 23:49:34 +0800
Message-ID: <2bde734c-eb86-4c7a-958d-b431e6d13671@linux.alibaba.com>
Date: Sat, 5 Sep 2026 23:49:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/6] KVM: arm64: nv: Implement nested stage-2 reverse
 map (new data structure)
To: Wei-Lin Chang <weilin.chang@arm.com>, Marc Zyngier <maz@kernel.org>
Cc: Wang Han <wanghan@linux.alibaba.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org, oupton@kernel.org, tabba@google.com,
 joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com,
 catalin.marinas@arm.com, will@kernel.org, ljs@kernel.org,
 itaru.kitayama@fujitsu.com
References: <20260810205038.118843-1-weilin.chang@arm.com>
 <20260902163500.1841671-1-wanghan@linux.alibaba.com>
 <877bl26aqg.wl-maz@kernel.org>
 <wsnf276xrun3g4hjr3t6alprapctg5z4kpj422v3hujqdjnrsa@swq4blkqvvj5>
 <875x0l5udh.wl-maz@kernel.org>
 <eylfcgxs2xzu57czyuhkpmum45lpxyccyu2yh3mipr67aq3xo6@xinygxzavoja>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <eylfcgxs2xzu57czyuhkpmum45lpxyccyu2yh3mipr67aq3xo6@xinygxzavoja>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_084938_771985_F9924F48 
X-CRM114-Status: GOOD (  26.70  )
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



On 9/5/26 6:42 AM, Wei-Lin Chang wrote:
> On Fri, Sep 04, 2026 at 08:49:14AM +0100, Marc Zyngier wrote:
> 
> [...]
> 
>>>>>
>>>>> The L1 was started with 8 vCPUs and 32 GiB of RAM using:
>>>>>
>>>>>    qemu-system-aarch64 -smp 8 -m 32G \
>>>>>      -machine virt,accel=kvm,gic-version=3,virtualization=on \
>>>>>      -cpu host -nographic -enable-kvm \
>>>>>      -drive if=pflash,format=raw,readonly=on,file=pflash0_bak.img \
>>>>>      -drive if=pflash,format=raw,file=pflash1_bak.img \
>>>>>      -drive file=./ubuntu-vm.qcow2,format=qcow2,if=virtio,cache=none,aio=native \
>>>>>      -nic user,model=virtio-net-pci,hostfwd=tcp::11234-:22 \
>>>>>      -serial mon:stdio
>>>>>
>>>>
>>>> Puzzling. If you are only running an L1 in VHE mode, there is no
>>>> shadow S2, and therefore nothing to unmap. For shadow S2s to be built
>>>> and affect the MMU notifiers, you need to run an L2.
>>>
>>> I was thinking the same at first, but realized even with L1 in VHE mode
>>> there is a small period of time where L1 runs in its EL1 during boot, so
>>> one nested MMU will become valid for each vCPU. That causes
>>> kvm_nested_s2_unmap() to iterate through the entire IPA space 8 times
>>> (-smp 8).
>>
>> It should be one nested MMU for the whole VM, not one per vcpu.
>> That's assuming they share the same VMID+VTCR.
>>
>>> What I am curious about is whether one single notifier unmap is enough
>>> to hang L1, or were there multiple notifier unmaps.
>>>
>>> QEMU with -machine virt uses 40 IPA bits only, unmapping that takes:
>>> 1024  (4KB pages,  unmapping 1GB per iteration)
>>> 32768 (16KB pages, unmapping 32MB per iteration)
>>> 2048  (64KB pages, unmapping 512MB per iteration)
>>> iterations for each page size. There aren't many mappings in each
>>> iteration too. Does this really take that long on real hardware (even if
>>> this must be done 8 times)?
>>
>> This should be close to being at zero cost, so something else is
>> amiss.
>>
> 
> Guess what? I am completely wrong once again.
> 
> The complete range of the nested mmus isn't about the value
> supplied by KVM_VM_TYPE_ARM_IPA_SIZE. Instead it is the PARange exposed
> to the guest. That's because the guest hypervisor is allowed to expose
> whatever memory map it likes to its nested guests, as long as it is
> within the guest's PARange. This is explained clearly in
> init_nested_s2_mmu().
> 
> Now the PARange exposed to guests should be much larger than 40bits. On
> the neoverse-n2 it should be 48bits (256TB), therefore the iterations
> required for each unmapping would be 256x:
> 
> 262144  (4KB pages,  unmapping 1GB per iteration)
> 8388608 (16KB pages, unmapping 32MB per iteration)
> 524288  (64KB pages, unmapping 512MB per iteration)
> 
> I think these numbers match the hang time Shuai have shown.
> 
> Just to demonstrate the difference I have tried manually limiting
> kvm_ipa_limit to 40, and tested with software emulation. Before the
> manual change a kvm_nested_s2_unmap() finished after 42 seconds, after
> limiting kvm_ipa_limit kvm_nested_s2_unmap() can finish in less than a
> second.

Hi Wei-Lin,

Your PARange analysis is what this whole diagnosis rests on -- the
48-bit/256x arithmetic is exactly right, and our ftrace data confirms
it to the chunk: every full-IPA kvm_nested_s2_unmap() in our traces
walks precisely 262,144 1GB chunks, the number from your table. The
kvm_ipa_limit=40 experiment also pointed straight at the answer. I'd
only push back on the last sentence:

> 
> With this, I think there aren't other underlying issues, it just is that
> slow unfortunately..


I don't think it is "just that slow" -- I think it is a specific
regression, and your own data localizes it better than the conclusion
suggests.

The thing is, kvm_ipa_limit=40 cannot tell *what* each chunk spends
its ~3.3us on, because the walk is also per-chunk: cutting the chunk
count by 256x shrinks both terms together, whichever one dominates.
The experiment that separates them is one where the chunk count does
not change at all.

We ran that experiment. Details are in my reply to Marc, but the
short version:

   - Before: 877ms per callback, 262,144 chunk calls, 262,144
     broadcasts. Chunk count and broadcast count are exactly equal
     (8,476,033 = 8,476,033 over the trace window) -- every chunk
     ends in a broadcast, mapped or not. Per chunk, ~4.6us of the
     ~5.1us is inside kvm_tlb_flush_vmid_range(); the walk of an
     empty chunk is ~0.2us. In an uncontended numad episode, 87% of
     the 1312ms is flush time and 8% is walk time.

   - After conditioning the flush on the walk having actually cleared
     a valid leaf (the candidate fix in my other mail): same 262,144
     chunks, same walk, ~110ms instrumented. Nothing about the walk
     changed -- ~3.1us of the per-chunk 3.3us was the broadcast.

   - And the table really is empty, as Marc says: with the flush
     count acting as a detector, the first full-IPA unmap of the boot
     issues 2 flushes (the EL1-boot-period mappings, a few dozen
     pages in two 1GB chunks); all 35 subsequent ones issue zero.

The code history agrees. Before 7657ea920c54, the TLBI lived inside
stage2_put_pte()'s 'if (kvm_pte_valid(ctx->old))' -- an empty walk
issued zero invalidations, ever. v6.6 hoisted the invalidation out
to the end of kvm_pgtable_stage2_unmap() to batch it into one range
TLBI per call, but the condition got dropped on the way. So "since
v6.6, the cost is proportional to the IPA range, not to the number
of mappings" -- which is precisely why the empty table pays in full,
and why I'd frame it as a fixable regression rather than an inherent
cost.

None of this subtracts from your PARange finding -- it depends on
it. The 42s -> <1s result was the 256x chunk scaling; the remaining
<1s is what the conditional flush removes.

Thanks,
Shuai



