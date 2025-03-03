Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A116C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 19:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PDLT3QzYiiEMxH3LRhvcTZswaNirfgCySO+G8g1d1Lw=; b=0m5T2hiq4paD4euV9UqGEEeyIt
	LqNXve7WIZ/JXzBnhJEIgSx3T0C6DMGJweUHCxtucU2JsRaNZ4s1+PJqwGGCI5SlV5RON0iAT/R47
	vbbJadpilPHnKKdrOC9rZQ3tmLTeO3OM3rGeiUhr9sXfwRNkUrxSDATjD3gZ48UFwvR1W0kItkoH6
	g6yX7Qgm77QnrQbyCXkADm2B7k2K5jzj55LEs5RIknP5XYQeAN1II3iOUuf0vuv5cSSuxTU1kctUy
	rNU/LdKGD3t56lCPOMbB3HQyDHE1/vIOS73IoYV70Tm1Pt+SFEZZDzGLybWCmlGMvxQGgtQVdTaD4
	MLACLfFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpBOK-000000023ts-1CbT;
	Mon, 03 Mar 2025 19:23:52 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpBMk-000000023n6-3MUF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 19:22:16 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5497363eeafso1174e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 11:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741029733; x=1741634533; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PDLT3QzYiiEMxH3LRhvcTZswaNirfgCySO+G8g1d1Lw=;
        b=be36e1NSHehIRdVKhKO1bMB1GgLYgjy3j1P5AdEAkIvBc7B62RGN47kdUcP6jLJ7+9
         ++Eql7P93jFmFbndY5ze6zrKoY8SrNO5DaMGHENNMXQ9R+hh1sz/MsIypBrgL+KZNI0i
         wLjRrcN3wPIb0KU/wvvveFXxnBJcsm4nGfF7dqqP16CsTZZKIwJcqx0V9vzQTUy2Ewvr
         nEtCI/2g783O1DLq6qD4j/Gs/0IDzUenQtjQy6jGWFMI32YbzLf+EuICNogyT3R6aTJm
         TsHKnIqF2a77Xk/P9mGM6Vdh0MTpAzc+2LGJ1PZgsRPEvqL/cNtLjTGgyeJOz6aVVph/
         MWvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741029733; x=1741634533;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PDLT3QzYiiEMxH3LRhvcTZswaNirfgCySO+G8g1d1Lw=;
        b=qMwngblSjRXhb8r5v7naX320QwUdQ/7g+alhZXTXFoLLxiNZo527VX/1pPCZwY1skX
         6aoppp2AMVmbBB+47MZGukgaLuX/pKOGlGlAvt4fh/ItdLLthHWUPIaMfBDHbokog03l
         wiosMJ+vzoMo1Tm//4M5RmdDHM4Hu3gLjMRrhRxlQWF/burURgeH8iRsjZR+hBsUqGWI
         jymSBE7yF36xZ/V56WukCQOhmF7sRJq/bwYJcg4jryj1wTVfhCAok7AgRRb0zUruo1Dj
         kApgUcIMVD+9c460A9tsBsPRORdXQO2YToy4los7YceyF++Xjza/SC8YyWCz7qsybn9I
         Y/7w==
X-Forwarded-Encrypted: i=1; AJvYcCW2kLDRtJANu5Jg4gGY94JfvUjhv7WMODPECbOQhsTydoZavQ0TP99t2mDJ/k50AfJliFLgLvqVFNI+tVDlr77l@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6Xs9ete8FBiMANo65c6KBr3jZRvz8ihL4qsSFwVPkNJrv1jBk
	ZpRnHEDWwT//eFcw9UUMLtgnaUkyPi1OT8BnupjpA6wrHZvyjZLhCFTniKxmnVxld4KwGTw15uc
	reHQqRbzecfx9S1hU/Yq7YOA9cviwc6PPhmN1
X-Gm-Gg: ASbGncvtbXrATdJWOfD6CNeuRYWdtXSnGU1BIhFLy+JPCV4iqUMf4pHTHuehy9cVwxy
	p/D61XkubmuAZTMDzyVSDZtSYsNsS8ee0A1i0YGw231ndWYWuMnSdpnWWHySu7R1kBEBSr58jlX
	witjPWAti/V1EzTXTfYs8M7DLX
X-Google-Smtp-Source: AGHT+IH0UTG3oJy1Apr/sXOoJuaoHHK92kRrLOibMfH2rbEqTUafssJ68yUuJTdCNdnYlytHqDJOqqFRXysa369aflM=
X-Received: by 2002:a05:6512:3f1d:b0:549:73a8:c258 with SMTP id
 2adb3069b0e04-54975de8114mr25263e87.0.1741029732676; Mon, 03 Mar 2025
 11:22:12 -0800 (PST)
MIME-Version: 1.0
References: <20250226215520.1759218-1-tabba@google.com> <20250226215520.1759218-4-tabba@google.com>
 <Z8ISLxQRcsx2uuHw@google.com> <CA+EHjTympdi0wei2Qx=hF2cYvHpzE0sWto2ypcJB3ddmonTROg@mail.gmail.com>
 <20250303191811.GA30361@willie-the-truck>
In-Reply-To: <20250303191811.GA30361@willie-the-truck>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 3 Mar 2025 19:21:33 +0000
X-Gm-Features: AQ5f1JovXie3lpePW4x4dhoQubm0OwM3WEY0HTJKnA6kBEqtNQIAaQvijWR7Ijk
Message-ID: <CA+EHjTySqDHDpOy=Vix5ZaNKWg61coySvV3Yk=+i0p8vg3mXTQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250303_112214_840948_3DBB296E 
X-CRM114-Status: GOOD (  26.19  )
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

On Mon, 3 Mar 2025 at 19:18, Will Deacon <will@kernel.org> wrote:
>
> On Mon, Mar 03, 2025 at 07:57:00AM +0000, Fuad Tabba wrote:
> > On Fri, 28 Feb 2025 at 19:44, Quentin Perret <qperret@google.com> wrote:
> > >
> > > On Wednesday 26 Feb 2025 at 21:55:19 (+0000), Fuad Tabba wrote:
> > > >  static int __pkvm_create_hyp_vm(struct kvm *host_kvm)
> > > >  {
> > > > -     size_t pgd_sz, hyp_vm_sz, hyp_vcpu_sz;
> > > > +     size_t pgd_sz, hyp_vm_sz;
> > > >       struct kvm_vcpu *host_vcpu;
> > > > -     pkvm_handle_t handle;
> > > >       void *pgd, *hyp_vm;
> > > >       unsigned long idx;
> > > >       int ret;
> > > > @@ -161,33 +178,12 @@ static int __pkvm_create_hyp_vm(struct kvm *host_kvm)
> > > >       if (ret < 0)
> > > >               goto free_vm;
> > > >
> > > > -     handle = ret;
> > > > +     WRITE_ONCE(host_kvm->arch.pkvm.handle, ret);
> > >
> > > What's the reason to make this a WRITE_ONCE? Does it mean we should
> > > update the readers to be READ_ONCE()?
> >
> > I don't remember the original reason, to be honest. In this case, it
> > was to make it consistent with downstream code in Android. That said,
> > I plan on revising all of these soon and fixing this (and related
> > code) in light of Will's comment regarding potential specter gadgets:
> >
> > https://lore.kernel.org/all/20250218092705.GA17030@willie-the-truck/
>
> I'm not sure the spectre stuff changes the concurrency aspects here, so
> Quentin's question presumably still stands even after that.
>
> Looking at the Android code, this WRITE_ONCE() pairs with a READ_ONCE()
> in pkvm_is_hyp_created() which is called without the config_lock held
> by kvm_arch_prepare_memory_region(). However, given that
> pkvm_is_hyp_created() is only testing against 0, I don't think the
> _ONCE() accessors are doing anything useful in that case.
>
> The more confusing stuff is where 'kvm->arch.pkvm.handle' is read
> directly without the 'config_lock' held. The MMU notifiers look like
> they can do that, so I wonder if there's a theoretical race where they
> can race with first run and issue TLB invalidation with the wrong handle?
> That would apply equally to the upstream code, I think.

Would using _ONCE accessors with the MMU notifiers be enough to avoid
the race, or do we need to reconsider the lock protecting the handle
and apply it to the notifiers?

Cheers,
/fuad

> Will

