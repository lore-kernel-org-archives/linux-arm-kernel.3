Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD59EC1112
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 17:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qy4maK+KR8yxiKmf2BYndKcRTlzXJBYQivjKLPq5DAc=; b=gz39P/Jc9q9m9HbRJuz7HFy/k7
	8TmyYVu8VTIvrHqmgwOs1NoZKnWksJXMAKQ3F+6q5dKqWpzwMc6ArgIXzMoq4F6GOGLVmmEshc0bg
	XSi4PkQlkGCE8/tEsYUn/M8CHXe4aS6eoYFyr5oGnmJUHjfqkE9M7Va+OLnXVF/GKM/0QPnJUa50B
	n5YK6cJlp9FIP+op13t62lW1I7MZOmvG/xXgS+BDXUwv3UuQ7amY81XXWLaDxKB+6R+MvpwDlOCWT
	yjWVOpTA+yFQWmkql27jYZpcxnQZSBbvI6hnBiedIEZ2bccqFOwAzkLGkfUuZLECPjypKZRRFfQ80
	bAtf5xxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vua05-00000000oKf-3DO2;
	Mon, 23 Feb 2026 17:45:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vua04-00000000oKT-3O5l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 17:45:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AA5196013F;
	Mon, 23 Feb 2026 17:45:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B0D3C116C6;
	Mon, 23 Feb 2026 17:45:36 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Mark Brown <broonie@kernel.org>,
	Will Deacon <will@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Emanuele Rocca <emanuele.rocca@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v2 0/3] arm64: Assorted GCS fixes
Date: Mon, 23 Feb 2026 17:45:29 +0000
Message-ID: <20260223174533.1478164-1-catalin.marinas@arm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

A couple of GCS fixes and a corresponding kselftest. The first fix
solves a kernel panic when LPA2 is present. The second ensures that the
shadow stack is not accessible after mprotect(PROT_NONE). The test is
fairly close to gcs_write_fault.c but performs a normal read from the
shadow stack before and after mprotect(PROT_NOTE).

v1 here:

https://lore.kernel.org/all/20260220140532.285011-1-catalin.marinas@arm.com/

Changes since v1:

- I dropped the VM_NOHUGEPAGE patch from this series. I'll submit a
  separate one that also changes riscv and x86 for consistency.

- Added a gcs_page_prot variable to store the protection for the gcs
  page, somewhat closer to what we do with protection_map[]. There are
  other ways to implement this, e.g. using PTE_MAYBE_SHARED or starting
  from protection_map[] and replacing the PIE bits with those from
  _PAGE_GCS_RO.

- The PROT_NONE patch was updated to drop the NUMA migration reference
  (this path is not exercised in that case), mention mprotect() instead.
  In addition, it checks VM_ACCESS_FLAGS instead of VM_READ|VM_WRITE.

- Added kselftest for the GCS PROT_NONE case.

Thanks.

Catalin Marinas (3):
  arm64: gcs: Do not set PTE_SHARED on GCS mappings if FEAT_LPA2 is
    enabled
  arm64: gcs: Honour mprotect(PROT_NONE) on shadow stack mappings
  kselftest: arm64: Check access to GCS after mprotect(PROT_NONE)

 arch/arm64/include/asm/pgtable-prot.h         |  3 -
 arch/arm64/mm/mmap.c                          | 12 ++-
 .../signal/testcases/gcs_prot_none_fault.c    | 76 +++++++++++++++++++
 3 files changed, 86 insertions(+), 5 deletions(-)
 create mode 100644 tools/testing/selftests/arm64/signal/testcases/gcs_prot_none_fault.c


