Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C78EC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 23:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6M4TeuUAfyAB5cwdrPHhzwOi481NScimK7wq3WYEIE4=; b=lmmiSqGhaf+oAI41i6VOsO139/
	YcjA/QZcu2fv6FkJO6ZrFSXWWpi2PsklCy0lnctk5J3BJrjRm6Yc2UmpDgNBc2jTvBPiUZPv+D0HA
	Hux9nA6eTQfnyiqjvZAGDpeqnoKOIuWu5AjC1ylpbo2U8Gw5PxiZqSOmRbgIo9iWY1W04HnIOrmXz
	RlbvIdzH8gNSF4ALfMN/UbqtjWx7JHoBCywRnMOrxHdo7l+OHZSwnjhIb2mmQDrR2RQ8Nf5qd0OMq
	6hWW7ko2cPq/9TA2+rihAbEuei79QbmcMOdMjU1Lbxu7HbTQZH90xnqsP3GhqE12vIe8IbuRYrsEm
	Sxnz2/Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8SeQ-000000018hL-2ZMN;
	Fri, 25 Apr 2025 23:40:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8ScZ-000000018Xs-1519
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 23:38:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9E3435C6936;
	Fri, 25 Apr 2025 23:35:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1087C4CEE4;
	Fri, 25 Apr 2025 23:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1745624294;
	bh=bBXE0S+pNXENLTt4NEY1ZrmeTvHC4VQlLdkgbGsAHQw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=votz5VzMXsI/gGUGcBTOD4PPK/SqxvOT6jZ1lIrQE51GryTcYvzs9KfudOJPDFYBj
	 75zQs86G0NaBmP8Hj+6YL90BRsSHcM/ICGNXMs7v711+KwUIL31EcbIizsMkjU/Uql
	 kK2RN9ofdQIhJAtwm6lV9ngyGFdOEhsvR7JqY2BQ=
Date: Fri, 25 Apr 2025 16:38:13 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Mike Rapoport <rppt@kernel.org>,
 "Sauerwein, David" <dssauerw@amazon.de>, Anshuman Khandual
 <anshuman.khandual@arm.com>, Ard Biesheuvel <ardb@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, David Hildenbrand <david@redhat.com>,
 Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mike
 Rapoport <rppt@linux.ibm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Ruihan Li <lrh2000@pku.edu.cn>
Subject: Re: [PATCH v4 7/7] mm/mm_init: Use for_each_valid_pfn() in
 init_unavailable_range()
Message-Id: <20250425163813.58b72a3aa2d3ebbd96d1929e@linux-foundation.org>
In-Reply-To: <e772cf66-c661-422d-911a-bc13ba4d59fb@lucifer.local>
References: <20250423133821.789413-1-dwmw2@infradead.org>
	<20250423133821.789413-8-dwmw2@infradead.org>
	<e772cf66-c661-422d-911a-bc13ba4d59fb@lucifer.local>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_163815_344470_1D574E7A 
X-CRM114-Status: GOOD (  13.48  )
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

On Fri, 25 Apr 2025 17:11:10 +0100 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:

> Andrew - can we drop this from mm-new? It's breaking it.

I almost did, but David seems to have a fix.

--- a/include/linux/mmzone.h~mm-mm_init-use-for_each_valid_pfn-in-init_unavailable_range-fix
+++ a/include/linux/mmzone.h
@@ -2190,10 +2190,10 @@ static inline unsigned long next_valid_p
 	/*
 	 * Either every PFN within the section (or subsection for VMEMMAP) is
 	 * valid, or none of them are. So there's no point repeating the check
-	 * for every PFN; only call first_valid_pfn() the first time, and when
-	 * crossing a (sub)section boundary (i.e. !(pfn & ~PFN_VALID_MASK)).
+	 * for every PFN; only call first_valid_pfn() again when crossing a
+	 * (sub)section boundary (i.e. !(pfn & ~PAGE_{SUB,}SECTION_MASK)).
 	 */
-	if (pfn & (IS_ENABLED(CONFIG_SPARSEMEM_VMEMMAP) ?
+	if (pfn & ~(IS_ENABLED(CONFIG_SPARSEMEM_VMEMMAP) ?
 		   PAGE_SUBSECTION_MASK : PAGE_SECTION_MASK))
 		return pfn;
 
_


