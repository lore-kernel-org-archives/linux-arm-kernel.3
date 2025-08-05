Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3409BC87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 16:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2i1Q1DU3TAUIFLraB4yYdaRtcD0rhW97RSVmaj5w/Uw=; b=grlpw7gWJTo0Y866BWNtU8uSOk
	YJzHrztBJM/d69B3ZwjE2S24mmsNz1rZRkEBeCHBLHqHS1qw3j+p6koPgVAlfeUiHsiJmC8+GhB2f
	LrVKA+gsI9kHdwYRRG4Az2MncbJe8Re87CNfYwPPdL8n8TjoS42WtssDrfK17OhW9Baime0MLU0Im
	wZAHkZRbGsinc9mSKxyQwOZKuU74UR3e+ILxVpdNEr9MyBT1eKwjR3suiV3opxNGyZW+OiZ4SKVih
	mvZbvFSQg0qO4UorX//YbLriPP7k6JXahFmkqtOibxy1o1h4wneXqlKAyiC4T+DqPRTGgSIndv2Cc
	zmox+Kog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujKay-0000000DJ5P-0akL;
	Tue, 05 Aug 2025 16:33:00 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujJYT-0000000D8ha-3May
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 15:26:23 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-4b07a5e9f9fso454441cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Aug 2025 08:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754407581; x=1755012381; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2i1Q1DU3TAUIFLraB4yYdaRtcD0rhW97RSVmaj5w/Uw=;
        b=k03Uwh8CwRvhPgKqH1NRDxkw6aKOn8ypmqGcCbPS0/oE+z19vNnp+TQAXvdyidWf3E
         ENIsOechM9Y1dTG780j2Ly5JMUlsMALZDAO/1703IJorag2cvNbE/Ca4cFvcGBYvy0o1
         sRWNrtmWU5UEtSJWX3mpCGTl0e0GRY19zWwQjLuIAc3NuMdlMQ1R7fifqs+vEYNC3y+W
         s/gVFVImfZTHTewo2k6mKdSCop6pURkN7Kv8dJ6arvNCD8qa7rppV6did+52RyvcMYDa
         Y3MBDAU6xtkS1oHjL/Od4Bl2LvoEdYNlH7BYQUeNLiwe3Ety1nPUUW15NPOSbqb0Ep07
         mnnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754407581; x=1755012381;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2i1Q1DU3TAUIFLraB4yYdaRtcD0rhW97RSVmaj5w/Uw=;
        b=GaAsWZEaaYbmmfN69pDbff7j35y/Pfqo6axy/z1Nb3p8ymofBfXj59j74fOluABgz6
         l/wAC2y64qNVj8zNX1QnWyXr0ZQyehvI56nTyNGTnHzCbGNqUIf29iAiPhNtqDIBr5gl
         uVmVwG3X3cbIoFAMxQHvPR68bK1PYGT0eT/k2DewvmiAgVMc99ZiTFlS+Vn7bq+AzjeW
         /SqcFHdwBudo9reISA6OzwUzNf7jyXOGVjJZNO2qPzZW9UtzXIGEtX9CTPFM9CUXr5MY
         t9mSt9QODoFSMdlWYL3QOU9BYqODN7j3/WHTbJgGukLSOucSfzzhMp3aiHcIxKsLNWET
         sFjQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+BiP91seyAPhQYp5lf/dOquOyKJK1rGVaQZPZazWhVqrm2ZkLubqs9h8oUxMgINEe8WAG0+qimuKGp+MWqveT@lists.infradead.org
X-Gm-Message-State: AOJu0YzVVwPW/h3En/unBSv9pcFPuDcIr1Wic53G4idSJZG/evLqjh/T
	KbNORITDyJzgOIZY21QbMKnzionY7mA8BjJRVPTJeBHj+nXu0dPk4/FXF96ytl6iTKSwrSJgopd
	vqUSxjDP36QiAQocYUKqbsTMYwAF/jXfF/OVWhW4y
X-Gm-Gg: ASbGncuzJPGJ3JuEMXioN+mSn10ZO79NRMRL4h9WjdPlU4FrscZwGT5g4+rLf+2vHSE
	kcCDR3TnzzkrqUes9Tfmxh5jlM4WzZ8T0SOnIzK9X7A7t4hOLmpufnPSbVzTtQPh1uC5FQCRy0P
	H0TpTSeNAZEXTkTNx15Aq3obbq42jGgUcHa5GILhUjeMAlgtByXfbDiMAbmkM7K+qw4+dApCjUR
	L6eshYAwF2oYt4gw2caF1fqKjrFbA==
X-Google-Smtp-Source: AGHT+IEPn9BAGcyC9RdcMH/TSHPcwTUayFCZLped6m7ux8g9VELmwHfnCo7ockxlrmEucnHiOvlt+/on7eAnUN3nm54=
X-Received: by 2002:a05:622a:188a:b0:4a9:e34a:58a1 with SMTP id
 d75a77b69052e-4b0850188c9mr3535311cf.21.1754407580322; Tue, 05 Aug 2025
 08:26:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250805135617.831971-1-tabba@google.com> <20250805135617.831971-4-tabba@google.com>
 <aJIWyNwWAAaCf_cw@willie-the-truck>
In-Reply-To: <aJIWyNwWAAaCf_cw@willie-the-truck>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 5 Aug 2025 16:25:44 +0100
X-Gm-Features: Ac12FXwES16-Z6v36CMKkJpW1AjsyxfYdUX8eXVbea0sO4LsoBDdHYz-X1Ffbsk
Message-ID: <CA+EHjTx_3oYJk=Hu=33VjVT34RBRvSp=uPwo+NNnzs-t38K91A@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] KVM: arm64: Sync protected guest VBAR_EL1 on
 injecting an undef exception
To: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	vdonnefort@google.com, qperret@google.com, sebastianene@google.com, 
	keirf@google.com, smostafa@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_082621_847317_C86A97E2 
X-CRM114-Status: GOOD (  23.61  )
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

Hi Will,

On Tue, 5 Aug 2025 at 15:35, Will Deacon <will@kernel.org> wrote:
>
> On Tue, Aug 05, 2025 at 02:56:16PM +0100, Fuad Tabba wrote:
> > In pKVM, a race condition can occur if a guest updates its VBAR_EL1
> > register and, before a vCPU exit synchronizes this change, the
> > hypervisor needs to inject an undefined exception into a protected
> > guest.
> >
> > In this scenario, the vCPU still holds the stale VBAR_EL1 value from
> > before the guest's update. When pKVM injects the exception, it ends up
> > using the stale value.
> >
> > Explicitly read the live value of VBAR_EL1 from the guest and update the
> > vCPU value immediately before pending the exception. This ensures the
> > vCPU's value is the same as the guest's and that the exception will be
> > handled at the correct address upon resuming the guest.
> >
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >  arch/arm64/kvm/hyp/nvhe/sys_regs.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> > index bbd60013cf9e..b34b10be1ad7 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> > @@ -253,6 +253,7 @@ static void inject_undef64(struct kvm_vcpu *vcpu)
> >
> >       *vcpu_pc(vcpu) = read_sysreg_el2(SYS_ELR);
> >       *vcpu_cpsr(vcpu) = read_sysreg_el2(SYS_SPSR);
> > +     vcpu_write_sys_reg(vcpu, read_sysreg_el1(SYS_VBAR), VBAR_EL1);
>
> You say "in pKVM" in the commit message, but why isn't this applicable
> to !VHE in general?

Because this function is only used in pKVM. I guess there's nothing
stopping anyone from using it in other non-VHE code in the future
though

Cheers,
/fuad

> Will

