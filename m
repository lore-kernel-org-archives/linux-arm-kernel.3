Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42711C56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 09:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=knTPycIW4JC9RtVxI7lTQdVb1SJbys3U0akygREf/j8=; b=pmxCMyTK8pgtA3F1JaaoIIPUWY
	AwfORCA+kliMRQ2uj50i/CIae7YKjLAvvFDVjFQ+wImW9zy7e+7p2soxX47QtyNUwN78zALrb3s5G
	CBEzb++CjX5bzm+DGjkY3A3fQhImhTwDPvGQ9p8d2SZo2NHfSWsL3x/zGG9O3AYU2E89gSKS43HJ7
	zqI9scSvp8JZ3dZjaj3ZRdSh9yLqu11oiGNt4ufwl829udZPbzMEOsJsp0K5Xury1bgq6FKDm2C2e
	kb9YMh8Rqqwp5GaXnLTum3qYsv1okFfqTCd4BOrhkI2vfl8RUfPY/xpwL6KFZlB2dciGFxp6F28ll
	d+D3joPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wruWC-00000005PfF-3lfx;
	Thu, 06 Aug 2026 09:36:04 +0000
Received: from mail-pz2-x00.google.com ([2607:f8b0:4864:3b::])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wruW8-00000005PZu-1ing
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 09:36:03 +0000
Received: by mail-pz2-x00.google.com with SMTP id 41be03b00d2f7-ca24d39d8a4so1086040a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 02:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786008960; x=1786613760; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=knTPycIW4JC9RtVxI7lTQdVb1SJbys3U0akygREf/j8=;
        b=Hla95+PRB/DtR20VwiFZ+IK4cGoyUwLht4Em59kjP2LDaq6hcKBOHT2WgSb3X5qp5t
         o+bJcl+gBxNkuYVmVGTaDuBrSVZ97H2FDtz+baEGr34IQ9Pc6DhmPscuP8l9JT9UbVxn
         TfQ3zQjtXe58EBFi4grZPLyNtZ+OaSocywF6oNqfCLkzXGMTH8facwOu7pLlYLRDOcpO
         4a7iEbblaKUACCF10RLJO0M8wThBzPuEFAT1JDLGKtJeIVC0MuRdXY6i1YuYp+u2DMdd
         chz2v2M/tvRNArxVVbezzD/YHOJydzEQqBexUynJIgFAIYvSKcwtdHu82cstjuQVJCb7
         tlGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786008960; x=1786613760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=knTPycIW4JC9RtVxI7lTQdVb1SJbys3U0akygREf/j8=;
        b=UqKFmzAuLc/b3C59+fTHCp0pbCtWS/K5Z8/NZk+3AQuB6LNdcv0lcahv4qIEJWQZle
         7I74hgRW0OjeT4WF2x5bMx5iKpWMGVq53LDbZWU3eUfhT+Svo2mE+6YEwJ0JuAVmJUeZ
         m4pYqSM16tk3LEPx/vwrVjcHnMGMXZu/RByehubXf9YWKmXgE28erwrx/1k87KxMZlfB
         BbnQijHNoNXDgK6sFb2VV6moDvnIpG7p9GrRXRwxPr/8NuC+hvAOGyRwxQht795b5dpI
         yNhgWMe3OmVcrr7K6EsIKoEx9tvSnwVpiMZ/4R6AqGIpZBoKyFEr2aO44hMP96JbqMiL
         HdZA==
X-Forwarded-Encrypted: i=1; AHgh+RqNVp5gYpjSa9aedXoOb+MHKQCC9RTvF9wU8Wgq7sCAq+KdKBN/y/jjscbaMgZ/Dh4ZBdKwJZsQ40x3JEOE6TnO@lists.infradead.org
X-Gm-Message-State: AOJu0Ywg6X9EDYe1DQFQ7GEfumgOm996qUwqoQFsjKXeFjERiBBtQOui
	/GMy6Bd6na9Q5YTTPoCDL9kbXLfmUMSjcBypo81Qs1JctwFoPGBiFtwg
X-Gm-Gg: AR+sD13qnhCofedu7i1LysUutVV13itho8bv5uew8PemuVcmY5k0xD0dhHUrI8etEzh
	5boG8ScTSgavV1hqx4s4Km7Z2L+UGvcC1bHfjtwJceY12ECErRcptzDzqjaKCcyz7ovQZVhCHXq
	tGEm+4NNM4iYmfpWpgfBD0LJLflCOKjkRv7xLssF2nOv62ZfaMkga4Wr5+efPKnSqIcT6gRAgrb
	1iObCB3TFXJruZz1XyYTZuzfQwOhIVlqwBZFmvCTPf/UnLkQpMOjBEQ/BPf/sKAJNmlzYtN0xVS
	9ApdsmJCIPJe2Dcs8dMTGNs7IfgP1SJ4mSbE3rFY4muYVhyXD1LK+6e1ssJ5bEJvVY7qFBgl03E
	B9Xqytl+B4pHpol2YnWXadkcN13UWPw65MxbyQJn2OxVPHvcX7irBsW66bA0aCEhqpxkCFaDsrS
	ix5/odahffXJM+pMt9xQNR/n67oRR16NrVywrn/0cfDi72Xg3uk/9OXSb5q46NJuS6Xb7OYzahD
	fU=
X-Received: by 2002:a05:6a00:2d8f:b0:848:7552:3d86 with SMTP id d2e1a72fcca58-84f2e009be7mr14478703b3a.23.1786008959699;
        Thu, 06 Aug 2026 02:35:59 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f453b0aeasm1043878b3a.13.2026.08.06.02.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 02:35:59 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	saravanak@kernel.org,
	rppt@kernel.org,
	baoquan.he@linux.dev,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	m.szyprowski@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev
Cc: kernel@xen0n.name,
	alex@ghiti.fr,
	akpm@linux-foundation.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com
Subject: [PATCH v5 2/8] of: reserved_mem: add dumpable flag to opt-in vmcore
Date: Thu,  6 Aug 2026 17:35:13 +0800
Message-ID: <20260806093519.2907771-3-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806093519.2907771-1-chenwandun1@gmail.com>
References: <20260806093519.2907771-1-chenwandun1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_023600_454154_DB589C3A 
X-CRM114-Status: GOOD (  13.73  )
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
regions are later marked MEMBLOCK_NODUMP;the filtering itself happens
in memblock, keeping the arch kdump code independent of the DT API.

Most reserved regions are owned by devices and do not contain data
useful for kernel crash analysis, so dumpable default to false.
Reusable CMA regions are different: their pages are handed back to the
buddy allocator and may contain key data for crash analysis, so set
dumpable to true in rmem_cma_setup().

The dumpable flag is also used to check /memreserve/ entries for overlap
with other dumpable regions.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 include/linux/of_reserved_mem.h | 1 +
 kernel/dma/contiguous.c         | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
index e8b20b29fa68..55a67cee41ea 100644
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
index f754079a287d..63ff134dadd4 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -565,6 +565,7 @@ static int __init rmem_cma_setup(unsigned long node, struct reserved_mem *rmem)
 		dma_contiguous_default_area = cma;
 
 	rmem->priv = cma;
+	rmem->dumpable = true;
 
 	pr_info("Reserved memory: created CMA memory pool at %pa, size %ld MiB\n",
 		&rmem->base, (unsigned long)rmem->size / SZ_1M);
-- 
2.43.0


