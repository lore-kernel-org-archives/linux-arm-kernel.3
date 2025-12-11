Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29C1D41C12
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 09:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S7gidm0ryluBUc0VY8+K5m6BHlxflamJxOTgpc4wE9c=; b=GXm7Fi6VMnhxnlOkqzeoNzy7OA
	HnAQTnIsoUJHzoAmGxC8aJ5KjJ+/7mk0WsmiMXV16Yi8SKB/wpQgx6u9pmdWazCaUl2DlEtKQvKxj
	CbNKiMeoxiXt9+qW2k29iYhuHey8mTdTeQBotwZCerLgN1zSf5byojmHtxM5NaIifGRZ8wNJ1+ft9
	/MR8sEkz6/+YM/gU36WEcJsq97LlSyNsay465NsNVz1YZ6uIqbSSMAkI14YWc6tbWLH1u3h5l5uhl
	VgcsTYBpV7qw1EwWqfmrv7grvwbdmLjDt61GM/waXPRjfEXAt9lI3Y5rpx5JPSDO+XZpkn6iEIs5a
	Pp1s9UIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTd3V-0000000GRaD-2cMW;
	Thu, 11 Dec 2025 09:33:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTd3T-0000000GRZr-0bm5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 09:33:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0974F153B;
	Thu, 11 Dec 2025 01:33:38 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C2B033F740;
	Thu, 11 Dec 2025 01:33:43 -0800 (PST)
Date: Thu, 11 Dec 2025 09:33:40 +0000
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oupton@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, qperret@google.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH 2/2] KVM: arm64: Remove extra argument for
 __pvkm_host_{share,unshare}_hyp()
Message-ID: <aTqP9M_E7ROGpfbB@raptor>
References: <20251210132102.137631-1-alexandru.elisei@arm.com>
 <20251210132102.137631-3-alexandru.elisei@arm.com>
 <86zf7po2n3.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86zf7po2n3.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_013347_247703_FC1F2EDB 
X-CRM114-Status: GOOD (  19.35  )
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

Hi Marc,

On Thu, Dec 11, 2025 at 08:15:28AM +0000, Marc Zyngier wrote:
> On Wed, 10 Dec 2025 13:21:02 +0000,
> Alexandru Elisei <alexandru.elisei@arm.com> wrote:
> > 
> > __pvkm_host_share_hyp() and __pkvm_host_unshare_hyp() both have one
> > parameter, the pfn, not two. Even though correctness isn't impacted because
> > the SMCCC handlers pass the first argument and ignore the second one, let's
> > call the functions with the proper number of arguments.
> > 
> > Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> > ---
> >  arch/arm64/kvm/mmu.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> > index 7cc964af8d30..6c6abcd8e89e 100644
> > --- a/arch/arm64/kvm/mmu.c
> > +++ b/arch/arm64/kvm/mmu.c
> > @@ -497,7 +497,7 @@ static int share_pfn_hyp(u64 pfn)
> >  	this->count = 1;
> >  	rb_link_node(&this->node, parent, node);
> >  	rb_insert_color(&this->node, &hyp_shared_pfns);
> > -	ret = kvm_call_hyp_nvhe(__pkvm_host_share_hyp, pfn, 1);
> > +	ret = kvm_call_hyp_nvhe(__pkvm_host_share_hyp, pfn);
> >  unlock:
> >  	mutex_unlock(&hyp_shared_pfns_lock);
> >  
> 
> Yeah, we lost all form of type-checking when everything was hastily
> converted to SMCCC to avoid function pointers. Somehow, I feel that
> the cure was worse than the disease.
> 
> I wish we'd reintroduce some form of compile-time checks, maybe by
> having generated stubs?

I also think compile-time checks would be useful, do you have something
particular in mind?

If not, right now I can't think of a way to generate the stubs automagically,
but I can give it a (probably bad) try and take it from there.

Thanks,
Alex

