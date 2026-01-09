Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EFE4D1A63C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 15:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=91bpRnE6Gb8DMreWLKPHh9kvKoduCxVckLaEb/IMV9o=; b=PUgFwa0P8ejnKWYqEi200Z/M7E
	N5qLRCAznJsXhijDeYZ3fuPNRDF2BROCaN/iH7pYxgwr4102m7SR+r6o07RyThQjt9D7KmAscydGb
	+ztRqeyNqb6Rkc6aTdJuRZJ44ClZY9sReXOEg5riHffZywXiAdp0eN7Nh0iAEJvEFMyIIOgDzn2CU
	iTQEfu7ddYewAnNjT72icFbL0nqKcb3clwMagdRT+wvZAHqSE+CM9VCp+aQdyyF/WGJwTs5/m3LfA
	IwbCLNXwmz5ZvRr+0pESIyS8R6VfgctgYQ8FUqMJb3WhQAQ59M+/4Zw+4qDFCbtdMw7SkM000Z97H
	he6gPlBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veDzs-00000002Row-3NJk;
	Fri, 09 Jan 2026 15:01:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veDzp-00000002Roc-4Ad4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 15:01:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5005D43779;
	Fri,  9 Jan 2026 15:01:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9C72C4CEF1;
	Fri,  9 Jan 2026 15:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767970909;
	bh=EfyZeMcdGYG1Wkkz7uSj7yy5+WlI+vUfvjVYy8QffGY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZBW6RbGZKKBFHftx6uokbHQpCynVoLmZs2NICmpUa1v7bXPBGAjwFKxfhn8t90NJI
	 zEqfWNsJ/whwreBSBoTh6zBwAxXnOLahBravaIY/qNtxT9LZVXpl36avlzcN61vav5
	 yixpkpJNrRNQTvf53dE1ViP2FzWK9NQrgHze4huLEqNPq7TLNMfA1D8/0mZjW/ylRf
	 LZrczl6JSkv7lNxbC4buxZCUtxPevDHOJRlxW/Me2VdWR4IFE9PHCUckqCWrDf/O0e
	 WJygYDeM6k9GZ3RiZhqKJcZ+iD3v+yYBAr4IgxFDxmNvW8E4qjwwlzBoLGzQqKtA8T
	 4RpZrGWFI11nQ==
Date: Fri, 9 Jan 2026 15:01:43 +0000
From: Will Deacon <will@kernel.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>, Fuad Tabba <tabba@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH 24/30] KVM: arm64: Implement the MEM_SHARE hypercall for
 protected VMs
Message-ID: <aWEYV-Pg5tPCtvaQ@willie-the-truck>
References: <20260105154939.11041-1-will@kernel.org>
 <20260105154939.11041-25-will@kernel.org>
 <aV0uJDtZwbu2iKhs@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aV0uJDtZwbu2iKhs@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_070150_057406_70A8B4A3 
X-CRM114-Status: GOOD (  10.06  )
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

On Tue, Jan 06, 2026 at 03:45:40PM +0000, Vincent Donnefort wrote:
> [...]
> 
> > @@ -952,6 +1004,7 @@ bool kvm_handle_pvm_hvc64(struct kvm_vcpu *vcpu, u64 *exit_code)
> >  	case ARM_SMCCC_VENDOR_HYP_KVM_FEATURES_FUNC_ID:
> >  		val[0] = BIT(ARM_SMCCC_KVM_FUNC_FEATURES);
> >  		val[0] |= BIT(ARM_SMCCC_KVM_FUNC_HYP_MEMINFO);
> > +		val[0] |= BIT(ARM_SMCCC_KVM_FUNC_MEM_SHARE);
> >  		break;
> >  	case ARM_SMCCC_VENDOR_HYP_KVM_HYP_MEMINFO_FUNC_ID:
> >  		if (smccc_get_arg1(vcpu) ||
> > @@ -962,6 +1015,14 @@ bool kvm_handle_pvm_hvc64(struct kvm_vcpu *vcpu, u64 *exit_code)
> >  
> >  		val[0] = PAGE_SIZE;
> >  		break;
> > +	case ARM_SMCCC_VENDOR_HYP_KVM_MEM_SHARE_FUNC_ID:
> > +		if (smccc_get_arg2(vcpu) ||
> > +		    smccc_get_arg3(vcpu)) {
> > +			break;
> > +		}
> 
> I wonder if that shouldn't go into pkvm_memshare_call(): that function has the
> knowledge of the argument content since we pass vcpu.

I decided to keep all the zero-arg checking in the top-level switch so
that people adding new hypercalls are encouraged to add those checks as
well :p

> Otherwise:
> 
> Reviewed-by: Vincent Donnefort <vdonnefort@google.com>

Thanks,

Will

