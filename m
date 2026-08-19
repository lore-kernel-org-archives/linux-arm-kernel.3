Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39433C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 14:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NVWozadQO7xAVs0CxEChlrBPcTWGOFFwMoQqLAdxyTc=; b=PJCyzl8qyqKEaRvxxiA8u/1hsa
	2/vspFRifTuPBh2P9CWYT/ymsGHT4nyqWx+fgtsxRmBLkgRsQdrwePb7aNwLUN+Rsuw3ifgi61q8v
	9Ma8WfrZPdzKnkxiDXuCDxeSlu73EBjVnQFm4UPSG8ayQloD9UAxM8YPHsaeJTaQ339mc6BiYFNEL
	jNea5PpUV91SwIuzhKlOEPZmOPe9L0/YIsiflk6XLbiN48P8J7HEUyKDjZAnBLWCaFh9/jEFHoNuE
	Bi4zghK518AwGOiUjjIlGsIpf4+4XHbSekkuUm1vSYi+Ejsd2WcJM3IVVGjFN4RUUqRwIJ4qD4oJ0
	RuQs+Ovg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwhGm-00000009ypc-2Lef;
	Wed, 19 Aug 2026 14:27:56 +0000
Received: from mail-pl1-x645.google.com ([2607:f8b0:4864:20::645])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwhGj-00000009yow-2AEG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 14:27:54 +0000
Received: by mail-pl1-x645.google.com with SMTP id d9443c01a7336-2cccfa32670so18747505ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 07:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787149672; x=1787754472; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NVWozadQO7xAVs0CxEChlrBPcTWGOFFwMoQqLAdxyTc=;
        b=S9MTyu1sUslOVTTPXRXg8OVReWYKZnu4ToGJ1dM2AJExJm4+ZtcKOC/ow0HF3Dh8fl
         8VwNToPO2Wi6GDGXhstuESxF3BnFuQ4+b22IctmSTcC9A0av2pFltN+pLhHLv0OmTUrR
         v1paaMmGG4ME1Fb94HudTsUO7gP9PNVztyOrf4FqAPsDt8sZPKUoc5igohcCd9iNJNIq
         7/PPmFx0af8GQQieNiRyuY8A1o2sHi85DjpIkn0R5ulmSQXLHmkdUw0eHlBROfk2OSMm
         K08YbKzLJVrlnkE3J86BcwGeACCq6kjcibo3bj4jVoxf37kut2Herkms/jwgJnE4Ok12
         uc6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787149672; x=1787754472;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NVWozadQO7xAVs0CxEChlrBPcTWGOFFwMoQqLAdxyTc=;
        b=nv1eWnUDGotOnQCKcqd2xj8SXdL3HiPe1oE9P2iNqvI8kSpjl1SLyPQvBg3EiVrl8E
         YjWuFduK4SWr+l83SJIsvjHCRy29G3L3gD8SOtyBD7rXyQiawaLJ1tJJuvnxghOiR3B5
         H+qUuJUWgJeRI6/LUhVBQF6aXzV7Vu7TppDey9xIlCB2aZeIvbqQzsMx64Xi4F+QVrJV
         r/gDF6BJM10Zjqal1vO8k0DZa8SLYWwLuIhRBSd9EzxE4fvHhl+C+teDPG2u3Z2xwWz6
         syWwF61w4/o81WLwEHY+RN0T8MWzW1cmHqf2sv5MMBN1Awwa2SxcX1QRohPAK/XtauxV
         49Vw==
X-Forwarded-Encrypted: i=1; AHgh+Rrj/tNcVcAQYavstZX+XzPjqDmrId6l+bURyKQop4YxG9R8VOkfrMmbzCHte3Hp+SE2DCaRwCeej7WbmukF/025@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8YVEyp1PfmBaZvrJylRjud05mwAvRCHwjUqOvHHWkYc+SQCAE
	ghUVsuiOlwLjcnyNduGMlEq1ynnKmcAc8IfpSNaRbQJbNlN7c5+aJgX0rJBFMOfho8IOqrUe4ux
	aEtRwOQ==
X-Received: from plos6.prod.google.com ([2002:a17:903:1ac6:b0:2ca:ddbd:a19c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f792:b0:2d3:6fac:d67c
 with SMTP id d9443c01a7336-2d5ff7c849dmr91033865ad.10.1787149671281; Wed, 19
 Aug 2026 07:27:51 -0700 (PDT)
Date: Wed, 19 Aug 2026 07:27:50 -0700
In-Reply-To: <7c368424-80f9-4491-8578-d26ccc7dc835@kernel.org>
Mime-Version: 1.0
References: <20260818-gmem-no-return-page-v2-0-5298f42d49bb@google.com>
 <807b4b9f-b1ca-4b5c-bc9e-22bf0637ba33@kernel.org> <aoS4wd6Dy9DlluHl@google.com>
 <7c368424-80f9-4491-8578-d26ccc7dc835@kernel.org>
Message-ID: <aoW9ZhBWucR3HApp@google.com>
Subject: Re: [PATCH v2 0/4] Stop returning struct page from guest_memfd PFN lookup
From: Sean Christopherson <seanjc@google.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>, g@google.com
Cc: Ackerley Tng <ackerleytng@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Ashish Kalra <ashish.kalra@amd.com>, 
	Michael Roth <michael.roth@amd.com>, Brijesh Singh <brijesh.singh@amd.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Fuad Tabba <tabba@google.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Rick P Edgecombe <rick.p.edgecombe@intel.com>, Vishal Annapurve <vannapurve@google.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_072753_628319_5BE03345 
X-CRM114-Status: GOOD (  20.03  )
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

On Wed, Aug 19, 2026, David Hildenbrand (Arm) wrote:
> On 8/18/26 21:55, Sean Christopherson wrote:
> > On Tue, Aug 18, 2026, David Hildenbrand (Arm) wrote:
> >> On 8/18/26 11:15, Ackerley Tng wrote:
> >>> KVM currently expects kvm_gmem_get_pfn() to return a refcounted struct
> >>> page. Callers (such as x86 TDP MMU, arm64 Stage-2 fault handler, and SEV-SNP
> >>> VMSA / RMP handlers) hold this refcount across page fault handling.
> >>>
> >>> Holding a page refcount across fault handling is problematic for guest_memfd.
> >>> In-place memory conversions between confidential computing shared and private
> >>> states inspect folio refcounts to ensure exclusive ownership by guest_memfd.  A
> >>> concurrent guest page fault taking a reference on the folio causes conversions
> >>> to fail due to an elevated refcount.
> >>
> >> Right. Won't we still, at least temporarily, grab a reference while looking up
> >> the folio in the page cache, or will we be preventing that concurrent race with
> >> locking?
> > 
> > The latter.  What I want to aim for is that if the relevant guest_memfd range
> > has never been mmap()'d and there are no memory failures, then conversion is
> > guaranteed to not fail due to elevated refcounts.
> > 
> > Or to put it a different way, I want KVM's ABI to be that pausing vCPU is *NOT*
> > required to perform an in-place conversion.
> 
> Having the VM access a page that is currently under conversion (triggered by the
> VM) should not be the common case, no? Except, prefaulting, of course.

"not be the common case" is likely an understatement.  In practice, I don't it
will happen outside of guest bugs and KVM testcases.

It's the testcases that I want to "unblock" though.  If we commit to never having
to pause vCPUs, even if the guest is misbehaving, then that gives us deterministic
behavior we can validate, i.e. a way to detect similar regressions in the future.

I don't expect any regressions would be super problematic, but being able to treat
any failed conversion as a KVM bug (for the curated setup) mitigates the risk of
death by a thousand cuts, i.e. reduces the risk of gradually degrading conversion
performance because more and more transient references being taken by KVM.

