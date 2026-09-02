Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F8C9C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 13:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VNGwYj2t4glIGNOen6FjZQq8vvtMMzT1HX41CF0kxhE=; b=bN0OB+dmCRvAUvjCIzDluiYP0o
	I0aEAgk2X/rKzAt3JGQBC4fR4ea0utHMo4UVeJCyyXI3O6CjBDcD4kHIP2ZBZg43ORK+OdzPw9PI2
	5pr5r14jWYkWFiCjWae7gLvnNhU9TMZeCLNh8muk5MbXAvqvHtcHY/soK8PAAsnoHKUpe4J1+k8hs
	VLBStLtP1CfgTiaIZ8yRx7j6RV+LQiRYmXkl7xgfCxF+7KRnmklatGQ1BLBgx4GdJQSokApdaE1Pz
	UyQCFXDrc7neRSr3OpqWBUyxRR5MWDs71jcgdfCtnoCJI2N/2k32RdWdKbWhusjz1ehskmszRYrGz
	LoVTFnug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1kaH-0000000Ejxk-14bm;
	Wed, 02 Sep 2026 13:00:57 +0000
Received: from mail-pg1-x545.google.com ([2607:f8b0:4864:20::545])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1kaE-0000000Ejwp-3p8s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 13:00:56 +0000
Received: by mail-pg1-x545.google.com with SMTP id 41be03b00d2f7-cc1eb205d31so1566958a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 06:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788354050; x=1788958850; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VNGwYj2t4glIGNOen6FjZQq8vvtMMzT1HX41CF0kxhE=;
        b=tqirD0B/7cTFMTvM+6a0lJj/HmtnHEzxl2Puc9zc0TMaIKEA7qlqCluwkCMHlIGpLB
         0GnEAdCMLKjnfiAlRkOZ3DyR2LwYFiATWVIoYmYMW/j5k9MwH3EKi9z8QvVt4iWXuyyv
         +kz++uy0a0gkDXOogmcEJB/mrun/Q5vJ6YrTmRup82lsnnHZKQEkrPqjthpMxAULVv1P
         /7gXuMZm0tH4aCxNb6tUx1Q7+dWtYp4IEUeEhcB+BANbjDFH4WfDKSLFQ97ajZq7hE02
         rzguolUWuUbj8PBZcGBWro9IfcWt06a5iHzvCWOvHKnZYtd1byHs/ZDOm3frjXaKVhqP
         9iog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788354050; x=1788958850;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VNGwYj2t4glIGNOen6FjZQq8vvtMMzT1HX41CF0kxhE=;
        b=gEDvO7FpjAgmhdJuYx9AaZ/0vV047waBw89MYSLxwTUi0Afo3ocatCi76+6/YMp46X
         3MRw+LNTCdF+vzc8/yC+lYqWHf0fXLeFMZ0dJbNPGRR8Fzw7C0o0R8KiJ/e4VTOM7S2f
         miyIkwwg+S6DbX3BH2RgW0TvHhasffQ7UO7K6WLuQ7PbQ0xISIYoQwQT62PxJaUSXmuf
         jADzVxJShMq0ZvEKA5ajn/ABd59MPr43mCLEmg9vs55lKBs0Z1JZGtbFyUf5ftnZXoGL
         CCIzXMQl2NuP1f90S9U4IpRHfWsckruAwhE3muT5aDCCMETQgBor+YDvjzaC4oUG7Ia9
         wL4g==
X-Forwarded-Encrypted: i=1; AHgh+RqMiqLG4DTmOJXn0IVTNliJmd6dEYb1HoubkUyP0wBTE/rRT/1CSxsaDzteTXsIhGUAcHuMhee2jdd6gYhPPEMT@lists.infradead.org
X-Gm-Message-State: AFuF++kZUOeI1caGujx+8FpFJFtn6Kv5Fyg8UL4BV7s4GQxD9bVDDtRZ
	iR9d/sawajG1uFgx0Ge0ssrlpE45EsaYxPlsxh7hDv+5XiQ9q/vrUd2xWBc/XQz/QPMF/Gu+Y7+
	iS5ql5Q==
X-Received: from pgdo11-n1.prod.google.com ([2002:a05:6a02:620b:10b0:cc1:5155:bdd1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:9151:b0:3d3:b02a:7252
 with SMTP id adf61e73a8af0-3d9b0f39b5emr5405095637.28.1788354049347; Wed, 02
 Sep 2026 06:00:49 -0700 (PDT)
Date: Wed, 2 Sep 2026 06:00:48 -0700
In-Reply-To: <20260902091351.438647-B-seiden@linux.ibm.com>
Mime-Version: 1.0
References: <20260831144802.834315-1-seiden@linux.ibm.com> <20260831144802.834315-4-seiden@linux.ibm.com>
 <apdwHcdy2iYRTrww@google.com> <87ik4om4x2.wl-maz@kernel.org> <20260902091351.438647-B-seiden@linux.ibm.com>
Message-ID: <apgeAJKF--dZvKvF@google.com>
Subject: Re: [PATCH v7 03/23] KVM: Allow KVM implementations to switch off
 MMIO independent of Kconfig
From: Sean Christopherson <seanjc@google.com>
To: Steffen Eiden <seiden@linux.ibm.com>
Cc: Marc Zyngier <maz@kernel.org>, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-s390@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Andreas Grapentin <gra@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, David Hildenbrand <david@kernel.org>, 
	Friedrich Welter <fritz@linux.ibm.com>, Fuad Tabba <tabba@google.com>, 
	Gautam Gala <ggala@linux.ibm.com>, Hariharan Mari <hari55@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Hendrik Brueckner <brueckner@linux.ibm.com>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Nico Boehr <nrb@linux.ibm.com>, 
	Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>, Oliver Upton <oupton@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Ulrich Weigand <Ulrich.Weigand@de.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_060054_963325_EE320AFA 
X-CRM114-Status: GOOD (  25.20  )
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

On Wed, Sep 02, 2026, Steffen Eiden wrote:
> On Wed, Sep 02, 2026 at 09:30:17AM +0100, Marc Zyngier wrote:
> > On Wed, 02 Sep 2026 01:38:53 +0100,
> > Sean Christopherson <seanjc@google.com> wrote:
> > > 
> > > On Mon, Aug 31, 2026, Steffen Eiden wrote:
> > > > Only defining KVM_MMIO is not flexible enough for multi-KVM systems
> > > > where one KVM implements MMIO but others do not. Solve this by
> > > > additionally testing for the non-existence of KVM_NO_MMIO before
> > > > including MMIO code to KVM.
> > > 
> > > Ewwwww.  IIUC, s390 ends up with two KVM modules, i.e. there really are two different
> > > KVMs being built.  Rather than have a KVM_MMIO and NO_KVM_MMIO, I vote very
> > > strongly to drop CONFIG_KVM_MMIO entirely and replace it with __KVM_HAVE_ARCH_MMIO,
> > > a la __KVM_HAVE_ARCH_VM_FREE and others.  Tracking two separate macros is going
> > > to be annoying to maintain, and will definitely be confusing for non-s390 people.
> > > 
> > > It'll mean linking in an emtpy coalesced_mmio.o on s390 when building without arm64
> > > support, but I'm guessing that won't be at all common for s390 builds.
> > > 
> > 
> > I ended-up doing something very similar locally, because I couldn't
> > really make head or tail of the logic while being in holiday mode
> > (which doesn't help). However, I kept the negative logic, so that we
> > don't need to add anything to any architecture but S390 (they are the
> > odd one out here).
> negative makes sense. 

Ya, an opt-out for s390 works for me.

> IIRC KVM/power does select KVM_MMIO most of the times but not always.
> I'll check that.

Huh, indeed.  KVM_BOOK3S_64_HV=y && KVM_BOOK3S_64_PR=n ends up with KVM_MMIO=n.
Though I'm not surprised given the multitude of variants PPC has.

