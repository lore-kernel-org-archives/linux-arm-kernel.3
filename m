Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5BAAC71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 15:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FemfCvwPI1sDLnCeWH/MNoLhCskB/n+f+BSTLifK+Wg=; b=RrgePy/WSbTKcn9DP1FFTXvAsx
	8KtIeLSs6zogDpnBZDp0wTLVLrQhWPAdHmCAyAjbh4HN/Qm0fAwv7wLkLgCtccfZaXeMFwqzRNvXr
	wGjWd5hdq5tG3fek4J9zIYTuM/Wb43rkoSoVEhUmxCMOmlaD8xM1cRM3U/iHoQImI8cB2XUwUYLxL
	ltZx8rJ5bHLlcm5F0f6aFms5kIxWsVsUW7YD4C0q1zlFuD2k/1ISq+wTT5fQBYdAj3KMyAY9aNgPW
	ceydRJ10DAr5mrpNCqE30UWvCg/vr5Zu5taws/2VrpFTmX1JRGif1LRLSMtw81CRf7haDDETveZWq
	i9f0Absw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRYh6-00000007oPv-38MU;
	Tue, 17 Jun 2025 15:57:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRXdk-00000007doG-3qUN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 14:50:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A0FA243F3C;
	Tue, 17 Jun 2025 14:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55311C4CEE3;
	Tue, 17 Jun 2025 14:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750171820;
	bh=vcZN/uU0Z+D8+9jFTvc1z2F6ONl+fjkhBpzf5Kdq9CU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A0+YY0EVIITtA40tAwzQzDmH/iGvRkWodYkM2BCdZc1UB2XNmBqOxD/1GWCYFwdjZ
	 f83THZKNo3sMSBPUtmNm2BIgcsk+Yysf/zFnJ2anqIxIeIjFrDZpCS5oaLfKu07v71
	 BHKqvPyjGlD/cUOttYS6tEdIS3gzTsfP6rjS6lQgjEXQYe7KwqCuHAWr+m+8Q1i7DL
	 32yRoA3HxlAoPkZ48bhAlXHf/kinoOQmlUcaC+rhhnbSBRMS9de8WTz94GF9EaR3oT
	 IdR56IFaIRJT+mCKsvqqQDINhRs0UDN7UncakMdcUV/d8nnPCWs5GWFUfUiXiZm2EB
	 jSu365NQOVUug==
Date: Tue, 17 Jun 2025 20:19:00 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Paolo Bonzini <pbonzini@redhat.com>, Joerg Roedel <joro@8bytes.org>, 
	David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org, Sairaj Kodilkar <sarunkod@amd.com>, 
	Vasant Hegde <vasant.hegde@amd.com>, Maxim Levitsky <mlevitsk@redhat.com>, 
	Joao Martins <joao.m.martins@oracle.com>, Francesco Lavra <francescolavra.fl@gmail.com>, 
	David Matlack <dmatlack@google.com>
Subject: Re: [PATCH v3 13/62] KVM: SVM: Drop redundant check in AVIC code on
 ID during vCPU creation
Message-ID: <qusmkqqsvc7hyuemddv66mooach7mdq66mxbk7qbr6if6spguj@k57k5lqmvt5u>
References: <20250611224604.313496-2-seanjc@google.com>
 <20250611224604.313496-15-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611224604.313496-15-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_075020_981065_B880C814 
X-CRM114-Status: GOOD (  12.85  )
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

On Wed, Jun 11, 2025 at 03:45:16PM -0700, Sean Christopherson wrote:
>  static int avic_init_backing_page(struct kvm_vcpu *vcpu)
>  {
> -	u64 *entry, new_entry;
> -	int id = vcpu->vcpu_id;
> +	struct kvm_svm *kvm_svm = to_kvm_svm(vcpu->kvm);
>  	struct vcpu_svm *svm = to_svm(vcpu);
> +	u32 id = vcpu->vcpu_id;
> +	u64 *table, new_entry;
>  
>  	/*
>  	 * Inhibit AVIC if the vCPU ID is bigger than what is supported by AVIC
> @@ -291,6 +277,9 @@ static int avic_init_backing_page(struct kvm_vcpu *vcpu)
>  		return 0;
>  	}
>  
> +	BUILD_BUG_ON((AVIC_MAX_PHYSICAL_ID + 1) * sizeof(*table) > PAGE_SIZE ||
> +		     (X2AVIC_MAX_PHYSICAL_ID + 1) * sizeof(*table) > PAGE_SIZE);
						    ^^^^^^^^^^^^^^
Renaming new_entry to just 'entry' and using sizeof(entry) makes this 
more readable for me. Otherwise, for this patch:
Reviewed-by: Naveen N Rao (AMD) <naveen@kernel.org>


As an aside, there are a few static asserts to validate some of the 
related macros. Can this also be a static_assert(), or is there is 
reason to prefer BUILD_BUG_ON()?


- Naveen


