Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5229ACD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 03:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hKDMR5TAGwiz4Z0dhIjLc6hZgq3gL98geqqMieh10P4=; b=Q5sKJIAdiej/YjGs6i7YCOFxFG
	EmeIE5/vbZYfy1fIooUFRmEoqyMwq1Rfs7oWSLwHNPjQbRX6fGBBcPPUTKnzIzSP2F6NWA+R/kk97
	WlIqON4gOpy6/X8SRmyFq/kpUirAGcMwumHkPv9z12SgPwAmbux8M9AQngUwUYR3FrUDrzklOM0vW
	S75tKP/ye86CfTr19bwZQcOTEWwsoLXKqsW9Rw5H7SaBDyOtgdVNClQoEVo7Z4ZI3yLUgXG4+OIil
	JRugHsOa5oXQyQtAkEgTcERu74t6BjEv+EKVMfYQ0po3+pA0J/1GQ9Qv/f6ZQjy7ugDttHjiwGb+M
	HPWLf0OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS4yk-00000003FOY-2b65;
	Wed, 27 May 2026 03:30:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS4yi-00000003FMa-3CiF
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 27 May 2026 03:30:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=hKDMR5TAGwiz4Z0dhIjLc6hZgq3gL98geqqMieh10P4=; b=e8WMyB57tzuMNIlfFYcWfGijWG
	mAFBmrpnHGKzYjB/kIVSgk2xZs9dIroLVPJKC11F9TrEd+EQdS+XGR7Y+mJH5/fqSruTvUM2bRs+1
	/j/9P5wUEJEik9rQqWzh09efQe2fEj+rEkGzc8Ib+tOJ25SPw680tdhakwRHssHhQ8ROUt8CiJLUP
	B0xrnglukPGVcVoP7EYbuSj7WP0uOIMc0kjDNnCOrF3WQgV5/Fi+GDetPB2reKCt6H1OV1F0NKFRI
	Ukf71jFXgG+EaXMjDHoy3auNp9RBSZHWATn9UisCxqZLXt81Q74KQvza943g1aGlicA2rJXCMvUhY
	tnb6kVGQ==;
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS4ye-0000000CqkX-2ux3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 03:30:43 +0000
Received: by mail-pf1-x443.google.com with SMTP id d2e1a72fcca58-83ea84df1d0so3809942b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 20:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779852638; x=1780457438; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hKDMR5TAGwiz4Z0dhIjLc6hZgq3gL98geqqMieh10P4=;
        b=pozrrvGzOPZuO3lWdsinLPtBiAXzRM2WRhuj98N3QKlDsiW6A34NrE0js5hSAzckm7
         YilZnzzrOuZarkjBK7Xm6BFw7AshHtd2HUKSeIUrnNj/y3TTToUOiG8GQ3tROxthUTSM
         StpGZgL7GMKfixaROwc0TyW3ZSqpVjOK5EhohgLFTJkRL9U0s3reQRxTr0Re6Hpj6UtB
         w8J+gYaNxunVFFX43J8BUSsptlSTsoDVb/iTnUmLd/KXPppeaUJx06FHWf1+eqJRsMrT
         8YMdUd3m6ci5HcycF9aZe5xkJCe/YI6hifPibp8Ir9U4EFMdflch8j/fO3a1hFypzjDB
         YV1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779852638; x=1780457438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hKDMR5TAGwiz4Z0dhIjLc6hZgq3gL98geqqMieh10P4=;
        b=du+lqccQhNS21b50pM89k728dctp0HK2selHFj4yWCk/T+vywfex4FpYH1Z3ijdtPZ
         a1ZmRldkIyM7gsJDzC3C7UheHbj9ecnWKCsvqa9y0lymeUMN30jh/aMdMFbESMHcXK/L
         HjgB1EQt7fSXxWI2fZeUCPXtsSX/lD6v5htuoFP5FPMU2tGYmLBTyLCatTFxdpMUD0nb
         cSqW8UHxSj+ogaqldixfdUq9HK1o1AVyq5uYuDkKTvfsXZxKuuJzSRvSTrUbQej5h1gx
         9woNP/tXtBtD7VigwcgiNZdKJU1ROmzI0q09NZ/byJ+9cpBZIanShvmd407eKF6FW4K3
         CIBw==
X-Gm-Message-State: AOJu0YzocOtky17uAKJcDBaYRy6NPD4P5laU9BKZnHVVekb4I4hafvYw
	FYi8i6RH2dUacabvt6dWLPRUe2pZIVsV9ZD3Xio7FIvJ8I7aH7KEhyDV31wFstIzXfUhmQ==
X-Gm-Gg: Acq92OEF6akYY6cfY28uEKfshvouzvT+NG6Ru5WhOIBSP2U5UBsuZ9IO6YQG/XaH+Zu
	FfVrjpZYboEOTAN4PSfqvvzhiB+HgmTVf0syO8MqG4tq/Kml3GAVhdDm+PxRv5pxIV2p3+maRGD
	TKTGdUTcSjV2+CDqYlH1wO3PiuBXGTNX8z13ueyhhmL88SRKcATQnYoNSKMDSiSkicx9V/3n95c
	nUsLi2scMU+4EsYices/ANGZa3cd9oO33rtRvtSvJAl90w7JBcAGwO7rji1M/potOMRnUTLsyyC
	Dr6/N6rY1qkxzr5F/DPXhj44zJj2w8B4oZqwAkuNDBUSHfW1jfwW5/ci3zp73GptDjuqr0jUmL2
	NMu2VvTdMgQQ2VIKLvk3xtefngIWe/scNIoN93f0VYGCADF4JWu4mIX6nJYFHL4y+/dPFiStwt2
	/tcVqP9HH6t1ISZVPdPB/1rZm/GwFxchPDMmwg
X-Received: by 2002:a05:6a00:1d9e:b0:835:38db:82f6 with SMTP id d2e1a72fcca58-8415f69ea9cmr20057592b3a.36.1779852638276;
        Tue, 26 May 2026 20:30:38 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d7307596sm749688b3a.59.2026.05.26.20.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 20:30:37 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev,
	zhaomeijing@lixiang.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	bhe@redhat.com,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	quic_obabatun@quicinc.com
Subject: [PATCH v3 06/11] of: reserved_mem: add dumpable flag to opt-in vmcore
Date: Wed, 27 May 2026 11:29:12 +0800
Message-ID: <20260527032917.3385849-7-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527032917.3385849-1-chenwandun1@gmail.com>
References: <20260527032917.3385849-1-chenwandun1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_043041_317208_5EE47A61 
X-CRM114-Status: GOOD (  14.11  )
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
index 03f52bd17120..eddec89eb414 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -579,6 +579,7 @@ static int __init rmem_cma_setup(unsigned long node, struct reserved_mem *rmem)
 		dma_contiguous_default_area = cma;
 
 	rmem->priv = cma;
+	rmem->dumpable = true;
 
 	pr_info("Reserved memory: created CMA memory pool at %pa, size %ld MiB\n",
 		&rmem->base, (unsigned long)rmem->size / SZ_1M);
-- 
2.43.0


