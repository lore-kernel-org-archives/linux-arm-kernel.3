Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37492D6554E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 11:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y+QlbqQxu3Io67Iugld0V0VaRxytHvtdy2KHbo9tCko=; b=ksxx83VyvpUhL9NB0I2GX+k3V5
	7fyl8ZO9WymopQKUKwJ5ETAQk1iP6dqB7AvtaQokGJXuVBqYmLaJ3YTutotSnNNOKCItJ/ZbNEnzy
	b96glVL3SmsvI1OJ9KwdP+4SWLZdzckTVid/eFymNtSM8CesHqD2ZGmCrMQXfFAM6QUb0oY0Dgzpq
	gL/tqkWICZjoQJmfQu6yzf+5KlQX1NW0OalSN+yv1cny1c94k++4GwtVpzVDw4kcH692nE1njA8Hy
	dMpbzvrrTYu3SUr1HOpHBxwYfR1CJMezWVPqgSCVhGx8A2c/hVN5pK/ZBZ7tqvUZ2WNqybbdHTiAM
	fSMMihOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVpjA-00000006ih9-0QxE;
	Wed, 17 Dec 2025 11:29:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVpj5-00000006iew-2ODB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 11:29:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE87914BF;
	Wed, 17 Dec 2025 03:29:43 -0800 (PST)
Received: from e134710.manchester.arm.com (e134710.arm.com [10.33.10.82])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 063213F73B;
	Wed, 17 Dec 2025 03:29:48 -0800 (PST)
From: Ahmed Tiba <ahmed.tiba@arm.com>
To: linux-acpi@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: tony.luck@intel.com,
	bp@alien8.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	rafael@kernel.org,
	linux-doc@vger.kernel.org,
	Dmitry.Lamerov@arm.com,
	Michael.Zhao2@arm.com,
	ahmed.tiba@arm.com
Subject: [PATCH 04/12] ras: add estatus queuing and IRQ/NMI handling
Date: Wed, 17 Dec 2025 11:28:37 +0000
Message-ID: <20251217112845.1814119-5-ahmed.tiba@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217112845.1814119-1-ahmed.tiba@arm.com>
References: <20251217112845.1814119-1-ahmed.tiba@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_032951_750822_E02E7763 
X-CRM114-Status: GOOD (  11.79  )
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

Hook the estatus core into the IRQ-work and NMI-safe queues that used to
live in GHES. The new code records CPER payloads into a per-source node,
ships them via irq_work so heavy processing happens out of the NMI path,
and adds the task_work hook used by memory-failure. Behaviour remains the
same as before, but the logic now lives alongside the rest of the estatus
infrastructure so both GHES and DeviceTree providers can reuse it.

Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com>
---
 drivers/firmware/efi/estatus.c | 78 ++++++++++++++++++++++++++++++++++
 include/linux/estatus.h        |  3 +-
 2 files changed, 79 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/efi/estatus.c b/drivers/firmware/efi/estatus.c
index 5a848d1b218e..8b62b23e2e93 100644
--- a/drivers/firmware/efi/estatus.c
+++ b/drivers/firmware/efi/estatus.c
@@ -973,3 +973,81 @@ void estatus_report_mem_error(int sev, struct cper_sec_mem_err *mem_err)
 	arch_apei_report_mem_error(sev, mem_err);
 #endif
 }
+
+int estatus_in_nmi_queue_one_entry(struct estatus_source *source, enum fixed_addresses fixmap_idx)
+{
+	estatus_generic_status *estatus, tmp_header;
+	struct estatus_node *estatus_node;
+	u32 len, node_len;
+	phys_addr_t buf_paddr;
+	int sev, rc;
+
+	if (!IS_ENABLED(CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG))
+		return -EOPNOTSUPP;
+
+	rc = __estatus_peek_estatus(source, &tmp_header, &buf_paddr,
+				    fixmap_idx);
+	if (rc) {
+		estatus_clear_estatus(source, &tmp_header, buf_paddr,
+				      fixmap_idx);
+		return rc;
+	}
+
+	rc = __estatus_check_estatus(source, &tmp_header);
+	if (rc) {
+		estatus_clear_estatus(source, &tmp_header, buf_paddr,
+				      fixmap_idx);
+		return rc;
+	}
+
+	len = estatus_len(&tmp_header);
+	node_len = ESTATUS_NODE_LEN(len);
+	estatus_node = (void *)gen_pool_alloc(estatus_pool, node_len);
+	if (!estatus_node)
+		return -ENOMEM;
+
+	estatus_node->source = source;
+	estatus = ESTATUS_FROM_NODE(estatus_node);
+
+	if (__estatus_read_estatus(source, estatus, buf_paddr, fixmap_idx,
+				   len)) {
+		estatus_clear_estatus(source, estatus, buf_paddr, fixmap_idx);
+		rc = -ENOENT;
+		goto no_work;
+	}
+
+	sev = estatus_severity(estatus->error_severity);
+	if (sev >= ESTATUS_SEV_PANIC) {
+		estatus_print_queued_estatus();
+		__estatus_panic(source, estatus, buf_paddr, fixmap_idx);
+	}
+
+	estatus_clear_estatus(source, &tmp_header, buf_paddr, fixmap_idx);
+
+	/* This error has been reported before, don't process it again. */
+	if (estatus_cached(estatus))
+		goto no_work;
+
+	llist_add(&estatus_node->llnode, &estatus_llist);
+
+	return rc;
+
+no_work:
+	gen_pool_free(estatus_pool, (unsigned long)estatus_node,
+		      node_len);
+
+	return rc;
+}
+EXPORT_SYMBOL_GPL(estatus_in_nmi_queue_one_entry);
+
+void estatus_register_report_chain(struct notifier_block *nb)
+{
+	atomic_notifier_chain_register(&estatus_report_chain, nb);
+}
+EXPORT_SYMBOL_GPL(estatus_register_report_chain);
+
+void estatus_unregister_report_chain(struct notifier_block *nb)
+{
+	atomic_notifier_chain_unregister(&estatus_report_chain, nb);
+}
+EXPORT_SYMBOL_GPL(estatus_unregister_report_chain);
diff --git a/include/linux/estatus.h b/include/linux/estatus.h
index 002a9533c85a..506a74ad60b9 100644
--- a/include/linux/estatus.h
+++ b/include/linux/estatus.h
@@ -122,8 +122,7 @@ enum {
 };
 
 int estatus_proc(struct estatus_source *ghes);
-int estatus_in_nmi_queue_one_entry(struct estatus_source *ghes,
-				   enum fixed_addresses fixmap_idx);
+int estatus_in_nmi_queue_one_entry(struct estatus_source *ghes, enum fixed_addresses fixmap_idx);
 void estatus_proc_in_irq(struct irq_work *irq_work);
 
 /**
-- 
2.43.0


