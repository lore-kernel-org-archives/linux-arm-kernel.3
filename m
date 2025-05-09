Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6056C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 08:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ltOzPxd5cb014aNqOQJOhRAOAasmd6Qqt/PpxvB5qBk=; b=rSoksy3tJSZ8i0o6GcEpOvrlMB
	/hNVphMqIvmN+o1FLPH+iyccTgxuN0gOQdsZQqRZ/fdtZotaNQ6ViuXIACoUIYuF1vE86lpKN69K0
	b0EMqfsAJx0qHwmL3Hw1QFBcWlekKF0MAvxS48+c+oLW9nv0Q/S0ZfDc3tMfiMfpirMOEd8NMKxA7
	SlOTERwt5gHzpHjfdk1Qt46BF8GMGBGGPBVVZcizNgrTP2vipn7jZUSR1jgO7NXIDpSS4Rm8uzU84
	hdBhMMkAKGJayt80oOLmCtCGTc3k9naqLyDt+WRiFA1R+c+QC0ZTgAXAya16zAObdSyEz/dQr4yZH
	jPqlStBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDInZ-00000002s9f-2GNI;
	Fri, 09 May 2025 08:09:37 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDIS3-00000002nox-4AMh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 07:47:25 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-22fd4e7ea48so3483305ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 00:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746776843; x=1747381643; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ltOzPxd5cb014aNqOQJOhRAOAasmd6Qqt/PpxvB5qBk=;
        b=jrJQI56clALuueUIiIsXAEzcJ1nw0HV1SCx891CJAWN0MsD7QbBttDN6qh4cRZEO22
         2BaYmhN7s55dJzmqPmakDf4AhWbTia4nYJq3zlXC7TlcPZlOjGaWtCAXBfewgutAdC70
         b/ORiQ/JZu6k8CsCrMX/FxAorCwEOpvEaMIIsMPGcF9pYPLAfJ0oywsz/qfh/tHhQJst
         el1X3MCQ5MmV9uIpY3bikEeWZBjvrZnbVWul1/Xyi1HErF02VOldoeU5u8V3UsFT9WPQ
         KUZ8DKj3PV9Ptw4lc/f5L68DsHiPOQpAqRV496c+5guSwso8YPY/tiYUqZpTOLEVH8GD
         Sp5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746776843; x=1747381643;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ltOzPxd5cb014aNqOQJOhRAOAasmd6Qqt/PpxvB5qBk=;
        b=heJ6Gy1OTawVCfGAk3f9tj57UOf+uLhq84DFNWq+a9GroRX4atDoehQs138g9PONQi
         hNlDs+JaXVmTmy3SVt6OsRHP0E4OTP//pPjTqIE/P1lFMIZRkAaXxL8wSLyv7dtK+8x4
         1MGbdpREMd7dEv/r/EhoqE1pS99vF3nW48F+x/1xSZVo/bLQt7PXqs21fEptIjp3oiEk
         HG73CjbKtGuiQdqqmqXv+ouNehVXDorRJARw3qQHXFmc27pNfItPAHbWm5uMd1diVfX1
         ZTpSZUGMHkLiMrECZAvvzI3iJw50cdx1571uQBuUjwqJ3E/k4vn2hbYju9tlT71Q3M6m
         3nbA==
X-Forwarded-Encrypted: i=1; AJvYcCUfohMilELL4QR3rO8TJcbb8KQ88iM2J4PPkf8+Bm5DI6yK7hk6WS8p4r0KSaOjClMoHC0rZX/m0nlfJ9Fj+CDG@lists.infradead.org
X-Gm-Message-State: AOJu0YwtYFbzNuSN6yi70cDN7tQSxxKZv+XVfFbYRUodO0LwJXIWTrwP
	U+ET8f64HDQJtoc1ZsbTRCLu9dBmEzHBnt1YC9PdzefJgiOVa8CMZb/0ihBLAmK8yFHSz9O2oCG
	xk7i/yRHO6HzeX/FDdA==
X-Google-Smtp-Source: AGHT+IEmGBTS05A8WCtEMDiSHI9TQ0XKQ9En6nya4Iyyn0DN/q/frpBUdoFmx0xItQXSJArNnWrRzV24KfjtMJ+7
X-Received: from plke15.prod.google.com ([2002:a17:903:194f:b0:223:f441:fcaa])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ce8b:b0:22e:b21c:98de with SMTP id d9443c01a7336-22fc8d98436mr33473415ad.39.1746776842872;
 Fri, 09 May 2025 00:47:22 -0700 (PDT)
Date: Fri,  9 May 2025 00:46:33 -0700
In-Reply-To: <20250509074635.3187114-1-changyuanl@google.com>
Mime-Version: 1.0
References: <20250509074635.3187114-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.1015.ga840276032-goog
Message-ID: <20250509074635.3187114-16-changyuanl@google.com>
Subject: [PATCH v8 15/17] memblock: add KHO support for reserve_mem
From: Changyuan Lyu <changyuanl@google.com>
To: akpm@linux-foundation.org, linux-kernel@vger.kernel.org
Cc: anthony.yznaga@oracle.com, arnd@arndb.de, ashish.kalra@amd.com, 
	benh@kernel.crashing.org, bp@alien8.de, catalin.marinas@arm.com, 
	corbet@lwn.net, dave.hansen@linux.intel.com, devicetree@vger.kernel.org, 
	dwmw2@infradead.org, ebiederm@xmission.com, graf@amazon.com, hpa@zytor.com, 
	jgowans@amazon.com, kexec@lists.infradead.org, krzk@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, luto@kernel.org, mark.rutland@arm.com, mingo@redhat.com, 
	pasha.tatashin@soleen.com, pbonzini@redhat.com, peterz@infradead.org, 
	ptyadav@amazon.de, robh@kernel.org, rostedt@goodmis.org, rppt@kernel.org, 
	saravanak@google.com, skinsburskii@linux.microsoft.com, tglx@linutronix.de, 
	thomas.lendacky@amd.com, will@kernel.org, x86@kernel.org, 
	Changyuan Lyu <changyuanl@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_004724_051139_39EB19DA 
X-CRM114-Status: GOOD (  21.57  )
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
 mm/memblock.c | 193 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 193 insertions(+)

diff --git a/mm/memblock.c b/mm/memblock.c
index 9202c3412bb19..71f3bd943f383 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -18,6 +18,11 @@
 #include <linux/memblock.h>
 #include <linux/mutex.h>
 
+#ifdef CONFIG_KEXEC_HANDOVER
+#include <linux/libfdt.h>
+#include <linux/kexec_handover.h>
+#endif /* CONFIG_KEXEC_HANDOVER */
+
 #include <asm/sections.h>
 #include <linux/io.h>
 
@@ -2475,6 +2480,189 @@ int reserve_mem_release_by_name(const char *name)
 	return 1;
 }
 
+#ifdef CONFIG_KEXEC_HANDOVER
+#define MEMBLOCK_KHO_FDT "memblock"
+#define MEMBLOCK_KHO_NODE_COMPATIBLE "memblock-v1"
+#define RESERVE_MEM_KHO_NODE_COMPATIBLE "reserve-mem-v1"
+static struct page *kho_fdt;
+
+static int reserve_mem_kho_finalize(struct kho_serialization *ser)
+{
+	int err = 0, i;
+
+	for (i = 0; i < reserved_mem_count; i++) {
+		struct reserve_mem_table *map = &reserved_mem_table[i];
+
+		err |= kho_preserve_phys(map->start, map->size);
+	}
+
+	err |= kho_preserve_folio(page_folio(kho_fdt));
+	err |= kho_add_subtree(ser, MEMBLOCK_KHO_FDT, page_to_virt(kho_fdt));
+
+	return notifier_from_errno(err);
+}
+
+static int reserve_mem_kho_notifier(struct notifier_block *self,
+				    unsigned long cmd, void *v)
+{
+	switch (cmd) {
+	case KEXEC_KHO_FINALIZE:
+		return reserve_mem_kho_finalize((struct kho_serialization *)v);
+	case KEXEC_KHO_ABORT:
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
+static int __init prepare_kho_fdt(void)
+{
+	int err = 0, i;
+	void *fdt;
+
+	kho_fdt = alloc_page(GFP_KERNEL);
+	if (!kho_fdt)
+		return -ENOMEM;
+
+	fdt = page_to_virt(kho_fdt);
+
+	err |= fdt_create(fdt, PAGE_SIZE);
+	err |= fdt_finish_reservemap(fdt);
+
+	err |= fdt_begin_node(fdt, "");
+	err |= fdt_property_string(fdt, "compatible", MEMBLOCK_KHO_NODE_COMPATIBLE);
+	for (i = 0; i < reserved_mem_count; i++) {
+		struct reserve_mem_table *map = &reserved_mem_table[i];
+
+		err |= fdt_begin_node(fdt, map->name);
+		err |= fdt_property_string(fdt, "compatible", RESERVE_MEM_KHO_NODE_COMPATIBLE);
+		err |= fdt_property(fdt, "start", &map->start, sizeof(map->start));
+		err |= fdt_property(fdt, "size", &map->size, sizeof(map->size));
+		err |= fdt_end_node(fdt);
+	}
+	err |= fdt_end_node(fdt);
+
+	err |= fdt_finish(fdt);
+
+	if (err) {
+		pr_err("failed to prepare memblock FDT for KHO: %d\n", err);
+		put_page(kho_fdt);
+		kho_fdt = NULL;
+	}
+
+	return err;
+}
+
+static int __init reserve_mem_init(void)
+{
+	int err;
+
+	if (!kho_is_enabled() || !reserved_mem_count)
+		return 0;
+
+	err = prepare_kho_fdt();
+	if (err)
+		return err;
+
+	err = register_kho_notifier(&reserve_mem_kho_nb);
+	if (err) {
+		put_page(kho_fdt);
+		kho_fdt = NULL;
+	}
+
+	return err;
+}
+late_initcall(reserve_mem_init);
+
+static void *__init reserve_mem_kho_retrieve_fdt(void)
+{
+	phys_addr_t fdt_phys;
+	static void *fdt;
+	int err;
+
+	if (fdt)
+		return fdt;
+
+	err = kho_retrieve_subtree(MEMBLOCK_KHO_FDT, &fdt_phys);
+	if (err) {
+		if (err != -ENOENT)
+			pr_warn("failed to retrieve FDT '%s' from KHO: %d\n",
+				MEMBLOCK_KHO_FDT, err);
+		return NULL;
+	}
+
+	fdt = phys_to_virt(fdt_phys);
+
+	err = fdt_node_check_compatible(fdt, 0, MEMBLOCK_KHO_NODE_COMPATIBLE);
+	if (err) {
+		pr_warn("FDT '%s' is incompatible with '%s': %d\n",
+			MEMBLOCK_KHO_FDT, MEMBLOCK_KHO_NODE_COMPATIBLE, err);
+		fdt = NULL;
+	}
+
+	return fdt;
+}
+
+static bool __init reserve_mem_kho_revive(const char *name, phys_addr_t size,
+					  phys_addr_t align)
+{
+	int err, len_start, len_size, offset;
+	const phys_addr_t *p_start, *p_size;
+	const void *fdt;
+
+	fdt = reserve_mem_kho_retrieve_fdt();
+	if (!fdt)
+		return false;
+
+	offset = fdt_subnode_offset(fdt, 0, name);
+	if (offset < 0) {
+		pr_warn("FDT '%s' has no child '%s': %d\n",
+			MEMBLOCK_KHO_FDT, name, offset);
+		return false;
+	}
+	err = fdt_node_check_compatible(fdt, offset, RESERVE_MEM_KHO_NODE_COMPATIBLE);
+	if (err) {
+		pr_warn("Node '%s' is incompatible with '%s': %d\n",
+			name, RESERVE_MEM_KHO_NODE_COMPATIBLE, err);
+		return false;
+	}
+
+	p_start = fdt_getprop(fdt, offset, "start", &len_start);
+	p_size = fdt_getprop(fdt, offset, "size", &len_size);
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
@@ -2530,6 +2718,11 @@ static int __init reserve_mem(char *p)
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
2.49.0.1015.ga840276032-goog


