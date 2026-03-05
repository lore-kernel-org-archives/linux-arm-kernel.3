Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E59ADEFCE56
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 01:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=29Bd77wZ7ySfXMFtzHtrifcW2gocYnKQEBKeYTFG2zI=; b=btsTWMFw31aeiVLGiN+YKCdoEb
	qrBivGcmP9nUbuijaBqQpW7ncdPqjQ8xlbGgNfN6X+m+rq2lkZdgdPICVCudfLJA2vL8TotjFHRQg
	wZzc/lTJIj1WZOa4GhEQt0+82f8n0oktBuCgoMEluDHwbmmcCPrfTKj9VwHyzjxgtCanyzWJ/ztIx
	soFm7BEdG20m1sVyMBSLOMQ7gxlUKc+qXdy9hPamO7/3iInXUUNdo0DwdeQBytZRBZn6Jd22ApSbr
	9RTV+LRu5GHBYTiQwZ+zGQhdHHGeouvr3cqv0fqS/cDGsgfAebqoBVPw09E2MeAZtC48+Hsvc8o30
	tPeQrTBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxxyP-00000000lnZ-3O1B;
	Thu, 05 Mar 2026 01:57:57 +0000
Received: from out30-118.freemail.mail.aliyun.com ([115.124.30.118])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxxyM-00000000lmu-1NA8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 01:57:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1772675866; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=29Bd77wZ7ySfXMFtzHtrifcW2gocYnKQEBKeYTFG2zI=;
	b=s1KWMjMTzvVByYc52Pd235xAzDNQFFgKhvzrpQhKnTldhGuq7yKYiP4TMXcwB5TupMOalUFn/6y8tzrpTQvAx5v371dUrfZDxoyG9eDJgFUwPTOm3COhWMhbxzw7tbUvxWRBRj4EprPy8pe5/N80w6xAWu2TEZwknkTdzMypd5Y=
Received: from localhost(mailfrom:yaoyuan@linux.alibaba.com fp:SMTPD_---0X-Gjl9h_1772675862 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 05 Mar 2026 09:57:42 +0800
Date: Thu, 5 Mar 2026 09:57:40 +0800
From: Yao Yuan <yaoyuan@linux.alibaba.com>
To: Fuad Tabba <tabba@google.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	yangyicong@hisilicon.com, wangzhou1@hisilicon.com
Subject: Re: [PATCH v1 1/2] KVM: arm64: Fix page leak in user_mem_abort() on
 atomic fault
Message-ID: <yjqinaji6r6na4weqy2ne52xfcgr4bp4acm2btrv6ri7bpy53r@mk4fnagzgwig>
References: <20260304162222.836152-1-tabba@google.com>
 <20260304162222.836152-2-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304162222.836152-2-tabba@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_175754_602258_1151FE3E 
X-CRM114-Status: GOOD (  20.57  )
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

On Wed, Mar 04, 2026 at 04:22:21PM +0800, Fuad Tabba wrote:
> When a guest performs an atomic/exclusive operation on memory lacking
> the required attributes, user_mem_abort() injects a data abort and
> returns early. However, it fails to release the reference to the
> host page acquired via __kvm_faultin_pfn().
>
> A malicious guest could repeatedly trigger this fault, leaking host
> page references and eventually causing host memory exhaustion (OOM).
>
> Fix this by consolidating the early error returns to a new out_put_page
> label that correctly calls kvm_release_page_unused().
>
> Fixes: 2937aeec9dc5 ("KVM: arm64: Handle DABT caused by LS64* instructions on unsupported memory")
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>  arch/arm64/kvm/mmu.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index ec2eee857208..e1d6a4f591a9 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1837,10 +1837,8 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  	if (exec_fault && s2_force_noncacheable)
>  		ret = -ENOEXEC;
>
> -	if (ret) {
> -		kvm_release_page_unused(page);
> -		return ret;
> -	}
> +	if (ret)
> +		goto out_put_page;
>
>  	/*
>  	 * Guest performs atomic/exclusive operations on memory with unsupported
> @@ -1850,7 +1848,8 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  	 */

Hi Fuda

>  	if (esr_fsc_is_excl_atomic_fault(kvm_vcpu_get_esr(vcpu))) {
>  		kvm_inject_dabt_excl_atomic(vcpu, kvm_vcpu_get_hfar(vcpu));
> -		return 1;
> +		ret = 1;
> +		goto out_put_page;

I thought the way about do this w/o introduce new label,
but it doesn't work due to the lock asseration inside
kvm_release_faultin_page() w/ if just small changes...

Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>

>  	}
>
>  	if (nested)
> @@ -1936,6 +1935,10 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  		mark_page_dirty_in_slot(kvm, memslot, gfn);
>
>  	return ret != -EAGAIN ? ret : 0;
> +
> +out_put_page:
> +	kvm_release_page_unused(page);
> +	return ret;
>  }
>
>  /* Resolve the access fault by making the page young again. */
> --
> 2.53.0.473.g4a7958ca14-goog
>

