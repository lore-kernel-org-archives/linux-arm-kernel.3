Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D082E7E0BA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 09:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IrDoYLyiC3yn1nM6rKNC2iEmkXxrMHxQFeD9sl87gjA=; b=o/rqv7BHIofEsO33pex2sAoi+Q
	Sc9n0nuUVCRbQOqydPVSNFqlh2Qs5Bwi81nTfYqHlm9BUrAieR+tiu5GIypAydUyb6PlDJ6Wm/YBn
	Oi4d0P29Yu1JkdTFgvnVCZPl2tz214A9eajS85NJbOVi5JrjZdmsnTRz6y6B+E6f9ZplaQ6OTq7zi
	IhD/2IIgGa6r56v8yOzm2W6scKrWtD29fICR3mWlD2XlC3muXp2Lq/gUChmB8RcQbDwkEHjkLoduG
	tw1l2RCmuaVddG2tSg+CnVrBRhRGlg6ABMiq2F98odOoPAsgz55XjXp0tXO+B13YwmEUmUif6o+J9
	AgAanUyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpNyc-0000000FBsp-0ooF;
	Mon, 09 Feb 2026 09:54:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpNya-0000000FBsA-14hU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 09:54:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1E94B600B0;
	Mon,  9 Feb 2026 09:54:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96E69C116C6;
	Mon,  9 Feb 2026 09:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770630878;
	bh=3tBHDDvBJjbjVnORXt//tsMxH53+PSsCsTP84KGDkeY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ArfQZAocn3bNOTGiysPVyOMe587mUPIZxvyXEE2Xhmcgglt7QoDFMi/M9Nnt6wohk
	 NZz+f8NBf1if+1TK9UQz0R+uY005AH8rYmZJ1LVKkvfd3l1qkxuPW78axr7gpZDBFH
	 unUm/P6Pn1tIvbeUobFDZLSk0Na8iGT96+hqTFrtI81ETKk24v5akjOiN5K/0AjD5x
	 rI5UN5k8mVbb6/owKbo4OdpIsSyd/dpXw9HnhaVopbDBBZqI93jE3ObIL9nkmGkUsC
	 AZbFx67KRYSxPSVl7oipYgkgroohTjeJP63MEAOZHaaK1Pgn601KvrBFay8s6kkfU2
	 Z28pnDyucyYaw==
Message-ID: <e5175f66-56fd-437b-a183-b2ccc3f54f94@kernel.org>
Date: Mon, 9 Feb 2026 10:54:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: rmap: skip batched unmapping for UFFD vmas
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Liam.Howlett@oracle.com, akpm@linux-foundation.org, baohua@kernel.org,
 catalin.marinas@arm.com, dev.jain@arm.com, harry.yoo@oracle.com,
 jannh@google.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 lorenzo.stoakes@oracle.com, mhocko@suse.com, riel@surriel.com,
 rppt@kernel.org, ryan.roberts@arm.com, surenb@google.com, vbabka@suse.cz,
 will@kernel.org, willy@infradead.org
References: <142919ac14d3cf70cba370808d85debe089df7b4.1766631066.git.baolin.wang@linux.alibaba.com>
 <20260116162652.176054-1-baolin.wang@linux.alibaba.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260116162652.176054-1-baolin.wang@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 1/16/26 17:26, Baolin Wang wrote:
> As Dev reported[1], it's not ready to support batched unmapping for uffd case.
> Let's still fallback to per-page unmapping for the uffd case.
> 
> [1] https://lore.kernel.org/linux-mm/20260116082721.275178-1-dev.jain@arm.com/
> Reported-by: Dev Jain <dev.jain@arm.com>
> Suggested-by: Barry Song <baohua@kernel.org>
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
>   mm/rmap.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/mm/rmap.c b/mm/rmap.c
> index f13480cb9f2e..172643092dcf 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -1953,6 +1953,9 @@ static inline unsigned int folio_unmap_pte_batch(struct folio *folio,
>   	if (pte_unused(pte))
>   		return 1;
>   
> +	if (userfaultfd_wp(vma))
> +		return 1;
> +

Interesting. I was just wondering why we didn't run into that with lazyfree folios.

Staring at pte_install_uffd_wp_if_needed(), we never set the marker for
anonymous VMAs.

So, yeah, if one sets lazyfree on a uffd-wp PTE, the uffd-wp bit will just get
zapped alongside. Just like MADV_DONTNEED.


I'm fine with that temporary fix. But I guess the non-hacky way to handle this would be:


 From 53d016d6e6f624425dbdbc2fb1dec7c91fbef15c Mon Sep 17 00:00:00 2001
From: "David Hildenbrand (Arm)" <david@kernel.org>
Date: Mon, 9 Feb 2026 10:52:59 +0100
Subject: [PATCH] tmp

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
  include/linux/mm_inline.h | 15 ++++++---------
  mm/memory.c               | 21 +--------------------
  mm/rmap.c                 |  2 +-
  3 files changed, 8 insertions(+), 30 deletions(-)

diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
index fa2d6ba811b5..8a9a2c5f5ee3 100644
--- a/include/linux/mm_inline.h
+++ b/include/linux/mm_inline.h
@@ -566,9 +566,8 @@ static inline pte_marker copy_pte_marker(
   *
   * Returns true if an uffd-wp pte was installed, false otherwise.
   */
-static inline bool
-pte_install_uffd_wp_if_needed(struct vm_area_struct *vma, unsigned long addr,
-			      pte_t *pte, pte_t pteval)
+static inline bool install_uffd_wp_ptes_if_needed(struct vm_area_struct *vma,
+		unsigned long addr, pte_t *pte, unsigned int nr, pte_t pteval)
  {
  	bool arm_uffd_pte = false;
  
@@ -598,13 +597,11 @@ pte_install_uffd_wp_if_needed(struct vm_area_struct *vma, unsigned long addr,
  	if (unlikely(pte_swp_uffd_wp_any(pteval)))
  		arm_uffd_pte = true;
  
-	if (unlikely(arm_uffd_pte)) {
-		set_pte_at(vma->vm_mm, addr, pte,
-			   make_pte_marker(PTE_MARKER_UFFD_WP));
-		return true;
-	}
+	if (likely(!arm_uffd_pte))
+		return false;
  
-	return false;
+	set_ptes(vma->vm_mm, addr, pte, make_pte_marker(PTE_MARKER_UFFD_WP), nr);
+	return true;
  }
  
  static inline bool vma_has_recency(const struct vm_area_struct *vma)
diff --git a/mm/memory.c b/mm/memory.c
index da360a6eb8a4..0a87d02a9a69 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -1592,29 +1592,10 @@ zap_install_uffd_wp_if_needed(struct vm_area_struct *vma,
  			      unsigned long addr, pte_t *pte, int nr,
  			      struct zap_details *details, pte_t pteval)
  {
-	bool was_installed = false;
-
-	if (!uffd_supports_wp_marker())
-		return false;
-
-	/* Zap on anonymous always means dropping everything */
-	if (vma_is_anonymous(vma))
-		return false;
-
  	if (zap_drop_markers(details))
  		return false;
  
-	for (;;) {
-		/* the PFN in the PTE is irrelevant. */
-		if (pte_install_uffd_wp_if_needed(vma, addr, pte, pteval))
-			was_installed = true;
-		if (--nr == 0)
-			break;
-		pte++;
-		addr += PAGE_SIZE;
-	}
-
-	return was_installed;
+	return install_uffd_wp_ptes_if_needed(vma, addr, pte, nr, pteval);
  }
  
  static __always_inline void zap_present_folio_ptes(struct mmu_gather *tlb,
diff --git a/mm/rmap.c b/mm/rmap.c
index 7b9879ef442d..f71aacf35925 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2061,7 +2061,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
  		 * we may want to replace a none pte with a marker pte if
  		 * it's file-backed, so we don't lose the tracking info.
  		 */
-		pte_install_uffd_wp_if_needed(vma, address, pvmw.pte, pteval);
+		install_uffd_wp_ptes_if_needed(vma, address, pvmw.pte, nr_pages, pteval);
  
  		/* Update high watermark before we lower rss */
  		update_hiwater_rss(mm);
-- 
2.43.0



Does somebody have time to look into that? We should also adjust the doc of pte_install_uffd_wp_if_needed()
and turn it into some proper kerneldoc.

-- 
Cheers,

David

