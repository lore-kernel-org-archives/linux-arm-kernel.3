Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96173C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 19:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kuUJP/9WbIJ+dwbEGRfTcEg4pKKbPnOHED5niMcUDBA=; b=dAUPj57aCehBAU5zELb/nYkmh9
	LGHtFm+481lbvZoxcILIyYoy7Mc5uh5Xva6KwBVDHdE2SDE6UpREk3wLp068oQHQb28pjR88WRPDp
	b4E5+qkgIZKHAwOj1fYf10qaZovt1UEKMsvrazIPSmibBVS2aGsZHy5UvkqHTxkykYjEv3UgQv7J3
	rnjiXGWTRr7Boro6PjrkgnnxTur44qflsv3FY+30GuAXrJD1NmzYZvPW1csRqMnDHCmu+8q3Snokp
	MdYsrcJOnuzUmAy60k03vwfXdiO+LugK8gKDo9EzxijPBWoyIFqxQ8KHAbl9t7C0NpUhgEkUF0TZ2
	nv7bGlYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwPuY-00000008c5c-0Ra4;
	Tue, 18 Aug 2026 19:55:50 +0000
Received: from mail-pf1-x447.google.com ([2607:f8b0:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwPuV-00000008c5G-3gKB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 19:55:49 +0000
Received: by mail-pf1-x447.google.com with SMTP id d2e1a72fcca58-848662cd2a1so348091b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 12:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787082946; x=1787687746; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kuUJP/9WbIJ+dwbEGRfTcEg4pKKbPnOHED5niMcUDBA=;
        b=OZS1dniQwSPmcDa2A26xGOjlh7isqwS+h6k/lSJvgGFQMa8DJSKnxREDdPzhgYjgiy
         U+hpe8sGwAG+0EWfEPQzssVNpFe+JsxxMPiJmmq6P0z4a0fGvUgTd4IsoYCxxRfVlcJu
         VcJvppSMNx3TbXIhmU0ItvS4SNnJ3oeLbdfQCReOaLeNukqpVsI1FyR5o3F0VwxLGETr
         Fqb9nMnrNPJS37vBTwjYo34R+ZMu7ikf+5VjyYoqYJysRvnPAmH/GUqRlZ+YzHKkrjDn
         1A2ejlxaOn53fqHuD0fZuyVO/tCJ8gDeekhzqcWnNsVappqfzkeUtS0dLl6V+JOFq7o8
         GnNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787082946; x=1787687746;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kuUJP/9WbIJ+dwbEGRfTcEg4pKKbPnOHED5niMcUDBA=;
        b=IF+4MokAsK2yOsXsE3uoG1eV9YS0W+UT93qmg1zzBSMLKPpIGZmvaXzsI99dWGfWMs
         OLJM1mF052+xqXf7IjNUKY6VLCa86dGNFgiUcexmjzge6aQ3PMd98nEGn4sphaKbvnl1
         5XINvjPa7JBtDRl0aPmWMxljeQ7ftiSF5DG2Vw0AU2mxECpyAxBblBbwlbMcHKtDpbQW
         NVH9MMuFNNY7tRanAlqtQVND1xhIEegGujLEF9TEEsQETo86ITswleT4e7Rue/D9d32O
         HOgcKEyNePglpwUx2ShzQnxHq6DKWkT6wZSRYUqrTcPHaFb16RvOAp2dSaJe/nSqkx4a
         ZJew==
X-Forwarded-Encrypted: i=1; AHgh+RqR5KVkU2tUIYhBEnp9qeKoZ/xCPLdhzDFNRS1t5ar9/01646PPX7kugW40qLfUoIYyMQBNQJ7BJ+YNi+R1M1GT@lists.infradead.org
X-Gm-Message-State: AOJu0YzZyyP+DZ/Ia0EtZeRm1fGIfI7unCf5RzNS3uzGyu/Qn5TQawl4
	UaoocAiSiFzv/hsHn9R+I8RSnRoS8pGvYM7g6K1CBbFaW7tmHiaTaSql7SIr7ImOOENvEM3qGPJ
	qiVLPbw==
X-Received: from pglg36.prod.google.com ([2002:a63:1124:0:b0:cc1:522f:464c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:cd96:b0:3bf:6d96:ac40
 with SMTP id adf61e73a8af0-3ccfef7af73mr418448637.12.1787082945745; Tue, 18
 Aug 2026 12:55:45 -0700 (PDT)
Date: Tue, 18 Aug 2026 12:55:45 -0700
In-Reply-To: <807b4b9f-b1ca-4b5c-bc9e-22bf0637ba33@kernel.org>
Mime-Version: 1.0
References: <20260818-gmem-no-return-page-v2-0-5298f42d49bb@google.com> <807b4b9f-b1ca-4b5c-bc9e-22bf0637ba33@kernel.org>
Message-ID: <aoS4wd6Dy9DlluHl@google.com>
Subject: Re: [PATCH v2 0/4] Stop returning struct page from guest_memfd PFN lookup
From: Sean Christopherson <seanjc@google.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
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
X-CRM114-CacheID: sfid-20260818_125547_921878_326F472F 
X-CRM114-Status: GOOD (  14.25  )
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

On Tue, Aug 18, 2026, David Hildenbrand (Arm) wrote:
> On 8/18/26 11:15, Ackerley Tng wrote:
> > KVM currently expects kvm_gmem_get_pfn() to return a refcounted struct
> > page. Callers (such as x86 TDP MMU, arm64 Stage-2 fault handler, and SEV-SNP
> > VMSA / RMP handlers) hold this refcount across page fault handling.
> > 
> > Holding a page refcount across fault handling is problematic for guest_memfd.
> > In-place memory conversions between confidential computing shared and private
> > states inspect folio refcounts to ensure exclusive ownership by guest_memfd.  A
> > concurrent guest page fault taking a reference on the folio causes conversions
> > to fail due to an elevated refcount.
> 
> Right. Won't we still, at least temporarily, grab a reference while looking up
> the folio in the page cache, or will we be preventing that concurrent race with
> locking?

The latter.  What I want to aim for is that if the relevant guest_memfd range
has never been mmap()'d and there are no memory failures, then conversion is
guaranteed to not fail due to elevated refcounts.

Or to put it a different way, I want KVM's ABI to be that pausing vCPU is *NOT*
required to perform an in-place conversion.

