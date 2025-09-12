Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47431CAC58F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 15:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UNgnuqtXCBxfx2G2dXAsaT/aGFlSDDhwnEcansq3QOI=; b=IxIN5LXglZwZRuNDObQp5pFxo2
	qPItb3Oh4R3KQcsXz0Fq3ZXK0APzwzvjabOkMxrO0oN/di1Ano5ldHK4/w/nY+1/LOeO6yagN6w1H
	yePAkThFwS5EcKzvKO8AYZFg0ChBl4r5D0na5Si6CRH/FA+LhGIbQFHE2TuF3FPvXYJ+kqkWgxgB5
	3zv/o5+hDITL/mnovHNcLNspT9+kPgrnUTVUv3Vnc95e3G94MMc0i1ydp0W2PBrFgbpWEUM97uU7l
	Dm2EnEiTZyM1a0pn5mtjMiRon2G+9kwFqx4sdm5XcHGkZuh3zCwtCHMOSuGvHdDCAhWhFenjV3uSN
	uzJ6X6RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux5QY-0000000A8sH-0Lx3;
	Fri, 12 Sep 2025 15:11:06 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux5QW-0000000A8pV-14bn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 15:11:05 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-e96ff16fea1so1436939276.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 08:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757689863; x=1758294663; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNgnuqtXCBxfx2G2dXAsaT/aGFlSDDhwnEcansq3QOI=;
        b=Rn5/3rI36W/JgJzT5hj3fMpHhqDVNaXmGduEfN7WzIMpWKUAfvdk7Jqm+nhD8eNu+0
         yeM2cEsB6/S+FiHH+LTXGKCPBidypyj7EOyS6YmIb0qb+LjQV11WnhSPH0MSESo2OjrN
         fLRgyOCVTsq1gkW315yhUv8kvgyEymiQtWXaOLJRPV1/GEMfnrQwBbeQ33FyPfj20G3v
         jFgIUNypJZ93GUhMF71xGvT1T1nnV7HdEVoeqmrPim9J4PDLynjUNlI5J7dTwQHOrERO
         ydQ0j1z/2p8RoQBZE3RgWNfqXjnQK+aNpWOVajE2dGfKahEOPOCZYZm1WzDyrE1AdRo+
         eirw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757689863; x=1758294663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UNgnuqtXCBxfx2G2dXAsaT/aGFlSDDhwnEcansq3QOI=;
        b=bU+S3YDw1oD98cBeyqb/6rxLA4LNquJvIhZYd4KdolZPoD7NCMJgmlFVlDR25q+GiU
         nRuYFB6YX0tqJm8PqLIqcCPMiAPztpmQOdPzWMj4Zp/Kc1I6MbBa/uGMIqZHIQjxEhia
         Mm4tkHmEiB3nZZnOt7bv4Ed4PbpZcknAPyut3JlohyfG7bNdpMjp+TAdVyecXw6iC6SA
         euj02wi2j303XhspKzeMZUs5Y6k/A0Y22W9y4t1h9uDuuTAGb1asuUxjWWf5BRSBAJZl
         l6iyO3jFWs1tidsRhNlKk2Zx++cSk+uvERqozOS0pCVZB6P+Z4VKRKCYC7Vbkcxyup5O
         W8cw==
X-Forwarded-Encrypted: i=1; AJvYcCUTCW3X2O70gk7vv6JlvcI4huzMYfeTF4DP2vLHqpkIQQzNmG2h9Krtn8jpXZiUpzXBxHYwSuxuVxYMAnNzrBtC@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0m/dBw1Mr9ZwPbQ6qN6bYO7TqRzW9A0lbWajh4LTi88eyMKUs
	odOHRHo17tEBhZAYLTs37e2qkQ4B5rwCxIQ0zUQcStw0RqjqIRsJHVuY32rSaR+IYJ0=
X-Gm-Gg: ASbGnctTYpzzuXy2jUXyYhANc7sQHcVVoB8vZehQW1iELkqhRGF+EeAOPz3XR1Ylseu
	GOOj/p2SQIE9NbKvcqUis3yvqghmyn+9knrd6yqpoJgn1etDTQOKoJd/PgbTIR1Ezat2ryDqrtZ
	8tHCg6XZ3oCwL2ANiZ34RkHtK8BxYLGGf5r3eoYtRL7v2l5lez3Mrg3zi1yahDEB3Q/KcvY6uos
	IAbmIKQpYzipmN2R34IFkhE/Ah+jxro4gh+fnFRSoISTU70Ssm8i5Wlx2rO6JhIey7LF7YJGhbj
	vO8isy0DBnQz2TrsEGihAw/Y5syGYdXfScocCSsNnOnmLVvy63SinnKuD45ckZCnR0P4im14Uhr
	CFeBMCGMmYynb+3nfoUPM6L1hARHSL+vPtg==
X-Google-Smtp-Source: AGHT+IEtne9c9aNxfz8OotnYXAiNsAB4JCtq87oaoJ7ML/Nd9NUoYp51pIa4pWBpc4rPSN6ehP6TAw==
X-Received: by 2002:a05:690c:9688:b0:721:1c48:a627 with SMTP id 00721157ae682-730627c990emr26695147b3.6.1757689862953;
        Fri, 12 Sep 2025 08:11:02 -0700 (PDT)
Received: from eugen-station.. ([145.224.119.89])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-624841586c1sm1302244d50.6.2025.09.12.08.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 08:11:02 -0700 (PDT)
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
Subject: [RFC][PATCH v3 14/16] kernel/vmcoreinfo: Register kmemdump core image information
Date: Fri, 12 Sep 2025 18:08:53 +0300
Message-ID: <20250912150855.2901211-15-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912150855.2901211-1-eugen.hristev@linaro.org>
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_081104_346233_8AE2607D 
X-CRM114-Status: GOOD (  13.10  )
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

The coreimage generated by kmemdump requires some kernel information
in order to be successfully loaded by `crash` or gdb.
Register all this information through vmcoreinfo once vmcoreinfo is setup.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/vmcore_info.c | 141 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 141 insertions(+)

diff --git a/kernel/vmcore_info.c b/kernel/vmcore_info.c
index 3e2e846ba9c8..1d83e95cf9be 100644
--- a/kernel/vmcore_info.c
+++ b/kernel/vmcore_info.c
@@ -15,6 +15,7 @@
 #include <linux/memblock.h>
 #include <linux/kmemleak.h>
 #include <linux/kmemdump.h>
+#include <linux/sched/stat.h>
 
 #include <asm/page.h>
 #include <asm/sections.h>
@@ -24,6 +25,17 @@
 #include "kallsyms_internal.h"
 #include "kexec_internal.h"
 
+void sched_get_runqueues_area(void **start, size_t *size);
+
+extern unsigned int nr_irqs;
+extern unsigned long tainted_mask;
+extern unsigned int nr_swapfiles;
+
+#ifdef CONFIG_IKCONFIG_PROC
+extern char kernel_config_data;
+extern char kernel_config_data_end;
+#endif
+
 /* vmcoreinfo stuff */
 unsigned char *vmcoreinfo_data;
 size_t vmcoreinfo_size;
@@ -121,8 +133,137 @@ EXPORT_SYMBOL(paddr_vmcoreinfo_note);
 
 static void vmcoreinfo_kmemdump(void)
 {
+	void *start;
+	size_t size;
+	int i;
+
 	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_VMCOREINFO,
 			     (void *)vmcoreinfo_data, vmcoreinfo_size);
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_linux_banner,
+			     (void *)&linux_banner, banner_len);
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_init_uts_ns,
+			     (void *)&init_uts_ns, sizeof(init_uts_ns));
+
+	sched_get_runqueues_area(&start, &size);
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_runqueues,
+			     (void *)start, size);
+
+#ifdef CONFIG_IKCONFIG_PROC
+	/* Register 8 bytes before and after, to catch the marker too */
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_CONFIG,
+			     (void *)&kernel_config_data - 8,
+			     &kernel_config_data_end - &kernel_config_data + 16);
+#endif
+
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE___cpu_possible_mask,
+			     (void *)&__cpu_possible_mask,
+			     sizeof(__cpu_possible_mask));
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE___cpu_active_mask,
+			     (void *)&__cpu_active_mask,
+			     sizeof(__cpu_active_mask));
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE___cpu_online_mask,
+			     (void *)&__cpu_online_mask,
+			     sizeof(__cpu_online_mask));
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE___cpu_present_mask,
+			     (void *)&__cpu_present_mask,
+			     sizeof(__cpu_present_mask));
+
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_nr_irqs,
+			     (void *)&nr_irqs, sizeof(nr_irqs));
+
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_tainted_mask,
+			     (void *)&tainted_mask, sizeof(tainted_mask));
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_taint_flags,
+			     (void *)&taint_flags, sizeof(taint_flags));
+
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_jiffies_64,
+			     (void *)&jiffies_64, sizeof(jiffies_64));
+
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_nr_threads,
+			     (void *)&nr_threads, sizeof(nr_threads));
+
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_node_states,
+			     (void *)&node_states, sizeof(node_states));
+
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_init_mm,
+			     (void *)&init_mm, sizeof(init_mm));
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_init_mm_pgd,
+			     (void *)&init_mm.pgd, sizeof(*init_mm.pgd));
+
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE__totalram_pages,
+			     (void *)&_totalram_pages, sizeof(_totalram_pages));
+
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_nr_swapfiles,
+			     (void *)&nr_swapfiles, sizeof(nr_swapfiles));
+
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE___per_cpu_offset,
+			     (void *)&__per_cpu_offset, sizeof(__per_cpu_offset));
+
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_high_memory,
+			     (void *)&high_memory, sizeof(high_memory));
+#ifdef CONFIG_NUMA
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_node_data,
+			     (void *)&node_data,
+			     MAX_NUMNODES * sizeof(struct pglist_data));
+
+	for (i = 0; i < MAX_NUMNODES; i++) {
+		if (!NODE_DATA(i))
+			continue;
+		kmemdump_register((void *)NODE_DATA(i),
+				  roundup(sizeof(pg_data_t), SMP_CACHE_BYTES));
+	}
+#endif
+
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_mem_section,
+			     (void *)&mem_section, sizeof(mem_section));
+	for (i = 0; i < NR_SECTION_ROOTS; i++) {
+		if (!mem_section[i])
+			continue;
+		kmemdump_register((void *)mem_section[i],
+				  SECTIONS_PER_ROOT * sizeof(struct mem_section));
+	}
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_MEMSECT,
+			     (void *)mem_section,
+			     sizeof(struct mem_section *) * NR_SECTION_ROOTS);
+
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_kallsyms_num_syms,
+			     (void *)&kallsyms_num_syms,
+			     sizeof(kallsyms_num_syms));
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_kallsyms_relative_base,
+			     (void *)&kallsyms_relative_base,
+			     sizeof(kallsyms_relative_base));
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_kallsyms_offsets,
+			     (void *)&kallsyms_offsets,
+			     sizeof(&kallsyms_offsets));
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_kallsyms_names,
+			     (void *)&kallsyms_names,
+			     sizeof(&kallsyms_names));
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_kallsyms_token_table,
+			     (void *)&kallsyms_token_table,
+			     sizeof(&kallsyms_token_table));
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_kallsyms_token_index,
+			     (void *)&kallsyms_token_index,
+			     sizeof(&kallsyms_token_index));
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_kallsyms_markers,
+			     (void *)&kallsyms_markers,
+			     sizeof(&kallsyms_markers));
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_kallsyms_seqs_of_names,
+			     (void *)&kallsyms_seqs_of_names,
+			     sizeof(&kallsyms_seqs_of_names));
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE__sinittext,
+			     (void *)&_sinittext, sizeof(&_sinittext));
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE__einittext,
+			     (void *)&_einittext, sizeof(&_einittext));
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE__end,
+			     (void *)&_end, sizeof(&_end));
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE__text,
+			     (void *)&_text, sizeof(&_text));
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE__stext,
+			     (void *)&_stext, sizeof(&_stext));
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE__etext,
+			     (void *)&_etext, sizeof(&_etext));
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_swapper_pg_dir,
+			     (void *)&swapper_pg_dir, sizeof(&swapper_pg_dir));
 }
 
 static int __init crash_save_vmcoreinfo_init(void)
-- 
2.43.0


