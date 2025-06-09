Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8849AC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 09:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cK2j777cnaxXBti4lkzIOlhE/fKnF3rLuqH45kppVuU=; b=FFFSgpxNUwaM8bkwmPvKkU8wpJ
	rjFWJV6G4YwybXfgcTS3NrSdvY6WYFS1n2FsnPblGv2Fg4QX/zACTCBEW60UmUTDNV7lYtETezOro
	7+lHOgpN64KEDSs7Mlx5UrnN6ZSysyKWa+FuSQF8u5PHD7lS0CQVmoNyGOQVotywpVfTyn7JPxdOC
	VXzYp4lHh/Pw0qdKNYDZhABmflwWldVDR+9jbxS4ko4XghCMr4XOBxEZsX4tlyxFb7zpwX3KkKl3K
	55Q5UcILbZ8cmsC0zsz4kG7DVGb48iOPLFe3l5M50CWIxeVlr3UY7Cy+HIPEI+9IN3ZTRCN/pjteF
	IR14ElaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOYr8-00000003n3s-1NcB;
	Mon, 09 Jun 2025 09:31:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOYn8-00000003m6Z-0vtm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 09:27:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ACCF1150C;
	Mon,  9 Jun 2025 02:27:20 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 490FA3F59E;
	Mon,  9 Jun 2025 02:27:37 -0700 (PDT)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	David Hildenbrand <david@redhat.com>,
	Dave Chinner <david@fromorbit.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Kalesh Singh <kaleshsingh@google.com>,
	Zi Yan <ziy@nvidia.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v5 0/5] Readahead tweaks for larger folios
Date: Mon,  9 Jun 2025 10:27:22 +0100
Message-ID: <20250609092729.274960-1-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_022742_353421_37F3FE0A 
X-CRM114-Status: GOOD (  15.75  )
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

Hi All,

This series adds some tweaks to readahead so that it does a better job of
ramping up folio sizes as readahead extends further into the file. And it
additionally special-cases executable mappings to allow the arch to request a
preferred folio size for text.

Originally the series focussed on the latter part only (large folios for text).
See [3]. But after discussion with Matthew Wilcox, v4 switched to additionally
fix some of the unintended behaviours in how a folio size is selected in general
before special-casing for text. As a result patches 1-4 make folio size
selection behave more sanely, then patch 5 introduces large folios for text.
Patch 5 depends on patch 1, but does not depend on patches 2-4.

---

I've run a number of benchmarks and observed no regressions. mm selftests also
shows no regressions vs mm-unstable. Selected benchmark results are presented in
the commit log for the final patch.

Most patches have R-b/A-b now so would be good to get into linux-next for some
soak testing when possible.

Applies on top of today's mm-unstable (a32230de8810).

Changes since v4 [4]
====================

- Added R-b/A-b (thanks all!)
- Patch 1:
  - Removed ra->size fallback check in page_cache_ra_order() (Pankaj)
- Patch 2:
  - Modify ra end alignment to handle non-power-of-2 optimal ra sizes (Jan)
- Patch 4:
  - Only reset order to 0 if fallback is due to not supporting large folios
    (Jan)
- Patch 5:
  - Ignore VM_RAND_READ for VM_EXEC mappings in favour of following the new
    VM_EXEC code path since code is always random (Will)

Changes since v3 [3]
====================

 - Added patchs 1-4 to do better job of ramping up folio order
 - In patch 5:
   - Confine readahead blocks to vma boundaries (per Kalesh)
   - Rename arch_exec_folio_order() to exec_folio_order() (per Matthew)
   - exec_folio_order() now returns unsigned int and defaults to order-0
     (per Matthew)
   - readahead size is honoured (including when disabled)

Changes since v2 [2]
====================

 - Rename arch_wants_exec_folio_order() to arch_exec_folio_order() (per Andrew)
 - Fixed some typos (per Andrew)

Changes since v1 [1]
====================

 - Remove "void" from arch_wants_exec_folio_order() macro args list

[1] https://lore.kernel.org/linux-mm/20240111154106.3692206-1-ryan.roberts@arm.com/
[2] https://lore.kernel.org/all/20240215154059.2863126-1-ryan.roberts@arm.com/
[3] https://lore.kernel.org/linux-mm/20250327160700.1147155-1-ryan.roberts@arm.com/
[4] https://lore.kernel.org/linux-mm/20250430145920.3748738-1-ryan.roberts@arm.com/

Thanks,
Ryan

Ryan Roberts (5):
  mm/readahead: Honour new_order in page_cache_ra_order()
  mm/readahead: Terminate async readahead on natural boundary
  mm/readahead: Make space in struct file_ra_state
  mm/readahead: Store folio order in struct file_ra_state
  mm/filemap: Allow arch to request folio size for exec memory

 arch/arm64/include/asm/pgtable.h |  8 +++++
 include/linux/fs.h               |  4 ++-
 include/linux/pgtable.h          | 11 ++++++
 mm/filemap.c                     | 62 ++++++++++++++++++++++++--------
 mm/internal.h                    |  3 +-
 mm/readahead.c                   | 36 ++++++++++---------
 6 files changed, 89 insertions(+), 35 deletions(-)

--
2.43.0


