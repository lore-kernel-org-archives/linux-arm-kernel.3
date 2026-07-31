Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E62C55165
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 00:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tFIvxc0yETXWKpPQGPxspz+paA0ymoMe+1tTXizzsgk=; b=GPpPaGimlyMgMkCwrXJBBW3EP/
	qqYb6bKpfDdVlG1DhX6xtLq/hmqvrTE2VV1vQVSCzVJfWCsIo0CkfhnidhmwwnsTc5U89l+KpUy88
	ehgOaoJaNQdjPG9K6JbOf8gVn2zuLpTY4sF5RbfhP7t8FPqjWg1/DyCy3mSHORcLh9TwJS13kx/R+
	cBWD8wlXTF91i9RVr67SS4GjoRpCQmUTlqFjVhaBmP712nDJip/kfiWiH7DhUXabyyB0KWiBjxvxL
	5x3Fyn9tfUo82VS826KM7pT1uLygx/6GNj4bGYy/XC04IgQUJQCb+FH9flNy2r4g7AaMHkRjuWujg
	eT5TE5Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpbZ6-0000000BZDe-10Bs;
	Fri, 31 Jul 2026 00:57:32 +0000
Received: from esa6.hc1455-7.c3s2.iphmx.com ([68.232.139.139])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpbYy-0000000BZD8-2um4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 00:57:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785459444; x=1816995444;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CldFfWlOgnf4zC1U/6YI+wfPKxwfum0uI/0Ov2QKXAc=;
  b=IYk1u0aTgcAesM/jKVOsGWNsPlWL5TM4MOMarCak+9PgeL508sfpPGvQ
   1OOChHkx0DFvD2idHHSx6FN0U/ctiUtcL11vng2vU1UoG7uuBTFdZ1+vZ
   wQ3JGqJq22SI/tPaJaPjKb/LadXQXv/MCWRo4sMxnVH8wcO8Z5MdQitjP
   IiclSv48sPT+hQ/cFUBvjUD3OyQtLLRTCWUs9/GXC94CHTmIAxdqpCjvy
   KjrLL+x1R8IrrAkbVLITAKJccfvdzaffNrxS1RvWhDTFtr3ZLo+GnTVG9
   AiISbPGK6IlDamDZUz3lZ2gZVFbZrH7EuGmNlVqmTmnY7A0qSdbkhbXg6
   g==;
X-CSE-ConnectionGUID: qokCEiE5RnKsCGACGMN8fg==
X-CSE-MsgGUID: rs5QpKnOTl6qKQkaXOH6Hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="252750412"
X-IronPort-AV: E=Sophos;i="6.25,195,1779116400"; 
   d="scan'208";a="252750412"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 09:57:18 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id D0AB51C01697
	for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 00:57:18 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 88CFFC2BABB
	for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 00:57:18 +0000 (UTC)
Received: from FCCLS0092175.localdomain (unknown [10.9.24.243])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with SMTP id 21DD11800D71;
	Fri, 31 Jul 2026 00:57:08 +0000 (UTC)
Date: Fri, 31 Jul 2026 09:57:06 +0900
From: Kohei Enju <enju.kohei@fujitsu.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>, 
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>, 
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com, Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH v15 14/37] KVM: arm64: CCA: Handle realm enter/exit
Message-ID: <amvx9kxuc6FTkJC4@FCCLS0092175.localdomain>
References: <20260715142841.80544-1-steven.price@arm.com>
 <20260715142841.80544-15-steven.price@arm.com>
 <amcOp7tpRCkI29vt@FCCLS0092175.localdomain>
 <08599315-2dd3-4602-a902-09b197265b44@arm.com>
 <763eb5db-e9af-4b3a-b05b-746700cf0304@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <763eb5db-e9af-4b3a-b05b-746700cf0304@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_175725_300098_0A024731 
X-CRM114-Status: GOOD (  44.89  )
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

On 07/30 15:57, Suzuki K Poulose wrote:
> On 30/07/2026 14:58, Steven Price wrote:
> > On 27/07/2026 09:14, Kohei Enju wrote:
> > > Hi Steven, I have a comment about rec_exit_sys_reg() below.
> > > 
> > > On 07/15 15:28, Steven Price wrote:
> > > > Entering a realm is done using a SMC call to the RMM. On exit the
> > > > exit-codes need to be handled slightly differently to the normal KVM
> > > > path so define our own functions for realm enter/exit and hook them
> > > > in if the guest is a realm guest.
> > > > 
> > > > Signed-off-by: Steven Price <steven.price@arm.com>
> > > > Reviewed-by: Gavin Shan <gshan@redhat.com>
> > > > ---
> > > > Changes since v13:
> > > >   * The RMM is now required to provide an ESR value with the correct
> > > >     information to emulate MMIO, so we no longer need to hardcode 0s in
> > > >     rec_exit_sys_reg().
> > > >   * The PSCI changes mean that there is a potential race when turning on
> > > >     a VCPU which can cause a RMI_ERROR_REC return. Exit to user space
> > > >     with -EAGAIN in this case.
> > > > Changes since v12:
> > > >   * Call guest_state_{enter,exit}_irqoff() around rmi_rec_enter().
> > > >   * Add handling of the IRQ exception case where IRQs need to be briefly
> > > >     enabled before exiting guest timing.
> > > > Changes since v8:
> > > >   * Introduce kvm_rec_pre_enter() called before entering an atomic
> > > >     section to handle operations that might require memory allocation
> > > >     (specifically completing a RIPAS change introduced in a later patch).
> > > >   * Updates to align with upstream changes to hpfar_el2 which now (ab)uses
> > > >     HPFAR_EL2_NS as a valid flag.
> > > >   * Fix exit reason when racing with PSCI shutdown to return
> > > >     KVM_EXIT_SHUTDOWN rather than KVM_EXIT_UNKNOWN.
> > > > Changes since v7:
> > > >   * A return of 0 from kvm_handle_sys_reg() doesn't mean the register has
> > > >     been read (although that can never happen in the current code). Tidy
> > > >     up the condition to handle any future refactoring.
> > > > Changes since v6:
> > > >   * Use vcpu_err() rather than pr_err/kvm_err when there is an associated
> > > >     vcpu to the error.
> > > >   * Return -EFAULT for KVM_EXIT_MEMORY_FAULT as per the documentation for
> > > >     this exit type.
> > > >   * Split code handling a RIPAS change triggered by the guest to the
> > > >     following patch.
> > > > Changes since v5:
> > > >   * For a RIPAS_CHANGE request from the guest perform the actual RIPAS
> > > >     change on next entry rather than immediately on the exit. This allows
> > > >     the VMM to 'reject' a RIPAS change by refusing to continue
> > > >     scheduling.
> > > > Changes since v4:
> > > >   * Rename handle_rme_exit() to handle_rec_exit()
> > > >   * Move the loop to copy registers into the REC enter structure from the
> > > >     to rec_exit_handlers callbacks to kvm_rec_enter(). This fixes a bug
> > > >     where the handler exits to user space and user space wants to modify
> > > >     the GPRS.
> > > >   * Some code rearrangement in rec_exit_ripas_change().
> > > > Changes since v2:
> > > >   * realm_set_ipa_state() now provides an output parameter for the
> > > >     top_iap that was changed. Use this to signal the VMM with the correct
> > > >     range that has been transitioned.
> > > >   * Adapt to previous patch changes.
> > > > ---
> > > > 
> > > > [...]
> > > > 
> > > > +static int rec_exit_sys_reg(struct kvm_vcpu *vcpu)
> > > > +{
> > > > +	struct realm_rec *rec = &vcpu->arch.rec;
> > > > +	unsigned long esr = kvm_vcpu_get_esr(vcpu);
> > > > +	int rt = kvm_vcpu_sys_get_rt(vcpu);
> > > > +	bool is_write = (esr & ESR_ELx_SYS64_ISS_DIR_MASK) == ESR_ELx_SYS64_ISS_DIR_WRITE;
> > > > +	int ret;
> > > > +
> > > > +	if (is_write)
> > > > +		vcpu_set_reg(vcpu, rt, rec->run->exit.gprs[rt]);
> > > 
> > > When rt is 31 (XZR), does exit.gprs[rt] trigger an out-of-bounds read
> > > since REC_RUN_GPRS is 31? Although the padding after the gprs means this
> > > OOB may not cause any practical issue, would it make sense to skip the
> > > access when rt is 31?
> > > 
> 
> RMM mandates that the ESR_ELx.ISS.RT == 0 on an exit due to System register
> access. See "A4.3.4.4 REC exit due to System register access"
> 
> So this shouldn't be a problem, but doesn't hurt to defend the host
> against a malicious RMM ?

Ah, I missed that requirement. The changelog and the old RMM
implementation led me to mistakenly assume tat Rt could be non-zero.

Then special-casing Rt == 31 doesn't really make sense. So keeping the
code as it is seems fine to me:)

Thanks,
Kohei

> 
> Suzuki
> 
> 
> 
> > > if (is_write && rt != 31)
> > >      vcpu_set_reg(vcpu, rt, rec->run->exit.gprs[rt]);
> > 
> > Very true - as you say in practise this isn't a big issue because
> > vcpu_set_reg() is a no-op, so it's just a read of padding. But
> > definitely worth fixing.
> > 
> > > > +
> > > > +	ret = kvm_handle_sys_reg(vcpu);
> > > > +	if (!is_write)
> > > > +		rec->run->enter.gprs[rt] = vcpu_get_reg(vcpu, rt);
> > > 
> > > The same applies here:
> > > 
> > > if (!is_write && rt != 31)
> > >      rec->run->enter.gprs[rt] = vcpu_get_reg(vcpu, rt);
> > 
> > And the same here - a zero written into the padding.
> > 
> > Thanks for the review!
> > 
> > Steve
> > 
> > > > +
> > > > +	return ret;
> > > > +}
> > 
> 

