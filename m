Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 297EFC36000
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 22:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Axll5Mi+5wEaWyklP7NmIivlU8IChwyIqobsotZaqY=; b=H40ClUFtKmYWPNqxS5yhkIu7YF
	CyqG9EGqLhxt4kTbBst4LwEAvcgYBhsTnLRdgrxxmX8pb+g8b+IlsmawKkdtRm4wRO5Y9ob8TpicA
	PSf66yzpPr8GGiFoWyE0eAKuS0RCsVI8ET8BON3rK/MMtP9zL912nKKAWqYgUS7VWjnu4ps6f8Rwc
	d4NGKkhRXoX294eJ4cj4827eWGybTniuhxFGl5fVSF6jjW2NjAFAitQQ5srIJrtgh19In/NryVA1n
	SnRuH/mMQtu2euN0rgOUTpkM/p997IRaQuJU8QbtgKpwyYir2US/+P7/WUgrXJCdZVyAWQDbEkOtO
	mak9/LIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv2ES-0000000AKFg-0D6x;
	Wed, 19 Mar 2025 22:49:52 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv2BR-0000000AJsK-2sDk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 22:46:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742424403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3Axll5Mi+5wEaWyklP7NmIivlU8IChwyIqobsotZaqY=;
	b=avAWbQFOBegdFdoAKizbvdxsbAqBXZVf/35DVWNuWKTnd6Y/Mc7jQhBMdhkfNZ6bz9sTMg
	unMOXkqlhkw2HZwJiSJsOzCdDFVwdhKe48cAtRKUKGkAa9k4lxbTGNmBT++MSjhzgf4+jL
	xx/JVHienhUTbpWBFr2moSuxHpDZ56Q=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-xZ2nccJRMMmrhDCCwBAxqA-1; Wed, 19 Mar 2025 18:46:42 -0400
X-MC-Unique: xZ2nccJRMMmrhDCCwBAxqA-1
X-Mimecast-MFC-AGG-ID: xZ2nccJRMMmrhDCCwBAxqA_1742424402
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c572339444so33804885a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 15:46:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742424401; x=1743029201;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Axll5Mi+5wEaWyklP7NmIivlU8IChwyIqobsotZaqY=;
        b=siiwR4Q6y95Uco/VFxiKOLam/oGLIaFMhPtnJKWhJY4ZqpasNptk4QsZ31swCWVpA2
         7BIGneJTGsxqit4d/Vrd89ZYCHQfmJiAEKLnbb9PNYffO2xmI0btM6WxqQtle5D6DWpP
         VAsbWKfwnKsFw1Ok/BaIU4Xy8Qq0nOADH5GoFlt+2XhkJUJW6ngX0xC9q513XJ2iDL2r
         naEIz33Dw5bWwNOq1614cJe/TPZFUd1G4NKkxsy09Q5ZVqUp9NDoryRpge4g3F0/BxWl
         qYz7Lbv4AfoNJwdNKTA/DD5lUqoM7bfJ16uR6/USLV2/jrTLZY0wiKQ902vi77yXQejY
         OoqA==
X-Forwarded-Encrypted: i=1; AJvYcCXUxYPQ8pXNiJK/1zXy/01YhRKnY5HqmgLxcjNPFJ2C1gwiJTrVU9paCJffh1+x6Ulhs5YKZYNJm2GYyw/ZV3qP@lists.infradead.org
X-Gm-Message-State: AOJu0Yya+As/FQabrHWrNJiyV0UmXoiyCSPqJEZUwM8dxP1i8erl/Xct
	caAM915HHRnYl5JSQeRponTFpc3KcrW+55+NGUCNQHpSy7z1Pqxpoisp9eR00cVy9jknuvls8Qu
	l7ZDcSYuTHZBzKuTSbvdT06fHzZX63PFzwkINU7nYPH2twF10N/96RHxhRVgsRdPiijpFPsvY
X-Gm-Gg: ASbGnctjJsY9ioYI3GAuK6b96k4Ja+2STtn6wnQWZl/BonVrFJGGFdQjAozlEL/ouRj
	SCJQgFWU2JyUZyG4BW/u+fRKbuTpaDm21708Lka5UQKB2iWc2gzjXhNJJHimRhFUBbDrsxp6b0x
	ZvwakI1sSJh76lU/c5ZMj2d/X4A5ZYSdU80U75I3JXcH8ctmHCjEj7TNJKCpm8w/SkaOu2LryIW
	CC3quUg0J1AT2KYpyWAN0f/SQK2kI4a8cMLIS63oYoAMYfMSM9u8ck4kZRJdj4GyNCEEQUjMJxn
	YT1BmOA=
X-Received: by 2002:a05:620a:46a3:b0:7c5:3b52:517d with SMTP id af79cd13be357-7c5a84d9048mr821839185a.54.1742424401728;
        Wed, 19 Mar 2025 15:46:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHVqyT+WlTFMbuzlij17W/8zZbsASQKuVXERgdl8uzrUKPSgGPykK/7AJobATtMc4xtw1MMQ==
X-Received: by 2002:a05:620a:46a3:b0:7c5:3b52:517d with SMTP id af79cd13be357-7c5a84d9048mr821825685a.54.1742424400401;
        Wed, 19 Mar 2025 15:46:40 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c573d6fbbasm920353785a.78.2025.03.19.15.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 15:46:39 -0700 (PDT)
Date: Wed, 19 Mar 2025 18:46:35 -0400
From: Peter Xu <peterx@redhat.com>
To: Keith Busch <kbusch@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Gavin Shan <gshan@redhat.com>,
	Catalin Marinas <catalin.marinas@arm.com>, x86@kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alistair Popple <apopple@nvidia.com>, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sean Christopherson <seanjc@google.com>,
	Oscar Salvador <osalvador@suse.de>,
	Jason Gunthorpe <jgg@nvidia.com>, Borislav Petkov <bp@alien8.de>,
	Zi Yan <ziy@nvidia.com>, Axel Rasmussen <axelrasmussen@google.com>,
	David Hildenbrand <david@redhat.com>,
	Yan Zhao <yan.y.zhao@intel.com>, Will Deacon <will@kernel.org>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH v2 18/19] mm/arm64: Support large pfn mappings
Message-ID: <Z9tJMsJ4PzZk2ZQS@x1.local>
References: <20240826204353.2228736-1-peterx@redhat.com>
 <20240826204353.2228736-19-peterx@redhat.com>
 <Z9tDjOk-JdV_fCY4@kbusch-mbp.dhcp.thefacebook.com>
MIME-Version: 1.0
In-Reply-To: <Z9tDjOk-JdV_fCY4@kbusch-mbp.dhcp.thefacebook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VbhMk_RvXB_eL8_ipN1ZgrkW-3G8bk5_j1kDHs_Dh6Y_1742424402
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_154645_799310_EEE95EEB 
X-CRM114-Status: GOOD (  19.63  )
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

On Wed, Mar 19, 2025 at 04:22:04PM -0600, Keith Busch wrote:
> On Mon, Aug 26, 2024 at 04:43:52PM -0400, Peter Xu wrote:
> > +#ifdef CONFIG_ARCH_SUPPORTS_PUD_PFNMAP
> > +#define pud_special(pte)	pte_special(pud_pte(pud))
> > +#define pud_mkspecial(pte)	pte_pud(pte_mkspecial(pud_pte(pud)))
> > +#endif
> 
> Sorry for such a late reply, but this looked a bit weird as I'm doing
> some backporting. Not that I'm actually interested in this arch, so I
> can't readily test this, but I believe the intention was to name the
> macro argument "pud", not "pte".

Probably no way to test it from anyone yet, as I don't see aarch64 selects
HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD, which means IIUC this two lines (before
PUD being enabled on aarch64) won't be compiled.. which also matches with
the test results in the cover letter, that we only tried pmd on arm.

The patch will still be needed though for pmd to work.

I can draft a patch to change this, but considering arm's PUD support isn't
there anyway.. maybe I should instead draft a change to remove these as
they're dead code so far, and see if anyone would like to collect it.

Thanks for reporting this.  I'll prepare something soon and keep you
posted.

-- 
Peter Xu


