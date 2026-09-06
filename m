Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE53C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 02:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ohXcpCjF3E8Su2iGbnUTFcKH4Q5PX6bz9vn2jqgCP+c=; b=VLqBQo/xfaCAutdPnlM1LZuJsi
	mxzVKWNei32D8NqTpDsmRpwQivvDpBZ7ZOrF6K5f8H2TNnl/w6C+T7+pOQSJPJPI53WJiXa0ThIn2
	WO1UWrcTF1VAr4cqULMo0Zo60shZHhzvM+RU+x2C+hhor54KlPh8LE8dhBCTRooluWZJXjtLafPOR
	dWfBqaZgFGKwVxIC2CuKIWH19GN3IEqpW7YBtJlXBotO43n6sS1Chr597UpF2L6cOYiaD/hux20ck
	Eo6CC5V57FNh/NODH4eHI3bzvhIBpMJ8cO00Ntt8OXv5y/quuZq+D09z44az/my2hfoTEq4j6dR/H
	L+aIHrjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x32BZ-00000004Z2S-1QSO;
	Sun, 06 Sep 2026 02:00:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x32BN-00000004Z1s-2CFM;
	Sun, 06 Sep 2026 02:00:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 54CA343C12;
	Sun,  6 Sep 2026 02:00:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 131AD1F00A3A;
	Sun,  6 Sep 2026 02:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788660032;
	bh=ohXcpCjF3E8Su2iGbnUTFcKH4Q5PX6bz9vn2jqgCP+c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=onvqGLmcP1GLOxpEKfzU67JdQE7IDZGMsPO64h/0NSOK+RvFXdBCqD8+ofD1WBq2g
	 i6cYyIHzjygejYh8PKFLzFY7Ac5zL8dW6mlFYoHExtDtLuDxudvpRUkwCZVnaHxKoG
	 FWNotUDCuJBgzmpoHcxnORH4VODmerRMAERbMW3I=
Date: Sat, 5 Sep 2026 19:00:30 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Adrian =?UTF-8?Q?Barna=C5=9B?= <abarnas@google.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Alexandre Ghiti <alex@ghiti.fr>, Andy Lutomirski <luto@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Brendan Jackman
 <brendan.jackman@linux.dev>, Catalin Marinas <catalin.marinas@arm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, David Hildenbrand <david@kernel.org>, Gerald
 Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens
 <hca@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar
 <mingo@redhat.com>, Len Brown <lenb@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Pavel Machek
 <pavel@kernel.org>, Peter Zijlstra <peterz@infradead.org>, "H. Peter Anvin"
 <hpa@zytor.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Ryan Roberts
 <ryan.roberts@arm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas
 Gleixner <tglx@kernel.org>, Uladzislau Rezki <urezki@gmail.com>, Vasily
 Gorbik <gor@linux.ibm.com>, WANG Xuerui <kernel@xen0n.name>, Will Deacon
 <will@kernel.org>, x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-pm@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 loongarch@lists.linux.dev
Subject: Re: [PATCH v3 0/6] arch, mm/execmem: resolve confusion about
 set_direct_map_valid_noflush()
Message-Id: <20260905190030.adf2740822e211ddc028a24a@linux-foundation.org>
In-Reply-To: <20260903-execmem-set-vm-perms-v0-2-v3-0-949b64a9f755@kernel.org>
References: <20260903-execmem-set-vm-perms-v0-2-v3-0-949b64a9f755@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 03 Sep 2026 12:28:26 +0300 "Mike Rapoport (Microsoft)" <rppt@kernel.org> wrote:

> Recent discussion about implementation of execmem's ROX caches on arm64
> revealed a confusion about how set_direct_map_valid_noflush()
> implemented on different architectures.
> 
> ...
> 
> Implement these adjustments, make execmem always use VM_FLUSH_RESET_PERMS
> and revert set_direct_map_valid_noflush() changes.
> 

Thanks, I updated mm-unstable to this version.

> 
> v3 changes:
> * set VM_FLUSH_RESET_PERMS to allocated area just before flipping the
>   permissions rather than at allocation time
> 

Here's how v3 altered mm.git:


 mm/execmem.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

--- a/mm/execmem.c~b
+++ a/mm/execmem.c
@@ -36,7 +36,6 @@ static void *execmem_vmalloc(struct exec
 	unsigned long end = range->end;
 	void *p;
 
-	vm_flags |= VM_FLUSH_RESET_PERMS;
 	if (kasan)
 		vm_flags |= VM_DEFER_KMEMLEAK;
 
@@ -277,6 +276,8 @@ static void *execmem_cache_populate_allo
 	/* fill memory with instructions that will trap */
 	execmem_fill_trapping_insns(p, alloc_size);
 
+	set_vm_flush_reset_perms(p);
+
 	err = set_memory_rox((unsigned long)p, vm->nr_pages);
 	if (err)
 		goto err_free_mem;
@@ -439,6 +440,7 @@ void *execmem_alloc(enum execmem_type ty
 {
 	struct execmem_range *range = &execmem_info->ranges[type];
 	bool use_cache = range->flags & EXECMEM_ROX_CACHE;
+	unsigned long vm_flags = VM_FLUSH_RESET_PERMS;
 	pgprot_t pgprot = range->pgprot;
 	void *p = NULL;
 
@@ -447,7 +449,7 @@ void *execmem_alloc(enum execmem_type ty
 	if (use_cache)
 		p = execmem_cache_alloc(range, size);
 	else
-		p = execmem_vmalloc(range, size, pgprot, 0);
+		p = execmem_vmalloc(range, size, pgprot, vm_flags);
 
 	return kasan_reset_tag(p);
 }
_


