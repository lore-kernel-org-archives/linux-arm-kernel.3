Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28740CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 12:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cfy5IF3x0JtW9CpNalnLLpK8u6eZ7BRMq0IeQhp39Ds=; b=ws/Zi9JrhlSBl0COCA8u4PRPZE
	56SFwqZDwHjf9N1bg3FgsdmHOEJv0NbQeLS+U6gxVNWkN/B7qvecQlpAECuVaYjvxwkV+FEqA1V59
	zbqL+34QVc8t5RZrWcKaSHBgWjz9WbtL+8cDOGrTuC2MC8spzdUYueq9nWzgAvZtwFZxqRkBS0Qpm
	UFru5BN/zH6gB7WBgLF4ydmWd8te0ZYzGJeNWJ645sjdymmvfAgJ6qzSpRnIunTgjB9rPyZP1U9L1
	Pedix5uRt6Ld33KcCqpIqKLJp9mgQtuReiAKRWc2AH4RQ0xMzSPEMKTnoK2bDHisP+jypxP1Df56r
	torFFa1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6oy-0000000EExI-1tIB;
	Mon, 15 Jun 2026 12:53:44 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6ow-0000000EEwg-0AHx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 12:53:43 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-490b915ded5so31935865e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 05:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781528020; x=1782132820; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cfy5IF3x0JtW9CpNalnLLpK8u6eZ7BRMq0IeQhp39Ds=;
        b=Hr3LfpuDeB1QYmLYDXOprai+uWRnI5F9AI3ftNh/48RkqhPC7bSlspS3d3zrlvs6Jp
         DBbxxoHl0txJURIyLwGUkosX2pujuZwjCVDS+EjNjP1nusYyqO++JoY12hFFgP+cKtOP
         HALGUwVbqseGoNMnTS/FZWiuCm1+fdXSCh/kS7Vx0LuAWPKtATl3g+MtdvQptvA2PGqM
         eLUJAj3b4CorGzw9Czyo4wY4gZctS2lusBR48Sro1T2LwxEMkHZJVW1Vn+DCy8BYZmF6
         CuorNGhTIsTmQ7Kii/ZbXFnk2XLW9+LMwr08+fkIHEmdbMtyZqepuGKe+PnB2y86a2Qj
         iQ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781528020; x=1782132820;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cfy5IF3x0JtW9CpNalnLLpK8u6eZ7BRMq0IeQhp39Ds=;
        b=QZo2cb9Yi0fXUHvZlo/5WjLoLt8EvBgPW/8Prko59hsKIp6zrP/JmsHC+cO+2mZ7lF
         D5Hs2ErThLexIA4oFcDXgJdUZ/0lBpxxFrV5CMYpWe57/utU0YkX+yBKDPIIrx2bR/ND
         p/NglmfZqUrFTYpOYIH9BLMqPh+KZJxHgXXex3pADU6lE4MuSDZPOjvM6ArqlNufm9OG
         fZZ81AXw3xHV+LkZB0/V0rcnHsAS/Uggce0gTytfvt8ioCQYnA/evVJVWcgr7CBaw9gw
         KpuSvqpND+q7CncL2PxbiO8np8itLOlbE/GmV7ddwiMmQLcj9xz1h6/7WLTYsBjhT3hY
         AHFA==
X-Forwarded-Encrypted: i=1; AFNElJ+Y2Z0V668M08Ztu5ssK4os9XE7jj60yp8zJZNnjjHJwXCl3wXltFfmSfG3z5qjrSGQO+khSRSiIcJYLDdspj7q@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9dGby3HHrHi6GcFsOmieHvhjuTw0m/oBlonDufmEyss686a5L
	GjP398nTP5avDpuMqLEMBHFgXMrVhAT8rhnIgo31SQgA0ytlVjZxBdP2dUvrvk/qnw==
X-Gm-Gg: Acq92OG786hVeNA0F3SaUkRD7mIW3NvvB46X8y3UeiiUOLM468lC80j//yxhoO8DazY
	Ierl+vATIRxwkny+rahj5U/4WtlleIedNpfuMsjs8jOzgTQLpw15P1/OZSPT6Q0MYs5fWrIZYUV
	qK9+SK+V9qGGyIU7ZaBPqokCiQRFGsBDjeB3jSTBvb89S/EBIno8jbe2/uUDz/4CwEmFhycM4nN
	KttHnDAFZM24T/BGF3QLtC3QzSvsgO0Uq9SN4jCSs7wyFZyDbpn8SGG+6U+dBDInD6apjNaFbFB
	N24RyqoIdBZMLlNY77fU2+S7SAW45GMVuz5D6/nT20ZHCA4FQzf9WrTAAFFqA/HlfYdyZbYe+8T
	M7ZmiHahQKm4wM9DuBkVSeJ98bvuWeniF5J/gmOaRpX4WclyLMZ1ypqfAFpNubLkgiQ8AobVo0S
	T2ljKtVPtvELqBcu7mXpuLXXD5tWbiOpTcHmpsxKbjizIH3PExRqMnoQZhy/6PE87qY/8=
X-Received: by 2002:a7b:c7d7:0:b0:490:9588:bdb6 with SMTP id 5b1f17b1804b1-490ec5215bamr127730525e9.33.1781528019556;
        Mon, 15 Jun 2026 05:53:39 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49220308f13sm265864385e9.5.2026.06.15.05.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 05:53:38 -0700 (PDT)
Date: Mon, 15 Jun 2026 13:53:35 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: tabba@google.com
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>,
	Sebastian Ene <sebastianene@google.com>,
	Per Larsen <perlarsen@google.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Hyunwoo Kim <imv4bel@gmail.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 02/11] KVM: arm64: Use guard(hyp_spinlock) in pKVM
 hypervisor code
Message-ID: <ai_1z13TyEXbHx4Q@google.com>
References: <20260612065925.755562-1-tabba@google.com>
 <20260612065925.755562-3-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612065925.755562-3-tabba@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_055342_138088_DF02DDE5 
X-CRM114-Status: GOOD (  28.83  )
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

On Fri, Jun 12, 2026 at 07:59:16AM +0100, tabba@google.com wrote:
> Convert the manual hyp_spin_lock()/hyp_spin_unlock() pairs in
> arch/arm64/kvm/hyp/nvhe/{pkvm,mm,page_alloc,ffa}.c to
> guard(hyp_spinlock) and scoped_guard(hyp_spinlock), dropping several
> unlock-only goto labels in favour of direct returns.
> 
> hyp_fixblock_lock in mm.c is left as an explicit lock/unlock pair: it is
> acquired in hyp_fixblock_map() and released in hyp_fixblock_unmap(), so
> its critical section spans two functions and cannot be expressed as a
> single lexical scope.
> 
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/ffa.c        | 154 +++++++++++----------------
>  arch/arm64/kvm/hyp/nvhe/mm.c         |  37 ++-----
>  arch/arm64/kvm/hyp/nvhe/page_alloc.c |  13 +--
>  arch/arm64/kvm/hyp/nvhe/pkvm.c       |  86 +++++----------
>  4 files changed, 105 insertions(+), 185 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> index 1af722771178..46cd4fa924be 100644
> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> @@ -313,17 +313,16 @@ static void do_ffa_rxtx_unmap(struct arm_smccc_1_2_regs *res,
>  			      struct kvm_cpu_context *ctxt)
>  {
>  	DECLARE_REG(u32, id, ctxt, 1);
> -	int ret = 0;
>  
>  	if (id != HOST_FFA_ID) {
> -		ret = FFA_RET_INVALID_PARAMETERS;
> -		goto out;
> +		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> +		return;
>  	}
>  
> -	hyp_spin_lock(&host_buffers.lock);
> +	guard(hyp_spinlock)(&host_buffers.lock);
>  	if (!host_buffers.tx) {
> -		ret = FFA_RET_INVALID_PARAMETERS;
> -		goto out_unlock;
> +		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> +		return;
>  	}
>  
>  	hyp_unpin_shared_mem(host_buffers.tx, host_buffers.tx + 1);
> @@ -336,10 +335,7 @@ static void do_ffa_rxtx_unmap(struct arm_smccc_1_2_regs *res,
>  
>  	ffa_unmap_hyp_buffers();
>  
> -out_unlock:
> -	hyp_spin_unlock(&host_buffers.lock);
> -out:
> -	ffa_to_smccc_res(res, ret);
> +	ffa_to_smccc_res(res, 0);
>  }
>  
>  static u32 __ffa_host_share_ranges(struct ffa_mem_region_addr_range *ranges,
> @@ -418,18 +414,20 @@ static void do_ffa_mem_frag_tx(struct arm_smccc_1_2_regs *res,
>  	DECLARE_REG(u32, fraglen, ctxt, 3);
>  	DECLARE_REG(u32, endpoint_id, ctxt, 4);
>  	struct ffa_mem_region_addr_range *buf;
> -	int ret = FFA_RET_INVALID_PARAMETERS;
> +	int ret;
>  	u32 nr_ranges;

nit: inverted christmas tree

>  
> -	if (fraglen > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE)
> -		goto out;
> +	if (fraglen > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE ||
> +	    fraglen % sizeof(*buf)) {

nit: I don't know if we wouldn't want extra parenthesis here for readability.

> +		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> +		return;
> +	}
>  
> -	if (fraglen % sizeof(*buf))
> -		goto out;
> -
> -	hyp_spin_lock(&host_buffers.lock);
> -	if (!host_buffers.tx)
> -		goto out_unlock;
> +	guard(hyp_spinlock)(&host_buffers.lock);
> +	if (!host_buffers.tx) {
> +		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> +		return;
> +	}
>  
>  	buf = hyp_buffers.tx;
>  	memcpy(buf, host_buffers.tx, fraglen);
> @@ -444,19 +442,14 @@ static void do_ffa_mem_frag_tx(struct arm_smccc_1_2_regs *res,
>  		 */
>  		ffa_mem_reclaim(res, handle_lo, handle_hi, 0);
>  		WARN_ON(res->a0 != FFA_SUCCESS);
> -		goto out_unlock;
> +		ffa_to_smccc_res(res, ret);
> +		return;
>  	}
>  
>  	ffa_mem_frag_tx(res, handle_lo, handle_hi, fraglen, endpoint_id);
>  	if (res->a0 != FFA_SUCCESS && res->a0 != FFA_MEM_FRAG_RX)
>  		WARN_ON(ffa_host_unshare_ranges(buf, nr_ranges));
>  
> -out_unlock:
> -	hyp_spin_unlock(&host_buffers.lock);
> -out:
> -	if (ret)
> -		ffa_to_smccc_res(res, ret);
> -
>  	/*
>  	 * If for any reason this did not succeed, we're in trouble as we have
>  	 * now lost the content of the previous fragments and we can't rollback
> @@ -465,7 +458,6 @@ static void do_ffa_mem_frag_tx(struct arm_smccc_1_2_regs *res,
>  	 * sharing/donating them again and may possibly lead to subsequent
>  	 * failures, but this will not compromise confidentiality.
>  	 */
> -	return;
>  }
>  
>  static void __do_ffa_mem_xfer(const u64 func_id,
> @@ -480,29 +472,29 @@ static void __do_ffa_mem_xfer(const u64 func_id,
>  	struct ffa_composite_mem_region *reg;
>  	struct ffa_mem_region *buf;
>  	u32 offset, nr_ranges, checked_offset;
> -	int ret = 0;
> +	int ret;
>  
>  	if (addr_mbz || npages_mbz || fraglen > len ||
>  	    fraglen > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE) {
> -		ret = FFA_RET_INVALID_PARAMETERS;
> -		goto out;
> +		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> +		return;
>  	}
>  
>  	if (fraglen < sizeof(struct ffa_mem_region) +
>  		      sizeof(struct ffa_mem_region_attributes)) {
> -		ret = FFA_RET_INVALID_PARAMETERS;
> -		goto out;
> +		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> +		return;
>  	}
>  
> -	hyp_spin_lock(&host_buffers.lock);
> +	guard(hyp_spinlock)(&host_buffers.lock);
>  	if (!host_buffers.tx) {
> -		ret = FFA_RET_INVALID_PARAMETERS;
> -		goto out_unlock;
> +		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> +		return;
>  	}
>  
>  	if (len > ffa_desc_buf.len) {
> -		ret = FFA_RET_NO_MEMORY;
> -		goto out_unlock;
> +		ffa_to_smccc_res(res, FFA_RET_NO_MEMORY);
> +		return;
>  	}
>  
>  	buf = hyp_buffers.tx;
> @@ -512,53 +504,41 @@ static void __do_ffa_mem_xfer(const u64 func_id,
>  			ffa_mem_desc_offset(buf, 0, hyp_ffa_version);
>  	offset = ep_mem_access->composite_off;
>  	if (!offset || buf->ep_count != 1 || buf->sender_id != HOST_FFA_ID) {
> -		ret = FFA_RET_INVALID_PARAMETERS;
> -		goto out_unlock;
> +		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> +		return;
>  	}
>  
>  	if (check_add_overflow(offset, sizeof(struct ffa_composite_mem_region), &checked_offset)) {
> -		ret = FFA_RET_INVALID_PARAMETERS;
> -		goto out_unlock;
> +		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> +		return;
>  	}
>  
>  	if (fraglen < checked_offset) {
> -		ret = FFA_RET_INVALID_PARAMETERS;
> -		goto out_unlock;
> +		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> +		return;
>  	}
>  
>  	reg = (void *)buf + offset;
>  	nr_ranges = ((void *)buf + fraglen) - (void *)reg->constituents;
>  	if (nr_ranges % sizeof(reg->constituents[0])) {
> -		ret = FFA_RET_INVALID_PARAMETERS;
> -		goto out_unlock;
> +		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> +		return;
>  	}
>  
>  	nr_ranges /= sizeof(reg->constituents[0]);
>  	ret = ffa_host_share_ranges(reg->constituents, nr_ranges);
> -	if (ret)
> -		goto out_unlock;
> +	if (ret) {
> +		ffa_to_smccc_res(res, ret);
> +		return;
> +	}
>  
>  	ffa_mem_xfer(res, func_id, len, fraglen);
>  	if (fraglen != len) {
> -		if (res->a0 != FFA_MEM_FRAG_RX)
> -			goto err_unshare;
> -
> -		if (res->a3 != fraglen)
> -			goto err_unshare;
> +		if (res->a0 != FFA_MEM_FRAG_RX || res->a3 != fraglen)
> +			WARN_ON(ffa_host_unshare_ranges(reg->constituents, nr_ranges));
>  	} else if (res->a0 != FFA_SUCCESS) {
> -		goto err_unshare;
> +		WARN_ON(ffa_host_unshare_ranges(reg->constituents, nr_ranges));

I am not sure this is really better for this function. At least we had a single
callsite to this WARN_ON(ffa_host_unshare_ranges) ... 

Or alternatively if we really want guard() this can just set ret = XXX and then

  if (ret)
      WARN_ON(ffa_host_unshare_ranges(reg->constituents, nr_ranges));

So we can keep a single call site for the rollback.

>  	}
> -
> -out_unlock:
> -	hyp_spin_unlock(&host_buffers.lock);
> -out:
> -	if (ret)
> -		ffa_to_smccc_res(res, ret);
> -	return;
> -
> -err_unshare:
> -	WARN_ON(ffa_host_unshare_ranges(reg->constituents, nr_ranges));
> -	goto out_unlock;
>  }
>  

[...]

>  int __pkvm_finalize_teardown_vm(pkvm_handle_t handle)
> @@ -996,22 +975,19 @@ int __pkvm_finalize_teardown_vm(pkvm_handle_t handle)
>  	struct kvm *host_kvm;
>  	unsigned int idx;
>  	size_t vm_size;
> -	int err;
>  
> -	hyp_spin_lock(&vm_table_lock);
> -	hyp_vm = get_pkvm_unref_hyp_vm_locked(handle);
> -	if (!hyp_vm || !hyp_vm->kvm.arch.pkvm.is_dying) {
> -		err = -EINVAL;
> -		goto err_unlock;
> +	scoped_guard(hyp_spinlock, &vm_table_lock) {
> +		hyp_vm = get_pkvm_unref_hyp_vm_locked(handle);
> +		if (!hyp_vm || !hyp_vm->kvm.arch.pkvm.is_dying)
> +			return -EINVAL;
> +
> +		host_kvm = hyp_vm->host_kvm;
> +
> +		/* Ensure the VMID is clean before it can be reallocated */
> +		__kvm_tlb_flush_vmid(&hyp_vm->kvm.arch.mmu);
> +		remove_vm_table_entry(handle);
>  	}
>  
> -	host_kvm = hyp_vm->host_kvm;
> -
> -	/* Ensure the VMID is clean before it can be reallocated */
> -	__kvm_tlb_flush_vmid(&hyp_vm->kvm.arch.mmu);
> -	remove_vm_table_entry(handle);
> -	hyp_spin_unlock(&vm_table_lock);
> -
>  	/* Reclaim guest pages (including page-table pages) */
>  	mc = &host_kvm->arch.pkvm.teardown_mc;
>  	stage2_mc = &host_kvm->arch.pkvm.stage2_teardown_mc;
> @@ -1042,10 +1018,6 @@ int __pkvm_finalize_teardown_vm(pkvm_handle_t handle)
>  	teardown_donated_memory(mc, hyp_vm, vm_size);
>  	hyp_unpin_shared_mem(host_kvm, host_kvm + 1);
>  	return 0;
> -
> -err_unlock:
> -	hyp_spin_unlock(&vm_table_lock);
> -	return err;

For this one too I doubt this is really interesting: only one path using
err_unlock and actually the entire label could be just removed to to simply do
hyp_spin_unlock() return -EINVAL;

This would avoid adding another tab with that scoped_guard(). But that's
probably my aversion to scoped_guard() talking.

>  }
>  
>  static u64 __pkvm_memshare_page_req(struct kvm_vcpu *vcpu, u64 ipa)
> -- 
> 2.54.0.1136.gdb2ca164c4-goog
> 

