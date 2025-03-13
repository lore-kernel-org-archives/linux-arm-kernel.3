Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7583FC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 19:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L3F+szF2XQGRywilPjvawnmOy3jehJGbZVMLTgFQTJw=; b=29Kr4yHs29x10xKGvDicjPybX0
	nv8G0HyuwmmRj5Afd65eaQIPOvac7/cPMHrZqsfQTsjBRqpGLcqlN3OFm+AgyaMpoNhxbnumkiTgW
	KB5ygICZATlKcD7BwoKlyU3G/rkYgtGZ9IlexsyE5jeeySlRsMmXgk/7Tlv5LRctjp746SpN/WCRp
	PvtHnc6A3Zl6Vevu7NowRrzABMrBjpOAzBNEsnD2LlyrQlqDJG8DhUUTr0lKWU8OtGxA09HDYlYsP
	ivlMaCSAxxTYOisgir0aNKRXXM4I/TA7i89+etRM6UhwTx3xDUfm1p6j05yhAhMxmodyAOSW9SpNF
	0/olKq0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tso1I-0000000CIU7-2nAt;
	Thu, 13 Mar 2025 19:15:04 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsnzc-0000000CIEt-2nhu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 19:13:21 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-ac25d2b2354so232074866b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Mar 2025 12:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741893199; x=1742497999; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L3F+szF2XQGRywilPjvawnmOy3jehJGbZVMLTgFQTJw=;
        b=Z6KF2A65bH+X1QNfBcdT+yCoFIVJf0f3FHDJJvEiQnO5S0o0MovfctEarrQOVbbSR3
         TL1dmpt9hinxwruR/dQNOoaIHn0P6cmmggZmdCtXZkQeaY8bR79CgKQjLZEvs7+Y0UOu
         4jbC7JHKHawBILFiwH2FEXgzbu6iJ2Bqo+m/WRsCT+6O2So77g93QQbfXNdJCbhGwjcS
         MH+zTvQSj/S/eMI1FB7h4nBS5IcNDyQ5bZydbotaG4XEiF/igeGhrTKzoU2y5ZzmtaNE
         xahvscqPap49rGtZfn4hOqhjpgY4nHGB5omA86swLwBgwTSfZ6gj1cKCqTxs/9ygmG65
         VTYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741893199; x=1742497999;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L3F+szF2XQGRywilPjvawnmOy3jehJGbZVMLTgFQTJw=;
        b=cSrrhJbbsiALG5Z2k2IW0ZJ4oqXpyM45WqbpMQ9qt+pouVj+M38PXVw/BAGCezlv7v
         j/1CeOg6N3VDtT1LMgtKwZG+Sqqxomh7ZdvcIkfk1ZFWeUrJ44LDPMlE8RfE2qzf1FMC
         XakakdvuaDtCYTtn2japWYkA9e0jXrUvauePo1IDzFhdKExOA/9ZuqsMmFvUTHDN1RVT
         QzoOpl+9ZL/idrp/7K6Gix8Ksv3JNH3aep0sxQA0RrhHWS2c9V2VS7qM7rY84tp4wKbd
         jM27Zfrim7f+hnVcwdt65LHirw8WXJIzQ8qNql+sWwYXBi/vDQgI6S1nTnFCqCAfPsiB
         vYgg==
X-Forwarded-Encrypted: i=1; AJvYcCVynMZVwyceFII8wNlrzwqMcnROoBRTGS1Dl2WOVBbcTfZSwx5Qj1o8TTC8fYUVxjDtp4QE/4mmOdjg6rPUsAht@lists.infradead.org
X-Gm-Message-State: AOJu0YzibMIS6eqh1Kr661BR/JttB6MdXOdS5AArMYmxK3AV6V3MMQ3e
	9sMIvFZjEktCdQpkXVjC2DhlTWfntKdMExQW7tDErmTPEthT5Gq4xNSWd3MBElLAD+npJ2szSIC
	TZQ==
X-Gm-Gg: ASbGncsUhWLls/8XypNJayF6jWEBJvzHJCmNy0TMft0D7qwxl12LD72UGTdKcDYRpMX
	6evtpR2q+obV9qnqrlYsO96vZsXogLdz/56pkHP03aQEcAkDdRCWnDouEn/e+Gi8qYzGC3JOjIy
	BhR4rbRVsAAMH2lN5w5H8CBsdmmc3DOCzEuPd9Gj1q5ZdwUP9v1PeeLGuCNS6QJrdf7kbTF3zyg
	Yc3x3dqq949FBqrtyJ9BDOe0/pOV/F3AC4v0i1+KA3tn/g4C8XeVhdZYokHKlndIYQWymIkIQME
	E4Kxg63ypGfl5/qOx0LHCfAYNdjL/58eDY8lzPOlJ/THnWwf878nXyAwLU/9vlChVaoL8VIzK4y
	063SIB4xixemM6Q==
X-Google-Smtp-Source: AGHT+IEanomM0uBClXIAdabeKJSIm41T83oGDtOVqnFsMRhIN+NlCFIyaB46i6op0dkiYwNIf1+dsA==
X-Received: by 2002:a17:907:9718:b0:abf:c20d:501a with SMTP id a640c23a62f3a-ac3290b6383mr73370666b.16.1741893198827;
        Thu, 13 Mar 2025 12:13:18 -0700 (PDT)
Received: from google.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3149ced82sm113262066b.123.2025.03.13.12.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 12:13:18 -0700 (PDT)
Date: Thu, 13 Mar 2025 19:13:14 +0000
From: Quentin Perret <qperret@google.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] KVM: arm64: Move hyp state to hyp_vmemmap
Message-ID: <Z9MuSsOQuTy1kAwK@google.com>
References: <20250227003310.367350-1-qperret@google.com>
 <20250227003310.367350-5-qperret@google.com>
 <Z8V6xOVCPp7OOX6g@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8V6xOVCPp7OOX6g@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_121320_705612_DFC5DEB7 
X-CRM114-Status: GOOD (  17.96  )
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

On Monday 03 Mar 2025 at 09:47:48 (+0000), Vincent Donnefort wrote:
> [...]
> 
> > diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
> > index 1a414288fe8c..955c431af5d0 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/setup.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/setup.c
> > @@ -194,16 +194,20 @@ static int fix_host_ownership_walker(const struct kvm_pgtable_visit_ctx *ctx,
> >  
> >  	/*
> >  	 * Adjust the host stage-2 mappings to match the ownership attributes
> > -	 * configured in the hypervisor stage-1.
> > +	 * configured in the hypervisor stage-1, and make sure to propagate them
> > +	 * to the hyp_vmemmap state.
> >  	 */
> >  	state = pkvm_getstate(kvm_pgtable_hyp_pte_prot(ctx->old));
> >  	switch (state) {
> >  	case PKVM_PAGE_OWNED:
> > +		set_hyp_state(phys, PKVM_PAGE_OWNED);
> >  		return host_stage2_set_owner_locked(phys, PAGE_SIZE, PKVM_ID_HYP);
> >  	case PKVM_PAGE_SHARED_OWNED:
> > +		set_hyp_state(phys, PKVM_PAGE_SHARED_OWNED);
> >  		set_host_state(phys, PKVM_PAGE_SHARED_BORROWED);
> >  		break;
> >  	case PKVM_PAGE_SHARED_BORROWED:
> > +		set_hyp_state(phys, PKVM_PAGE_SHARED_BORROWED);
> >  		set_host_state(phys, PKVM_PAGE_SHARED_OWNED);
> >  		break;
> >  	default:
> 
> Are the SHARED_OWNED/SHARED_BORROWED still relevant since the introduction of
> "KVM: arm64: Don't map 'kvm_vgic_global_state' at EL2 with pKVM"? It doesn't
> seem we have any !OWNED pages in the hyp anymore at setup, do we?

That's a good point. I personally don't hate that we have this code here
for completeness though -- it's simple enough that maintaining it isn't
too bad, and if we were to add shared pages in the future it would 'just
work'. But no strong opinion. I guess we could also remove this code as
a separate clean-up, this isn't specific to this series.

Thanks!
Quentin

