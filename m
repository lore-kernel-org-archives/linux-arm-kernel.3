Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA9DC35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 21:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n8xNWERaIEY3t44CdV5gdS76hxjc40sM+pkTx8sfr/Y=; b=NoFbabHQOFmkkuV6zShrI+chmG
	XCXQDU6DubM1+mPD+7/bze7uzpNIIETuRB7ayyxECYiVUe5QW42/7S8IXlUwTuamdQSoosXAEWhus
	QlgXQYRsY70yDZxkJZtH6O8S1hPtfhzfwcFnGD2gndJosTPjzfvxvmhLV65EqnKgXfc7WF1x0F5VV
	EfLGsz6Q/dhYxApKWo17jKmB3t36x9UAASIlyEnmKzXCUDoKPJcMalVC6i/JUFFXlRox8y9uQEPLg
	qjlEo27rUu1x0P2Mu/TMszdbdyBWEm1MDXcZa5A7vBQ5LzfgjE1zKVPBQfYvP9nIw0eOSgHJMj6Zl
	GLqHXDGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv1Qc-0000000ADse-18eN;
	Wed, 19 Mar 2025 21:58:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv1HF-0000000ABy6-1oOv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 21:48:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 53D6361158;
	Wed, 19 Mar 2025 21:48:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C465EC4CEE4;
	Wed, 19 Mar 2025 21:48:33 +0000 (UTC)
Date: Wed, 19 Mar 2025 21:48:31 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>,
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
Message-ID: <Z9s7r2JocpoM_t-m@arm.com>
References: <8634fcnh0n.wl-maz@kernel.org>
 <Z9h98RhunemcFhhz@arm.com>
 <86wmcmn0dp.wl-maz@kernel.org>
 <20250318125527.GP9311@nvidia.com>
 <Z9nJ42PllG8a7AY7@linux.dev>
 <20250318230909.GD9311@nvidia.com>
 <Z9pryQwy2iwa2bpJ@linux.dev>
 <20250319170429.GK9311@nvidia.com>
 <Z9sItt8BIgvbBY8M@arm.com>
 <20250319192246.GQ9311@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319192246.GQ9311@nvidia.com>
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

On Wed, Mar 19, 2025 at 04:22:46PM -0300, Jason Gunthorpe wrote:
> On Wed, Mar 19, 2025 at 06:11:02PM +0000, Catalin Marinas wrote:
> > On Wed, Mar 19, 2025 at 02:04:29PM -0300, Jason Gunthorpe wrote:
> > > On Wed, Mar 19, 2025 at 12:01:29AM -0700, Oliver Upton wrote:
> > > > You have a very good point that KVM is broken for cacheable PFNMAP'd
> > > > crap since we demote to something non-cacheable, and maybe that
> > > > deserves fixing first. Hopefully nobody notices that we've taken away
> > > > the toys...
> > > 
> > > Fixing it is either faulting all access attempts or mapping it
> > > cachable to the S2 (as this series is trying to do)..
> > 
> > As I replied earlier, it might be worth doing both - fault on !FWB
> > hardware (or rather reject the memslot creation), cacheable S2
> > otherwise.
> 
> I have no objection, Ankit are you able to make a failure patch?

I'd wait until the KVM maintainers have their say.

-- 
Catalin

