Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B992C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 11:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ncfcDW24tgTUaBIvc+gDahPqdeBvJv0bVDHgY+i5uKw=; b=tEPWGKGs7juWGIEYwCMmao9bRB
	yPcayKa3Q0YUa+qVnYEvWVUYqskZRE3AS0qcyy5A9zIc9TN+8HkQ0kbxT14s69OaEU//AmzZ7ji2i
	irUq5CW4GW5OPrX4kS3bRfehNjdK6sPx/fWHfnc+8l21kWbadyvEFV6X+E8cbT2JeX2p4KUTg3W14
	NtOm+UOYt6jiExBNBrvxrGOY80ZMqnMRcSvH9j8o/XysLmw9lXqGulxaxiaGlxXQtDKNqmIRjQTOn
	rK2rn5jAuAiWJpjv2TlPP6kbcI3xY6NSLXUjRaIh/y+OtUtI95K3TKGRTHuwldqOS81YTP2zylIUn
	7RF+kIzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wySh7-0000000GUsC-0DLy;
	Mon, 24 Aug 2026 11:18:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wySh6-0000000GUs5-0Zw2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 11:18:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3E26F600C8;
	Mon, 24 Aug 2026 11:18:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 909021F000E9;
	Mon, 24 Aug 2026 11:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787570302;
	bh=ncfcDW24tgTUaBIvc+gDahPqdeBvJv0bVDHgY+i5uKw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CQaPeYY8aUp59eCWsh629TpndqB58LU0xcEXlX0mLuGKEC+c79cuKJ6HeLvT1e7XH
	 iqkXbts4Z3peJBtrzSaY8LvDXL/eZwIlRiRlOBEwW/iZKUVWqi7Hn40JF1h+iA0Yun
	 UmKaIBo6m4g7YguQXxh8B23pjwzIZZAVmYM2t644ng41FZli2EsalneZ5iMcPbM5KO
	 W4lwIAXGXBNxLY/aJJwUXiEOnjA8DKsXYH8Ojk+jXT/pOH9G6u437QvKzSHcF5JVG2
	 30eNAgVqpoXobKKDU7xtwaip8rTlZGC804Upd/XnlDmfJDBNC9UkHtgaUikU/kCV46
	 lCcZOrPpiz8FA==
Date: Mon, 24 Aug 2026 12:18:18 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Steffen Eiden <seiden@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Shen Yongchao <grayhat@foxmail.com>, Karl Mehltretter <kmehltretter@gmail.com>, 
	Wei-Lin Chang <weilin.chang@arm.com>, stable@vger.kernel.org
Subject: Re: [PATCH v3 2/2] KVM: arm64: nv: Delay freeing of shadow S2
 structures until VM destruction
Message-ID: <aownGeMYtKV0wDxq@gremlin>
References: <20260821161829.1032561-1-maz@kernel.org>
 <20260821161829.1032561-3-maz@kernel.org>
 <aoiQuVs5jzB5La4i@gremlin>
 <86v7924lqn.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86v7924lqn.wl-maz@kernel.org>
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

On Sat, Aug 22, 2026 at 09:12:32AM +0100, Marc Zyngier wrote:
> On Fri, 21 Aug 2026 19:15:45 +0100,
> "Lorenzo Stoakes (ARM)" <ljs@kernel.org> wrote:
> > > @@ -1310,16 +1319,12 @@ void kvm_nested_s2_flush(struct kvm *kvm)
> > >
> > >  void kvm_arch_flush_shadow_all(struct kvm *kvm)
> > >  {
> > > -	for (int i = kvm->arch.nested_mmus_size - 1; i >= 0; i--) {
> > > +	for (int i = 0; i < kvm->arch.nested_mmus_size; i++) {
> >
> > Hmm why this was in reverse before? :) I guess some product of the
> > kvfree() bit or maybe something else?
>
> We allocate s2_mmus in S2_MMU_PER_VCPU chunks. Which means that it
> complicates the freeing of the these structures, as they can only be
> freed once all S2 PTs of that chunk have been freed. We have three
> options:
>
> - scan forward, and use complicated logic to work out that you have
>   freed the last PTs of a chunk, freeing with a negative offset from
>   the current point in the loop. Works, but hard to reason about in
>   fewer than 3 seconds.
>
> - scan backward, use simpler logic to ensure you have reached the
>   beginning of a chunk, nuke it.
>
> - have two loops, one for the PTs, one for the MMUs. That's what we
>   end-up with due to the different garbage collection phases.

Ah I see, so tear down page tables of the 2nd of the pair, then after doing it
for the 1st of the pair free the chunk, makes sense.

>
> Cheers,
>
> 	M.
>
> --
> Without deviation from the norm, progress is not possible.

--
Cheers, Lorenzo

