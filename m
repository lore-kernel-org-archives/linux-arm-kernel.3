Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE04C71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 16:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vCCUroqKPbiJJ17Nuebi9IjJZUo5bSpMus2Ix4G+6gM=; b=AQq8AoTVSZbZU98Kme8fhXce6Y
	odchpPXaT0AS/cAJyD97QezAH2cI3KLeQLvcKiyZVuZyGsiGPT8MT6xAVse8vv9Vs51IJ8EVzZwPZ
	DuSxIynymNYGadOO/90kKdSbv4SNYSc+Izgaacj3dhXWOB+fWnjyNbnTHs1rWdm536nKExGt1x3q9
	DPEAUYW/HaXMWJc7rhv56o4QI4m04hFMzKzLSPPa6ZOt8yedBJwO6Zkdi9vwBGp1y1vsDVNfkYwoO
	G3J+41Es4Dyk0t8WLWtwT6Od+KPriVAjbdbZoXXHXL/MBWx/jBf8mtvuxHAFfhwVh/dpuxAJP2mW7
	s78rwsjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ6ph-0000000GzGD-3fdZ;
	Fri, 13 Jun 2025 16:00:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ5jm-0000000Glho-18U5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 14:50:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A83B24A9F4;
	Fri, 13 Jun 2025 14:50:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA233C4CEF0;
	Fri, 13 Jun 2025 14:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749826233;
	bh=JD0gFeCUEl8TiGFgMAnaGs74gyKTlAHzY+Py5LzUKjQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KeCYzdXgP26k1gwX5o9SSDgvrzbb28BxL4FBy5Z4db5fOz7SxhW8ES0V22rPFTmyO
	 fSAXyriI+USEQEoC0k+wqQiaK6dJzrOB77hzLfKvPFHhEIm3cEtZMGaY5vSFDunuDQ
	 3NEPfnlxEnKJSZ+HlKYH9R+NHwu62A/HjqeDgng+Ba89V9/pIVh/09PeWjucgBZMPF
	 6cZ2aPNCh8wF0+f0PGr8Rg4oyQC1iSLdy1aziraNRm96SCGy7MEUbTeO8PHocUzJyy
	 VHkahhYaBVPeD0Ic92roBA4VoMvLQOh6g0MYgQ1ZO1/FeI4o/GZTGyOI4fpYp7qz7G
	 lSsiuKFi8u6Jg==
Date: Fri, 13 Jun 2025 20:14:47 +0530
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
Subject: Re: [PATCH v3 11/62] KVM: SVM: Drop vcpu_svm's pointless
 avic_backing_page field
Message-ID: <h4ofo2jby6glf7v6u3p2tbx6ism6s2sxtwx2pclavxnyckec7u@2ysnvrtga7a3>
References: <20250611224604.313496-2-seanjc@google.com>
 <20250611224604.313496-13-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611224604.313496-13-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_075034_330959_E9BC6C66 
X-CRM114-Status: GOOD (  17.57  )
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

On Wed, Jun 11, 2025 at 03:45:14PM -0700, Sean Christopherson wrote:
> Drop vcpu_svm's avic_backing_page pointer and instead grab the physical
> address of KVM's vAPIC page directly from the source.  Getting a physical
> address from a kernel virtual address is not an expensive operation, and
> getting the physical address from a struct page is *more* expensive for
> CONFIG_SPARSEMEM=y kernels.  Regardless, none of the paths that consume
> the address are hot paths, i.e. shaving cycles is not a priority.
> 
> Eliminating the "cache" means KVM doesn't have to worry about the cache
> being invalid, which will simplify a future fix when dealing with vCPU IDs
> that are too big.
> 
> WARN if KVM attempts to allocate a vCPU's AVIC backing page without an
> in-kernel local APIC.  avic_init_vcpu() bails early if the APIC is not
> in-kernel, and KVM disallows enabling an in-kernel APIC after vCPUs have
> been created, i.e. it should be impossible to reach
> avic_init_backing_page() without the vAPIC being allocated.
> 
> Tested-by: Sairaj Kodilkar <sarunkod@amd.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/svm/avic.c | 6 ++----
>  arch/x86/kvm/svm/svm.h  | 1 -
>  2 files changed, 2 insertions(+), 5 deletions(-)

Reviewed-by: Naveen N Rao (AMD) <naveen@kernel.org>

- Naveen


