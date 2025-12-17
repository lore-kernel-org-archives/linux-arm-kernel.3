Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD59BD64072
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 04:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tIvslDrd3vRyKntdo1TKclAc08m0jxGuja83vYWFMz0=; b=GK/k70zQL5iXt9braiwjuiWitB
	etieSjelHGrPsUMCf/QWlX7hlDx16NjIyYXF2GL/KIX4mbjYanH0dq05oxAnpdz0cEk7vK44loD3/
	blckwMx9QC5rBT487aYlTXTuHtuCXAcbCI622lprt9EgVMEzbUo16GQsAfdi80fXoxmHqx/kFWYFG
	v/GksqcRnb34KRcG5gO4rEw8S0dcJ3HV1d81bD2kYP5yi5ioQHKgIk6Hsr819Du/Da8jJ/deSfojw
	kePBn9fJyqm2Az5FQe9M2UmWyeVIpfOQkj3dnnIrUheGkr2iODQPRqym/A4lcqdFmsUSI5aoMNHL3
	0iDMyxNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVivS-000000068zw-1FN3;
	Wed, 17 Dec 2025 04:14:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVivP-000000068za-2eHh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 04:14:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 07C734021D;
	Wed, 17 Dec 2025 04:14:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB41EC4CEFB;
	Wed, 17 Dec 2025 04:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1765944844;
	bh=xU2trvapXnk7g5CtACkCj5ikoDQ/txcQUif1mO1cIY8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mObMGKaHzs+oIi98uFJNPKFjcIbwG14MyPdinNriP9aRfBOmrP9YgUR0U5RY50Jcg
	 MRZ/eN62bquBtMDDTcWo7ge5Ui+mwLmddzDbSz+GfDkXxY71DhMOB9iezvOgCfm+sh
	 F57lldv0D0XP5sN73LEmpLArzoS8Y23dHH7bFz7M=
Date: Tue, 16 Dec 2025 20:14:03 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, Alexander Gordeev
 <agordeev@linux.ibm.com>, Andreas Larsson <andreas@gaisler.com>, Anshuman
 Khandual <anshuman.khandual@arm.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Borislav Petkov <bp@alien8.de>, Catalin
 Marinas <catalin.marinas@arm.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, David Woodhouse <dwmw2@infradead.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Jann Horn
 <jannh@google.com>, Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>, Mike Rapoport
 <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Peter Zijlstra
 <peterz@infradead.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Suren Baghdasaryan
 <surenb@google.com>, Thomas Gleixner <tglx@linutronix.de>, Venkat Rao
 Bagalkote <venkat88@linux.ibm.com>, Vlastimil Babka <vbabka@suse.cz>, Will
 Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
Subject: Re: [PATCH v6 14/14] mm: Add basic tests for lazy_mmu
Message-Id: <20251216201403.4647a4f9861d3122ee9e90d7@linux-foundation.org>
In-Reply-To: <20251215150323.2218608-15-kevin.brodsky@arm.com>
References: <20251215150323.2218608-1-kevin.brodsky@arm.com>
	<20251215150323.2218608-15-kevin.brodsky@arm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_201407_918023_394864AA 
X-CRM114-Status: GOOD (  12.27  )
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

On Mon, 15 Dec 2025 15:03:23 +0000 Kevin Brodsky <kevin.brodsky@arm.com> wrote:

> Add basic KUnit tests for the generic aspects of the lazy MMU mode:
> ensure that it appears active when it should, depending on how
> enable/disable and pause/resume pairs are nested.

I needed this for powerpc allmodconfig;

--- a/arch/powerpc/mm/book3s64/hash_tlb.c~mm-add-basic-tests-for-lazy_mmu-fix
+++ a/arch/powerpc/mm/book3s64/hash_tlb.c
@@ -30,6 +30,7 @@
 #include <trace/events/thp.h>
 
 DEFINE_PER_CPU(struct ppc64_tlb_batch, ppc64_tlb_batch);
+EXPORT_SYMBOL_GPL(ppc64_tlb_batch);
 
 /*
  * A linux PTE was changed and the corresponding hash table entry
@@ -154,6 +155,7 @@ void __flush_tlb_pending(struct ppc64_tl
 		flush_hash_range(i, local);
 	batch->index = 0;
 }
+EXPORT_SYMBOL_GPL(__flush_tlb_pending);
 
 void hash__tlb_flush(struct mmu_gather *tlb)
 {
_


