Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A249D3CC88
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 00:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gZMvfwQ4Hlm3TIovlOL6vMdTiejp6wE8OmDKDcw/1gY=; b=o0EpgH2YQKyIYOa6KJCCxQtxtY
	QooUVxsGk1FhcpX+roPZWTA35j5ijSpvbrZMl7KEvdYWvfY2vbjGkGKaRkg+/JdB7HzoKZK2C62e8
	5EfPlVjo6TQ1M6XATQrIaBv6Kn9cpk2iHWprbfb5Rw7a1eHlt5x3hmB0C7zfMpjEe8wP9T70N5VMK
	eXs9ZLiY3RgyPS59a4yQ0VjX4BUnH7St2hhxwwzB/uogjTLBURB20yLLV7LeyhvvMgeOAsEOgaZqr
	5Mg6/KKFNVLzW4KQ3XYBgt9j0WBeRPRYC5YrXWkJZ81JYSiCFvoIsFstSMalmO1MyswcDii8BmSNZ
	OlF9olSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgBSm-0000000BGrq-0hZF;
	Thu, 15 Jan 2026 00:43:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgBSj-0000000BGqR-2FyB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 00:43:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768437822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gZMvfwQ4Hlm3TIovlOL6vMdTiejp6wE8OmDKDcw/1gY=;
	b=ZZwWJvpzITTL65WxrE+2ZZC4JoF6YjBs/v4KLobeO9HrK9ob+R6RvSPocMPTahk3OCJVoD
	BDnXyDabSAefR2OsZGTCeH9Mkv2d+gonLqceogEsHkZzOlOev43RwMeAztA5AlT62RCJE2
	1qS+oEE0zc6/uVWTIsCDq4o2rL7PRME=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-547-TLCEkp4WNVqVNytadQRcCw-1; Wed, 14 Jan 2026 19:43:40 -0500
X-MC-Unique: TLCEkp4WNVqVNytadQRcCw-1
X-Mimecast-MFC-AGG-ID: TLCEkp4WNVqVNytadQRcCw_1768437819
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34ab8693a2cso591565a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 16:43:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768437819; x=1769042619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gZMvfwQ4Hlm3TIovlOL6vMdTiejp6wE8OmDKDcw/1gY=;
        b=up2GVMC6IgEUmvR7bWGJC2iYOiM5cyqZETUzAs3ZeY/TTFoQUm3ebt6IAM0jaYssxy
         Ab3hnMWs06+qLdgIzJF9uTbgQLui99N6CR5j02XWtUMSBsyezXaBydY7E2Jglv5Ur+D2
         4TV+74bgmMcNpMXG1TfBjF7KCivauvTGmgjSrtP4sr9VYH0If0/A4C7cLSDrK28H9bDd
         kZoDYi9LhNFjc3oTDvYmTZSRo3xIREfoTFR7feyERce0Iq8n6oxU6JSovblepCoKri94
         qm90w7bERuARG5qAO7q2gokXDWP3y2UXbSACC+RTp/ysz85v3lrvIVyL9EZQ7gTYrpsc
         QvqA==
X-Forwarded-Encrypted: i=1; AJvYcCVMHCNAk9Oyu5FUsuDFBq7jJj1MIhidBEHbF1XHO0awvaSltI1LL2atbXiD6BMFqbkvrTqLs0kf9h7/tghEasdG@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2nAb4QQeo7+SYgyVFKBXmCPM46zdoThanB3h4oy4CK8iArwYg
	jOReuVg7kjZKjN2Nh+E/6RkZvebesX2KL3Q6dFXmuix2uwy00JEBRva95jDZDFw0Oq7t4b/q3hb
	SsWvbnE21yjk7jkDAYPWj1nhg/T8XI8JzRutpTmG2t8oMmVLLlZY3qDb28msxs+DmcHwni5LVlu
	Ro
X-Gm-Gg: AY/fxX4htAsxYV8t9177D4McB12FcH+SYH1vpvzmspH98fqgTkrHJku7k+9fzbsqqdM
	irhQLU779hR0brP/+eug8dTjfQOfqX+uT9Ne6C+ss9vehsEna6HqabyRf0Zcmd/pdCpgdUB1SqR
	8qmLhVEd4O7tYmwputR9Z9PmHisY0sFIKH8c9vGk/U/N7XnfHEUjxcvWQMTnrCkUAEIfZEwcgBV
	jh/vgqgdHFxCcR9qMYXOahOsMV2rzuYXJuRc27llgbtXR0hz99vuGmyFnQ1i+QcH64adXE+MmTD
	WaOiYbUsMdyRtcDlNctnp5HhAkN0DEZDyKdU3AfrEFUqxwfhJfA8QNtK9/6nA6HZTAlOpNW+GjT
	Z
X-Received: by 2002:a17:90b:4b86:b0:341:8601:d77a with SMTP id 98e67ed59e1d1-35109137fb9mr4491758a91.29.1768437819000;
        Wed, 14 Jan 2026 16:43:39 -0800 (PST)
X-Received: by 2002:a17:90b:4b86:b0:341:8601:d77a with SMTP id 98e67ed59e1d1-35109137fb9mr4491722a91.29.1768437818367;
        Wed, 14 Jan 2026 16:43:38 -0800 (PST)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-352677ca9acsm511892a91.1.2026.01.14.16.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 16:43:38 -0800 (PST)
From: Coiby Xu <coxu@redhat.com>
To: linux-integrity@vger.kernel.org
Cc: Heiko Carstens <hca@linux.ibm.com>,
	Mimi Zohar <zohar@linux.ibm.com>,
	Roberto Sassu <roberto.sassu@huaweicloud.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	"H. Peter Anvin" <hpa@zytor.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Roberto Sassu <roberto.sassu@huawei.com>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Eric Snowberg <eric.snowberg@oracle.com>,
	Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)),
	linux-kernel@vger.kernel.org (open list),
	linuxppc-dev@lists.ozlabs.org (open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)),
	linux-s390@vger.kernel.org (open list:S390 ARCHITECTURE),
	linux-efi@vger.kernel.org (open list:EXTENSIBLE FIRMWARE INTERFACE (EFI)),
	linux-security-module@vger.kernel.org (open list:SECURITY SUBSYSTEM),
	keyrings@vger.kernel.org (open list:KEYS/KEYRINGS_INTEGRITY)
Subject: [PATCH 1/3] integrity: Make arch_ima_get_secureboot integrity-wide
Date: Thu, 15 Jan 2026 08:43:23 +0800
Message-ID: <20260115004328.194142-2-coxu@redhat.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115004328.194142-1-coxu@redhat.com>
References: <20260115004328.194142-1-coxu@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dpd4lHds5Ei-p8Ce1e_o__09GbUuFGI9dLS7bKzI6C0_1768437819
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_164345_730093_52D25B40 
X-CRM114-Status: GOOD (  22.94  )
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

EVM and other LSMs need the ability to query the secure boot status of
the system, without directly calling the IMA arch_ima_get_secureboot
function. Refactor the secure boot status check into a general,
integrity-wide function named arch_integrity_get_secureboot.

Define a new Kconfig option CONFIG_INTEGRITY_SECURE_BOOT, which is
automatically configured by the supported architectures. The existing
IMA_SECURE_AND_OR_TRUSTED_BOOT Kconfig loads the architecture specific
IMA policy based on the refactored secure boot status code.

Reported-and-suggested-by: Mimi Zohar <zohar@linux.ibm.com>
Suggested-by: Roberto Sassu <roberto.sassu@huaweicloud.com>
Signed-off-by: Coiby Xu <coxu@redhat.com>
---
 arch/arm64/Kconfig                            |  1 +
 arch/powerpc/Kconfig                          |  1 +
 arch/powerpc/kernel/Makefile                  |  2 +-
 arch/powerpc/kernel/ima_arch.c                |  5 --
 arch/powerpc/kernel/integrity_sb_arch.c       | 13 +++++
 arch/s390/Kconfig                             |  1 +
 arch/s390/kernel/Makefile                     |  1 +
 arch/s390/kernel/ima_arch.c                   |  6 --
 arch/s390/kernel/integrity_sb_arch.c          |  9 +++
 arch/x86/Kconfig                              |  1 +
 arch/x86/include/asm/efi.h                    |  4 +-
 arch/x86/platform/efi/efi.c                   |  2 +-
 include/linux/ima.h                           |  7 +--
 include/linux/integrity.h                     |  8 +++
 security/integrity/Kconfig                    |  6 ++
 security/integrity/Makefile                   |  3 +
 security/integrity/efi_secureboot.c           | 56 +++++++++++++++++++
 security/integrity/ima/ima_appraise.c         |  2 +-
 security/integrity/ima/ima_efi.c              | 47 +---------------
 security/integrity/ima/ima_main.c             |  4 +-
 security/integrity/platform_certs/load_uefi.c |  2 +-
 21 files changed, 111 insertions(+), 70 deletions(-)
 create mode 100644 arch/powerpc/kernel/integrity_sb_arch.c
 create mode 100644 arch/s390/kernel/integrity_sb_arch.c
 create mode 100644 security/integrity/efi_secureboot.c

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 93173f0a09c7..4c265b7386bb 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2427,6 +2427,7 @@ config EFI
 	select EFI_STUB
 	select EFI_GENERIC_STUB
 	imply IMA_SECURE_AND_OR_TRUSTED_BOOT
+	imply INTEGRITY_SECURE_BOOT
 	default y
 	help
 	  This option provides support for runtime services provided
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 9537a61ebae0..878f752c35fb 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -1058,6 +1058,7 @@ config PPC_SECURE_BOOT
 	depends on PPC_POWERNV || PPC_PSERIES
 	depends on IMA_ARCH_POLICY
 	imply IMA_SECURE_AND_OR_TRUSTED_BOOT
+	imply INTEGRITY_SECURE_BOOT
 	select PSERIES_PLPKS if PPC_PSERIES
 	help
 	  Systems with firmware secure boot enabled need to define security
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 2f0a2e69c607..3bb1fb9a1e0e 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -168,7 +168,7 @@ ifneq ($(CONFIG_PPC_POWERNV)$(CONFIG_PPC_SVM),)
 obj-y				+= ucall.o
 endif
 
-obj-$(CONFIG_PPC_SECURE_BOOT)	+= secure_boot.o ima_arch.o secvar-ops.o
+obj-$(CONFIG_PPC_SECURE_BOOT)	+= secure_boot.o ima_arch.o integrity_sb_arch.o secvar-ops.o
 obj-$(CONFIG_PPC_SECVAR_SYSFS)	+= secvar-sysfs.o
 
 # Disable GCOV, KCOV & sanitizers in odd or sensitive code
diff --git a/arch/powerpc/kernel/ima_arch.c b/arch/powerpc/kernel/ima_arch.c
index b7029beed847..0d8892a03526 100644
--- a/arch/powerpc/kernel/ima_arch.c
+++ b/arch/powerpc/kernel/ima_arch.c
@@ -7,11 +7,6 @@
 #include <linux/ima.h>
 #include <asm/secure_boot.h>
 
-bool arch_ima_get_secureboot(void)
-{
-	return is_ppc_secureboot_enabled();
-}
-
 /*
  * The "secure_rules" are enabled only on "secureboot" enabled systems.
  * These rules verify the file signatures against known good values.
diff --git a/arch/powerpc/kernel/integrity_sb_arch.c b/arch/powerpc/kernel/integrity_sb_arch.c
new file mode 100644
index 000000000000..29f9494391a3
--- /dev/null
+++ b/arch/powerpc/kernel/integrity_sb_arch.c
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019 IBM Corporation
+ * Author: Nayna Jain
+ */
+
+#include <linux/integrity.h>
+#include <asm/secure_boot.h>
+
+bool arch_integrity_get_secureboot(void)
+{
+	return is_ppc_secureboot_enabled();
+}
diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index 0e5fad5f06ca..db0383b19493 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -78,6 +78,7 @@ config S390
 	# Note: keep this list sorted alphabetically
 	#
 	imply IMA_SECURE_AND_OR_TRUSTED_BOOT
+	imply INTEGRITY_SECURE_BOOT
 	select ALTERNATE_USER_ADDRESS_SPACE
 	select ARCH_32BIT_USTAT_F_TINODE
 	select ARCH_CORRECT_STACKTRACE_ON_KRETPROBE
diff --git a/arch/s390/kernel/Makefile b/arch/s390/kernel/Makefile
index 42c83d60d6fa..ee976a27e677 100644
--- a/arch/s390/kernel/Makefile
+++ b/arch/s390/kernel/Makefile
@@ -72,6 +72,7 @@ obj-$(CONFIG_KEXEC_FILE)	+= machine_kexec_file.o kexec_image.o
 obj-$(CONFIG_KEXEC_FILE)	+= kexec_elf.o
 obj-$(CONFIG_CERT_STORE)	+= cert_store.o
 obj-$(CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT)	+= ima_arch.o
+obj-$(CONFIG_INTEGRITY_SECURE_BOOT)	+= integrity_sb_arch.o
 
 obj-$(CONFIG_PERF_EVENTS)	+= perf_event.o
 obj-$(CONFIG_PERF_EVENTS)	+= perf_cpum_cf.o perf_cpum_sf.o
diff --git a/arch/s390/kernel/ima_arch.c b/arch/s390/kernel/ima_arch.c
index f3c3e6e1c5d3..6ccbe34ce408 100644
--- a/arch/s390/kernel/ima_arch.c
+++ b/arch/s390/kernel/ima_arch.c
@@ -1,12 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/ima.h>
-#include <asm/boot_data.h>
-
-bool arch_ima_get_secureboot(void)
-{
-	return ipl_secure_flag;
-}
 
 const char * const *arch_get_ima_policy(void)
 {
diff --git a/arch/s390/kernel/integrity_sb_arch.c b/arch/s390/kernel/integrity_sb_arch.c
new file mode 100644
index 000000000000..208a28cb9961
--- /dev/null
+++ b/arch/s390/kernel/integrity_sb_arch.c
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/integrity.h>
+#include <asm/boot_data.h>
+
+bool arch_integrity_get_secureboot(void)
+{
+	return ipl_secure_flag;
+}
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 80527299f859..5051cc80309a 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -330,6 +330,7 @@ config X86
 	select FUNCTION_ALIGNMENT_16B		if X86_64 || X86_ALIGNMENT_16
 	select FUNCTION_ALIGNMENT_4B
 	imply IMA_SECURE_AND_OR_TRUSTED_BOOT    if EFI
+	imply INTEGRITY_SECURE_BOOT             if EFI
 	select HAVE_DYNAMIC_FTRACE_NO_PATCHABLE
 	select ARCH_SUPPORTS_PT_RECLAIM		if X86_64
 	select ARCH_SUPPORTS_SCHED_SMT		if SMP
diff --git a/arch/x86/include/asm/efi.h b/arch/x86/include/asm/efi.h
index f227a70ac91f..d409f11da331 100644
--- a/arch/x86/include/asm/efi.h
+++ b/arch/x86/include/asm/efi.h
@@ -401,9 +401,9 @@ extern int __init efi_memmap_split_count(efi_memory_desc_t *md,
 extern void __init efi_memmap_insert(struct efi_memory_map *old_memmap,
 				     void *buf, struct efi_mem_range *mem);
 
-extern enum efi_secureboot_mode __x86_ima_efi_boot_mode(void);
+enum efi_secureboot_mode __x86_integrity_efi_boot_mode(void);
 
-#define arch_ima_efi_boot_mode	__x86_ima_efi_boot_mode()
+#define arch_integrity_efi_boot_mode __x86_integrity_efi_boot_mode()
 
 #ifdef CONFIG_EFI_RUNTIME_MAP
 int efi_get_runtime_map_size(void);
diff --git a/arch/x86/platform/efi/efi.c b/arch/x86/platform/efi/efi.c
index 463b784499a8..94704858f17a 100644
--- a/arch/x86/platform/efi/efi.c
+++ b/arch/x86/platform/efi/efi.c
@@ -921,7 +921,7 @@ umode_t efi_attr_is_visible(struct kobject *kobj, struct attribute *attr, int n)
 	return attr->mode;
 }
 
-enum efi_secureboot_mode __x86_ima_efi_boot_mode(void)
+enum efi_secureboot_mode __x86_integrity_efi_boot_mode(void)
 {
 	return boot_params.secure_boot;
 }
diff --git a/include/linux/ima.h b/include/linux/ima.h
index 8e29cb4e6a01..fc0ce1e27a2f 100644
--- a/include/linux/ima.h
+++ b/include/linux/ima.h
@@ -11,6 +11,7 @@
 #include <linux/fs.h>
 #include <linux/security.h>
 #include <linux/kexec.h>
+#include <linux/integrity.h>
 #include <crypto/hash_info.h>
 struct linux_binprm;
 
@@ -72,14 +73,8 @@ int __init ima_get_kexec_buffer(void **addr, size_t *size);
 #endif
 
 #ifdef CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT
-extern bool arch_ima_get_secureboot(void);
 extern const char * const *arch_get_ima_policy(void);
 #else
-static inline bool arch_ima_get_secureboot(void)
-{
-	return false;
-}
-
 static inline const char * const *arch_get_ima_policy(void)
 {
 	return NULL;
diff --git a/include/linux/integrity.h b/include/linux/integrity.h
index f5842372359b..39e8961b58dd 100644
--- a/include/linux/integrity.h
+++ b/include/linux/integrity.h
@@ -61,5 +61,13 @@ integrity_inode_attrs_changed(const struct integrity_inode_attributes *attrs,
 		!inode_eq_iversion(inode, attrs->version));
 }
 
+#ifdef CONFIG_INTEGRITY_SECURE_BOOT
+bool arch_integrity_get_secureboot(void);
+#else
+static inline bool arch_integrity_get_secureboot(void)
+{
+	return false;
+}
+#endif
 
 #endif /* _LINUX_INTEGRITY_H */
diff --git a/security/integrity/Kconfig b/security/integrity/Kconfig
index 916d4f2bfc44..1c3e54df3b73 100644
--- a/security/integrity/Kconfig
+++ b/security/integrity/Kconfig
@@ -97,6 +97,12 @@ config INTEGRITY_CA_MACHINE_KEYRING_MAX
 	  will not be loaded. The remaining MOK keys are loaded into the
 	  .platform keyring.
 
+config INTEGRITY_SECURE_BOOT
+       bool
+       help
+          This option is selected by architectures to provide secure boot
+          related helper functions.
+
 config LOAD_UEFI_KEYS
 	depends on INTEGRITY_PLATFORM_KEYRING
 	depends on EFI
diff --git a/security/integrity/Makefile b/security/integrity/Makefile
index 92b63039c654..08622460e6fd 100644
--- a/security/integrity/Makefile
+++ b/security/integrity/Makefile
@@ -18,6 +18,9 @@ integrity-$(CONFIG_LOAD_IPL_KEYS) += platform_certs/load_ipl_s390.o
 integrity-$(CONFIG_LOAD_PPC_KEYS) += platform_certs/efi_parser.o \
                                      platform_certs/load_powerpc.o \
                                      platform_certs/keyring_handler.o
+ifeq ($(CONFIG_EFI),y)
+integrity-$(CONFIG_INTEGRITY_SECURE_BOOT) += efi_secureboot.o
+endif
 # The relative order of the 'ima' and 'evm' LSMs depends on the order below.
 obj-$(CONFIG_IMA)			+= ima/
 obj-$(CONFIG_EVM)			+= evm/
diff --git a/security/integrity/efi_secureboot.c b/security/integrity/efi_secureboot.c
new file mode 100644
index 000000000000..93d5086217d2
--- /dev/null
+++ b/security/integrity/efi_secureboot.c
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: GPL-1.0+
+/*
+ * Copyright (C) 2018 IBM Corporation
+ */
+#include <linux/efi.h>
+#include <linux/integrity.h>
+#include <asm/efi.h>
+
+#ifndef arch_integrity_efi_boot_mode
+#define arch_integrity_efi_boot_mode efi_secureboot_mode_unset
+#endif
+
+static enum efi_secureboot_mode get_sb_mode(void)
+{
+	enum efi_secureboot_mode mode;
+
+	if (!efi_rt_services_supported(EFI_RT_SUPPORTED_GET_VARIABLE)) {
+		pr_info("integrity: secureboot mode unknown, no efi\n");
+		return efi_secureboot_mode_unknown;
+	}
+
+	mode = efi_get_secureboot_mode(efi.get_variable);
+	if (mode == efi_secureboot_mode_disabled)
+		pr_info("integrity: secureboot mode disabled\n");
+	else if (mode == efi_secureboot_mode_unknown)
+		pr_info("integrity: secureboot mode unknown\n");
+	else
+		pr_info("integrity: secureboot mode enabled\n");
+	return mode;
+}
+
+/*
+ * Query secure boot status
+ *
+ * Note don't call this function too early e.g. in __setup hook otherwise the
+ * kernel may hang when calling efi_get_secureboot_mode.
+ *
+ */
+bool arch_integrity_get_secureboot(void)
+{
+	static enum efi_secureboot_mode sb_mode;
+	static bool initialized;
+
+	if (!initialized && efi_enabled(EFI_BOOT)) {
+		sb_mode = arch_integrity_efi_boot_mode;
+
+		if (sb_mode == efi_secureboot_mode_unset)
+			sb_mode = get_sb_mode();
+		initialized = true;
+	}
+
+	if (sb_mode == efi_secureboot_mode_enabled)
+		return true;
+	else
+		return false;
+}
diff --git a/security/integrity/ima/ima_appraise.c b/security/integrity/ima/ima_appraise.c
index 5149ff4fd50d..f45106cad443 100644
--- a/security/integrity/ima/ima_appraise.c
+++ b/security/integrity/ima/ima_appraise.c
@@ -27,7 +27,7 @@ core_param(ima_appraise, ima_appraise_cmdline_default, charp, 0);
 void __init ima_appraise_parse_cmdline(void)
 {
 	const char *str = ima_appraise_cmdline_default;
-	bool sb_state = arch_ima_get_secureboot();
+	bool sb_state = arch_integrity_get_secureboot();
 	int appraisal_state = ima_appraise;
 
 	if (!str)
diff --git a/security/integrity/ima/ima_efi.c b/security/integrity/ima/ima_efi.c
index 138029bfcce1..d6545ae446c7 100644
--- a/security/integrity/ima/ima_efi.c
+++ b/security/integrity/ima/ima_efi.c
@@ -2,52 +2,8 @@
 /*
  * Copyright (C) 2018 IBM Corporation
  */
-#include <linux/efi.h>
 #include <linux/module.h>
 #include <linux/ima.h>
-#include <asm/efi.h>
-
-#ifndef arch_ima_efi_boot_mode
-#define arch_ima_efi_boot_mode efi_secureboot_mode_unset
-#endif
-
-static enum efi_secureboot_mode get_sb_mode(void)
-{
-	enum efi_secureboot_mode mode;
-
-	if (!efi_rt_services_supported(EFI_RT_SUPPORTED_GET_VARIABLE)) {
-		pr_info("ima: secureboot mode unknown, no efi\n");
-		return efi_secureboot_mode_unknown;
-	}
-
-	mode = efi_get_secureboot_mode(efi.get_variable);
-	if (mode == efi_secureboot_mode_disabled)
-		pr_info("ima: secureboot mode disabled\n");
-	else if (mode == efi_secureboot_mode_unknown)
-		pr_info("ima: secureboot mode unknown\n");
-	else
-		pr_info("ima: secureboot mode enabled\n");
-	return mode;
-}
-
-bool arch_ima_get_secureboot(void)
-{
-	static enum efi_secureboot_mode sb_mode;
-	static bool initialized;
-
-	if (!initialized && efi_enabled(EFI_BOOT)) {
-		sb_mode = arch_ima_efi_boot_mode;
-
-		if (sb_mode == efi_secureboot_mode_unset)
-			sb_mode = get_sb_mode();
-		initialized = true;
-	}
-
-	if (sb_mode == efi_secureboot_mode_enabled)
-		return true;
-	else
-		return false;
-}
 
 /* secureboot arch rules */
 static const char * const sb_arch_rules[] = {
@@ -67,7 +23,8 @@ static const char * const sb_arch_rules[] = {
 
 const char * const *arch_get_ima_policy(void)
 {
-	if (IS_ENABLED(CONFIG_IMA_ARCH_POLICY) && arch_ima_get_secureboot()) {
+	if (IS_ENABLED(CONFIG_IMA_ARCH_POLICY) &&
+	    arch_integrity_get_secureboot()) {
 		if (IS_ENABLED(CONFIG_MODULE_SIG))
 			set_module_sig_enforced();
 		if (IS_ENABLED(CONFIG_KEXEC_SIG))
diff --git a/security/integrity/ima/ima_main.c b/security/integrity/ima/ima_main.c
index 5770cf691912..3f267557dfbe 100644
--- a/security/integrity/ima/ima_main.c
+++ b/security/integrity/ima/ima_main.c
@@ -949,8 +949,8 @@ static int ima_load_data(enum kernel_load_data_id id, bool contents)
 
 	switch (id) {
 	case LOADING_KEXEC_IMAGE:
-		if (IS_ENABLED(CONFIG_KEXEC_SIG)
-		    && arch_ima_get_secureboot()) {
+		if (IS_ENABLED(CONFIG_KEXEC_SIG) &&
+		    arch_integrity_get_secureboot()) {
 			pr_err("impossible to appraise a kernel image without a file descriptor; try using kexec_file_load syscall.\n");
 			return -EACCES;
 		}
diff --git a/security/integrity/platform_certs/load_uefi.c b/security/integrity/platform_certs/load_uefi.c
index d1fdd113450a..3042a0c536d6 100644
--- a/security/integrity/platform_certs/load_uefi.c
+++ b/security/integrity/platform_certs/load_uefi.c
@@ -212,7 +212,7 @@ static int __init load_uefi_certs(void)
 	}
 
 	/* the MOK/MOKx can not be trusted when secure boot is disabled */
-	if (!arch_ima_get_secureboot())
+	if (!arch_integrity_get_secureboot())
 		return 0;
 
 	mokx = get_cert_list(L"MokListXRT", &mok_var, &mokxsize, &status);
-- 
2.52.0


