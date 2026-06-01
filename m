Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D104CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 15:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YjouT4r9OqoZMrQ0tTNPIpsZn3OGl8wc9VmtokceP+I=; b=IEJDwp/mCA4CQpghs+MzNuU5TW
	cNXLYWBiO6JFydmE69RBIAD8FrLIVOvbXN0bZ9w6sPMS4P4hOZpGFqyLoz4RZTdqC++dpwPU6w61A
	TW9+kgPw8g7c+RgzbFsbo6EeZHe8izs2Jfv5CUSkgj6TTNcOF6Mnq4XVojwXaDkjlC0vVrQLSIwoH
	M6DAAVjJvgRWtMdkAcVGTYsinS81gELc3XFKdX1q4JK7LXNbt+NuBHxid0wVmJu/cfa7FBniKfYRE
	rfUTkg/7xVRhQgRnmHVZmSMVSUUc6M8SPg5c0d1ooiCR4Z7hBSMw29ZWkAaJpLx6Y4D6X39Q3rTCp
	4+VWLd7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU48Y-0000000BKuy-17Mv;
	Mon, 01 Jun 2026 15:01:06 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU48V-0000000BKu5-06Jm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 15:01:04 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-7e266714bd3so16454717b3.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 08:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780326061; x=1780930861; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YjouT4r9OqoZMrQ0tTNPIpsZn3OGl8wc9VmtokceP+I=;
        b=OkK6LNhzZXGqaN+FHC6Ws0i+cw4VwBnfEjPA/SHmrmOEi466tmxe1IiElGBIkySByB
         eJ4ktph73BYw3D7E//fo5R6a3I/arb4inCbg+grmYRPb1qBXLg2UkUmamNaag7gDio28
         glCSUih22C2AXjl4aqKp4JNos6znjF8yzHWOWLvnT3I1kaIKban+BuC5EqC/vOteG8lJ
         9yzqOMYBtQg5/4Kje7PsH0ZkiuJRTuhUrp9uoTSf0aUJT9WcrE/6PDFyFfr7hMi9PALp
         FHBYIlc34v3/oxLVTIhbf02eI7NuVwyWwlD9J+KrCMZ/Z6HhLwUW9CpAJuTSXAMnh4s1
         QI+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780326061; x=1780930861;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YjouT4r9OqoZMrQ0tTNPIpsZn3OGl8wc9VmtokceP+I=;
        b=FYOo7M8AVI/39xffECBRCC8wCXwJGgda8U9AyDchpg0BJGKPFdKqFlYFquwyttLxl+
         w1XauPBTcLNWE5aIqPLpoAdGCif5OtKR+1AO07snY5qWBzG7HVyUA8Tf5pJPDDdKOxgs
         WXXtrJDlyG2cWwXcktJX+dezhZPx0sfjNza2HShC7xhCj03gIUD8U8NOPNZvtrRuxRA4
         0wX4Bbb1dbX7hDVStsqX2EXUkHzQxgUovPQ7p313LuUhpzajVSqaP/chdXp3qym/TBMI
         XYfwXaQCqc2+lcZ4PP/sdiM2N1BbAExKXt6wmmf178RvwFWpfvWRkMt7Q7ZdQMY1NHP7
         EISQ==
X-Forwarded-Encrypted: i=1; AFNElJ9hXCVrxXPaF1wAfGCDGM0j/rv5aZKpQT2E+MSAhFBO/3+JJDGVUaROBUgi58m8w59gmyJLNBJd9urperbe3weY@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/yprSbbcNr8/pL25qcP/hY6q5tTdlAx7y2huf9i2jdU5CnBg2
	Yn/3zmK8vcbNZOSemWXd/CKT3qFNxEsttp9r3WeIF4FNhD+NqEbsnBLzkHLLPfqwgUg=
X-Gm-Gg: Acq92OGNdQfTpE7SO6wXSsg9XedEc/4KBn82YpfYQ330Q8zDY686Wa+WVgqg0cUJCo+
	7NRX9GeA9/LUo0phbmEunZUsS1lfkM8p3h5CR30U3AshJlBUqzDlx9+C4ueYH/EHmj1mBnkuoGe
	W0UXzUcXbEeuZNUFnO4MuxtO6u5Ju2Df5XG0VGDZkSPkrgG1r4BwWHGvr4NLke5OnKTTezXfDwa
	iRFjXjPsO9b6MNO+j72NQ0htBpBwrVYM87KfVwBo5yiKmMuMx+gJ9hS/9lGuFyUs/IyAZj1rS5t
	ydfrKQJ//OVK9++hIfJuJGaQENTp1uxyleswq1YPsYcW1H+tc6NyVt3MUwxD1LHDZtzV2cu8eJm
	4KKh6FCcS5g6lCe6DXlEcS7Yu/g4nB3TL2tVIYdYedxmbowFfRKAJhk5xTvgFMNYiVJRfInbE/Z
	0u9GUssOAPHXOMvuTxZxtBLkdYsXAlsar2bbG4TD98GLuagoTYpqw2m4SG/ZWrjTazy6fRTiXZG
	UrjjnXeubV+Ol4ou+xHXmInj0Py/yFXKG33Bpsg28kiEjzwj6QF/A==
X-Received: by 2002:a05:690c:88b:b0:7a2:3d38:337c with SMTP id 00721157ae682-7e05d5e4ec2mr97204177b3.32.1780326061363;
        Mon, 01 Jun 2026 08:01:01 -0700 (PDT)
Received: from google.com (138.200.150.34.bc.googleusercontent.com. [34.150.200.138])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7e175de02fdsm41868227b3.7.2026.06.01.08.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 08:01:00 -0700 (PDT)
Date: Mon, 1 Jun 2026 11:00:59 -0400
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Jork Loeser <jloeser@linux.microsoft.com>, 
	linux-hyperv@vger.kernel.org, linux-mm@kvack.org, kexec@lists.infradead.org, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Alexander Graf <graf@amazon.com>, Jason Miu <jasonmiu@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, Baoquan He <bhe@redhat.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Kees Cook <kees@kernel.org>, 
	Ran Xiaokai <ran.xiaokai@zte.com.cn>, Justinien Bouron <jbouron@amazon.com>, 
	Sourabh Jain <sourabhjain@linux.ibm.com>, Pingfan Liu <piliu@redhat.com>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Mario Limonciello <mario.limonciello@amd.com>, 
	linux-arm-kernel@lists.infradead.org, x86@kernel.org, linux-kernel@vger.kernel.org, 
	Michael Kelley <mhklinux@outlook.com>
Subject: Re: [RFC PATCH 00/20] mshv: enable kexec with Hyper-V donated pages
 and partitions
Message-ID: <ah2eBxaBnVs_1j5n@google.com>
References: <20260528004204.1484584-1-jloeser@linux.microsoft.com>
 <ahxrc4pTvVU20RTX@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ahxrc4pTvVU20RTX@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_080103_081984_DA89C9AE 
X-CRM114-Status: GOOD (  33.05  )
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

On 05-31 20:10, Mike Rapoport wrote:
> Hi Jork,
> 
> Only had time to skim through the patches.
> I have a couple of high level questions for now.
> 
> On Wed, May 27, 2026 at 05:41:42PM -0700, Jork Loeser wrote:
> > When Linux runs as an L1 Virtual Host (L1VH) under Hyper-V, the MSHV
> > root partition driver deposits pages to the hypervisor and creates
> > partitions for guest VMs. Prior patches enabled kexec for L1VH, but
> > only when no partitions had been created and no memory had been donated.
> > 
> > This series lifts that limitation. It uses KHO (Kexec Handover) to:
> > 
> >  - Track all pages deposited to the hypervisor in a KHO radix tree
> >    and preserve them across kexec so the new kernel knows which pages
> >    are owned by the hypervisor.
> > 
> >  - Freeze running partitions before kexec, record their IDs in the
> >    KHO FDT, and vacuum (tear down + reclaim memory) stale partitions
> >    after kexec.
> > 
> >  - In case of a crash, exclude hypervisor-owned pages from crash
> >    dump collection by passing the radix tree root PA via Hyper-V
> >    crash MSR P2 to the crash kernel.
> > 
> > Dependency on Pratyush's KHO series
> > ===================================
> > 
> > Patches 1-12 are cherry-picked from Pratyush Yadav's v1 series
> > "kho: make boot time huge page allocation work nicely with KHO" [1],
> > which is still under discussion. This series uses functionality from
> > those patches -- specifically the meta-data page enumeration via table
> > callbacks and the restructured radix tree API. It also extends the
> > KHO radix tree with:
> > 
> >  - A freeze mechanism to lock the tree before serializing for kexec
> >    (patch 13).
> 
> There were a lot of effort to make KHO stateless and drop the requirement
> for finalization/freeze.

Yes, using KHO directly here is incorrect. The state machine is provided 
by LUO, so we should use LUO here. MSHV should provide a file that 
userspace adds to LUO, and all state machine management would be the 
same as for all other clients participating in LU.

> 
> Why is this necessary to add a freeze mechanism to kho_radix_tree?
> If it's a hard requirement of mshv maybe the freeze part should be handled
> there?
j  
> >  - A crash-kernel-safe variant that memremaps radix nodes for use
> >    outside the direct map (patch 14).
> > 
> > Patch overview
> > ==============
> > 
> > Patches 1-12:  KHO radix tree and memblock changes (from [1])
> > Patch 13:      Radix tree freeze and del_key() error reporting
> 
> del_key() error reporting sounds like something we'd want to avoid.
> del_key() is called on "freeing" path and during error handling, it would
> be hard if at all possible to deal with errors from del_key().
> 
> > Patch 14:      Crash-kernel-safe radix tree presence check
> > Patch 15:      Page tracker using KHO radix tree for deposited pages
> > Patch 16:      Debugfs interface for page tracker
> > Patches 17-18: Crash MSR reshuffling + crash dump page exclusion
> > Patch 19:      Export kexec_in_progress for modules
> 
> Isn't there another way to differentiate kexec reboot?
> 
> > Patch 20:      Freeze and vacuum partitions across kexec
> > 
> > Feedback
> > ========
> > 
> > This is an RFC. I am looking for feedback on the overall approach as
> > well as the KHO changes (patches 13-14).
> > 
> > [1] https://lore.kernel.org/linux-mm/20260429133928.850721-1-pratyush@kernel.org/
> > 
> > Based-on: linux-next/master (next-20260527)
> 
> -- 
> Sincerely yours,
> Mike.

