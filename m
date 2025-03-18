Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 817F8C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 19:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uLREQAcpdVHD+RUaVABJCrC10uCF6Ks8siHlbc6H7tA=; b=xCTxQIo+gub4UjGT36kj3OegVc
	XfzCPjLbYWvGd8w6IP2+A1a/PGJRMBRgaUIcFIqsvzN9BzcnsLYvo0k5GvgbtrlfpSL/htWeXOusv
	XgHfIrPSE1fa6svKK6K3PsBiiyqaYT74eJ6M+Q5iARCaRavmLFnEze4cdQMIUWFr/k50U+bkeuWlw
	GO/bmFt0K3mi043XbqElx02V/O1kpsbnaGDzVu8AqJxk5c6hq42YminWZjlLMzkz6r80kyyvBBfmu
	fZIPG16HjO5uvo9GOtCosYuoWtg8K5PMtsGImSSM/a9hE8rpRXQvgFMxplLNT5PbQViN21ZeV81Xu
	LLeMv4Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tucgN-00000006vhp-0cr6;
	Tue, 18 Mar 2025 19:32:59 +0000
Received: from out-176.mta1.migadu.com ([2001:41d0:203:375::b0])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuceS-00000006vV0-43ra
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 19:31:05 +0000
Date: Tue, 18 Mar 2025 12:30:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1742326258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uLREQAcpdVHD+RUaVABJCrC10uCF6Ks8siHlbc6H7tA=;
	b=WlqGmwDRsO1UUaFH9yUFZMy9CfFkpAGDcne5CiOP+6AA+Wo4pYhnbYm0Jb+DsRO9k71Yyn
	IHIuNY1g+eEMFvWMGhToC1muOIENThRa98bhSmT6/woLCNYhIla68ON0lImFdZpbLorZ6K
	kCanSbMELDemVUArW689c91yyMrEQ14=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Marc Zyngier <maz@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Ankit Agrawal <ankita@nvidia.com>,
	"joey.gouly@arm.com" <joey.gouly@arm.com>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"will@kernel.org" <will@kernel.org>,
	"ryan.roberts@arm.com" <ryan.roberts@arm.com>,
	"shahuang@redhat.com" <shahuang@redhat.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"david@redhat.com" <david@redhat.com>,
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
Message-ID: <Z9nJ42PllG8a7AY7@linux.dev>
References: <861pv5p0c3.wl-maz@kernel.org>
 <SA1PR12MB7199DD985C45943A663E7003B0D12@SA1PR12MB7199.namprd12.prod.outlook.com>
 <86r033olwv.wl-maz@kernel.org>
 <SA1PR12MB7199500A3683B15A64B663D6B0D12@SA1PR12MB7199.namprd12.prod.outlook.com>
 <87tt7y7j6r.wl-maz@kernel.org>
 <SA1PR12MB7199B320DAE42A8D7038A78EB0D32@SA1PR12MB7199.namprd12.prod.outlook.com>
 <8634fcnh0n.wl-maz@kernel.org>
 <Z9h98RhunemcFhhz@arm.com>
 <86wmcmn0dp.wl-maz@kernel.org>
 <20250318125527.GP9311@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318125527.GP9311@nvidia.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_123101_355569_1BC558C8 
X-CRM114-Status: GOOD (  28.99  )
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

On Tue, Mar 18, 2025 at 09:55:27AM -0300, Jason Gunthorpe wrote:
> On Tue, Mar 18, 2025 at 09:39:30AM +0000, Marc Zyngier wrote:
> 
> > The memslot must also be created with a new flag ((2c) in the taxonomy
> > above) that carries the "Please map VM_PFNMAP VMAs as cacheable". This
> > flag is only allowed if (1) is valid.
> > 
> > This results in the following behaviours:
> > 
> > - If the VMM creates the memslot with the cacheable attribute without
> >   (1) being advertised, we fail.
> > 
> > - If the VMM creates the memslot without the cacheable attribute, we
> >   map as NC, as it is today.
> 
> Is that OK though?
> 
> Now we have the MM page tables mapping this memory as cachable but KVM
> and the guest is accessing it as non-cached.
> 
> I thought ARM tried hard to avoid creating such mismatches? This is
> why the pgprot flags were used to drive this, not an opt-in flag. To
> prevent userspace from forcing a mismatch.

It's far more problematic the other way around, e.g. the host knows that
something needs a Device-* attribute and the VM has done something
cacheable. The endpoint for that PA could, for example, fall over when
lines pulled in by the guest are written back, which of course can't
always be traced back to the offending VM.

OTOH, if the host knows that a PA is cacheable and the guest does
something non-cacheable, you 'just' have to deal with the usual
mismatched attributes problem as laid out in the ARM ARM.

> > What this doesn't do is *automatically* decide for the VMM what
> > attributes to use. The VMM must know what it is doing, and only
> > provide the memslot flag when appropriate. Doing otherwise may eat
> > your data and/or take the machine down (cacheable mapping on a device
> > can be great fun).
> 
> Again, this is why we followed the VMA flags. The thing creating the
> VMA already made this safety determination when it set pgprot
> cachable. We should not allow KVM to randomly make any PGPROT
> cachable!

That doesn't seem to be the suggestion.

Userspace should be stating intentions on the memslot with the sort of
mapping that it wants to create, and a memslot flag to say "I allow
cacheable mappings" seems to fit the bill.

Then we have:

 - Memslot creation fails for any PFNMAP slot with the flag set &&
   !FEAT_FWB

 - Stage-2 faults fail (exit to userspace) if the above conditions are
   not met

 - Stage-2 faults serviced w/ a cacheable mapping if the precondition is
   satisfied and pgprot on the VMA is cacheable

 - Stage-2 faults serviced w/ a non-cacheable mapping if flag is not
   set

Seems workable + would prevent KVM from being excessively permissive?

Thanks,
Oliver

