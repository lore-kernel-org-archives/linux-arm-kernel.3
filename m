Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC56D6E2CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 07:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KIsoxDDC/xIkUZ9OKR1VL27Mws23rhY0ZxT1YiRdli0=; b=A/lGe2E+R6BJbK+6RKBekYHk59
	KB7DiWOk/i0rSqJpqjNUs/8FGUzbs6j66BaypB183TYAVGIUtQtF4//FRB+KQPb/ZrUEd0mIDx2VR
	0xfESLm576bfxCzoAukGIeaRVJ7BnpklxZOHAuKfWYsA/4xK8iQeOSj2oTTnHSNIDNmv0H5AAB9Y8
	i82pSesmDJKhHGfEgtTqyOhzfEi6Vmi4IfoeK+uNc7yJuFTuxr97dWY8lFxnzd6+AWNzzjZzeeTGW
	yIsA5rDy7LNYBlKkGpQGPVKkctNHEVGHGTqtN94VMG9MVGmjCpqNhBiPolYwvDaEyF2boNsm+j0Ik
	MT5F2sKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDfRB-0000000EeKP-3qyc;
	Wed, 20 Nov 2024 07:47:45 +0000
Received: from out-184.mta1.migadu.com ([95.215.58.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDfPx-0000000Ee1v-41e9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 07:46:32 +0000
Date: Wed, 20 Nov 2024 07:46:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1732088785;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KIsoxDDC/xIkUZ9OKR1VL27Mws23rhY0ZxT1YiRdli0=;
	b=fDFDC9C2DqymuzFllq+n19yMNcf+28i/sHmTgmy6MJfcbpAZ3gwJXnhX0eOxufNpPEs3nA
	HtdLctFaUhG4K6TSJD15JPDmM6YxJQKMlDDhJRWLgUL/YBFyScQV4/AFQE+VnyJrHd/U8f
	9iXtXmt2ISTJR7eLTzDqZ3FSrOlfCDs=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Jiaqi Yan <jiaqiyan@google.com>
Cc: Marc Zyngier <maz@kernel.org>, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, pbonzini@redhat.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, duenwen@google.com, rananta@google.com,
	James Houghton <jthoughton@google.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH v1] KVM: arm64: Introduce KVM_CAP_ARM_SIGBUS_ON_SEA
Message-ID: <Zz2TyC9-zNQ3D-KB@linux.dev>
References: <20241031212104.1429609-1-jiaqiyan@google.com>
 <86r07v1g2z.wl-maz@kernel.org>
 <CACw3F51FbzkkX_DcCVCieZ=408oP_Fy3sXYk5AjWRX3RJO2Fzg@mail.gmail.com>
 <878qtou96b.wl-maz@kernel.org>
 <CACw3F50gB40dqQ4CZ7f4X4aRkxHQhjiYunAhqbmVtcGnd5g3bA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACw3F50gB40dqQ4CZ7f4X4aRkxHQhjiYunAhqbmVtcGnd5g3bA@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_234630_621117_2F07B231 
X-CRM114-Status: GOOD (  27.03  )
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

On Tue, Nov 19, 2024 at 03:57:46PM -0800, Jiaqi Yan wrote:
>
> While continuing the discussion here, I think it may make sense I sent
> out a V2 with 2 major updates:
>   - add documentation for new SIGBUS feature
>   - remove KVM_CAP_ARM_SIGBUS_ON_SEA

Just wanted to add that QEMU already has a functioning "MCE" injection
implemenation based on signals that deals with the sloppy mess of
coordinating w/ vCPU threads [*].

I completely agree with Marc that the UAPI around using signals for this
sort of thing is a giant pile of crap, but it seems to be a semi-understood
pile of crap. And from that perspective, wiring unclaimed SEAs into the
existing infrastructure at least makes the UAPI consistent.

[*]: https://elixir.bootlin.com/qemu/v9.1.1/C/ident/kvm_on_sigbus_vcpu

> On Tue, Nov 12, 2024 at 12:51 AM Marc Zyngier <maz@kernel.org> wrote:
> > > Do you mean a CAP that VMM can tell KVM the VM guest has RAS ability?
> > > I don't know if there is one for arm64. On x86 there is
> > > KVM_X86_SETUP_MCE. KVM_CAP_ARM_INJECT_EXT_DABT maybe a revelant one
> > > but I don't think it is exactly the one for "RAS ability".
> >
> > Having though about this a bit more, I now think this is independent
> > of the guest supporting RAS. This really is about the VMM asking to be
> > made aware of RAS errors affecting the guest, and it is the signalling
> > back to the guest that needs to be gated by ID_AA64PFR0_EL1.RAS.
> 
> Just to make sure I fully catch you. I think ID_AA64PFR0_EL1.RAS
> translates to ARM64_HAS_RAS_EXTN in the kernel. If VMM signals RAS
> error back to the guest with SEA, are you suggesting
> __kvm_arm_vcpu_set_events should check
> cpus_have_final_cap(ARM64_HAS_RAS_EXTN) before it
> kvm_inject_dabt(vcpu)?
> 
> If so, how could __kvm_arm_vcpu_set_events know if the error is about
> RAS (e.g. memory error) vs about accessing memory not in a memslot
> (i.e. KVM_EXIT_ARM_NISV)? I guess KVM needs to look at ESR_EL2 again
> (e.g. kvm_vcpu_abt_issea vs kvm_vcpu_dabt_isvalid)?

Good point. I don't think we can lock down this UAPI after the fact
given the existing use cases. It is ultimately up to the VMM what to do.

I don't see anything that would stop an implementation without FEAT_RAS
from generating an SEA in this situation. The lack of FEAT_RAS (to me at
least) implies:

 - No ESR injection for vSErrors (already enforced in UAPI)
 - No deferral of SErrors / ESBs
 - No error record registers in the PE

Of course, it is very likely you've thought about this more than I have,
Marc.

-- 
Thanks,
Oliver

