Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89396CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 15:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V4vHcowkqCE4VZWttkfK+kkAktqxX6bYUw0jhWBmsg4=; b=4WolQ+hBSmfrNijwAILUlcyzfZ
	fqjC4lpvP5xa7d0uzruVfzbFtHS+JoU8SPOUKauIbYr76e0zHf5NHmo0J1sSAKm1NCTmy9GLKVL/k
	hyN/rYXgfVimKas0nxE9a2SbCD5u11b3i5HWxnWf9dbddAvP8/zlK6+bf7dcjXNmr1NlNHqaKHwAI
	dngzQor451VxVkBjRdZRlS1XZ0buamyWbVXzpIN0/+ry6RPDDeIidK6n09paZ3O0LkoVMW71ogG0d
	rMFAA/bg7z23GAQaRHtW0ACCBJdwRbtRl1WN0Zi7XvsMPk3+b0hP/aEQdIre5sqna3vAgppm9oR1V
	hFedvnXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXhT1-00000009hEB-17Ft;
	Thu, 11 Jun 2026 15:37:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXhSy-00000009hDi-43Mc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 15:37:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E168E25E2;
	Thu, 11 Jun 2026 08:37:06 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB8003FB90;
	Thu, 11 Jun 2026 08:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781192231; bh=rC/rAaBXV2GWXrpXt20/IdeSrbUuel7YWt1xLJbAR2o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JkqlpOPyTjeEMsaxUcBoGInfqHsuGFDsvG8vDkGT1ee11I71JtUQ3UvnNV0ISoC+H
	 Rc8PzN3Zg2Ge2S7IKXzS0BI84YEb3c2ZcJOSWo72cNJsNBorxaEnMZ9ba2pp33jWXr
	 LFLsmA4JBlYyziVBRP5k7zzDqRnofVtuBczSf1ww=
Date: Thu, 11 Jun 2026 16:37:07 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: sk@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Mike Rapoport <rppt@kernel.org>, Dev Jain <dev.jain@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	cl@gentwo.org, Sayali Kulkarni <sskulkarni@amperecomputing.com>
Subject: Re: [PATCH 2/2] arm64: tlbflush: Reset active_cpu on ASID rollover
Message-ID: <airWIxSd_a5kR65-@arm.com>
References: <20260609213615.2788698-1-sk@gentwo.org>
 <20260609213615.2788698-3-sk@gentwo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609213615.2788698-3-sk@gentwo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_083713_055970_503D598F 
X-CRM114-Status: GOOD (  20.36  )
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

On Tue, Jun 09, 2026 at 02:34:33PM -0700, sk@gentwo.org wrote:
> From: Sayali Kulkarni <sskulkarni@amperecomputing.com>
> 
> Once active_cpu flips to ACTIVE_CPU_MULTIPLE, it never resets, even if
> the process settles back to one CPU. Reset it to ACTIVE_CPU_NONE when
> a new ASID is assigned after rollover, since flush_context() already
> issued a global TLB flush at that point meaning no stale TLB entries
> exist on any CPU.
> 
> This gives processes a fresh chance at the local-only flush fast path
> after each ASID generation rollover.

flush_context() does not invalidate any TLBs, just marks the in a bitmap
which CPUs need to flush, locally, on the next context switch.

Check Sashiko's comments, it has some good points (you can ignore the
comments on the first patch as we no longer rely on DVM for SVA.

https://sashiko.dev/#/patchset/20260609213615.2788698-1-sk@gentwo.org

> Signed-off-by: Sayali Kulkarni <sskulkarni@amperecomputing.com>
> ---
>  arch/arm64/mm/context.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/mm/context.c b/arch/arm64/mm/context.c
> index f34ed78393e0..0c92cc8fb4cd 100644
> --- a/arch/arm64/mm/context.c
> +++ b/arch/arm64/mm/context.c
> @@ -250,6 +250,7 @@ void check_and_switch_context(struct mm_struct *mm)
>  	if (!asid_gen_match(asid)) {
>  		asid = new_context(mm);
>  		atomic64_set(&mm->context.id, asid);
> +		WRITE_ONCE(mm->context.active_cpu, ACTIVE_CPU_NONE);
>  	}

This breaks the case where you have another thread of the current
process running on a different CPU. new_context(mm) will reuse the
current ASID, just bump the generation, so setting active_cpu to
ACTIVE_CPU_NONE is incorrect.

A better place for this would be in new_context() after the "set_asid"
label.

>  	if (cpumask_test_and_clear_cpu(cpu, &tlb_flush_pending))
> @@ -321,6 +322,7 @@ unsigned long arm64_mm_context_get(struct mm_struct *mm)
>  		 */
>  		asid = new_context(mm);
>  		atomic64_set(&mm->context.id, asid);
> +		WRITE_ONCE(mm->context.active_cpu, ACTIVE_CPU_NONE);
>  	}

And it would cover this path as well (not that this function is used
currently).

-- 
Catalin

