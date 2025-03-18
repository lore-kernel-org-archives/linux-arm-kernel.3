Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A5EC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 19:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NR2Dj2DPN3F/JuAMDyd3/Po1SaaWRiipA/wuwjQg+vI=; b=DX7hVqAyyK4XQuFo3SKzga91HV
	oYzffxDH6OuM0qTeQTkUE/eXujh6oK8kpbUvbA4Rkfi5U9NCUacROduAha505/BWMeGvln0dW9fYB
	n+ckvxX7Nqb7BgQ8kIlMNzB+2nZqPvZes0RV8jSgYqzdBhYUlx2PjyEjvvd9KzC+F9QX8kkB09gI+
	AVoLzMeowdr8KSKoni+hOtBd7uiOVCpEGS/NR2AWSnFmUwLsL2fjFgts2pb+AsyFcO64h4JVlhK+h
	hxot7s0fuRAt3Ch9uoDL/lSh/K6rlfUNlce12ddKoRKkrtwL+EeYZBTyUcR3BNCSmoAY7a4w/Rhwe
	qa6ivVIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tucr4-00000006whK-0dj8;
	Tue, 18 Mar 2025 19:44:02 +0000
Received: from out-174.mta1.migadu.com ([95.215.58.174])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tucoD-00000006wOv-1JnY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 19:41:06 +0000
Date: Tue, 18 Mar 2025 12:40:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1742326862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NR2Dj2DPN3F/JuAMDyd3/Po1SaaWRiipA/wuwjQg+vI=;
	b=oep+1Plbv4PtXj/KFEU6POj20mcYFIxJC6aM2OoJMVG1c6i5Yyu1rzfpAFzF3pNTvSUTAu
	gpmVeRqi7AJI/nltKtsdsFJzz6qmTGXNp+pfXcSZ3RAyDfWCYk73LSTb3/GZcykFXtMj/9
	EgjkBH4IyswSiu8r/u4oGO6AYN5ujXA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: David Hildenbrand <david@redhat.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Marc Zyngier <maz@kernel.org>,
	Ankit Agrawal <ankita@nvidia.com>,
	"joey.gouly@arm.com" <joey.gouly@arm.com>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"will@kernel.org" <will@kernel.org>,
	"ryan.roberts@arm.com" <ryan.roberts@arm.com>,
	"shahuang@redhat.com" <shahuang@redhat.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	Aniket Agashe <aniketa@nvidia.com>, Neo Jia <cjia@nvidia.com>,
	Kirti Wankhede <kwankhede@nvidia.com>,
	"Tarun Gupta (SW-GPU)" <targupta@nvidia.com>,
	Vikram Sethi <vsethi@nvidia.com>, Andy Currid <acurrid@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>, Dan Williams <danw@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
	Uday Dhoke <udhoke@nvidia.com>, Dheeraj Nigam <dnigam@nvidia.com>,
	Krishnakant Jaju <kjaju@nvidia.com>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"sebastianene@google.com" <sebastianene@google.com>,
	"coltonlewis@google.com" <coltonlewis@google.com>,
	"kevin.tian@intel.com" <kevin.tian@intel.com>,
	"yi.l.liu@intel.com" <yi.l.liu@intel.com>,
	"ardb@kernel.org" <ardb@kernel.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"gshan@redhat.com" <gshan@redhat.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"ddutile@redhat.com" <ddutile@redhat.com>,
	"tabba@google.com" <tabba@google.com>,
	"qperret@google.com" <qperret@google.com>,
	"seanjc@google.com" <seanjc@google.com>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 1/1] KVM: arm64: Allow cacheable stage 2 mapping using
 VMA flags
Message-ID: <Z9nMHW-OqTLEqDRs@linux.dev>
References: <86r033olwv.wl-maz@kernel.org>
 <SA1PR12MB7199500A3683B15A64B663D6B0D12@SA1PR12MB7199.namprd12.prod.outlook.com>
 <87tt7y7j6r.wl-maz@kernel.org>
 <SA1PR12MB7199B320DAE42A8D7038A78EB0D32@SA1PR12MB7199.namprd12.prod.outlook.com>
 <8634fcnh0n.wl-maz@kernel.org>
 <Z9h98RhunemcFhhz@arm.com>
 <86wmcmn0dp.wl-maz@kernel.org>
 <20250318125527.GP9311@nvidia.com>
 <Z9nJH38Em9XEx3U7@arm.com>
 <ed25f5a6-dad6-4b5e-b42b-58e6ced6c7a2@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed25f5a6-dad6-4b5e-b42b-58e6ced6c7a2@redhat.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_124105_650530_D776C9DB 
X-CRM114-Status: GOOD (  25.43  )
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

On Tue, Mar 18, 2025 at 08:35:38PM +0100, David Hildenbrand wrote:
> On 18.03.25 20:27, Catalin Marinas wrote:
> > On Tue, Mar 18, 2025 at 09:55:27AM -0300, Jason Gunthorpe wrote:
> > > On Tue, Mar 18, 2025 at 09:39:30AM +0000, Marc Zyngier wrote:
> > > > The memslot must also be created with a new flag ((2c) in the taxonomy
> > > > above) that carries the "Please map VM_PFNMAP VMAs as cacheable". This
> > > > flag is only allowed if (1) is valid.
> > > > 
> > > > This results in the following behaviours:
> > > > 
> > > > - If the VMM creates the memslot with the cacheable attribute without
> > > >    (1) being advertised, we fail.
> > > > 
> > > > - If the VMM creates the memslot without the cacheable attribute, we
> > > >    map as NC, as it is today.
> > > 
> > > Is that OK though?
> > > 
> > > Now we have the MM page tables mapping this memory as cachable but KVM
> > > and the guest is accessing it as non-cached.
> > 
> > I don't think we should allow this.
> > 
> > > I thought ARM tried hard to avoid creating such mismatches? This is
> > > why the pgprot flags were used to drive this, not an opt-in flag. To
> > > prevent userspace from forcing a mismatch.
> > 
> > We have the vma->vm_page_prot when the memslot is added, so we could use
> > this instead of additional KVM flags.
> 
> I thought we try to avoid messing with the VMA when adding memslots; because
> KVM_CAP_SYNC_MMU allows user space for changing the VMAs afterwards without
> changing the memslot?

Any checks on the VMA at memslot creation is done out of courtesy to
userspace so it 'fails fast'. We repeat checks on the VMA at the time of
fault to handle userspace twiddling VMAs behind our back.

VM_MTE_ALLOWED is an example of this.

Thanks,
Oliver

