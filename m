Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B30C1CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 14:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+achPiyUjzFOJHcqt61YQ/iI9hmctD4cHJ1b1UoyCog=; b=X3I3geL7aJd0SOzuR42K427Koq
	dGt5v8VuARMnTjwDAxQgZ026+UlhOzUmQsY15ZbtzUsi56Yw8MBEFEnW9vS47t8SXxBLYM2g0hwSl
	yrHcIIxu2qpwzqLZVf1h4j0/Cz7Da5cnwgP+DnhovPV1Kisde3XQ92hYva6hdG/YWcOCjLwLcShAN
	duCPHuoQNHp9Rkq0SnPUUZRu1py5QNtq0R7td32WXpd0W0Sd/vAXpWSrXlgcQsFeJhqA16OLEMSdm
	isefoB43MopGgMjS/4SwLqGOCOcoa0LQKzNAG4cTkrsE9eQ+3vPY0K7YCQU3hO/dtcRkWAO60Qc2x
	ba7VTzqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM5Y0-0000000Aytx-1rd1;
	Sun, 10 May 2026 14:54:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM5Xx-0000000Ays1-3HQb
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 14:54:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 36B1228FA;
	Sun, 10 May 2026 07:54:13 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 25B0C3F836;
	Sun, 10 May 2026 07:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778424858; bh=uk0eSquGGjcstKJbba70+RhN+eJ4xKDzik20lhfjNtI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q2eMloWXtpOSzZYz4AQ44H/DWTx0bvACoXQ+WUgU/0tTPnrvVXDAzbhctBDWaPtGR
	 8QFnsqI7rU59xnQdcHSO/xiZQYE5mTE2ZpkYr/j3n5ehHOfnV2hro4Mi/9d+1QCjMk
	 EJ6ttFTf/V52tlfViLCFn2FZnvGeIjQzCnxa4FLg=
From: Wei-Lin Chang <weilin.chang@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH v3 2/5] KVM: arm64: Move shadow_pt_debugfs_dentry to reduce holes in kvm_s2_mmu
Date: Sun, 10 May 2026 15:53:35 +0100
Message-ID: <20260510145338.322962-3-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260510145338.322962-1-weilin.chang@arm.com>
References: <20260510145338.322962-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_075421_879169_38C99D04 
X-CRM114-Status: GOOD (  10.23  )
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

dentry pointer shadow_pt_debugfs_dentry was placed between two booleans
in kvm_s2_mmu, which created unnecessary holes in the struct. Move it so
the two booleans connect.

Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
---
 arch/arm64/include/asm/kvm_host.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 851f6171751c..1a56d137df10 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -217,16 +217,16 @@ struct kvm_s2_mmu {
 	 */
 	bool	nested_stage2_enabled;
 
-#ifdef CONFIG_PTDUMP_STAGE2_DEBUGFS
-	struct dentry *shadow_pt_debugfs_dentry;
-#endif
-
 	/*
 	 * true when this MMU needs to be unmapped before being used for a new
 	 * purpose.
 	 */
 	bool	pending_unmap;
 
+#ifdef CONFIG_PTDUMP_STAGE2_DEBUGFS
+	struct dentry *shadow_pt_debugfs_dentry;
+#endif
+
 	/*
 	 *  0: Nobody is currently using this, check vttbr for validity
 	 * >0: Somebody is actively using this.
-- 
2.43.0


