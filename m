Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6EA606A332
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 13:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IKY6q+rg;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=aX23+1+G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vzUCBfEqZA71dS3jLvdXgp0iBiHaOT4PnmGdXf9hgiI=; b=IKY6q+rgRR1AdH
	03AHVySFL2b155rU+Co94y7uHpM3pzz+oVc3by0yRSI2HLmMToS1NZKU60LP+0u8Weo4ilcDo0ECb
	SaNEaaiHVG+Nrha33jhMI2BxTbcp0E/akQDMlH95HHc4hfhqlXzCZrbioR6F6rTiviYGL39b2/SY2
	kvozXO/kkH8jR/kwrJb43K7WTgkvN/ndu9aOKwbxFjjPvp1yl6ot/WIfqA1+XdKSfKH1Z7MSiArli
	yk0ihJJFatkNoKR/pKxlTm5BEuHnjO8nd43GI8IxItxhlqNrpXmPFkcf28lurnBY1QNXhjgrTJVNP
	MXw0uzycfGuHrZVhbbtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNrfe-0000000GXht-2w0w;
	Mon, 02 Nov 2026 13:01:54 +0000
Received: from out-48.mta0.migadu.com ([2001:41d0:1004:224b::30] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNrfb-0000000GXgC-33Ah
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 13:01:53 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=ic6nIPaRt569Q39hvXzAm3CJLBkg+LPeh9WqbciieLg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793624509; v=1; x=1794229309;
 b=aX23+1+GSfAb4heSxPGHbC4itt2et46sZoOAiZzTKmW840sXVuY9VVvs7iuP2g0p6XIr4ZtB
 D70KVPSkJD85JQLfPLdZcrEAm/ntdwQoCe2F1k8fZRvY0Wzus5SWWTxj6k9dgaqFT6+cqpUEkwW
 RNZwAVKLeVYlw7/Un/lEOopg=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id a1dd30557d3ae716;
	Mon, 02 Nov 2026 13:01:49 +0000
X-Mizu-Trace-ID: a1dd30557d3ae716
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Sebastian Ene <sebastianene@google.com>,
	=?UTF-8?q?Bart=C5=82omiej=20Grzesik?= <bgrzesik@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Zenghui Yu <zenghui.yu@linux.dev>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Radu Rendec <radu@rendec.net>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 02/13] KVM: arm64: Take host-registered MMIO regions at pKVM finalisation
Date: Mon,  2 Nov 2026 13:01:22 +0000
Message-ID: <20261102130133.3684226-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102130133.3684226-1-fuad.tabba@linux.dev>
References: <20261102130133.3684226-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_050152_490453_97A15C72 
X-CRM114-Status: GOOD (  17.48  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Sebastian Ene <sebastianene@google.com>

To mediate a device, the protected KVM hypervisor has to own its
registers, so that a host access to them takes a stage-2 abort rather
than reaching the device.

Let the host register MMIO regions before the hypervisor initialises,
and have __pkvm_init_finalise() donate each one and record where it's
mapped in the hypervisor's private range. The donation runs before
pkvm_check_host_ownership(), which then covers those mappings too. A
failed donation fails the hypervisor's initialisation before the host
stage 2 is installed, so nothing is given back.

Nothing registers a region yet.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
Co-developed-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---

Notes:
    Changes since v2 (v2 patches 02 and 03, merged):
    - The trap handling moved to patch 9, which calls the ITS emulation
      directly (was a per-region callback)
    - Each region records its hypervisor VA
    - A failed donation is no longer unwound

 arch/arm64/include/asm/kvm_pkvm.h     | 12 ++++++++++++
 arch/arm64/kvm/hyp/nvhe/mem_protect.c |  3 +++
 arch/arm64/kvm/hyp/nvhe/setup.c       | 22 ++++++++++++++++++++++
 3 files changed, 37 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index fd042d2b54624..4695c35b31e1a 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -17,6 +17,18 @@
 
 #define HYP_MEMBLOCK_REGIONS 128
 
+/* MMIO regions the host registers for the hypervisor to take at finalisation. */
+#define PKVM_PROTECTED_REGS_NUM	8
+
+struct pkvm_protected_reg {
+	u64			pfn;
+	u64			nr_pages;
+	void __iomem		*hyp_va;
+};
+
+extern struct pkvm_protected_reg kvm_nvhe_sym(pkvm_protected_regs)[];
+extern unsigned int kvm_nvhe_sym(num_protected_reg);
+
 int pkvm_init_host_vm(struct kvm *kvm);
 int pkvm_create_hyp_vm(struct kvm *kvm);
 bool pkvm_hyp_vm_is_created(struct kvm *kvm);
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index a6dacaca77610..8d45f45d30e6a 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -28,6 +28,9 @@ struct host_mmu host_mmu;
 
 static struct hyp_pool host_s2_pool;
 
+unsigned int num_protected_reg;
+struct pkvm_protected_reg pkvm_protected_regs[PKVM_PROTECTED_REGS_NUM];
+
 static DEFINE_PER_CPU(struct pkvm_hyp_vm *, __current_vm);
 #define current_vm (*this_cpu_ptr(&__current_vm))
 
diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
index 7bbc26b28faa5..18f348d1331a8 100644
--- a/arch/arm64/kvm/hyp/nvhe/setup.c
+++ b/arch/arm64/kvm/hyp/nvhe/setup.c
@@ -295,6 +295,24 @@ static int fix_hyp_pgtable_refcnt(void)
 				&walker);
 }
 
+static int donate_protected_mmio_regions(void)
+{
+	struct pkvm_protected_reg *region;
+	unsigned long haddr;
+	int ret, i;
+
+	for (i = 0; i < num_protected_reg; i++) {
+		region = &pkvm_protected_regs[i];
+		ret = __pkvm_host_donate_hyp_mmio(region->pfn, region->nr_pages, &haddr);
+		if (ret)
+			return ret;
+
+		region->hyp_va = (void __iomem *)haddr;
+	}
+
+	return 0;
+}
+
 void __noreturn __pkvm_init_finalise(void)
 {
 	struct kvm_cpu_context *host_ctxt = host_data_ptr(host_ctxt);
@@ -335,6 +353,10 @@ void __noreturn __pkvm_init_finalise(void)
 	if (ret)
 		goto out;
 
+	ret = donate_protected_mmio_regions();
+	if (ret)
+		goto out;
+
 	ret = pkvm_check_host_ownership();
 	if (ret)
 		goto out;
-- 
2.47.3


