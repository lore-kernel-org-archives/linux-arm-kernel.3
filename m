Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D0D4C5CFEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 07:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qb2/PVw77jNAjhPyvWAbUllJXSfF+p/dWMllt/2V5Lo=; b=WMun/6C5Kc/ZKN4EF3uznRjY7U
	LcMdBfExqlQ+40T5BnUfFJH5K3gv4SIWxKHhJ27iQq65vT11nV6sKetc7dLGwm1zFYOw249FJpQub
	g6B0W5QVex9qJ4XeeCFylUAlGClDkYLgJtd5RvQbju5yZv7BpwquCeTt2iScvblo4cLdyNq7fcabX
	tDOjS4Swc0Vbl89od+58FvdZaY7DnJvgJTD5+oh81rV03W/iB9oOuf8V5TMTkgvE+N7PjDnG5HSJb
	doaisyMRjBwGkTbIBNOqsDc7Ul7zugu+vLSP08uI1V+Gr3p0uyjQT1mPjOc7iqeL5SaA0UuJ5noLv
	Ak30gvWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQ7u-000000001v5-3dvR;
	Thu, 13 Aug 2026 07:45:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQ7t-000000001uR-1ubW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 07:45:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3869043FF0;
	Thu, 13 Aug 2026 07:45:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6A301F00ACA;
	Thu, 13 Aug 2026 07:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786607121;
	bh=qb2/PVw77jNAjhPyvWAbUllJXSfF+p/dWMllt/2V5Lo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=m5UmQCueJW//EmSqdPCH3jcWW4ZI1SWRv/QnKkxZhNb0zdLPuhQ9l8RfOePcnhryb
	 UnRFVV4WO0dYphC05CgzEZsGFNZTpJR9XpShD1kqJvXqyu6rlKZ3hgZjKlQg4EMr9a
	 fm9GH8gkab0HCel8rbaNHRb9Uf5j4HJ5vS8vS5Eh1TkFS90G7ueyZrwmY7GmHicVSS
	 cXqhbWQxlUmB3iMWz42IyNYyuiKGd7Jx0b4qX+RXrJxYby8nnwfK0DVH7aMLm1Wj9z
	 PV0o2ycRSgYVadwZ8hkqy090aOunuS247BtRPYgtwgoe9YfLzy9q2sh6KetW/y2Rja
	 /lrbYXXiKcitA==
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	loongarch@lists.linux.dev
Subject: [PATCH 2/3] efi: Pass EFI boot memmap struct address to core kernel
Date: Thu, 13 Aug 2026 09:45:09 +0200
Message-ID: <20260813074506.643472-7-ardb@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260813074506.643472-5-ardb@kernel.org>
References: <20260813074506.643472-5-ardb@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7384; i=ardb@kernel.org; h=from:subject; bh=Bt4Bu3YM+RvaYW7VrzsihnlGhLQxIMvRLCkrYZBeDn4=; b=owGbwMvMwCVmkMcZplerG8N4Wi2JIau2jK0109a+yi48T13Wc2u7v8RiKas1r7fYiU1j9mNaq HlFVaujlIVBjItBVkyRRWD233c7T0+UqnWeJQszh5UJZAgDF6cATCR/GSPDk4abgtZ8Aet5d1Yy TFj34J+J8cplOe8Cy67PP9FyuelXLMP/2G1K1RtT701gX3BrlsSylhnbtoqnLmKVF34vK8Aq1M/ NAwA=
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

The EFI stub already passes a struct efi_boot_memmap populated with the
information of the EFI memory map as a configuration table, and so
passing the physical address, size, descriptor size and descriptor
version via 4 different DT properties is kind of redundant.

Instead, pass the physical address of this struct in memory so that the
kernel can just retrieve the values directly.

Unfortunately, the scheme with four separate properties is boot ABI for
Xen, and so this needs to remain supported. But for the EFI stub itself,
this is just an internal ABI that can be modified.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 Documentation/arch/arm/uefi.rst    | 10 +----
 drivers/firmware/efi/fdtparams.c   | 39 ++++++++++++++++---
 drivers/firmware/efi/libstub/fdt.c | 40 ++------------------
 3 files changed, 37 insertions(+), 52 deletions(-)

diff --git a/Documentation/arch/arm/uefi.rst b/Documentation/arch/arm/uefi.rst
index 2b7ad9bd7cd2..c19cf3720f27 100644
--- a/Documentation/arch/arm/uefi.rst
+++ b/Documentation/arch/arm/uefi.rst
@@ -54,17 +54,9 @@ Name                        Type     Description
 ==========================  ======   ===========================================
 linux,uefi-system-table     64-bit   Physical address of the UEFI System Table.
 
-linux,uefi-mmap-start       64-bit   Physical address of the UEFI memory map,
+linux,uefi-boot-memmap      64-bit   Physical address of a struct efi_boot_memmap
                                      populated by the UEFI GetMemoryMap() call.
 
-linux,uefi-mmap-size        32-bit   Size in bytes of the UEFI memory map
-                                     pointed to in previous entry.
-
-linux,uefi-mmap-desc-size   32-bit   Size in bytes of each entry in the UEFI
-                                     memory map.
-
-linux,uefi-mmap-desc-ver    32-bit   Version of the mmap descriptor format.
-
 kaslr-seed                  64-bit   Entropy used to randomize the kernel image
                                      base address location.
 
diff --git a/drivers/firmware/efi/fdtparams.c b/drivers/firmware/efi/fdtparams.c
index b815d2a754ee..a54a76a6aaeb 100644
--- a/drivers/firmware/efi/fdtparams.c
+++ b/drivers/firmware/efi/fdtparams.c
@@ -10,22 +10,30 @@
 
 #include <linux/unaligned.h>
 
+#include <asm/early_ioremap.h>
+
 enum {
 	SYSTAB,
+	MEMMAP,
+#ifdef CONFIG_XEN
 	MMBASE,
 	MMSIZE,
 	DCSIZE,
 	DCVERS,
+#endif
 
 	PARAMCOUNT
 };
 
 static __initconst const char name[][22] = {
 	[SYSTAB] = "System Table         ",
+	[MEMMAP] = "Boot Memory Map      ",
+#ifdef CONFIG_XEN
 	[MMBASE] = "MemMap Address       ",
 	[MMSIZE] = "MemMap Size          ",
 	[DCSIZE] = "MemMap Desc. Size    ",
 	[DCVERS] = "MemMap Desc. Version ",
+#endif
 };
 
 static __initconst const struct {
@@ -49,10 +57,7 @@ static __initconst const struct {
 		.path = "/chosen",
 		.params = {	//  <-----------26----------->
 			[SYSTAB] = "linux,uefi-system-table",
-			[MMBASE] = "linux,uefi-mmap-start",
-			[MMSIZE] = "linux,uefi-mmap-size",
-			[DCSIZE] = "linux,uefi-mmap-desc-size",
-			[DCVERS] = "linux,uefi-mmap-desc-ver",
+			[MEMMAP] = "linux,uefi-boot-memmap",
 		}
 	}
 };
@@ -84,17 +89,20 @@ static int __init efi_get_fdt_prop(const void *fdt, int node, const char *pname,
 u64 __init efi_get_fdt_params(struct efi_memory_map_data *mm)
 {
 	const void *fdt = initial_boot_params;
-	unsigned long systab;
+	unsigned long systab, memmap;
 	int i, j, node;
 	struct {
 		void	*var;
 		int	size;
 	} target[] = {
 		[SYSTAB] = { &systab,		sizeof(systab) },
+		[MEMMAP] = { &memmap,		sizeof(memmap) },
+#ifdef CONFIG_XEN
 		[MMBASE] = { &mm->phys_map,	sizeof(mm->phys_map) },
 		[MMSIZE] = { &mm->size,		sizeof(mm->size) },
 		[DCSIZE] = { &mm->desc_size,	sizeof(mm->desc_size) },
 		[DCVERS] = { &mm->desc_version,	sizeof(mm->desc_version) },
+#endif
 	};
 
 	BUILD_BUG_ON(ARRAY_SIZE(target) != ARRAY_SIZE(name));
@@ -115,6 +123,9 @@ u64 __init efi_get_fdt_params(struct efi_memory_map_data *mm)
 		for (j = 0; j < ARRAY_SIZE(target); j++) {
 			const char *pname = dt_params[i].params[j];
 
+			if (pname[0] == '\0')
+				continue;
+
 			if (!efi_get_fdt_prop(fdt, node, pname, name[j],
 					      target[j].var, target[j].size))
 				continue;
@@ -123,8 +134,24 @@ u64 __init efi_get_fdt_params(struct efi_memory_map_data *mm)
 			pr_err("Can't find property '%s' in DT!\n", pname);
 			return 0;
 		}
-		if (dt_params[i].paravirt)
+		if (IS_ENABLED(CONFIG_XEN) && dt_params[i].paravirt) {
 			set_bit(EFI_PARAVIRT, &efi.flags);
+		} else {
+			struct efi_boot_memmap *bm;
+
+			bm = early_memremap_ro(memmap, sizeof(*bm));
+			if (!bm) {
+				pr_err("Cannot remap EFI boot memory map\n");
+				return 0;
+			}
+
+			mm->phys_map		= memmap + sizeof(*bm);
+			mm->size		= bm->map_size;
+			mm->desc_size		= bm->desc_size;
+			mm->desc_version	= bm->desc_ver;
+
+			early_memunmap(bm, sizeof(*bm));
+		}
 		return systab;
 	}
 notfound:
diff --git a/drivers/firmware/efi/libstub/fdt.c b/drivers/firmware/efi/libstub/fdt.c
index 23b3543d3041..417b1344bdd8 100644
--- a/drivers/firmware/efi/libstub/fdt.c
+++ b/drivers/firmware/efi/libstub/fdt.c
@@ -32,7 +32,6 @@ static efi_status_t update_fdt(void *orig_fdt, unsigned long orig_fdt_size,
 {
 	int node, num_rsv;
 	int status;
-	fdt32_t fdt_val32;
 	fdt64_t fdt_val64;
 
 	/* Do some checks on provided FDT, if it exists: */
@@ -102,21 +101,7 @@ static efi_status_t update_fdt(void *orig_fdt, unsigned long orig_fdt_size,
 
 	fdt_val64 = cpu_to_fdt64(U64_MAX); /* placeholder */
 
-	status = fdt_setprop_var(fdt, node, "linux,uefi-mmap-start", fdt_val64);
-	if (status)
-		goto fdt_set_fail;
-
-	fdt_val32 = cpu_to_fdt32(U32_MAX); /* placeholder */
-
-	status = fdt_setprop_var(fdt, node, "linux,uefi-mmap-size", fdt_val32);
-	if (status)
-		goto fdt_set_fail;
-
-	status = fdt_setprop_var(fdt, node, "linux,uefi-mmap-desc-size", fdt_val32);
-	if (status)
-		goto fdt_set_fail;
-
-	status = fdt_setprop_var(fdt, node, "linux,uefi-mmap-desc-ver", fdt_val32);
+	status = fdt_setprop_var(fdt, node, "linux,uefi-boot-memmap", fdt_val64);
 	if (status)
 		goto fdt_set_fail;
 
@@ -148,33 +133,14 @@ static efi_status_t update_fdt_memmap(void *fdt, struct efi_boot_memmap *map)
 {
 	int node = fdt_path_offset(fdt, "/chosen");
 	fdt64_t fdt_val64;
-	fdt32_t fdt_val32;
 	int err;
 
 	if (node < 0)
 		return EFI_LOAD_ERROR;
 
-	fdt_val64 = cpu_to_fdt64((unsigned long)map->map);
-
-	err = fdt_setprop_inplace_var(fdt, node, "linux,uefi-mmap-start", fdt_val64);
-	if (err)
-		return EFI_LOAD_ERROR;
-
-	fdt_val32 = cpu_to_fdt32(map->map_size);
-
-	err = fdt_setprop_inplace_var(fdt, node, "linux,uefi-mmap-size", fdt_val32);
-	if (err)
-		return EFI_LOAD_ERROR;
-
-	fdt_val32 = cpu_to_fdt32(map->desc_size);
-
-	err = fdt_setprop_inplace_var(fdt, node, "linux,uefi-mmap-desc-size", fdt_val32);
-	if (err)
-		return EFI_LOAD_ERROR;
-
-	fdt_val32 = cpu_to_fdt32(map->desc_ver);
+	fdt_val64 = cpu_to_fdt64((unsigned long)map);
 
-	err = fdt_setprop_inplace_var(fdt, node, "linux,uefi-mmap-desc-ver", fdt_val32);
+	err = fdt_setprop_inplace_var(fdt, node, "linux,uefi-boot-memmap", fdt_val64);
 	if (err)
 		return EFI_LOAD_ERROR;
 
-- 
2.47.3


