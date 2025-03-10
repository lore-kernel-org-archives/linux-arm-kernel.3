Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E10C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 20:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6E2fY/dOO7K8H2PCOjc/QXC2clNa/LmdMboLxglCV4w=; b=R40ToeIpCFKZoM7au4/W92Zbjt
	G1KhNuRudcywMwQLGYzXMM2VJ6D8kI4ozKVNEKZOF0TyFwmCrdhiI1sKo3m0wKK/B5UqhWVvoZDeq
	pAcYeDbAkxVGgsFrxDrVz+o0XiRYIRC8p2RpYWHDAEntXKrihLlrkBs0XbQWTp+bB0d8V4grd/gdR
	5gv5VdVrkDO09d+j0xVnsRWD/BT48g446gWAPKbx8KJHIvRsaT25Zt3z6kPOscdelYS4Lcji/v7CN
	p9FwLhsmfSOlV+mpCwGEsO7FidTHP5A0w4HgT2xuY3twZuQML5qs1uhuhrxP+VH0QUNynBDASZFKQ
	/SG/4ZaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trjWk-00000003pxJ-0r7w;
	Mon, 10 Mar 2025 20:15:06 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trjNV-00000003oB3-11p1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 20:05:34 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2ff7cf59a8fso1015460a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Mar 2025 13:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1741637131; x=1742241931; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6E2fY/dOO7K8H2PCOjc/QXC2clNa/LmdMboLxglCV4w=;
        b=ZYKYabEGJjFVKgOqplC87HgZFmlXMBx9rjfX0OgOZQ1L5vsuZ42t3NPTI6cxS81H9E
         9zU4zEVPK4cKHghubLirhAd2idvFZDE3S6lMeSz9QHMp5qF1NevrU1Qafytw3CcGE41z
         oa0c9W20PL9UOY5tzRXN6aAkE1As+Ok7TtA0H8F9FhF2hRCHli1i3zyTidkfXPx7D2mZ
         Np14YJAdRGOJb0SKSO8BLJ+Lxcw0+6GhmJL6JJ0f+oawSS1KkjLzdslYlVnRjBRltR69
         96z2dqx2dgfek/97j4CD21KijaeGNzVgdqy31UdnBvGu5NijqUGi92SVnDb4mvVr/ogE
         mo+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741637131; x=1742241931;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6E2fY/dOO7K8H2PCOjc/QXC2clNa/LmdMboLxglCV4w=;
        b=QHYlGwccMZrLzwrJYDma1TInrOadXrDtb4bU3TvsUVZ9jatKYtQjk9q+ya+SUG/+td
         3A2Tek6oUT3pS38+w1vryATL56OiumMzZc6i79gBs1ueg6zzW4tONZXFbuw5aQA+BYyW
         vrAucyHavYxDM0jMuAkX7P77dHkNyveBneK7G+rORocEEWTci1qCkojxfO3bdgMeXy6F
         ixvOMeLCCACAaNNediQ5d48pWCT0bMfyRra06xvVwnq5oRG8caDAsfUamM7DwpLh6fRP
         48KY/6+3LDnimHwGgMV6kTJq/GCwV85Xrd1nxlu95b9yqnMIZC1jnb7n6HNQWQ+ZH5L3
         +0+A==
X-Forwarded-Encrypted: i=1; AJvYcCV4qNzCz8u7W8Ysnz7PgQ0pSbDWN7AfzA8grfthdmGS2emFGZFiDxO/x5WrEo2tkdvc8Z9t91gH+drx28/9OSUQ@lists.infradead.org
X-Gm-Message-State: AOJu0YydNGH6DeC6LYTRy8fAjmdOBBTwsnuGTkC7ATpScygN1/JPNz1V
	Yv2FXk2tKH1QlIAL1+0Wn8Kl39+X4pKIBkysbP26ZsvT0LzrYHC5DUP0UQQHV6bVDh4l0wyrFjF
	Y
X-Gm-Gg: ASbGncu+dsXju0KxbSWW50rnX7/I807ntwYT6m/wtKVEc4OdMjBKhB4oVX9U6B8j0Ex
	ezD+DDCYa6wjlbJlicDbMy+tH5giJ653+R/pcQ6rDGTxXOg6GZZg6SQSUHP6Upji7FEfp8Z6qU+
	VbhTPVzzFi7RzsuaUL7Lxha6Ys2lptyGbOLAjWf1C0oh/u/AGZXKrKKX9XZdVagRMDLTuc2Vkhj
	1lv3YVgE04e7NUvXEcVVj7MBcf1Rjb8bwpjnDSPxOiDZymJkzJ4mFK3wl/6h7+3OxZXOXZBcVyH
	HsvFAuTFUCXRynF9n8iVMfynzYEM9Nii1vjMsHmh51XQUOIS
X-Google-Smtp-Source: AGHT+IEZY1hRshDJHK2NbEAj0bV/vF6iudG3bTSp20WZpc/wKRjHKhWDW2v8gGqKHNULSlhBJJIr6w==
X-Received: by 2002:a17:90b:1c90:b0:2ff:78dd:2875 with SMTP id 98e67ed59e1d1-300ff8c0db7mr494323a91.5.1741637130945;
        Mon, 10 Mar 2025 13:05:30 -0700 (PDT)
Received: from telecaster.thefacebook.com ([2620:10d:c090:500::4:54c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff69374622sm9474522a91.23.2025.03.10.13.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 13:05:30 -0700 (PDT)
From: Omar Sandoval <osandov@osandov.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Cc: linux-debuggers@vger.kernel.org,
	kernel-team@fb.com
Subject: [PATCH] arm64: reserve [_text, _stext) virtual address range
Date: Mon, 10 Mar 2025 13:05:04 -0700
Message-ID: <ec2d02358eee53f095ad9a7d9c96af8f4d0d4eeb.1741636880.git.osandov@osandov.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_130533_483642_A5E5BAA6 
X-CRM114-Status: GOOD (  15.72  )
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

From: Omar Sandoval <osandov@fb.com>

Since the referenced fixes commit, the kernel's .text section is only
mapped starting from _stext; the region [_text, _stext) is omitted. As a
result, other vmalloc/vmap allocations may use the virtual addresses
nominally in the range [_text, _stext). This address reuse confuses
multiple things:

1. crash_prepare_elf64_headers() sets up a segment in /proc/vmcore
   mapping the entire range [_text, _end) to
   [__pa_symbol(_text), __pa_symbol(_end)). Reading an address in
   [_text, _stext) from /proc/vmcore therefore gives the incorrect
   result.
2. Tools doing symbolization (either by reading /proc/kallsyms or based
   on the vmlinux ELF file) will incorrectly identify vmalloc/vmap
   allocations in [_text, _stext) as kernel symbols.

In practice, both of these issues affect the drgn debugger.
Specifically, there were cases where the vmap IRQ stacks for some CPUs
were allocated in [_text, _stext). As a result, drgn could not get the
stack trace for a crash in an IRQ handler because the core dump
contained invalid data for the IRQ stack address. The stack addresses
were also symbolized as being in the _text symbol.

Fix this by creating an unmapped vm_area to cover [_text, _stext). This
prevents other allocations from using it while still achieving the
original goal of not mapping unpredictable data.

Fixes: e2a073dde921 ("arm64: omit [_text, _stext) from permanent kernel mapping")
Cc: stable@vger.kernel.org
Signed-off-by: Omar Sandoval <osandov@fb.com>
---
Based on v6.14-rc6.

Thanks!

 arch/arm64/mm/mmu.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index b4df5bc5b1b8..88595ea12f39 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -703,10 +703,14 @@ static void __init declare_vma(struct vm_struct *vma,
 			       void *va_start, void *va_end,
 			       unsigned long vm_flags)
 {
-	phys_addr_t pa_start = __pa_symbol(va_start);
+	phys_addr_t pa_start = 0;
 	unsigned long size = va_end - va_start;
 
-	BUG_ON(!PAGE_ALIGNED(pa_start));
+	if (vm_flags & VM_MAP) {
+		pa_start = __pa_symbol(va_start);
+		BUG_ON(!PAGE_ALIGNED(pa_start));
+	}
+
 	BUG_ON(!PAGE_ALIGNED(size));
 
 	if (!(vm_flags & VM_NO_GUARD))
@@ -715,7 +719,7 @@ static void __init declare_vma(struct vm_struct *vma,
 	vma->addr	= va_start;
 	vma->phys_addr	= pa_start;
 	vma->size	= size;
-	vma->flags	= VM_MAP | vm_flags;
+	vma->flags	= vm_flags;
 	vma->caller	= __builtin_return_address(0);
 
 	vm_area_add_early(vma);
@@ -765,13 +769,17 @@ core_initcall(map_entry_trampoline);
  */
 static void __init declare_kernel_vmas(void)
 {
-	static struct vm_struct vmlinux_seg[KERNEL_SEGMENT_COUNT];
+	static struct vm_struct vmlinux_seg[KERNEL_SEGMENT_COUNT + 1];
 
-	declare_vma(&vmlinux_seg[0], _stext, _etext, VM_NO_GUARD);
-	declare_vma(&vmlinux_seg[1], __start_rodata, __inittext_begin, VM_NO_GUARD);
-	declare_vma(&vmlinux_seg[2], __inittext_begin, __inittext_end, VM_NO_GUARD);
-	declare_vma(&vmlinux_seg[3], __initdata_begin, __initdata_end, VM_NO_GUARD);
-	declare_vma(&vmlinux_seg[4], _data, _end, 0);
+	declare_vma(&vmlinux_seg[0], _text, _stext, VM_NO_GUARD);
+	declare_vma(&vmlinux_seg[1], _stext, _etext, VM_NO_GUARD);
+	declare_vma(&vmlinux_seg[2], __start_rodata, __inittext_begin,
+		    VM_MAP | VM_NO_GUARD);
+	declare_vma(&vmlinux_seg[3], __inittext_begin, __inittext_end,
+		    VM_MAP | VM_NO_GUARD);
+	declare_vma(&vmlinux_seg[4], __initdata_begin, __initdata_end,
+		    VM_MAP | VM_NO_GUARD);
+	declare_vma(&vmlinux_seg[5], _data, _end, VM_MAP);
 }
 
 void __pi_map_range(u64 *pgd, u64 start, u64 end, u64 pa, pgprot_t prot,
-- 
2.48.1


