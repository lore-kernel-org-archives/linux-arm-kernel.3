Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE60CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 17:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=awe61BJaN6OAuRksC/JK1rM8AwR4j7lc1rsLmD6YWSg=; b=hk6ToH6annVeXUj76i19c0piwO
	+OBTL1otyrKiwULducKgQwwB5ayu6WpwsLAEswkJqoxuzH1WIojdIiwoWmK7weFbPeF37XOtObBTD
	QqC9AmmxsukDczoOv9bLyGqH3RtTtk50IyF3JVncLYq63Y2jMrOYXqDMxe0RnscFbya8v5gC+e6zf
	tv09LaohMWJFNhrjU5g7PEEjvEgsPNj7w+pfXaaXLDJHDlFW73/+wOgk8Fnxr5tzFMvZcoui91IUr
	ZpENnwhWkIwIHfCmhGT022BxkY9k/iX5BAOKGSPPaUzS1RLwtlnuZAa3+kvX2Ug3mhFCR4XbfU/+P
	vYMf6A2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGKrv-0000000CHLh-3xqp;
	Tue, 04 Nov 2025 17:30:55 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGKrs-0000000CHLB-3R9o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 17:30:53 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-4ed6ca52a0bso173421cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 09:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762277451; x=1762882251; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=awe61BJaN6OAuRksC/JK1rM8AwR4j7lc1rsLmD6YWSg=;
        b=DGcaQe5FAmvOridppzPSxw08+T6ceNipCEL5xsIp/56InNGA8jhu3NUWZz6kdrX0N7
         Z6LhkLGI/icBTcsODLBpRrMU5PNOwyfza27mUM1AW2KDmKrZ2TecONpM4VTpTB5HdYHT
         JlK4TLgwUQaRyqEd6gwtyjXaQC49Ab+jLUvoli9Nc52pEC0hPBeq6FurAnHlrFjo4mKC
         zNHQjwqHZY68cULUr7hvO3LZqgkBd0s1bfwmmhKkOzjH6/8pbqScwuIduUgarU+9WlgH
         bWPs4q3x2RhUer6owD/uBRPXD68uqO22Ibu/DU1jhfZohqZcQuT6JiB0ssdBJlcwWlUW
         kasg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762277451; x=1762882251;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=awe61BJaN6OAuRksC/JK1rM8AwR4j7lc1rsLmD6YWSg=;
        b=Tl4mnA7Rc6FA/sPd9AfQImBnKjzzT/D8hKfapFAPg2SHWCESo9xGgppF8eYb65rW59
         7WNO9ORV6mnHxqdS6AAIWFN4xYbnoUIUZt3nBCWIwIN9RcW/4eqyZPuJN0KufOO3IOCD
         Ou0drGvRPaCjPHH6UBYvSHpUi0KMJZabTGo4swsSzTAmcWA55udlS+uuz1Jn3zjGRSR3
         uUQYTOqGC/pMFOAq4xedX0F5M9A/zIZyxWha1nYqKya/DbjK2nY+ITKv+x2tLDe8f9JY
         BwB9sHABTiRPpAdhMjrzxZLHZqoYEIiPfWAn0Avao0MlkpXOn2CDzC/3CS3tMdZY1yv3
         TTGA==
X-Forwarded-Encrypted: i=1; AJvYcCVIK3yWqGyjRnN40KN10j8rF9Ew1aizGy490l7ngIbz34cRjfuXgZu8xddBp8zaLXOHrbbnqHICCs8hSJP+jUq4@lists.infradead.org
X-Gm-Message-State: AOJu0YyWYX3b1UCIOc9sqmiSlrfW0DH1a1OB/JplhYdCnQizTiX76WoH
	lYowhvsNpGumjYqF2dm1IplfAAQTLK4KFelxj084q0XnIG0KXROMGy3+yxdNyEod2JYfTEK2+jJ
	YN/f6txDVckC0lcXC/ZFkpDs3NoN+ReTg9ZN58UAl
X-Gm-Gg: ASbGnctM78CVaFnP0e4EgNfMqPzWtMJJm0j5c6+AqwDagXbHc9CPTsPzFYDRxBLHjOH
	eG5T9wtrudJLghZ1VGYwkH29PnLWeq3viZgvYsKLIYinjkI7dcqzIiGyv9auTRFYdLeJDTeXa7B
	d8w5K8434Tbj+Gob7IjZzUqJZ0x+HYLFWk/Xqsu+N2+6X7tfBkP9x+NTMcPYtAGRWPRjsULUa0C
	ZjyxPlOq10NiEwekXiLpIlJurAZ5zzi9+GYgFcpw0KJ0rrB7EgSegMld04cWA==
X-Google-Smtp-Source: AGHT+IH8OXBy7BFfRFn05NDCo7PgyCzEnxa6zf1c0iFH9l4wPXRMCXywAxQHI8bFY1HB7DcqLoyPvy/jm3Gx3juAFeU=
X-Received: by 2002:ac8:57d2:0:b0:4e5:7827:f4b9 with SMTP id
 d75a77b69052e-4ed63645c68mr7879891cf.3.1762277450955; Tue, 04 Nov 2025
 09:30:50 -0800 (PST)
MIME-Version: 1.0
References: <20251104125906.1919426-1-tabba@google.com> <20251104125906.1919426-3-tabba@google.com>
 <86h5v9vnfc.wl-maz@kernel.org> <CA+EHjTw7KnXVKeyxd4kNysAOMZrJniuBdCNGV=NoWodc3H-rMw@mail.gmail.com>
 <86ecqdvhk5.wl-maz@kernel.org>
In-Reply-To: <86ecqdvhk5.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 4 Nov 2025 17:30:14 +0000
X-Gm-Features: AWmQ_bk3ESFlcrVaimrCr7Ll-opZglXriMvY88QUUeSlFyQFCbdDPvb3Jp9FL-I
Message-ID: <CA+EHjTxc8zbTj_f-d5uY6euYHyKXUG+XLs-Qa6n2UyGo0OmOrg@mail.gmail.com>
Subject: Re: [PATCH v1 2/8] KVM: arm64: Trap access to ALLINT if FEAT_NMI not
 supported by the guest
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	oliver.upton@linux.dev, will@kernel.org, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	vladimir.murzin@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_093052_865111_EF2CCC50 
X-CRM114-Status: GOOD (  32.99  )
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

On Tue, 4 Nov 2025 at 17:22, Marc Zyngier <maz@kernel.org> wrote:
>
> On Tue, 04 Nov 2025 15:30:34 +0000,
> Fuad Tabba <tabba@google.com> wrote:
> >
> > Hi Marc,
> >
> > On Tue, 4 Nov 2025 at 15:15, Marc Zyngier <maz@kernel.org> wrote:
> > >
> > > On Tue, 04 Nov 2025 12:59:00 +0000,
> > > Fuad Tabba <tabba@google.com> wrote:
> > > >
> > > > Access to ALLINT is part of FEAT_NMI. If a guest does not support this
> > > > feature, any access to this register must be trapped to the hypervisor
> > > > (EL2).
> > > >
> > > > KVM didn't configure this trap, potentially allowing a guest to toggle
> > > > all interrupt mask when it doesn't support FEAT_NMI. Fix this by
> > > > checking if the guest has FEAT_NMI support.
> > > >
> > > > Signed-off-by: Fuad Tabba <tabba@google.com>
> > > > ---
> > > >  arch/arm64/include/asm/kvm_emulate.h | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
> > > > index 0f8311263edf..3fc62808c548 100644
> > > > --- a/arch/arm64/include/asm/kvm_emulate.h
> > > > +++ b/arch/arm64/include/asm/kvm_emulate.h
> > > > @@ -688,6 +688,9 @@ static inline void vcpu_set_hcrx(struct kvm_vcpu *vcpu)
> > > >               else
> > > >                       vcpu->arch.hcrx_el2 |= HCRX_EL2_MCE2;
> > > >
> > > > +             if (!kvm_has_feat(kvm, ID_AA64PFR1_EL1, NMI, IMP))
> > > > +                     vcpu->arch.hcrx_el2 |= HCRX_EL2_TALLINT;
> > > > +
> > > >               if (kvm_has_tcr2(kvm))
> > > >                       vcpu->arch.hcrx_el2 |= HCRX_EL2_TCR2En;
> > > >
> > >
> > > I think this is moving in the wrong direction. We have for quite some
> > > time now tried to automatically derive these behaviours from the guest
> > > config, as we do for FGUs.
> > >
> > > I would like to see a similar behaviour being introduced for non-FGT
> > > bits so that we don't have to worry about these things anymore.
> >
> > I agree that we should make this more like FGT, but since that will
> > likely require a bit more time (and probably a couple of respins),
> > should we fix the HCRX traps as they are now?
>
> I don't think this is fixing anything. Where does the trap go? There
> is no triaging, no handling. At the very least, this needs to be
> defined.

Right... I was thinking of protected VMs, but much of that code isn't
yet upstream. I'll start working on handling these traps similar to
the FGU handling, so it's ready when we start upstreaming the rest of
pKVM (soon I hope).

Cheers,
/fuad


> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

