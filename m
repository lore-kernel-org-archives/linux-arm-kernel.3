Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CAECCCA463
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 03:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EXuyqgfiF9x7HO7+fbFxeGIrd5nFUV6QECR0sZa4nrg=; b=jTO0+CqA2q/GNnMllx/YE5PjI5
	8ypbepgFX/E6iYd8od6EPN58EgcXh9JN0luS0/Hb6wn5XrXsjQeH77r/cGAYxnJHlv1bX8OdDEOsV
	Fpe9XIht/M8Duwmmhfxe5xp8qtHgcA4NTnOHlisP/jr9L7uLwcKsfTcRQuFn31fxl3AIj29rgy3/e
	HfPqPVLwkLBHbqmASEseu5DdimJnP00Ob2Y6uVFnOP78q/lGLPFAscth2fAL0Xg9AzLjVO/lzQjw/
	NqepMLyTDNtqDdncD7/4shiRUtt8SlIjIARrM27Cqy5/irnx0UXpuOJZSCdz+4/sf9Yo4Ju0ooaMv
	8ZGTs/uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYLD-00000001oFA-0vwE;
	Fri, 16 Oct 2026 03:10:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYLC-00000001oDv-1EhJ
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 03:10:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=EXuyqgfiF9x7HO7+fbFxeGIrd5nFUV6QECR0sZa4nrg=; b=hyBcozn9X/BQlBn4StsaFjPwts
	r3tsKolmOUHAM2bAwO+Fczu2KFbaOeubX81Gl3a6w3HxBXUF3fOHBy4pm0I0265e4phQO4LlNKxJG
	xn4Ox3UQvJRT6grVfMAmy9JyqGgv8jXxGn4m8M+0KiILm2nkAMA2wuh0zVefGcQD0nGL/5A74hvxY
	1cb72NEBctENo/xdBa1KrKRYgZ+9pTMGUYLscbVF2Ldn0M5pjPu9WdCUVeZwYeKtfggJFCcj9HlTw
	dTnDiO5KaR9DM4BQXtVXltrbLp1s1DiY6cPjInmzXgMCOgKa5mUChuQrhc52kNZXbI04q/I6iyftA
	955Q9POQ==;
Received: from mail-pj2-x0b.google.com ([2607:f8b0:4864:39::b])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHYKz-0000000125C-42In
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 03:10:40 +0000
Received: by mail-pj2-x0b.google.com with SMTP id 98e67ed59e1d1-39569e136f9so1779512a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 20:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792120228; x=1792725028; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EXuyqgfiF9x7HO7+fbFxeGIrd5nFUV6QECR0sZa4nrg=;
        b=YGDVNodgojRWZzg3Rz8lGmdJgbdWJdBhPX/lRsH0b5aNYUFNgn9jZaCZLSz7QVSIN2
         5rjgxTiyH7cm4bk1lJRKazckvsZeHWV3p9l2Ahrqrs0GsxBHMp7feqjuTM63qANt7Pxl
         vZt/R8LwZKP814iEX1YF5Zmjf5yAKb/dxYuVrmRCyFm4CQeZxLTxorOylEjGvEfrPO/5
         Yo+gl2zh4Mbcn0ktboJiPRNEGBXR3TQgOSutZVckl++iHUqIBJTur8T24Y9NDcxNqBt3
         5vzbB4ELsOk5OHwJRfXEw+OtBT3uJ5b8WkpmUCarBEG0VCof6QlGRsgxWGdRMN8wDqDV
         lauQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120228; x=1792725028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EXuyqgfiF9x7HO7+fbFxeGIrd5nFUV6QECR0sZa4nrg=;
        b=nl7q9VHZNIg0+BE/y9qTf24UP3g57Pf2XyCnoeyiNpl5r6VOmRh6m2YIdk6OzWgwUE
         fQH3p/8x5O8lvr6f3g4Sw08zRG5/4kbqNVe7bVn5Tfg3Ull4xvQG9xTO7u985HUPgj+S
         mYtvUsYj83sGZfWUOqMfX9nYmGTch6WtLu2SGu7rNuhzOc5dZ1WLHwNU2RLlp4xxxn9t
         fLIi8to0lzQlTxTHDEcem8clxNJG0JSaWVeHe7SRokeoKAoOFxOhE5KVqPgPClrDLnkZ
         oV5vs4JgpfbGCS8u9F3DjtpC1T4zJfVvF+b1qUfAvl/V42E441tM780UZwPVzx2hy7M8
         xEkg==
X-Forwarded-Encrypted: i=1; AKwUvByxIO8si4KwQjtROJpxhCZmuu8GfkpCA+fo9KgLm/kAnbzXzE3L93rytd4fxp2D5kWe56yReNuCFFMFBljEjM5/@lists.infradead.org
X-Gm-Message-State: AFq9FYI92UDKvx4xiv7cDuLZoIWFqNGAAs+RgSxAf7haqb6ypDjH31K7
	CMn9Zs9Wdy4fxJpQryEBLuf8klbVolQfUK0yM5GNT0hkyfR9AZQ2uUyf
X-Gm-Gg: AYBFou0dqOMweJ9zt9QiiLzD6LNV4moDUX9df3X8B3ReEizFshagkPzeRSbROskqwBJ
	J1VkhKv5O1zAjbYtPK2WjDCHJjVnx2aDaY47YmTJVLDALHKqRHxvYpl7wS9VrsrG1xmpa6mY+iY
	tWeBttMS+7vV/24Nl4WFalNSEnKeLhQXALUJRJ7N8wikgyYA+VGdwKXrB3OtbMzmg1sKY7As18s
	pDwoAyAr43BOpw+bYjnr5hKjtSnxmBuTBrasRx2FRyLbmyKMa+5ojtzs+GwW3P5Ar7yB6dje9C/
	2y4msJZhyn6YvPuNrqn3HSVpfGke8pqsB/0wN3yoMoeS8y55xapemlnLxxICIRzXkB53gjHI8nd
	7JIOiSUTfYfnDKy2VPQrq8uKpdMkpeRrKgxI2rZFsiP1ZmBHo5Bhte5SokeJrCijLC/QIfwDF7e
	4vg9LLG3oujLXI/2fF2QSb4FMcht5+IxhydyY9pGzo5n47Rh/lF7GJGJ17qSoBYqQDDq8N2LDEw
	9etUnYU33UZh0kEAst27Q==
X-Received: by 2002:a17:90b:2d86:b0:3a7:d2b5:2e99 with SMTP id 98e67ed59e1d1-3ab3a60d1eamr16967413a91.20.1792120228159;
        Thu, 15 Oct 2026 20:10:28 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd3cc73c7sm370085a91.4.2026.10.15.20.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:10:27 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v8 6/8] of: reserved_mem: add dumpable flag to opt-in vmcore
Date: Fri, 16 Oct 2026 11:08:53 +0800
Message-ID: <20261016030855.4062882-7-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016030855.4062882-1-chenwandun1@gmail.com>
References: <20261016030855.4062882-1-chenwandun1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_041038_312590_94FA89F7 
X-CRM114-Status: GOOD (  14.10  )
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

From: Wandun Chen <chenwandun@lixiang.com>

Add a 'dumpable' flag to struct reserved_mem to decide whether a
reserved area should be included in the kdump vmcore. Non-dumpable
regions are later marked MEMBLOCK_NODUMP; the filtering itself happens
in memblock, keeping the arch kdump code independent of the DT API.

Most reserved regions are owned by devices and do not contain data
useful for kernel crash analysis, so dumpable default to false.
Reusable CMA regions are different: their pages are handed back to the
buddy allocator and may contain key data for crash analysis, so set
dumpable to true in rmem_cma_setup().

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 include/linux/of_reserved_mem.h | 1 +
 kernel/dma/contiguous.c         | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
index 49da515859f2..99c0f3ccc297 100644
--- a/include/linux/of_reserved_mem.h
+++ b/include/linux/of_reserved_mem.h
@@ -15,6 +15,7 @@ struct reserved_mem {
 	phys_addr_t			base;
 	phys_addr_t			size;
 	void				*priv;
+	bool				dumpable;
 };
 
 struct reserved_mem_ops {
diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
index 90937dc7c627..d7bfc38ac762 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -567,6 +567,7 @@ static int __init rmem_cma_setup(unsigned long node, struct reserved_mem *rmem)
 		dma_contiguous_default_area = cma;
 
 	rmem->priv = cma;
+	rmem->dumpable = true;
 
 	pr_info("Reserved memory: created CMA memory pool at %pa, size %ld MiB\n",
 		&rmem->base, (unsigned long)rmem->size / SZ_1M);
-- 
2.43.0


