Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E24CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 23:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jmSU8+clGd9Vdr+0PQ5FxeSQ2EfOINrntLzTOj1OVhQ=; b=jum3TRCmXlc7eu5VB7CrPkSH3O
	zpe0+hurh24603/+SwlPh8t9Cd7xq6Fgkj6tZqiQp/LMYc4RuHh83CdPosd7NFTXCgIEXGq06mkpj
	s74nD3vYJ4XbC+oWUv1YNKP+2v1vhet7UbMzh+mhEdsK7GnFDV92fQdqJpeJQCu4GtS36MhXb5zmz
	pzci/9PnZmX65rYWNeTJlgKjTQJ+B7lO0g1KcaByJ0Ak6JBKvQ8cCn3Zo4hN0nvfTE4KaVOrXYp04
	VlJ2/YjZG6pb7i4hiejfBFfVouL+KTv5qECUUMf+RFVFliVflWP2LQ7AryVR67mHYr1AwybAeSker
	c4wJKE+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUBmA-0000000C2Nr-4AmL;
	Mon, 01 Jun 2026 23:10:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUBm9-0000000C2Nl-1w25
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 23:10:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7CBA16001A;
	Mon,  1 Jun 2026 23:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D1BE1F00893;
	Mon,  1 Jun 2026 23:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1780355428;
	bh=jmSU8+clGd9Vdr+0PQ5FxeSQ2EfOINrntLzTOj1OVhQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=UcuLTdYFJ45yGbhwq4JqV5rRBlsI2KOcUsj2hzI4QVrvlWpfknsw0mxnUG2kgHyGl
	 NKwBt+ok4mnD9QE2zdnUuN8BofrNb4vxTM73veVHbmfpu/tnvvYh3qwpGKcANbxpiY
	 ErXU92C50RKmfHmskjHokRs/Z0jxFNI5K9MXFzx4=
Date: Mon, 1 Jun 2026 16:10:26 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Usama Arif <usama.arif@linux.dev>
Cc: david@kernel.org, willy@infradead.org, ryan.roberts@arm.com,
 linux-mm@kvack.org, pfalcato@suse.de, r@hev.cc, jack@suse.cz, Andrew
 Donnellan <andrew+kernel@donnellan.id.au>, apopple@nvidia.com,
 baohua@kernel.org, baolin.wang@linux.alibaba.com, brauner@kernel.org,
 catalin.marinas@arm.com, dev.jain@arm.com, kees@kernel.org,
 kevin.brodsky@arm.com, lance.yang@linux.dev, Liam R. Howlett
 <liam@infradead.org>, linux-arm-kernel@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 ljs@kernel.org, mhocko@suse.com, npache@redhat.com,
 pasha.tatashin@soleen.com, rmclure@linux.ibm.com, rppt@kernel.org,
 surenb@google.com, vbabka@kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 ziy@nvidia.com, hannes@cmpxchg.org, kas@kernel.org, shakeel.butt@linux.dev,
 kernel-team@meta.com
Subject: Re: [PATCH v7 0/2] mm: improve large folio readahead for exec
 memory
Message-Id: <20260601161026.d5905786bbd3a26d62be88c3@linux-foundation.org>
In-Reply-To: <20260601102205.3985788-1-usama.arif@linux.dev>
References: <20260601102205.3985788-1-usama.arif@linux.dev>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Mon,  1 Jun 2026 03:21:16 -0700 Usama Arif <usama.arif@linux.dev> wrote:

> Hopefully this is the last revision. The only change from the previous
> revision is that the logic for deciding THP order was simplified and
> the max is now capped to 2M. Thanks Pedro and Jan for the suggestion
> and the dicusssion!
> 
> The benchmark results on Neoverse V2 (Grace), arm64 with 64K base pages,
> 512MB executable file on ext4, averaged over 3 runs:
> 
>   Phase      | Baseline     | Patched      | Improvement
>   -----------|--------------|--------------|------------------
>   Cold fault | 83.4 ms      | 41.3 ms      | 50% faster
>   Random     | 76.0 ms      | 58.3 ms      | 23% faster
> 
> The patches are on top of mm-unstable from 28 May
> (8a74e22643189e0ae339afc91110ddb4cab1941b) which include patch [1]
> that make mmap_miss accounting symmetric for VM_SEQ_READ which was pointed
> out by sashiko in the previous revision.

We lost the [0/N] cover letter.  Please do retain (and maintain!) that
across revisions.  I used the one from the v6 patchset.

> v6 -> v7: https://lore.kernel.org/all/20260528165635.2068012-1-usama.arif@linux.dev/
> - Simplify logic and just cap the max THP order to 2M (Pedro and Jan)

Here's how v7 altered mm.git:


 mm/filemap.c |   15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

--- a/mm/filemap.c~b
+++ a/mm/filemap.c
@@ -3320,17 +3320,12 @@ static struct file *do_sync_mmap_readahe
 	/* Use the readahead code, even if readahead is disabled */
 	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && (vm_flags & VM_HUGEPAGE)) {
 		/*
-		 * Preserve PMD-sized readahead where it already fits in
-		 * the page cache. Otherwise cap the new fallback path at
-		 * 2MB: this is the common PMD-sized hugepage size, and it
-		 * avoids memory pressure from very large forced readahead
-		 * when mapping_max_folio_order() is high (for example,
-		 * 128MB with 64K base pages on arm64).
+		 * Cap max THP order at 2MB: this is the common PMD-sized
+		 * hugepage size, and it avoids memory pressure from very
+		 * large forced readahead when mapping_max_folio_order() is
+		 * high (for example, 128MB with 64K base pages on arm64).
 		 */
-		if (HPAGE_PMD_ORDER <= MAX_PAGECACHE_ORDER) {
-			force_thp_readahead = true;
-			thp_order = HPAGE_PMD_ORDER;
-		} else if (mapping_large_folio_support(mapping)) {
+		if (mapping_large_folio_support(mapping)) {
 			force_thp_readahead = true;
 			thp_order = min_t(unsigned int,
 					  mapping_max_folio_order(mapping),
_


