Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15EEDC624DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 23:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O4rjm7L9OxwhE+KU/msJJqPiLu/z8N+5+AE9fmKNMpU=; b=0pEC7tM6pO4AX7366dA1zGsJ78
	AK9WuZaEg4zk5yQC9eCNGxR48vqLm7qAtKpzr7slJ7d5nMo9yyWtlXI+v8BoZNw+wUn8370N6ISp4
	f5WFhl2vcLBLezLK1qkBRuuSLANH42Wp/FtZX5nTqA4e6DbVk/THxvr9Q2BrmzRvKT5RK5Vpmuwzr
	W6G0/sYfzRa9FhHEJSxaVWKzlbMpwG85RT1CAohYH43rFL7YEa+FSKSaN2ONrTJfsyDH31YWrk9r8
	WimkL6+RhojtfhsF3UuM64M1ZL1IdUj8pI2tNw7JuRJxMyddCo9etV087rmn77jeGHhZqHqbedRyA
	VldigYaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x308A-00000004URe-1drD;
	Sat, 05 Sep 2026 23:49:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3087-00000004URJ-1oj6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 23:49:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 285D31477;
	Sat,  5 Sep 2026 16:48:56 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 810673F673;
	Sat,  5 Sep 2026 16:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788652139; bh=78ZaUHpCCmF9Q0SRtDPZW3k16driAdZe8cBTHH9U4Ys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uWYZ/mVMj/RrfQNI2EgFHEj2UqFhaoPkrXi/X8bsDBUV203Qu3dn/kF8JwPQ6obOz
	 88mI97vEqyEZkbdgT7uK1cMCgMc4ZgVs+OshFnQ4vyC4qsyMOqwP1tTxge9BJG7NnQ
	 1pOtrQGvsC7KD/eOoAwm31GjAMc2V965Mwqt/TE8=
Date: Sun, 6 Sep 2026 00:48:49 +0100
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Shuai Xue <xueshuai@linux.alibaba.com>, Marc Zyngier <maz@kernel.org>
Cc: Wang Han <wanghan@linux.alibaba.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	oupton@kernel.org, tabba@google.com, joey.gouly@arm.com, seiden@linux.ibm.com, 
	suzuki.poulose@arm.com, catalin.marinas@arm.com, will@kernel.org, ljs@kernel.org, 
	itaru.kitayama@fujitsu.com
Subject: Re: [PATCH v5 0/6] KVM: arm64: nv: Implement nested stage-2 reverse
 map (new data structure)
Message-ID: <rytvo6a7sulfb2no2fclvtpggk4ekqzs6n6xkqlffldbzua4lz@rnskx6qj2cxy>
References: <20260810205038.118843-1-weilin.chang@arm.com>
 <20260902163500.1841671-1-wanghan@linux.alibaba.com>
 <877bl26aqg.wl-maz@kernel.org>
 <wsnf276xrun3g4hjr3t6alprapctg5z4kpj422v3hujqdjnrsa@swq4blkqvvj5>
 <875x0l5udh.wl-maz@kernel.org>
 <eylfcgxs2xzu57czyuhkpmum45lpxyccyu2yh3mipr67aq3xo6@xinygxzavoja>
 <2bde734c-eb86-4c7a-958d-b431e6d13671@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2bde734c-eb86-4c7a-958d-b431e6d13671@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_164903_652044_0108CA25 
X-CRM114-Status: GOOD (  25.35  )
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

On Sat, Sep 05, 2026 at 11:49:32PM +0800, Shuai Xue wrote:

[...]

> 
> Hi Wei-Lin,
> 
> Your PARange analysis is what this whole diagnosis rests on -- the
> 48-bit/256x arithmetic is exactly right, and our ftrace data confirms
> it to the chunk: every full-IPA kvm_nested_s2_unmap() in our traces
> walks precisely 262,144 1GB chunks, the number from your table. The
> kvm_ipa_limit=40 experiment also pointed straight at the answer. I'd
> only push back on the last sentence:
> 
> > 
> > With this, I think there aren't other underlying issues, it just is that
> > slow unfortunately..
> 
> 
> I don't think it is "just that slow" -- I think it is a specific
> regression, and your own data localizes it better than the conclusion
> suggests.
> 
> The thing is, kvm_ipa_limit=40 cannot tell *what* each chunk spends
> its ~3.3us on, because the walk is also per-chunk: cutting the chunk
> count by 256x shrinks both terms together, whichever one dominates.
> The experiment that separates them is one where the chunk count does
> not change at all.
> 
> We ran that experiment. Details are in my reply to Marc, but the
> short version:
> 
>   - Before: 877ms per callback, 262,144 chunk calls, 262,144
>     broadcasts. Chunk count and broadcast count are exactly equal
>     (8,476,033 = 8,476,033 over the trace window) -- every chunk
>     ends in a broadcast, mapped or not. Per chunk, ~4.6us of the
>     ~5.1us is inside kvm_tlb_flush_vmid_range(); the walk of an
>     empty chunk is ~0.2us. In an uncontended numad episode, 87% of
>     the 1312ms is flush time and 8% is walk time.
> 
>   - After conditioning the flush on the walk having actually cleared
>     a valid leaf (the candidate fix in my other mail): same 262,144
>     chunks, same walk, ~110ms instrumented. Nothing about the walk
>     changed -- ~3.1us of the per-chunk 3.3us was the broadcast.
> 
>   - And the table really is empty, as Marc says: with the flush
>     count acting as a detector, the first full-IPA unmap of the boot
>     issues 2 flushes (the EL1-boot-period mappings, a few dozen
>     pages in two 1GB chunks); all 35 subsequent ones issue zero.
> 
> The code history agrees. Before 7657ea920c54, the TLBI lived inside
> stage2_put_pte()'s 'if (kvm_pte_valid(ctx->old))' -- an empty walk
> issued zero invalidations, ever. v6.6 hoisted the invalidation out
> to the end of kvm_pgtable_stage2_unmap() to batch it into one range
> TLBI per call, but the condition got dropped on the way. So "since
> v6.6, the cost is proportional to the IPA range, not to the number
> of mappings" -- which is precisely why the empty table pays in full,
> and why I'd frame it as a fixable regression rather than an inherent
> cost.
> 
> None of this subtracts from your PARange finding -- it depends on
> it. The 42s -> <1s result was the 256x chunk scaling; the remaining
> <1s is what the conditional flush removes.

Thanks for the analysis!

I completely agree. My finding was only a small part of the full
picture. I stopped at finding out the real iteration count and didn't
realize 3-5us is a long time for a kvm_pgtable_stage2_unmap() on a empty
table (thanks for the learning opportunity).

So, because there are no relevant tlb entries created in the first
place, the per iteration TLBIs and barriers are mostly doing nothing
useful and cause a 10x slowdown.

Thanks,
Wei-Lin Chang

> 
> Thanks,
> Shuai
> 
> 

