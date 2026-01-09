Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF3FD1A63C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 14:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3yX2xiForWt+w2fI6TvzDyx7u2zrLi0eQZxECGAw16Y=; b=t8YtIBhUr52wVI1XnlzMBnxMtP
	JSBUEX9Ju42iROplFa1RG0tt+MSVn54S9fb8vRANVTBJV+MU3pKcN0OQWLNHiyZRbDTW0TCd9jrwJ
	ws15vB+5Wgtup1IBDZJ/+e25Rd6ts4sG75w+e0W8764bprdt9axIR4/aZLms/zUWYRn/9fe3BsPOf
	e9rwVD8oR9CVZ1NGLpvDIT7tACGLKI9TMVIDM5IahVBOH3tvLtDbuITA+mzCdoJvI1VfpciqTIcow
	rVo0O5PGH56TDkKBbpwHjWMlv8+oIOQ2AMKOSl2MQb+PrtCyeHBebM4yC8TiA1nnWQQ+H4+PltB/m
	MSqkvMcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veDhI-00000002QVK-3v7j;
	Fri, 09 Jan 2026 14:42:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veDhG-00000002QUv-2BlN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 14:42:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C4D154436D;
	Fri,  9 Jan 2026 14:42:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59D03C19423;
	Fri,  9 Jan 2026 14:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767969757;
	bh=ClROQ0gaEPQ7jAf/7FfNWpec3iiBudGU0X0l3IuBIoI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HE/uwa1KnKTTQBeM6mLfhhcIKnW8WpRelvtdLuzWiAnvOd7O0rI6G46vl7JY0/IgQ
	 dhPmyYtNDldXU3F3Jx+uIm5E+vpQceAlUgMK5Ymi9cHONnLOpEv8ZgLwyJS5ZmIq05
	 qIzzsxxUVmgNr8VwCO3EVGNpd/iaBtVoS81C0gTQeGd+drerkq4SajpFfEbJx7SlW2
	 Tn3ocOBFMVCmiPoC4ctUO2NeBdkqqkn0t5zyWAruZEVlpqr5ByFVj84bQ6+A5TkIuY
	 p+Z4VaHuWb//xpdld6EcqsPRK0ec3By3LFj6etG+9ANJC/YrZG0a6mAhSP0gJRrWU2
	 XnBtmokIXyVbg==
Date: Fri, 9 Jan 2026 14:42:32 +0000
From: Will Deacon <will@kernel.org>
To: Fuad Tabba <tabba@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH 19/30] KVM: arm64: Annotate guest donations with handle
 and gfn in host stage-2
Message-ID: <aWET2EGnFKZCK2Ni@willie-the-truck>
References: <20260105154939.11041-1-will@kernel.org>
 <20260105154939.11041-20-will@kernel.org>
 <CA+EHjTzNcTOR5sZpBTUXUP++yqOZEvmfs=S3wqBTG-YT=hxoKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTzNcTOR5sZpBTUXUP++yqOZEvmfs=S3wqBTG-YT=hxoKQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_064238_577578_96AE528B 
X-CRM114-Status: GOOD (  19.44  )
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

On Tue, Jan 06, 2026 at 04:01:28PM +0000, Fuad Tabba wrote:
> On Mon, 5 Jan 2026 at 15:50, Will Deacon <will@kernel.org> wrote:
> >
> > Handling host kernel faults arising from accesses to donated guest
> > memory will require an rmap-like mechanism to identify the guest mapping
> > of the faulting page.
> >
> > Extend the page donation logic to encode the guest handle and gfn
> > alongside the owner information in the host stage-2 pte.
> >
> > Signed-off-by: Will Deacon <will@kernel.org>
> > ---
> >  arch/arm64/kvm/hyp/nvhe/mem_protect.c | 18 +++++++++++++++++-
> >  1 file changed, 17 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > index 7d1844e2888d..1a341337b272 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > @@ -1063,6 +1063,19 @@ static void hyp_poison_page(phys_addr_t phys)
> >         hyp_fixmap_unmap();
> >  }
> >
> > +#define KVM_HOST_INVALID_PTE_GUEST_HANDLE_MASK GENMASK(15, 0)
> > +#define KVM_HOST_INVALID_PTE_GUEST_GFN_MASK    GENMASK(56, 16)
> > +static u64 host_stage2_encode_gfn_meta(struct pkvm_hyp_vm *vm, u64 gfn)
> > +{
> > +       pkvm_handle_t handle = vm->kvm.arch.pkvm.handle;
> > +
> > +       WARN_ON(!FIELD_FIT(KVM_HOST_INVALID_PTE_GUEST_HANDLE_MASK, handle));
> 
> Instead of (or in addition to) this check, should we also have a
> compile time check to ensure that the handle fits? We have
> KVM_MAX_PVMS and HANDLE_OFFSET, albeit HANDLE_OFFSET, so we can
> calculate whether it fits.

The problem there is that HANDLE_OFFSET is hidden inside of pkvm.c and I
really didn't want to expose that in a header as we might as well just
remove it at that point and allocate from 0.

Maybe we could make pkvm_handle_t a u16 instead and I could assert that
at compile type?

Will

