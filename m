Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD8BAC531FB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 14:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X/Bzn0MKqMj/2FTtRSKPLpRolUFvSyK4iBPHz7z4Qfc=; b=KLzquhbfragBk6A74IWmueKmih
	8A/r7QGF5J14wsKvXkogyyrgADY/N++g3UK/spvphCcVdR/HH7ditvlkGA7tpKt9t6U+lcLr5mRzi
	kdcF59c/5WMOz6P4JRDodeNeR9utzbAn4NIY4JIagtfCPuyteyCkjimw9WxWHX/HewU0riNF6Uzgx
	U4qdHnAy/JlyjJz4rcKVCIi3v3fyhPnz8vavipzPPzlI1YBHodm/lPF7oVxPQfrLm64HeqXQN9yAI
	Nz9rzoW/lkTJh7MdLQUDYLQJsaZjqUTGCPXGVUXnVEgXMLQ507/tcH+gvZoW83mp7LVK23Dy5/go3
	bcmBNuQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtR8Y-0000000EhHB-2qB9;
	Fri, 20 Feb 2026 14:05:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtR8U-0000000EhEy-3IEl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 14:05:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9E7BD6185C;
	Fri, 20 Feb 2026 14:05:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C40EFC116D0;
	Fri, 20 Feb 2026 14:05:35 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Mark Brown <broonie@kernel.org>,
	Will Deacon <will@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Emanuele Rocca <emanuele.rocca@arm.com>,
	Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 0/3] arm64: Assorted GCS fixes
Date: Fri, 20 Feb 2026 14:05:28 +0000
Message-ID: <20260220140532.285011-1-catalin.marinas@arm.com>
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

The first patch fixes a kernel panic when LPA2 is enabled together with
GCS because of the PTE_SHARED bits in _PAGE_GCS{,RO} overlapping with
OA[9:8].

The second patch allows PROT_NONE mappings even with GCS, useful for
NUMA balancing.

The third patch is an optimisation that was added to the normal stacks
as well (when mapped with MAP_STACK) as it doesn't make sense to use a
THP for a small GCS mapping. This patch also updates the do_mmap() call
in alloc_gcs() to use PROT_WRITE instead of VM_WRITE for consistency.

Thanks.

Catalin Marinas (3):
  arm64: gcs: Do not set PTE_SHARED on GCS mappings if FEAT_LPA2 is
    enabled
  arm64: gcs: Allow PAGE_NONE mappings for NUMA balancing
  arm64: gcs: Do not map the guarded control stack as THP

 arch/arm64/include/asm/pgtable-prot.h |  4 ++--
 arch/arm64/mm/gcs.c                   |  8 ++++++--
 arch/arm64/mm/mmap.c                  | 10 +++++++++-
 3 files changed, 17 insertions(+), 5 deletions(-)


