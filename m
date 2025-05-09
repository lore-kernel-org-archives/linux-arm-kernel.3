Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED57C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 08:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GFvYLK+ZL/SoGleIeevbdmFWcNzesKKgCsD+i6+wQu0=; b=JkY8eqgTM5HPE4Cp3oSnMazH8M
	dJxsPV2dvWGF9kmwMXCQr3hmqrNN6pybMMoiMuwiT+jgdsQ1EgxEYed0CowrxG24pwHHw+Nki14SB
	DL6Iug6l2SRKTKxXT7JwPbGmX654sDCHp/INXxR9gwfZtZLz39P9BqtlCMFdcAE4jg8kKDjXsYjKQ
	hRN2dw3fHcFJ01lHRyjR4u4SAV7VKpLplzHNXzszgITUiLHSiiu76zOyF92HLJ37pes1x2PXX6NwC
	yY4GM4nxvDB1yUZ0GnCMaAOYj5U9YAcKOn6i4geY0Gjakuv4E6Vs14kP5EAAU2I8lJK2qqlqKa6Ek
	OBG0rvJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDIhi-00000002r6T-48w1;
	Fri, 09 May 2025 08:03:34 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDIRw-00000002niT-1aMN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 07:47:17 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-739525d4d7bso1718349b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 00:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746776835; x=1747381635; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GFvYLK+ZL/SoGleIeevbdmFWcNzesKKgCsD+i6+wQu0=;
        b=Ij0HlNhew++dazr+daBhuESdJQP8GvHUhbbdXPy2jTnBEZHycUOdiK3qJIhx5Qn3UG
         /tXIRCAzxns0ZZpuQGOsQi3SzbsS1Kw/HaXoUv2t4DaTpAR0WrkPp3w0KXcfhtdTlkGf
         h4t3/J9PB6Y0feDzWKFmLWBfU09k6w7j6Z7YwI0RzGTpZul57HpBoH5FJP1sokCaqlUB
         Vzr3/GOTpZLrRbu2h6/osD9KMOeRCKKMLAVW9J3tS2L5APlJHHKlAc1RzCpCgomw8qX5
         T+TjYjWJLjdsKxq4hU37/z3Dq1mG+34UOdInwyTfh1gbwNJBtx2g/5Psb0aHwttt+u9K
         jcUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746776835; x=1747381635;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GFvYLK+ZL/SoGleIeevbdmFWcNzesKKgCsD+i6+wQu0=;
        b=LL2i8nNxt9sXqP5D7s/+hqA+b8aBYwwtHJQ1OVXcK4sqS6n9hNLyA2H65c+L5aW5xl
         +a/wqWLf+n5+f5fuP+vDuODvACzB/2m7zsaaKtM+U+UAYCuT1h72MkoVdm1hDMU2qKiQ
         IA17MdPIgGlxhcYbZ0qzS+gGPrmnX9PrM1om6hOiNAWJH29vKNbW+gM4Kb/kek4ujQWM
         ZJHF5pIbu8PZeSho78TYw8r0vwOpng4D6SOzOV+wDJpcVjXrf3KAb84iQz9gLuY+4uKr
         H2a6pUi6f5eX6d+uGFp5yX5N9AiguKJTLY6IycTWi7fScbjp5oMeWUamDEZ7gu/OGSbN
         GDQw==
X-Forwarded-Encrypted: i=1; AJvYcCWBEgtuiCehlEVMjsoTQaZ8OXOsmzPnB3ZZr72P81c8HT6BXq+qfThZyHKBsKegM9s5t+PEt6eG8m12E1r1TLBu@lists.infradead.org
X-Gm-Message-State: AOJu0Ywgm0ASjxxQ0VXIgMf4X4+YhBlSvBBUb0VROz1R94/jiSZPgB0a
	pLCKTuHSzOhEY8QAu9zLHQkx2DYkQRU2NbSpmH8v1gzfej3EZ3lIve2qP92k7q6siQuCHY0Vv1t
	RF9VjEeFsmJhM7jzkMQ==
X-Google-Smtp-Source: AGHT+IHoXD/iPEv9R0ck8JE0X2BEO15ZWlihBiuBxq/VD+tog9vvDo/xTXjQN1YF2y2CswQzZ14kMxX0B0iv6xJy
X-Received: from pgbcs12.prod.google.com ([2002:a05:6a02:418c:b0:b14:9718:f939])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:a11e:b0:1f5:5903:edd3 with SMTP id adf61e73a8af0-215abafb67fmr2914671637.11.1746776835249;
 Fri, 09 May 2025 00:47:15 -0700 (PDT)
Date: Fri,  9 May 2025 00:46:29 -0700
In-Reply-To: <20250509074635.3187114-1-changyuanl@google.com>
Mime-Version: 1.0
References: <20250509074635.3187114-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.1015.ga840276032-goog
Message-ID: <20250509074635.3187114-12-changyuanl@google.com>
Subject: [PATCH v8 11/17] x86/kexec: add support for passing kexec handover
 (KHO) data
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
X-CRM114-CacheID: sfid-20250509_004716_448912_B7B4C9C3 
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

kexec handover (KHO) creates a metadata that the kernels pass between each
other during kexec. This metadata is stored in memory and kexec image
contains a (physical) pointer to that memory.

In addition, KHO keeps "scratch regions" available for kexec: physically
contiguous memory regions that are guaranteed to not have any memory that
KHO would preserve. The new kernel bootstraps itself using the scratch
regions and sets all handed over memory as in use. When subsystems that
support KHO initialize, they introspect the KHO metadata, restore preserved
memory regions, and retrieve their state stored in the preserved memory.

Enlighten x86 kexec-file and boot path about the KHO metadata and make sure
it gets passed along to the next kernel.

Signed-off-by: Alexander Graf <graf@amazon.com>
Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Co-developed-by: Changyuan Lyu <changyuanl@google.com>
Signed-off-by: Changyuan Lyu <changyuanl@google.com>
Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
---
 arch/x86/include/asm/setup.h           |  2 ++
 arch/x86/include/uapi/asm/setup_data.h | 13 ++++++++-
 arch/x86/kernel/kexec-bzimage64.c      | 37 ++++++++++++++++++++++++++
 arch/x86/kernel/setup.c                | 26 ++++++++++++++++++
 4 files changed, 77 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/setup.h b/arch/x86/include/asm/setup.h
index ad9212df0ec0c..3b37571911f4c 100644
--- a/arch/x86/include/asm/setup.h
+++ b/arch/x86/include/asm/setup.h
@@ -67,6 +67,8 @@ extern void x86_ce4100_early_setup(void);
 static inline void x86_ce4100_early_setup(void) { }
 #endif
 
+#include <linux/kexec_handover.h>
+
 #ifndef _SETUP
 
 #include <asm/espfix.h>
diff --git a/arch/x86/include/uapi/asm/setup_data.h b/arch/x86/include/uapi/asm/setup_data.h
index 50c45ead4e7c9..2671c4e1b3a0b 100644
--- a/arch/x86/include/uapi/asm/setup_data.h
+++ b/arch/x86/include/uapi/asm/setup_data.h
@@ -13,7 +13,8 @@
 #define SETUP_CC_BLOB			7
 #define SETUP_IMA			8
 #define SETUP_RNG_SEED			9
-#define SETUP_ENUM_MAX			SETUP_RNG_SEED
+#define SETUP_KEXEC_KHO			10
+#define SETUP_ENUM_MAX			SETUP_KEXEC_KHO
 
 #define SETUP_INDIRECT			(1<<31)
 #define SETUP_TYPE_MAX			(SETUP_ENUM_MAX | SETUP_INDIRECT)
@@ -78,6 +79,16 @@ struct ima_setup_data {
 	__u64 size;
 } __attribute__((packed));
 
+/*
+ * Locations of kexec handover metadata
+ */
+struct kho_data {
+	__u64 fdt_addr;
+	__u64 fdt_size;
+	__u64 scratch_addr;
+	__u64 scratch_size;
+} __attribute__((packed));
+
 #endif /* __ASSEMBLER__ */
 
 #endif /* _UAPI_ASM_X86_SETUP_DATA_H */
diff --git a/arch/x86/kernel/kexec-bzimage64.c b/arch/x86/kernel/kexec-bzimage64.c
index 68530fad05f74..dad174e3bed0d 100644
--- a/arch/x86/kernel/kexec-bzimage64.c
+++ b/arch/x86/kernel/kexec-bzimage64.c
@@ -233,6 +233,32 @@ setup_ima_state(const struct kimage *image, struct boot_params *params,
 #endif /* CONFIG_IMA_KEXEC */
 }
 
+static void setup_kho(const struct kimage *image, struct boot_params *params,
+		      unsigned long params_load_addr,
+		      unsigned int setup_data_offset)
+{
+	struct setup_data *sd = (void *)params + setup_data_offset;
+	struct kho_data *kho = (void *)sd + sizeof(*sd);
+
+	if (!IS_ENABLED(CONFIG_KEXEC_HANDOVER))
+		return;
+
+	sd->type = SETUP_KEXEC_KHO;
+	sd->len = sizeof(struct kho_data);
+
+	/* Only add if we have all KHO images in place */
+	if (!image->kho.fdt || !image->kho.scratch)
+		return;
+
+	/* Add setup data */
+	kho->fdt_addr = image->kho.fdt;
+	kho->fdt_size = PAGE_SIZE;
+	kho->scratch_addr = image->kho.scratch->mem;
+	kho->scratch_size = image->kho.scratch->bufsz;
+	sd->next = params->hdr.setup_data;
+	params->hdr.setup_data = params_load_addr + setup_data_offset;
+}
+
 static int
 setup_boot_parameters(struct kimage *image, struct boot_params *params,
 		      unsigned long params_load_addr,
@@ -312,6 +338,13 @@ setup_boot_parameters(struct kimage *image, struct boot_params *params,
 				     sizeof(struct ima_setup_data);
 	}
 
+	if (IS_ENABLED(CONFIG_KEXEC_HANDOVER)) {
+		/* Setup space to store preservation metadata */
+		setup_kho(image, params, params_load_addr, setup_data_offset);
+		setup_data_offset += sizeof(struct setup_data) +
+				     sizeof(struct kho_data);
+	}
+
 	/* Setup RNG seed */
 	setup_rng_seed(params, params_load_addr, setup_data_offset);
 
@@ -479,6 +512,10 @@ static void *bzImage64_load(struct kimage *image, char *kernel,
 		kbuf.bufsz += sizeof(struct setup_data) +
 			      sizeof(struct ima_setup_data);
 
+	if (IS_ENABLED(CONFIG_KEXEC_HANDOVER))
+		kbuf.bufsz += sizeof(struct setup_data) +
+			      sizeof(struct kho_data);
+
 	params = kzalloc(kbuf.bufsz, GFP_KERNEL);
 	if (!params)
 		return ERR_PTR(-ENOMEM);
diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 766176c4f5ee8..664cd21b85329 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -451,6 +451,29 @@ int __init ima_get_kexec_buffer(void **addr, size_t *size)
 }
 #endif
 
+static void __init add_kho(u64 phys_addr, u32 data_len)
+{
+	struct kho_data *kho;
+	u64 addr = phys_addr + sizeof(struct setup_data);
+	u64 size = data_len - sizeof(struct setup_data);
+
+	if (!IS_ENABLED(CONFIG_KEXEC_HANDOVER)) {
+		pr_warn("Passed KHO data, but CONFIG_KEXEC_HANDOVER not set. Ignoring.\n");
+		return;
+	}
+
+	kho = early_memremap(addr, size);
+	if (!kho) {
+		pr_warn("setup: failed to memremap kho data (0x%llx, 0x%llx)\n",
+			addr, size);
+		return;
+	}
+
+	kho_populate(kho->fdt_addr, kho->fdt_size, kho->scratch_addr, kho->scratch_size);
+
+	early_memunmap(kho, size);
+}
+
 static void __init parse_setup_data(void)
 {
 	struct setup_data *data;
@@ -479,6 +502,9 @@ static void __init parse_setup_data(void)
 		case SETUP_IMA:
 			add_early_ima_buffer(pa_data);
 			break;
+		case SETUP_KEXEC_KHO:
+			add_kho(pa_data, data_len);
+			break;
 		case SETUP_RNG_SEED:
 			data = early_memremap(pa_data, data_len);
 			add_bootloader_randomness(data->data, data->len);
-- 
2.49.0.1015.ga840276032-goog


