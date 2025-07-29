Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5612DC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 21:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NR9slzoUcFOnPOoSMrOV4yposz1NlG4bkgRYfak492c=; b=TGauVGiq0b7LyTtzZJxVuZcm9q
	xb1IdKkLPMC2aqxEgCaqNZlsBhzpI30RSdNEl+sF1MMw0XSbfl90q97hINHCy/aJzuiiRnPdkg5Aa
	3+zbjQN5ZGErVOyDHnnjgcSeNv0kJPuLLaEkH1HSMXaBmDxmxHxO8lmTz1dKWnCmNAMAKGpnT1vXb
	aKQ4naAO3F1fLfNX4c5a/gtQyRRO49rl1lsnqvGxHUsc9HAVb/1ijrBbJFOFhB+1H0zUKv6iuDs9g
	MNog2zg4gb+eBiF3q2Kl+hFhOE+fPctKIty+WRfLeFodi0nVGemgCBK6p5B93dwVOYdGqGqBjFPUp
	6A2MO7Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugrub-000000007bJ-1T6W;
	Tue, 29 Jul 2025 21:31:05 +0000
Received: from out-189.mta0.migadu.com ([2001:41d0:1004:224b::bd])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugrs8-000000007SS-19KS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 21:28:33 +0000
Date: Tue, 29 Jul 2025 14:28:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1753824508;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NR9slzoUcFOnPOoSMrOV4yposz1NlG4bkgRYfak492c=;
	b=lhsW2pTcB10VQHQ789IqoXJswxckQki4VJ3/2loOEW2BzG6PgAfa2kj9NJPn524jv0WgfP
	MjYAlqeTx1ZzRP990X7EM/qgcaHk5t/9IMRbFKRswJP+taDNsnL+hGCJ99RzwPHiQQ/vVN
	YBCJ0Z4l9hzEspcc7A/hA8yTNEKhxYc=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Jiaqi Yan <jiaqiyan@google.com>
Cc: maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
	pbonzini@redhat.com, corbet@lwn.net, shuah@kernel.org,
	kvm@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	duenwen@google.com, rananta@google.com, jthoughton@google.com
Subject: Re: [PATCH v2 1/6] KVM: arm64: VM exit to userspace to handle SEA
Message-ID: <aIk88sBA2eIEF7w-@linux.dev>
References: <20250604050902.3944054-1-jiaqiyan@google.com>
 <20250604050902.3944054-2-jiaqiyan@google.com>
 <aHFohmTb9qR_JG1E@linux.dev>
 <CACw3F509B=AHhpaTcuH9O851rrDdHh1baC8uRYy7bDa7BSMhgg@mail.gmail.com>
 <aHK-DPufhLy5Dtuk@linux.dev>
 <CACw3F53TYZ1KFv0Yc-GCyOxn7TF3iYjTNSE8bd3nte=KaCN0UQ@mail.gmail.com>
 <CACw3F50Q_G75wf2rBm-P-NkyyO72i1NKqR9se99QrgipfD62yg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACw3F50Q_G75wf2rBm-P-NkyyO72i1NKqR9se99QrgipfD62yg@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_142832_465109_06B8D780 
X-CRM114-Status: GOOD (  40.10  )
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

On Fri, Jul 25, 2025 at 03:54:10PM -0700, Jiaqi Yan wrote:
> On Sat, Jul 19, 2025 at 2:24 PM Jiaqi Yan <jiaqiyan@google.com> wrote:
> >
> > On Sat, Jul 12, 2025 at 12:57 PM Oliver Upton <oliver.upton@linux.dev> wrote:
> > >
> > > On Fri, Jul 11, 2025 at 04:59:11PM -0700, Jiaqi Yan wrote:
> > > > >  - Add some detail about FEAT_RAS where we may still exit to userspace
> > > > >    for host-controlled memory, as we cannot differentiate between a
> > > > >    stage-1 or stage-2 TTW SEA when taken on the descriptor PA
> > > >
> > > > Ah, IIUC, you are saying even if the FSC code tells fault is on TTW
> > > > (esr_fsc_is_secc_ttw or esr_fsc_is_sea_ttw), it can either be guest
> > > > stage-1's or stage-2's descriptor PA, and we can tell which from
> > > > which.
> > > >
> > > > However, if ESR_ELx_S1PTW is set, we can tell this is a sub-case of
> > > > stage-2 descriptor PA, their usage is for stage-1 PTW but they are
> > > > stage-2 memory.
> > > >
> > > > Is my current understanding right?
> > >
> > > Yep, that's exactly what I'm getting at. As you note, stage-2 aborts
> > > during a stage-1 walk are sufficiently described, but not much else.
> >
> > Got it, thanks!
> >
> > >
> > > > > +/*
> > > > > + * Returns true if the SEA should be handled locally within KVM if the abort is
> > > > > + * caused by a kernel memory allocation (e.g. stage-2 table memory).
> > > > > + */
> > > > > +static bool host_owns_sea(struct kvm_vcpu *vcpu, u64 esr)
> > > > > +{
> > > > > +       /*
> > > > > +        * Without FEAT_RAS HCR_EL2.TEA is RES0, meaning any external abort
> > > > > +        * taken from a guest EL to EL2 is due to a host-imposed access (e.g.
> > > > > +        * stage-2 PTW).
> > > > > +        */
> > > > > +       if (!cpus_have_final_cap(ARM64_HAS_RAS_EXTN))
> > > > > +               return true;
> > > > > +
> > > > > +       /* KVM owns the VNCR when the vCPU isn't in a nested context. */
> > > > > +       if (is_hyp_ctxt(vcpu) && (esr & ESR_ELx_VNCR))
> > > > > +               return true;
> > > > > +
> > > > > +       /*
> > > > > +        * Determining if an external abort during a table walk happened at
> > > > > +        * stage-2 is only possible with S1PTW is set. Otherwise, since KVM
> > > > > +        * sets HCR_EL2.TEA, SEAs due to a stage-1 walk (i.e. accessing the PA
> > > > > +        * of the stage-1 descriptor) can reach here and are reported with a
> > > > > +        * TTW ESR value.
> > > > > +        */
> > > > > +       return esr_fsc_is_sea_ttw(esr) && (esr & ESR_ELx_S1PTW);
> > > >
> > > > Should we include esr_fsc_is_secc_ttw? like
> > > >   (esr_fsc_is_sea_ttw(esr) || esr_fsc_is_secc_ttw(esr)) && (esr & ESR_ELx_S1PTW)
> > >
> > > Parity / ECC errors are not permitted if FEAT_RAS is implemented (which
> > > is tested for up front).
> >
> > Ah, thanks for pointing this out.
> >
> > >
> > > > > +}
> > > > > +
> > > > >  int kvm_handle_guest_sea(struct kvm_vcpu *vcpu)
> > > > >  {
> > > > > +       u64 esr = kvm_vcpu_get_esr(vcpu);
> > > > > +       struct kvm_run *run = vcpu->run;
> > > > > +       struct kvm *kvm = vcpu->kvm;
> > > > > +       u64 esr_mask = ESR_ELx_EC_MASK  |
> > > > > +                      ESR_ELx_FnV      |
> > > > > +                      ESR_ELx_EA       |
> > > > > +                      ESR_ELx_CM       |
> > > > > +                      ESR_ELx_WNR      |
> > > > > +                      ESR_ELx_FSC;
> > > >
> > > > Do you (and why) exclude ESR_ELx_IL on purpose?
> > >
> > > Unintended :)
> >
> > Will add into my patch.
> >
> > >
> > > > BTW, if my previous statement about TTW SEA is correct, then I also
> > > > understand why we need to explicitly exclude ESR_ELx_S1PTW.
> > >
> > > Right, we shouldn't be exposing genuine stage-2 external aborts to userspace.
> > >
> > > > > +       u64 ipa;
> > > > > +
> > > > > +
> > > > >         /*
> > > > >          * Give APEI the opportunity to claim the abort before handling it
> > > > >          * within KVM. apei_claim_sea() expects to be called with IRQs
> > > > > @@ -1824,7 +1864,32 @@ int kvm_handle_guest_sea(struct kvm_vcpu *vcpu)
> > > > >         if (apei_claim_sea(NULL) == 0)
> > > >
> > > > I assume kvm should still lockdep_assert_irqs_enabled(), right? That
> > > > is, a WARN_ON_ONCE is still useful in case?
> > >
> > > Ah, this is diffed against my VNCR prefix which has this context. Yes, I
> > > want to preserve the lockdep assertion.
> >
> > Thanks for sharing the patch! Should I wait for you to send and queue
> > to kvmarm/next and rebase my v3 to it? Or should I insert it into my
> > v3 patch series with you as the commit author, and Signed-off-by you?
> 
> Friendly ping for this question, my v3 is ready but want to confirm
> the best option here.
> 
> Recently we found even the newer ARM64 platforms used by our org has
> to rely on KVM to more gracefully handle SEA (lacking support from
> APEI), so we would really want to work with upstream to lock down the
> proposed approach/UAPI asap.

Posted the VNCR fix which I plan on taking in 6.17. Feel free to rebase
your work on top of kvmarm-6.17 or -rc1 when it comes out.

https://lore.kernel.org/kvmarm/20250729182342.3281742-1-oliver.upton@linux.dev/

Thanks,
Oliver

