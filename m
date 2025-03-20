Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D10C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 02:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+uiHbtbR2+LTCG9tPghyUo9+PEq69RRB7eOXIX8kmmQ=; b=XCEeae5CTHdNxCdWfRTo2r/EsD
	k3PFPg2TFSM/loDRc/loSs0hdV25K5t6313U2B2bd0au3PbI4PGmxhr5YrzQsTB856N5FPxdzB7gg
	fiR3QM6ouqUJzGed7z+ggLCo7ux5sIduI/k+ATZB6qWzuQ129kVWLM7/Z/r2AJM5D5zEXtIgICGHM
	9TcJMq1unRwdnKYIMGtlGDsKBl4UrmZ9SLaol4PLqdOpi+KCi9O7HEMIF5PdaIZDROPWGsenL8sEc
	S2bwkjftmeXFyf/Az+UJ2ia14jSWMh8Zxty0Cbs97/+9CUd2lOfnRPwn4RIPpVC91c+tPnF3+uMTH
	A5xNJc+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv5ZV-0000000AsJE-2VDe;
	Thu, 20 Mar 2025 02:23:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv594-0000000Akps-0rH6
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 20 Mar 2025 01:56:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+uiHbtbR2+LTCG9tPghyUo9+PEq69RRB7eOXIX8kmmQ=; b=MmLIAyAMMArYv65dUBzyozMJaU
	e20J+1wqafhCVXZ4GqlA27xHeNZnqDcRRbVoAKoW+fVic1MDV35ZzbdD7P3Tm0W3SICjx9rfVPVro
	2L+9vTTzMSLSA1XpISq4ZZZyV0DcxNydb5sp6eEBmkw9N9mIRV4+zDewzW0nm5L2qwZaHRM0AQvFF
	2ESZp+H2JcSpRQqYHWe0Tj9L16CenIZZnG/okGo+VLjNnxl3Cz/3xZjGZieTX7ju4NuzsGdqbpbeH
	p/Q16YlOEYbJmVOKBpdAEp6Z0F3WIN9V8zXKZ4QzF4lQu42IeBL6e+HlI5fxplXpECtmRoX0Pk3Kw
	DNNQkwTw==;
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv590-000000043fx-0ijJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 01:56:29 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2ff62f96b10so2210661a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 18:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742435784; x=1743040584; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+uiHbtbR2+LTCG9tPghyUo9+PEq69RRB7eOXIX8kmmQ=;
        b=e3k0Lo60PpHn6fXyv87r9sknedIJLblwUeYNTZlcRNoYG3vdMS4Dk5/jnA2XlsPftS
         nPQuYA8WQEcxdpzIgJCgIxJYV0goxlNwVZ9cBovx+zo5l0bpYmCcmdTl8WrEw3Djt5aa
         YYXI5mCQ2B7WqM2b4Bg1ogyE1ltv8yM0Bblp/gCwitzYp7U/pFGAptq6DCyFdsclz0B0
         tzfHGjKhpavcXoX0tuMuwiBU+0IK5RBEKrvtcXuYVNvCaxslFfctpeP5+2DI7zWCClG1
         c75pvvy1P4zGdUfcMtS5Umq7++32GsiQGW/FJBuJWwqpti2H3DRUaHEjIZsnFpvVf4BE
         iAbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742435784; x=1743040584;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+uiHbtbR2+LTCG9tPghyUo9+PEq69RRB7eOXIX8kmmQ=;
        b=hso+Lu6NoijaJLa8eelyBqCAHk2mgYP7n9NeDSXYJ9HP2I8AvtySxG8hOzHZpg0XR1
         5dcevNd0wjhNgEcLR6yMSj2s1X6/4fZI41sKR8qYBgOy0t4Err6Ese+BIt4h+1UCdUQj
         dkxixH2Pgn+PP/Zrje2GOyNS+oAuVEr2YU1C5rb0gQZ5TygYzlA3Mg1AsBd3W+wjJOhE
         dcl0EwSiVgtT+FCOEJWPUhqCS5NcdVGvNceY8bHk728iGZicalAmdSNnb6B3BsO/Wr7V
         A410cQvEtswA9FrIvYXPAleMScQyAUpfU2TjNoRv3LqXLSUiajsW3yO7rInRNg1OZh+a
         JHDA==
X-Forwarded-Encrypted: i=1; AJvYcCW5Jpxb0hklup+Yry3XuHl3R1BKdsWqwJyYLPtbdM1GIJuTbZz2nb9PohP2Gqz0ZuCRloOwS1TZmu2N+HmktkWh@lists.infradead.org
X-Gm-Message-State: AOJu0Yypb1IelO+CM4ZZLDcTEtgAWhMvE/NHN+zO28eMXHKCEiQ2S1b/
	OGAQoXbt2rfq8jT82nSApYdU1Zsp+Sfc8ImaSsOlrq8dbh+snuopBSZCx09BcvpmYuyre/f6ORL
	ONvmuHqxnW7SqdS9/Mg==
X-Google-Smtp-Source: AGHT+IGco0TbFvrpWaz7RU09LVDLIbrwQOB0hzzeh7i66UCW7yrWSDQtXXKFJgzbGrQWcK/LzqGUCqggvCd+K/bd
X-Received: from pgvr15.prod.google.com ([2002:a65:60cf:0:b0:ad8:bdc2:8a33])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:69c:b0:1f5:8bf4:fde0 with SMTP id adf61e73a8af0-1fd0904c18cmr2493103637.9.1742435784427;
 Wed, 19 Mar 2025 18:56:24 -0700 (PDT)
Date: Wed, 19 Mar 2025 18:55:50 -0700
In-Reply-To: <20250320015551.2157511-1-changyuanl@google.com>
Mime-Version: 1.0
References: <20250320015551.2157511-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
Message-ID: <20250320015551.2157511-16-changyuanl@google.com>
Subject: [PATCH v5 15/16] memblock: add KHO support for reserve_mem
From: Changyuan Lyu <changyuanl@google.com>
To: linux-kernel@vger.kernel.org
Cc: graf@amazon.com, akpm@linux-foundation.org, luto@kernel.org, 
	anthony.yznaga@oracle.com, arnd@arndb.de, ashish.kalra@amd.com, 
	benh@kernel.crashing.org, bp@alien8.de, catalin.marinas@arm.com, 
	dave.hansen@linux.intel.com, dwmw2@infradead.org, ebiederm@xmission.com, 
	mingo@redhat.com, jgowans@amazon.com, corbet@lwn.net, krzk@kernel.org, 
	rppt@kernel.org, mark.rutland@arm.com, pbonzini@redhat.com, 
	pasha.tatashin@soleen.com, hpa@zytor.com, peterz@infradead.org, 
	ptyadav@amazon.de, robh+dt@kernel.org, robh@kernel.org, saravanak@google.com, 
	skinsburskii@linux.microsoft.com, rostedt@goodmis.org, tglx@linutronix.de, 
	thomas.lendacky@amd.com, usama.arif@bytedance.com, will@kernel.org, 
	devicetree@vger.kernel.org, kexec@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, x86@kernel.org, Changyuan Lyu <changyuanl@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_015627_240568_A8B75152 
X-CRM114-Status: GOOD (  20.62  )
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

From: Alexander Graf <graf@amazon.com>

Linux has recently gained support for "reserve_mem": A mechanism to
allocate a region of memory early enough in boot that we can cross our
fingers and hope it stays at the same location during most boots, so we
can store for example ftrace buffers into it.

Thanks to KASLR, we can never be really sure that "reserve_mem"
allocations are static across kexec. Let's teach it KHO awareness so
that it serializes its reservations on kexec exit and deserializes them
again on boot, preserving the exact same mapping across kexec.

This is an example user for KHO in the KHO patch set to ensure we have
at least one (not very controversial) user in the tree before extending
KHO's use to more subsystems.

Signed-off-by: Alexander Graf <graf@amazon.com>
Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Co-developed-by: Changyuan Lyu <changyuanl@google.com>
Signed-off-by: Changyuan Lyu <changyuanl@google.com>
---
 mm/memblock.c | 179 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 179 insertions(+)

diff --git a/mm/memblock.c b/mm/memblock.c
index d28abf3def1c..dd698c55b87e 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -17,6 +17,10 @@
 #include <linux/seq_file.h>
 #include <linux/memblock.h>
 
+#ifdef CONFIG_KEXEC_HANDOVER
+#include <linux/kexec_handover.h>
+#endif /* CONFIG_KEXEC_HANDOVER */
+
 #include <asm/sections.h>
 #include <linux/io.h>
 
@@ -2431,6 +2435,176 @@ int reserve_mem_find_by_name(const char *name, phys_addr_t *start, phys_addr_t *
 }
 EXPORT_SYMBOL_GPL(reserve_mem_find_by_name);
 
+#ifdef CONFIG_KEXEC_HANDOVER
+#define MEMBLOCK_KHO_NODE "memblock"
+#define MEMBLOCK_KHO_NODE_COMPATIBLE "memblock-v1"
+#define RESERVE_MEM_KHO_NODE_COMPATIBLE "reserve-mem-v1"
+
+static struct kho_node memblock_kho_node = KHO_NODE_INIT;
+
+static void reserve_mem_kho_reset(void)
+{
+	int i;
+	struct kho_node *node;
+
+	kho_remove_node(NULL, MEMBLOCK_KHO_NODE);
+	kho_remove_prop(&memblock_kho_node, "compatible", NULL);
+
+	for (i = 0; i < reserved_mem_count; i++) {
+		struct reserve_mem_table *map = &reserved_mem_table[i];
+
+		node = kho_remove_node(&memblock_kho_node, map->name);
+		if (IS_ERR(node))
+			continue;
+
+		kho_unpreserve_phys(map->start, map->size);
+
+		kho_remove_prop(node, "compatible", NULL);
+		kho_remove_prop(node, "start", NULL);
+		kho_remove_prop(node, "size", NULL);
+
+		kfree(node);
+	}
+}
+
+static int reserve_mem_kho_finalize(void)
+{
+	int i, err = 0;
+	struct kho_node *node;
+
+	if (!reserved_mem_count)
+		return NOTIFY_DONE;
+
+	err = kho_add_node(NULL, MEMBLOCK_KHO_NODE, &memblock_kho_node);
+	if (err == 1)
+		return NOTIFY_DONE;
+
+	err |= kho_add_string_prop(&memblock_kho_node, "compatible",
+				   MEMBLOCK_KHO_NODE_COMPATIBLE);
+
+	for (i = 0; i < reserved_mem_count; i++) {
+		struct reserve_mem_table *map = &reserved_mem_table[i];
+
+		node = kmalloc(sizeof(*node), GFP_KERNEL);
+		if (!node) {
+			err = -ENOMEM;
+			break;
+		}
+
+		err |= kho_preserve_phys(map->start, map->size);
+
+		kho_init_node(node);
+		err |= kho_add_string_prop(node, "compatible",
+					   RESERVE_MEM_KHO_NODE_COMPATIBLE);
+		err |= kho_add_prop(node, "start", &map->start,
+				    sizeof(map->start));
+		err |= kho_add_prop(node, "size", &map->size,
+				    sizeof(map->size));
+		err |= kho_add_node(&memblock_kho_node, map->name, node);
+
+		if (err)
+			break;
+	}
+
+	if (err) {
+		pr_err("failed to save reserve_mem to KHO: %d\n", err);
+		reserve_mem_kho_reset();
+		return NOTIFY_STOP;
+	}
+
+	return NOTIFY_DONE;
+}
+
+static int reserve_mem_kho_notifier(struct notifier_block *self,
+				    unsigned long cmd, void *v)
+{
+	switch (cmd) {
+	case KEXEC_KHO_FINALIZE:
+		return reserve_mem_kho_finalize();
+	case KEXEC_KHO_UNFREEZE:
+		return NOTIFY_DONE;
+	default:
+		return NOTIFY_BAD;
+	}
+}
+
+static struct notifier_block reserve_mem_kho_nb = {
+	.notifier_call = reserve_mem_kho_notifier,
+};
+
+static int __init reserve_mem_init(void)
+{
+	if (!kho_is_enabled())
+		return 0;
+
+	return register_kho_notifier(&reserve_mem_kho_nb);
+}
+core_initcall(reserve_mem_init);
+
+static bool __init reserve_mem_kho_revive(const char *name, phys_addr_t size,
+					  phys_addr_t align)
+{
+	int err, len_start, len_size;
+	struct kho_in_node node, child;
+	const phys_addr_t *p_start, *p_size;
+
+	err = kho_get_node(NULL, MEMBLOCK_KHO_NODE, &node);
+	if (err)
+		return false;
+
+	err = kho_node_check_compatible(&node, MEMBLOCK_KHO_NODE_COMPATIBLE);
+	if (err) {
+		pr_warn("Node '%s' is incompatible with %s: %d\n",
+			MEMBLOCK_KHO_NODE, MEMBLOCK_KHO_NODE_COMPATIBLE, err);
+		return false;
+	}
+
+	err = kho_get_node(&node, name, &child);
+	if (err) {
+		pr_warn("Node '%s' has no child '%s': %d\n",
+			MEMBLOCK_KHO_NODE, name, err);
+		return false;
+	}
+	err = kho_node_check_compatible(&child, RESERVE_MEM_KHO_NODE_COMPATIBLE);
+	if (err) {
+		pr_warn("Node '%s/%s' is incompatible with %s: %d\n",
+			MEMBLOCK_KHO_NODE, name,
+			RESERVE_MEM_KHO_NODE_COMPATIBLE, err);
+		return false;
+	}
+
+	p_start = kho_get_prop(&child, "start", &len_start);
+	p_size = kho_get_prop(&child, "size", &len_size);
+	if (!p_start || len_start != sizeof(*p_start) || !p_size ||
+	    len_size != sizeof(*p_size)) {
+		return false;
+	}
+
+	if (*p_start & (align - 1)) {
+		pr_warn("KHO reserve-mem '%s' has wrong alignment (0x%lx, 0x%lx)\n",
+			name, (long)align, (long)*p_start);
+		return false;
+	}
+
+	if (*p_size != size) {
+		pr_warn("KHO reserve-mem '%s' has wrong size (0x%lx != 0x%lx)\n",
+			name, (long)*p_size, (long)size);
+		return false;
+	}
+
+	reserved_mem_add(*p_start, size, name);
+	pr_info("Revived memory reservation '%s' from KHO\n", name);
+
+	return true;
+}
+#else
+static bool __init reserve_mem_kho_revive(const char *name, phys_addr_t size,
+					  phys_addr_t align)
+{
+	return false;
+}
+#endif /* CONFIG_KEXEC_HANDOVER */
+
 /*
  * Parse reserve_mem=nn:align:name
  */
@@ -2486,6 +2660,11 @@ static int __init reserve_mem(char *p)
 	if (reserve_mem_find_by_name(name, &start, &tmp))
 		return -EBUSY;
 
+	/* Pick previous allocations up from KHO if available */
+	if (reserve_mem_kho_revive(name, size, align))
+		return 1;
+
+	/* TODO: Allocation must be outside of scratch region */
 	start = memblock_phys_alloc(size, align);
 	if (!start)
 		return -ENOMEM;
-- 
2.48.1.711.g2feabab25a-goog


