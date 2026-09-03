Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CCBAC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 16:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cz/vxAxSl2gQ2aLA5WdlQGYy08Jlga70knbm9bWpIU0=; b=DAjfXz9Fs+qArSxkEm3okwXCTZ
	STbBasAL2Km9QoV0OrvUZEntJyH9Til+pBBt4aVIg7PJ27dTsmbH2SMBTifxhiLs8E5W7z1r37++k
	zx4iIVXAqe0lZJ0VEDU84ff3+XOf4rp+V260eF8v6Y1vZOpb9hh1gX4JacTVjjAFyCi4dIr2Rc6XB
	lcGykVbwkXTlHfISrmfUbMifNv+2kaDrsvr5fjPFvyUGTbn/Yh47jwvV2RA7d6yopEzPmAuobgk+y
	o+ZlzhiQyXXfxNX7hM8isdirCIVBB3mJIH2TxI/ahqnhYimaqzEPFcX24+iWMEBOfDmhJyN5l6hnq
	VeHovYOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2ABH-000000009A5-1ogy;
	Thu, 03 Sep 2026 16:20:51 +0000
Received: from out-243.mta0.migadu.com ([2001:41d0:1004:224b::f3] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2ABF-0000000099M-16sb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 16:20:50 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=AkJG1cubqnvO8sxUYeb9Y8S45m7KFZON1Zp+P7kN8ZI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788452447; v=1; x=1789057247;
 b=U2NpLztsVQyd+Ho/s8EiiM5adY4PAVZ9xOzhOr8mpmAo6uUpxiFY7nPm0TB32Opy0D8ZpjCY
 83YSXHUICFUS94FzTm36u2yemB991m27s4Q/MU/ByW13hH7vwiuz1/OfGqBVPFd3OXiW/G6Ub5D
 ZY88Cay0wT0qk722fnfp9Zkc=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 9c79baaaa9426faf;
	Thu, 03 Sep 2026 16:20:47 +0000
X-Mizu-Trace-ID: 9c79baaaa9426faf
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b17358so6537e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 09:20:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw6iujXbEd43tWLQ4KvWVvMEjObMUZITKmgh47Q0CmOgxwEm+aQVvN8py3ypJAo2K+rxelh6Jk0rguti15HCDiO@lists.infradead.org
X-Gm-Message-State: AFuF++l6TIK3GLLwefsJxRvGRLfzgiaLrclGe6Sl6d0oNEx9p5Beg3lP
	aav9nl0VXExkn7pjR9Lc+zIvIJr0k2y/a6FlHHSKwWy1wacmZu5EezwBBTJRigl+Ezhn33+OBbq
	EvQ3ilUqmvhMHArKOpdozVJEjkJ11L/4o7Yqjk1tR
X-Received: by 2002:a05:6512:3b8e:b0:5b1:4fd9:ac with SMTP id
 2adb3069b0e04-5b60f98abf0mr143016e87.3.1788452444151; Thu, 03 Sep 2026
 09:20:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260831163421.272420-1-fuad.tabba@linux.dev> <20260831163421.272420-3-fuad.tabba@linux.dev>
 <apgjJVg0PmS3OudU@google.com>
In-Reply-To: <apgjJVg0PmS3OudU@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 3 Sep 2026 17:20:07 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzkUqmso49_XV2pPLBDbgqOe5Xnk=2+mWuX55NB2Nospw@mail.gmail.com>
X-Gm-Features: AcwNN1UhKtG9WhVNbYyetZAICUndgBZHs9WEb955L7xRcf_KFNgwRj6BJQ8GY38
Message-ID: <CA+EHjTzkUqmso49_XV2pPLBDbgqOe5Xnk=2+mWuX55NB2Nospw@mail.gmail.com>
Subject: Re: [PATCH 02/17] KVM: arm64: Advertise the capabilities that
 protected VMs support
To: Vincent Donnefort <vdonnefort@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_092049_447105_3BF26BC9 
X-CRM114-Status: GOOD (  18.75  )
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

On Wed, 2 Sept 2026 at 14:22, Vincent Donnefort <vdonnefort@google.com> wrote:
>
> On Mon, Aug 31, 2026 at 05:34:06PM +0100, Fuad Tabba wrote:
> > kvm_pkvm_ext_allowed() denies every capability it does not name, so a
> > protected VM reports 0 for interfaces it implements: KVM_CHECK_EXTENSION
> > denies KVM_CAP_ONE_REG while KVM_{GET,SET}_ONE_REG stage the guest's
> > boot state.
> >
> > Allow the capabilities that work for a protected guest, the vGIC and
> > the I/O bus being host-managed, subject to the restrictions the rest of
> > this series adds.
> >
> > Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> > ---
> >  arch/arm64/include/asm/kvm_pkvm.h | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
> > index beea00e693a0a..c4c834d55e503 100644
> > --- a/arch/arm64/include/asm/kvm_pkvm.h
> > +++ b/arch/arm64/include/asm/kvm_pkvm.h
> > @@ -42,6 +42,15 @@ static inline bool kvm_pkvm_ext_allowed(struct kvm *kvm, long ext)
> >       case KVM_CAP_ARM_VM_IPA_SIZE:
> >       case KVM_CAP_ARM_PTRAUTH_ADDRESS:
> >       case KVM_CAP_ARM_PTRAUTH_GENERIC:
> > +     case KVM_CAP_ONE_REG:
>
> Shouldn't we bring the VCPU_PKVM_FINALIZED restriction in kvm_arch_vcpu_ioctl()
> first before we allow SET_ONE_REG/GET_ONE_REG?

KVM_{GET,SET}_ONE_REG don't go through kvm_pkvm_ext_allowed(), so
they're as reachable before this patch as after it.

The ordering is wrong though, and there are a few more capabilities
advertised here and restricted later. I'll fix it for all of them in
v2.

Thanks,
/fuad

>
> > +     case KVM_CAP_MP_STATE:
> > +     case KVM_CAP_VCPU_EVENTS:
> > +     case KVM_CAP_VCPU_ATTRIBUTES:
> > +     case KVM_CAP_IMMEDIATE_EXIT:
> > +     case KVM_CAP_IOEVENTFD:
> > +     case KVM_CAP_IRQFD_RESAMPLE:
> > +     case KVM_CAP_ARM_IRQ_LINE_LAYOUT_2:
> > +     case KVM_CAP_ARM_INJECT_SERROR_ESR:
> >               return true;
> >       case KVM_CAP_ARM_MTE:
> >               return false;
> > --
> > 2.39.5
> >

