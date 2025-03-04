Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3EE4C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 12:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4LJRch3g6p8/qLpu/3lOk7LZ1OdHfNWmv1WKY/EEqh0=; b=Cmox9DUrEyky4FCgg0qYnnn/Xg
	qlkEFQYAOSHZ1n/vJFmlaDll2frbgIuNpQZp6Zxu6TL9c8dXek8ocgJk1vVoUZBMRCt4C5PDitSDk
	DhtWsJD5N5pCvG+m2uWdEMSxjKAyyttLDLH0Ba1ou2okCtbJn8ZgQQT9NILCV+qEh3EV56i+PajzO
	OBl1ddx+q+lbshQLTifrO2xnTYzSbotI8q5oTxvrvWyQFirIWuiZkrHYzArBAVy52U1rN4r3EkFKY
	w/NFZWXlxx3txbyDhRqHiT1XYPLy6S0IEbw9dgfZFsZsyJiYwCIgM01Y8/Q6MEgdgA1+/M4LONszu
	WXbqH/Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpRWO-00000004eus-3Nub;
	Tue, 04 Mar 2025 12:37:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpRTP-00000004eOz-0TbF
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Mar 2025 12:34:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4LJRch3g6p8/qLpu/3lOk7LZ1OdHfNWmv1WKY/EEqh0=; b=aTZu7QLIIi6tZ0R33FO65O3VHJ
	lIBb6doTdXZY3Dtca+mwwCosfCTZh/pc6TVKuQ91mH+DvDT3WOYEIf5EmCypV7pe28z1m+qrxqZpE
	AHSPBjfQU6KOD0T8l8JZQ0BuSzo+29w46w+/+2ZKBaS7efzAWlsOidxWedeG25IgBmh5tZ86qVbVJ
	sZcXEXQnQNGUOZLgqoVmm0x8jcrYYbUVueL8eyDiKY5yOENopXidCC8rYZPbsLG9nvS0fsGt76nH6
	4NQt2E+WRT0Q9Jnc4ZRjR5lRbFXbqHbM8kxLPVxozWTm7NYKfkcRyjoJXkhkrkYMCV12lgB66oCY5
	Zvhr/0vw==;
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpRTL-0000000027K-3aAI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 12:34:09 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-472098e6e75so189221cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 04:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741091644; x=1741696444; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4LJRch3g6p8/qLpu/3lOk7LZ1OdHfNWmv1WKY/EEqh0=;
        b=G2RlqULBbxrdjLbWzGY5n/WdMstOJglp6Oija4FmEwYNckYxU7qsi2lrsHcjtXd1fJ
         /B8HNDkmf+lxfofAr6MPWX3dHPEBa1TT0224SP6uhtfHf8ItSGAUemG6qOfBaOpPEyBn
         BZ0nHsL3brkGw4tJzA2RgxDmOCe4EzUzPfudKR/1oIt0T52IvNR6hYXBGqeC9BMMymaK
         ThE39n+rMbcx2c+CxxThOCJLzVeFqFxbR0RNx//n5D95/p3dG/Qq15/oCjK9EV9m/f1b
         wrxnAVntj8rtE79U2FExTJ2c7ZhEYg37wT5o55ygYbp0aIWEAJyKNaMeVkJsBvsGB8ft
         MamA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741091644; x=1741696444;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4LJRch3g6p8/qLpu/3lOk7LZ1OdHfNWmv1WKY/EEqh0=;
        b=cOkFnjH2uKxA9z2Q7DLhmn1nzfPdS/p6wb24v6TYMJK9KzMRRHop0Up39dIbdiiBKI
         y9hN0wDjcMVQE7hV3d3TiBivPyEhqAaj97x4v9Zx+5MiU2hga/ncRcHs/i+Zoz5nYPVk
         xdtOjlJb0HgWRM4+RhnzIcXn1sreGKFYKTUASc0D7tVC/Si0UHNIlW3ZIuRf3Ca42VKV
         Hw1pIpQD9Yurg+OHizDhRvLDm48yOacM9X0lK4MeIJLRwGrkA8n0tv+ELrnnUus/Ya1W
         E8Zl52zewOOrdxSC3VkMQ+WgJyFxYyGmRUcSD4Ah3H7NMwKPdjyXzYZpvj55By2enHdT
         j94g==
X-Forwarded-Encrypted: i=1; AJvYcCWtzL69qKbxzXWNhysWK6EyJWCwv6++n9i9b7NbTEpEKQEiV/PubULhucsLR8DLU/Z5k4ywUXO/oP5Tk3kiwyZt@lists.infradead.org
X-Gm-Message-State: AOJu0YwpiuaKJ7RlnK9SrWHDFGQlT/vDOctG8QP38MQdOVUsWyNEWkF2
	wwt6WoBJ8U8GugI9Tf17KK8xjKBbeCYVosahpMRXSpF2XQnU629+fvsn2fLfuVXB4BoHahdKn+W
	wZWgIqbVox6giyzp4Et9HNSpj5g7+YOuQd9Jj
X-Gm-Gg: ASbGncvMVThH5duC+X/aVk5ZIja18/dLQfFJ/Sf3hAsGMtzC74DXVVjnShjUDLFx8Sz
	tt6hO3dk2hGMPLQzcVEJoBANX+kkQPbd1SODlx3dNuyR38cQR4/Dfec93bisRNSIJ0ZRNeFO2Ud
	VHYotbZ7+DK+Buy6GqvtlE9/ZOOj6FANZHnDejowAGsBfdIcFtrwg0sy8=
X-Google-Smtp-Source: AGHT+IG1wmb/E6zAyXf4gMbux2A/gpA3lOEtVh4lPWuPnUJ8LGWx86QRVEpJ7fTHwzq0tK63uaGZr22OB+UQPL1UizY=
X-Received: by 2002:a05:622a:654:b0:474:cd63:940d with SMTP id
 d75a77b69052e-474fc3ab73bmr4600141cf.0.1741091644342; Tue, 04 Mar 2025
 04:34:04 -0800 (PST)
MIME-Version: 1.0
References: <20250226215520.1759218-1-tabba@google.com> <20250226215520.1759218-4-tabba@google.com>
 <Z8ISLxQRcsx2uuHw@google.com> <CA+EHjTympdi0wei2Qx=hF2cYvHpzE0sWto2ypcJB3ddmonTROg@mail.gmail.com>
 <20250303191811.GA30361@willie-the-truck> <CA+EHjTySqDHDpOy=Vix5ZaNKWg61coySvV3Yk=+i0p8vg3mXTQ@mail.gmail.com>
 <20250303214947.GA30619@willie-the-truck>
In-Reply-To: <20250303214947.GA30619@willie-the-truck>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 4 Mar 2025 12:33:27 +0000
X-Gm-Features: AQ5f1JqOSOB-yVZxEjRDtO7BCysCBkkK48aeNEIBsUlYTe__dZnJkeRCsaRBrIQ
Message-ID: <CA+EHjTzZQ6UnOdaqpZ86JNiY=Gr_UoBAjZxk4CS3Q6nMJYdV2w@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250304_123408_046394_887ECFAF 
X-CRM114-Status: GOOD (  39.01  )
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

On Mon, 3 Mar 2025 at 21:49, Will Deacon <will@kernel.org> wrote:
>
> On Mon, Mar 03, 2025 at 07:21:33PM +0000, Fuad Tabba wrote:
> > On Mon, 3 Mar 2025 at 19:18, Will Deacon <will@kernel.org> wrote:
> > > On Mon, Mar 03, 2025 at 07:57:00AM +0000, Fuad Tabba wrote:
> > > > On Fri, 28 Feb 2025 at 19:44, Quentin Perret <qperret@google.com> wrote:
> > > > > On Wednesday 26 Feb 2025 at 21:55:19 (+0000), Fuad Tabba wrote:
> > > > > >  static int __pkvm_create_hyp_vm(struct kvm *host_kvm)
> > > > > >  {
> > > > > > -     size_t pgd_sz, hyp_vm_sz, hyp_vcpu_sz;
> > > > > > +     size_t pgd_sz, hyp_vm_sz;
> > > > > >       struct kvm_vcpu *host_vcpu;
> > > > > > -     pkvm_handle_t handle;
> > > > > >       void *pgd, *hyp_vm;
> > > > > >       unsigned long idx;
> > > > > >       int ret;
> > > > > > @@ -161,33 +178,12 @@ static int __pkvm_create_hyp_vm(struct kvm *host_kvm)
> > > > > >       if (ret < 0)
> > > > > >               goto free_vm;
> > > > > >
> > > > > > -     handle = ret;
> > > > > > +     WRITE_ONCE(host_kvm->arch.pkvm.handle, ret);
> > > > >
> > > > > What's the reason to make this a WRITE_ONCE? Does it mean we should
> > > > > update the readers to be READ_ONCE()?
> > > >
> > > > I don't remember the original reason, to be honest. In this case, it
> > > > was to make it consistent with downstream code in Android. That said,
> > > > I plan on revising all of these soon and fixing this (and related
> > > > code) in light of Will's comment regarding potential specter gadgets:
> > > >
> > > > https://lore.kernel.org/all/20250218092705.GA17030@willie-the-truck/
> > >
> > > I'm not sure the spectre stuff changes the concurrency aspects here, so
> > > Quentin's question presumably still stands even after that.
> > >
> > > Looking at the Android code, this WRITE_ONCE() pairs with a READ_ONCE()
> > > in pkvm_is_hyp_created() which is called without the config_lock held
> > > by kvm_arch_prepare_memory_region(). However, given that
> > > pkvm_is_hyp_created() is only testing against 0, I don't think the
> > > _ONCE() accessors are doing anything useful in that case.
> > >
> > > The more confusing stuff is where 'kvm->arch.pkvm.handle' is read
> > > directly without the 'config_lock' held. The MMU notifiers look like
> > > they can do that, so I wonder if there's a theoretical race where they
> > > can race with first run and issue TLB invalidation with the wrong handle?
> > > That would apply equally to the upstream code, I think.
> >
> > Would using _ONCE accessors with the MMU notifiers be enough to avoid
> > the race, or do we need to reconsider the lock protecting the handle
> > and apply it to the notifiers?
>
> I'm not entirely sure... if we used _ONCE() then we'd get either the
> correct handle or zero, but we presumably need to order that against the
> page-table somehow. The 'mmu_lock' looks like it gives us that, but I
> don't think the notifiers are expecting an uninitialised handle in the
> case where the page-table is empty (i.e. if they fire before first run).
>
> Given that the handle is necessary for TLB invalidation, I'd be inclined
> to make sure that the handle is allocated and published _before_ the
> kvm_pgtable pointer checked by the notifiers is set, but that means
> moving the handle allocation into kvm_arch_init_vm(). Is that do-able?

It is doable, but it won't be a simple patch. Up until now, the
creation of the hyp view of a vm is associated with the first run of
the vm, rather than its allocation at the host. Part of the reason for
that is that much of the vm state (mainly the vcpu state) isn't
finalized until then.

This patch series fixes this in part, by decoupling the initialization
of the individual vcpus from the vm. Because of that, it would be
doable, but it might be better as another patch series that we could
test and analyze separately.

If you agree, I could whip up something and send it soon.

Cheers,
/fuad
> Will

