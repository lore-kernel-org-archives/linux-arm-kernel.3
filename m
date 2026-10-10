Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A45BCA6004
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 05:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OJ1PM7OwTRFCcCA6fMvi4+cDOCXvIiu0yXYNfDDpyHo=; b=tKrSjU7Tbg7lVCyaXCmhBGzDnV
	P6eK0NEwSkonYpgWirWNLliUn1beWxlA3TsS2mDLP9z1n5R2qxqAZcFL07QFy0s5rhMHLLCekKDdH
	Pg6WFgmM8sj6T0ZOb9n1JmKuAobivGnDx0hnrhvEaNlH2z4fqbO/pPXs/MP/8RS4QzBsn7Re/d2LO
	OD35E/7+cLSkgiGJZIGW5H+y9oxHdcYBnCvhmLoJQ+r/MYI+afnoWeC1jk2j12f7zREYoojkaawqB
	T9TyB/zhm4OyFf5n8p48f6twOEgzQ2e7F7yt7N0dhZtv2gYtNLGF3+WO2XcwwBMogBorjLVSxYsuL
	7GGlJUHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFPNg-00000007XIt-1T7z;
	Sat, 10 Oct 2026 05:12:24 +0000
Received: from out-141.mta1.migadu.com ([2001:41d0:203:375::8d] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFPNc-00000007XHY-47eb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 05:12:23 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=HkTvJBnAIE0ZS4t3l1CJ6+YMsi7vy8/ugr2w69S/OBY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791609137; v=1; x=1792213937;
 b=cTAfOgS0fTtSt7e7QjdoBBL069Fi7tMpmbwUTn/QqvkOQZ41ZZ+3msXWO10R8eAQtHFhptJv
 EskLdPfKJay6WX7V4ZqYHHuo/Jj5x2AJTELD/k7cKMLxuVh4rkjdXzvoaVRMuHyedDzwZ4G1PVM
 2Xp9IGcLRTeCe83yxMGzNhyM=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 7bb1c1c289ae0b48;
	Sat, 10 Oct 2026 05:12:17 +0000
X-Mizu-Trace-ID: 7bb1c1c289ae0b48
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH 1/4] x86/mm: fix missing pgtable destructor for vmemmap
 tables
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <bd47fc12-f1cf-4994-8b42-45fc68944072@intel.com>
Date: Sat, 10 Oct 2026 13:11:57 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 akpm@linux-foundation.org,
 linux-mm@kvack.org,
 stable@vger.kernel.org,
 david@kernel.org,
 osalvador@suse.de,
 dave.hansen@linux.intel.com,
 luto@kernel.org,
 peterz@infradead.org,
 tglx@kernel.org,
 mingo@redhat.com,
 bp@alien8.de,
 x86@kernel.org,
 hpa@zytor.com,
 catalin.marinas@arm.com,
 will@kernel.org,
 mark.rutland@arm.com,
 linux-arm-kernel@lists.infradead.org,
 pjw@kernel.org,
 palmer@dabbelt.com,
 aou@eecs.berkeley.edu,
 alex@ghiti.fr,
 linux-riscv@lists.infradead.org,
 agordeev@linux.ibm.com,
 kevin.brodsky@arm.com,
 bjorn@rivosinc.com,
 apopple@nvidia.com,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <AD5E5149-5786-4E46-A7C0-995088282179@linux.dev>
References: <20261008073021.2512665-1-songmuchun@bytedance.com>
 <20261008073021.2512665-2-songmuchun@bytedance.com>
 <bd47fc12-f1cf-4994-8b42-45fc68944072@intel.com>
To: Dave Hansen <dave.hansen@intel.com>
X-Mailer: Apple Mail (2.3901.100.1.1.12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_221221_898048_F58B701C 
X-CRM114-Status: GOOD (  21.49  )
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



> On Oct 10, 2026, at 04:54, Dave Hansen <dave.hansen@intel.com> wrote:
> 
> On 10/8/26 00:30, Muchun Song wrote:
>> Since commit 49f599666420 ("mm: call ctor/dtor for kernel PTEs"),
>> pte_alloc_one_kernel() runs the page-table constructor for kernel PTE
>> tables.
>> 
>> HugeTLB vmemmap optimization uses pte_alloc_one_kernel() when splitting
>> a PMD. Restoring the vmemmap backing pages does not collapse the PTE
>> table, so a later memory hot-remove eventually frees that table through
>> free_pagetable(). That path currently calls pagetable_free() directly
>> without decrementing NR_PAGETABLE.
>> 
>> Use PageTable() to identify constructor-backed tables and run the
>> matching destructor before freeing them. Keep reserved and
>> constructor-free tables on their existing paths. This also prepares
>> vmemmap teardown for generic runtime allocations through the normal
>> pgalloc helpers.
> 
> Could you please take some time and trim the bits out of this changelog
> that the LLM inserted but that are not super relevant? For instance, I'm
> not sure what the first paragraph is trying to say. It is apparently
> missing some context.
> 
> FWIW, I really don't like the LLM changelogs on their own. They almost
> inevitably need human editing to make them usable. I really, really
> expect humans that are sending x86 patches to spend some human
> brainpower on them. In fact, I expect folks with:
> 
> Assisted-by: LLM
> 
> to be sending _impeccable_ changelogs in v1 because their LLM saved them
> so much time that they can spend gobs on their changelogs. More than
> ever. ;)

I agree with the general point that LLM output needs to be carefully
checked by the submitter rather than adopted as-is.

However, I think the first paragraph is relevant. It is intended to
provide background: commit 49f599666420 changed the behavior of
pte_alloc_one_kernel and should be canditate for Fixes tag. The second
paragraph then explains that HVO depends on pte_alloc_one_kernel, so
that change also affected HVO behavior. The third paragraph describes
the fix. So the changelog does have a coherent structure, even if it
can be trimmed.

Of course. I just wanted to explain that I did review the LLM-generated
content, and that I did not simply leave it unchecked.

> 
> Oh, and it's an x86 crime that we have:
> 
> free_pagetable()
> and
> pagetable_free()
> 
> Any work that makes that coherent would be much appreciated.

Maybe rename free_pagetable to free_hotplug_pgtable_page in
a separate cleanup patch?

Thanks,
Muchun


