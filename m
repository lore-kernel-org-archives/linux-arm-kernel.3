Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E68BACDB479
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 14:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lu2CeWA+VPPS4JHI33aOrNdB+BaAOcR/Yw43TnwCPxs=; b=Dtb0cNN9OXxgi7rtsoliUAN+nr
	Y55Yfa2zxNM7SP0U5igNgkaGen1d6e75HoF7KnwVzrcs/Xx7MzBiRDRKUx4k33lmLJQD+6TnnyAr8
	BqDwa9SWCDkO+ISfJU/yWp9e76mHac0+vGpLozPBiEfvHhQI4/mSazWljAi+uGWQ4EBFHW+PnuF3A
	/wp2njpryG16XgGzVjKQfx//+3noK1lcGczKTzNzLScR6wegtof4T3FMt9zn9RbgyFhuQ46fXP/yV
	UTBmZyMMyCKbnTbv9JGOpYLQGx5eupKa1YeGfksEFravt33tySUO26C/LF8i5sTF10gbVdp18w/r3
	pFVubXkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc24M-00000006QxH-3gMN;
	Tue, 23 Jun 2026 14:25:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc24E-00000006QtZ-2YCS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 14:25:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 97CF328FA;
	Tue, 23 Jun 2026 07:25:28 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4D7913F632;
	Tue, 23 Jun 2026 07:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782224733; bh=fS10gyJD6hNVDlRCTCWqDlUxTE/CIecxG3GG47Iz4Hc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qybuawIiH4rO53oExfEHonQMUk6QW6NJ0OAPdfw6j/19po5bj0q9g4rkA7jwcZ1e1
	 l3C6DbUardHveWQwDovZqlkiUpPUPDBS4ORBbTWAFN7beN9dojQ3TaGCvKFKRxtO7a
	 QFMVKC8zbRqiQQtDErdFGijSLITt6U4RKXzqkxwo=
From: Wei-Lin Chang <weilin.chang@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Itaru Kitayama <itaru.kitayama@fujitsu.com>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH 2/3] KVM: arm64: ptdump: Store both mmu and kvm pointers in kvm_ptdump_guest_state
Date: Tue, 23 Jun 2026 15:24:42 +0100
Message-ID: <20260623142443.648972-3-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260623142443.648972-1-weilin.chang@arm.com>
References: <20260623142443.648972-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_072534_699162_336E4D6D 
X-CRM114-Status: GOOD (  13.64  )
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

In the nested case, the nested mmu could be freed when .release() is
called, e.g. another process closes the ptdump debugfs file after the VM
is destroyed. This causes a UAF when the nested mmu is accessed to reach
kvm for kvm_put_kvm(). Store the kvm pointer in kvm_ptdump_guest_state
so that it can be reached without going through the nested mmu.

Fixes: 204f7c018d76 ("KVM: arm64: ptdump: Make KVM ptdump code s2 mmu aware")
Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
---
 arch/arm64/kvm/ptdump.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/ptdump.c b/arch/arm64/kvm/ptdump.c
index 2a6afe67646a..a089e87ea366 100644
--- a/arch/arm64/kvm/ptdump.c
+++ b/arch/arm64/kvm/ptdump.c
@@ -19,7 +19,12 @@
 #define KVM_PGTABLE_MAX_LEVELS	(KVM_PGTABLE_LAST_LEVEL + 1)
 #define S2FNAMESZ		sizeof("0x0123456789abcdef-0x0123456789abcdef-s2-disabled")
 
+/*
+ * Nested mmus could be freed when .release() is called, so also keep the kvm
+ * pointer for kvm_put_kvm().
+ */
 struct kvm_ptdump_guest_state {
+	struct kvm		*kvm;
 	struct kvm_s2_mmu	*mmu;
 	struct ptdump_pg_state	parser_state;
 	struct addr_marker	ipa_marker[MARKERS_LEN];
@@ -133,6 +138,7 @@ static struct kvm_ptdump_guest_state *kvm_ptdump_parser_create(struct kvm_s2_mmu
 	st->ipa_marker[1].start_address = BIT(pgtable->ia_bits);
 
 	st->mmu				= mmu;
+	st->kvm				= kvm_s2_mmu_to_kvm(mmu);
 	return st;
 }
 
@@ -197,11 +203,10 @@ static int kvm_ptdump_guest_open(struct inode *m, struct file *file)
 
 static int kvm_ptdump_guest_close(struct inode *m, struct file *file)
 {
-	struct kvm *kvm = kvm_s2_mmu_to_kvm(m->i_private);
 	void *st = ((struct seq_file *)file->private_data)->private;
 
+	kvm_put_kvm(((struct kvm_ptdump_guest_state *)st)->kvm);
 	kfree(st);
-	kvm_put_kvm(kvm);
 
 	return single_release(m, file);
 }
-- 
2.43.0


