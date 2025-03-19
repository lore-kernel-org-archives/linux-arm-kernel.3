Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BDDBC35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 10:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zy1J4wxCILEpjEj6qgGPZ/dzo8hPBVUSehdt+nTpsyU=; b=0ffHyMCYHUfgbM0R10FNhsrxtr
	5EDbwe+PylPBNLUkUK3RW9zzvy6upQSeH6wobuyhio83gn8Tf/76cyxO0JiZf6zv+3bzzy47KbFoa
	n+ft34yjCSOrcB6HWIrVQdszGdOFmisOqp/aA3+ThnD4cOlSKHUXxweLrLmtTjGa6pIDMQboH3NZK
	tzCPyMerkeFBh6EIQGzJiKfxihTPmEqIKMep8hjH1V0jTJz4qCP/03hxABLF0SSoIMmY1gqEQv0Lg
	XCCC75whwTSxfzDwN57Tp0M3hqyrxHTKkTkdtkwOlu8hJoF3pl2Le5lx8BAS0gilmxRwwVlq5Nwhm
	5DdiNxXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuqig-00000008fWL-0Thb;
	Wed, 19 Mar 2025 10:32:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuqfq-00000008fFv-2ocv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 10:29:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B52412FC;
	Wed, 19 Mar 2025 03:29:27 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 14C713F694;
	Wed, 19 Mar 2025 03:29:16 -0700 (PDT)
Date: Wed, 19 Mar 2025 10:29:14 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH 6.13 8/8] KVM: arm64: Eagerly switch ZCR_EL{1,2}
Message-ID: <Z9qcem7BVeuRd5XD@J2N7QTR9R3>
References: <20250312-stable-sve-6-13-v1-0-c7ba07a6f4f7@kernel.org>
 <20250312-stable-sve-6-13-v1-8-c7ba07a6f4f7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250312-stable-sve-6-13-v1-8-c7ba07a6f4f7@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_032922_756104_97BFD3C0 
X-CRM114-Status: GOOD (  12.37  )
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

On Wed, Mar 12, 2025 at 11:49:16PM +0000, Mark Brown wrote:
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> index 7262983c75fbc18ab44f52753bff1dd9167a68d3..84326765c66087d992a517a19fea94b04c39c994 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> @@ -5,6 +5,7 @@
>   */
>  
>  #include <hyp/adjust_pc.h>
> +#include <hyp/switch.h>
>  
>  #include <asm/pgtable-types.h>
>  #include <asm/kvm_asm.h>
> @@ -178,8 +179,12 @@ static void handle___kvm_vcpu_run(struct kvm_cpu_context *host_ctxt)
>  		sync_hyp_vcpu(hyp_vcpu);
>  		pkvm_put_hyp_vcpu(hyp_vcpu);
>  	} else {
> +		struct kvm_vcpu *vcpu = kern_hyp_va(host_vcpu);
> +
>  		/* The host is fully trusted, run its vCPU directly. */
> -		ret = __kvm_vcpu_run(host_vcpu);
> +		fpsimd_lazy_switch_to_guest(vcpu);
> +		ret = __kvm_vcpu_run(vcpu);
> +		fpsimd_lazy_switch_to_host(vcpu);
>  	}

As Gavin noted [1] for the v6.12 backport, the addition of kern_hyp_va()
is not correct, since 'host_vcpu' has already been converted to a hyp VA
at this point.

[1] https://lore.kernel.org/linux-arm-kernel/019afc2d-b047-4e33-971c-7debbbaec84d@redhat.com/#t

Mark.

