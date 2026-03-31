Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF01B109B489
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 15:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lDpExs/K1kAfh1D6reYdmnVzIcrkKbY76UdcdsW1gdk=; b=G2OqAit6ZIV+Ha59we6aBWjUWr
	p/rjj55JkOLnirbskHdS87UvfotdmeFjJ0piGEMC1hLeQtARcVGf9bJfy18SUhsC0+nQPKPB9mBBO
	V3Nsbk+N6jjO6y4TppSON6fE+t9bmrWmj0O5YnwapvMX6IItTX1drt50SABgGWVTz7++5Dmu8H4Yz
	eBC3pmf+GGJ10bjKGPjKt4Ahg7PXpslkFs11umrEeiX8vzY0KOVexfEq4TxzOHxYNEs/GCfX7DwO3
	Ls7NDMfUdtSlSggJhOAx7zQ+8fQESP8RKT74Xa2v5yjFyYzmf0gJZImkxEV7GxbZiwN8VJQJ1yeg2
	6qrlLSiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7bNe-0000000DD7R-3NnZ;
	Tue, 31 Mar 2026 15:51:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7bNT-0000000DD3L-04g4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 15:51:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8A71743BC1;
	Tue, 31 Mar 2026 15:51:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3936C2BCB1;
	Tue, 31 Mar 2026 15:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774972298;
	bh=GL1xt9IrccrXv3S/Wi41bhBc0pdwWweVffmPPWUmVYc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k+JdlVkF4Yy9bwV1wbUwaYJnX0dGFMhaXiUE7SGeQQY08XYvCOEPeA+AxWj1FaUVa
	 RxrAzaFZnwQNsksh7370CzSDaitvvKfn1yGoVJU/0E4Q6e7Xqan3slrjCzyMOUSVOf
	 ig3aA/+dE+yqwTU7UUJYLJuUU4XFVULh2CABNJuoblwgEx+sFoYS8yOVmr9vi92O6e
	 UpaCzZhTH5orTbF/Z/qXMkiH5ujnw2CrvTvM32bhQYCc0xSOr/01P6UD+Afvn8PHRP
	 IrN5+EgMnUOWNvnhDgBHaSEWVMRELhSh0fU3ssgrqsxQwjm1pDt9Q/Y2AiCPGrePxh
	 3Xt3OFzLbg7eg==
From: Will Deacon <will@kernel.org>
To: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: [PATCH 3/3] KVM: arm64: Don't hold 'vm_table_lock' across guest page reclaim
Date: Tue, 31 Mar 2026 16:50:55 +0100
Message-ID: <20260331155056.28220-4-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260331155056.28220-1-will@kernel.org>
References: <20260331155056.28220-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_085139_078563_82A87700 
X-CRM114-Status: GOOD (  11.37  )
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

Now that the teardown of a VM cannot be finalised as long as a reference
is held on the VM, rework __pkvm_reclaim_dying_guest_page() to hold a
reference to the dying VM rather than take the global 'vm_table_lock'
during the reclaim operation.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/hyp/nvhe/pkvm.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index b955da0e50bc..7ed96d64d611 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -918,15 +918,16 @@ teardown_donated_memory(struct kvm_hyp_memcache *mc, void *addr, size_t size)
 
 int __pkvm_reclaim_dying_guest_page(pkvm_handle_t handle, u64 gfn)
 {
-	struct pkvm_hyp_vm *hyp_vm;
+	struct pkvm_hyp_vm *hyp_vm = get_pkvm_hyp_vm(handle);
 	int ret = -EINVAL;
 
-	hyp_spin_lock(&vm_table_lock);
-	hyp_vm = get_vm_by_handle(handle);
-	if (hyp_vm && hyp_vm->kvm.arch.pkvm.is_dying)
-		ret = __pkvm_host_reclaim_page_guest(gfn, hyp_vm);
-	hyp_spin_unlock(&vm_table_lock);
+	if (!hyp_vm)
+		return ret;
 
+	if (hyp_vm->kvm.arch.pkvm.is_dying)
+		ret = __pkvm_host_reclaim_page_guest(gfn, hyp_vm);
+
+	put_pkvm_hyp_vm(hyp_vm);
 	return ret;
 }
 
-- 
2.53.0.1118.gaef5881109-goog


