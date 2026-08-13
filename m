Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E40C0C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 07:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zS2zqdJiOa2sx/kU92rSbkJMqQaAm8Zcb70/3tDfkeY=; b=BRNLwqGNteYiNVPAcoYNAj9gSk
	jpw2SihwY38Lw2A8nKaFoFE5K/8ljParbJ6VvCFyxNTfAh9ticd0LnYDUyHqdRX8HW4lbniCd9Fno
	nAamscbXTqbdWZnH2S4QzRCIqStOjt2/xLSwPawuDL60AdKUK6rOdOKvEcGUIaT4ABSQ7MmK8fe3n
	YGVEvi2lQguY5bocJh7pYbs9zypyVApXmrzYgNVcAJ773gWfd7/9WEDLeKks66xwRDBZ4xFHxfV7i
	tQOJLzfOBXmNTVWkMfXiI9bChf2dFT2DuOdvJ+ura4K0zVMHfv3ZhCPcBF3cERP0CefM/aSveTaRg
	417ChRSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQ7u-000000001un-3DhB;
	Thu, 13 Aug 2026 07:45:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQ7s-000000001tv-0xhV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 07:45:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7ADAF437C0;
	Thu, 13 Aug 2026 07:45:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14A6D1F00A3E;
	Thu, 13 Aug 2026 07:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786607119;
	bh=zS2zqdJiOa2sx/kU92rSbkJMqQaAm8Zcb70/3tDfkeY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UzXHBoEtBmMuNPGP+xwLE1aylKAxP5rBEFJAQ8trqq5BFqfukBkOCLQojb1/JPoGO
	 orcuJu7Yka3GMipr9Pl5sZrfMW0wI+6JFJcwejOAjCZePi72Dlx95O3vVhZYCPRA8N
	 1JaIbuiwoZllFqQrNXNNxbwJ04C47Zk64L7oXjVR/I5brCpBhGUD9myMSzwAzBIXYu
	 sMfYXEK55jy2BICdpaP/TY44ZK5D5uUjcZ5nLRi/nYvzBV+YMMuYwHW6MAFdxdcaEx
	 hK7KY0fDAwVTW+Ph42zsSTjxzr5lsqzx9ky62bptLlTmsmI+D7X4pEQX2E4r5C36L7
	 atEGGqiO3lXrA==
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	loongarch@lists.linux.dev
Subject: [PATCH 1/3] efi: Turn boot memmap handling into shared code
Date: Thu, 13 Aug 2026 09:45:08 +0200
Message-ID: <20260813074506.643472-6-ardb@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260813074506.643472-5-ardb@kernel.org>
References: <20260813074506.643472-5-ardb@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3647; i=ardb@kernel.org; h=from:subject; bh=ObemBNiXAA9fc6eSrHBLJHvN6r7CgsJHYV6Qi819ZeU=; b=owGbwMvMwCVmkMcZplerG8N4Wi2JIau2jOW3XHWU/8OtfRdnPWQ7x5u/IYtrn2xCQ4Wb18+D1 89WbMzoKGVhEONikBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABNZ18PwT0l5v757oceh7bOZ vZMVpq2NmrEqjX07/+6Zp2NPRSfmHGP4w3UgfY0aS+/HgPIVFz48t4w4EKC6+tJmbt0LbP+vzJg 1lxUA
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
Content-Transfer-Encoding: 8bit
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

Move the handling of the boot memmap config table from loongarch
specific code to code that is shared between all architectures that
select EFI_GENERIC_STUB (all EFI archs except x86).

This will be used in a subsequent patch to replace the clunky FDT based
passing of the memmap parameters.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/loongarch/kernel/efi.c | 10 ++++------
 drivers/firmware/efi/efi.c  |  4 ++++
 include/linux/efi.h         |  3 +++
 3 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/arch/loongarch/kernel/efi.c b/arch/loongarch/kernel/efi.c
index 69dd83f8082f..089378856bab 100644
--- a/arch/loongarch/kernel/efi.c
+++ b/arch/loongarch/kernel/efi.c
@@ -28,12 +28,10 @@
 static unsigned long efi_nr_tables;
 static unsigned long efi_config_table;
 
-static unsigned long __initdata boot_memmap = EFI_INVALID_TABLE_ADDR;
 static unsigned long __initdata fdt_pointer = EFI_INVALID_TABLE_ADDR;
 
 static efi_system_table_t *efi_systab;
 static efi_config_table_type_t arch_tables[] __initdata = {
-	{LINUX_EFI_BOOT_MEMMAP_GUID,	&boot_memmap,	"MEMMAP" },
 	{DEVICE_TREE_GUID,		&fdt_pointer,	"FDTPTR" },
 	{},
 };
@@ -132,14 +130,14 @@ void __init efi_init(void)
 	if (IS_ENABLED(CONFIG_EFI_EARLYCON) || IS_ENABLED(CONFIG_SYSFB))
 		init_primary_display();
 
-	if (boot_memmap == EFI_INVALID_TABLE_ADDR)
+	if (efi.boot_memmap == EFI_INVALID_TABLE_ADDR)
 		return;
 
-	tbl = early_memremap_ro(boot_memmap, sizeof(*tbl));
+	tbl = early_memremap_ro(efi.boot_memmap, sizeof(*tbl));
 	if (tbl) {
 		struct efi_memory_map_data data;
 
-		data.phys_map		= boot_memmap + sizeof(*tbl);
+		data.phys_map		= efi.boot_memmap + sizeof(*tbl);
 		data.size		= tbl->map_size;
 		data.desc_size		= tbl->desc_size;
 		data.desc_version	= tbl->desc_ver;
@@ -156,7 +154,7 @@ void __init efi_init(void)
 		 * Also, set the EFI_PRESERVE_BS_REGIONS flag to indicate that
 		 * critical boot services code/data regions like this are preserved.
 		 */
-		memblock_reserve((phys_addr_t)boot_memmap, sizeof(*tbl) + data.size);
+		memblock_reserve((phys_addr_t)efi.boot_memmap, sizeof(*tbl) + data.size);
 		set_bit(EFI_PRESERVE_BS_REGIONS, &efi.flags);
 
 		early_memunmap(tbl, sizeof(*tbl));
diff --git a/drivers/firmware/efi/efi.c b/drivers/firmware/efi/efi.c
index 0327a39d31fa..d33760d6a527 100644
--- a/drivers/firmware/efi/efi.c
+++ b/drivers/firmware/efi/efi.c
@@ -55,6 +55,9 @@ struct efi __read_mostly efi = {
 #ifdef CONFIG_UNACCEPTED_MEMORY
 	.unaccepted		= EFI_INVALID_TABLE_ADDR,
 #endif
+#ifdef CONFIG_EFI_GENERIC_STUB
+	.boot_memmap		= EFI_INVALID_TABLE_ADDR,
+#endif
 };
 EXPORT_SYMBOL(efi);
 
@@ -647,6 +650,7 @@ static const efi_config_table_type_t common_tables[] __initconst = {
 	{LINUX_EFI_UNACCEPTED_MEM_TABLE_GUID,	&efi.unaccepted,	"Unaccepted"	},
 #endif
 #ifdef CONFIG_EFI_GENERIC_STUB
+	{LINUX_EFI_BOOT_MEMMAP_GUID,		&efi.boot_memmap,	"MEMMAP"	},
 	{LINUX_EFI_PRIMARY_DISPLAY_TABLE_GUID,	&primary_display_table			},
 #endif
 	{},
diff --git a/include/linux/efi.h b/include/linux/efi.h
index aa15ff88539b..bc1cd005ca0f 100644
--- a/include/linux/efi.h
+++ b/include/linux/efi.h
@@ -650,6 +650,9 @@ extern struct efi {
 	unsigned long			mokvar_table;		/* MOK variable config table */
 	unsigned long			coco_secret;		/* Confidential computing secret table */
 	unsigned long			unaccepted;		/* Unaccepted memory table */
+#ifdef CONFIG_EFI_GENERIC_STUB
+	unsigned long			boot_memmap;		/* The EFI memory map captured by the stub */
+#endif
 
 	efi_get_time_t			*get_time;
 	efi_set_time_t			*set_time;
-- 
2.47.3


