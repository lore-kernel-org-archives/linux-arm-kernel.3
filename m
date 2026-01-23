Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE883D77884
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 16:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UcfuGhlWniUr1jnx17fjCBZJRHAshpGZM/hJViPgM8s=; b=shOng6zvA6qwZN2SxqadkFmXoU
	sLvtzehmG8uh2GjYZj9HNhulMlJDW3ZbxozPc7f2U7xMlpi0cbil+1dVIymQ71GifYQVDKH3gKv6H
	1a6mX9KqN6ZhRN/nO3TIwGT/E02JK6Ep+Dpm5p20/NABuLCYQj9FGLYSzTvEPl3RKE1Q6TbNhwFF/
	B/HAy25ZqU7Pwm/fmUyXtS3Imlr4KqYbjq3BVeE8mbB9JH4tKXiFB9A0XJSDavua6dwaSvM3TpPam
	An64B0Vhr9euCYb6qyOj3oaHS2r7HGKh000xFMXlO5o24O/AkSlCtzbTW5+r4Mme/RWG/z49fTCme
	Hf9HvlmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjKNT-00000009E5X-3Yxv;
	Fri, 23 Jan 2026 16:51:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjKNK-00000009Dzz-0vQx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 16:51:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 911141596;
	Fri, 23 Jan 2026 08:51:02 -0800 (PST)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D38373F694;
	Fri, 23 Jan 2026 08:51:07 -0800 (PST)
From: Joey Gouly <joey.gouly@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: alexandru.elisei@arm.com,
	andrew.jones@linux.dev,
	eric.auger@redhat.com,
	joey.gouly@arm.com,
	maz@kernel.org,
	kvmarm@lists.linux.dev,
	Oliver Upton <oliver.upton@linux.dev>
Subject: [kvm-unit-tests PATCH v6 04/14] arm64: efi: initialise SCTLR_ELx fully
Date: Fri, 23 Jan 2026 16:50:43 +0000
Message-Id: <20260123165053.2250754-5-joey.gouly@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260123165053.2250754-1-joey.gouly@arm.com>
References: <20260123165053.2250754-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_085110_399325_79AAA12C 
X-CRM114-Status: UNSURE (   9.54  )
X-CRM114-Notice: Please train this message.
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

Don't rely on the value of SCTLR_ELx when booting via EFI.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Acked-by: Marc Zyngier <maz@kernel.org>
---
 lib/arm/asm/setup.h   |  6 ++++++
 lib/arm/setup.c       |  2 ++
 lib/arm64/processor.c | 14 ++++++++++++++
 3 files changed, 22 insertions(+)

diff --git a/lib/arm/asm/setup.h b/lib/arm/asm/setup.h
index 9f8ef82e..4e60d552 100644
--- a/lib/arm/asm/setup.h
+++ b/lib/arm/asm/setup.h
@@ -28,6 +28,12 @@ void setup(const void *fdt, phys_addr_t freemem_start);
 
 #include <efi.h>
 
+#ifdef __aarch64__
+void setup_efi_sctlr(void);
+#else
+static inline void setup_efi_sctlr(void) {}
+#endif
+
 efi_status_t setup_efi(efi_bootinfo_t *efi_bootinfo);
 
 #endif
diff --git a/lib/arm/setup.c b/lib/arm/setup.c
index 67b5db07..49f5e0f6 100644
--- a/lib/arm/setup.c
+++ b/lib/arm/setup.c
@@ -349,6 +349,8 @@ efi_status_t setup_efi(efi_bootinfo_t *efi_bootinfo)
 {
 	efi_status_t status;
 
+	setup_efi_sctlr();
+
 	exceptions_init();
 
 	memregions_init(arm_mem_regions, NR_MEM_REGIONS);
diff --git a/lib/arm64/processor.c b/lib/arm64/processor.c
index eb93fd7c..f9fea519 100644
--- a/lib/arm64/processor.c
+++ b/lib/arm64/processor.c
@@ -8,6 +8,7 @@
 #include <libcflat.h>
 #include <asm/ptrace.h>
 #include <asm/processor.h>
+#include <asm/setup.h>
 #include <asm/thread_info.h>
 
 static const char *vector_names[] = {
@@ -271,3 +272,16 @@ bool __mmu_enabled(void)
 {
 	return read_sysreg(sctlr_el1) & SCTLR_EL1_M;
 }
+
+#ifdef CONFIG_EFI
+
+void setup_efi_sctlr(void)
+{
+	/*
+	 * EFI exits boot services with SCTLR_ELx.M=1, so keep
+	 * the MMU enabled.
+	 */
+	write_sysreg(INIT_SCTLR_EL1_MMU_OFF | SCTLR_EL1_M, sctlr_el1);
+}
+
+#endif
-- 
2.25.1


