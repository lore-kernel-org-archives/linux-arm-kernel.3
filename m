Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24CF2C61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 07:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c+6c1mxNeRcK5OGJwTOV8Umz+CvUvEErlItanMxKc4I=; b=DDBerFKLQMvuk78HkvQWmYxSu/
	iQCiWGPesd9LmLqFL5s49HsXKFGVrcl+Yyf1RcbVNnSpeNGqcIM/Jzw6x7nO47PHMimGGHWGv1qAo
	MtjQphLEpB+t23uPcBz5w4BsICjwXMxbvL0CvWnWwaci8PJyfr4eOXwFLJ9Oi35n5TjqqrCLJWuyV
	sSrX5YJ034Mq5j4Rhcnt/IXBdDPRlySm4XNzwaP+wAZQ9fcWk5bwsJpFqp545hRGB4f56Ej5zNi4f
	ZEvc1hQFKxY/A/RnT0A3d5Q6gveW9/cLrV/oa4aHW5Zzf/Ab83SwEvNnKAPsIm+1qggy9/dOsxOVB
	HjF2FBQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fT7-0000000DwkW-2twR;
	Wed, 02 Sep 2026 07:33:13 +0000
Received: from mail-pz2-x0b.google.com ([2607:f8b0:4864:3b::b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fSx-0000000DwcU-1SCQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 07:33:08 +0000
Received: by mail-pz2-x0b.google.com with SMTP id 41be03b00d2f7-cc1cb94b583so255028a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 00:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788334382; x=1788939182; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c+6c1mxNeRcK5OGJwTOV8Umz+CvUvEErlItanMxKc4I=;
        b=ShAOYPZ46RZ5qlU2XX11f3xwwq/fmd25Jsl+NyA1p8IgjEboR+CM9tFRod+9pCoPi2
         iyzbvWXgpi3ImSUdp28sPTdOZ9dEowH6RTecit0rdizYrPOfPO4IrWqxFxWaALqEGsQs
         xe3dpLvBH+NdObj6BRw2ls7UQyE4/n4M8PGKXARRgWywNG6bq7QGreRncVNnBJovUISI
         EHz6tAuZ7L9PMgXgC8WOztnqpZKZkEwCeMa0ylC6oacXxJAiW90Tl9LMJxKsif9MaA14
         8KsWoZ9rBkxi4naIjsnO6xUphlsxQo57Y619Xe2ClzN5FSdDw41THp+ipGTe4x8XF5Z9
         JgRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788334382; x=1788939182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c+6c1mxNeRcK5OGJwTOV8Umz+CvUvEErlItanMxKc4I=;
        b=ikmDtnTiDsBC+R2LECksKt8rn1z3yyX0YXst3XVuicCe9WIREvvLYslrENREJ5KvBN
         LlNNHP2SZ+4pPqlBdwGbEtDf14eNPh/wPAoDwE3v+8idxegAiQJSJpqC0jAONW/GSv5q
         6I1S4iBAMoE+BRRq7WwsWeK719EKldYhP2F4pZWOv6/brWvoRw0BZiR3I6BYjV1NkZGN
         4zbJHex22nd1M7mrggfGv48JgP5sJDkaZiUvfOTsAQcVwvkaCOQszJKhFTO0ICRxvKLQ
         02Kw/HhjOZ40fSpKqjTrMtzg9zYusJnECcz3p7XiyzHLB9k7t9AJj5xFvCQKWtHosGqp
         svQg==
X-Forwarded-Encrypted: i=1; AKwUvBwJwMdZhx58tHbiQCM1LH0CfFHvHEbwgkoVeV/vZtIywMexVL5diPMsiRpr52sGjo7DEWTpkTHuzvpuUpv7RS4L@lists.infradead.org
X-Gm-Message-State: AFuF++nNxd68m9lIYVwvCCNSBWLNeC1SFYwHlkIbsVsZmeEz7soVVB2v
	GeLNSIGwmcqUUXZa8G5GBI1CgGNJRtGu78jlTR9sGA9Zajr799FkFvnS
X-Gm-Gg: AYBFou1qosNm/nQcYF7fs8SRgE9k8AmZixy7ZdMbF0jOrbvqnVAafHGSIQWqrQipeel
	zUeCIgfDA4FlA48Xjx0a1VpoMHIK/zJWCB++IUXTAxELHb88DaPPX9Vph30WSNmQUIDKVbL6/ZR
	l1HVJe1tGZe8/iE8T9A1wMkWQ5qgsmNXpK5LLs5ZPFxBDab9ksScEFe7SdKQi+8UFss+qQNCnC/
	WPjoHkBEROgx+63eS13mYj+Tymwx2MchLrDWoz7rwJn5JeR93aD7tnDo1HZNFFciQV1rLzDpbjW
	+2FXbbNsnmm4oees1jMbtTtxBMAEWA91oJLOrPwNB386L+EoBUQD2gc5AkPOrT6swQkiuq2fQ5Q
	2Jsp0GCNL3sY4BBbzQLgZzOj/iq9F37XKdHA+sG2Zj0ba7azmF/ANG4zZHze7PmwZ4brlWfRvb3
	fc1GBWBptbbpxh5Ej0eDOGAv/qOzYcdOEqhaJMf0UsfnOvVKken89HRgmL0SdNB/86eBmKDZ75
X-Received: by 2002:a05:6a00:330a:b0:857:74ae:ad76 with SMTP id d2e1a72fcca58-85ed4e09b6fmr5077449b3a.26.1788334382541;
        Wed, 02 Sep 2026 00:33:02 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db2adcbedsm926914b3a.20.2026.09.02.00.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 00:33:02 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	robh@kernel.org,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	m.szyprowski@samsung.com
Cc: mark.rutland@arm.com,
	kernel@xen0n.name,
	alex@ghiti.fr,
	hpa@zytor.com,
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
Subject: [PATCH v6 07/10] of: reserved_mem: add dumpable flag to opt-in vmcore
Date: Wed,  2 Sep 2026 15:31:13 +0800
Message-ID: <20260902073116.802752-8-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902073116.802752-1-chenwandun1@gmail.com>
References: <20260902073116.802752-1-chenwandun1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_003304_420647_4E8AB59F 
X-CRM114-Status: GOOD (  14.61  )
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
index 66093460584e..caa6a5c66bd0 100644
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


