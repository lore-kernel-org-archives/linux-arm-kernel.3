Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44FDFFD5323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 09:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X8e+sid83UVQcVbpwgH4NtgpV2iaHgcz/z9sPbv8Yyw=; b=eUx0l2WiAOdGvLw9tJJ5/4pePS
	dkiGxUSDHdU+YNuwg68mUtB42DpTOgg5JHjJD3qjeaMcSdEfnm8DDjpYML4CH4UwrDjj5Fp+lV4sz
	VMiieUe/TqrRwyTvOcbWDPutbNKpYTp16SMbf3tKoxfM5uFTnsr0HqDXVcsE07LWMgH9QN1wAvPe3
	BKFlbINX9bKUC8q2L9/UYzMGXx7qGChfGdilBpeu9vRuOzG467bWE8GR/SJySb8RxvAWMngbQdWUT
	uejh6BEJhmdNdZs28zRfWIw+PwAmBSVycM3yQ5wZJDVQuoCDl2bijq+KTVgA2OnJx1br1viK4ybxk
	hMWJ1Mnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvuQz-00000008AUl-2ggK;
	Fri, 27 Feb 2026 09:46:57 +0000
Received: from out30-112.freemail.mail.aliyun.com ([115.124.30.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvuQu-00000008A0B-1KIo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 09:46:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1772185493; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=X8e+sid83UVQcVbpwgH4NtgpV2iaHgcz/z9sPbv8Yyw=;
	b=yjJq43Ajb3W/Bp7UYOEdNgh8s3UkeWSEYEDWKDUH8kV1sEHwSR4UAe7KP0yD4MZFBBpIAIbBzRPGFS13CL3q1m8PVe4gBqakDHuBbeyt1mb+jBvLyFYRUndpCgBbl4N/+h+LXpBDmaFiARzeS/jlHgO/7BPcdQXb2BhXwyPdRWQ=
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0Wzu.cBW_1772185489 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 27 Feb 2026 17:44:50 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org,
	david@kernel.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	lorenzo.stoakes@oracle.com,
	ryan.roberts@arm.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	riel@surriel.com,
	harry.yoo@oracle.com,
	jannh@google.com,
	willy@infradead.org,
	baohua@kernel.org,
	dev.jain@arm.com,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	hannes@cmpxchg.org,
	zhengqi.arch@bytedance.com,
	shakeel.butt@linux.dev,
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] support batched checking of the young flag for MGLRU
Date: Fri, 27 Feb 2026 17:44:34 +0800
Message-ID: <cover.1772185080.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_014653_502937_482D61D8 
X-CRM114-Status: UNSURE (   9.53  )
X-CRM114-Notice: Please train this message.
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

This is a follow-up to the previous work [1], to support batched checking
of the young flag for MGLRU.

Similarly, batched checking of young flag for large folios can improve
performance during large-folio reclamation when MGLRU is enabled. I
observed noticeable performance improvements (see patch 5) on an Arm64
machine that supports contiguous PTEs. All mm-selftests are passed.

Patch 1 - 3: cleanup patches.
Patch 4: add a new generic batched PTE helper: test_and_clear_young_ptes().
Patch 5: support batched young flag checking for MGLRU.
Patch 6: implement the Arm64 arch-specific test_and_clear_young_ptes().

[1] https://lore.kernel.org/all/cover.1770645603.git.baolin.wang@linux.alibaba.com/

Changes from v1:
v1: https://lore.kernel.org/all/cover.1771897150.git.baolin.wang@linux.alibaba.com/
 - Update some commit message (per David).
 - Fix some coding style issues (per David).
 - Use VM_WARN_ON_ONCE_FOLIO() instead of VM_WARN_ON_FOLIO() (per Rik).
 - Define a generic ptep_test_and_clear_young_notify() (per David).
 - Remove redundant 'nr > 1' check in folio_referenced_one() (per David).
 - Rename some variables' to make code more clear (per David).
 - Add a new patch to rename some functions (per David).
 - Update the young counters with the batched count for MGLRU.
 - Collect reviewed tags from Rik, Barry, Alistair and David. Thanks.

Baolin Wang (6):
  mm: use inline helper functions instead of ugly macros
  mm: rename ptep/pmdp_clear_young_notify() to
    ptep/pmdp_test_and_clear_young_notify()
  mm: rmap: add a ZONE_DEVICE folio warning in folio_referenced()
  mm: add a batched helper to clear the young flag for large folios
  mm: support batched checking of the young flag for MGLRU
  arm64: mm: implement the architecture-specific
    test_and_clear_young_ptes()

 arch/arm64/include/asm/pgtable.h | 18 +++++++----
 include/linux/mmu_notifier.h     | 54 --------------------------------
 include/linux/mmzone.h           |  5 +--
 include/linux/pgtable.h          | 38 ++++++++++++++++++++++
 mm/internal.h                    | 52 ++++++++++++++++++++++++++++++
 mm/rmap.c                        | 29 ++++++++---------
 mm/vmscan.c                      | 46 ++++++++++++++++++++-------
 7 files changed, 154 insertions(+), 88 deletions(-)

-- 
2.47.3


