Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D7DC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 15:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LYuz+zY+9MTDf5KTG6gl5ifz+I238+i6zAPOdCI3LyY=; b=dEa/HTm4MiZnfq9/QRKyLdaY7E
	yiZGKywf72pyBvPFsRTouxQrGq0bMCy6gGmvbNQkYkSujFPtvN9WIc6DSMUmHW9Duwqm6ZqXFhr9W
	BwB0vdapuRpxWBjjXDRX25ylHeN5+/ohghoWlKHNrTSF/go2ofe1f41hDErF4+RZDdNydRuNfo1OW
	+6PJT0KaNJx53Cb3uFfOX0C1FYdferZz8cJAdZgVAVMThK3c2b+/4h6EzFuns7LyK9OxMZgjq99XY
	Qva5GD3b+GGW67aQ27pR2jhAVhMtIOgWNrsTLylafpYvCyBRfw3QNGUFf2TdUQ3Q86ypeZMxkQXTe
	PtQ0/qxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txSVA-00000008pKo-22UD;
	Wed, 26 Mar 2025 15:17:08 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txS8O-00000008lA5-3qKH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 14:53:38 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2ff8119b436so10914712a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 07:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743000815; x=1743605615; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LYuz+zY+9MTDf5KTG6gl5ifz+I238+i6zAPOdCI3LyY=;
        b=Ifpgb110IV+2WqAeSuAG+ajdZTYwX1nvbLlNzczEwbyjv2JyiVULsyfzYJq/HojFNi
         i8xMo9frobcwKst0ldEM8tRJObrJZ4jA/9DUZuJrUE9i/LOmi8LKPhhWm9z702lDesiL
         px2+XYgHL/M8BPZaOQWUN69m5nFy80QZl59s5X1JqzLSlvYkNW3gDajnA9VWzAZAZDKp
         ERxrFLfmUUfJRyYBgZLntkBkvKzKMEaUqjMUKVlbewVr2L5CgR1Q8cYfF029F3ley6xa
         NQYxnYymm6fvtiTiz7zA2WJTzaqW1SntxMJ02yoOXoVWIY/y7iPD+UAbqwOoo+sA2o88
         x19A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743000815; x=1743605615;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LYuz+zY+9MTDf5KTG6gl5ifz+I238+i6zAPOdCI3LyY=;
        b=Lg0UawlyQAq+CJNrSVQH72/qVY6rmEpIK9w11j2ZcZzB6C4OyjM7lvzCPP+/umfYOn
         GR7kEaRvIWia7woHzVyfLvTK73ntxFcKQzpBAbwzGr0wJ+Fylw+idI9Qr32CGFm9YQ4h
         PwymxK2cKuobTMmbWGlpvArYCoUVs3XzNRBTLeyEbLKjHP0fUmKWQPCAae2G4kmeQgXy
         rU/gMVB3ADbGEgvvgTE7vNSV8r8sZB1MEciFT+RV8D+5N5lLmCj83SEvJ1Ndco35s6gR
         GimlSt6cASe/Mlaw3tTszARo5WdHChuPcgqCMjBmlWB8Ar1Dq/olSjGf/lq5GW7DmEfI
         hAHg==
X-Forwarded-Encrypted: i=1; AJvYcCXWQetnS83COlLpwzo0uQWoZAOAVDohY41FlFx6qUQ5xCo2PE2J6mJC5JS7+gcYQVOsPUzJoxOllUCrcd3Gfl8V@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+X5C7G8WXzKnBBDjgBWiiGAvH6xFr+WP4fSfhRoW0T4puZoUo
	nLbPfEdLzyKc8gWFWORs+5sTlzIpONKrusSoh9ELqC+6Z3QXm2+ERUC/PXHqWxlexQXDnBptcpZ
	J2w==
X-Google-Smtp-Source: AGHT+IHVU+TN9kjlCemo9tNjMiVG/tGpBwU7pEuQb4ZMMbfYRfUmUXxSOBuTHhWOXzajakxNTBbnItO9Nyg=
X-Received: from pfblk16.prod.google.com ([2002:a05:6a00:7210:b0:736:47b8:9b88])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1885:b0:736:362a:6fc8
 with SMTP id d2e1a72fcca58-73905a3b306mr29041774b3a.15.1743000815485; Wed, 26
 Mar 2025 07:53:35 -0700 (PDT)
Date: Wed, 26 Mar 2025 07:53:34 -0700
In-Reply-To: <SA1PR12MB7199C7BD48EB39F536DD34DBB0A62@SA1PR12MB7199.namprd12.prod.outlook.com>
Mime-Version: 1.0
References: <86wmcmn0dp.wl-maz@kernel.org> <20250318125527.GP9311@nvidia.com>
 <Z9nJ42PllG8a7AY7@linux.dev> <20250318230909.GD9311@nvidia.com>
 <Z9pryQwy2iwa2bpJ@linux.dev> <20250319170429.GK9311@nvidia.com>
 <Z9sItt8BIgvbBY8M@arm.com> <20250319192246.GQ9311@nvidia.com>
 <Z9s7r2JocpoM_t-m@arm.com> <SA1PR12MB7199C7BD48EB39F536DD34DBB0A62@SA1PR12MB7199.namprd12.prod.outlook.com>
Message-ID: <Z-QU7qJOf8sEA5R8@google.com>
Subject: Re: [PATCH v3 1/1] KVM: arm64: Allow cacheable stage 2 mapping using
 VMA flags
From: Sean Christopherson <seanjc@google.com>
To: Ankit Agrawal <ankita@nvidia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	"joey.gouly@arm.com" <joey.gouly@arm.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, 
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>, "will@kernel.org" <will@kernel.org>, 
	"ryan.roberts@arm.com" <ryan.roberts@arm.com>, "shahuang@redhat.com" <shahuang@redhat.com>, 
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "david@redhat.com" <david@redhat.com>, 
	Aniket Agashe <aniketa@nvidia.com>, Neo Jia <cjia@nvidia.com>, 
	Kirti Wankhede <kwankhede@nvidia.com>, "Tarun Gupta (SW-GPU)" <targupta@nvidia.com>, 
	Vikram Sethi <vsethi@nvidia.com>, Andy Currid <acurrid@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Dan Williams <danw@nvidia.com>, 
	Zhi Wang <zhiw@nvidia.com>, Matt Ochs <mochs@nvidia.com>, Uday Dhoke <udhoke@nvidia.com>, 
	Dheeraj Nigam <dnigam@nvidia.com>, Krishnakant Jaju <kjaju@nvidia.com>, 
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>, 
	"sebastianene@google.com" <sebastianene@google.com>, "coltonlewis@google.com" <coltonlewis@google.com>, 
	"kevin.tian@intel.com" <kevin.tian@intel.com>, "yi.l.liu@intel.com" <yi.l.liu@intel.com>, 
	"ardb@kernel.org" <ardb@kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, 
	"gshan@redhat.com" <gshan@redhat.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"ddutile@redhat.com" <ddutile@redhat.com>, "tabba@google.com" <tabba@google.com>, 
	"qperret@google.com" <qperret@google.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_075336_954831_47B1693C 
X-CRM114-Status: GOOD (  21.58  )
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

On Wed, Mar 26, 2025, Ankit Agrawal wrote:
> > On Wed, Mar 19, 2025 at 04:22:46PM -0300, Jason Gunthorpe wrote:
> > > On Wed, Mar 19, 2025 at 06:11:02PM +0000, Catalin Marinas wrote:
> > > > On Wed, Mar 19, 2025 at 02:04:29PM -0300, Jason Gunthorpe wrote:
> > > > > On Wed, Mar 19, 2025 at 12:01:29AM -0700, Oliver Upton wrote:
> > > > > > You have a very good point that KVM is broken for cacheable PFNMAP'd
> > > > > > crap since we demote to something non-cacheable, and maybe that
> > > > > > deserves fixing first. Hopefully nobody notices that we've taken away
> > > > > > the toys...
> > > > >
> > > > > Fixing it is either faulting all access attempts or mapping it
> > > > > cachable to the S2 (as this series is trying to do)..
> > > >
> > > > As I replied earlier, it might be worth doing both - fault on !FWB
> > > > hardware (or rather reject the memslot creation), cacheable S2
> > > > otherwise.
> > >
> > > I have no objection, Ankit are you able to make a failure patch?
> >
> > I'd wait until the KVM maintainers have their say.
> > 
> 
> Maz, Oliver any thoughts on this? Can we conclude to create this failure
> patch in memslot creation?

That's not sufficient.  As pointed out multiple times in this thread, any checks
done at memslot creation are best effort "courtesies" provided to userspace to
avoid terminating running VMs when the memory is faulted in.

I.e. checking at memslot creation is optional, checking at fault-in/mapping is
not.

With that in place, I don't see any need for a memslot flag.  IIUC, without FWB,
cacheable pfn-mapped memory is broken and needs to be disallowed.  But with FWB,
KVM can simply honor the cacheability based on the VMA.  Neither of those requires
a memslot flag.  A KVM capability to enumerate FWB support would be nice though,
e.g. so userspace can assert and bail early without ever hitting an ioctl error.

If we want to support existing setups that happen to work by dumb luck or careful
configuration, then that should probably be an admin decision to support the
"unsafe" behavior, i.e. an off-by-default KVM module param, not a memslot flag.

