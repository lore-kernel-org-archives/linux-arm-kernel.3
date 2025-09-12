Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E529CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 15:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ltLVlonCLmXqCMj5NKS1dwyzuNto475BJCWDW4VinA=; b=iv3yX2589IsCA6nWUAUY/olJh1
	TmJ1ZJ99b2DmMUwjws2XMbta0rQ03E/gfStFmbAvFrnoW6YHA1tSyTk2JH6Jo9+witieEyzJXxNWk
	Y6ImgHfPubZoVnB7egYwbFBRZ3YBpArGkTq6ilcGQRTVWlAlDP6euO1i+GsnWM5Q++OS8585VKuiN
	Qt4p3Y/8ZVUm+FLFudLfU3NXKYr38p23WwYmUAsU/WBPUNMzXvhe/yUrKlWWWT6UcucXNCyO1V5N9
	rlhlVmd65qpjUSpeCLqnd4wFYDrCkA0pwK11a/F2ts0HXkhtQcjvJ6wwY6c6rs+Gkvou6nBJqYpxP
	Y7VcKo1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux5Pb-0000000A7tD-2Rdy;
	Fri, 12 Sep 2025 15:10:07 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux5PZ-0000000A7rU-2SYs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 15:10:06 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-72ce9790acdso19055907b3.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 08:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757689804; x=1758294604; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ltLVlonCLmXqCMj5NKS1dwyzuNto475BJCWDW4VinA=;
        b=UGGSaijBRA1kF62YJkyvW0JmsEREBPCh0EQ7ZalisDvIyUjkoD+/Crs+8WatCPW9ju
         HV92kEZiFXWzF/lOr+yGFmuv4n7ft3UEnK9/NBFiL6Rai9tzNgZKtpIs9kka+xwvDiB5
         C5DGCfLh5kMupMqLql2xg4/CyG2XihnYeHBuLbit38l+//zfiDMYs5h4N3ZV7VjLPdrV
         QBCl9CiPMCDfRBwctoPi8VfV8QH3ZtNjXAk5us8BI2mFUBfNcFB3gae5J/aLEcnsOB49
         NGcf/tEiAYPtO5lg7o1Qa6cUTmycJiO8Dr584WSX+V44GCLKZEh7yJtBiaV04q0Ihzf8
         8CDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757689804; x=1758294604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ltLVlonCLmXqCMj5NKS1dwyzuNto475BJCWDW4VinA=;
        b=mp0VE7I5Psbx7qZt/MU+E1sFVt5gTrixpYqi6M52EJ0F4p/OeiCr1+BBn2lDktbFDL
         pyB+KfeLqq11/Xw3xPq6wb//RGWJT5pFp0RYCdJwS8oHcnwAT+s+B0umYVbB3U99mOCy
         8kE57cR+El1+lTrx0UtDVSsFUbXnuPXSyTMT2GvgW+Mp9hVq8UYRNELFCa5DGNE6N9sW
         lVZmGnnenDwUVkbN7sUz35sr13QmJURqp0+gDWkHuyPizBymMNHj5lKvR6YtCsoC/JgH
         uQu+GecrRfvvti2AkzTw/VZ8Z1A/q3XExkH3X6jSFg3nnNFf0XDHg1F2CWPY8E+G+MtM
         fUxA==
X-Forwarded-Encrypted: i=1; AJvYcCV+e04nsEZ7ExD7eeW3z4naIBFoykRXP67SkD7kDoiEAg+av2d7yeXLvxLl+daw67cJm4If//l0Wwa2nnl2fwZi@lists.infradead.org
X-Gm-Message-State: AOJu0YwNK8miDI28bHpar5MMWFLH5OfBn8VL6KLxaGFGrjdDIO+UAIH2
	muELqVDhb2L+IDBhrl7qU+mjbv+tm9tTjHiiQ9XZ0a5eg223P/5gzwXwtrD2TOeXhdw=
X-Gm-Gg: ASbGncvVkdsktzBT7uNqPl5b3Dl96lA4b+mjnr8qEL1AsJZD8DoBG2JYguppkIqArOS
	I+wUB3pnEr2u67k4otjSJImEQuk7+BYK1dm+8kXSowd1BtGEwe6Oe6dozdrqFm1Hvx8/jAmP9K6
	kcN5hE15rbFQUeihrXZ/dBdrNOX4nOY2vALI/G1RGkVTY+mLjaF9O/BltAOMo2vK+jLq4gCXPFd
	PbO0jorzWlQeQWzgTJTVYyKO9f6mz8jhETKW18LhFK1dLgu8NgEGmV3wj7rRfplELUK6hOmZ6LU
	HC5C9nbZZ6ZhhVuSLLMvbX1rrLhJEUcic4XhcpJntOyCun2eXMHwKN3exUunbvKGS3lpGwgAHRy
	4kyQa5sM52HD+7agXF8SBz1wRIBj/GdLAhdrDblhlbedi
X-Google-Smtp-Source: AGHT+IErKNSDF6fGSUxu7uTin3OwoIqA+uAqwoNBYvN/bvRQQvIrBcXKk9r6zS33h/brxBiiTlCCzQ==
X-Received: by 2002:a05:690c:7442:b0:725:74c3:75eb with SMTP id 00721157ae682-73065da8ef0mr33696617b3.54.1757689804212;
        Fri, 12 Sep 2025 08:10:04 -0700 (PDT)
Received: from eugen-station.. ([145.224.119.89])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-624841586c1sm1302244d50.6.2025.09.12.08.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 08:10:03 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com,
	rdunlap@infradead.org,
	corbet@lwn.net,
	david@redhat.com,
	mhocko@suse.com
Cc: tudor.ambarus@linaro.org,
	mukesh.ojha@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	jonechou@google.com,
	rostedt@goodmis.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [RFC][PATCH v3 03/16] kmemdump: Add coreimage ELF layer
Date: Fri, 12 Sep 2025 18:08:42 +0300
Message-ID: <20250912150855.2901211-4-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912150855.2901211-1-eugen.hristev@linaro.org>
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_081005_656259_5A95B3FD 
X-CRM114-Status: GOOD (  29.84  )
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

Implement kmemdumping into an ELF coreimage.
With this feature enabled, kmemdump will assemble all the regions
into a coreimage, by having an initial first region with an ELF header,
a second region with vmcoreinfo data, and then register vital kernel
information in the subsequent regions.
This image can then be dumped, assembled into a single file and loaded
into debugging tools like crash/gdb.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 MAINTAINERS                      |   1 +
 include/linux/kmemdump.h         |  67 ++++++++++
 mm/kmemdump/Kconfig.debug        |  18 ++-
 mm/kmemdump/Makefile             |   1 +
 mm/kmemdump/kmemdump.c           |  32 +++++
 mm/kmemdump/kmemdump_coreimage.c | 222 +++++++++++++++++++++++++++++++
 6 files changed, 339 insertions(+), 2 deletions(-)
 create mode 100644 mm/kmemdump/kmemdump_coreimage.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 974f43c3902b..fc8cd34cf190 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13816,6 +13816,7 @@ S:	Maintained
 F:	Documentation/dev-tools/kmemdump.rst
 F:	include/linux/kmemdump.h
 F:	mm/kmemdump/kmemdump.c
+F:	mm/kmemdump/kmemdump_coreimage.c
 
 KMEMLEAK
 M:	Catalin Marinas <catalin.marinas@arm.com>
diff --git a/include/linux/kmemdump.h b/include/linux/kmemdump.h
index 8e764bb2d8ac..ac2eb1b4ba06 100644
--- a/include/linux/kmemdump.h
+++ b/include/linux/kmemdump.h
@@ -4,6 +4,52 @@
 
 enum kmemdump_uid {
 	KMEMDUMP_ID_START = 0,
+	KMEMDUMP_ID_COREIMAGE_ELF,
+	KMEMDUMP_ID_COREIMAGE_VMCOREINFO,
+	KMEMDUMP_ID_COREIMAGE_CONFIG,
+	KMEMDUMP_ID_COREIMAGE_MEMSECT,
+	KMEMDUMP_ID_COREIMAGE__totalram_pages,
+	KMEMDUMP_ID_COREIMAGE___cpu_possible_mask,
+	KMEMDUMP_ID_COREIMAGE___cpu_present_mask,
+	KMEMDUMP_ID_COREIMAGE___cpu_online_mask,
+	KMEMDUMP_ID_COREIMAGE___cpu_active_mask,
+	KMEMDUMP_ID_COREIMAGE_jiffies_64,
+	KMEMDUMP_ID_COREIMAGE_linux_banner,
+	KMEMDUMP_ID_COREIMAGE_nr_threads,
+	KMEMDUMP_ID_COREIMAGE_nr_irqs,
+	KMEMDUMP_ID_COREIMAGE_tainted_mask,
+	KMEMDUMP_ID_COREIMAGE_taint_flags,
+	KMEMDUMP_ID_COREIMAGE_mem_section,
+	KMEMDUMP_ID_COREIMAGE_node_data,
+	KMEMDUMP_ID_COREIMAGE_node_states,
+	KMEMDUMP_ID_COREIMAGE___per_cpu_offset,
+	KMEMDUMP_ID_COREIMAGE_nr_swapfiles,
+	KMEMDUMP_ID_COREIMAGE_init_uts_ns,
+	KMEMDUMP_ID_COREIMAGE_printk_rb_static,
+	KMEMDUMP_ID_COREIMAGE_printk_rb_dynamic,
+	KMEMDUMP_ID_COREIMAGE_prb,
+	KMEMDUMP_ID_COREIMAGE_prb_descs,
+	KMEMDUMP_ID_COREIMAGE_prb_infos,
+	KMEMDUMP_ID_COREIMAGE_prb_data,
+	KMEMDUMP_ID_COREIMAGE_runqueues,
+	KMEMDUMP_ID_COREIMAGE_high_memory,
+	KMEMDUMP_ID_COREIMAGE_init_mm,
+	KMEMDUMP_ID_COREIMAGE_init_mm_pgd,
+	KMEMDUMP_ID_COREIMAGE__sinittext,
+	KMEMDUMP_ID_COREIMAGE__einittext,
+	KMEMDUMP_ID_COREIMAGE__end,
+	KMEMDUMP_ID_COREIMAGE__text,
+	KMEMDUMP_ID_COREIMAGE__stext,
+	KMEMDUMP_ID_COREIMAGE__etext,
+	KMEMDUMP_ID_COREIMAGE_kallsyms_num_syms,
+	KMEMDUMP_ID_COREIMAGE_kallsyms_relative_base,
+	KMEMDUMP_ID_COREIMAGE_kallsyms_offsets,
+	KMEMDUMP_ID_COREIMAGE_kallsyms_names,
+	KMEMDUMP_ID_COREIMAGE_kallsyms_token_table,
+	KMEMDUMP_ID_COREIMAGE_kallsyms_token_index,
+	KMEMDUMP_ID_COREIMAGE_kallsyms_markers,
+	KMEMDUMP_ID_COREIMAGE_kallsyms_seqs_of_names,
+	KMEMDUMP_ID_COREIMAGE_swapper_pg_dir,
 	KMEMDUMP_ID_USER_START,
 	KMEMDUMP_ID_USER_END,
 	KMEMDUMP_ID_NO_ID,
@@ -60,4 +106,25 @@ static inline void kmemdump_unregister(enum kmemdump_uid id)
 }
 #endif
 
+#ifdef CONFIG_KMEMDUMP
+#ifdef CONFIG_KMEMDUMP_COREIMAGE
+int init_elfheader(void);
+void update_elfheader(const struct kmemdump_zone *z);
+int clear_elfheader(const struct kmemdump_zone *z);
+#else
+static inline int init_elfheader(void)
+{
+	return 0;
+}
+
+static inline void update_elfheader(const struct kmemdump_zone *z)
+{
+}
+
+static inline int clear_elfheader(const struct kmemdump_zone *z)
+{
+	return 0;
+}
+#endif
+#endif
 #endif
diff --git a/mm/kmemdump/Kconfig.debug b/mm/kmemdump/Kconfig.debug
index 5654180141c0..f62bde50a81b 100644
--- a/mm/kmemdump/Kconfig.debug
+++ b/mm/kmemdump/Kconfig.debug
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
-config KMEMDUMP
-	bool "KMEMDUMP: Allow the kernel to register memory regions for dumping purpose"
+menuconfig KMEMDUMP
+	bool "KMEMDUMP: Register memory regions for dumping purpose"
 	help
 	  Kmemdump mechanism allows any driver to mark a specific memory area
 	  for later dumping/debugging purpose, depending on the functionality
@@ -12,3 +12,17 @@ config KMEMDUMP
 
 	  Note that modules using this feature must be rebuilt if option
 	  changes.
+
+config KMEMDUMP_COREIMAGE
+	depends on KMEMDUMP
+	select VMCORE_INFO
+	bool "Assemble memory regions into a coredump readable with debuggers"
+	help
+	  Enabling this will assemble all the memory regions into a
+	  core ELF file. The first region will include program headers for
+	  all the regions. The second region is the vmcoreinfo and specific
+	  coredump structures.
+	  All the other regions follow. Specific kernel variables required
+	  for debug tools are being registered.
+	  The coredump file can then be loaded into GDB or crash  tool and
+	  further inspected.
diff --git a/mm/kmemdump/Makefile b/mm/kmemdump/Makefile
index f5b917a6ef5e..eed67f15a8d0 100644
--- a/mm/kmemdump/Makefile
+++ b/mm/kmemdump/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-y += kmemdump.o
+obj-$(CONFIG_KMEMDUMP_COREIMAGE) += kmemdump_coreimage.o
diff --git a/mm/kmemdump/kmemdump.c b/mm/kmemdump/kmemdump.c
index c016457620a4..3827b0597cac 100644
--- a/mm/kmemdump/kmemdump.c
+++ b/mm/kmemdump/kmemdump.c
@@ -28,6 +28,32 @@ static const struct kmemdump_backend kmemdump_default_backend = {
 static const struct kmemdump_backend *backend = &kmemdump_default_backend;
 static DEFINE_MUTEX(kmemdump_lock);
 static struct kmemdump_zone kmemdump_zones[MAX_ZONES];
+static bool kmemdump_initialized;
+
+static int __init init_kmemdump(void)
+{
+	enum kmemdump_uid uid;
+
+	init_elfheader();
+
+	mutex_lock(&kmemdump_lock);
+	/*
+	 * Some regions may have been registered very early.
+	 * Update the elf header for all existing regions,
+	 * except for KMEMDUMP_ID_COREIMAGE_ELF and
+	 * KMEMDUMP_ID_COREIMAGE_VMCOREINFO, those are included in the
+	 * ELF header upon its creation.
+	 */
+	for (uid = KMEMDUMP_ID_COREIMAGE_CONFIG; uid < MAX_ZONES; uid++)
+		if (kmemdump_zones[uid].id)
+			update_elfheader(&kmemdump_zones[uid]);
+
+	kmemdump_initialized = true;
+	mutex_unlock(&kmemdump_lock);
+
+	return 0;
+}
+late_initcall(init_kmemdump);
 
 /**
  * kmemdump_register_id() - Register region into kmemdump with given ID.
@@ -83,6 +109,9 @@ int kmemdump_register_id(enum kmemdump_uid req_id, void *zone, size_t size)
 	z->size = size;
 	z->id = uid;
 
+	if (kmemdump_initialized)
+		update_elfheader(z);
+
 	mutex_unlock(&kmemdump_lock);
 
 	return uid;
@@ -110,6 +139,9 @@ void kmemdump_unregister(enum kmemdump_uid id)
 
 	backend->unregister_region(backend, z->id);
 
+	if (kmemdump_initialized)
+		clear_elfheader(z);
+
 	memset(z, 0, sizeof(*z));
 
 	mutex_unlock(&kmemdump_lock);
diff --git a/mm/kmemdump/kmemdump_coreimage.c b/mm/kmemdump/kmemdump_coreimage.c
new file mode 100644
index 000000000000..a7b51a171d8e
--- /dev/null
+++ b/mm/kmemdump/kmemdump_coreimage.c
@@ -0,0 +1,222 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/io.h>
+#include <linux/elfcore.h>
+#include <linux/kmemdump.h>
+#include <linux/vmcore_info.h>
+
+#define CORE_STR "CORE"
+
+#define MAX_NUM_ENTRIES	201
+
+static struct elfhdr *ehdr;
+static size_t elf_offset;
+
+static void append_kcore_note(char *notes, size_t *i, const char *name,
+			      unsigned int type, const void *desc,
+			      size_t descsz)
+{
+	struct elf_note *note = (struct elf_note *)&notes[*i];
+
+	note->n_namesz = strlen(name) + 1;
+	note->n_descsz = descsz;
+	note->n_type = type;
+	*i += sizeof(*note);
+	memcpy(&notes[*i], name, note->n_namesz);
+	*i = ALIGN(*i + note->n_namesz, 4);
+	memcpy(&notes[*i], desc, descsz);
+	*i = ALIGN(*i + descsz, 4);
+}
+
+static void append_kcore_note_nodesc(char *notes, size_t *i, const char *name,
+				     unsigned int type, size_t descsz)
+{
+	struct elf_note *note = (struct elf_note *)&notes[*i];
+
+	note->n_namesz = strlen(name) + 1;
+	note->n_descsz = descsz;
+	note->n_type = type;
+	*i += sizeof(*note);
+	memcpy(&notes[*i], name, note->n_namesz);
+	*i = ALIGN(*i + note->n_namesz, 4);
+}
+
+static struct elf_phdr *elf_phdr_entry_addr(struct elfhdr *ehdr, int idx)
+{
+	struct elf_phdr *ephdr = (struct elf_phdr *)((size_t)ehdr + ehdr->e_phoff);
+
+	return &ephdr[idx];
+}
+
+/**
+ * clear_elfheader() - Remove the program header for a specific memory zone
+ * @z: pointer to the kmemdump zone
+ *
+ * Return: On success, it returns 0, errno otherwise
+ */
+int clear_elfheader(const struct kmemdump_zone *z)
+{
+	struct elf_phdr *phdr;
+	struct elf_phdr *tmp_phdr;
+	unsigned int phidx;
+	unsigned int i;
+
+	for (i = 0; i < ehdr->e_phnum; i++) {
+		phdr = elf_phdr_entry_addr(ehdr, i);
+		if (phdr->p_paddr == virt_to_phys(z->zone) &&
+		    phdr->p_memsz == ALIGN(z->size, 4))
+			break;
+	}
+
+	if (i == ehdr->e_phnum) {
+		pr_debug("Cannot find program header entry in elf\n");
+		return -EINVAL;
+	}
+
+	phidx = i;
+
+	/* Clear program header */
+	tmp_phdr = elf_phdr_entry_addr(ehdr, phidx);
+	for (i = phidx; i < ehdr->e_phnum - 1; i++) {
+		tmp_phdr = elf_phdr_entry_addr(ehdr, i + 1);
+		phdr = elf_phdr_entry_addr(ehdr, i);
+		memcpy(phdr, tmp_phdr, sizeof(*phdr));
+		phdr->p_offset = phdr->p_offset - ALIGN(z->size, 4);
+	}
+	memset(tmp_phdr, 0, sizeof(*tmp_phdr));
+	ehdr->e_phnum--;
+
+	elf_offset -= ALIGN(z->size, 4);
+
+	return 0;
+}
+
+/**
+ * update_elfheader() - Add the program header for a specific memory zone
+ * @z: pointer to the kmemdump zone
+ *
+ * Return: None
+ */
+void update_elfheader(const struct kmemdump_zone *z)
+{
+	struct elf_phdr *phdr;
+
+	phdr = elf_phdr_entry_addr(ehdr, ehdr->e_phnum++);
+
+	phdr->p_type = PT_LOAD;
+	phdr->p_offset = elf_offset;
+	phdr->p_vaddr = (elf_addr_t)z->zone;
+	phdr->p_paddr = (elf_addr_t)virt_to_phys(z->zone);
+	phdr->p_filesz = phdr->p_memsz = ALIGN(z->size, 4);
+	phdr->p_flags = PF_R | PF_W;
+
+	elf_offset += ALIGN(z->size, 4);
+}
+
+/**
+ * init_elfheader() - Prepare coreinfo elf header
+ *		This function prepares the elf header for the coredump image.
+ *		Initially there is a single program header for the elf NOTE.
+ *		The note contains the usual core dump information, and the
+ *		vmcoreinfo.
+ *
+ * Return: 0 on success, errno otherwise
+ */
+int init_elfheader(void)
+{
+	struct elf_phdr *phdr;
+	void *notes;
+	unsigned int elfh_size;
+	unsigned int phdr_off;
+	size_t note_len, i = 0;
+
+	struct elf_prstatus prstatus = {};
+	struct elf_prpsinfo prpsinfo = {
+		.pr_sname = 'R',
+		.pr_fname = "vmlinux",
+	};
+
+	/*
+	 * Header buffer contains:
+	 * ELF header, Note entry with PR status, PR ps info, and vmcoreinfo
+	 * MAX_NUM_ENTRIES Program headers,
+	 */
+	elfh_size = sizeof(*ehdr);
+	elfh_size += sizeof(struct elf_prstatus);
+	elfh_size += sizeof(struct elf_prpsinfo);
+	elfh_size += sizeof(VMCOREINFO_NOTE_NAME);
+	elfh_size += ALIGN(vmcoreinfo_size, 4);
+	elfh_size += (sizeof(*phdr)) * (MAX_NUM_ENTRIES);
+
+	elfh_size = ALIGN(elfh_size, 4);
+
+	/* Never freed */
+	ehdr = kzalloc(elfh_size, GFP_KERNEL);
+	if (!ehdr)
+		return -ENOMEM;
+
+	/* Assign Program headers offset, it's right after the elf header. */
+	phdr = (struct elf_phdr *)(ehdr + 1);
+	phdr_off = sizeof(*ehdr);
+
+	memcpy(ehdr->e_ident, ELFMAG, SELFMAG);
+	ehdr->e_ident[EI_CLASS] = ELF_CLASS;
+	ehdr->e_ident[EI_DATA] = ELF_DATA;
+	ehdr->e_ident[EI_VERSION] = EV_CURRENT;
+	ehdr->e_ident[EI_OSABI] = ELF_OSABI;
+	ehdr->e_type = ET_CORE;
+	ehdr->e_machine  = ELF_ARCH;
+	ehdr->e_version = EV_CURRENT;
+	ehdr->e_ehsize = sizeof(*ehdr);
+	ehdr->e_phentsize = sizeof(*phdr);
+
+	elf_offset = elfh_size;
+
+	notes = (void *)(((char *)ehdr) + elf_offset);
+
+	/* we have a single program header now */
+	ehdr->e_phnum = 1;
+
+	/* Length of the note is made of :
+	 * 3 elf notes structs (prstatus, prpsinfo, vmcoreinfo)
+	 * 3 notes names (2 core strings, 1 vmcoreinfo name)
+	 * sizeof each note
+	 */
+	note_len = (3 * sizeof(struct elf_note) +
+		    2 * ALIGN(sizeof(CORE_STR), 4) +
+		    VMCOREINFO_NOTE_NAME_BYTES +
+		    ALIGN(sizeof(struct elf_prstatus), 4) +
+		    ALIGN(sizeof(struct elf_prpsinfo), 4) +
+		    ALIGN(vmcoreinfo_size, 4));
+
+	phdr->p_type = PT_NOTE;
+	phdr->p_offset = elf_offset;
+	phdr->p_filesz = note_len;
+
+	/* advance elf offset */
+	elf_offset += note_len;
+
+	strscpy(prpsinfo.pr_psargs, saved_command_line,
+		sizeof(prpsinfo.pr_psargs));
+
+	append_kcore_note(notes, &i, CORE_STR, NT_PRSTATUS, &prstatus,
+			  sizeof(prstatus));
+	append_kcore_note(notes, &i, CORE_STR, NT_PRPSINFO, &prpsinfo,
+			  sizeof(prpsinfo));
+	append_kcore_note_nodesc(notes, &i, VMCOREINFO_NOTE_NAME, 0,
+				 ALIGN(vmcoreinfo_size, 4));
+
+	ehdr->e_phoff = phdr_off;
+
+	/* This is the first kmemdump region, the ELF header */
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_ELF, ehdr,
+			     elfh_size + note_len - ALIGN(vmcoreinfo_size, 4));
+
+	/*
+	 * The second region is the vmcoreinfo, which goes right after.
+	 * It's being registered through vmcoreinfo.
+	 */
+
+	return 0;
+}
+
-- 
2.43.0


