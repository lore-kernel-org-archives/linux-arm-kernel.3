Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A25C5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 13:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pTDI6EKrZhHzu91ABEa/3hYoH7aGPcaJaVd/MJRw0Ok=; b=JawhAsSLywjVF8pXqXz+EU2zxQ
	Qt19iWLBTMusGeKhA98tpxzDwV58wGznViAT/zL9Os0ulI7jJIp+AQGRRoeY9suM4EB3liZivc/Al
	lZ3Qt+ZD2K9GScGsLGm/NbIV/AcJWvDLRs01sctYuwYGJth95tUrwShyMOlfeZ2UbYenXnxQ7oL8g
	e+tZ38gXUtxFJYmRF2g2bvWLcH8ONRaKBIRxZz9Zim/lJCyjUBjT7rIdUROR0rYmivxvo7umyS8wk
	YVPK4JU9GP7v9qyK1v7i1BMiSPSWLougjRmFTt7dSE39AVe42uw8j2eoyG8ekLdNmtcZdKbSvqWiR
	VZAURuWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtPjs-0000000BrdO-0CPg;
	Mon, 10 Aug 2026 13:08:24 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtPjp-0000000Brcb-0nVd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 13:08:22 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-51bfe810293so7476571cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 06:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1786367299; x=1786972099; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pTDI6EKrZhHzu91ABEa/3hYoH7aGPcaJaVd/MJRw0Ok=;
        b=ZrcVNJxv4JgmaHtpaF9LXRRtfZqjeQoir+keqedo+u+HXvJ+nuoKe0yZcYNS9JlSlr
         RSJscb6BMlt0gN7uJypUX5GPF0pMjCY4/J+ZZJssTG/1GfBWQG4yh/XiCsFut1MY8mMC
         VWjlgUciEWdFiiHxY6Gr5xgv+CbEEUnGSAxqCD9WiNMFIUWNFsLf26Wl+u5gSkLzMtZT
         H1JOb6DULefQA9Wmtv8uFgKzcchT+ElA/HCvURhqFHjEVFgR2pGzEIvzf928axtvs8SR
         40tfO7ebGVlLDyMXwqYiDTKuEdW5L+xC+tOlKmFt/HRkUBecM+cdITnoDq+gsUHoFPP7
         g+1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786367299; x=1786972099;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pTDI6EKrZhHzu91ABEa/3hYoH7aGPcaJaVd/MJRw0Ok=;
        b=dWbX0uDYtO4grIs2yvqOxLBoNJIVPdKl9l37HMNKdGws916mZ7HWDv/ThjXGubmUZ1
         8H7ANEvWFWL3+KNVWeyaavggM7m50XzvOqCjmgj8Q5Qcd8pkS+9dMyxA2f1GY07aTlWK
         tOs08blTymnLBQE6Zij56/8pkYPuWI6BpsjFFmCOVPjdbeNJGhd8qhyUwIeSc7IzrubR
         NkzafVwIeq5EdlTk7e/uwZHPHxh0HeMDVMhNRl6afRNuY5cE4DVGCL4ADIa9au8sX2d+
         P7sDKlfNl/PL5UEogpMdsATiqStrO74TujLv35okRiJtrlnhm6wpz7XFMV/JaR/IiS+8
         LaxA==
X-Forwarded-Encrypted: i=1; AHgh+RoLzCHB3zavp0NS7YGrBuPakOhWfZOots1z+tKS7bhPSzNLB5TR2OP33/RQKdXBBgSO/jlJzy6auq2RmNS6BXCL@lists.infradead.org
X-Gm-Message-State: AOJu0YxN/m+FLSZdahyCy08bHaDsWPJsFYQjvTVQ19fGF7Wseb5pn9OY
	Aoo/AyW9XJtNEDZt4qmN2Y+TGZNFViTCVz7fVWcjilj/wwiCL96nEsQ7GrDjDcSBX0o=
X-Gm-Gg: AR+sD12c6/ZTAZnETkjixDNM/EUqucd+fWsYL0KGoTH266S7FQTKWklwdpe/7+uova3
	+qTISvdZ9RzwgCsEzHQ1ZNuNDpTk7cHkWNXIUNg+5vGCbhBSJeKgKAn492c2NMEXc+bT82ixeAN
	QDp0HlCoJYpAmkys7OzUyieT29nADyNgrcyCtM3bQAoMA627888HwG2KOctSO6pxPoBkK0IjKCh
	G27JM13NdUzqXEmTNrKqhG07fH+C2uX/QHF9UJhDnwxDEpeupud3CnNlbomtK9rDukVONpeaBwh
	kFIS3IpKo8TWzJbZVLY7zbZEHu7C5CBSEf4AwkedJD1sKL9rX3mQvHYctlfnpQEOa7BYyCikhbp
	/QYA1KVZHYxMtep+uw8FhY1xYY2Gtt9Ptyvvl5zYOS/6zjHpQDMRob2Le6SHRoIPINdl3VZJZl4
	p1ZLQh4GGtYR/uuFVXzCHl5G5Rb2LCV+lMKA6SAA==
X-Received: by 2002:ac8:574f:0:b0:51b:fcb4:7576 with SMTP id d75a77b69052e-52d20961711mr224570371cf.15.1786367299519;
        Mon, 10 Aug 2026 06:08:19 -0700 (PDT)
Received: from ziepe.ca ([142.166.156.215])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52d163c1aefsm70838551cf.12.2026.08.10.06.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 06:08:18 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wtPjm-000000022LS-0EaO;
	Mon, 10 Aug 2026 10:08:18 -0300
Date: Mon, 10 Aug 2026 10:08:18 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Will Deacon <will@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Mostafa Saleh <smostafa@google.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
	Marc Zyngier <maz@kernel.org>, Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org
Subject: Re: [PATCH] arm64: swiotlb: Keep the default size for protected
 guests
Message-ID: <20260810130818.GN200537@ziepe.ca>
References: <anX7F7dnKOtAOIIe@google.com>
 <20260807164734.GE200537@ziepe.ca>
 <anYgXSR4VAi3TpOj@google.com>
 <CGME20260807182023eucas1p1f653436207b2b00338e99ea1d8f847df@eucas1p1.samsung.com>
 <20260807182017.GH200537@ziepe.ca>
 <7d22482f-d5fd-4cf4-9d32-6a54e02f2fbb@samsung.com>
 <yq5av79iiard.fsf@kernel.org>
 <anml6lLRERm1Iv-_@willie-the-truck>
 <28442500-1d53-4776-bae5-459c3ffc1cc6@samsung.com>
 <anm6K2umtx4iKnyZ@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <anm6K2umtx4iKnyZ@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_060821_304461_4BF4CC81 
X-CRM114-Status: GOOD (  29.08  )
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

On Mon, Aug 10, 2026 at 12:46:51PM +0100, Will Deacon wrote:
> On Mon, Aug 10, 2026 at 01:37:11PM +0200, Marek Szyprowski wrote:
> > On 10.08.2026 12:20, Will Deacon wrote:
> > > On Mon, Aug 10, 2026 at 02:59:42PM +0530, Aneesh Kumar K.V wrote:
> > >> Marek Szyprowski <m.szyprowski@samsung.com> writes:
> > >>
> > >>> On 07.08.2026 20:20, Jason Gunthorpe wrote:
> > >>>> On Fri, Aug 07, 2026 at 06:13:49PM +0000, Mostafa Saleh wrote:
> > >>>>> But the whole thing is best effort anyway, the kernel picks
> > >>>>> IO_TLB_DEFAULT_SIZE which does not depend on the system topology or
> > >>>>> how many devices or how much DMA they do.
> > >>>>> SWIOTLB memory is wasted if unused so we should be careful around
> > >>>>> that as it would be the other way around and users would have to
> > >>>>> decrease it manually.
> > >>>> Yeah, it is why the arch code shouldn't really be sizing it directly,
> > >>>> it should be done in common code and, yes, we are probably going to
> > >>>> have to do something alot smarter to have the common code better
> > >>>> auto-tune this for the CC case..
> > >>> What about the $subject patch? I assume that it is still needed to
> > >>>
> > >>> restore the behavior that was altered by the "[PATCH v8 00/23]
> > >>>
> > >>> dma-mapping: Track shared DMA state through direct, pool and swiotlb
> > >>>
> > >>> paths?" patchset?
> > >>>
> > >> I would request that we pick this patch to fix the regression described
> > >> in https://lore.kernel.org/all/yq5azeyxyfol.fsf@kernel.org/.
> > > I really don't think we need it. CCA hardware isn't exactly widespread
> > > and the KVM host side patches don't appear close to being merged.
> > 
> > Does this mean that the branch for-next/coco [1] won't go to v7.3-rc1?

Let's not make progress on guest support contingent on KVM CCA host
side patches please. I expect the CSPs will have VM instance types
available based on CCA within quarters, and Linux as a Guest should
work in those environments regardless of what KVM is doing. I don't
really expect full KVM support for years, frankly, the patchset is
massive. Even Intel and AMD don't have full KVM support yet.

People already have CCA capable HW, are already testing this stuff and
the closer upstream can get to being workable as a guest without a
mountain of OOT patches the better.

I agree the thing is not ideal, but it was merged to ARM like this a
long time ago, this patch is just fixing a small oopsie (was it a
merge conflict?) to put it back. I don't the objection.

Jason

