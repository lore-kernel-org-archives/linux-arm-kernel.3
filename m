Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B35DE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 21:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TkNQtWhZUGtyJ2fxKJJU0zr4TXNwZCZlRe3ObHUcd9Y=; b=xzZUjKQuUMIt2mKzrsjl380wJi
	VEi1rYfcDurd1QPuGjG0KkxjhDqcV5x+/KlZrThNjfFrjf8+b5JD5CoPgiouWPU5MQHI6wajyehDi
	3RPPV7xkxHbVPUZl0jHW7W869t3ZbrrmZEbBkGvocqdKvxwjxneSe2B0O+tAtGxx52vLEfaXlf+Hi
	E9gWLpRJ6WUa37hvMVNuO2oLV1utUIGILTHxjcuh7bhiZiKOzpTFKMsOdEFI9evXn+wH8weRN+qQg
	8BtKXr8Y0WdqFyi9BP2a8iD6SLkUZ38onVBiyD4REz2EX2tPuk3jelkN+Y58zmHrrx9Qu1YlQ0KKM
	tlc4QsAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLUbg-0000000GEQQ-1mCq;
	Wed, 11 Dec 2024 21:51:00 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLUac-0000000GEGg-2VzE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 21:49:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 84FFAA41C12;
	Wed, 11 Dec 2024 21:47:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35920C4CED2;
	Wed, 11 Dec 2024 21:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733953789;
	bh=9dEs7Uv/W3GFIdvWXNgPv9/RG/WPitz2vsK5/eV8epM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MFaITdJIkZ1IZ7UigB5f9EhJDAqOApX0es7WvCaYIyDxpBqxTVztnpMhTSDhYdiPb
	 257hY2WpAkUzycQO10r8/Juah4PjhQt6ojA1tYClva3aSLV1cs3T9c33RHHemnCeLG
	 4nCMZiKzpKXK9A/lDjeS1hNe3FMwIvwkeLblSVCM0LBMFZ5Na32iXF4BXNO6e0sSrP
	 gqwHbYpID10NcowjpWJQQtu9fsCV+/MbUb/pWJ75dwC+UsqPiCuGljkzXcJK7QuY+P
	 nA1ASb4a6HJcJxjUGb6tz3ue79ctd/UDZJ0VkUZknepBmN5hjzG7ppeQ8vOnHJlsHq
	 dsot4KoUZvQCA==
Date: Wed, 11 Dec 2024 21:49:40 +0000
From: Will Deacon <will@kernel.org>
To: Ankit Agrawal <ankita@nvidia.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, "maz@kernel.org" <maz@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"joey.gouly@arm.com" <joey.gouly@arm.com>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
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
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"sebastianene@google.com" <sebastianene@google.com>,
	"coltonlewis@google.com" <coltonlewis@google.com>,
	"kevin.tian@intel.com" <kevin.tian@intel.com>,
	"yi.l.liu@intel.com" <yi.l.liu@intel.com>,
	"ardb@kernel.org" <ardb@kernel.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"gshan@redhat.com" <gshan@redhat.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 1/1] KVM: arm64: Allow cacheable stage 2 mapping using
 VMA flags
Message-ID: <20241211214939.GD17486@willie-the-truck>
References: <20241118131958.4609-1-ankita@nvidia.com>
 <20241118131958.4609-2-ankita@nvidia.com>
 <20241210141334.GD15607@willie-the-truck>
 <SA1PR12MB71991EC85E8EEDD1C5115886B03E2@SA1PR12MB7199.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SA1PR12MB71991EC85E8EEDD1C5115886B03E2@SA1PR12MB7199.namprd12.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_134950_698868_8C0B95DF 
X-CRM114-Status: GOOD (  13.80  )
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

On Wed, Dec 11, 2024 at 02:58:38AM +0000, Ankit Agrawal wrote:
> Thanks Will for taking a look.
> 
> >> The device memory such as on the Grace Hopper systems is interchangeable
> >> with DDR memory and retains its properties. Allow executable faults
> >> on the memory determined as Normal cacheable.
> >
> > Sorry, but a change this subtle to the arch code is going to need a _much_
> > better explanation than the rambling text above.
> 
> Understood, I'll work on the text and try to make it coherent.

Heh, I thought it was the patch trying to make things coherent :p

Will

