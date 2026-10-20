Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD9E606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 10:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=w6giN1CS;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=AnjaH/UO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FMmthLcjHJSWSDaEG61XYBxevgxiYWHMZtyfEQ71iAA=; b=w6giN1CS89KC2khb8klv6Sd7Jk
	1qGtI9G825o1Sb/OL7jIEj5GJ4t3pxp0TqEFInNn/zdYdL4C0417wjhNmf4qPsxAa+4l978Fs9Gud
	8nwwfgaOmlz17BP0RJylqWgKJlx82ZE7WdZVLSrTTMheey4E+up1z4HTp5fWAAxpDYr0+AEGU5ioR
	tjKTgTXqONRXyoRbYDIdGUTDl2mY+wI9EHkn+X0fylDC9ydZfQ9xk6CZIXICq2RPTtFUW+WXxQMvs
	J2VVhewE36nC1rH0BIn+D3RKbHJFnow69s0MC6pHHi+HD8RNv0BX0LnNH8JeSMpTu2rI/g8JYL8YR
	y3DM2aYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ73W-00000009QYJ-4ATc;
	Tue, 20 Oct 2026 10:26:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ73U-00000009QXk-0CdK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 10:26:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 91B401596;
	Tue, 20 Oct 2026 03:26:44 -0700 (PDT)
Received: from e143914.arm.com (e143914.arm.com [10.2.213.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 929773F7D8;
	Tue, 20 Oct 2026 03:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792492007; bh=rVr5DLobVsa4z0JmSriIanKvspEW4Of9gMiZNZhQaD0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AnjaH/UObbjIJUBAp4DIogd1Jjoq/fdJhUB7eNFSHgCNSyD7A9S09eZn1NuRcpqKV
	 9sYDNkies/PjowKFbwitT6GuTbuwP63MqJc45Sowm5MArvs5U/BrgbUPKN80U0SRat
	 qUiqvccR2FnJmLFgX/CFZ/bd0xFSPWjwWgKgsZA4=
Date: Tue, 20 Oct 2026 11:26:35 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>, Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] KVM: arm64: Ensure TLBs and I-cache are private to
 each vCPU in pKVM
Message-ID: <atdBzoLpddpwzKU4@e143914.arm.com>
References: <20261020074311.1873316-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020074311.1873316-1-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_032652_244578_576CD15A 
X-CRM114-Status: GOOD (  29.85  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 08:43:11AM +0100, Fuad Tabba wrote:
> All vCPUs of a VM share its VMID, so KVM flushes a physical CPU's TLBs
> and I-cache for the VM whenever a different vCPU of that VM is loaded
> there. pKVM guests, protected or not, run on the hypervisor's stage-2
> and VMID, and the host doesn't flush for them. Nothing at EL2 flushes
> instead, so a vCPU can hit TLB and I-cache entries that another vCPU of
> the same VM left on that CPU.
> 
> Track at EL2 the last vCPU of each VM loaded on each CPU, and flush
> when it changes. EL2 can't allocate per-CPU memory for each VM, as the
> host does, so use one per-CPU array indexed by the VM's table entry.
> Reset the entry's slot on every CPU when a VM reserves it, so that a new
> VM starts with no last vCPU, whether the entry is unused or was left by
> a VM that was torn down.
> 
> Fixes: fce886a602073 ("KVM: arm64: Plumb the pKVM MMU in KVM")
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

> ---
> Changes since v1 [1]:
>   - Dropped patch 1, which added a CPU number at EL2. The last vCPU is
>     now tracked in a per-CPU array indexed by VM table entry. (Marc)
>   - Moved the check from __pkvm_vcpu_load() to pkvm_load_hyp_vcpu().
>   - The array is unsigned int, initialised to UINT_MAX. (Vincent)
>   - Dropped Joey's Reviewed-by, since the patch changed.
> 
> Based on kvmarm/next (dd0bc00e3e920).
> 
> [1] https://lore.kernel.org/all/20261014125510.2928306-1-fuad.tabba@linux.dev/
> 
>  arch/arm64/kvm/hyp/nvhe/pkvm.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> index ac020d0501d2e..1fc59229c8e86 100644
> --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> @@ -38,6 +38,9 @@ unsigned int kvm_host_sve_max_vl;
>   */
>  static DEFINE_PER_CPU(struct pkvm_hyp_vcpu *, loaded_hyp_vcpu);
>  
> +/* Per VM table entry, the vcpu_idx of the last vCPU of that VM loaded on this CPU. */
> +static DEFINE_PER_CPU(unsigned int, last_vcpu_ran[KVM_MAX_PVMS]);
> +
>  static void pkvm_vcpu_reset_hcr(struct kvm_vcpu *vcpu)
>  {
>  	vcpu->arch.hcr_el2 = HCR_GUEST_FLAGS;
> @@ -261,6 +264,7 @@ struct pkvm_hyp_vcpu *pkvm_load_hyp_vcpu(pkvm_handle_t handle,
>  {
>  	struct pkvm_hyp_vcpu *hyp_vcpu = NULL;
>  	struct pkvm_hyp_vm *hyp_vm;
> +	unsigned int *last_ran;
>  
>  	/* Cannot load a new vcpu without putting the old one first. */
>  	if (__this_cpu_read(loaded_hyp_vcpu))
> @@ -290,8 +294,18 @@ struct pkvm_hyp_vcpu *pkvm_load_hyp_vcpu(pkvm_handle_t handle,
>  unlock:
>  	hyp_spin_unlock(&vm_table_lock);
>  
> -	if (hyp_vcpu)
> -		__this_cpu_write(loaded_hyp_vcpu, hyp_vcpu);
> +	if (!hyp_vcpu)
> +		return NULL;
> +
> +	__this_cpu_write(loaded_hyp_vcpu, hyp_vcpu);
> +
> +	/* TLBs and I-cache are private to each vCPU, see vcpu_prepare_mmu(). */
> +	last_ran = this_cpu_ptr(&last_vcpu_ran[vm_handle_to_idx(handle)]);
> +	if (*last_ran != vcpu_idx) {
> +		__kvm_flush_cpu_context(hyp_vcpu->vcpu.arch.hw_mmu);
> +		*last_ran = vcpu_idx;
> +	}
> +
>  	return hyp_vcpu;
>  }
>  
> @@ -652,6 +666,7 @@ static int find_free_vm_table_entry(void)
>   */
>  static int allocate_vm_table_entry(void)
>  {
> +	unsigned int cpu;
>  	int idx;
>  
>  	hyp_assert_lock_held(&vm_table_lock);
> @@ -670,6 +685,9 @@ static int allocate_vm_table_entry(void)
>  
>  	vm_table[idx] = RESERVED_ENTRY;
>  
> +	for (cpu = 0; cpu < hyp_nr_cpus; cpu++)
> +		per_cpu(last_vcpu_ran[idx], cpu) = UINT_MAX;
> +
>  	return idx;
>  }
>  
> 
> base-commit: dd0bc00e3e9201fd49b62ff9cc07890c89003afe
> -- 
> 2.47.3
> 

