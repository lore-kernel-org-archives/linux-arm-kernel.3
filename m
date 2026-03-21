Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23AED1094486
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 16:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mUMbPUuvCNebvK77eceDd7c/ftuCsUongnqgyREz59M=; b=4S1ytxOMUStQsXNK/5pWsQ4PgK
	LNIe+pOZ5ZP6iXrS5euP3/sxfvvl7iwwRb+HJ6tdx7MnfQTXxXFRSnMetYnVEadtPlYrj2uIdD9Io
	giAXx/kXl9+uLt+vpCE5U+ySvy5CSRq1Q7M9HvaGaKFTa1agCJF67BxqGCMe9ul83a6/zqOlbBoFe
	8u1r/lzo1zCzbvYkUjwn46APSZ4+2UjuUYWvpoda5R3VtuIVE5PjsfvaJ4utyO5kKBDLWdkQJq4Ja
	TzEue5WPIKk0/FxFpVLe9jME04JPq6Pp0RPPOUERRrcbBR8svnIsOPQipOGQV7pKqXJ1ZJFxgSgq8
	VgS5qMAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3z4C-0000000EdgQ-1b4m;
	Sat, 21 Mar 2026 16:20:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3z47-0000000Edfd-2B9i
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Mar 2026 16:20:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0FAF61595;
	Sat, 21 Mar 2026 09:20:34 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 43A9D3F73B;
	Sat, 21 Mar 2026 09:20:35 -0700 (PDT)
Date: Sat, 21 Mar 2026 16:20:27 +0000
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>, 
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>, 
	Vishal Annapurve <vannapurve@google.com>
Subject: Re: [PATCH v13 26/48] arm64: RMI: Create the realm descriptor
Message-ID: <6lw7hpf7ctgvm56js2zwsbu2k73bsyrany6pp7g4qjruhu6m5v@2gs2rvaxizvj>
References: <20260318155413.793430-1-steven.price@arm.com>
 <20260318155413.793430-27-steven.price@arm.com>
 <oukw53xfroe32rb26jy365nqsuttlakkjgpmh6sszdprx6nqfc@qfmwsob2ewa4>
 <a8ae70c5-b225-4c35-bf37-c5b1c91c473e@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8ae70c5-b225-4c35-bf37-c5b1c91c473e@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260321_092045_147557_7F84864C 
X-CRM114-Status: GOOD (  31.20  )
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

On Fri, Mar 20, 2026 at 04:41:12PM +0000, Steven Price wrote:
> On 19/03/2026 18:25, Wei-Lin Chang wrote:
> > On Wed, Mar 18, 2026 at 03:53:50PM +0000, Steven Price wrote:
> >> Creating a realm involves first creating a realm descriptor (RD). This
> >> involves passing the configuration information to the RMM. Do this as
> >> part of realm_ensure_created() so that the realm is created when it is
> >> first needed.
> >>
> >> Signed-off-by: Steven Price <steven.price@arm.com>
> >> ---
> >> Changes since v12:
> >>  * Since RMM page size is now equal to the host's page size various
> >>    calculations are simplified.
> >>  * Switch to using range based APIs to delegate/undelegate.
> >>  * VMID handling is now handled entirely by the RMM.
> >> ---
> >>  arch/arm64/kvm/rmi.c | 94 +++++++++++++++++++++++++++++++++++++++++++-
> >>  1 file changed, 92 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
> >> index 38349c7b34f4..d5fee203824b 100644
> >> --- a/arch/arm64/kvm/rmi.c
> >> +++ b/arch/arm64/kvm/rmi.c
> >> @@ -649,6 +649,83 @@ static void realm_unmap_shared_range(struct kvm *kvm,
> >>  			     start, end);
> >>  }
> >>  
> >> +static int realm_create_rd(struct kvm *kvm)
> >> +{
> >> +	struct realm *realm = &kvm->arch.realm;
> >> +	struct realm_params *params = realm->params;
> >> +	void *rd = NULL;
> >> +	phys_addr_t rd_phys, params_phys;
> >> +	size_t pgd_size = kvm_pgtable_stage2_pgd_size(kvm->arch.mmu.vtcr);
> >> +	int i, r;
> >> +
> >> +	realm->ia_bits = VTCR_EL2_IPA(kvm->arch.mmu.vtcr);
> >> +
> >> +	if (WARN_ON(realm->rd || !realm->params))
> >> +		return -EEXIST;
> >> +
> >> +	rd = (void *)__get_free_page(GFP_KERNEL);
> > 
> > Hi,
> > 
> > Should this be GFP_KERNEL_ACCOUNT?
> 
> Yes that would be better.
> 
> >> +	if (!rd)
> >> +		return -ENOMEM;
> >> +
> >> +	rd_phys = virt_to_phys(rd);
> >> +	if (delegate_page(rd_phys)) {
> >> +		r = -ENXIO;
> >> +		goto free_rd;
> >> +	}
> >> +
> >> +	if (delegate_range(kvm->arch.mmu.pgd_phys, pgd_size)) {
> >> +		r = -ENXIO;
> >> +		goto out_undelegate_tables;
> >> +	}
> >> +
> >> +	params->s2sz = VTCR_EL2_IPA(kvm->arch.mmu.vtcr);
> >> +	params->rtt_level_start = get_start_level(realm);
> >> +	params->rtt_num_start = pgd_size / PAGE_SIZE;
> >> +	params->rtt_base = kvm->arch.mmu.pgd_phys;
> >> +
> >> +	if (kvm->arch.arm_pmu) {
> >> +		params->pmu_num_ctrs = kvm->arch.nr_pmu_counters;
> >> +		params->flags |= RMI_REALM_PARAM_FLAG_PMU;
> >> +	}
> >> +
> >> +	if (kvm_lpa2_is_enabled())
> >> +		params->flags |= RMI_REALM_PARAM_FLAG_LPA2;
> >> +
> >> +	params_phys = virt_to_phys(params);
> >> +
> >> +	if (rmi_realm_create(rd_phys, params_phys)) {
> >> +		r = -ENXIO;
> >> +		goto out_undelegate_tables;
> >> +	}
> >> +
> >> +	if (WARN_ON(rmi_rec_aux_count(rd_phys, &realm->num_aux))) {
> >> +		WARN_ON(rmi_realm_destroy(rd_phys));
> >> +		r = -ENXIO;
> >> +		goto out_undelegate_tables;
> >> +	}
> >> +
> >> +	realm->rd = rd;
> >> +	WRITE_ONCE(realm->state, REALM_STATE_NEW);
> >> +	/* The realm is up, free the parameters.  */
> >> +	free_page((unsigned long)realm->params);
> >> +	realm->params = NULL;
> >> +
> >> +	return 0;
> >> +
> >> +out_undelegate_tables:
> >> +	if (WARN_ON(undelegate_range(kvm->arch.mmu.pgd_phys, i))) {
> >> +		/* Leak the pages if they cannot be returned */
> >> +		kvm->arch.mmu.pgt = NULL;
> > 
> > Did you mean kvm->arch.mmu.pgd_phys = NULL; ?
> 
> No, although I agree this isn't exactly ideal. kvm_free_stage2_pgd()
> uses mmu->pgt to decide whether to free the memory - pgd_phys isn't used
> in that path. Technically here we end up leaking more than just the PGD
> pages in this case, but as it's a "should never happen" case I didn't
> see the need to worry about the leak being a bit larger than necessary.

Thank you for the clarification.

Thanks,
Wei-Lin Chang

> 
> Thanks,
> Steve
> 
> > Thanks,
> > Wei-Lin Chang
> > 
> >> +	}
> >> +	if (WARN_ON(undelegate_page(rd_phys))) {
> >> +		/* Leak the page if it isn't returned */
> >> +		return r;
> >> +	}
> >> +free_rd:
> >> +	free_page((unsigned long)rd);
> >> +	return r;
> >> +}
> >> +
> >>  static void realm_unmap_private_range(struct kvm *kvm,
> >>  				      unsigned long start,
> >>  				      unsigned long end,
> >> @@ -893,8 +970,21 @@ static int realm_init_ipa_state(struct kvm *kvm,
> >>  
> >>  static int realm_ensure_created(struct kvm *kvm)
> >>  {
> >> -	/* Provided in later patch */
> >> -	return -ENXIO;
> >> +	int ret;
> >> +
> >> +	switch (kvm_realm_state(kvm)) {
> >> +	case REALM_STATE_NONE:
> >> +		break;
> >> +	case REALM_STATE_NEW:
> >> +		return 0;
> >> +	case REALM_STATE_DEAD:
> >> +		return -ENXIO;
> >> +	default:
> >> +		return -EBUSY;
> >> +	}
> >> +
> >> +	ret = realm_create_rd(kvm);
> >> +	return ret;
> >>  }
> >>  
> >>  static int set_ripas_of_protected_regions(struct kvm *kvm)
> >> -- 
> >> 2.43.0
> >>
> 

