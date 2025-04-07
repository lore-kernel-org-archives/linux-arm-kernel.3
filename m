Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98305C36018
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 18:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yZnT3kn0lZwBedm0uGPv3h/z1Jk4dbKRxwN+6F5eRc0=; b=RxmPaCkmMpv0C9/SbDzjD07inV
	Lz6VCS0So02pIga8TlvqQN3pINmM54AbZhH+ZkHtrPebMn90BoK1YIBHUoYVxssdIUzc8rqvQCFm/
	6JF84ZNW1G+VRtujzuo76uUlNI5/RRZHhBEHAYsP7SFeSoKg1kY+Mld2IVOkx58+oyJ/TjIDtsmv4
	FdOQKGK7nV7hhlK/r987jpeXNEk0mCE/iQk8yox+rCegYIHUeO7/t5fezf1+UjnXeLihC0zLIAdsV
	kEiEXoOI97P2ivKHBHtOe+KArbPFssKnwIwnq6PHsF42ACkaj5qR5xWvvAxgxjUM9GFikWCo/rtUI
	bbOP9qmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rYM-00000001cpI-1mxm;
	Mon, 07 Apr 2025 18:50:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1pZl-00000001G5F-2VNx
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 07 Apr 2025 16:43:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=yZnT3kn0lZwBedm0uGPv3h/z1Jk4dbKRxwN+6F5eRc0=; b=PBOge62Q8581aqcB9yCP4C4yOI
	dJ8rgsB8Rj6j5vQaBB3sWS50dilu5abQRw140+zSfy7ktzsIFBmdQpVmQgHI8S2U8S9jhG0G0PBfS
	XcrZVt14+xnEf1jApP83Ta3MEwSwvV63BxC4kcygGYEtg3G57AriNJSPUy/U5rfj/IDAER4ShRCjB
	2TgOWVXRIIvlb/gMHd8PLXXxipMWUiBfJbAsfMtVKC1YiIDCBURf1cPBdEUT7fswB4l4Nic6hKVYg
	qZAmjOBX2zCCXuoOzh+T5xmBDIL2oVLp00Pbl+cjbbHzylwKPp2ebtatrSYV4Gb/dn6yTTNv02P6Z
	nQFYA/mw==;
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1pZi-000000084IU-2xer
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 16:43:56 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-736d30d2570so3932765b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Apr 2025 09:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744044231; x=1744649031; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yZnT3kn0lZwBedm0uGPv3h/z1Jk4dbKRxwN+6F5eRc0=;
        b=Y2nOZy57c24JO55CcEzrA0+FYFaCy3/cyMW7azQUoxDjP/FVoexmRZxyw4SYP8Q6YV
         eZMIDsAgf/EBA9ArB1ha81ExgyAiqLQSytVALuEnmfSj+QqAaL4LMmgAJlJIE3sSZF9G
         J9pzfifiIwZGjCJ7EvV5fU5O1wSvazb6omXZRFLIdU4txaaLAuDgvBJbUUUbnYoH57hx
         2D+3+CVmWTUPpymYrsLOmdTBo+pm84ZVBHgmbmUOhCf+G6kUez7Ti+/WVP4HSHqyQoBi
         4VMz8Maw1kmxDXKg5YJzt7uzTiyc81VHsq4NAY9jzUDn3UNi1yr6ByEDZi1x/jREQ4MM
         xh9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744044231; x=1744649031;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yZnT3kn0lZwBedm0uGPv3h/z1Jk4dbKRxwN+6F5eRc0=;
        b=j32pjchwGrB7Ep+VF/E1o50RWaemw2swZDgiqExQwJPWSqHIHug+9UPDpPT6QuMinM
         P6ae6cURBXbWrCQUZjympYQaEx+nTPgzgCm9YEIKTgRrhlP5lhwGgsd0Oe5wIOgi5Ye9
         LLaN65f0xZ0Ld7tOE+ulWe9X9YXZYb5Pwu6XDSNSh3uGO6KgaXzNp+vKrz22K9DFTY8w
         rcwX3gbAq4AkBHvZ1NtGdELjhws8qcxK8f1ExRk7ywiFojDnN1DeI503HsTM7sbqwNnV
         kFBI6KjjFsaj4aAI/rmzLinsMUVEuXvz7H8e0c0vukwmW5NxsH4oXj2UNZVmbXeGJ56t
         NNIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRnYmOaMkYiiIwvNyiV6isJV+Lz8JkhKZ/aX8UwRmol+x++GIBTRRR/rTWrMFGESkL2ZDp+4FdLhcTTV8T4gSa@lists.infradead.org
X-Gm-Message-State: AOJu0YyA1Ytey9BLdsy5A+ekelJn1UYOd8V46QU9W/aMKmdoh0m1/Ywo
	CzFCGOK2VR139+khf/g5xZnG7nJASUiDOMLRqyHdB0YXABttWNlYaoehBG5jo5VnCCjODyH4YNw
	QJQ==
X-Google-Smtp-Source: AGHT+IGF8eBnjAYFXIPI8U2dRPCijHocf42fEz6xwJrtVSsRVB6bz3zjqLRx5gwWh1OyqfcDjPG12qk0yPY=
X-Received: from pfbhu13.prod.google.com ([2002:a05:6a00:698d:b0:732:51fc:618f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:2d04:b0:1f5:7b6f:f8e8
 with SMTP id adf61e73a8af0-20113c095fdmr14665309637.6.1744044231220; Mon, 07
 Apr 2025 09:43:51 -0700 (PDT)
Date: Mon, 7 Apr 2025 09:43:50 -0700
In-Reply-To: <20250407161540.GG1557073@nvidia.com>
Mime-Version: 1.0
References: <Z9s7r2JocpoM_t-m@arm.com> <SA1PR12MB7199C7BD48EB39F536DD34DBB0A62@SA1PR12MB7199.namprd12.prod.outlook.com>
 <Z-QU7qJOf8sEA5R8@google.com> <86y0wrlrxt.wl-maz@kernel.org>
 <Z-QnBcE1TKPChQay@google.com> <86wmcbllg2.wl-maz@kernel.org>
 <Z-RGYO3QVj5JNjRB@google.com> <20250331145643.GF10839@nvidia.com>
 <Z_PtKWnMPzwPb4sp@google.com> <20250407161540.GG1557073@nvidia.com>
Message-ID: <Z_QAxiEWEyMpfLgL@google.com>
Subject: Re: [PATCH v3 1/1] KVM: arm64: Allow cacheable stage 2 mapping using
 VMA flags
From: Sean Christopherson <seanjc@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Marc Zyngier <maz@kernel.org>, Ankit Agrawal <ankita@nvidia.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
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
X-CRM114-CacheID: sfid-20250407_174354_837092_146F2838 
X-CRM114-Status: GOOD (  18.23  )
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

On Mon, Apr 07, 2025, Jason Gunthorpe wrote:
> On Mon, Apr 07, 2025 at 08:20:09AM -0700, Sean Christopherson wrote:
> > On Mon, Mar 31, 2025, Jason Gunthorpe wrote:
> > > On Wed, Mar 26, 2025 at 11:24:32AM -0700, Sean Christopherson wrote:
> > > > > I don't know how you reconcile the lack of host mapping and cache
> > > > > maintenance. The latter cannot take place without the former.
> > > > 
> > > > I assume cache maintenance only requires _a_ mapping to the physical memory.
> > > > With guest_memfd, KVM has the pfn (which happens to always be struct page memory
> > > > today), and so can establish a VA=>PA mapping as needed.
> > > 
> > > This is why we are forcing FWB in this work, because we don't have a
> > > VA mapping and KVM doesn't have the code to create one on demand.
> > 
> > I don't follow.  As it exists today, guest_memfd doesn't touch the direct map,
> > i.e. there's already a kernel mapping, KVM doesn't need to create one.
> 
> This is not about guest_memfd..

Heh, my part of the thread was.  I was responding to Marc's comment:

 : Remind me how this work with stuff such as guestmemfd, which, by
 : definition, doesn't have a userspace mapping?

I'm pretty sure we're on the same page.

