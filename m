Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E9CE77170
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 01:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HcmaJfowWcM2EfWC/f7eVIZnrBnrT7YMLdrj9P9FhKU=; b=WzOEkCGRzuUxkkn0guDHpH0Nso
	DYYIUnGddGvwffNJE+bUH+yM8G6wEN6g6NbqYjA86hL4XMPUyvPCnYX/tMLpm+72oIgpQvDXy410U
	A0XC6tNtSdxhql8NT94MVPCMbTX6L7XRGM5Tsjv2fTc1US/UVmJTx1Y4nUIYThfACkS+Yzod2FUBM
	z0cluifaU+NW3bUCDoMtwLqQfkRq1Jp2K1J5ltPDDlp+VhizvCowcOipXubWLn7zk7NNlGcRc1faj
	l2zjGzoGfbzGNGfDNZ/Zbme+WDtimzC924iti2YYU+wy3cOmGQE2moHKN1IypFAlgYPC6ypCfRedy
	VQNOM03g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJMkg-000000009o0-1BPN;
	Fri, 06 Dec 2024 01:03:26 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJMjd-000000009YU-3T3A
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 01:02:23 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4349c7b6b0dso11365e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 17:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733446939; x=1734051739; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HcmaJfowWcM2EfWC/f7eVIZnrBnrT7YMLdrj9P9FhKU=;
        b=HoXQ1y418f79PlVD6Wr7WUhGsq9tVYjjLAxJ2nUKBmgv8nZe+972PvDDirR1An9gPy
         xgln6sZ9ZZ7KJ0x0nvoFfciY3E8SuQKRdqBSI7F43RaU2/epdyafC9g496ba1qkRvzGX
         CwFY3W4+wgDeq0x8LKY+ZR03kMy0bxApC9zA0+cP9NhgP0Eypr4uw/XzAY6NiVSyF+EX
         eYwzIyO0zE11xpS/jXuGggNJ9CMVHaBm/GCzLRy6YbAXPmcDho2VyJBV0xAs8D5rdUtA
         uHufgcnyjJM46EJblnAJQuPrVeQY7tOodgrq1gB/O0uJhWvc5GReQGyOkK7zcBCF8AHg
         wqpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733446939; x=1734051739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HcmaJfowWcM2EfWC/f7eVIZnrBnrT7YMLdrj9P9FhKU=;
        b=VBzP5XITXPZpbdvXvvRJpj9PpcbVr24WjNb5km/t16tvj6Am2moXmoYJhD2ppEWgOE
         nYsHtkzHhn1P9UoYOSgCJf9M5VzPWYVRuSjRCD80zncXruxCYYNIRzp/M3yks0ucXf3B
         GvgpPySJtAq6Q87PJHsGL5/m8hurvUQ8j993wZxqLpoltXetYpfaEtg/qniodxk5legm
         S+6B+QpcXGwCCem7wSo92wH3h1RqTE35jvOXbMFyLXwionDxbxiu5sNtI1TEqDPCu9r0
         fv68J4F4IATzWJdR2PaXJ4XZCWQ3g6gX7EDfpis85FUVt7OSQFAiWZtbnXdFhB7pL6cZ
         1Q2g==
X-Forwarded-Encrypted: i=1; AJvYcCX8wNN+t8Ztg3cZaIZR0mUXUo9sxLhROSQZbqbEM/W40zykhBx7ACZDqR83jGPXZ3IlEaIUcZW+y/7X6+lgn0qV@lists.infradead.org
X-Gm-Message-State: AOJu0YypgGXM/uZg1CYsK/DDA4eBW/C4KrDm5KLRabyrC8ox4Rahf6dz
	N4BmOu6QPEyV7uFQU4BLDnBzTXu6VGIVnnklkSkA6gGlFIcG1LVuGsOUzdmnlPyzYU4oMvLWmzM
	M9+uhVTkw+miirP/FzeHLY96V7k1XkFYUlUT+
X-Gm-Gg: ASbGnctwpGc0Vud+LUfcN9UuvpciqCBd8u+Qb8diH/oTPiLEbNJZquKbtTA4HjhymSa
	Fv8w0bVDn593OBxMMgFZOYDDFrHygl/Cczx7fVfE2HCgK1bw6+407y6cpVyNxgA==
X-Google-Smtp-Source: AGHT+IHr7rZI6yrn8JV11lazv05GZRIqvfrcbTPzKk8VEbu5RR7SF7uBMzJ9HVO9yJW2t5jlaavaPVHxFJi+zcGvyVY=
X-Received: by 2002:a05:600c:35ca:b0:42c:acd7:b59b with SMTP id
 5b1f17b1804b1-434de39c6bbmr476085e9.6.1733446938910; Thu, 05 Dec 2024
 17:02:18 -0800 (PST)
MIME-Version: 1.0
References: <20241031212104.1429609-1-jiaqiyan@google.com> <86r07v1g2z.wl-maz@kernel.org>
 <CACw3F51FbzkkX_DcCVCieZ=408oP_Fy3sXYk5AjWRX3RJO2Fzg@mail.gmail.com>
 <878qtou96b.wl-maz@kernel.org> <CACw3F50gB40dqQ4CZ7f4X4aRkxHQhjiYunAhqbmVtcGnd5g3bA@mail.gmail.com>
 <Zz2TyC9-zNQ3D-KB@linux.dev>
In-Reply-To: <Zz2TyC9-zNQ3D-KB@linux.dev>
From: Jiaqi Yan <jiaqiyan@google.com>
Date: Thu, 5 Dec 2024 17:02:06 -0800
Message-ID: <CACw3F50ACSOsP9+qJr2g=dL9p3-6AcZ2VWP2bbWvBMasu796pw@mail.gmail.com>
Subject: Re: [RFC PATCH v1] KVM: arm64: Introduce KVM_CAP_ARM_SIGBUS_ON_SEA
To: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>
Cc: joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, pbonzini@redhat.com, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, duenwen@google.com, rananta@google.com, 
	James Houghton <jthoughton@google.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_170221_877273_2382AAD6 
X-CRM114-Status: GOOD (  31.54  )
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

On Tue, Nov 19, 2024 at 11:46=E2=80=AFPM Oliver Upton <oliver.upton@linux.d=
ev> wrote:
>
> On Tue, Nov 19, 2024 at 03:57:46PM -0800, Jiaqi Yan wrote:
> >
> > While continuing the discussion here, I think it may make sense I sent
> > out a V2 with 2 major updates:
> >   - add documentation for new SIGBUS feature
> >   - remove KVM_CAP_ARM_SIGBUS_ON_SEA
>
> Just wanted to add that QEMU already has a functioning "MCE" injection
> implemenation based on signals that deals with the sloppy mess of
> coordinating w/ vCPU threads [*].
>
> I completely agree with Marc that the UAPI around using signals for this
> sort of thing is a giant pile of crap, but it seems to be a semi-understo=
od
> pile of crap. And from that perspective, wiring unclaimed SEAs into the
> existing infrastructure at least makes the UAPI consistent.
>
> [*]: https://elixir.bootlin.com/qemu/v9.1.1/C/ident/kvm_on_sigbus_vcpu
>
> > On Tue, Nov 12, 2024 at 12:51=E2=80=AFAM Marc Zyngier <maz@kernel.org> =
wrote:
> > > > Do you mean a CAP that VMM can tell KVM the VM guest has RAS abilit=
y?
> > > > I don't know if there is one for arm64. On x86 there is
> > > > KVM_X86_SETUP_MCE. KVM_CAP_ARM_INJECT_EXT_DABT maybe a revelant one
> > > > but I don't think it is exactly the one for "RAS ability".
> > >
> > > Having though about this a bit more, I now think this is independent
> > > of the guest supporting RAS. This really is about the VMM asking to b=
e
> > > made aware of RAS errors affecting the guest, and it is the signallin=
g
> > > back to the guest that needs to be gated by ID_AA64PFR0_EL1.RAS.
> >
> > Just to make sure I fully catch you. I think ID_AA64PFR0_EL1.RAS
> > translates to ARM64_HAS_RAS_EXTN in the kernel. If VMM signals RAS
> > error back to the guest with SEA, are you suggesting
> > __kvm_arm_vcpu_set_events should check
> > cpus_have_final_cap(ARM64_HAS_RAS_EXTN) before it
> > kvm_inject_dabt(vcpu)?
> >
> > If so, how could __kvm_arm_vcpu_set_events know if the error is about
> > RAS (e.g. memory error) vs about accessing memory not in a memslot
> > (i.e. KVM_EXIT_ARM_NISV)? I guess KVM needs to look at ESR_EL2 again
> > (e.g. kvm_vcpu_abt_issea vs kvm_vcpu_dabt_isvalid)?
>
> Good point. I don't think we can lock down this UAPI after the fact
> given the existing use cases. It is ultimately up to the VMM what to do.
>
> I don't see anything that would stop an implementation without FEAT_RAS
> from generating an SEA in this situation. The lack of FEAT_RAS (to me at
> least) implies:
>
>  - No ESR injection for vSErrors (already enforced in UAPI)
>  - No deferral of SErrors / ESBs
>  - No error record registers in the PE

Thanks Oliver, if I read you correctly, __kvm_arm_vcpu_set_events
doesn't need to assert ARM64_HAS_RAS_EXTN, and it also doesn't need to
differentiate RAS and KVM_EXIT_ARM_NISV.

>
> Of course, it is very likely you've thought about this more than I have,
> Marc.

I will send out RFC V2 in a second. Please take another look and
comment there, Marc and Oliver, thanks!

>
> --
> Thanks,
> Oliver

