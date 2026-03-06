Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B361FCB61A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 15:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=unhg1T2qCPKxpfY/PSePUJ4/CJHWOdFGonXXRJegCXU=; b=Hy6mWkLo+yeOt8pc5GEgnbI/aa
	q+tP4uXCLGvH49+fPQzwKPZigna7WQXbJ2fJoeNtNXm9xchnJxJN0tJ3wiE5rNa2Et2zQ44KWb3G3
	TgRM0jfB9jlYsI8a33eK5BDjcJum/iwQ8qAieOPpbl3q7iHLn1LX6fISvX5bTuxpFOgs+jTmjzUZS
	oYYLBotNp+ifEHt9W7qdtZZMwsmQKs2qFc4kI56si6pYK9r78jvq2k1j4IKlkRu4GzkCM7Qrhb5PY
	ug0urSi15vouwDPuekUaX/b4w5diFsWPKYSKoly3pCvKs1CiufqvNrUI7Np2zIoBQENIyLApkYfok
	ReBw49Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyXMk-000000043g3-0GZ2;
	Fri, 06 Mar 2026 15:45:26 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyXMg-000000043fR-45Bt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 15:45:24 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-506a355aedfso600011cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 07:45:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772811922; cv=none;
        d=google.com; s=arc-20240605;
        b=CPM5WPHqsFvbUBZSLPYGjfLGyr4s4OUEbVJXLSa/kbWyAEDOqoqgZzVKASt9pWWOGu
         9dctIXbZRc2O8WbYsDxdz584rpRJwlBnzRckOQzL2gf9dsksR04TUc5cxXTxZu51LLfk
         i81Ygk7/2mt5w45+zjp3loK1wohVIcsQ8pp4WGJ+KdJ0dH8N99/Lza9sdTRL//6lbK1q
         xMaJj9e8W1Rb2jtxTbBca4tFCg/cniIpuHyPsLJNliLBqRqwwfSOXFT9knlbJSO9R8pH
         NRiCye7qVDyEdmHapUzYIrr3D2yEKbK2Q60r1EvDneWqglnUONzRJAuVS5//U2Wdo80O
         1M7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=unhg1T2qCPKxpfY/PSePUJ4/CJHWOdFGonXXRJegCXU=;
        fh=jpR8kf0ZcdM/vB327QmZtb/6XY4eGzLh8Bnl+5Zc4Cg=;
        b=ktB1scPkbAEHg07XYXxRtkmbBMsOO1c2XjCWaU6Wgt8NV5BxtMzf5+AKr4Z6OqIEPk
         q+93g6KV9A4xMQ9gdu+jyqXEjIkZ589qI8eiOWvNVVaAhxUjxNrxu8eUxhm+qtgVXAGp
         3/zlybNNv6lhyv0NJt8QnqKqsVQzM+c/EI36WBddmjSMO7SgyQ9flUYGth5qWBhWUL5l
         HzHhNYuWotXhcCnGq3kyHo4lLcAPz4GmeOPLa4cwCL6BrZXaIqc1EMfbknJ679kkt4AX
         s0ulpQGnNnp1IJYd/yYa+ZMlD63/4mJ2JrS9TrjNHBO8lSCOpxQEpAldbmZeOar49lHB
         l2Ww==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772811921; x=1773416721; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=unhg1T2qCPKxpfY/PSePUJ4/CJHWOdFGonXXRJegCXU=;
        b=yBA1yvjFF7FILeKFntpnCpmjSZnJBx9LUitHNxB+PM8FyRHNSHapqyh1og3kkWRx4U
         VbeNE91hpvU0NgI5n7O5gCJykbdXd99BBf9hRyJvYBTouuhJCdfctC8a03/7RQlKu97D
         +QGX007WmrC03JU7NPO+e7Kc2uwCnftsoTamGR/sJkOIj0NTfRu0JurkEnf8UcG0gYd2
         XgF0vDlp8Svg0TEWdowCRkP70iVI1zORtzRzoqumpWt7JoI9ZPn5TyVho+XW1KgMl2RF
         xbrR8DKczM99lWPVr9WxYS/Kfxuf+TuBCTLFJWwaHnEic8FVYEUcVF9h9AaSDxHo5eKF
         dtPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772811921; x=1773416721;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=unhg1T2qCPKxpfY/PSePUJ4/CJHWOdFGonXXRJegCXU=;
        b=U52GIlPHIYlfrE/cV7WogGujNQnhsDuMNr6Q86NGQWrwFQQS0IfVXCBn828Vu8M01L
         nvx6BISuGUoYEXDdXFOeRhnrurqG1t8CFCAYZj47B28BCzUp1rgpXyakbhEmCner7Is5
         Kcp7Dh+RuQlDkPVDcGLhgtIfsE01Jk+agKHNy1lItIxkyWHk2kqGyDaayyyuh98gU8a+
         aWPWqYM3ns74rfofGXu2mtmwkY1cCusKNMdl3jouXoAx/T0Iv763EtzVUzH9vpkTXVXO
         LHReXQBcT6C1rTYdPNsl6bFD+aYyqy46dfqla94CuBhMitXVDc8MXffKRdFcpEHTSvd4
         xwGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQ9otNiDLF+LDO5csefdfAMyBv5MM4qBzzYyNmb30QSYaiahtD8hDypctpIUlxs/N6KByK9hSOCb0E0dLHeTfS@lists.infradead.org
X-Gm-Message-State: AOJu0YytEtdtSIDWDwVngSitysncQBfS7qL1bBJcUAkEvbfUjxkSdpng
	w10JAVeLCSLyWp2fhPEecaTJL1AWwgkdjvPESCCZPLDOaAy/zwWEiVO7XvHglhfGCrEI9XQZnt4
	oetk+OrpeflW0XDAU3R05lpKQpjGO8VH9bKuQ6vr3
X-Gm-Gg: ATEYQzxLlNx3+y1XpoHNs2JTO4M2P0Sr2T7XHscAp4wUdtsijMqPsrTzfpe0dwbyGAW
	XcLb86Jus2AkyuuwlFpGm7nR7YO8ZrDAeVr3+QTna2vKVipxorRnmfd2of68dtVoeeOcxZxdcQ3
	WzmgcnMpEKApGGXPOQOTHh5jAnbXG102Te0eZujr++aveY9CoJYMJMVeDbZDXQK/mPDQmBQKBK7
	9efiZBxW8ZsBOS8aWC8dl6SCwk6fRSySQeeAeK+BM9204muFVM9g+2dOzWPm/95MYGN1GyJSX6Y
	Zwf0jHNA
X-Received: by 2002:a05:622a:1825:b0:501:5180:3c90 with SMTP id
 d75a77b69052e-508fa666c57mr3491241cf.15.1772811920943; Fri, 06 Mar 2026
 07:45:20 -0800 (PST)
MIME-Version: 1.0
References: <20260306140232.2193802-1-tabba@google.com> <86ikb96kg8.wl-maz@kernel.org>
In-Reply-To: <86ikb96kg8.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 6 Mar 2026 15:44:44 +0000
X-Gm-Features: AaiRm52XLBmqNfW9v8Obow2Zg0ILvEXXBAF6YDgU2FBbzIjxzMdGtwXjVc2CnoU
Message-ID: <CA+EHjTzenq_xFwe8K_g1KFbETqndS3FnxPiwBRKrMvrxH4Z1qg@mail.gmail.com>
Subject: Re: [PATCH v1 00/13] KVM: arm64: Refactor user_mem_abort() into a
 state-object model
To: Marc Zyngier <maz@kernel.org>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, qperret@google.com, 
	vdonnefort@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_074523_657329_D6A3BBF8 
X-CRM114-Status: GOOD (  36.73  )
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

On Fri, 6 Mar 2026 at 15:34, Marc Zyngier <maz@kernel.org> wrote:
>
> Hi Fuad,
>
> On Fri, 06 Mar 2026 14:02:19 +0000,
> Fuad Tabba <tabba@google.com> wrote:
> >
> > As promised in my recent patch series fixing a couple of urgent bugs in
> > user_mem_abort() [1], here is the actual refactoring to finally clean up this
> > monolith.
> >
> > If you look through the Fixes: history of user_mem_abort(), you will start to
> > see a very clear pattern of whack-a-mole caused by the sheer size and
> > complexity of the function. For example:
> > - We keep leaking struct page references on early error returns because the
> >   cleanup logic is hard to track (e.g., 5f9466b50c1b and the atomic fault leak
> >   I just fixed in the previous series).
> > - We have had uninitialized memcache pointers (157dbc4a321f) because the
> >   initialization flow jumps around unpredictably.
> > - We have had subtle TOCTOU and locking boundary bugs (like 13ec9308a857 and
> >   f587661f21eb) because we drop the mmap_read_lock midway through the function
> >   but leave the vma pointer and mmu_seq floating around in the same lexical
> >   scope, tempting people to use them.
> >
> > The bulk of the work is in the first 6 patches, which perform a strict,
> > no-logic-change structural refactoring of user_mem_abort() into a clean,
> > sequential dispatcher.
> >
> > We introduce a state object, struct kvm_s2_fault, which encapsulates
> > both the input parameters and the intermediate state. Then,
> > user_mem_abort() is broken down into focused, standalone helpers:
> > - kvm_s2_resolve_vma_size(): Determines the VMA shift and page size.
> > - kvm_s2_fault_pin_pfn(): Handles faulting in the physical page.
> >   - kvm_s2_fault_get_vma_info(): A tightly-scoped sub-helper that isolates the
> >     mmap_read_lock, VMA lookup, and metadata snapshotting.
> > - kvm_s2_fault_compute_prot(): Computes stage-2 protections and evaluates
> >   permission/execution constraints.
> > - kvm_s2_fault_map(): Manages the KVM MMU lock, mmu_seq retry loops, MTE, and
> >   the final stage-2 mapping.
> >
> > This structural change makes the "danger zone" foolproof. By isolating
> > the mmap_read_lock region inside a tightly-scoped sub-helper
> > (kvm_s2_fault_get_vma_info), the vma pointer is confined. It snapshots
> > the required metadata into the kvm_s2_fault structure before dropping
> > the lock. Because the pointers scope ends when the sub-helper returns,
> > accessing a stale VMA in the mapping phase is not possible by design.
> >
> > The remaining patches in are localized cleanup patches. With the logic
> > finally extracted into digestible helpers, these patches take the
> > opportunity to streamline struct initialization, drop redundant struct
> > variables, simplify nested math, and hoist validation checks (like MTE)
> > out of the lock-heavy mapping phase.
> >
> > I think that there are still more opportunities to tidy things up some
> > more, but I'll stop here to see what you think.
>
> Thanks a lot for going through this, this looks like a very valuable
> starting point. From a high-level perspective, the end result is even
> more shocking:
>
> <quote>
> static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>                           struct kvm_s2_trans *nested,
>                           struct kvm_memory_slot *memslot, unsigned long hva,
>                           bool fault_is_perm)
> {
>         bool write_fault = kvm_is_write_fault(vcpu);
>         bool logging_active = memslot_is_logging(memslot);
>         struct kvm_s2_fault fault = {
>                 .vcpu = vcpu,
>                 .fault_ipa = fault_ipa,
>                 .nested = nested,
>                 .memslot = memslot,
>                 .hva = hva,
>                 .fault_is_perm = fault_is_perm,
>                 .ipa = fault_ipa,
>                 .logging_active = logging_active,
>                 .force_pte = logging_active,
>                 .prot = KVM_PGTABLE_PROT_R,
>                 .fault_granule = fault_is_perm ? kvm_vcpu_trap_get_perm_fault_granule(vcpu) : 0,
>                 .write_fault = write_fault,
>                 .exec_fault = kvm_vcpu_trap_is_exec_fault(vcpu),
>                 .topup_memcache = !fault_is_perm || (logging_active && write_fault),
>         };
> </quote>
>
> This kvm_s2_fault structure is a mess of architectural state (the
> fault itself), hypervisor context (logging_active, force_pte...), and
> implementation details (topup_memcache...). Effectively, that's the
> container for *everything* that was a variable in u_m_a() is now part
> of the structure that is passed around.
>
> The task at hand is now to completely nuke this monster. The
> architectural fault information should be further split, and directly
> passed as a parameter to user_mem_abort(). We have a lot of redundant
> state that is computed, recomputed, derived, and that should probably
> moved into the exact place where it matters.

Thanks Marc! Like I said, I stopped after 13 patches to see what you
think, and if this is the right approach. But yes, more can be done
here.

>
> I'll have a play with it,

Sounds good, and if you'd like me to tackle any particular part of
this, let me know.

I have to admit, breaking this down into pieces and seeing how much
tidier and easier to understand it became felt oddly satisfying.

Cheers,
/fuad

> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

