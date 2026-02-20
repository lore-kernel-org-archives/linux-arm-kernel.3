Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6795CC561F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 14:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7BQiMm9EDljXVK89YLTTv3lxnVMYvGYEui+NSrdtdOU=; b=SD/ACu/ggpDQ9x/bN51ATLDzMe
	my2/ZkMu2PMSG1kVQfbd35lMktqRSANfuS7+CYJQU3G9AqjPWD7hj6RRGMa/9QAUOTB4vK0Vikn9Q
	BycdhvM7vwH8D91AyRAm/jDbbrgnow/aM4J//Rw2E1K19KM68hRbgB4jw2U4A8KiZtpqOYv5LKtzb
	xv/6esVM4A/tShmmtUCoCVQ1hDHiUHkR7WZWhbVb3D7H4voV7RWRFigU1/IJ2mjzDjeGgwJx7O4/S
	JfZ0/qLSVObEzpZkHuB11OiVlXTvCiv2TCH8lTS2OsYZc22wLsJq3tRF1G8rdQI5tKyB7VzJoOKak
	GDlPdmwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtR8b-0000000EhIy-2KuP;
	Fri, 20 Feb 2026 14:05:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtR8Z-0000000EhHU-0qrI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 14:05:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E5F6E41988;
	Fri, 20 Feb 2026 14:05:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DB72C116D0;
	Fri, 20 Feb 2026 14:05:41 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Mark Brown <broonie@kernel.org>,
	Will Deacon <will@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Emanuele Rocca <emanuele.rocca@arm.com>,
	Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 3/3] arm64: gcs: Do not map the guarded control stack as THP
Date: Fri, 20 Feb 2026 14:05:31 +0000
Message-ID: <20260220140532.285011-4-catalin.marinas@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260220140532.285011-1-catalin.marinas@arm.com>
References: <20260220140532.285011-1-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_060543_279431_3C2BA51B 
X-CRM114-Status: GOOD (  14.15  )
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

The default GCS size allocated on first prctl() for the main thread or
subsequently on clone() is either half of RLIMIT_STACK or half of a
thread's stack size. Both of these are likely to be suitable for a THP
allocation and the kernel is more aggressive in creating such mappings.
However, it does not make much sense to use a huge page as it didn't
make sense for the normal stacks either. See commit c4608d1bf7c6 ("mm:
mmap: map MAP_STACK to VM_NOHUGEPAGE").

Force VM_NOHUGEPAGE when allocating/mapping the GCS. As per commit
7190b3c8bd2b ("mm: mmap: map MAP_STACK to VM_NOHUGEPAGE only if THP is
enabled"), only pass this flag if TRANSPARENT_HUGEPAGE is enabled as not
to confuse CRIU tools.

While at it, use the PROT_WRITE prot argument rather than the VM_WRITE
flag when calling do_mmap().

Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: David Hildenbrand <david@kernel.org>
---
 arch/arm64/mm/gcs.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/mm/gcs.c b/arch/arm64/mm/gcs.c
index 6e93f78de79b..bbdb62ae47cd 100644
--- a/arch/arm64/mm/gcs.c
+++ b/arch/arm64/mm/gcs.c
@@ -13,15 +13,19 @@
 static unsigned long alloc_gcs(unsigned long addr, unsigned long size)
 {
 	int flags = MAP_ANONYMOUS | MAP_PRIVATE;
+	vm_flags_t vm_flags = VM_SHADOW_STACK;
 	struct mm_struct *mm = current->mm;
 	unsigned long mapped_addr, unused;
 
 	if (addr)
 		flags |= MAP_FIXED_NOREPLACE;
 
+	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE))
+		vm_flags |= VM_NOHUGEPAGE;
+
 	mmap_write_lock(mm);
-	mapped_addr = do_mmap(NULL, addr, size, PROT_READ, flags,
-			      VM_SHADOW_STACK | VM_WRITE, 0, &unused, NULL);
+	mapped_addr = do_mmap(NULL, addr, size, PROT_READ | PROT_WRITE,
+			      flags, vm_flags, 0, &unused, NULL);
 	mmap_write_unlock(mm);
 
 	return mapped_addr;

