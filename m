Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84AC2C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 02:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qnfm7fovWOX+j6wfodmeAAWV6fDVDcbfKK91UcQzEN4=; b=b6jNnct9NcpfTRVE9nxOSA5lm7
	Vr1loBhn0Lc5sfkGbs1KxHZ9SwjZMt2l1vcvzio1/BHO/kpXj3YlpJOvtLrpftAWCgb0PvsLVAfms
	q6o+eQ5bkxHuHq2iYAli1TVN7ZijP22jiNS0IVrz4x+Fzb154OGymsCoTyZZHkYSXT3AnQNTymRcB
	3hWyA74p4s7PYRY112Dve7mpNb9qVe5JbbXDqxLE+ox6TXlWvNxhQc1NTTULs71aWoqcUb2ghKV+X
	7KMkmMtGDUNMPqbaXIHktbfKEv69uq5Yevdk67G18ef0xwqtD53fh4ZsO/zM0w3dvGYgm7vdLJ8eL
	dWUIl0cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x32Qo-00000004ZSX-2sqG;
	Sun, 06 Sep 2026 02:16:30 +0000
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x32Ql-00000004ZS0-0Cch
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 02:16:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788660983; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=Qnfm7fovWOX+j6wfodmeAAWV6fDVDcbfKK91UcQzEN4=;
	b=qK8n+1Wzbm0tYJ4FRStsiT9IKcsz1/nCdk04/yIxdM3ANdFsaOZH3/1aCtrL5pJOM3E7oLH08pgzRr11dLMZ+s7uwEVV9zLHx8MPNNkDcdUuw+ifqp8q7LOG9DI9wBdoViJuhb/RX5gFOZzuDuUB23uiQ04HsV9Iy9RxGT2thQw=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R631e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=xueshuai@linux.alibaba.com;NM=1;PH=DS;RN=15;SR=0;TI=SMTPD_---0XAM6BTs_1788660980;
Received: from 30.100.134.114(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0XAM6BTs_1788660980 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sun, 06 Sep 2026 10:16:21 +0800
Message-ID: <e6c924eb-d9e1-46fa-959c-6fe278f24a80@linux.alibaba.com>
Date: Sun, 6 Sep 2026 10:16:19 +0800
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
 <2bde734c-eb86-4c7a-958d-b431e6d13671@linux.alibaba.com>
 <rytvo6a7sulfb2no2fclvtpggk4ekqzs6n6xkqlffldbzua4lz@rnskx6qj2cxy>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <rytvo6a7sulfb2no2fclvtpggk4ekqzs6n6xkqlffldbzua4lz@rnskx6qj2cxy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_191628_005265_8872E166 
X-CRM114-Status: GOOD (  31.52  )
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



On 9/6/26 7:48 AM, Wei-Lin Chang wrote:
> On Sat, Sep 05, 2026 at 11:49:32PM +0800, Shuai Xue wrote:
> 
> [...]
> 
>>
>> Hi Wei-Lin,
>>
>> Your PARange analysis is what this whole diagnosis rests on -- the
>> 48-bit/256x arithmetic is exactly right, and our ftrace data confirms
>> it to the chunk: every full-IPA kvm_nested_s2_unmap() in our traces
>> walks precisely 262,144 1GB chunks, the number from your table. The
>> kvm_ipa_limit=40 experiment also pointed straight at the answer. I'd
>> only push back on the last sentence:
>>
>>>
>>> With this, I think there aren't other underlying issues, it just is that
>>> slow unfortunately..
>>
>>
>> I don't think it is "just that slow" -- I think it is a specific
>> regression, and your own data localizes it better than the conclusion
>> suggests.
>>
>> The thing is, kvm_ipa_limit=40 cannot tell *what* each chunk spends
>> its ~3.3us on, because the walk is also per-chunk: cutting the chunk
>> count by 256x shrinks both terms together, whichever one dominates.
>> The experiment that separates them is one where the chunk count does
>> not change at all.
>>
>> We ran that experiment. Details are in my reply to Marc, but the
>> short version:
>>
>>    - Before: 877ms per callback, 262,144 chunk calls, 262,144
>>      broadcasts. Chunk count and broadcast count are exactly equal
>>      (8,476,033 = 8,476,033 over the trace window) -- every chunk
>>      ends in a broadcast, mapped or not. Per chunk, ~4.6us of the
>>      ~5.1us is inside kvm_tlb_flush_vmid_range(); the walk of an
>>      empty chunk is ~0.2us. In an uncontended numad episode, 87% of
>>      the 1312ms is flush time and 8% is walk time.
>>
>>    - After conditioning the flush on the walk having actually cleared
>>      a valid leaf (the candidate fix in my other mail): same 262,144
>>      chunks, same walk, ~110ms instrumented. Nothing about the walk
>>      changed -- ~3.1us of the per-chunk 3.3us was the broadcast.
>>
>>    - And the table really is empty, as Marc says: with the flush
>>      count acting as a detector, the first full-IPA unmap of the boot
>>      issues 2 flushes (the EL1-boot-period mappings, a few dozen
>>      pages in two 1GB chunks); all 35 subsequent ones issue zero.
>>
>> The code history agrees. Before 7657ea920c54, the TLBI lived inside
>> stage2_put_pte()'s 'if (kvm_pte_valid(ctx->old))' -- an empty walk
>> issued zero invalidations, ever. v6.6 hoisted the invalidation out
>> to the end of kvm_pgtable_stage2_unmap() to batch it into one range
>> TLBI per call, but the condition got dropped on the way. So "since
>> v6.6, the cost is proportional to the IPA range, not to the number
>> of mappings" -- which is precisely why the empty table pays in full,
>> and why I'd frame it as a fixable regression rather than an inherent
>> cost.
>>
>> None of this subtracts from your PARange finding -- it depends on
>> it. The 42s -> <1s result was the 256x chunk scaling; the remaining
>> <1s is what the conditional flush removes.
> 
> Thanks for the analysis!
> 
> I completely agree. My finding was only a small part of the full
> picture. I stopped at finding out the real iteration count and didn't
> realize 3-5us is a long time for a kvm_pgtable_stage2_unmap() on a empty
> table (thanks for the learning opportunity).
> 
> So, because there are no relevant tlb entries created in the first
> place, the per iteration TLBIs and barriers are mostly doing nothing
> useful and cause a 10x slowdown.

Hi Marc, Wei-Lin,

Thanks for pushing back on this. Let me try to give the
full picture (Wei-Lin, please correct me if I get any of it wrong).

## 1. The cost of one kvm_nested_s2_unmap()

         per-callback cost = (IPA range / 1GB) x per-chunk cost

With numbers:

                   chunks (range)   per-chunk cost          per callback
   current         262,144          ~3.55us (3.35 broadcast  ~877ms
                    (48-bit IPA)     + 0.2 walk, always)

The first factor is what Wei-Lin identified: the nested MMU covers
the guest PARange -- 48 bits here, not the 40 bits QEMU asked for --
so stage2_apply_range() calls kvm_pgtable_stage2_unmap() once per 1GB
chunk. The second factor is where the surprise was hiding: the
broadcast is unconditional, whether or not the chunk contained
anything.

Since both factors are large, there are two independent ways to bring
the product down:

                   chunks (range)   per-chunk cost          per callback
   current         262,144          ~3.55us (always)        ~877ms
   precise unmap   ~1               ~3.55us (always)        ~us
   (nested layer,
    Wei-Lin's
    interval-tree)
   conditional     262,144          ~0.2us when empty       ~110ms
   flush                                (~3.55us if it
   (pgtable layer,                       cleared something)
    below)

Each attack a different factor. Wei-Lin's patch shrinks the range to
the single chunk containing the migrated page; the conditional flush
keeps the full-range walk but stops paying the broadcast for chunks
that cleared nothing. Either one alone brings the per-callback cost
far below the point where consecutive callbacks can accumulate a
watchdog-relevant stall; they also compose.

## 2. Conditioning the flush: the how and the why

We tried the pgtable-layer variant: the walker counts valid leaf PTEs
it actually clears, and the deferred flush fires only if that count
is non-zero:

         ret = kvm_pgtable_walk(pgt, addr, size, &walker);
         if (stage2_unmap_defer_tlb_flush(pgt) && data.unmapped_leaves)
                 kvm_tlb_flush_vmid_range(pgt->mmu, addr, size);

Correctness: a non-zero count means at least one valid leaf was
cleared, and the flush covers the whole [addr, addr+size) range, a
superset of everything this call cleared. A zero count means no valid
PTE was cleared, so no core can hold a stale translation this call is
responsible for. Table entries keep their immediate
__kvm_tlb_flush_vmid_ipa() from stage2_unmap_put_pte(), and their
child leaves are counted as leaves within the same walk.

Same L1 QEMU bootup test, five 6-minute runs: per-callback 877ms -> ~110ms
instrumented (~40-80ms uninstrumented, the pure walk); broadcasts
8,476,033 -> 221 in total, of which 2 were for actual nested mappings
and the rest canonical flushes of the pages NUMA balancing really
migrated; the soft lockups are gone (0/5 runs). And it is a
pgtable-layer change, so every other sparse-range unmap caller --
canonical S2, pKVM -- stops paying the per-chunk broadcast whenever
the range is much larger than what is mapped in it.

## 3. Where the unconditional broadcast came from

The condition was not dropped deliberately; it is a casualty of
7657ea920c54 ("KVM: arm64: Use TLBI range-based instructions for
unmap", v6.6). That commit batched the per-PTE TLBI into one range
TLBI at the end of each kvm_pgtable_stage2_unmap() call. But in the
old stage2_put_pte(), the "only if a valid PTE was cleared" condition
was simply the *position* of the TLBI inside the 'if
(kvm_pte_valid(ctx->old))' block -- there was nothing to move, so
nothing was moved:

                          dense chunk         empty chunk
   pre-v6.6               262,144 TLBIs       0 TLBIs
   since v6.6              1 range TLBI       1 range TLBI

The dense column is a 260,000x win -- the case the commit was written
for (unmapping a fully populated memslot). The empty column is a
0 -> 1 regression per chunk, invisible as long as nobody unmaps
ranges that are simultaneously huge and empty. Before v6.6, the cost
of an unmap was proportional to the number of mappings; since, it is
proportional to the size of the IPA range. Nested virtualisation
plus NUMA balancing is, as far as we know, the first caller to do
exactly that, per notifier event, while holding the mmu_lock for
write -- 262,144 x 3.35us is the ~877ms we measured, and the vCPUs'
stall accumulates across consecutive callbacks until it crosses the
guest watchdog threshold (one event: 7 of 8 guest CPUs reporting
"stuck for 24-28s" within the same millisecond).

So the conditional flush is not an optimisation so much as restoring
the lost condition -- making empty unmaps behave like pre-v6.6 again.

## 4. The question

Do you think restoring the lost condition -- i.e. the pgtable-layer
fix above, conditioning the deferred flush on the walk having
actually cleared a valid leaf -- is worth submitting as a proper fix
for 7657ea920c54?

As far as we can tell it is a ~20-line change that
restores the pre-v6.6 semantics with no new ones: empty and sparse
unmaps cost the walk again, dense unmaps keep the range-TLBI win.

Thanks,
Shuai


> 
> Thanks,
> Wei-Lin Chang
> 
>>
>> Thanks,
>> Shuai
>>
>>


