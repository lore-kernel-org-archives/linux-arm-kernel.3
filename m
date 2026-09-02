Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B991C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 15:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2atBUez5/3AnWCQ3IY6Ohn5PAS7hQON2CkUYdFYqUoU=; b=SNT99JjfnpRcV4Ct1WOQG+gIOJ
	hUBxyLk45wmfPiW0GA1Mhq0S6EgbgRrvw62Al71WwVf1jAliiwkhzeb3ktbVArk049PqByeKVEe0H
	OpKCVnOGJbHI4Q4UEsrQ7HA8foRM9zo9TMb9pLAbbGPTcQ1n7QA/miW5YMZWMala8BiTmYe3J6n+M
	seRy3P6ujzcWo+k8Fca0rlaiLQBQRHHGSyp+7hvEK4eGZoZq02x3IQk+N26h9L8bqUAo0Wl5pN8Zo
	pVELt9sDSqJNQJVR2E6vNYQ8LiwGRvgtQPeSk5orvNajdpGihFnVlEtOo1XUgAvdKifqBzw6RFMHv
	SpezbwRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1nEb-0000000F8zv-3785;
	Wed, 02 Sep 2026 15:50:45 +0000
Received: from mail-pg1-x546.google.com ([2607:f8b0:4864:20::546])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1nEZ-0000000F8zW-30c9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 15:50:44 +0000
Received: by mail-pg1-x546.google.com with SMTP id 41be03b00d2f7-cc1cade6b71so13272a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 08:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788364242; x=1788969042; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2atBUez5/3AnWCQ3IY6Ohn5PAS7hQON2CkUYdFYqUoU=;
        b=U2MEA5C2kIyEICExru5Cw5/EqZr7F3LwYbvvH7aa+ZUzjBTnvaVRQkwb+blY9hY4ag
         zkLUNZYtIgdAdMoDcB9nCAkWRfxtwIW3Ybruyfu4e4Muj4KwILC2Twbg/yopbqJO3+tM
         3ad1/U78QjwQDSF/kw4pvvft3IHEy2aEvREBYqz759ZrDL5oUf9tmRSjKbr7Z5LyFkgw
         17bVqeB8XbB9fDTxAcw5TI9iNDYupwoQo2gsmM00GYxlut5zUhutUD+C+0LO5xAHM/2H
         NeFYZGFMr0ecMVxBWxxRsBDqrPIZOeFpPDAAMnF+TfvFHGkfd/AXe3/WLzxtgsOqJKte
         RwhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788364242; x=1788969042;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2atBUez5/3AnWCQ3IY6Ohn5PAS7hQON2CkUYdFYqUoU=;
        b=bYpkvlck56X1IAp2cvOLWrb8M6Bmr9nA0n1dr8uUmVi6KAX7pX4wCqG2EQbmXFxZiH
         77ZZaEglG8j2iyE7Ebng6EHy9G4vF8E+jmaVHTqFwS1ybxQ2wQ5c1fEz5YrXVB43ZRKH
         KCjNC7LqzobFtHn6fCWm3vPxfKcsGVDCFQE895J9tkECz1fCY1VHdLMKLOXUIuEXQGsR
         CD8Soemg6FXtKg6Fssz6aHr9brkd/6sphndD2A+E+DbxFkNNqpC5ZjwoamJeYGXY9Nja
         N6xe1zfgLkiW6VVTXj+habaLV2HCKloMplpEl/vAZ3i/RTdiBbP6aasvFPju+1/wpt2c
         uNvQ==
X-Forwarded-Encrypted: i=1; AKwUvBw40OknErfpyQudpdz1Tv2Ev+Ljgt9uS00MnjypFH0RoujbvzC9gEr7stfE8bjYzs+TVmo1LMJaN78eDMjqh7e5@lists.infradead.org
X-Gm-Message-State: AFuF++kyzjyHkpfMIrKZb5JpniLAvorjc9YkW2acrOI21M/dEM3isnrC
	fBanjr0sP/RR0TWYxDP+dKqzWpovQfA6O1yx8OpB73aioBLD4r63yKLoq+SnoyFZXLRiOIys8ri
	57DXhBw==
X-Received: from pgp19-n2.prod.google.com ([2002:a05:6a02:62d3:20b0:cc4:337d:af34])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:1449:b0:3d3:aed2:6f29
 with SMTP id adf61e73a8af0-3da2168db67mr89360637.29.1788364242090; Wed, 02
 Sep 2026 08:50:42 -0700 (PDT)
Date: Wed, 2 Sep 2026 08:50:41 -0700
In-Reply-To: <apgeAJKF--dZvKvF@google.com>
Mime-Version: 1.0
References: <20260831144802.834315-1-seiden@linux.ibm.com> <20260831144802.834315-4-seiden@linux.ibm.com>
 <apdwHcdy2iYRTrww@google.com> <87ik4om4x2.wl-maz@kernel.org>
 <20260902091351.438647-B-seiden@linux.ibm.com> <apgeAJKF--dZvKvF@google.com>
Message-ID: <aphF0ewDGuZxsrJz@google.com>
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
X-CRM114-CacheID: sfid-20260902_085043_782170_BFB336F3 
X-CRM114-Status: GOOD (  24.95  )
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

On Wed, Sep 02, 2026, Sean Christopherson wrote:
> On Wed, Sep 02, 2026, Steffen Eiden wrote:
> > On Wed, Sep 02, 2026 at 09:30:17AM +0100, Marc Zyngier wrote:
> > > On Wed, 02 Sep 2026 01:38:53 +0100,
> > > Sean Christopherson <seanjc@google.com> wrote:
> > > > 
> > > > On Mon, Aug 31, 2026, Steffen Eiden wrote:
> > > > > Only defining KVM_MMIO is not flexible enough for multi-KVM systems
> > > > > where one KVM implements MMIO but others do not. Solve this by
> > > > > additionally testing for the non-existence of KVM_NO_MMIO before
> > > > > including MMIO code to KVM.
> > > > 
> > > > Ewwwww.  IIUC, s390 ends up with two KVM modules, i.e. there really are two different
> > > > KVMs being built.  Rather than have a KVM_MMIO and NO_KVM_MMIO, I vote very
> > > > strongly to drop CONFIG_KVM_MMIO entirely and replace it with __KVM_HAVE_ARCH_MMIO,
> > > > a la __KVM_HAVE_ARCH_VM_FREE and others.  Tracking two separate macros is going
> > > > to be annoying to maintain, and will definitely be confusing for non-s390 people.
> > > > 
> > > > It'll mean linking in an emtpy coalesced_mmio.o on s390 when building without arm64
> > > > support, but I'm guessing that won't be at all common for s390 builds.
> > > > 
> > > 
> > > I ended-up doing something very similar locally, because I couldn't
> > > really make head or tail of the logic while being in holiday mode
> > > (which doesn't help). However, I kept the negative logic, so that we
> > > don't need to add anything to any architecture but S390 (they are the
> > > odd one out here).
> > negative makes sense. 
> 
> Ya, an opt-out for s390 works for me.

Actually, I have a better idea.  I'll explain more in the subthread about tracepoints.

