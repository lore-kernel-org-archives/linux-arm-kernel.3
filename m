Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21D89CCA462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 06:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EXuyqgfiF9x7HO7+fbFxeGIrd5nFUV6QECR0sZa4nrg=; b=I+4ZI20QmaFyDIRk0eBvXsfmg0
	HvrqWy13An3fTbIEbkIoJTjnWnDIBjse02O9NOdz0UgGQ+jGs+92mF2a/7HTRw16txTJgeaI6dgad
	rHC3H1skhzzq1Q6K27UNgagkcW0JKD7sVDrictfI9eG7hPWA50OBilEM1Q9RvfM/3pfuCWGiTHxVa
	unBnJnnK52kQoEMd05HYo1WHcskR6NxJ0O+/G4fI1Ohc/8rrGR8qtJtA99DLHFJmjt7jqgQYboKzA
	6LBYNcnj8bMRBCbZRd89OjCzOlcamo9JM5a/ARdHpP4VZAjTxuADLdO98pJcNf2XMX8i0soa/0agK
	r2xrvuZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHbFw-000000025ux-1u4H;
	Fri, 16 Oct 2026 06:17:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHbFu-000000025sQ-0rR0
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 06:17:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=EXuyqgfiF9x7HO7+fbFxeGIrd5nFUV6QECR0sZa4nrg=; b=D8wzhTorlg4F8agI0L19Vfp9LT
	o6XZ4+Jw2DwMUjJ+I2lBU3b2OohHAHZQ/zO2A0G5SIE3J+wu/2rG+2toBK6qv5zO5hNfwU64Tq4vd
	7sF1WzpaXYF8jsgkpVsAfR+uvoPdfG4LPr5aosOUeLKToIa790qG5bxnfMxHjnVnvzFbOyImKiZUF
	WpVTA3AjEJbZBLhU2BJENGDJJB5AuVE7gOT7c8BM43+XbghzIIn8bO/fLL4HoEbCO2qZA/uTlN9PK
	uKL7wG3QqrFOXJC+HDffeWcVg9PrV8OmQ+EkyPRtDfHmMGuOagtqcYNKaNLT85Bi2FnLRyQkloe45
	LgUFRjQw==;
Received: from mail-pj2-x05.google.com ([2607:f8b0:4864:39::5])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHbFq-000000019oJ-3ywg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 06:17:25 +0000
Received: by mail-pj2-x05.google.com with SMTP id d9443c01a7336-2df921c1d0eso9267415ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 23:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792131441; x=1792736241; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EXuyqgfiF9x7HO7+fbFxeGIrd5nFUV6QECR0sZa4nrg=;
        b=Cjx2NQscwvQbQHj2sCAZMsDA2kMIFvCjTuhiHgWwr86jsbxyXlJnH5r8ExBIHiLNEo
         QtyfDo0jIgW7YWSlWampYMbIMxllSE3weKqkm6AGMnYFqMEAe6Uw+54BHAqLO9VRaEAs
         ba4MoaYr1zpimPASjPn3fYBZj/xm3i4r6xapM1rvQe1RCvb2u80Vu7t6aCBlrVPQcYgF
         //e76eYTzP0vGXX5EqKC4JZU7GZhzqnR9OrgZpNs6mr4DZ0A0YNi4Vl40scwHup0kfD6
         2XfP/rOU3GbWC4nfaJyk0qHgLXVSx8hpkoSkJF3eGgQDaGm2anHX0EEuvHMS/CxrgYJ9
         /QSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792131441; x=1792736241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EXuyqgfiF9x7HO7+fbFxeGIrd5nFUV6QECR0sZa4nrg=;
        b=MUHD414jMJqj3Yk8cZlu08xuAuAxpGBzCASRbtOcXZ51tIN4EI9YUPrZoOsCxLVghC
         kaBWlgS8IwFWeTxx1mMXxnlkyM25oUr0/uThpJM+j2YcYJCY6EPjxfgcDV6owzbNz/Oy
         bXxY5X17S8L1YhytlaggnDzIEIMmuxFr1SPNZlYEGOEdScfRKMUPDqaSWlQvq1wVKweF
         8ngMHQ7trohMgF+NSfH6v+N2MYs+onOe0sE87JW8ra48ZQ8gr5tvKly0TJvOfnoUbPUa
         2x42X4YmvcAwKAmUwvCQ2l6JVqK797XJYyiIrc+nmJkXJ/m0uk5jtsvl047vxpprR1fy
         ivbw==
X-Forwarded-Encrypted: i=1; AKwUvBzlgjg59fyEAm7OCFrlIIt2ZnOlAnRTF2zbZP8lGUG+achwaVuWKngDyQshxIug5qSzeM9m9eZ28QsGjhB78T5H@lists.infradead.org
X-Gm-Message-State: AFq9FYLZQ85uCDqnxt6nuzHuljEboXpa2GA+nTQCuULP7rb9hnVsqHpv
	3BijTgkO29srtnoX137O5hHSEL8xGc27U96sO7sLVeWbkVztVV+pUriy
X-Gm-Gg: AYBFou3VP/iM1wxiM9LefYQA9ZHv4zOCxdxJBW8/fQhQbqEmE8NShgy3mfzfA+L3aaj
	d4oAictodZeapwOOFMZWi+qnq/L1atJ9FP4Bl0EvEQAU2kxNUhwWzstgz8K2QxeOtMTSv2HA8B7
	IjLrqRVDPy947TnR5heGDir5GEnZeK5iejMLhyKfV8O6U7U901GLDPrvw0ytDW4A9EyIFLhy5Qq
	Ufk3BIqsaC3fe11n+rQgANhN42Dwscv61yTNf3sz64sOEfoRmCTB5jNVOYtSFRw/IctgJjaBaYA
	Zww9bs0lS0oq/Hxu2DGjRxYT80r3D/8P5KdGySa5u3EK1t4OANX2sC2Wfft4q+vnbC3f0TDWmiq
	ydG3yUtFH5zb1VCMd/L7zVFQ9BZ95qRn6/L5qf5+IiRswXihjntdmV8A7bm6daPnH/OwltAVhmj
	Fumvah6p3/M+l4yB+M/87Nznbe7x165ZegGU84IztpjTJ/rs3h3AYLDfFKVrbqEeyfnYW+OzliU
	bZbFpFX/+CJB9ewuowF2w==
X-Received: by 2002:a05:6a21:1f8a:b0:3de:14ad:ae8a with SMTP id adf61e73a8af0-3e1d04198a7mr7196697637.16.1792131440647;
        Thu, 15 Oct 2026 23:17:20 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57b334e6sm586375b3a.42.2026.10.15.23.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:17:20 -0700 (PDT)
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
Subject: [RESEND PATCH v8 6/8] of: reserved_mem: add dumpable flag to opt-in vmcore
Date: Fri, 16 Oct 2026 14:15:47 +0800
Message-ID: <20261016061549.4181390-7-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016061549.4181390-1-chenwandun1@gmail.com>
References: <20261016061549.4181390-1-chenwandun1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_071723_241775_2555AE16 
X-CRM114-Status: GOOD (  13.99  )
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


