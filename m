Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C74CC5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 08:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Am6SCPk8v8GLDWCWFlAXnJrEZnAx8ooip6YoSLmy0cA=; b=wYmGmd25CNZXvN4vZ2Kqq4XifD
	pyWSUIm7Le+WIjMdnmYiz3TDvJTidQ2OuBYzC45cibrvkKqjqOuWwjdsmCaMNC1Ffo57tTpZod8oO
	A0gdWaW3iwAwv/NcQ1IQiDSBsyvRW7sVozU+DsJS11tIyYFAjpXupC71cXwDwKaDBgrOU5QN8VgCE
	PfCWrL+ETbUuWGBWEh2Nx1yQWYBVgJ6OPcPjoNgI0zhRMMbAQuvjLI6+R0X7Sg/fEcCAgsBqOecsV
	UsckSAfeGyMGz3l0UZMvfVAjbJtThnW4oxP+mtN/ekLAkxLBM4Hwdu3uvuHdVsZA5T/ejApcuNgzm
	uSR9gUpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQkk-0000000081n-47wa;
	Thu, 13 Aug 2026 08:25:30 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQki-0000000081S-0nQZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 08:25:29 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-499840a2575so1148495e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 01:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1786609526; x=1787214326; darn=lists.infradead.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Am6SCPk8v8GLDWCWFlAXnJrEZnAx8ooip6YoSLmy0cA=;
        b=P+n9UKvygg2g5rJaR6lDiCwjt9sb3fNn8aGbeYHNExRNj9+GB4HTKanx+swC9Sm6pR
         22UEz5qUFTmLsis1lSEXHVrwVMCoh9Z0TjLW+UBXeiokprwVX+a0sJocS+A0JRqhPpqE
         kk8pT6AguUMjiEpjcfeY+77qirxC431wDXUEcasoFu+Y/ITL5mUZKh2vB9UUWj61Uz9l
         WsZ81EcOm/9IfXZ3r2hAWfL1Wog0dnvqcXQLEontI5URRQJzEpNfJNXVNpZ/1yZPBivi
         vorNzChuczWeQN7egKnOIjGYjKR857hbCDzYWRT3Sg0xcqkOEm79c5Zdi+ZNpzBPz3oa
         CzmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786609526; x=1787214326;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Am6SCPk8v8GLDWCWFlAXnJrEZnAx8ooip6YoSLmy0cA=;
        b=XxRR9RQIzn+FDZFXRy2FVerE8dsXdFv0UvAVkPw0CbCOxu/5AyXEzv7DdaZgWcWVJd
         N3qgx41JY56hCqkGnULaIITDCBueT0j89q1qu2tEPEPdKH978ZsqLsL7FmZZ+IQkrThI
         AyklgYmqrhRHPSiUQZvo60AckFFBYRNvmsRw4NOaQbeV1O/dRnLKzDcED25/C2u5l8gA
         uu8W2FwEKRy3rBz572IHHlE0KhW4dDvQzNBIMIuJBGjLczuEOs3jUB65P+rXwsyaziu3
         NPES+DTjFRfqTdohcjGNOwRMB9TSdrprMUo8D1qRfa987va7R1FBQDnvFweHfU9ogmME
         i1Fg==
X-Forwarded-Encrypted: i=1; AHgh+RrrGDR18kC9lV+gOjPGBecU/xho4AsHNDQLiEUWc21NfWds+RNEmeAEVADzkXnM8lCTeRH9z/P+NW5OQlmesnRs@lists.infradead.org
X-Gm-Message-State: AOJu0YxNESbXxI1FhEefXgY7yvyfXJb0ZahdCqtT2oMzI2Kzt4A6JYX6
	m3Y1J+HBDoAoCHNHN9dMPBkey6Ugiy+NQ90oa9rlkABICMVSDrKCedAHGtA6OFv6kqc=
X-Gm-Gg: AR+sD10o3vEbHFSilWKL/4fyo1HB/QYGVBUKPLHgZnigUNyksMFC8FKQ3/S9iaPZws9
	/mc7pf+jEEMHUdEpJZR4+T+eYsu4MXN+v9neDqMrR0wOsGs6rmRGOBSpnT+d1G1o1KQw0iWl2ly
	tjasULPVEqSw0Zu0Nb4thGkwZbLV6rMs8EYLtFbuRUpA/g+izVndBuPizjbpqtTvhEBcVpEvqM2
	5dxLWaEYuZyMLQz06LnFN0cnFhZmFyHuZ3Kc+dJo+gOJCDAvv428AkbxhvQZhpix1YefX84OiwO
	WB9ogROVyhgWTxRSEmcrsT5bTCyjc38rss+Bfh/GkmutP/y+0YxPd7avPZ1yhZTbMk56M1b8TrM
	fHFeGvThfWzRYn2/841xBGn3PZDh90cicyoZidsoXWXlynnyu4+zF4YLVXmlqqKo+UYKi3CH42Y
	bZ5TdKZCbi4NIDmMR64OIu5809p2orXTIbOhToasaToqYukhzyrKFP0C0aR0mZnO9fW1F8Qndod
	0fl1dcYqOU4
X-Received: by 2002:a05:600c:5489:b0:493:f318:3bc6 with SMTP id 5b1f17b1804b1-49982199212mr46034725e9.13.1786609526347;
        Thu, 13 Aug 2026 01:25:26 -0700 (PDT)
Received: from r1chard ([61.222.76.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3931efaaae5sm1964641a91.0.2026.08.13.01.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 01:25:25 -0700 (PDT)
From: Richard Lyu <richard.lyu@suse.com>
X-Google-Original-From: Richard Lyu <r1chard@r1chard>
Date: Thu, 13 Aug 2026 16:25:21 +0800
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev
Subject: Re: [PATCH 2/3] efi: Pass EFI boot memmap struct address to core
 kernel
Message-ID: <an1_cb5w02aii7ir@r1chard>
References: <20260813074506.643472-5-ardb@kernel.org>
 <20260813074506.643472-7-ardb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260813074506.643472-7-ardb@kernel.org>
User-Agent: Mutt/2.2.16 (2025-11-22)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_012528_286061_F4B31997 
X-CRM114-Status: GOOD (  20.41  )
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

On 2026/08/13 09:45, Ard Biesheuvel wrote:
>The EFI stub already passes a struct efi_boot_memmap populated with the
>information of the EFI memory map as a configuration table, and so
>passing the physical address, size, descriptor size and descriptor
>version via 4 different DT properties is kind of redundant.
>
>Instead, pass the physical address of this struct in memory so that the
>kernel can just retrieve the values directly.
>
>Unfortunately, the scheme with four separate properties is boot ABI for
>Xen, and so this needs to remain supported. But for the EFI stub itself,
>this is just an internal ABI that can be modified.
>
>Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>---
> Documentation/arch/arm/uefi.rst    | 10 +----
> drivers/firmware/efi/fdtparams.c   | 39 ++++++++++++++++---
> drivers/firmware/efi/libstub/fdt.c | 40 ++------------------
> 3 files changed, 37 insertions(+), 52 deletions(-)
>
>diff --git a/Documentation/arch/arm/uefi.rst b/Documentation/arch/arm/uefi.rst
>index 2b7ad9bd7cd2..c19cf3720f27 100644
>--- a/Documentation/arch/arm/uefi.rst
>+++ b/Documentation/arch/arm/uefi.rst
>@@ -54,17 +54,9 @@ Name                        Type     Description
> ==========================  ======   ===========================================
> linux,uefi-system-table     64-bit   Physical address of the UEFI System Table.
>
>-linux,uefi-mmap-start       64-bit   Physical address of the UEFI memory map,
>+linux,uefi-boot-memmap      64-bit   Physical address of a struct efi_boot_memmap
>                                      populated by the UEFI GetMemoryMap() call.
>
>-linux,uefi-mmap-size        32-bit   Size in bytes of the UEFI memory map
>-                                     pointed to in previous entry.
>-
>-linux,uefi-mmap-desc-size   32-bit   Size in bytes of each entry in the UEFI
>-                                     memory map.
>-
>-linux,uefi-mmap-desc-ver    32-bit   Version of the mmap descriptor format.
>-
> kaslr-seed                  64-bit   Entropy used to randomize the kernel image
>                                      base address location.
>
>diff --git a/drivers/firmware/efi/fdtparams.c b/drivers/firmware/efi/fdtparams.c
>index b815d2a754ee..a54a76a6aaeb 100644
>--- a/drivers/firmware/efi/fdtparams.c
>+++ b/drivers/firmware/efi/fdtparams.c
>@@ -10,22 +10,30 @@
>
> #include <linux/unaligned.h>
>
>+#include <asm/early_ioremap.h>
>+
> enum {
> 	SYSTAB,
>+	MEMMAP,
>+#ifdef CONFIG_XEN
> 	MMBASE,
> 	MMSIZE,
> 	DCSIZE,
> 	DCVERS,
>+#endif
>
> 	PARAMCOUNT
> };
>
> static __initconst const char name[][22] = {
> 	[SYSTAB] = "System Table         ",
>+	[MEMMAP] = "Boot Memory Map      ",
>+#ifdef CONFIG_XEN
> 	[MMBASE] = "MemMap Address       ",
> 	[MMSIZE] = "MemMap Size          ",
> 	[DCSIZE] = "MemMap Desc. Size    ",
> 	[DCVERS] = "MemMap Desc. Version ",
>+#endif
> };
>
> static __initconst const struct {
>@@ -49,10 +57,7 @@ static __initconst const struct {
> 		.path = "/chosen",
> 		.params = {	//  <-----------26----------->
> 			[SYSTAB] = "linux,uefi-system-table",
>-			[MMBASE] = "linux,uefi-mmap-start",
>-			[MMSIZE] = "linux,uefi-mmap-size",
>-			[DCSIZE] = "linux,uefi-mmap-desc-size",
>-			[DCVERS] = "linux,uefi-mmap-desc-ver",
>+			[MEMMAP] = "linux,uefi-boot-memmap",
> 		}
> 	}
> };
>@@ -84,17 +89,20 @@ static int __init efi_get_fdt_prop(const void *fdt, int node, const char *pname,
> u64 __init efi_get_fdt_params(struct efi_memory_map_data *mm)
> {
> 	const void *fdt = initial_boot_params;
>-	unsigned long systab;
>+	unsigned long systab, memmap;
> 	int i, j, node;
> 	struct {
> 		void	*var;
> 		int	size;
> 	} target[] = {
> 		[SYSTAB] = { &systab,		sizeof(systab) },
>+		[MEMMAP] = { &memmap,		sizeof(memmap) },
>+#ifdef CONFIG_XEN
> 		[MMBASE] = { &mm->phys_map,	sizeof(mm->phys_map) },
> 		[MMSIZE] = { &mm->size,		sizeof(mm->size) },
> 		[DCSIZE] = { &mm->desc_size,	sizeof(mm->desc_size) },
> 		[DCVERS] = { &mm->desc_version,	sizeof(mm->desc_version) },
>+#endif
> 	};
>
> 	BUILD_BUG_ON(ARRAY_SIZE(target) != ARRAY_SIZE(name));
>@@ -115,6 +123,9 @@ u64 __init efi_get_fdt_params(struct efi_memory_map_data *mm)
> 		for (j = 0; j < ARRAY_SIZE(target); j++) {
> 			const char *pname = dt_params[i].params[j];
>
>+			if (pname[0] == '\0')
>+				continue;
>+
> 			if (!efi_get_fdt_prop(fdt, node, pname, name[j],
> 					      target[j].var, target[j].size))
> 				continue;
>@@ -123,8 +134,24 @@ u64 __init efi_get_fdt_params(struct efi_memory_map_data *mm)
> 			pr_err("Can't find property '%s' in DT!\n", pname);
> 			return 0;
> 		}
>-		if (dt_params[i].paravirt)
>+		if (IS_ENABLED(CONFIG_XEN) && dt_params[i].paravirt) {
> 			set_bit(EFI_PARAVIRT, &efi.flags);
>+		} else {
>+			struct efi_boot_memmap *bm;
>+
>+			bm = early_memremap_ro(memmap, sizeof(*bm));
>+			if (!bm) {
>+				pr_err("Cannot remap EFI boot memory map\n");
>+				return 0;
>+			}
>+
>+			mm->phys_map		= memmap + sizeof(*bm);
>+			mm->size		= bm->map_size;
>+			mm->desc_size		= bm->desc_size;
>+			mm->desc_version	= bm->desc_ver;
>+
>+			early_memunmap(bm, sizeof(*bm));
>+		}
> 		return systab;
> 	}
> notfound:
>diff --git a/drivers/firmware/efi/libstub/fdt.c b/drivers/firmware/efi/libstub/fdt.c
>index 23b3543d3041..417b1344bdd8 100644
>--- a/drivers/firmware/efi/libstub/fdt.c
>+++ b/drivers/firmware/efi/libstub/fdt.c
>@@ -32,7 +32,6 @@ static efi_status_t update_fdt(void *orig_fdt, unsigned long orig_fdt_size,
> {
> 	int node, num_rsv;
> 	int status;
>-	fdt32_t fdt_val32;
> 	fdt64_t fdt_val64;
>
> 	/* Do some checks on provided FDT, if it exists: */
>@@ -102,21 +101,7 @@ static efi_status_t update_fdt(void *orig_fdt, unsigned long orig_fdt_size,
>
> 	fdt_val64 = cpu_to_fdt64(U64_MAX); /* placeholder */
>
>-	status = fdt_setprop_var(fdt, node, "linux,uefi-mmap-start", fdt_val64);
>-	if (status)
>-		goto fdt_set_fail;
>-
>-	fdt_val32 = cpu_to_fdt32(U32_MAX); /* placeholder */
>-
>-	status = fdt_setprop_var(fdt, node, "linux,uefi-mmap-size", fdt_val32);
>-	if (status)
>-		goto fdt_set_fail;
>-
>-	status = fdt_setprop_var(fdt, node, "linux,uefi-mmap-desc-size", fdt_val32);
>-	if (status)
>-		goto fdt_set_fail;
>-
>-	status = fdt_setprop_var(fdt, node, "linux,uefi-mmap-desc-ver", fdt_val32);
>+	status = fdt_setprop_var(fdt, node, "linux,uefi-boot-memmap", fdt_val64);
> 	if (status)
> 		goto fdt_set_fail;
>
>@@ -148,33 +133,14 @@ static efi_status_t update_fdt_memmap(void *fdt, struct efi_boot_memmap *map)
> {
> 	int node = fdt_path_offset(fdt, "/chosen");
> 	fdt64_t fdt_val64;
>-	fdt32_t fdt_val32;
> 	int err;
>
> 	if (node < 0)
> 		return EFI_LOAD_ERROR;
>
>-	fdt_val64 = cpu_to_fdt64((unsigned long)map->map);
>-
>-	err = fdt_setprop_inplace_var(fdt, node, "linux,uefi-mmap-start", fdt_val64);
>-	if (err)
>-		return EFI_LOAD_ERROR;
>-
>-	fdt_val32 = cpu_to_fdt32(map->map_size);
>-
>-	err = fdt_setprop_inplace_var(fdt, node, "linux,uefi-mmap-size", fdt_val32);
>-	if (err)
>-		return EFI_LOAD_ERROR;
>-
>-	fdt_val32 = cpu_to_fdt32(map->desc_size);
>-
>-	err = fdt_setprop_inplace_var(fdt, node, "linux,uefi-mmap-desc-size", fdt_val32);
>-	if (err)
>-		return EFI_LOAD_ERROR;
>-
>-	fdt_val32 = cpu_to_fdt32(map->desc_ver);
>+	fdt_val64 = cpu_to_fdt64((unsigned long)map);
>
>-	err = fdt_setprop_inplace_var(fdt, node, "linux,uefi-mmap-desc-ver", fdt_val32);
>+	err = fdt_setprop_inplace_var(fdt, node, "linux,uefi-boot-memmap", fdt_val64);
> 	if (err)
> 		return EFI_LOAD_ERROR;
>
>-- 
>2.47.3
>
>

Reviewed-by: Richard Lyu <richard.lyu@suse.com>


