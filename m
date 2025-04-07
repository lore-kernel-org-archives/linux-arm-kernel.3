Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5786C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 16:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JTNpEax445O2ynSr3XUTtKC9NAWm3dqDTuE2ry3Vens=; b=LAf1kUuNEfwQDCbyoI7mYUZIHZ
	f5oV+/z+ceZbxt0dG2uuWN72sTKoj74sGZiMWnz1YL1aRfo7A/UyKRsgxDS/PykJwG8NsvuSin/Db
	xquxAWTGm5OOLaBTLJFkgL/L6/uMwmaJKoDgDHn7SO3l7KpeJoy0GfrB6h62ZJHvIBP6SBXiuQnM9
	gwxwvTTOgZOaG/1iiHzR38PMy1HzM4UgPVOUOwtiL2vHfj73ESalBRFI1oI6/xERaR1KoJ3htGkWc
	EGr2Z4giImBp46h3I7n/DDEULD3VFqCm4sNe3kTM4q3nQvA5wa9oE8w4gzBedl7I6/cuKkih7kmbp
	swQE9/sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1p8V-000000017p2-3pu1;
	Mon, 07 Apr 2025 16:15:47 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1oGi-00000000vzE-3Ij8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 15:20:14 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-af423fb4f0eso2990106a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Apr 2025 08:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744039211; x=1744644011; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JTNpEax445O2ynSr3XUTtKC9NAWm3dqDTuE2ry3Vens=;
        b=4KEaoH5XvusEfhOzcVeqOJnKrRzmn84HvP4cSazIwLoFY+e86+q763cM5ER5JimYF2
         oMLyTdLwhRocAasPijnG1zV6aytMBhdaf1DXpysGhiWdyU1O7r1LEfeOAXlrhwXcMlYM
         +uIp1ILGN5JZRw8HOpNQdKfC9cHMWrb1ArFTFxBg0jO4zFPc25QP7tFccub+nGtTdSXG
         qTudJx0G2n/Kgxh7yP9ePUwVcN6aYcCNBU5EqjCYEJKWhXx8RoBHYIv3ANK3WZu52yuZ
         jmP+eJi5tzzjhPMG6AxO4slQ9ss+niFdUcYtPFKdJMK2fIDwdw35yMZgAZyDQnaon7JL
         QzsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744039211; x=1744644011;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JTNpEax445O2ynSr3XUTtKC9NAWm3dqDTuE2ry3Vens=;
        b=dAirr8WvtBEQgubLD6YZjNsduRqWsvX9Wi+MRWuxQmWqdN7aNgFKOiL+b5MJqmlRCL
         1+AGGdsIAcAKZzuyBY9qKJbsq/21hJFTwlKrgShYGLTSEX8dwLpRaedAVGiL2GBSnALz
         +fvasJVPTczkmf4LDdvlmLrN604jjIiwC6TFCbEUr/N/RavlPhC3X4lQ+rfAr11HTvUN
         PCwru3E1GCE4dSBfhGS8p/mVpPWnCEdicFly4rRTFgMIZh1KBpD/xvZ273RKlHY8XStM
         1oR1AZtg2YbmIURdsUJpKXN5n93yveXlkYsKnIHBs+DhU0JstYlRmn2uRHdIPC8Su5s4
         1lLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXN/5v6wfA4JaVdgJdUukDW3KSkMav+osNc5hSY98RifZxFW+c46W6jExpRKEp9rsQNqxeXUdfSXXISWi0okjlc@lists.infradead.org
X-Gm-Message-State: AOJu0YzTad+g4s7jfqJLbJ/FDkIpbsju0MrkJmXhMUiRUqwbibUH0T2h
	8boDgk7W69EVVXRD1SyUYgteqNTA3U0JqG5lQThsQmBW98vy7v2O+qMdC9XvfwEFx8gQmkQICXo
	o7w==
X-Google-Smtp-Source: AGHT+IHFT5IWpb0wEWYBsgf38l3iAGlVDr2qHVuyYE70TQA84d8Gl7Htq0vtNTpBGTTuOvXXCqA42VAV2Ds=
X-Received: from pfbhg1.prod.google.com ([2002:a05:6a00:8601:b0:736:3d80:706e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3bc8:b0:223:5124:a16e
 with SMTP id d9443c01a7336-22a8a048ffamr208407455ad.5.1744039210859; Mon, 07
 Apr 2025 08:20:10 -0700 (PDT)
Date: Mon, 7 Apr 2025 08:20:09 -0700
In-Reply-To: <20250331145643.GF10839@nvidia.com>
Mime-Version: 1.0
References: <Z9sItt8BIgvbBY8M@arm.com> <20250319192246.GQ9311@nvidia.com>
 <Z9s7r2JocpoM_t-m@arm.com> <SA1PR12MB7199C7BD48EB39F536DD34DBB0A62@SA1PR12MB7199.namprd12.prod.outlook.com>
 <Z-QU7qJOf8sEA5R8@google.com> <86y0wrlrxt.wl-maz@kernel.org>
 <Z-QnBcE1TKPChQay@google.com> <86wmcbllg2.wl-maz@kernel.org>
 <Z-RGYO3QVj5JNjRB@google.com> <20250331145643.GF10839@nvidia.com>
Message-ID: <Z_PtKWnMPzwPb4sp@google.com>
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
X-CRM114-CacheID: sfid-20250407_082012_841776_913CCD6F 
X-CRM114-Status: GOOD (  14.72  )
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

On Mon, Mar 31, 2025, Jason Gunthorpe wrote:
> On Wed, Mar 26, 2025 at 11:24:32AM -0700, Sean Christopherson wrote:
> > > I don't know how you reconcile the lack of host mapping and cache
> > > maintenance. The latter cannot take place without the former.
> > 
> > I assume cache maintenance only requires _a_ mapping to the physical memory.
> > With guest_memfd, KVM has the pfn (which happens to always be struct page memory
> > today), and so can establish a VA=>PA mapping as needed.
> 
> This is why we are forcing FWB in this work, because we don't have a
> VA mapping and KVM doesn't have the code to create one on demand.

I don't follow.  As it exists today, guest_memfd doesn't touch the direct map,
i.e. there's already a kernel mapping, KVM doesn't need to create one.

