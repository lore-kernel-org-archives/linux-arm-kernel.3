Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4034DC624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 09:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bJhY/LLxze6/C4vFouS2rlXgLYWhmWyrhw9PO0Xdt/I=; b=mLLyN6fAwhZA0bCcwL+LZGF/al
	nz5p69iAx1SWjsLPu73tgkdtb936cPG7vazcgOTAN4QdawIClXe01ZQ7qu49WN6Qv0RKYOLZJnI0+
	K3tJFgdaqRLVXUUBpOt34ghPGfxOkTNPQphUrUuh1kjeXZsOreq3CeSkos8MdegqQtF75IhCn+c+M
	kLINcSVWJ9pwx/kBPAhu4JcGnzFxiIQNWfQuVEUQqew7yI9YY6hDNK2eEYlNWDuJrUj1X4h7MaHFW
	rQlfSo19w3KJk4BkcScpCRmZK+MaIFEppe6J37c9tQrSzPUUApn/OzNia3prJWUrIF7ulo4/wveto
	VM8qoCsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23kj-0000000GwX0-01MI;
	Thu, 03 Sep 2026 09:29:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23kh-0000000GwW7-49WH;
	Thu, 03 Sep 2026 09:29:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7EF9141ACD;
	Thu,  3 Sep 2026 09:28:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71C111F00A3D;
	Thu,  3 Sep 2026 09:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788427739;
	bh=bJhY/LLxze6/C4vFouS2rlXgLYWhmWyrhw9PO0Xdt/I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=kvGUm0MiVrWc44SB3atJmrKskdsgB+xhnX0hruGashawEDHD/QVsPbyy7KprG/8ZE
	 BS9PmQYMBNAQsLr55nz3Bzs68mggaKckz6sK4u2yAdNaApWoYDtLoqEJ10IRUHCNAG
	 8ygkoNniX3OSmRgfBOd0y5JjygJMJM45E76llZtQKymOV6OvJE6cw0M6M63buMOfnT
	 AWjDxnKzI3V4HFoUmMzR2sMo8Dvype3bEmrojXDAR1dQxqiScXqIR/5uufmylbqQWI
	 fnv4nfLZD/txHoHH8QtI5LaCYJ3L7ox1yqTEgPPIgEJMkDH9dso642uH5MlYasd2hi
	 hWVdUu0Wsm41g==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Thu, 03 Sep 2026 12:28:28 +0300
Subject: [PATCH v3 2/6] mm/vmalloc: set area's page_order after allocation
 succeeds
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-execmem-set-vm-perms-v0-2-v3-2-949b64a9f755@kernel.org>
References: <20260903-execmem-set-vm-perms-v0-2-v3-0-949b64a9f755@kernel.org>
In-Reply-To: <20260903-execmem-set-vm-perms-v0-2-v3-0-949b64a9f755@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: =?utf-8?q?Adrian_Barna=C5=9B?= <abarnas@google.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, Alexandre Ghiti <alex@ghiti.fr>, 
 Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>, 
 Brendan Jackman <brendan.jackman@linux.dev>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 David Hildenbrand <david@kernel.org>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Len Brown <lenb@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <pjw@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Ryan Roberts <ryan.roberts@arm.com>, Sven Schnelle <svens@linux.ibm.com>, 
 Thomas Gleixner <tglx@kernel.org>, Uladzislau Rezki <urezki@gmail.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, WANG Xuerui <kernel@xen0n.name>, 
 Will Deacon <will@kernel.org>, x86@kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, linux-pm@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
 loongarch@lists.linux.dev
X-Mailer: b4 0.17-dev
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

__vmalloc_area_node() calls set_vm_area_page_order() to set area's
page_order before actually allocating pages to populate the area.

If allocation of large pages in HUGE_VMAP case fails midway, this leaves
the area with elevated page_order throughout the cleanup path.

There is no actual issue with this because the only place that currently
relies on area->page_order on the cleanup path is the loop calculating
the direct map alias range in vm_reset_perms() and it anyway skips
unpopulated pages.

But having set_vm_area_page_order() in the middle of __vmalloc_area_node()
makes things very obscure, hard to reason about and error prone against
future changes of the cleanup path.

Move the call to set_vm_area_page_order() just before the successful
return from __vmalloc_area_node() where page order is guaranteed.

While on it, initialize local page_order variable with its declaration.

Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 mm/vmalloc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 0380917392e68..22aa554d123f5 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3879,7 +3879,7 @@ static void *__vmalloc_area_node(struct vm_struct *area, gfp_t gfp_mask,
 	unsigned long size = get_vm_area_size(area);
 	unsigned long array_size;
 	unsigned long nr_small_pages = size >> PAGE_SHIFT;
-	unsigned int page_order;
+	unsigned int page_order = page_shift - PAGE_SHIFT;
 	unsigned int flags;
 	int ret;
 
@@ -3907,9 +3907,6 @@ static void *__vmalloc_area_node(struct vm_struct *area, gfp_t gfp_mask,
 		goto fail;
 	}
 
-	set_vm_area_page_order(area, page_shift - PAGE_SHIFT);
-	page_order = vm_area_page_order(area);
-
 	/*
 	 * High-order nofail allocations are really expensive and
 	 * potentially dangerous (pre-mature OOM, disruptive reclaim
@@ -3964,6 +3961,7 @@ static void *__vmalloc_area_node(struct vm_struct *area, gfp_t gfp_mask,
 		goto fail;
 	}
 
+	set_vm_area_page_order(area, page_order);
 	return area->addr;
 
 fail:

-- 
2.53.0


