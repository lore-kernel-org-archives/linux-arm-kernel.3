Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D35AFE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 08:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=82S7PbDe0oe1fScv2wnm6abSAjxVCV0v9XILXewfqtQ=; b=t7mTC2ElHs4puqyHCOSPVpj7y2
	mDmSlLB3P7nKHh7XvIL3dhAtjGM03AP/tp1wGkeFDY/JWIpSBXs76UkaPagAV5aoCsbnYqcF9y9qK
	Cxo6seOkmvLMbPq8k5R7qum2/e4yoOPSfLHIq/eELBV7xvKu/mi8ZPWhbMjyT3z0/w7y63pGLCBCZ
	axJOwt7XsujYB87KB4Vvo6d5+V2gNA+EdOZP3UV91087tXBernBm1BqBl3lUz1svWsm4t/+TA/D6y
	XSAKlmAT2wRqeplrcAwkkwh4bdyW9zYbIsh9vTrWs9q6XPTOPGVqnkfBjAtdLWvNhLGVJYkyMhDVw
	CGMgFazA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKYsF-00000006rCV-3cY6;
	Mon, 09 Dec 2024 08:12:11 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKYnJ-00000006qB7-0C14
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 08:07:06 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-434e5e71a08so71015e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 00:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733731623; x=1734336423; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=82S7PbDe0oe1fScv2wnm6abSAjxVCV0v9XILXewfqtQ=;
        b=P7zS63y9t86IJCY9b5FLvXp81xcb7VqtMFdtgB0dIRoHJuZh1vvibPbRinN29kNbsn
         E2CESYeuKqXl/DbTlcnmdcffSHswBew6wXObrpuhYvqMXT6saRsMoCKXrWi9NynSA+AU
         ytvfAOLUbLO3rtSc4k41s9zrORJgDwDQjbpwp0qnZrREsOgTgPacPXEGd106zQn8UGyu
         8Ju8phJltVWmhYAXbNcP2uLoRK6UCNndJSLE9WtcydHLUZ1P5NMT0Pie9KMst8vSK5Xi
         g/mjnVE/1O2H8DQFGk2Tfk0ZCfQVgMO0hkiewq9dNH8R5rBM40atJkQ9rOBYFMT0q5RN
         3K8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733731623; x=1734336423;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=82S7PbDe0oe1fScv2wnm6abSAjxVCV0v9XILXewfqtQ=;
        b=JqHfYK8T6V5K3A58QpbGKE/uGyuD3grAWlViwuPIaRmkalqrZYZ7TcDthL0O5SWc3C
         3757HES0IJiJ/CqdjgCzasK1kep6sIv9u50mybHDVSwZxvS3FQIeK/ojmPeYDUyAxF14
         Ll9gMpgpIHlsXhbMMstfCd9mhCKFSIO3CFqDV0FYAlPMzKk6FYDTtdic1aLMmm0HaDzP
         9OiezNfJJxOiKtYtDeY1wWOoyPESJ9pvnhvIj5b1vU/5A5KDWmlGInVzCu+fywcd802W
         N93P88ehFnrEdHetZjO2G5A8eoyUanzhRWRmPfLeBlYDW0/NwfVU43mfsQa/cQXN9ipm
         pTFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnAWdf8ZG0LxBODKzFsDA5b7eqUkhWHDZVk+koWZDgjgYuX8embshkUt+E/DWefQ6shDayIqpeIG2ZwdPzqHq/@lists.infradead.org
X-Gm-Message-State: AOJu0YyGMLxd8xF9I4e4xa27ceFAHsqcevdz7KLqjuWCZ21lqQ6uzxns
	i/fUUMBhwYSGkGZBiZ+8/hf4xu73zZq1pVpeyiuj/qUYXtRauWdmEf2mPPIspMjhJwj363hzvp3
	HTvOiB/rR24tJbY1B1G1mUihsktzNxRzx6lmb
X-Gm-Gg: ASbGncu4E3HTGYCDxQxXvuPaQMhaiW/ETTi53NYuGMnZHT7c+EQKn18liLPbBcwwW9z
	I7F3Ra++6nv0KPMc4u9COHXNoDMLhDg==
X-Google-Smtp-Source: AGHT+IFHPISoszHs24tCysjuD8a25wVHcJsjEOG5WotyQnhYTjm7sOA+Rb4A/vSCrQZbyHT4VvtHjyFj9CA292vpIGQ=
X-Received: by 2002:a05:600c:332a:b0:434:9e01:cac1 with SMTP id
 5b1f17b1804b1-434e92dbcbbmr2217355e9.7.1733731623312; Mon, 09 Dec 2024
 00:07:03 -0800 (PST)
MIME-Version: 1.0
References: <20241202154742.3611749-1-tabba@google.com> <20241202154742.3611749-3-tabba@google.com>
 <Z1Mp4zmZRL_8QEmb@google.com>
In-Reply-To: <Z1Mp4zmZRL_8QEmb@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 9 Dec 2024 08:06:26 +0000
Message-ID: <CA+EHjTwzDDPTyqs-VgGvPK+gk-+fDsD8WdQN1cJjzNcCYWBJFw@mail.gmail.com>
Subject: Re: [PATCH v4 02/14] KVM: arm64: Group setting traps for protected
 VMs by control register
To: Quentin Perret <qperret@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	kristina.martsenko@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_000705_089153_2E2A2B30 
X-CRM114-Status: GOOD (  16.74  )
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

Hi Quentin,

On Fri, 6 Dec 2024 at 16:44, Quentin Perret <qperret@google.com> wrote:
>
> On Monday 02 Dec 2024 at 15:47:29 (+0000), Fuad Tabba wrote:
> > +static void pvm_init_traps_cptr(struct kvm_vcpu *vcpu)
> >  {
> > -     const u64 feature_ids = pvm_read_id_reg(vcpu, SYS_ID_AA64DFR0_EL1);
> > -     u64 mdcr_set = 0;
> > -     u64 mdcr_clear = 0;
> > -     u64 cptr_set = 0;
> > +     const u64 id_aa64pfr0 = pvm_read_id_reg(vcpu, SYS_ID_AA64PFR0_EL1);
> > +     const u64 id_aa64pfr1 = pvm_read_id_reg(vcpu, SYS_ID_AA64PFR1_EL1);
> > +     const u64 id_aa64dfr0 = pvm_read_id_reg(vcpu, SYS_ID_AA64DFR0_EL1);
> > +     u64 val = vcpu->arch.cptr_el2;
> >
> > -     /* Trap/constrain PMU */
> > -     if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64DFR0_EL1_PMUVer), feature_ids)) {
> > -             mdcr_set |= MDCR_EL2_TPM | MDCR_EL2_TPMCR;
> > -             mdcr_clear |= MDCR_EL2_HPME | MDCR_EL2_MTPME |
> > -                           MDCR_EL2_HPMN_MASK;
> > +     if (!has_hvhe()) {
> > +             val |= CPTR_NVHE_EL2_RES1;
> > +             val &= ~(CPTR_NVHE_EL2_RES0);
>
> It's a bit odd to do that at the beginning of the function no? Perhaps
> do it last to be sure to overwrite all the changes below?
>
> Also, not sure we need the RES1 part here, kvm_get_reset_cptr_el2()
> should have set those for us.

I agree on both, and by the end of this series they end up being as
you suggest. The purpose of this particular patch is just the grouping
of the traps, while keeping everything else the way it is.

Cheers,
/fuad

>
> >       }
> >
> > -     /* Trap Debug */
> > -     if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64DFR0_EL1_DebugVer), feature_ids))
> > -             mdcr_set |= MDCR_EL2_TDRA | MDCR_EL2_TDA | MDCR_EL2_TDE;
> > -
> > -     /* Trap OS Double Lock */
> > -     if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64DFR0_EL1_DoubleLock), feature_ids))
> > -             mdcr_set |= MDCR_EL2_TDOSA;
> > +     /* Trap AMU */
> > +     if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64PFR0_EL1_AMU), id_aa64pfr0))
> > +             val |= CPTR_EL2_TAM;
> >
> > -     /* Trap SPE */
> > -     if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64DFR0_EL1_PMSVer), feature_ids)) {
> > -             mdcr_set |= MDCR_EL2_TPMS;
> > -             mdcr_clear |= MDCR_EL2_E2PB_MASK << MDCR_EL2_E2PB_SHIFT;
> > +     /* Trap SVE */
> > +     if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64PFR0_EL1_SVE), id_aa64pfr0)) {
> > +             if (has_hvhe())
> > +                     val &= ~(CPACR_ELx_ZEN);
> > +             else
> > +                     val |= CPTR_EL2_TZ;
> >       }
> >
> > -     /* Trap Trace Filter */
> > -     if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64DFR0_EL1_TraceFilt), feature_ids))
> > -             mdcr_set |= MDCR_EL2_TTRF;
> > +     /* No SME support in KVM. */
> > +     BUG_ON(FIELD_GET(ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_SME), id_aa64pfr1));
> > +     if (has_hvhe())
> > +             val &= ~(CPACR_ELx_SMEN);
> > +     else
> > +             val |= CPTR_EL2_TSM;
> >
> >       /* Trap Trace */
> > -     if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64DFR0_EL1_TraceVer), feature_ids)) {
> > +     if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64DFR0_EL1_TraceVer), id_aa64dfr0)) {
> >               if (has_hvhe())
> > -                     cptr_set |= CPACR_EL1_TTA;
> > +                     val |= CPACR_EL1_TTA;
> >               else
> > -                     cptr_set |= CPTR_EL2_TTA;
> > +                     val |= CPTR_EL2_TTA;
> >       }
> >
> > -     /* Trap External Trace */
> > -     if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64DFR0_EL1_ExtTrcBuff), feature_ids))
> > -             mdcr_clear |= MDCR_EL2_E2TB_MASK << MDCR_EL2_E2TB_SHIFT;
> > -
> > -     vcpu->arch.mdcr_el2 |= mdcr_set;
> > -     vcpu->arch.mdcr_el2 &= ~mdcr_clear;
> > -     vcpu->arch.cptr_el2 |= cptr_set;
> > -}
> > -
> > -/*
> > - * Set trap register values based on features in ID_AA64MMFR0.
> > - */
> > -static void pvm_init_traps_aa64mmfr0(struct kvm_vcpu *vcpu)
> > -{
> > -     const u64 feature_ids = pvm_read_id_reg(vcpu, SYS_ID_AA64MMFR0_EL1);
> > -     u64 mdcr_set = 0;
> > -
> > -     /* Trap Debug Communications Channel registers */
> > -     if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64MMFR0_EL1_FGT), feature_ids))
> > -             mdcr_set |= MDCR_EL2_TDCC;
> > -
> > -     vcpu->arch.mdcr_el2 |= mdcr_set;
> > +     vcpu->arch.cptr_el2 = val;
> >  }

