Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94AEAC5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 08:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+SYyR6EQQIsM2Vg2lfNRN1vzD/kfGQIxnSaF9qwESjU=; b=uATE692h3taYDy67IpklcnATMV
	Tr2WxammD9LFAJhbQt0QnzL5YzU2LdDv6LW1aczH18WUzDH6C9vNJT/GVsfn5veVHXcfk4r5NtVpv
	FomQikWjrox4KTp7K/XZcbUds5IEYCKhhpHCIVmBilN/8rae5ezOl0wLA3jBWQKFMcrF9b60k0Y8p
	5EBe2HNPVglXq16cJoC2WslrtA+tFWnK3GDQA6ropYHKxc2j3ZV4GXMMuHTahJ8gWPu50Dt/T9BPn
	XdJWSbK+agu0pmaWppfh+iOgCJiYsZQHCb6pHYZRDxfIm3iTeDoR7rntKDbzP/oZpQgdl91UfqU+a
	hN6CqhMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQlH-000000008AM-1INl;
	Thu, 13 Aug 2026 08:26:03 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQlE-0000000089D-1gfu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 08:26:01 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so16510485e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 01:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1786609558; x=1787214358; darn=lists.infradead.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+SYyR6EQQIsM2Vg2lfNRN1vzD/kfGQIxnSaF9qwESjU=;
        b=FYGPqg35kVbNaRl6ephIebVqwBWTHCIWvViHYXiLFrZkOBtwdq468hiMuKnibL1B8d
         jJhx0JOCWOETTKj2afnc3UVyKW4+kis4FD4HGWiroMqDt3+X+6+jA5vph4yLRq/nJn1O
         bQXO4lJKOOmrup6fjRj1V0KrL0gMfm0jOa94MHS8DOP3Ckd63L91xND+gMxtU+5y6yai
         hw90j05V1SYweE3qzNHeKC7ptK2/XeVbo04i9n9XWrXWyaFX3mA1/SD7uRJX5UFv6azQ
         MSE5bCdc5Jrjhoz/HMxRb7QaXKVgKCqiTGVXm8JxACNmVUL6YCQZElbTZFQA0XnxQ53b
         sN1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786609558; x=1787214358;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+SYyR6EQQIsM2Vg2lfNRN1vzD/kfGQIxnSaF9qwESjU=;
        b=NvG7gFWBK1VEdBLKj/AsQ8xM/66qAiB3848GMMOYEfdwih/4UBmM3ILVIEjVt3H1mQ
         AotLN2fw1122zfQjFaR42Tw29gfqeGEIo6wjNnHLbRO/Ah4LkRKTJBJG/jEAgvUs2n17
         kZsfH1XVPpi4UqqFT5aWjtAVkdKJLf0X5Icdz/CagweolM/CmMJAkh6kYAoSzYPlwz8e
         2XW3RizrdhDIWnvMroWgwSMfmC/8m5hOB/tQ03FJgx104NtaTfsrkUgBidLcJGQE7CEn
         MJE+QimMNkTZneSIEYaaEdf3v/SF3AxydfYtGEWMq4pRo6OTIC1IZx2xrh9Aq0Ejg/88
         LO+g==
X-Forwarded-Encrypted: i=1; AHgh+RqOKepG8eBAj1Zz+yZX2sZDC0myyQHu5DSlwsRzZgT2uyOjOUF6mM50fIRPK66SaOJHGU22I3P0+sWRYBhmncbK@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8M1Apn27tDj8Fr4awj05M1DZvG82s4mtUzuF7SJi3dG3Ss6wP
	jPOpQxF6jKyIxnadPJj5cSs2Z/BxY5dNaK/OdAdlsSaOI79vcb5mnnntejF8Wpkg9gU=
X-Gm-Gg: AR+sD13KcjNZhiFxeEhEJGD4puNCkGkO4IvY/aWAtcdv4jQZnUGPCT3v2YscxjVolxn
	GUPeZmaH0C5zuvV7idlKdhMpb8I7fImmIyt5oLDYskJCBs/UhH1MBnMfn5O2VipGv9uGruTAp74
	42Y5+mKIbJoHVvpTpVnufgq47sNqnPDBehz5ZCsdOUuyrH/fHu+DWZ86iGdcJ+o/DhyU5awq1xe
	8KYf3Nm3WNeZK0oVgqrWLyoK7JYA0Grgokc4qR7z06mxeHtcV9pe+/FC23e8jF4tFC+aYqC7MI2
	N4sszot2oWGEVrLCjYaiXmMJA8cQ2voY6lKtJp6YNN7hisVLVKlDcqADgU5BHuEADAyv16g9yvR
	uXbUP/oIvghvvXAYjdVYY0h2F43lojIlphkcRdRDEYInpZHDi3dBgngBzXjwUmP+maZBvd0uK0z
	yCWFPGZ9KVJTdYhNlQOpmCSZ9SxJ9TZl7X38XUn2YhpeV5lDBXCmVbjy+tXNAAVtPxbHrx39ue7
	fyWrf8=
X-Received: by 2002:a05:600c:3e8e:b0:499:79ba:ed92 with SMTP id 5b1f17b1804b1-499821d0652mr48629115e9.13.1786609558388;
        Thu, 13 Aug 2026 01:25:58 -0700 (PDT)
Received: from r1chard ([61.222.76.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3931cefe5fdsm2416153a91.13.2026.08.13.01.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 01:25:57 -0700 (PDT)
From: Richard Lyu <richard.lyu@suse.com>
X-Google-Original-From: Richard Lyu <r1chard@r1chard>
Date: Thu, 13 Aug 2026 16:25:52 +0800
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev
Subject: Re: [PATCH 3/3] efi: Make the 'linux,uefi-boot-memmap' DT property
 optional
Message-ID: <an1_kKjIWebhWVT5@r1chard>
References: <20260813074506.643472-5-ardb@kernel.org>
 <20260813074506.643472-8-ardb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260813074506.643472-8-ardb@kernel.org>
User-Agent: Mutt/2.2.16 (2025-11-22)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_012600_749651_8843E37C 
X-CRM114-Status: GOOD (  16.46  )
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
>The 'linux,uefi-boot-memmap DT property' is redundant in principle,
>given that it carries a physical address that is also passed via a EFI
>config table entry.
>
>However, if SetVirtualAddressMap() has been called, the address of the
>config table array has been translated to virtual, and so the memory map
>is needed to translate it back to physical before it can be located.
>
>This means that passing the linux,uefi-boot-memmap DT property is only
>needed if SetVirtualAddressMap() has been called, which is a terrible
>idea anyway, and if it has not been called, the config table array can
>simply be parsed to look for LINUX_EFI_BOOT_MEMMAP_TABLE_GUID, and the
>address taken from there.
>
>So permit this, and make the boot memmap property optional.
>
>Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>---
> drivers/firmware/efi/fdtparams.c | 42 ++++++++++++++++++--
> 1 file changed, 38 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/firmware/efi/fdtparams.c b/drivers/firmware/efi/fdtparams.c
>index a54a76a6aaeb..89ffccf35fd7 100644
>--- a/drivers/firmware/efi/fdtparams.c
>+++ b/drivers/firmware/efi/fdtparams.c
>@@ -89,14 +89,15 @@ static int __init efi_get_fdt_prop(const void *fdt, int node, const char *pname,
> u64 __init efi_get_fdt_params(struct efi_memory_map_data *mm)
> {
> 	const void *fdt = initial_boot_params;
>-	unsigned long systab, memmap;
>+	unsigned long systab, memmap = 0;
> 	int i, j, node;
> 	struct {
> 		void	*var;
> 		int	size;
>+		int	optional;
> 	} target[] = {
> 		[SYSTAB] = { &systab,		sizeof(systab) },
>-		[MEMMAP] = { &memmap,		sizeof(memmap) },
>+		[MEMMAP] = { &memmap,		sizeof(memmap), 1 },
> #ifdef CONFIG_XEN
> 		[MMBASE] = { &mm->phys_map,	sizeof(mm->phys_map) },
> 		[MMSIZE] = { &mm->size,		sizeof(mm->size) },
>@@ -131,14 +132,47 @@ u64 __init efi_get_fdt_params(struct efi_memory_map_data *mm)
> 				continue;
> 			if (!j)
> 				goto notfound;
>-			pr_err("Can't find property '%s' in DT!\n", pname);
>-			return 0;
>+			if (!target[j].optional) {
>+				pr_err("Can't find property '%s' in DT!\n", pname);
>+				return 0;
>+			}
> 		}
> 		if (IS_ENABLED(CONFIG_XEN) && dt_params[i].paravirt) {
> 			set_bit(EFI_PARAVIRT, &efi.flags);
> 		} else {
> 			struct efi_boot_memmap *bm;
>
>+			if (!memmap) {
>+				unsigned long tables, nr_tables;
>+				efi_system_table_t *st;
>+				efi_config_table_t *tbl;
>+
>+				st = early_memremap_ro(systab, sizeof(*st));
>+				if (!st) {
>+					pr_err("Cannot remap EFI system table\n");
>+					return 0;
>+				}
>+
>+				tables		= st->tables;
>+				nr_tables	= st->nr_tables;
>+
>+				early_memunmap(st, sizeof(*st));
>+
>+				tbl = early_memremap_ro(tables, sizeof(*tbl) * nr_tables);
>+				if (!tbl) {
>+					pr_err("Cannot remap EFI config table array\n");
>+					return 0;
>+				}
>+
>+				for (int i = 0; i < nr_tables; i++) {
>+					if (!efi_guidcmp(tbl[i].guid, LINUX_EFI_BOOT_MEMMAP_GUID)) {
>+						memmap = (unsigned long)tbl[i].table;
>+						break;
>+					}
>+				}
>+				early_memunmap(tbl, sizeof(*tbl) * nr_tables);
>+			}
>+
> 			bm = early_memremap_ro(memmap, sizeof(*bm));
> 			if (!bm) {
> 				pr_err("Cannot remap EFI boot memory map\n");
>-- 
>2.47.3
>
>

Reviewed-by: Richard Lyu <richard.lyu@suse.com>

