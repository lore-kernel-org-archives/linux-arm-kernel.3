Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6117CD8C8C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Jun 2026 20:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pbV17znVHflCYA4hpHF5VsEyW/rLnWQIwsr+cO/SJlc=; b=Q0hrwJxSiqOxQw6DYHR7u9wLK9
	IamVCVv1YrI2n8Ru05nkIPiHAFyeG7TdJVcwg2HyJP4+sTeHHUY8vXeLM/17gv5UJBwH9dTKbggAC
	7ZdCAEMoJqFskTCrb6KyvLAdjc47vKR/q7VJ5FRkMgSoZNW9FJslnBAiLFWNaNELShJvoa5qe2e0M
	cUNBa9dUKjTtFCc5qfpLzDnqIXvpuG3vxKfCENjEBch3yHQ+oTLIFBQQLvuonjlmgrs6gIcSzzXjI
	ziv+54QSBRT6vrn1ET67eW3LzPJehxiO08L1SeiGsuSpqdiekNQF12OxoH0fUYPrMxr2DjU0a2nCc
	4wwLMlPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWK9a-00000002TUR-0yNH;
	Sun, 07 Jun 2026 20:31:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWK9X-00000002TU3-3zq4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Jun 2026 20:31:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8CF252923;
	Sun,  7 Jun 2026 13:31:18 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA9893F632;
	Sun,  7 Jun 2026 13:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780864283; bh=vedSbHWVWJe0Ke5/QRNqJHVEboPffZIfJ0Z8nUsS+W8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tUnZicFS6DDHwNp7DB2mtYFmNTdq4Tex2cDVTJRe/IxGJoy1g3goY3hNlCLRaWfIc
	 zl3fvjq3Duh1oUMdlU3D1WJbGPFMB1sv7OryckcWhUBYTL22ot8PfWqXCKv+AbDVo4
	 CBpGXbIjmoScDJVn8NQnl0jwiy7Ex5RIv+iuWHO4=
Date: Sun, 7 Jun 2026 21:31:16 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Tejun Heo <tj@kernel.org>
Cc: bot+bpf-ci@kernel.org, Will Deacon <will@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>, david@kernel.org,
	arighi@nvidia.com, memxor@gmail.com, akpm@linux-foundation.org,
	rppt@kernel.org, andrii@kernel.org, daniel@iogearbox.net,
	martin.lau@linux.dev, martin.lau@kernel.org, eddyz87@gmail.com,
	yonghong.song@linux.dev, emil@etsalapatis.com, void@manifault.com,
	changwoo@igalia.com, clm@meta.com, ihor.solodrai@linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next] arm64: mm: Complete the PTE store in
 ptep_try_set()
Message-ID: <aiXVFK_qb54is8b1@arm.com>
References: <088f52fd25860ca961449d53f91b214a@kernel.org>
 <5f68f44310d4878185fd5ebc52d66530b99f174c6d04ab1170dc53cefaa54568@mail.kernel.org>
 <1780862659.ccb18e27e916dc4b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1780862659.ccb18e27e916dc4b@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_133128_118649_428C92A7 
X-CRM114-Status: GOOD (  13.56  )
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

On Sun, Jun 07, 2026 at 10:04:19AM -1000, Tejun Heo wrote:
> > Can this path actually loop, or is the deferred barrier guaranteed to be
> > flushed before the faulting instruction is retried?
> 
> I don't know the arm64 paths well enough to say. What I can see is that
> ptep_try_set() only runs as an apply_to_page_range() callback, and
> apply_to_pte_range() brackets it with lazy_mmu_mode_enable()/disable(), with
> the disable() flushing TIF_LAZY_MMU_PENDING before returning. The barriers
> would land before the access is retried. It also looks like the same
> queue_pte_barriers() path __set_pte() already uses. I'd defer to Catalin and
> the arm64 folks on whether that actually closes the case.

I don't fully understand the BPF parts but I think the bots have a
point. If a BPF kprobe fires while we are in lazy mmu mode,
__set_pte_complete() will defer issuing the barriers.

I think better to just call emit_pte_barriers() directly. If
ptep_try_set() is always called with valid kernel ptes, we can skip the
if (pte_valid_not_user()) check as well (which was just an optimisation
anyway).

-- 
Catalin

