Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 053EACD6E61
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 10:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M9bUPwvZD9u+pXGLJ1fAR+BJ7vzqCtQEZJfnSjvNvKg=; b=gz4K6N0vHvehVH2rkoDV4BZ/nj
	ulq3WX6qt9JwAF9NYtOs47qcguUGiGERd47lIfuXdytzuxjcqfmss6NKmO2jFL0GNOScFnFDR66QK
	kLv7CcDenxfAgsEAXPA61xW479ad9jUkUk9y6qaX3AIAMmZBk2/k+TQDpZCVbnU1Xr1SeU6KfcqCg
	hrRn78LTc/OWLFFR54oGzupAX/uqC7Hvh5vyrVtu/O/wFq2tWT20mIB4r7mb+vTNGLAsU7V5lj7I/
	HTwJoKTfh8MxHF6NjEbEtoQBAHg620nAK81pgBC2cuUw9JtF9oLhj0iRwheq0yElFP88Qps/GeVYT
	vOUJbtjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzmy-0000000AbaS-3HJh;
	Mon, 01 Jun 2026 10:22:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzmx-0000000AbZf-0fgU
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 01 Jun 2026 10:22:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=M9bUPwvZD9u+pXGLJ1fAR+BJ7vzqCtQEZJfnSjvNvKg=; b=iV82WZHtiDwcrQfZAMVf70mKeh
	9XP6LUvcqvlZPzCk8fx70A8mJV2+fzmcBRj2WueSRWYmTCdLU91wtXL/FsJzRY1NqjB+kqHnUozBk
	ciAbr6+nxG9yJGmiele08cjMWsoGY52vuUXXBYuS4ro4xjoJEIGGe+Al7zXmjDQALV3zKrnYeDdag
	LY+B8iRSZdZZXKU0yGH2l6/LYn4ND+iEIpFQxYkdr4DEsVWp+5jKGPWlWyeO4mpEf8Sf/otzJnpl1
	FLQfK4XX4DJ2bfJ23QSda/hn4OeYuQuFIp7FDaQnRbEFTiCasM1j4+fuoeNYM1YLCv3RzTN8wZb33
	cwrWg6fA==;
Received: from out-177.mta1.migadu.com ([95.215.58.177])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzmt-00000006N60-3UqA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 10:22:30 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780309335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=M9bUPwvZD9u+pXGLJ1fAR+BJ7vzqCtQEZJfnSjvNvKg=;
	b=R7fgqcQVY5jCgl30o6B3AMBNCnrDFm3oUwmQn/8UW8Noi8QzcZOUODBKPgofez/OUTwzR2
	aQBDsIkuDJJYBI5h743LyGgd5oSw/LMcXItwktw5q+FUUpCn07CYGIX5sfxSuPAUpqI4rM
	K2H1QMzqyvmkISqjU3CFTP434/VtYF8=
From: Usama Arif <usama.arif@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	david@kernel.org,
	willy@infradead.org,
	ryan.roberts@arm.com,
	linux-mm@kvack.org
Cc: pfalcato@suse.de,
	r@hev.cc,
	jack@suse.cz,
	Andrew Donnellan <andrew+kernel@donnellan.id.au>,
	apopple@nvidia.com,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	brauner@kernel.org,
	catalin.marinas@arm.com,
	dev.jain@arm.com,
	kees@kernel.org,
	kevin.brodsky@arm.com,
	lance.yang@linux.dev,
	Liam R. Howlett <liam@infradead.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ljs@kernel.org,
	mhocko@suse.com,
	npache@redhat.com,
	pasha.tatashin@soleen.com,
	rmclure@linux.ibm.com,
	rppt@kernel.org,
	surenb@google.com,
	vbabka@kernel.org,
	Al Viro <viro@zeniv.linux.org.uk>,
	ziy@nvidia.com,
	hannes@cmpxchg.org,
	kas@kernel.org,
	shakeel.butt@linux.dev,
	kernel-team@meta.com,
	Usama Arif <usama.arif@linux.dev>
Subject: [PATCH v7 0/2] mm: improve large folio readahead for exec memory
Date: Mon,  1 Jun 2026 03:21:16 -0700
Message-ID: <20260601102205.3985788-1-usama.arif@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_112228_294574_E6D9D08F 
X-CRM114-Status: GOOD (  15.66  )
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

Hopefully this is the last revision. The only change from the previous
revision is that the logic for deciding THP order was simplified and
the max is now capped to 2M. Thanks Pedro and Jan for the suggestion
and the dicusssion!

The benchmark results on Neoverse V2 (Grace), arm64 with 64K base pages,
512MB executable file on ext4, averaged over 3 runs:

  Phase      | Baseline     | Patched      | Improvement
  -----------|--------------|--------------|------------------
  Cold fault | 83.4 ms      | 41.3 ms      | 50% faster
  Random     | 76.0 ms      | 58.3 ms      | 23% faster

The patches are on top of mm-unstable from 28 May
(8a74e22643189e0ae339afc91110ddb4cab1941b) which include patch [1]
that make mmap_miss accounting symmetric for VM_SEQ_READ which was pointed
out by sashiko in the previous revision.

[1] https://lore.kernel.org/all/20260525145751.2671248-1-usama.arif@linux.dev/ 

v6 -> v7: https://lore.kernel.org/all/20260528165635.2068012-1-usama.arif@linux.dev/
- Simplify logic and just cap the max THP order to 2M (Pedro and Jan)

v5 -> v6: https://lore.kernel.org/all/20260522162422.3856502-1-usama.arif@linux.dev/
- Based on top of patch [1] (sashiko)
- Changes to commit message to make it more accurate for patch 1 and skip
  mmap_miss decrement as well. (sashiko)
- Keep old behaviour if large folio mappings is not enabled (sashiko).
- sashiko pointed to a TOCTOU data race that was pre-existing. My patch
  could make it worse. Dont make it worse by introducing thp_order local
  variable.

v3 -> v5: https://lore.kernel.org/all/20260402181326.3107102-1-usama.arif@linux.dev/
- (Looks like I messed up the versioning here and went directly form
  v3 to v5.)
- Drop patches for elf thp unmapped area alignment and deal with them
  separately. These patches will just bring folios smaller than PMD
  at the same level as PMD. The 2 patches now should be much easier
  to merge.
- Tackle size of THP for exec pages at the same point as PMD instead
  of tackling using exec_folio_order() (Ryan during LSFMM, Thanks!)

v2 -> v3: https://lore.kernel.org/all/20260320140315.979307-1-usama.arif@linux.dev/
- Take into account READ_ONLY_THP_FOR_FS for elf alignment by aligning
  to HPAGE_PMD_SIZE limited to 2M (Rui)
- Reviewed-by tags for patch 1 from Kiryl and Jan
- Remove preferred_exec_order() (Jan)
- Change ra->order to HPAGE_PMD_ORDER if vma_pages(vma) >= HPAGE_PMD_NR
  otherwise use exec_folio_order() with gfp &= ~__GFP_RECLAIM for
  do_sync_mmap_readahead().
- Change exec_folio_order() to return 2M (cont-pte size) for 64K base
  page size for arm64.
- remove bprm->file NULL check (Matthew)
- Change filp to file (Matthew)
- Improve checking of p_vaddr and p_vaddr (Rui and Matthew)

v1 -> v2: https://lore.kernel.org/all/20260310145406.3073394-1-usama.arif@linux.dev/
- disable mmap_miss logic for VM_EXEC (Jan Kara)
- Align in elf only when segment VA and file offset are already aligned (Rui)
- preferred_exec_order() for VM_EXEC sync mmap_readahead which takes into
  account zone high watermarks (as an approximation of memory pressure)
  (David, or atleast my approach to what David suggested in [1] :))
- Extend max alignment to mapping_max_folio_size() instead of
  exec_folio_order()
 
Usama Arif (2):
  mm: bypass mmap_miss heuristic for VM_EXEC readahead
  mm: use mapping_max_folio_order() for force_thp_readahead order

 mm/filemap.c | 44 +++++++++++++++++++++++++++++---------------
 1 file changed, 29 insertions(+), 15 deletions(-)

-- 
2.52.0


