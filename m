Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C027C982EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 18:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3snj98fmjbtANq16+FRyVMqVPheby92j6W8WIjGOO5U=; b=opljAMmye+KUtUMQgKPD+uuo4X
	SspBchSQRbzz4sQvw4PpakFy5wxLOdbzuYn2BvByNNypuGCubxInd7iQT+cVS12DzSSzKhuTRPX3L
	ujJxumJzNEIcBhyHIsIMLlkpxncKsKzAkXejee/eNFoSvn/8GcAVnuNw2CH/1p+BZGPycKr81Q2Tn
	XTs7PtatKCFtib4e/dQMx6rnmOBzXL/RnUfiygxXIXFfamWZArPGO/q1Sv8GH427wPcNPyD/gjFBE
	gHbN9I0lrdGNoa5TeOBne+c3oYAwfGwAsJzRud2fJYUfOmzOva7okCa5jPAimDYCueekkQFfWJSMu
	kmL1foRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ivR-00000003995-2c7W;
	Mon, 21 Sep 2026 18:39:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ivP-0000000398q-431p
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 18:39:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D8BEB60008;
	Mon, 21 Sep 2026 18:39:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65F8A1F000FF;
	Mon, 21 Sep 2026 18:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790015974;
	bh=3snj98fmjbtANq16+FRyVMqVPheby92j6W8WIjGOO5U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jr8/IKplV+dmJmKP3CopP8NRnqIhbL8ZKCRP+bIIpuuEMVbmoILBjslfEmsTzXhgd
	 80Xid8Aiv7Dm/fZ9FXXOPbtLlcDFsJE9H6zQXmNr32c4X5+It5RqPvu3lJvXS0CovZ
	 C7zQtS0RH9NhGrErWzgjoNrAy9k/Xu2so61zDWM6vjMgb/xDEaGAmFxhIHLeAyssvd
	 1zlStONeGroUdQXq+7aSu7q9MtE+XSs2N1vlQc5uFQEMlpAg8qP1RONlU5UZOM2mQt
	 29hrOl0y2kFV0BFWJOteoBIwlIwbWMaf5lppsOL9vA8qv0wqmZ3FcN9SWfy6NK7plP
	 6zKnVwlD9BnOw==
Date: Mon, 21 Sep 2026 11:39:33 -0700
From: Oliver Upton <oupton@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>,
	Jack Thomson <jackabt@amazon.com>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] KVM: arm64: Restore the VM's feature bitmap when
 kvm_setup_vcpu() fails
Message-ID: <arF55dt3_i4nxoSA@kernel.org>
References: <20260921063718.1604533-1-fuad.tabba@linux.dev>
 <arDYHSlFHm_XzGvN@kernel.org>
 <CA+EHjTz0-qS8RRhdT8XjAgWqKhgjjzbRsZ_jwTBVqM-8pXk7Vw@mail.gmail.com>
 <arEskPHpAPQf5SAb@gremlin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arEskPHpAPQf5SAb@gremlin>
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

Hey Lorenzo,

On Mon, Sep 21, 2026 at 02:34:12PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Mon, Sep 21, 2026 at 08:24:56AM +0100, Fuad Tabba wrote:
> > Hi Oliver,
> >
> > On Mon, 21 Sep 2026 00:09:17 -0700, Oliver Upton <oupton@kernel.org> wrote:
> > [...]
> > > > Nothing in the tree loads a vCPU whose init failed, so this is latent.
> > > > The upcoming series that enables KVM_PRE_FAULT_MEMORY for arm64 exposes
> > > > it: the generic kvm_vcpu_pre_fault_memory() calls vcpu_load() whether
> > > > or not the vCPU has been initialised.
> > >
> > > That's a bug, not a feature. We should require an initialized vcpu for
> > > the ioctl.
> >
> > That one is for Lorenzo then :) I'll reword the message so the stale
> > bitmap comes first and the pre-fault crash is just how it showed up.
> 
> In general this is the behaviour of _generic_ KVM code
> (kvm_vcpu_pre_fault_memory()), which itself does not require an initialised
> vCPU, and no other arch seems to requires that either in the arch-specific
> pre-fault code.
> 
> The actual pre-faulting implementation intentionally only targets the
> canonical MMU to fault in S2 page tables, which doesn't need initialisation
> to have taken place AFAICT.
> 
> However I could add:
> 
> 	if (!kvm_vcpu_initialized(vcpu))
> 		return -ENOEXEC;
> 
> To kvm_arch_vcpu_pre_fault_memory(), which would make this a requirement,
> though that would bring us out of line with other archs.

Actually, we need this enforcement to happen before the arch-generic
implementation calls vcpu_load(). So that would be some amount of
kvm_arch_* boilerplate added to the generic code to enforce this
requirement like we do on the other vCPU ioctls.

I'm not too worried about aligning this with other architectures; the
idea of a half-baked vCPU getting loaded is worrying.

> OTOH, I don't see why anybody would pre-fault BEFORE init, feels like
> something that should be done later on in VMM bring up right?
> 
> So I doubt doing this would really break any sane user.
> 
> Let me know if you want that change in the series and I can respin it.

Please do, thank you for addressing this.

Best,
Oliver

