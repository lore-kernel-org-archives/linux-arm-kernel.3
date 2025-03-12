Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C3BC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 15:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tG82S1dPB3gesttVeiU27NqmP0CvoM5o/lmxjPR26s4=; b=1cjDcwVC+rZhMnao4L3vIrs0Jx
	EuqCfVtr8z6HPK51kQn8BctSR5nZmmoZCqDeES7OtzpYksMw/LC5IcW8iHv5fGdU0E7kM+OUdB8fZ
	pA4OSOKh+kcyr1X3X3XxTiuRG9+kTzAZrmfHvpaR/GcX+Qnr6TilUodzBU5bPcBv3hkZzioL8DQZ/
	giF0/PrOC6EyB2nEBJxhHj2PwoCZUgjZb63ePqtphA+yjHY6IEejflqSmqG1f4AQ6AFEXbGBLLWSF
	aTs46AIUWdoHsC84Uv1wYTTSkt/Dnf1YAKzbpr/F8b+YufHtNGfDSJLINwiV43Ln5LnrOL8UJoUZA
	VEcbpWEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsO5u-00000008skr-2Cny;
	Wed, 12 Mar 2025 15:34:06 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsO3o-00000008sNk-3Y7K
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 15:31:58 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-476693c2cc2so286491cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 08:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741793515; x=1742398315; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tG82S1dPB3gesttVeiU27NqmP0CvoM5o/lmxjPR26s4=;
        b=n6U1Z3MGFVmzoXO/lTQUinutz9TTFhot/4hr3Su8ox/YGVV6nR67eub/jj++zqslVa
         g8/riDsCHZWtw1l4Vs2ekGFWZ7+BaW+eUDS8raXywKdgEb+EIG5it/gOpsaVC70lHy7P
         zIndnBcvbMm4/zoaYpwcGuDmchJ7b+JgRCH/7S/DKpGc7wQXdwdKT0Uvgdf5OMztHaAS
         XDQWTFQHqIxcnpQtrQZrnGgVJ3p3oDyAZn6zGhSt3p6V/h+jswYjN8Y2bxfnwMATiQbn
         h/8yNDpFIJASVNP12zevp6V9ImPFNx7A0iulrJeuFNtTa5kPorhyvTLf2n2LeKzt5B3K
         iXig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741793515; x=1742398315;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tG82S1dPB3gesttVeiU27NqmP0CvoM5o/lmxjPR26s4=;
        b=brrL+eGchaLrutj5XcTY9xwW893IfgPoESrslrwlVmLrsCJ4deuGG4yfl7q8qAAZHb
         vlmlzwn3Ry3sWG7wM/7BZvm/7BM8ueAk8UF+4oD/2FoeEVNOz+fLgZTI8N/LMxXP8cGS
         PVxYR0+8YAnJlYqNQJZy00Uo9L3sN56Iz+jmvchKUdlvXAOaomyOk64ouJoncAtq9lXO
         Sz0mXYbq3GrtMm3z++gb9VYNiKkTXlsbIaYTJZZoFzhnC21kxMmu5g5vMFRU5qq0xQQ7
         gE/4qsvM//hQQ16Q94FgwfJoTPoxjdRNs1tFvyy7VMxQcG76GfmFX4wneQNKxdz4254d
         6Lqg==
X-Forwarded-Encrypted: i=1; AJvYcCUPltsBetFDW3EC0NJgUKvuFadKKpPTpZSYj0D3/RJFydCR6c5I0Y8mc/n02TJQmYmc8tMjmp0ZLUZ7ce2xKaW8@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2UmfOh20BofWtyTF1BfldOX4mrkxo6oZ2kWb7DVMLYIO+w88f
	ZvVXok1HZdKjENeFCfDGvKcxqimaTNJtQQ2h1T5J4rAigzopoJ0gt2wXzZUJ+6uHo/BVV6QO5aC
	qUlQrbAJNyVwLqQ+9OY+F8Vvy2OslrptZqy6f
X-Gm-Gg: ASbGncug2paKojRXYy1H/TGuXJNYuYPJDhi0bWPtbnGTCcb8yg9JinwGQxhLeMCTHx2
	p/MawPyAFX3NYNaiKZlcttbu8S2HlarBlwXA1XP1GArc4iYU5NR99LlSg57qjNyggjjqy35OmKr
	hP89RJzWRk1OaJbEPRCAV1wefyb3dj/yjX+YHXlCVhikglo1j1Mj1eJA==
X-Google-Smtp-Source: AGHT+IEHK6oT5TlE+REnvTokAeXQuuw9qmZ5nHudPNlpFHJvl0FT9GKH5ET9eQ9MIP2gY64AZ1oLmbLYWRl16Veuld0=
X-Received: by 2002:a05:622a:607:b0:474:fa94:8d20 with SMTP id
 d75a77b69052e-476b78bf69bmr323061cf.2.1741793514642; Wed, 12 Mar 2025
 08:31:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250226215520.1759218-1-tabba@google.com> <20250226215520.1759218-4-tabba@google.com>
 <Z8ISLxQRcsx2uuHw@google.com> <CA+EHjTympdi0wei2Qx=hF2cYvHpzE0sWto2ypcJB3ddmonTROg@mail.gmail.com>
 <20250303191811.GA30361@willie-the-truck> <CA+EHjTySqDHDpOy=Vix5ZaNKWg61coySvV3Yk=+i0p8vg3mXTQ@mail.gmail.com>
 <20250303214947.GA30619@willie-the-truck> <CA+EHjTzZQ6UnOdaqpZ86JNiY=Gr_UoBAjZxk4CS3Q6nMJYdV2w@mail.gmail.com>
 <20250312152903.GA6488@willie-the-truck>
In-Reply-To: <20250312152903.GA6488@willie-the-truck>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 12 Mar 2025 15:31:17 +0000
X-Gm-Features: AQ5f1JocXlbciVxJNch5-JMEVaLmoWVDEmiXQ76WjlCy0ZdcQpp4l1-Jr17BKJU
Message-ID: <CA+EHjTwHb9mDj20WxeqKky6oAfRDV2R7iiQpwmuBmdZ4aWuS4A@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] KVM: arm64: Factor out pKVM hyp vcpu creation to
 separate function
To: Will Deacon <will@kernel.org>
Cc: Quentin Perret <qperret@google.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, maz@kernel.org, oliver.upton@linux.dev, 
	mark.rutland@arm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	vdonnefort@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_083156_892617_72F72B9C 
X-CRM114-Status: GOOD (  46.66  )
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

On Wed, 12 Mar 2025 at 15:29, Will Deacon <will@kernel.org> wrote:
>
> On Tue, Mar 04, 2025 at 12:33:27PM +0000, Fuad Tabba wrote:
> > On Mon, 3 Mar 2025 at 21:49, Will Deacon <will@kernel.org> wrote:
> > >
> > > On Mon, Mar 03, 2025 at 07:21:33PM +0000, Fuad Tabba wrote:
> > > > On Mon, 3 Mar 2025 at 19:18, Will Deacon <will@kernel.org> wrote:
> > > > > On Mon, Mar 03, 2025 at 07:57:00AM +0000, Fuad Tabba wrote:
> > > > > > On Fri, 28 Feb 2025 at 19:44, Quentin Perret <qperret@google.com> wrote:
> > > > > > > On Wednesday 26 Feb 2025 at 21:55:19 (+0000), Fuad Tabba wrote:
> > > > > > > >  static int __pkvm_create_hyp_vm(struct kvm *host_kvm)
> > > > > > > >  {
> > > > > > > > -     size_t pgd_sz, hyp_vm_sz, hyp_vcpu_sz;
> > > > > > > > +     size_t pgd_sz, hyp_vm_sz;
> > > > > > > >       struct kvm_vcpu *host_vcpu;
> > > > > > > > -     pkvm_handle_t handle;
> > > > > > > >       void *pgd, *hyp_vm;
> > > > > > > >       unsigned long idx;
> > > > > > > >       int ret;
> > > > > > > > @@ -161,33 +178,12 @@ static int __pkvm_create_hyp_vm(struct kvm *host_kvm)
> > > > > > > >       if (ret < 0)
> > > > > > > >               goto free_vm;
> > > > > > > >
> > > > > > > > -     handle = ret;
> > > > > > > > +     WRITE_ONCE(host_kvm->arch.pkvm.handle, ret);
> > > > > > >
> > > > > > > What's the reason to make this a WRITE_ONCE? Does it mean we should
> > > > > > > update the readers to be READ_ONCE()?
> > > > > >
> > > > > > I don't remember the original reason, to be honest. In this case, it
> > > > > > was to make it consistent with downstream code in Android. That said,
> > > > > > I plan on revising all of these soon and fixing this (and related
> > > > > > code) in light of Will's comment regarding potential specter gadgets:
> > > > > >
> > > > > > https://lore.kernel.org/all/20250218092705.GA17030@willie-the-truck/
> > > > >
> > > > > I'm not sure the spectre stuff changes the concurrency aspects here, so
> > > > > Quentin's question presumably still stands even after that.
> > > > >
> > > > > Looking at the Android code, this WRITE_ONCE() pairs with a READ_ONCE()
> > > > > in pkvm_is_hyp_created() which is called without the config_lock held
> > > > > by kvm_arch_prepare_memory_region(). However, given that
> > > > > pkvm_is_hyp_created() is only testing against 0, I don't think the
> > > > > _ONCE() accessors are doing anything useful in that case.
> > > > >
> > > > > The more confusing stuff is where 'kvm->arch.pkvm.handle' is read
> > > > > directly without the 'config_lock' held. The MMU notifiers look like
> > > > > they can do that, so I wonder if there's a theoretical race where they
> > > > > can race with first run and issue TLB invalidation with the wrong handle?
> > > > > That would apply equally to the upstream code, I think.
> > > >
> > > > Would using _ONCE accessors with the MMU notifiers be enough to avoid
> > > > the race, or do we need to reconsider the lock protecting the handle
> > > > and apply it to the notifiers?
> > >
> > > I'm not entirely sure... if we used _ONCE() then we'd get either the
> > > correct handle or zero, but we presumably need to order that against the
> > > page-table somehow. The 'mmu_lock' looks like it gives us that, but I
> > > don't think the notifiers are expecting an uninitialised handle in the
> > > case where the page-table is empty (i.e. if they fire before first run).
> > >
> > > Given that the handle is necessary for TLB invalidation, I'd be inclined
> > > to make sure that the handle is allocated and published _before_ the
> > > kvm_pgtable pointer checked by the notifiers is set, but that means
> > > moving the handle allocation into kvm_arch_init_vm(). Is that do-able?
> >
> > It is doable, but it won't be a simple patch. Up until now, the
> > creation of the hyp view of a vm is associated with the first run of
> > the vm, rather than its allocation at the host. Part of the reason for
> > that is that much of the vm state (mainly the vcpu state) isn't
> > finalized until then.
> >
> > This patch series fixes this in part, by decoupling the initialization
> > of the individual vcpus from the vm. Because of that, it would be
> > doable, but it might be better as another patch series that we could
> > test and analyze separately.
> >
> > If you agree, I could whip up something and send it soon.
>
> Yeah, I think we should fix this as a separate series and drop the
> WRITE_ONCE() from this patch.

I'll send a fix soon.

Oliver, would you like me to respin this series, or can you drop the
WRITE_ONCE()?

Thanks,
/fuad

> Will

