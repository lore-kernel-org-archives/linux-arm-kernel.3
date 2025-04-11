Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC1CC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 05:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XwVp4OOgPlRngbn5ra+015ZDy9PB79QtA1kcHgCX6xE=; b=Q60qE8EzwQyxLecu9DW5ZqfEr8
	lOcTQUmfunjGcLnM1Dlgf6o3hW0LAAmEaoJWXKlfogIXJB2qcZthyOQB2I9UUAE/mqX4LDnR2pQhc
	wegnMJdAADz279FUtVD+FUMt5g4Fe6p0IPM9S3okdPAF+K7HkwCmI7bRRu+uZVVyc7qhfGsBC8qeU
	V18+6b0D2QxFvAaErYtUqmH4HKP+EsNtlce/xKg99y3t9L6gEsJF1MkRwVMUlW5kqF6Ap0qXvcSQT
	RdGSsKDkfAEb8bzFp/FO4cV+zoKHR4wv8z/hYcocAG9nbPJdsNhJorYPY676ZY4gtBvgfOK+QlqJV
	lz+dxWtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u37No-0000000Cde3-2Qez;
	Fri, 11 Apr 2025 05:56:56 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3765-0000000CYZs-0R0k
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 05:38:39 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-afd3f1adff7so2036536a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Apr 2025 22:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744349916; x=1744954716; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XwVp4OOgPlRngbn5ra+015ZDy9PB79QtA1kcHgCX6xE=;
        b=XcCyzyNCYuxL55YtJOdc43lajx4uMzC4gdQO3YQSAVgdR77lC8tcccJcCSAdlMMMSd
         gJHi+1/fZTSeH6UlqghBCd4kL0XHVYRQeULsGO8LaeCDtecs/YSp0q/NrN9ku7yKf7ea
         c91zuWJ+8Xkg2wMyphM797e4uBbZ91vqo54uGuygmeCz6guQk9SH/mvhK9BI3xw81WNN
         qpKOhidS3rhUPxudRAnb8jDA7fQbWGMX3hZ+rBZtJLr6BID4ZVEwOTdrgwxwWOOEhgtM
         PM19/TsPWD5Q4D8u59hmcjypaUH2uU2ZUGkLc1gVPROqtruOPYpX+gQAgZtHVKbecrH4
         WYCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744349916; x=1744954716;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XwVp4OOgPlRngbn5ra+015ZDy9PB79QtA1kcHgCX6xE=;
        b=lFDgK1C3Qs8SsgwCUlMArvWG2O1EamSy62kCbbk19AI8L4AdVm8K0KIcujb7WHXwjr
         6UpzSutQ4JpOM1vmUXnJ/j39p2I/Uhk02e18iCNHtFLpYIzIAAwnG9H7PrFBcW1tmtIB
         VHTWYBBxEywva+nsF9PSXCkJT5gwic0krpAoFMRFFTf9HntLpxJpMYoiF+pPCwUZblwR
         GCGlWMwVOErwyIurDrphJsRTALgRNl/UcyMDt+vw5KYTWSQwpY3o5prdgR2Fr0h1Crwj
         DtIFU6OfFqVRX+3uIXC8NdP09JH/3jyNaobii3DfSVKg06d8iEcq7TOXp7j0kvoV0KE9
         fgqg==
X-Forwarded-Encrypted: i=1; AJvYcCUdjBaYEJbm5dPItINctFR8/OqDkNkNpU8Z9IS08IRjke79vcAlv3ZpXBy7L+gSPI8c6yS7EPRQUOyWyC9HZHqw@lists.infradead.org
X-Gm-Message-State: AOJu0YxSS+mTZNhNt8QHwmdKbZUglkPh5QTYkK27qooYGpZIM6Rpfq5l
	twjBdVkwmK9XOIi2lvOz6dLegT/Tiv0dZj1eaNm0lUsysSROqUBAFNtdB+O6oSHJgx6+wH7eI+h
	MDl/rXYnlCORxjtt7ew==
X-Google-Smtp-Source: AGHT+IHxdPnuc2TYfLwCd9IDe8ouX7KQHFzd57k3DfleSG8BDX2oEcNCF76lTSltuytpC8emM71yRGFfu+F93+HC
X-Received: from plgf6.prod.google.com ([2002:a17:902:ce86:b0:223:fb3a:ac08])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ebcb:b0:21a:7e04:7021 with SMTP id d9443c01a7336-22bea0c6794mr26802705ad.24.1744349915769;
 Thu, 10 Apr 2025 22:38:35 -0700 (PDT)
Date: Thu, 10 Apr 2025 22:37:40 -0700
In-Reply-To: <20250411053745.1817356-1-changyuanl@google.com>
Mime-Version: 1.0
References: <20250411053745.1817356-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250411053745.1817356-10-changyuanl@google.com>
Subject: [PATCH v6 09/14] arm64: add KHO support
From: Changyuan Lyu <changyuanl@google.com>
To: linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org, anthony.yznaga@oracle.com, arnd@arndb.de, 
	ashish.kalra@amd.com, benh@kernel.crashing.org, bp@alien8.de, 
	catalin.marinas@arm.com, corbet@lwn.net, dave.hansen@linux.intel.com, 
	devicetree@vger.kernel.org, dwmw2@infradead.org, ebiederm@xmission.com, 
	graf@amazon.com, hpa@zytor.com, jgowans@amazon.com, kexec@lists.infradead.org, 
	krzk@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, luto@kernel.org, 
	mark.rutland@arm.com, mingo@redhat.com, pasha.tatashin@soleen.com, 
	pbonzini@redhat.com, peterz@infradead.org, ptyadav@amazon.de, robh@kernel.org, 
	rostedt@goodmis.org, rppt@kernel.org, saravanak@google.com, 
	skinsburskii@linux.microsoft.com, tglx@linutronix.de, thomas.lendacky@amd.com, 
	will@kernel.org, x86@kernel.org, Changyuan Lyu <changyuanl@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_223837_170860_94FCF6AB 
X-CRM114-Status: GOOD (  18.93  )
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

Changes to the "chosen" node have been sent to
https://github.com/devicetree-org/dt-schema/pull/158.

Signed-off-by: Alexander Graf <graf@amazon.com>
Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Co-developed-by: Changyuan Lyu <changyuanl@google.com>
Signed-off-by: Changyuan Lyu <changyuanl@google.com>
---
 arch/arm64/Kconfig |  3 +++
 drivers/of/fdt.c   | 34 ++++++++++++++++++++++++++++++++++
 drivers/of/kexec.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 79 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index a182295e6f08b..34c79f4fee3f9 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1602,6 +1602,9 @@ config ARCH_SUPPORTS_KEXEC_IMAGE_VERIFY_SIG
 config ARCH_DEFAULT_KEXEC_IMAGE_VERIFY_SIG
 	def_bool y
 
+config ARCH_SUPPORTS_KEXEC_HANDOVER
+	def_bool y
+
 config ARCH_SUPPORTS_CRASH_DUMP
 	def_bool y
 
diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index aedd0e2dcd890..0edd639898a63 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -25,6 +25,7 @@
 #include <linux/serial_core.h>
 #include <linux/sysfs.h>
 #include <linux/random.h>
+#include <linux/kexec_handover.h>
 
 #include <asm/setup.h>  /* for COMMAND_LINE_SIZE */
 #include <asm/page.h>
@@ -875,6 +876,36 @@ void __init early_init_dt_check_for_usable_mem_range(void)
 		memblock_add(rgn[i].base, rgn[i].size);
 }
 
+/**
+ * early_init_dt_check_kho - Decode info required for kexec handover from DT
+ */
+static void __init early_init_dt_check_kho(void)
+{
+	unsigned long node = chosen_node_offset;
+	u64 fdt_start, fdt_size, scratch_start, scratch_size;
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
+	fdt_start = dt_mem_next_cell(dt_root_addr_cells, &p);
+	fdt_size = dt_mem_next_cell(dt_root_addr_cells, &p);
+
+	p = of_get_flat_dt_prop(node, "linux,kho-scratch", &l);
+	if (l != (dt_root_addr_cells + dt_root_size_cells) * sizeof(__be32))
+		return;
+
+	scratch_start = dt_mem_next_cell(dt_root_addr_cells, &p);
+	scratch_size = dt_mem_next_cell(dt_root_addr_cells, &p);
+
+	kho_populate(fdt_start, fdt_size, scratch_start, scratch_size);
+}
+
 #ifdef CONFIG_SERIAL_EARLYCON
 
 int __init early_init_dt_scan_chosen_stdout(void)
@@ -1169,6 +1200,9 @@ void __init early_init_dt_scan_nodes(void)
 
 	/* Handle linux,usable-memory-range property */
 	early_init_dt_check_for_usable_mem_range();
+
+	/* Handle kexec handover */
+	early_init_dt_check_kho();
 }
 
 bool __init early_init_dt_scan(void *dt_virt, phys_addr_t dt_phys)
diff --git a/drivers/of/kexec.c b/drivers/of/kexec.c
index 5b924597a4deb..1ee2d31816aeb 100644
--- a/drivers/of/kexec.c
+++ b/drivers/of/kexec.c
@@ -264,6 +264,43 @@ static inline int setup_ima_buffer(const struct kimage *image, void *fdt,
 }
 #endif /* CONFIG_IMA_KEXEC */
 
+static int kho_add_chosen(const struct kimage *image, void *fdt, int chosen_node)
+{
+	int ret = 0;
+#ifdef CONFIG_KEXEC_HANDOVER
+	phys_addr_t fdt_mem = 0;
+	phys_addr_t fdt_len = 0;
+	phys_addr_t scratch_mem = 0;
+	phys_addr_t scratch_len = 0;
+
+	ret = fdt_delprop(fdt, chosen_node, "linux,kho-fdt");
+	if (ret && ret != -FDT_ERR_NOTFOUND)
+		return ret;
+	ret = fdt_delprop(fdt, chosen_node, "linux,kho-scratch");
+	if (ret && ret != -FDT_ERR_NOTFOUND)
+		return ret;
+
+	if (!image->kho.fdt || !image->kho.scratch)
+		return 0;
+
+	fdt_mem = image->kho.fdt;
+	fdt_len = PAGE_SIZE;
+	scratch_mem = image->kho.scratch->mem;
+	scratch_len = image->kho.scratch->bufsz;
+
+	pr_debug("Adding kho metadata to DT");
+
+	ret = fdt_appendprop_addrrange(fdt, 0, chosen_node, "linux,kho-fdt",
+				       fdt_mem, fdt_len);
+	if (ret)
+		return ret;
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
@@ -414,6 +451,11 @@ void *of_kexec_alloc_and_setup_fdt(const struct kimage *image,
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
2.49.0.604.gff1f9ca942-goog


