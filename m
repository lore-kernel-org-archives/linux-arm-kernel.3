Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C009EC982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 07:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kwVjp+9NRkhTrHQ6lOsmCYjRc+NANOmRhBWGOeoo5hI=; b=lAIW/w8Jv2y0+aqKVZodLIH+rj
	LmSr+z/XHaraI+rb8QXO6KcE3fkixWSka79Qa0tjDT1RJ9TePHXllaUUCj3v/b98q3R4KxWvQFCIv
	ADIh7vqCc+Ydbf+/c5UCAoohmvqr1od1IDwRXGB3OTJMCJTBOC7X4Za5k1cbvDy8h5RI+GAX1Y+sZ
	NIggHLbLiq/WWXlXfOZrvcAs4d0wQCwNAIz8U/Kvtx6qAVbPF837IEaQFflTO9hVoh7JKe+KezdoN
	3DrsQ83Y2muIar5oRBaTbAioDWo0EjlTHrhZLLp7+6OYtRSfGrFwM/4hyW0AMCjejUNQZufP5C6V3
	lW4iZmkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8uyc-00000004W5V-2eex;
	Tue, 22 Sep 2026 07:31:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8uyb-00000004W5I-233F
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 07:31:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DC98D60210;
	Tue, 22 Sep 2026 07:31:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A3971F000FF;
	Tue, 22 Sep 2026 07:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790062300;
	bh=kwVjp+9NRkhTrHQ6lOsmCYjRc+NANOmRhBWGOeoo5hI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BZwa4M/2BNk6kG/mhdHrAj+q70LOVgtLAGXPthMVF4Bd5k6pwtWn+ohSgr4gAebMj
	 b0DiKpETzRYI35CNcXLDq9LyYACLI6NYt606rcAexy1PjdxYt42I1JGS3Xg1gZSlCm
	 fVslbiFj91bF5j23VFWjN1ostE5zjl+293ia1Eg1vxhAxaU7pCNR7fmqsR2aF+ftib
	 MstyVpD4lk5ckWSF3sTjc+BbCgd1T8k51xx5FpFPt0aW+7pNYu2FrPHZoqODsmwGSj
	 3o8nKMts+Slsqrp9mQOtVnmJA+OKX/37D532XMGRiv2ciVnznw1nZy0Xv9QR/8Lr+b
	 MybdVeQ4VQ4OA==
Date: Tue, 22 Sep 2026 08:31:34 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Oliver Upton <oupton@kernel.org>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Jack Thomson <jackabt@amazon.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] KVM: arm64: Restore the VM's feature bitmap when
 kvm_setup_vcpu() fails
Message-ID: <arIucuNna38Zlf3s@gremlin>
References: <20260921063718.1604533-1-fuad.tabba@linux.dev>
 <arDYHSlFHm_XzGvN@kernel.org>
 <CA+EHjTz0-qS8RRhdT8XjAgWqKhgjjzbRsZ_jwTBVqM-8pXk7Vw@mail.gmail.com>
 <arEskPHpAPQf5SAb@gremlin>
 <arF55dt3_i4nxoSA@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arF55dt3_i4nxoSA@kernel.org>
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

On Mon, Sep 21, 2026 at 11:39:33AM -0700, Oliver Upton wrote:
> Hey Lorenzo,
>
> On Mon, Sep 21, 2026 at 02:34:12PM +0100, Lorenzo Stoakes (ARM) wrote:
> > On Mon, Sep 21, 2026 at 08:24:56AM +0100, Fuad Tabba wrote:
> > > Hi Oliver,
> > >
> > > On Mon, 21 Sep 2026 00:09:17 -0700, Oliver Upton <oupton@kernel.org> wrote:
> > > [...]
> > > > > Nothing in the tree loads a vCPU whose init failed, so this is latent.
> > > > > The upcoming series that enables KVM_PRE_FAULT_MEMORY for arm64 exposes
> > > > > it: the generic kvm_vcpu_pre_fault_memory() calls vcpu_load() whether
> > > > > or not the vCPU has been initialised.
> > > >
> > > > That's a bug, not a feature. We should require an initialized vcpu for
> > > > the ioctl.
> > >
> > > That one is for Lorenzo then :) I'll reword the message so the stale
> > > bitmap comes first and the pre-fault crash is just how it showed up.
> >
> > In general this is the behaviour of _generic_ KVM code
> > (kvm_vcpu_pre_fault_memory()), which itself does not require an initialised
> > vCPU, and no other arch seems to requires that either in the arch-specific
> > pre-fault code.
> >
> > The actual pre-faulting implementation intentionally only targets the
> > canonical MMU to fault in S2 page tables, which doesn't need initialisation
> > to have taken place AFAICT.
> >
> > However I could add:
> >
> > 	if (!kvm_vcpu_initialized(vcpu))
> > 		return -ENOEXEC;
> >
> > To kvm_arch_vcpu_pre_fault_memory(), which would make this a requirement,
> > though that would bring us out of line with other archs.
>
> Actually, we need this enforcement to happen before the arch-generic
> implementation calls vcpu_load(). So that would be some amount of
> kvm_arch_* boilerplate added to the generic code to enforce this
> requirement like we do on the other vCPU ioctls.

Ack, will do!

>
> I'm not too worried about aligning this with other architectures; the
> idea of a half-baked vCPU getting loaded is worrying.

Yeah and I don't think anybody in their right mind is relying on being able
to pre-fault before init anyway.

>
> > OTOH, I don't see why anybody would pre-fault BEFORE init, feels like
> > something that should be done later on in VMM bring up right?
> >
> > So I doubt doing this would really break any sane user.
> >
> > Let me know if you want that change in the series and I can respin it.
>
> Please do, thank you for addressing this.

No worries, will put a commit or 2 at the start of the series to action
this and respin.

>
> Best,
> Oliver

--
Cheers, Lorenzo

