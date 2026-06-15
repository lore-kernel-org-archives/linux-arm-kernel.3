Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 542C7CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 15:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dH/2FN9MBlarR5JU+NMeyThmVcZKaugzdsaHBaCxFFk=; b=tXhv9M5CqD3SDbaU9CervY93W9
	tA/RnWa59pBg/FAhkyqrmW6QgvqReZF1tNxXM40NWPfKwEbmC/SvoUwXAjWuhz1R5gU1fnJR8nDZa
	lOG1LdNMMbJqDFyEr6PrJVRC2AndYWF6bdZmCDydwxalcQVRB+wWDeyzMV2has9QuHNvHDW+V5+wJ
	t1eXWUPN3yVqtBvU33aq3aiyghzsRHaQvOzJR30ppJncwSzpZYFis5CgcNxGYWnTI9M68cGgfK2KK
	rf4qumTpL+4QdXUt+PnvRNyhFoNqrghxzY+4ajf021VGkMV85NrcEbpAIj8hpsHqiuuJp1rRJ+HOS
	HLmVRpgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ8r0-0000000ETTq-2Osk;
	Mon, 15 Jun 2026 15:03:58 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ8qy-0000000ETTI-25U2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 15:03:57 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-51765531803so117771cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 08:03:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781535835; cv=none;
        d=google.com; s=arc-20240605;
        b=ZbffjfB6U9jq25uyUe+jGeCRK9wectNfMbzCTJVeFiIxpVzTin+08bSW/7DCED6zJc
         1qyzq1wFkXmODs83gKplytzeXMApjmA7FY0J9XDQ15lWpifreHbUVNPVBWvSNkIwB+YR
         7m0JnVtxTmxYqlQcR2X22ZNyxuHNUowLyioun3asSP1oXHmylLjB/7etVExfrp4A9b9Z
         xMotPSBBeYuo1wBrPNBlAuEHEA2UrBzOzvbnejJczD/Ud79RxqQfPSAZvg8amC5FGKHm
         O5FfhpNnoEsM5q31Pf/gPYfoH9vZOERa8DJZDfGDRiCu4LhQ295MuT2vxQHYAZKqT/7N
         9nxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dH/2FN9MBlarR5JU+NMeyThmVcZKaugzdsaHBaCxFFk=;
        fh=q+6mBnLPEw84QtgIkrNzA6aKO/TsS4RkPJSOWayUaLE=;
        b=edBUlg5ZYgs4M4tK0wx9HshjT4u6wNvn+BKHIUc2j86oXGixcbA0uK61zU6WQbXBK1
         KOVegysGD+/yCjac1PxW+h7qW1NACNTsppOaVfAxWJz7tQ/4Ivkfys7VNvk7GRjNSajt
         CLe8y2H4ATb1XjXuyGCBtSUNhnzVYeFxTfu8rpVoz4c4IRKNV1XNpamjDzd1OiK1MHGR
         YHEOQZMKElCwXEZ21fqljRnHLhsP8XICYqv/JDK28Gv/N1p1hsPsXnqXpRvmTGOQf9aU
         YCHJQwgm4hT/NpKN/R3hQOvbodXu9vZc1v3a58z8fJzO0sS1v/ZAhIkAAtCwK/YLYVZk
         woug==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781535835; x=1782140635; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dH/2FN9MBlarR5JU+NMeyThmVcZKaugzdsaHBaCxFFk=;
        b=t1mgtb9cUII61OAG1+5Z0zQC4MtH1R7xYwk46pi1jK7mMlRQN0lGFrjVagUiX23mwS
         gKxsiwPkPSxPIRKJ7cMWYo60Z6eXHtC0w5x45G7wLDJYn/jfRfHZwiADIPBwTJZcdnPL
         7brTNp4IO0pokYdj6szEQU6nsuxodXgatl9sogZRKsZwT7V8AwCQc50ABBiXQx+IAWkf
         tcoRko1GWIUoEL6UrtMukVYUMWs+DKcAmGJgyPJ3fW54mcbk91eZAUKgQX3FwHOHk7Dx
         DahehqNNs48q0Yq602xTkKC7BxWv8k8bqZSam/qm0fRKlVm+wSv4qFXYv2RexTJCm86z
         nBxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781535835; x=1782140635;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dH/2FN9MBlarR5JU+NMeyThmVcZKaugzdsaHBaCxFFk=;
        b=CrMmGa4S3DkeIf+AP2wl7PTJTw1kyLnfTJnBaYUWRy7L2uKdSgZKC2gLqzaw0p/Q1X
         hMbltbAaR/xwQu1HwgZm7WsNEc0FooG3b+whjzDnVPztiLOndw0kazTXF8dq7wBRGAAS
         1ppd5ada6b0vWtdtQVygFAJVj1RyRG9APZXM/5oxKsVdaNaLLbq+xkdGEM8mokhdV2hG
         UqSBLMExpd0yafk4M5kakWIpPzA5V2DmobOW7XpPhR4lVQI2ZAAK7YZFF7MFTuYSFWoM
         DHmA3HT+dIGsxaj+1qLdk2cv7LtrVIO4yStZijHzdGRSmRIucznturzzuP9FbT6sc/sC
         +gzA==
X-Forwarded-Encrypted: i=1; AFNElJ93NAUGZ5otsNX0D/+iMjSCZrp956qErLo6FiggsHPnDD1hSGYy8VjTeBWyAPkurNmo8QZ82CPlJqNJuuWrsRdz@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7gjOyGz0oKlNHgd6vIoF3dTNAlLI7YmQcs61mDYfqofGFHZQV
	J7pchWk02bySeE0EW+Sw+0vDpNcI/YahZ6TjOefTrADZKHJexBqgTBnkL4ADk/whGuNGkXkJ1wH
	IIVuAIlNfLoZ0NU2yeocgp44zF9+k3ZxiBqBTGXcp
X-Gm-Gg: Acq92OHMBTzgS0YP9bS+di2dp46AFx1x5KJFsOU9ZHRXIet8Ec2zaVcOLwZekCRE56E
	/DA2okHGaCDxPcDLCkge9dMtND0CDSFJqc2YFZTU31z10WkIm9cmRTet0bXKdc4QKnv3ynaYUod
	YbefpqD7TPPeBFw1nHHjSi/ay3W2+JW4urngEfeh+3dEtejbn5aYkk4oEzQ+35sNyrw8gFu6NVY
	gposaCfARH8a0NT8WzFgxZGX65WWx6XpfT05ECdb2WlxhG+YoGv64EayrV8r5XXUvD3V5omcFGf
	sqsQeOwD
X-Received: by 2002:a05:622a:551b:b0:517:99ea:ab7a with SMTP id
 d75a77b69052e-5198765a8cemr2490151cf.26.1781535834368; Mon, 15 Jun 2026
 08:03:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260612113414.1022901-1-tabba@google.com> <ai_OevUNS-OACPm7@willie-the-truck>
 <CA+EHjTyMOoCLQ7d6+TgkrnOJF-PV9K-BKtb4CNuAg8p4gtg6wg@mail.gmail.com> <ajAPNFDsQ63k_jAS@willie-the-truck>
In-Reply-To: <ajAPNFDsQ63k_jAS@willie-the-truck>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 15 Jun 2026 16:03:17 +0100
X-Gm-Features: AVVi8Cda5pPeMmputRE2w7EYBD7XN30xx4QwVSzYxlGD-O5h54qT752Fu-6z6Pg
Message-ID: <CA+EHjTzL4GKw8RQrGnMq81Ohquo48_L4-MNJrCdGnBpMPR7XcA@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Sync SPSR_EL1 when injecting an exception
 into a pVM
To: Will Deacon <will@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Sascha Bischoff <Sascha.Bischoff@arm.com>, Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_080356_551804_78CB1544 
X-CRM114-Status: GOOD (  28.59  )
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

On Mon, 15 Jun 2026 at 15:42, Will Deacon <will@kernel.org> wrote:
>
> On Mon, Jun 15, 2026 at 11:52:10AM +0100, Fuad Tabba wrote:
> > On Mon, 15 Jun 2026 at 11:05, Will Deacon <will@kernel.org> wrote:
> > >
> > > On Fri, Jun 12, 2026 at 12:34:14PM +0100, Fuad Tabba wrote:
> > > > When pKVM injects a synchronous exception into a protected guest, it
> > > > re-enters without restoring the guest's EL1 sysregs and writes the EL1
> > > > exception registers to hardware by hand: ESR_EL1 and ELR_EL1, but not
> > > > SPSR_EL1. enter_exception64() sets SPSR_EL1 (the interrupted PSTATE)
> > > > only in memory, so the guest's handler reads a stale SPSR_EL1 and
> > > > restores the wrong PSTATE on eret.
> > > >
> > > > Write SPSR_EL1 alongside the other exception registers.
> > > >
> > > > Fixes: 6c30bfb18d0b ("KVM: arm64: Add handlers for protected VM System Registers")
> > > > Reported-by: sashiko <sashiko@sashiko.dev>
> > > > Signed-off-by: Fuad Tabba <tabba@google.com>
> > > > ---
> > > >  arch/arm64/kvm/hyp/nvhe/sys_regs.c | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> > > > index 8c3fbb413a06..1a7d5cd16d72 100644
> > > > --- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> > > > +++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> > > > @@ -268,6 +268,7 @@ static void inject_sync64(struct kvm_vcpu *vcpu, u64 esr)
> > > >
> > > >       write_sysreg_el1(esr, SYS_ESR);
> > > >       write_sysreg_el1(read_sysreg_el2(SYS_ELR), SYS_ELR);
> > > > +     write_sysreg_el1(read_sysreg_el2(SYS_SPSR), SYS_SPSR);
> > > >       write_sysreg_el2(*vcpu_pc(vcpu), SYS_ELR);
> > > >       write_sysreg_el2(*vcpu_cpsr(vcpu), SYS_SPSR);
> > > >  }
> > >
> > > Is SPSR_EL1 not set in enter_exception64() using vcpu_cpsr(vcpu), which
> > > *is* set here? I'm just a bit wary of the report, as I'd have expected
> > > fireworks if we weren't initialising the guest's SPSR on the exception
> > > injection path.
> >
> > Yes, enter_exception64() sets SPSR_EL1, but only in memory:
> > __vcpu_write_spsr() takes the nVHE path and calls
> > __vcpu_assign_sys_reg(vcpu, SPSR_EL1, val), which writes
> > vcpu->arch.ctxt.sys_regs[SPSR_EL1] without touching the hardware
> > register.
> >
> > In the normal nVHE entry path that memory value reaches hardware via
> > __sysreg_restore_state_nvhe() before __guest_enter(). But
> > inject_sync64() runs inside the fixup_guest_exit() loop, which
> > re-enters the guest directly without a sysreg restore pass. ESR_EL1
> > and ELR_EL1 are already written to hardware by hand for this reason
> > but SPSR_EL1 was missed.
>
> Ah, I see. Does that mean that all the in-memory updates performed by
> enter_exception64() (e.g. the construction of the cpsr) are ignored too?

From looking at the code, no. inject_sync64() reads back the cpsr and
PC that enter_exception64() computed in memory and writes them to
hardware:

    write_sysreg_el2(*vcpu_pc(vcpu), SYS_ELR);
    write_sysreg_el2(*vcpu_cpsr(vcpu), SYS_SPSR);

So the guest re-enters with the right PSTATE. The only value left
stranded in memory is SPSR_EL1.

Cheers,
/fuad

>
> Will

