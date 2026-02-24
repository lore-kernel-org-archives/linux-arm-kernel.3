Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FFCAEC112B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 01:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iJQ/3IUSXREjv6iEZ/pBqdTwKOa9f+25GyeUUpRX5oY=; b=PnPVYD8oGRmkAhSW/tf4TKMcZn
	UgZEus+8IdNlzmcNJwBKc/GO7k7iHKJTIDthvroGh/gQqV5ktKWYP0Km+YDO5V8j25oet2/IIzb9H
	axuwJ4rbMKlt5HVBmCjLVz7kya0DFn0CKDDYhmem0+nFzq8xxM7ApIG9tXOfAeV1hzmqlKnngwQsT
	eUcMSh2bwmpnrUZkOD4aYsix8Ez0q/0oALGuVMW51vgJRv6AW3yPd0R26KoNbXqJEdL5zlGR10YOg
	aHNMe2nrkRQS6t+onzrua9fjL3NXl21RToAlDIF+YDDf8CNNjPCL+H3fg8D8AgITgxpeMq5s9wXo2
	VPaO458w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuhfE-00000001JaW-2BRf;
	Tue, 24 Feb 2026 01:56:40 +0000
Received: from out30-118.freemail.mail.aliyun.com ([115.124.30.118])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuhf9-00000001JXM-0zhA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 01:56:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1771898185; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=iJQ/3IUSXREjv6iEZ/pBqdTwKOa9f+25GyeUUpRX5oY=;
	b=T+PoKyC+Y//G4PvcMXxJ0X3FY4vQ/osM1sfzoN8evgMbVRQvMY9kQ7oqINWqcsEa0aC9WKsRVe3TZfFt+zWWO8EsiPQgp0QRB3+2gVMsqSr2TPJNU7T1HuKlwFcI/M3xd9TopL13bI+1UyWIniauvO9nnsBDYR6B/3Q8DxVzR74=
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0Wzhndj1_1771898181 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 24 Feb 2026 09:56:22 +0800
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
Subject: [PATCH 0/5] support batched checking of the young flag for MGLRU
Date: Tue, 24 Feb 2026 09:56:03 +0800
Message-ID: <cover.1771897150.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_175635_720077_D834187B 
X-CRM114-Status: UNSURE (   6.02  )
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

Patch 1,2: cleanup patches.
Patch 3: add a new generic batched PTE helper: test_and_clear_young_ptes().
Patch 4: support batched young flag checking for MGLRU.
Patch 5: implement the Arm64 arch-specific test_and_clear_young_ptes().

[1] https://lore.kernel.org/all/cover.1770645603.git.baolin.wang@linux.alibaba.com/

Baolin Wang (5):
  mm: use inline helper functions instead of ugly macros
  mm: rmap: add a ZONE_DEVICE folio warning in folio_referenced()
  mm: add a batched helper to clear the young flag for large folios
  mm: support batched checking of the young flag for MGLRU
  arm64: mm: implement the architecture-specific
    test_and_clear_young_ptes()

 arch/arm64/include/asm/pgtable.h | 18 +++++++----
 include/linux/mmu_notifier.h     | 54 --------------------------------
 include/linux/mmzone.h           |  5 +--
 include/linux/pgtable.h          | 36 +++++++++++++++++++++
 mm/internal.h                    | 54 ++++++++++++++++++++++++++++++++
 mm/rmap.c                        | 31 +++++++++---------
 mm/vmscan.c                      | 37 +++++++++++++++++-----
 7 files changed, 151 insertions(+), 84 deletions(-)

-- 
2.47.3


