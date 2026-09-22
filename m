Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B4EC98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 08:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JU/OT6l28quZrPrYfN7XUOSpOrASPsDzS2PQ3ztfmsA=; b=MOcWB33QwL9KZdeio6ZzyWBI3A
	LcVhV3sEaJvbxpd0YrqwrJmBRWwXltV9TcxHRp91NmQF6v7J3aZbZ98o8GjSy2Ztf3QoG3Zvw/1FU
	yijpn7E6X+SakGst5nhnXPYUs0sm4ZShuTbCDB93rA3AeHfxWjWK8GKtMn7dkB4ww5b1N+/tncEb8
	r16BCqJgJFANsOrc/iyw6P7K3EMMeS8DyHDtkTrxu3dJ+DinfAsl6frsoGgcS1bu8YIYaHOYWVPgY
	upOWym9nSPcc+C8Q3ftJ04kBJUrns8XnQi6lqt5HamjO4TRy9Jh2PofCzdRXQlUucJBwJ3iWeiqBH
	OSLSdDNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8w7e-00000004k20-0x7p;
	Tue, 22 Sep 2026 08:45:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8w7H-00000004jbA-2sOu
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 08:44:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=JU/OT6l28quZrPrYfN7XUOSpOrASPsDzS2PQ3ztfmsA=; b=psKyF6Vt+UhBzV3lYLOwiWN+QA
	Wl9Zi8gkpN8/TROA0TJcj1BHaVrTNiiXNVbc+CEgaU/+8yOyHInukhhCpE7Ugx/POUqAfT6lrnL7N
	vQOfuToeii9kj3Lmg56pi3+iAw9SfK3UsecfxpWpZ6w8NdLcmruYGwsfAG9VBuYeii4kA9ETdslth
	mswpj+v4LLe2EayuOsjgHZ75alYLS5aijNeVqCkPjnYMdApPTiSBFZifOdPVNVMY6hGoJ+QWPHLxJ
	Dv0F8OZGhJqZ6ANFGlDg/K2QVFV6r37Vb9qFjQwFTbOyH6ozGq4QtN4NFXQskRnHQOAzmOuU27F00
	64v22cNA==;
Received: from mail-pj2-x00.google.com ([2607:f8b0:4864:39::])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8w7C-0000000DHnH-0OPQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 08:44:42 +0000
Received: by mail-pj2-x00.google.com with SMTP id 98e67ed59e1d1-39e37c430bbso1830864a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 01:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790066676; x=1790671476; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JU/OT6l28quZrPrYfN7XUOSpOrASPsDzS2PQ3ztfmsA=;
        b=ImX/9cmIbPL16ZAQxdQV/uH6ZRi33XZ6MjFYymvGyNtM08xpLe+sGYfclz1S69/Ub7
         SC0GKIkq5Owu0Lky+GhBUPMlJ3kvlGJL9tjnltTRWkltZe/FIzx/bp3PTt18VsAndhDf
         PxaRExNtYR/oxvpJNgsS/xsKHw6U7z1iro+tw6C1E9irY3RrMQ7hLAcsdQGy1ptELDw+
         90xSViA/1g4lsKV58pNLICq4iYYDLfSmiSttjoP6OO4AjBJFapG6jNkz36SsZWlBFd4K
         GNCtb9HaYYQ9v4P2hponU3ZdkGd89hCZV40FedWSPCiCzz+8zh95Y4vGu7s7uynmua7N
         6XJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790066676; x=1790671476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JU/OT6l28quZrPrYfN7XUOSpOrASPsDzS2PQ3ztfmsA=;
        b=U5PJ1GEpbx0IHyEfqc2c/BhgnecC87riaf/+2mE6G1PvgPrRpLtDFCgAjez5INtJ0T
         cHrkyC6uawi+lBvpvi0xfOebJ7x7hcBo1Gk+i4fCn6oS0vrYuBtspj7iQwq3BHrw9sA0
         uu+D/1WgsFmQ/BPf3H1MmAliMzd1/ieI66TY4k2r4Pfie27iCCix65AmNRrgGx2K6+2T
         K5CzCTZvvRIL/l++HWe9gulx+i4L1ZRKFHE5kUYLrNibdQmwZbQdC/oR4KPe45jsbSu+
         9/yW5dTrVuW99FTISYgnWkVd1NowHUFzCoHLo8P5B94VPkzKKfh8Gakl3q41zk5Gflg8
         phjA==
X-Forwarded-Encrypted: i=1; AKwUvByGbtdwGOvKjC3zKlkCugCRbkaQX2LFYuuqwyJ5ew7A8K/xeWqrrPwUIFAlwJTyQ5YJudPfDTtpL/3DVtZ9cvg9@lists.infradead.org
X-Gm-Message-State: AFuF++mI39RXAu8ovcawqKbOq1q07/4NzhTJU1AUq74cv0KtnAizmer+
	3uJ5uQGK5BNfe81uIu+TRjIvvW94bznSa5v1deSrvj6QufsLa6kjAu/x
X-Gm-Gg: AYBFou3oLPPMAqTd/GTLObhJyymRGf1DomW+bNNmly4EbywupaHgbacsoeoTps8iiwr
	cSyn+K+gIbXdes/+4jeo0aUFx/xvHmX19zVj16C/WybE60oU6yQ8zy9PB3PLd3f0EyLxhEwLE4R
	OIsOkLzq/JmKDS7gD7ZTLirQPWXvSYThJXrNpxA2Edt1NGMM8D/AyBmtLVRDOswvytw3jO1p47S
	aHbfqDz/Zpc7+keofOZLufCLDKzwQleQY6yiF2stOUUAxKtp+v8/OAF4b+ur4ga6ih+S5dEs40W
	53mMogGDhTD1jkuqE8aW+HGszjL6iQr7Kl6QpZNNuLuPpKaWSEhgyfEZ+XeC+cN7vYDFIwjqMwR
	ZYaN35KjDWiL4FjklqnLJuppBRwgBkn3fRAv/zSuTwv2XACvXzA063wUCDAHomyfRPUbbQC+RmP
	yiBKkvmhApvBieM81GmJHziAmPvtv7tUT6biY6q1BktrWku/0AnQ0JrtebJCfJ96840jE2SQuil
	yKJnRwwm7s=
X-Received: by 2002:a17:90b:5408:b0:39e:6a81:f34d with SMTP id 98e67ed59e1d1-3a07320077dmr483552a91.39.1790066676289;
        Tue, 22 Sep 2026 01:44:36 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0674a5ae4sm3670016a91.12.2026.09.22.01.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:44:34 -0700 (PDT)
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
Subject: [PATCH v7 7/9] of: reserved_mem: mark /reserved-memory entries with MEMBLOCK_NODUMP
Date: Tue, 22 Sep 2026 16:42:54 +0800
Message-ID: <20260922084256.1515554-8-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922084256.1515554-1-chenwandun1@gmail.com>
References: <20260922084256.1515554-1-chenwandun1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_094440_654630_6F991E43 
X-CRM114-Status: GOOD (  14.63  )
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

Mark non-dumpable reserved-memory regions with MEMBLOCK_NODUMP so
kdump can omit them from the vmcore.

The marking is guarded by CONFIG_CRASH_DUMP so non-kdump kernels do not
pay the cost of splitting memblock.memory entries at NODUMP boundaries.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/of/fdt.c             |  1 +
 drivers/of/of_private.h      |  1 +
 drivers/of/of_reserved_mem.c | 15 +++++++++++++++
 3 files changed, 17 insertions(+)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index a64afc3ded3d..286fd4db6312 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -1285,6 +1285,7 @@ void __init unflatten_device_tree(void)
 
 	/* Save the statically-placed regions in the reserved_mem array */
 	fdt_scan_reserved_mem_late();
+	fdt_mark_reserve_mem_nodump();
 
 	/* Populate an empty root node when bootloader doesn't provide one */
 	if (!fdt) {
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 0ae16da066e2..505735732c13 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -187,6 +187,7 @@ static inline struct device_node *__of_get_dma_parent(const struct device_node *
 
 int fdt_scan_reserved_mem(void);
 void __init fdt_scan_reserved_mem_late(void);
+void __init fdt_mark_reserve_mem_nodump(void);
 
 bool of_fdt_device_is_available(const void *blob, unsigned long node);
 
diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 8c9d6395d6a3..f29a07e8fb23 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -677,6 +677,21 @@ static void __init fdt_init_reserved_mem_node(unsigned long node, const char *un
 	reserved_mem_count++;
 }
 
+void __init fdt_mark_reserve_mem_nodump(void)
+{
+	struct reserved_mem *rmem;
+	int i;
+
+	if (!IS_ENABLED(CONFIG_CRASH_DUMP))
+		return;
+
+	for (i = 0; i < reserved_mem_count; i++) {
+		rmem = &reserved_mem[i];
+		if (rmem->size && !rmem->dumpable)
+			memblock_mark_nodump(rmem->base, rmem->size);
+	}
+}
+
 struct rmem_assigned_device {
 	struct device *dev;
 	struct reserved_mem *rmem;
-- 
2.43.0


