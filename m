Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB39C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 07:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zXdqCoAvNU5Q6CQ7sbboLRp1ZBRBcN1iNhiraDQrK4I=; b=BN2UaYOhhhMfVCe1MhMtpXukov
	nLgZ8dzjnKrjdivFTbFuDbn1u148yEzKf98TxVdfntlKfUB9iuzsykY3D/JQawGy1JhBzTgJSWPVJ
	KtW5zZwaOHoMc4OPT//MFUve43fwlhdl8wZztBQrd8QuciJcQMUnZj4zb7qORDSDTnV5zwKR22UoX
	Rfb0kFU0eO6SQTJya7ledWwsIllcEQyZ1SOM+3qaB900qWjbXTFGyWaUxv7ZGQx2jLahKvFocSE6z
	ADz5VD+uVdbPa6843FBz9ZeqG5IEYoEppk2FEDvKTlyUpmrOyND6wdL9Z5Ewh/RupBxRZYvj9+EY7
	WqRtscjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTCk-0000000G9wi-3G3t;
	Tue, 30 Jun 2026 07:48:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTCj-0000000G9uo-3t5K
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 30 Jun 2026 07:48:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=zXdqCoAvNU5Q6CQ7sbboLRp1ZBRBcN1iNhiraDQrK4I=; b=GVj4brhJ0GSzy4zPpMie5SIY3k
	Hazx/EMzOSqgO0tyyuQoR5PzcYFz6pNygo3GCfL898gMhccPgumvbGZ47WnnMpuhwL73oEPSbE5IG
	vgH56QyGldiTRYIYDi5thQquTd/ys6oUg+nhskhh9cmWMd4tahz7Tx37OqH+UhkR+s+Ej7J4qOfwu
	Ww+Qt0idqxI+PSKuOV5ORO2xLPC1NBZ7308ZmMrZjBZBwJ58qgAvGAT840f7hxagOJ7dpSDKi+dNa
	c7EOOtwMCA1duOEzwZIsmjqKE8+JX5y+5idBI/EQWDIkrklnbdj/NE9wAnNro7zwUu9+Ny5itioq5
	B0TdjlAA==;
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weTCg-00000001cmS-1mbO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 07:48:24 +0000
Received: by mail-pj1-x1044.google.com with SMTP id 98e67ed59e1d1-37de961d1bfso3258726a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 00:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782805700; x=1783410500; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zXdqCoAvNU5Q6CQ7sbboLRp1ZBRBcN1iNhiraDQrK4I=;
        b=DkvYhZJ4mla3bTpfZnSeGNvJvIOhJmz0c3SrZotgyibR/5pVc+GzTlTVhjIWanSSjM
         UKMRty4+Y8VIGvpd1Ul7aNea5IiuTcMWeyaIMtkHl50xgXWZHc0e7s63+IDpndeJEQHE
         rEwJtaIZRRdVj32qNUZAxFj0mdbjtbNJKW5OdyOIOZ7/q4M6cih4nKO+sfwoGrFG/2fy
         vYqnqRw2ndKRLHoNv/bO7K8fbdzCzqLBoDq3TUmK8lqaa1G+fEop8Dx7FcpoZnyO4NEN
         5/CuSubvOjxRN6yqe+ASJLhyTkpYCwsX9GuRxlQlMcfLxYVZxxxQPJAZwSuqPI3pVQeN
         5WeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782805700; x=1783410500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zXdqCoAvNU5Q6CQ7sbboLRp1ZBRBcN1iNhiraDQrK4I=;
        b=hSlGb9Dkup/JjC7iGzbTHgmhi70+vCbg5Dz7AxyfHEHhs9Uo2R9zPCCXKi/x9AvdxE
         az0OKGEzROcGO7m+OxDjNrY1ORD/7fjyH0nQVYBshdA6kh3iUM8mMnaQk2ZzbH0Wb8GB
         jJoYcNDT/gruWFp03Q7p79JW3yCnLzSnvg8jT4Oa9775HUtbUkbxTBlN+pUJskCjwf1m
         J2R45WNss3oepyS4B3l0ptl3EWfKfLxC/utbljoqBD/s4GjUB3Tq0ToGAWDedy+ou3Az
         9IVFarF2ZedDCni77U3EkFwmnr8WLPVHeq7jjESt0G33z1s1v0tgTGaPWEKzQEdcB707
         ZqJA==
X-Forwarded-Encrypted: i=1; AHgh+Rr7MxsoY5j9fF6xnkuvywU+JPmer4j6YWWhcifXobxiEb/izOoLHMmrIdxZth7cFNZxkG1oIcNdUh5IObLFTQn8@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8JjwvFb4NARHo+FV/msYn58pBBQq/RS+gs90Tkiy/cE5dXcgZ
	464qsGUrsfL/TkZh8mwV7f+7XP12fgRur0yWIHGjsmwjxx+zdqANvtM6
X-Gm-Gg: AfdE7ckj7X5r46guyByCINrsREX8ciH5oR03SPaEl99u/OvSAoT/B/HNqZGcgf1Xnac
	1A426+RNoXWJAts2cboE8I7f9kTqo0T0s7bWB7m49Xzvvq64wUbXls06sC4u2wf8JIhKB3K4yFb
	maHt6t2lWrhp441TdaPtqg9C7ep0KwB4veCtWnbZBF+2rEw95jxDJXGTDpVQTlw8nE/zuGZ0pNL
	9gdTOki9AapeLS2SG1EEXFCuT1IfoOeVcBu84wbi9twkPJ+mw7TfmNkKELSci7Qx/QQgPpztq3Z
	qrAsC1D7CUHY0Vu8vz3NvWQOyqKiXK72rrEqJAPem6fNRVF7N8pDXHD3z6UP5L3pgKG9mZwFMsI
	KgVMNe17/HkL8Q4ajvIGFRVIY8FH2P4gzmU7oZPwNkWmE/w83/HTdXhDkUpHGwoNtQCzXT4QcOw
	JsXUMOSprN8im7vMtvtQu0aUwLLA==
X-Received: by 2002:a17:90b:2249:b0:368:af5c:5925 with SMTP id 98e67ed59e1d1-38052784effmr1969443a91.23.1782805700221;
        Tue, 30 Jun 2026 00:48:20 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382a2d3dsm7821045ad.55.2026.06.30.00.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 00:48:19 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	saravanak@kernel.org,
	bhe@redhat.com,
	rppt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev,
	zhaomeijing@lixiang.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	alex@ghiti.fr,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com
Subject: [PATCH v4 05/10] of: reserved_mem: add dumpable flag to opt-in vmcore
Date: Tue, 30 Jun 2026 15:47:09 +0800
Message-ID: <20260630074715.4126796-6-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630074715.4126796-1-chenwandun1@gmail.com>
References: <20260630074715.4126796-1-chenwandun1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_084822_707658_6CDC4583 
X-CRM114-Status: GOOD (  13.52  )
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

Add a 'dumpable' flag to struct reserved_mem so the kernel can decide
whether a reserved area should be included in the kdump vmcore. Most
reserved regions are owned by devices and do not contain data useful
for kernel crash analysis, so excluding them by default is the right
behaviour.

Reusable CMA regions are different: pages in a CMA region are handed
back to the buddy allocator and may contain key data for crash
analysis, so set dumpable to true in rmem_cma_setup().

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
Link: https://lore.kernel.org/all/20260506144542.GA2072596-robh@kernel.org/
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


