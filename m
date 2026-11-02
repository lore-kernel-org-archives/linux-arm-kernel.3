Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E25606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 19:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BXGklN6+;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jGRoR1ET
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pf5mnv312thSQfR85MzimBrWC+L47vaGI/Xim2J2b1Y=; b=BXGklN6+S0skkhqdusyTdoJIkX
	mTSJM/bMzCqhywja2FMkhhPfKvger8lV5HW8AYGyQBNm6HeDHPcdTc6k4pf6fsp5ytNAjTcjB8XK7
	MxkqcJ/ORmVI1hd8nFs5aq/BG7ke2Qf4j0a3x6yYZXHYbzUQDTx1DTULCERt+k7i+uCQNkgEXLz+q
	6XIOMOOT6EUkOlCblY3d91cOrx42GwupGuNf3V3lDKAh11+rfdfOQTO5rZCE9x/smMwQG3BfqvgS3
	Eycv+0gelMKFLtCL4P6FV4qdZNyd6nc1StCG4/LXxCkfkEtR1GszbLErqqNUwK3jSDkTbXSZ9MDlM
	YsjxHo1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxh7-000000006Cm-0LUJ;
	Mon, 02 Nov 2026 19:27:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxh5-000000006CQ-2kNM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 19:27:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 64BAB40196;
	Mon,  2 Nov 2026 19:27:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D3D31F00A16;
	Mon,  2 Nov 2026 19:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793647667;
	bh=pf5mnv312thSQfR85MzimBrWC+L47vaGI/Xim2J2b1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jGRoR1ETQLbTAOhLX+NItAiw0MtdHIAiUqMQ9DEbySqB38+jcDGhWsMBrgksp1mb2
	 3Lyw90eoGhi1jy+5yqlgI4Qm9dxwqs+hTFjB4Usrtz1St9Fh9tOMMBR9PA3/oswKI9
	 jzF4u/Unx0G2AA3iL07wuPpBdkn4M0sbajbWAukB0SfWxMpTBh9sIzwRgEpL+w6QZr
	 aJIMwTEvDEfghXkh9TUTCwm6EiVCNim1SxrXzhYPHiePtMYuHZokimiFHBDsBqXcw+
	 lb5XZZ2OG3tk26ibFnBIcoH06WFr22vLf+qkBM0R77d0Ols4PoI2s9aVnce04kX3hA
	 sGatS3MVQoHJg==
Date: Mon, 2 Nov 2026 19:27:41 +0000
From: Will Deacon <will@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Ard Biesheuvel <ardb+git@google.com>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH] KVM: arm64: Don't livelock when AT can't resolve a fault
 IPA
Message-ID: <aujkLeo6QaiDMOv2@willie-the-truck>
References: <20261102094748.2638468-2-ardb+git@google.com>
 <auiXMN5td-2QlDkd@willie-the-truck>
 <CA+EHjTxVPyY70Dm+BiwgQQNwx1cJpEKvJBJGZWPCKLx2M8X2FA@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTxVPyY70Dm+BiwgQQNwx1cJpEKvJBJGZWPCKLx2M8X2FA@mail.gmail.com>
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

On Mon, Nov 02, 2026 at 03:57:51PM +0000, Fuad Tabba wrote:
> On Mon, 02 Nov 2026 14:17:10 +0000, Will Deacon <will@kernel.org> wrote:
> > On Mon, Nov 02, 2026 at 02:09:25PM +0000, Marc Zyngier wrote:
> > > On Mon, 02 Nov 2026 13:59:12 +0000,
> > > Will Deacon <will@kernel.org> wrote:
> [...]
> > > > > diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
> [...]
> > > > >  static inline bool kvm_hyp_handle_memory_fault(struct kvm_vcpu *vcpu,
> > > > >                                                 u64 *exit_code)
> > > > >  {
> > > > > -        if (!__populate_fault_info(vcpu))
> > > > > +        if (!__populate_fault_info(vcpu)) {
> > > >
> > > > Presumably we need a barrier (DSB?) here, to ensure that the TLBI happens
> > > > after the AT instruction?
> 
> I don't think the TLBI requires a barrier before it, because it
> doesn't matter if the AT's walk allocates entries after the TLBI.
> Anything it allocates matches memory, and the stage-2 descriptor the
> AT faulted on has AF clear, so that descriptor can't be cached:

I'm not sure that's relevant. The S1PTW case described by Ard in the
first part of his cover letter could look like this:

1. vCPU takes an S2 permission fault on VA 0x1000
	-> The permission faulting entry is in the TLB
2. Another vCPU unmaps a S1 page-table page used to translate 0x1000 from S2
3. EL2 does an AT S1E1R on 0x1000 as part of handling (1)
	-> Due to the uarch, this always walks the page-tables
4. The S1PTW from (3) faults at S2 because of (2)
	-> The AT fails

If we invalidate the TLB after step (4), then we will see the S1PTW
fault upon retrying the access that originally caused a permission fault
in (1). Without barriers, however, this invalidation could float up
between steps (1) and (2) and wouldn't be effective.

Now, having written it out, I think we would eventually resolve that by
replaying the faulting instruction a second time, but it feels odd to me
that we wouldn't just prevent this race once we know that the AT has
failed.

Will

