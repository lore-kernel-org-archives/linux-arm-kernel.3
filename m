Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DBF606B5EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 14:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MeHmi6b2;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QYF5wnRL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GK/zYkbxN3VzWhtqC7xjmL7luflOc6FLP0sVUxCWVtk=; b=MeHmi6b2NIZWjuQDbDEw/evF/1
	o07UJiS49zuWSyBYFsr1uke643AglAApxS46AI+9Mcg0G1aUDp79RWlDmACIXgT12v5EdiLq75AL4
	S0aiFCtC6Qm3xL0+uZB6sX/3kDJplpPckx8xGRSyQLs8559ht/BmivzqERhDcTrPFlbFUdaXpu8lz
	MoGNd62lzO3pRHlkfCd+3+opro1ic5bbM8Yi7bUlhZzJizCkPwvVjrx8FCUd9WQURElFT+xgAnahn
	JFYoSdaCjNoK+DYI8RhlUP6kqYiNADYrIGGjDxrOryvxTq5E2T/L62vEw9LSIl08AXX+sMUTwERB5
	C+v6bFzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsqc-0000000GlOC-1FJN;
	Mon, 02 Nov 2026 14:17:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsqb-0000000GlNn-0ETD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 14:17:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7415042A40;
	Mon,  2 Nov 2026 14:17:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41BEF1F00A16;
	Mon,  2 Nov 2026 14:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793629036;
	bh=GK/zYkbxN3VzWhtqC7xjmL7luflOc6FLP0sVUxCWVtk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QYF5wnRLn3/Kjp+T10uY3n4JfNN1Eu67yKdslXUOeWH2xWJflEuXY19aJmVA2tOXu
	 OEX25YRIFH/swIxrowWUdW05nA4tjobSWn4yu0prjH90eBZVn4qsX9q+GVNNkQVVOp
	 Dt8gVb23xnnaiS1rcPy6BiWy4+htQA/MHh/Ukgok722SNyIGbnHBjUuBaXq/d5jqsI
	 BH+AJMyuzVFFOUA0HWO4hLvPE9vionC6e+SpCKUDi/IoQlft65q+hZlTWX9Iy6r8uL
	 2+Lx3qgNiAvEe+r0yB3oDqpfPyAm38jZs8tLyPdXIEKp2lr0T+Z7T6Yv5W7P9GW6L8
	 Cb1CQ+ngDXKEA==
Date: Mon, 2 Nov 2026 14:17:10 +0000
From: Will Deacon <will@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH] KVM: arm64: Don't livelock when AT can't resolve a fault
 IPA
Message-ID: <auibZqSgrijjigWM@willie-the-truck>
References: <20261102094748.2638468-2-ardb+git@google.com>
 <auiXMN5td-2QlDkd@willie-the-truck>
 <86fqxj2ulm.wl-maz@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86fqxj2ulm.wl-maz@kernel.org>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 02:09:25PM +0000, Marc Zyngier wrote:
> On Mon, 02 Nov 2026 13:59:12 +0000,
> Will Deacon <will@kernel.org> wrote:
> > 
> > On Mon, Nov 02, 2026 at 10:47:49AM +0100, Ard Biesheuvel wrote:
> > > From: Ard Biesheuvel <ardb@kernel.org>
> 
> [...]
> 
> > > diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
> > > index e0c55644224c..4ba61b71d511 100644
> > > --- a/arch/arm64/kvm/hyp/include/hyp/switch.h
> > > +++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
> > > @@ -843,8 +843,21 @@ static inline bool kvm_hyp_handle_cp15_32(struct kvm_vcpu *vcpu, u64 *exit_code)
> > >  static inline bool kvm_hyp_handle_memory_fault(struct kvm_vcpu *vcpu,
> > >  					       u64 *exit_code)
> > >  {
> > > -	if (!__populate_fault_info(vcpu))
> > > +	if (!__populate_fault_info(vcpu)) {
> > 
> > Presumably we need a barrier (DSB?) here, to ensure that the TLBI happens
> > after the AT instruction?
> >
> > > +		/*
> > > +		 * The AT couldn't resolve the IPA, typically because its
> > > +		 * stage-1 walk took a stage-2 fault, such as an Access flag
> > > +		 * fault on an aged page-table page. If the guest still has a
> > > +		 * cached translation for the VA, it won't take that fault
> > > +		 * itself, and would replay the same permission fault forever.
> > > +		 * Drop this VMID's TLB entries on this CPU, so that the replay
> > > +		 * walks the page tables and faults with a valid HPFAR_EL2.
> > > +		 */
> > > +		__tlbi(vmalls12e1);
> > 
> > Can we get away with an ALLE1 here, or do we really need to blow away the
> > whole lot?
> 
> ALLE1 blows EL1 translations for all VMIDs, while VMALLS12E1 is
> localised to this VMID. Feels like the latter is the least invasive
> option.
> 
> Alternatively, VMALLE1 or even VAE1 should be enough to get rid of the
> S1 TLB.

Ah, sorry, VMALLE1 is what I meant to ask about. I basically haven't
understood the need to invalidate the stage-2.

Will

