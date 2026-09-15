Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C68E9C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 10:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a9NV0VpciI2+uEIkOtgXRus44OXlKSY5wyzpastSg2Y=; b=WoDaBKyA1/LbjygubyuJSuEHVv
	HgNOUKT2Mr+y8WH4Pkf0oVbAXOZJ7DqPkuLQ59ZQbu1V5GdBSBhi8lUBc3JUjWtSkY45Y7zzFjVYK
	ZR3JPJ/LW4A1bUt/mIyuQJ+cwGp4mbEGPiJYccOD1F7UUit7CqsZjW2gD+BMetyAXR1ByNvtmG3Yu
	9pDKKKfPofDkLoXqk6I7hFGhmXyqV33Lm8Do4h7XwgEFmRwm/p70sM+7/2OidTbXWOa5GZo3txKO4
	JwhstPTNrsttlT0bG+tkEl1AsGFE/7oR+wxHU0Vm6T7WbIuCl22oEWjIGg5ghDmCrmbbo19K6Fuiz
	KH3TE6tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Qhw-000000060Mq-2LE6;
	Tue, 15 Sep 2026 10:48:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Qho-000000060IG-1d3i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 10:48:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 31AD91570;
	Tue, 15 Sep 2026 03:47:59 -0700 (PDT)
Received: from e143914.arm.com (e143914.arm.com [10.2.213.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D081C3F7B4;
	Tue, 15 Sep 2026 03:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789469282; bh=brY21PorPsciGcHuNVN5/hjjXSISCVYon+MJGGX8R/4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i002nmcy+W/6o87jdKBxvVPr5ompRaptkrUIwoJVN0YsKCZq3yEA3vZ3h1YSRkm0n
	 nbXsSZVKReqgQjPKucdtcz6WChsPcMzZ4y86LmCByEvaiWWCCBAeOVFNbmQirN4hDF
	 2NVNWpGXprPVwk+jAfMB6HML5wnEZUw4NpkMTjHY=
Date: Tue, 15 Sep 2026 11:47:58 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com, will@kernel.org, seiden@linux.ibm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com, mark.rutland@arm.com,
	steven.price@arm.com, vdonnefort@google.com, qperret@google.com,
	tabba@google.com
Subject: Re: [PATCH v2 2/2] KVM: arm64: Pin the host vCPU before adjusting
 its PC under pKVM
Message-ID: <aqkiXqjSZyyqHZ5y@e143914.arm.com>
References: <20260915070418.3209779-1-fuad.tabba@linux.dev>
 <20260915070418.3209779-3-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915070418.3209779-3-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_034804_480663_C5AA26F9 
X-CRM114-Status: GOOD (  22.22  )
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

Hi,

On Tue, Sep 15, 2026 at 08:04:18AM +0100, Fuad Tabba wrote:
> Under pKVM, a page the host shares with EL2 is mapped at EL2 only while
> it's pinned, and the host vCPU is pinned at its first KVM_RUN.
> KVM_SET_VCPU_EVENTS with ext_dabt_pending reaches __kvm_adjust_pc() at
> EL2 before that, and dereferencing the unmapped host vCPU panics the
> hypervisor. Any process holding /dev/kvm on a pKVM host can trigger it.
> 
> Pin the host vCPU around the adjustment when no hyp vCPU is loaded for
> it. A loaded hyp vCPU implies it's pinned. A pin fails only for memory
> the host never shared, and the request is then dropped like any other
> bad host pointer.
> 
> Fixes: efa1368ba9f4b ("KVM: arm64: Commit exceptions from KVM_SET_VCPU_EVENTS immediately")
> Cc: stable@vger.kernel.org
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> index 9a3b92e626adb..4cb7347db2514 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> @@ -542,8 +542,25 @@ static void handle___pkvm_host_mkyoung_guest(struct kvm_cpu_context *host_ctxt)
>  static void handle___kvm_adjust_pc(struct kvm_cpu_context *host_ctxt)
>  {
>  	DECLARE_REG(struct kvm_vcpu *, vcpu, host_ctxt, 1);
> +	struct pkvm_hyp_vcpu *hyp_vcpu;
> +	struct kvm_vcpu *host_vcpu;
>  
> -	__kvm_adjust_pc(kern_hyp_va(vcpu));
> +	host_vcpu = __get_host_hyp_vcpus(vcpu, &hyp_vcpu);
> +	if (host_vcpu) {
> +		__kvm_adjust_pc(host_vcpu);
> +		return;
> +	}
> +
> +	/*
> +	 * With no hyp vCPU loaded for it, the host vCPU may be unpinned,
> +	 * and so unmapped at EL2: its first run pins it.

* A pin only fails if the memory was never shared, drop the request if
* it is a bad host pointer.

Or something like the commit message says.

> +	 */
> +	host_vcpu = kern_hyp_va(vcpu);
> +	if (hyp_pin_shared_mem(host_vcpu, host_vcpu + 1))
> +		return;
> +
> +	__kvm_adjust_pc(host_vcpu);
> +	hyp_unpin_shared_mem(host_vcpu, host_vcpu + 1);
>  }
>  
>  static void handle___kvm_flush_vm_context(struct kvm_cpu_context *host_ctxt)

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

Thanks,
Joey

