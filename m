Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F75C982C1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 16:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qbUkCe6/Hy5YMIMHuDCsF2qVBQnZjqVmCyW7U93VnXM=; b=U7P4fisjI+c+A1qQ/OnXErlZRH
	oIU90XzU60EGkAEyQy6ZtoLcwfcXiOXqvDUeAkTO9XsKwARMRKg2vWrrLR3lkUYAQhagYAzyB18Qu
	d/jLn5j/SP9tZgFmbm6WXIRZU4260929MJKS8d5KQn1+DYKGoXl5buNLqHl2IxJGMEUbBUvL1MNTj
	OYhjVUL6VRJK040Nre3goUAEAOId+/4wkWcMGIcYsqyg/NGP7Ty5PuKmOtgNgRJpV/eAPBAxKbjZ7
	WTD1VIXAPx6I4GNd/upEpJ+8do3is2H7gbz1PXO2zIDIxhm/lKouU62EZgFOI07bNDY6JmbfpnEuq
	DBRgdQhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6sfX-00000009lNk-0cy1;
	Wed, 16 Sep 2026 16:39:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6sfT-00000009lMv-4A0M
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 16:39:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B9A41516;
	Wed, 16 Sep 2026 09:39:26 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8E2973F7B4;
	Wed, 16 Sep 2026 09:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789576770; bh=tpRIZijp9OVz8xJ1EeL+tPf3ChFeQoiLXmvmWlNF4Eg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VTTpRpO/bXvOGdJEE2whk8i4bgjlyM4Oe4CK8N8HAJRuPmsS+tN8MXN42RXbgm3Sc
	 f6K3/OxKnrKjaSuMPpqKf/X+YxnbfWi+9aQ4r9mef1QEHKjGlliCtpz9+wMnNi2U8l
	 fztfrqPEyKMI4cNjC0OP4zktopb5mSoOGIwd3hPw=
Date: Wed, 16 Sep 2026 17:39:24 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
	will@kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
	joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
	linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
Subject: Re: [PATCH v18] arm64: mm: Handle Granule Protection Faults (GPFs)
Message-ID: <aqrGPK0lFBFXL2qY@arm.com>
References: <20260913070459.2547407-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913070459.2547407-1-suzuki.poulose@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_093932_116043_1E134AD5 
X-CRM114-Status: GOOD (  30.77  )
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

On Sun, Sep 13, 2026 at 08:04:58AM +0100, Suzuki K Poulose wrote:
> From: Steven Price <steven.price@arm.com>
> 
> If the host attempts to access granules that have been delegated for use
> in a realm these accesses will be caught and will trigger a Granule
> Protection Fault (GPF).
> 
> A fault during a page walk signals a bug in the kernel and is handled by
> oopsing the kernel. A non-page walk fault could be caused by user space
> having access to a page which has been delegated to the kernel and will
> trigger a SIGBUS to allow debugging why user space is trying to access a
> delegated page.
> 
> There is work in progress to unmap the guest_memfd backed private pages from the
> linear map. Until we get that support, we could get spurious GPFs from within
> the kernel, e.g., load_unaligned_zeropad(). So, try to fix them up for now.
> 
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Changes since v17:
>  * Pass untagged address to die_kernel_fault() - Sashiko
>  * Explicitly check !user_mode() for fixups - Catalin
>  * Switch to BUS_OBJERR for si_code from SI_KERNEL - Catalin
>  * Clarify the commit description about the upcoming work on
>    unmapping guest_memfd backed pages from linear map
> Changes since v16:
>  * Update the commit description to indicate why we try to fixup GPFs
> Changes since v10:
>  * Don't call arm64_notify_die() in do_gpf() but simply return 1.
> Changes since v2:
>  * Include missing "Granule Protection Fault at level -1"
> ---
>  arch/arm64/mm/fault.c | 30 ++++++++++++++++++++++++------
>  1 file changed, 24 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> index 75c3e463df2ef..dc3a87902a60c 100644
> --- a/arch/arm64/mm/fault.c
> +++ b/arch/arm64/mm/fault.c
> @@ -914,6 +914,24 @@ static int do_tag_check_fault(unsigned long far, unsigned long esr,
>  	return 0;
>  }
>  
> +static int do_gpf_ptw(unsigned long far, unsigned long esr, struct pt_regs *regs)
> +{
> +	const struct fault_info *inf = esr_to_fault_info(esr);
> +	unsigned long addr = untagged_addr(far);
> +
> +	die_kernel_fault(inf->name, addr, esr, regs);
> +	return 0;
> +}
> +
> +static int do_gpf(unsigned long far, unsigned long esr, struct pt_regs *regs)
> +{
> +	if (!user_mode(regs) && !is_el1_instruction_abort(esr) &&
> +	    fixup_exception(regs, esr))
> +		return 0;
> +
> +	return 1;
> +}

We discussed briefly offline. With the latest patches around, would we
ever end up with private memory mapped in the VMM and hence the GPF? If
not, I would still keep this handling but add a
WARN_ON_ONCE(user_mode(regs)).

However, can we end up delegating a non-guest_memfd memslot page as
protected?

I played a bit with codex and it reckons it's possible if a guest_memfd
memslot is deleted after its IPA range has been initialised with
RIPAS=RAM. Removing the memslot unmaps and undelegates any data pages
but leaves the RMM state as RAM. The VMM can then install an ordinary
memslot over the same GPA range.

A subsequent private-IPA S2 fault sees the non-guest_memfd slot, takes
user_mem_abort(), GUPs the user page and passes it to
realm_map_protected(). The userspace mapping remains present, so a later
EL0 access can generate a GPF.

What's worse, I think it can even trick the kernel into doing a memcpy()
access (via GUP). Hmm, does such ordinary slot page even remain pinned?
There are other kernel parts that could access it.

I don't think it changes this patch but if the above is possible, we
should definitely get it tightened on the other series (and here we can
add the warning).

-- 
Catalin

