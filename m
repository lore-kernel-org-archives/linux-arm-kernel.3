Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 513FACCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 16:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T19nGYhAlmeRY5GmHt6KCOyRjKIggoxNQoqzTTW5DIg=; b=oaL0VLY0FdYTEA2rjYQH2+R/r6
	Da76kGRRK1cpqKsEgk4kvgH0qYtDLlbu+MB320Hvvbo0Bl5kiJh6L9pYAYVyQ7fJZKtw7ZMz2BK3Q
	JbgF6SR9BSKxqvpPh3sgQQY7cyUU5Q1buWGyMxIWa/81V1916DhyNShGUFSCSuazSpRZiSA00i4IS
	gwNvB7+WroNVZuWxRER51mPRhVwf7KNi6gfj9AD0+CVoPsUx+Wz1hi/VKlFBx5q2hOuC841bt3QdP
	T58bOgUTXhxdirgvbQ4RB/9NqOhgF5ezk2fjWrQ11xCWVhD+DbgrO+yVA7R2KM8jj7X5K0JraFtGF
	AyU7OvSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI7pg-00000003uvu-2T4l;
	Wed, 29 Apr 2026 16:32:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI7pc-00000003uvR-2OrD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 16:32:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DCE6F1650;
	Wed, 29 Apr 2026 09:32:02 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 20EC43F62B;
	Wed, 29 Apr 2026 09:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777480328; bh=7gqu4PQqrn1R8ym/Xqh26xdxHzA5cS34NP+aRH2NwN8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mu78sIiAkW97lmiEfkR9ZCKhkxNbAXzEchGuyoL2kvFLavGBWoVPKFdf/i3cVERcQ
	 QDP+dpEPcDhIUhlYoS/W3LXt9Yuw1J8ewLE3adt9m8YTEO9v5LgF2S1r6lrRlo+p5u
	 C8iqSmm5BYzyxDqUMKxKw+Hgg0j6qww3darcFKd8=
Date: Wed, 29 Apr 2026 17:31:57 +0100
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Oliver Upton <oupton@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH 1/1] KVM: arm64: nv: Avoid full shadow s2 unmap
Message-ID: <eedvu6ejufv6hstymyh4atnfynjolfyabkxqtgffoudiz26nxy@rbhpc22apzei>
References: <20260411125024.3735989-1-weilin.chang@arm.com>
 <20260411125024.3735989-2-weilin.chang@arm.com>
 <86eckg39eo.wl-maz@kernel.org>
 <tozhyzmwfddgx5fgfejracv6tskgs7xhs4fs6yvmvff74m7gwy@eq3oh35tokj4>
 <867bq72n7l.wl-maz@kernel.org>
 <n4v252jehdq4sn2ux26twudmvmfwjltxkvv6sa6rxtwbvqa2en@xp2oaodm7uqc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <n4v252jehdq4sn2ux26twudmvmfwjltxkvv6sa6rxtwbvqa2en@xp2oaodm7uqc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_093212_803354_E5476124 
X-CRM114-Status: GOOD (  40.82  )
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

On Fri, Apr 24, 2026 at 08:45:24PM +0100, Wei-Lin Chang wrote:
> On Thu, Apr 16, 2026 at 11:50:38AM +0100, Marc Zyngier wrote:
> > On Thu, 16 Apr 2026 00:05:40 +0100,
> > Wei-Lin Chang <weilin.chang@arm.com> wrote:
> > > 
> > > On Wed, Apr 15, 2026 at 09:38:55AM +0100, Marc Zyngier wrote:
> > 
> > [...]
> > 
> > > > > diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> > > > > index 851f6171751c..a97bd461c1e1 100644
> > > > > --- a/arch/arm64/include/asm/kvm_host.h
> > > > > +++ b/arch/arm64/include/asm/kvm_host.h
> > > > > @@ -217,6 +217,10 @@ struct kvm_s2_mmu {
> > > > >  	 */
> > > > >  	bool	nested_stage2_enabled;
> > > > >  
> > > > > +	/* canonical IPA to nested IPA range lookup */
> > > > > +	struct maple_tree nested_revmap_mt;
> > > > > +	bool	nested_revmap_broken;
> > > > > +
> > > > 
> > > > Consider moving this boolean next to the other ones so that you don't
> > > > create too many holes in the kvm_s2_mmu structure (use pahole to find out).
> > > > 
> > > > But I have some misgivings about the way things are structured
> > > > here. Only NV needs a revmap, yet this is present irrelevant of the
> > > > nature of the VM and bloats the data structure a bit.
> > > > 
> > > > My naive approach would have been to only keep a pointer to the
> > > > revmap, and make that pointer NULL when the tree is "broken", and
> > > > freed under RCU if the context isn't the correct one.
> > > 
> > > Can you explain what you mean by "if the context isn't the correct one"?
> > > If this refers to when selecting a specific kvm_s2_mmu instance for
> > > another context, then IIUC refcnt would already be 0 and there would be
> > > no other user of the tree.
> > 
> > Sorry, "context" is an overloaded word. I meant a situation in which
> > you couldn't immediately free the maple-tree because you're holding
> > locks and freeing (hypothetically) requires a sleeping "context". in
> > this case, freeing under RCU, purely as a deferring mechanism, might
> > be useful.
> 
> I experimented using RCU to free the tree as a deferring mechanism.
> Here are a few observations:
> 
>   - At reverse map record time, if maple tree store fails, we have to
>     change the maple tree pointer to a NULL, which is an RCU write
>     operation. Therefore we need to either take another lock, or use a
>     xchg(ptr, NULL) to avoid the lock.
> 
>   - Because we're holding the read-side mmu_lock, we shouldn't block
>     during reverse map record. Therefore we should use call_rcu()
>     instead of synchronize_rcu() to free the "broken" tree. This implies
>     a pointer to a maple tree in kvm_s2_mmu will not suffice, an
>     additional structure with both the maple tree and an rcu_head have
>     to be created.
> 
> IMO looking at RCU calls mixed with mtree_{, un}lock(), and having a new
> wrapper struct to make this dynamic allocation scheme work is not very
> attractive to me.
> 
> Instead, what do you think if I aggregate all strictly NV-related
> fields in kvm_s2_mmu i.e. tlb_vttbr, tlb_vtcr, nested_stage2_enabled,
> shadow_pt_debugfs_dentry, pending_unmap, into a struct maybe called
> kvm_s2_mmu_nested, add a maple tree in it, and have a pointer to this
> struct in kvm_s2_mmu? kvm_s2_mmu_nested can then be allocated only if we
> init a nested s2 mmu.
> 
> Do you think this can work and is better than the current approaches?

After a discussion with Marc, we think making the maple tree a pointer
generates too much complexity from the reasons given above. For the
kvm_s2_mmu_nested idea, it creates churn and the same RCU problem
persists if we want to dynamically allocate and free the structure. On
the other hand, if we allocated kvm_s2_mmu_nested at init-time and reuse
the struct, then it's not much difference than just placing the maple
tree in kvm_s2_mmu, the only benefit will be keeping kvm_s2_mmu smaller
for non nested MMUs.

I'll stick with just adding the maple tree instance in kvm_s2_mmu for
the next version.

Thanks,
Wei-Lin Chang

[...]

