Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB9B2C531FB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 14:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mINXxlsdYALD+csSUpLTXhNqbRHTbJCWklXQdcpx0qc=; b=nPTn6I4hFZHWmqH/LAu7Msmwnk
	lfV5A5chTs/d+wINQZEJp2vDLpmIcSdGJIuNZhtFWt4iwzDQMQR596kTr/gTjM8susGoLs9FujcLh
	QoLp3A/ThMYcs5ifkGJKGcXDtfponCCPfaQKpTj9DPrjiGW35Jeu1O5hb64bDs/03XRQSEbPrGjJg
	Ep4FtmkSPr6HIi33Xj8LPMz8y+vOoaRx6ok/KfvUQa26iBNECgxKQprAbn/h20lh9vd8HKjTFK+9V
	IF8UUc0s5s2G2XClBObutUUeSJElw644wgEBJMEmmPTy1EtxdvvMTMXyhyZjOUu9YKq4EvSfMkHnZ
	Db9pjFyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtR8a-0000000EhI4-411r;
	Fri, 20 Feb 2026 14:05:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtR8X-0000000EhGl-3oz8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 14:05:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 53D286185E;
	Fri, 20 Feb 2026 14:05:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83824C116C6;
	Fri, 20 Feb 2026 14:05:39 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Mark Brown <broonie@kernel.org>,
	Will Deacon <will@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Emanuele Rocca <emanuele.rocca@arm.com>,
	Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 2/3] arm64: gcs: Allow PAGE_NONE mappings for NUMA balancing
Date: Fri, 20 Feb 2026 14:05:30 +0000
Message-ID: <20260220140532.285011-3-catalin.marinas@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260220140532.285011-1-catalin.marinas@arm.com>
References: <20260220140532.285011-1-catalin.marinas@arm.com>
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

vm_get_page_prot() short-circuits the protection_map[] lookup for a
VM_SHADOW_STACK mapping since its permissions are special. However, it
also ignores PAGE_NONE mappings used for NUMA balancing by creating an
accessible PTE.

Special-case the VM_NONE permission to create an invalid PTE even if it
is a GCS mapping.

Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Fixes: 6497b66ba694 ("arm64/mm: Map pages for guarded control stack")
Cc: <stable@vger.kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: David Hildenbrand <david@kernel.org>
---
 arch/arm64/mm/mmap.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/mm/mmap.c b/arch/arm64/mm/mmap.c
index 2e404441063b..f8993e3fa5d1 100644
--- a/arch/arm64/mm/mmap.c
+++ b/arch/arm64/mm/mmap.c
@@ -87,7 +87,15 @@ pgprot_t vm_get_page_prot(vm_flags_t vm_flags)
 
 	/* Short circuit GCS to avoid bloating the table. */
 	if (system_supports_gcs() && (vm_flags & VM_SHADOW_STACK)) {
-		prot = pgprot_val(PAGE_GCS_RO);
+		/*
+		 * Allow PAGE_NONE for NUMA balancing, otherwise use
+		 * PAGE_GCS_RO. The permission will be made writeable
+		 * (PAGE_GCS) on a GCS fault.
+		 */
+		if (vm_flags & (VM_READ | VM_WRITE))
+			prot = pgprot_val(PAGE_GCS_RO);
+		else
+			prot = pgprot_val(protection_map[VM_NONE]);
 	} else {
 		prot = pgprot_val(protection_map[vm_flags &
 				   (VM_READ|VM_WRITE|VM_EXEC|VM_SHARED)]);

