Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3EE7C35FFF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 02:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rd3wJc2IZkbxeklI0oyF9EA5atShYqSy3T5piwpZMms=; b=op/wonQPss6dWBY4KlkCXWUHch
	spXq4auzUsM3LYDVT+D+2q43W5ayRCPK/tV24XAzpAeSQAqMMXI67bUBf+Mzumeu1MlTqMj8ykv+s
	+Rdv8Mf6svH/jNz2rAc+zQCf36PQ78Tr7ul1kPoYRD05VIIHYoeGkerdQsVRuDGxeu64VPkqLrASp
	0VLqrbqPCSZkLUrsStuFnH5+4ZXw4Hg0R0VLdSLE+cxycPXU8QmFFCidGS/xNKFlZGf3dPK1CLwWy
	yF3tIEw5X+GqLFbkgJYh3ZR6pJPkVoz2ZmlinOMACXVIQYFts90DmZnNquUnQD8mj5D0uj9JGZcTC
	aKIgPLeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv5So-0000000Aqjg-2oZv;
	Thu, 20 Mar 2025 02:16:54 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv58u-0000000Ake9-1JzP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 01:56:24 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2240a960f9cso2984825ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 18:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742435779; x=1743040579; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rd3wJc2IZkbxeklI0oyF9EA5atShYqSy3T5piwpZMms=;
        b=isR6kPMFXZa2fnACG26tUzMx9X+vPntIf3xQ0V3kDsfnhfsMV7NJLyy4nP1kC8HZGp
         8akD1LDtjr+TGYW2En9gSKAJEGJbRsIEcozwwcT8fdv8njkSbN0DXF3yHmfDLuZL96JI
         TxQvNS6XwgkL7B7ElQbPpQ3sWEYu98fh8w81zWjQsI7yyJfsQdJR7raGunnGNnUyI2Kg
         HcFO5FgOsRsXdJDuQ9oWBlfTGwoDFgxJ10ggmB+hhCjWTq+CwSlll7XGdy/K3L5CjtQQ
         SAWBw23aDaeaqB8Qh26VRPXAEk4msuaD1jxRJRxS1xXaYEhaJJjx22CwGriFozUsvj9J
         qAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742435779; x=1743040579;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rd3wJc2IZkbxeklI0oyF9EA5atShYqSy3T5piwpZMms=;
        b=TKagI/6vW0n3P4HLb6vHUq8KglhOtACPT6h8choDz7xIC2ccnnGQbJJyNwML0mGf1w
         QLHuRmkvtYVsGDoq/Sc1OTyWhou7LiRvJr01mVlvt8DnN9DsHTNX81f2Fn40lI7fsacs
         jWyR7zDZoG+AGiDpTiI/Wwlqsugt4Zg0rmlYptmrf2K+zyxSHWKRe1446oHVryU1y5E0
         tHZuz55RtVPlf59fymAB6fpN8KIQECqokmnEXqQivUocgvBSmyxVm/JmfN8nyMz8+Xcy
         eI+imzBRXPAsJwGpwOCPicKwxEcD3MGYpvIeZnlyksKHELSoyQBaSl6KqPlKNxy5SUVE
         T4pQ==
X-Forwarded-Encrypted: i=1; AJvYcCVozd0qurZdr1yE5hG0UF7hV8P/5/wlYH09S5QUE72GAfXqO8/ZgXUJh46hCP/zRoQGlaX8IJZ4Qgbe/NXAOh/U@lists.infradead.org
X-Gm-Message-State: AOJu0Yxd4GyK9zGuh2zB/Hc0opeg0OjUoVammyp6rpvhLFFKwW3N3O0R
	YPTr9AEudcFnqaE3Yjjjt1fxs60Nebm5sRIDhjNdKqrTet16RrFl5b2f5ZZTdYtUEA94KkgWf9Z
	loFQNdA7k8wNItm8HhQ==
X-Google-Smtp-Source: AGHT+IGJMwZEQr7XX54NJ2Wc09gQFNrebDpGN2LmiuqxXXpWV4PLS6zLIf0YQX/7suAC0aQ3d5AJ2BOMHO4N4Oqa
X-Received: from pfbig24.prod.google.com ([2002:a05:6a00:8b98:b0:730:597f:f227])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:3a08:b0:736:57cb:f2b6 with SMTP id d2e1a72fcca58-7376d62aac5mr7233223b3a.12.1742435779245;
 Wed, 19 Mar 2025 18:56:19 -0700 (PDT)
Date: Wed, 19 Mar 2025 18:55:47 -0700
In-Reply-To: <20250320015551.2157511-1-changyuanl@google.com>
Mime-Version: 1.0
References: <20250320015551.2157511-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
Message-ID: <20250320015551.2157511-13-changyuanl@google.com>
Subject: [PATCH v5 12/16] arm64: add KHO support
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
X-CRM114-CacheID: sfid-20250319_185620_443538_FD98C4CF 
X-CRM114-Status: GOOD (  19.16  )
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

We now have all bits in place to support KHO kexecs. Add awareness of
KHO in the kexec file as well as boot path for arm64 and adds the
respective kconfig option to the architecture so that it can use KHO
successfully.

Signed-off-by: Alexander Graf <graf@amazon.com>
Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Co-developed-by: Changyuan Lyu <changyuanl@google.com>
Signed-off-by: Changyuan Lyu <changyuanl@google.com>
---
 arch/arm64/Kconfig |  3 +++
 drivers/of/fdt.c   | 33 +++++++++++++++++++++++++++++++++
 drivers/of/kexec.c | 37 +++++++++++++++++++++++++++++++++++++
 3 files changed, 73 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 940343beb3d4..c997b27b7da1 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1589,6 +1589,9 @@ config ARCH_SUPPORTS_KEXEC_IMAGE_VERIFY_SIG
 config ARCH_DEFAULT_KEXEC_IMAGE_VERIFY_SIG
 	def_bool y
 
+config ARCH_SUPPORTS_KEXEC_HANDOVER
+	def_bool y
+
 config ARCH_SUPPORTS_CRASH_DUMP
 	def_bool y
 
diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index aedd0e2dcd89..73f80e3f7188 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -25,6 +25,7 @@
 #include <linux/serial_core.h>
 #include <linux/sysfs.h>
 #include <linux/random.h>
+#include <linux/kexec_handover.h>
 
 #include <asm/setup.h>  /* for COMMAND_LINE_SIZE */
 #include <asm/page.h>
@@ -875,6 +876,35 @@ void __init early_init_dt_check_for_usable_mem_range(void)
 		memblock_add(rgn[i].base, rgn[i].size);
 }
 
+/**
+ * early_init_dt_check_kho - Decode info required for kexec handover from DT
+ */
+static void __init early_init_dt_check_kho(void)
+{
+	unsigned long node = chosen_node_offset;
+	u64 kho_start, scratch_start, scratch_size;
+	const __be32 *p;
+	int l;
+
+	if (!IS_ENABLED(CONFIG_KEXEC_HANDOVER) || (long)node < 0)
+		return;
+
+	p = of_get_flat_dt_prop(node, "linux,kho-fdt", &l);
+	if (l != (dt_root_addr_cells + dt_root_size_cells) * sizeof(__be32))
+		return;
+
+	kho_start = dt_mem_next_cell(dt_root_addr_cells, &p);
+
+	p = of_get_flat_dt_prop(node, "linux,kho-scratch", &l);
+	if (l != (dt_root_addr_cells + dt_root_size_cells) * sizeof(__be32))
+		return;
+
+	scratch_start = dt_mem_next_cell(dt_root_addr_cells, &p);
+	scratch_size = dt_mem_next_cell(dt_root_addr_cells, &p);
+
+	kho_populate(kho_start, scratch_start, scratch_size);
+}
+
 #ifdef CONFIG_SERIAL_EARLYCON
 
 int __init early_init_dt_scan_chosen_stdout(void)
@@ -1169,6 +1199,9 @@ void __init early_init_dt_scan_nodes(void)
 
 	/* Handle linux,usable-memory-range property */
 	early_init_dt_check_for_usable_mem_range();
+
+	/* Handle kexec handover */
+	early_init_dt_check_kho();
 }
 
 bool __init early_init_dt_scan(void *dt_virt, phys_addr_t dt_phys)
diff --git a/drivers/of/kexec.c b/drivers/of/kexec.c
index 5b924597a4de..db7d7014d8b4 100644
--- a/drivers/of/kexec.c
+++ b/drivers/of/kexec.c
@@ -264,6 +264,38 @@ static inline int setup_ima_buffer(const struct kimage *image, void *fdt,
 }
 #endif /* CONFIG_IMA_KEXEC */
 
+static int kho_add_chosen(const struct kimage *image, void *fdt, int chosen_node)
+{
+	int ret = 0;
+#ifdef CONFIG_KEXEC_HANDOVER
+	phys_addr_t dt_mem = 0;
+	phys_addr_t dt_len = 0;
+	phys_addr_t scratch_mem = 0;
+	phys_addr_t scratch_len = 0;
+
+	if (!image->kho.fdt || !image->kho.scratch)
+		return 0;
+
+	dt_mem = image->kho.fdt->mem;
+	dt_len = image->kho.fdt->memsz;
+
+	scratch_mem = image->kho.scratch->mem;
+	scratch_len = image->kho.scratch->bufsz;
+
+	pr_debug("Adding kho metadata to DT");
+
+	ret = fdt_appendprop_addrrange(fdt, 0, chosen_node, "linux,kho-fdt",
+				       dt_mem, dt_len);
+	if (ret)
+		return ret;
+
+	ret = fdt_appendprop_addrrange(fdt, 0, chosen_node, "linux,kho-scratch",
+				       scratch_mem, scratch_len);
+
+#endif /* CONFIG_KEXEC_HANDOVER */
+	return ret;
+}
+
 /*
  * of_kexec_alloc_and_setup_fdt - Alloc and setup a new Flattened Device Tree
  *
@@ -414,6 +446,11 @@ void *of_kexec_alloc_and_setup_fdt(const struct kimage *image,
 #endif
 	}
 
+	/* Add kho metadata if this is a KHO image */
+	ret = kho_add_chosen(image, fdt, chosen_node);
+	if (ret)
+		goto out;
+
 	/* add bootargs */
 	if (cmdline) {
 		ret = fdt_setprop_string(fdt, chosen_node, "bootargs", cmdline);
-- 
2.48.1.711.g2feabab25a-goog


