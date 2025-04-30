Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC01C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 15:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hvyBASHyC+YJ/AQDfp5OteL24N2sH4yo5lpIbele6wQ=; b=15/K7eS7ymkV/zCxW+uBVTlVX1
	AQvLPhwaMhw5O0DqcwNTUzLUXgziOKkv0VJqUBaO7INB8fi6OiVUyl4m1RkrQ6DNtgBo5D00kWASl
	9oMRFIjCm+nHXt7jrIqmHrKp7ov1fsoUSdpp8qt0LrMv6gBvcU8biCuZVY4AvmXBHkPu4d8X0s2Tz
	7s0SCaYn+xiBA4uUBy6a+OoOl2NKFGn6uV8S/qUbv97cdHxdtebvAMg7hJjgMng+5YH7uBiC1gje1
	AAS069V6hi38HeedXxM4xpMBKJPsLBi2UT6TAPhH7FTG6wYPGewQwV3qd7QaE0tK7sTMANKNi/ChM
	3diZw0eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA8xZ-0000000DDKJ-1YAN;
	Wed, 30 Apr 2025 15:02:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA8uK-0000000DCOV-2SBT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 14:59:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 66C201007;
	Wed, 30 Apr 2025 07:59:24 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B37EC3F5A1;
	Wed, 30 Apr 2025 07:59:29 -0700 (PDT)
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
Subject: [RFC PATCH v4 0/5] Readahead tweaks for larger folios
Date: Wed, 30 Apr 2025 15:59:13 +0100
Message-ID: <20250430145920.3748738-1-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_075932_665657_6B6D5F58 
X-CRM114-Status: GOOD (  13.01  )
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

This RFC series adds some tweaks to readahead so that it does a better job of
ramping up folio sizes as readahead extends further into the file. And it
additionally special-cases executable mappings to allow the arch to request a
preferred folio size for text.

Previous versions of the series focussed on the latter part only (large folios
for text). See [3]. But after discussion with Matthew Wilcox last week, we
decided that we should really be fixing some of the unintended behaviours in how
a folio size is selected in general before special-casing for text. As a result
patches 1-4 make folio size selection behave more sanely, then patch 5
introduces large folios for text. Patch 5 depends on patch 1, but does not
depend on patches 2-4.

---

I'm leaving this marked as RFC for now as I intend to do more testing, and
haven't yet updated the benchmark results in patch 5 (although I expect them to
be similar).

Applies on top of Monday's mm-unstable (b18dec6a6ad3) and passes all mm
kselftests.

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
 include/linux/pgtable.h          | 11 +++++++
 mm/filemap.c                     | 55 ++++++++++++++++++++++++--------
 mm/internal.h                    |  3 +-
 mm/readahead.c                   | 27 +++++++++-------
 6 files changed, 81 insertions(+), 27 deletions(-)

--
2.43.0


