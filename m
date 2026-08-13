Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0206AC5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 08:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EBP/Xp/pFJQAiC3TlKU8K995p72mwD8OldQHfVB1iwE=; b=1Kidr1xnICno/1mktFqdn3sr//
	Xrb0QxAlSDQ41JawPH5eUqACPA/eHgw/BwaYwiA6qBa+u0AAL846lPTaeUgq7gd971aN96VO5KVEM
	KpPGHH6F38tsS3dGpr3HkZOU2zBR/4R0gQ6DrHpa7PfWWOm7Mi8rf6PDKH1dn4R3np8FH6soiiqA+
	xl625kqYnhZSkwSBPAhf+7nm0+6FzSU2QxT6pGeXWqTmHqrvb3W0m08jRsdxIbFgMwSjfvimrc3e6
	jG0qnvnbxCVB2u7kv9iEvPfi0V1j6RD0gXvba22ye2W/kiJVXzhuKl5y1a/dUXuByUAagSYWU0dda
	hurPCauw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQje-000000007ls-1wml;
	Thu, 13 Aug 2026 08:24:22 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQjb-000000007lU-3Wfu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 08:24:21 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-47db714766aso383018f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 01:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1786609457; x=1787214257; darn=lists.infradead.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EBP/Xp/pFJQAiC3TlKU8K995p72mwD8OldQHfVB1iwE=;
        b=VT5qHvKfBQevEU95hbVYKB+EGKk6gLeMPEaIm3j/F3JXed4g3OZ6YuAY95icS7tw5z
         kw0B9lzLo9boDdASbRr45QPOtxJtQjxCA9VEEuNEivdBGL/pYL5o4RB6Xy0iBhUaL2nT
         qHg6jVte45A6l4rpG+FCRTUzYsomZWxbQA67h7Txx+wl1SNOn5Xhywf7hE07EssfW3wP
         1MiUOZLEHsVFEO6eEiFGP0rwjuUCb7Yb54lo1SGXwOEtrVqs5zrqBrkV9Zqg+5hxHfoL
         y/GyRXOG7/w6nshwBE1pg1VSMfJ38bf0RzzSR0+aTKJbC5jR62JPOPbuCMsIrE1VcZTr
         tdLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786609457; x=1787214257;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EBP/Xp/pFJQAiC3TlKU8K995p72mwD8OldQHfVB1iwE=;
        b=WXSHL9/vHkl+8JbmRNd4uJcvfKAr4kqQzOzHsM+v7+nkHYV14cScIT7tco5RnVzPxV
         udsWBN1RG5ZnDlM1c+lk0RdgCbam5Q9GOXWtQASUSJlYOsDJekDFAGE4lrG0zaO1pC6t
         xkkSq9hHrD3ONmiorvcmUzD18hrN4rVgbmZ0+0RBYvYCwb1L3r6HGLvULStA4YyQaz6D
         F0ELmJvAtV+ZKbs3L8yWQJztiKD6gsr/dpRd6DSMKxT1I+fc+2VhCoZkxyCTadO3YRPq
         o6GJ3lYxngwioUBxfv1Db2p68r/WdemrczlTfTKEs6oBesA5smFobu2sIJsDRNjK4BF0
         RunA==
X-Forwarded-Encrypted: i=1; AHgh+RrCrCP3agndHrfIR9KjFoWjysB6RavDqnULmFGu7PsPxb/SqgMY8lAU6IF0cMwrUwvV97p4igKQ3lftR2AotRK7@lists.infradead.org
X-Gm-Message-State: AOJu0YweI5ATvoh6ko3tr7WgA9fiYJCuwhs6YOBUIYyVP0o6F/JEcULD
	VZ9eAAFMIxheRkx785LHNbWRvSy4z0lJ+mE502uI9i8ZLFCHnJZJi7Oa3kykSbIHg0u+6+aFI21
	Z9y79ZqA=
X-Gm-Gg: AR+sD12eTt9z1xKCxB/pc+ZDTxS/orjxNFHXfIenEwMfMhddgPdrr6HIuXkMjwtHGMo
	eav7IiMCXD+WAdRxDeESP+gAIikxUpS4BQmoGOKjmTup7FBRvWAqUT/mX77dePARv1Ch9KvdLLH
	Fyitz6op6TN+pcV+aqQv+CaZ04QYu6O4oVzyNq/NZIVZ9HKXNOj37s+vNRiezBih4uB9uFtrTbQ
	+rAL8/r7iTl+6qAWZEW/6W/W4hkWGchsqdIwVv1Q21tZBJ/x3LqoZiCajMXR3snx9/g1fwuUS1P
	JHxaR4NQg7KtyVVvn/OTMsBHNnTLi8EfkfnnFMYCHGa6vYIVUFqsyvXNe1b0YL6V7zr6xNQ2fOn
	Ir0OSZkj+7gRZnV3SFgw/PIb7Fq0a+l2u5QImkcDQU5p5QkgxIFxrfqNny5+qSCgXwggsEDKb/k
	l7ve1JGHmz3Ol/7qBgCWCBFYv/TIPz6C1y2wGXn/qifPM+ySz+JkJ9yUD8XTcpoc3OuazogKQES
	xAZfbo=
X-Received: by 2002:a05:600c:231a:b0:495:58fe:88e5 with SMTP id 5b1f17b1804b1-4998215464cmr34432165e9.2.1786609457289;
        Thu, 13 Aug 2026 01:24:17 -0700 (PDT)
Received: from r1chard ([61.222.76.173])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fc5a1cd6esm503849b3a.36.2026.08.13.01.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 01:24:16 -0700 (PDT)
From: Richard Lyu <richard.lyu@suse.com>
X-Google-Original-From: Richard Lyu <r1chard@r1chard>
Date: Thu, 13 Aug 2026 16:24:11 +0800
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev
Subject: Re: [PATCH 1/3] efi: Turn boot memmap handling into shared code
Message-ID: <an1_K40ZWobCkCky@r1chard>
References: <20260813074506.643472-5-ardb@kernel.org>
 <20260813074506.643472-6-ardb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260813074506.643472-6-ardb@kernel.org>
User-Agent: Mutt/2.2.16 (2025-11-22)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_012419_907368_1F710E4B 
X-CRM114-Status: GOOD (  18.48  )
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
>Move the handling of the boot memmap config table from loongarch
>specific code to code that is shared between all architectures that
>select EFI_GENERIC_STUB (all EFI archs except x86).
>
>This will be used in a subsequent patch to replace the clunky FDT based
>passing of the memmap parameters.
>
>Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>---
> arch/loongarch/kernel/efi.c | 10 ++++------
> drivers/firmware/efi/efi.c  |  4 ++++
> include/linux/efi.h         |  3 +++
> 3 files changed, 11 insertions(+), 6 deletions(-)
>
>diff --git a/arch/loongarch/kernel/efi.c b/arch/loongarch/kernel/efi.c
>index 69dd83f8082f..089378856bab 100644
>--- a/arch/loongarch/kernel/efi.c
>+++ b/arch/loongarch/kernel/efi.c
>@@ -28,12 +28,10 @@
> static unsigned long efi_nr_tables;
> static unsigned long efi_config_table;
>
>-static unsigned long __initdata boot_memmap = EFI_INVALID_TABLE_ADDR;
> static unsigned long __initdata fdt_pointer = EFI_INVALID_TABLE_ADDR;
>
> static efi_system_table_t *efi_systab;
> static efi_config_table_type_t arch_tables[] __initdata = {
>-	{LINUX_EFI_BOOT_MEMMAP_GUID,	&boot_memmap,	"MEMMAP" },
> 	{DEVICE_TREE_GUID,		&fdt_pointer,	"FDTPTR" },
> 	{},
> };
>@@ -132,14 +130,14 @@ void __init efi_init(void)
> 	if (IS_ENABLED(CONFIG_EFI_EARLYCON) || IS_ENABLED(CONFIG_SYSFB))
> 		init_primary_display();
>
>-	if (boot_memmap == EFI_INVALID_TABLE_ADDR)
>+	if (efi.boot_memmap == EFI_INVALID_TABLE_ADDR)
> 		return;
>
>-	tbl = early_memremap_ro(boot_memmap, sizeof(*tbl));
>+	tbl = early_memremap_ro(efi.boot_memmap, sizeof(*tbl));
> 	if (tbl) {
> 		struct efi_memory_map_data data;
>
>-		data.phys_map		= boot_memmap + sizeof(*tbl);
>+		data.phys_map		= efi.boot_memmap + sizeof(*tbl);
> 		data.size		= tbl->map_size;
> 		data.desc_size		= tbl->desc_size;
> 		data.desc_version	= tbl->desc_ver;
>@@ -156,7 +154,7 @@ void __init efi_init(void)
> 		 * Also, set the EFI_PRESERVE_BS_REGIONS flag to indicate that
> 		 * critical boot services code/data regions like this are preserved.
> 		 */
>-		memblock_reserve((phys_addr_t)boot_memmap, sizeof(*tbl) + data.size);
>+		memblock_reserve((phys_addr_t)efi.boot_memmap, sizeof(*tbl) + data.size);
> 		set_bit(EFI_PRESERVE_BS_REGIONS, &efi.flags);
>
> 		early_memunmap(tbl, sizeof(*tbl));
>diff --git a/drivers/firmware/efi/efi.c b/drivers/firmware/efi/efi.c
>index 0327a39d31fa..d33760d6a527 100644
>--- a/drivers/firmware/efi/efi.c
>+++ b/drivers/firmware/efi/efi.c
>@@ -55,6 +55,9 @@ struct efi __read_mostly efi = {
> #ifdef CONFIG_UNACCEPTED_MEMORY
> 	.unaccepted		= EFI_INVALID_TABLE_ADDR,
> #endif
>+#ifdef CONFIG_EFI_GENERIC_STUB
>+	.boot_memmap		= EFI_INVALID_TABLE_ADDR,
>+#endif
> };
> EXPORT_SYMBOL(efi);
>
>@@ -647,6 +650,7 @@ static const efi_config_table_type_t common_tables[] __initconst = {
> 	{LINUX_EFI_UNACCEPTED_MEM_TABLE_GUID,	&efi.unaccepted,	"Unaccepted"	},
> #endif
> #ifdef CONFIG_EFI_GENERIC_STUB
>+	{LINUX_EFI_BOOT_MEMMAP_GUID,		&efi.boot_memmap,	"MEMMAP"	},
> 	{LINUX_EFI_PRIMARY_DISPLAY_TABLE_GUID,	&primary_display_table			},
> #endif
> 	{},
>diff --git a/include/linux/efi.h b/include/linux/efi.h
>index aa15ff88539b..bc1cd005ca0f 100644
>--- a/include/linux/efi.h
>+++ b/include/linux/efi.h
>@@ -650,6 +650,9 @@ extern struct efi {
> 	unsigned long			mokvar_table;		/* MOK variable config table */
> 	unsigned long			coco_secret;		/* Confidential computing secret table */
> 	unsigned long			unaccepted;		/* Unaccepted memory table */
>+#ifdef CONFIG_EFI_GENERIC_STUB
>+	unsigned long			boot_memmap;		/* The EFI memory map captured by the stub */
>+#endif
>
> 	efi_get_time_t			*get_time;
> 	efi_set_time_t			*set_time;
>-- 
>2.47.3
>
>

Reviewed-by: Richard Lyu <richard.lyu@suse.com>

