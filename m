Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3091C61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 07:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IlegJqwkFPej4fFKCV2MAr7wlJV+QNtxUfZHapDGJcw=; b=Qiq5SuW6il8FaBNdD0PXI4tYR+
	BCEMb35ORaMJSl8zGXRwqJRReQhnfrofegGFSWp76HZS5D9TOvH6aGHNAsBLrCqYjihXnT7Zyveqr
	FGItwFI5HUOFCz0id3KUlDVjx276aFdmF7kOtac9lXg3V/mzP5LeGXEbTFZ5wznJT1vCr9gY0GzdO
	txteauJOoRayXu9azki0KdckmZJOi/KboAUphYYjlHJqEyeU70bRi1lqUHPKA+zFfc3w6pnR29Pbv
	EBHE3NbQfC9GN1kpZCsOt/pXg8pLVwdwi2zwa+s8aNbjsS90PwjYa1+oLhHR7TWv4m39FrmvJ3lIW
	nFYRE+RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fUp-0000000DxOa-0f2O;
	Wed, 02 Sep 2026 07:34:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fTT-0000000Dx1D-2dtE
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 02 Sep 2026 07:33:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=IlegJqwkFPej4fFKCV2MAr7wlJV+QNtxUfZHapDGJcw=; b=GHOw1Ootg1vsZLTSq/iPQAG67Z
	bep9MzaKyjRSlkVpZT3ot3sr/xk5769//BOoIIZeUqKMBno8gv5xY8mrAA2DE9VCobx+vxKcp1RIf
	s4XibNBwVNcFOd/GGSMbcSLNqOSCFHrUS2nLoSAEmtKFcU1Jf0NafYBtAtVSKDKNJKQ4EfEzQLv+S
	FGhhyOpMvpPPsiS1XMDjTPvwAGodjdO4t+lMZNSodytGUfjj54YHqgQjN7MIFex+gcKGMFZJt4Nvy
	wmmrKJytWW8x6S2K5uDkRWqsAVlQv0IWO0rlHgNUAXgxQsdPSMlz5xZoRgg+yJnq34olj0M1P3Ne3
	syKHpgFw==;
Received: from mail-pz2-x03.google.com ([2607:f8b0:4864:3b::3])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x1fTQ-0000000Bh9v-1zLH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 07:33:34 +0000
Received: by mail-pz2-x03.google.com with SMTP id 41be03b00d2f7-cc1c2963c92so225106a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 00:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788334410; x=1788939210; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IlegJqwkFPej4fFKCV2MAr7wlJV+QNtxUfZHapDGJcw=;
        b=LRjyrchoDe0/9SlQNuOTdckSxhwQ4K9AReq5EuzhXjSpjI7oQQwLm2fSg1fvpqmMdI
         aZpsrxyW4oemsLIlz0SQo5APfufJAXb1LlQ6liP+uQ6Pv9/TSzGPZsoT5GkZvCzIHplL
         vJ4MxSc8VU3XCUWoARn7Fz/9BFLFxgNokBsjdl/DfMKpCRGMG71swd3F/WWqge2guUsL
         hAc+fWqkzvzvdV2ooq92tJEtnKsra7dI6v+YmhtJNoaJrJwBDbr2+UMwMu5Vn7172dTk
         6XoiNhp8ym6J5fkZq0NZTN/TH5Sf4Fcx6juNQMm3UWK6FSkqgMnjLUfprAkj7hdQ3jlc
         GG0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788334410; x=1788939210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IlegJqwkFPej4fFKCV2MAr7wlJV+QNtxUfZHapDGJcw=;
        b=hjzBYDqvRo5bCr+GHYmz8HOkg1qJQhstkHYzm10mzrx/n+J4h+pORRE0aNS3M+8Zxd
         Ky2rttpClJKD8PoxEnDzm0aALlLU0C4CM8QsTy09hpbluIdmfj1I4uTfeC5TsmLu+NMu
         HyTFt4VJePgFSg3izQg3pRh7hcWE/r70ZwdLjD5lKRpHUv66PyU2sYklyNa03RMDx5ZZ
         A6P9PLRKSOukQ+xrIH4ltEYBunQgXLq4UXIavspHhVLnnzz9d4FZ2zNoqgfia+pkwf22
         x/T4YFQbqyupmV+XK1LO8RB3V0F+xXlNbeGbZI0wmUG0U4qrUQrfzkINZilRUEQplbUq
         MhHw==
X-Forwarded-Encrypted: i=1; AKwUvBxjejj8lun6AMBnO4cvj4sCsZLGV11EQXG/egUd7bsc2qG9XwwxTneGH6KIwKjalM2aw8dcLP8lLEjPgCrdSZdW@lists.infradead.org
X-Gm-Message-State: AFuF++lj8nJC2lwspPCb2+ubFPPyUy8xXvEzjhlifUBFnDOZA5WS3L+N
	Ytpw7R9nfMDT+jwwkfOhHfPgtTtH8CyYL5qjioQpvUkobcUM3uAs69DB
X-Gm-Gg: AYBFou3kj3g8x7trtJtTvhWhilrT6HZvLFZ0wrvqWOAWkj7GvymMq/j816rtHDwqErR
	Gyrsk2DSivHqo1AXFiZNdvehzGhEFzoKf90/qp6zLkJr6T2hEcZkR/+/I1A9r1Ow6anmXqeu6P8
	4a4gud3VPUMjOcjvVeb3JfhW9Pz63Z6nVmATlCb2E/RWHTCUXAgALS2PJh5TEx0yjsBaH3oF+jL
	TlAWarY9bv0+bt9WjPKSC0zJYm2dhfgT5QDkXP3xZJXMLMOSXpmLscwLLk6GFD2PEp0oNUywOpn
	jQD2TQig1S+pHaL7r41RzEX0+nx/uvHRjwnPc4iD33HOV32s7Eo23MVc0ytFJS1B6H6BRVVeWJB
	NzEs2K0wgfiMcQggbUuv/HKEGTFXD63ecNFunFIgy137VOY1tmN+l3tXbOQpGW3BdLuHkXLHHmW
	duwM5GhFs9cSoUeRn8BhLx1MGjF3BrAS8m0BKBv3LjL8N4Ug5Kz0lVPbAAqwWTGD9tYtNIYidg
X-Received: by 2002:a05:6a00:4408:b0:857:4dea:e2fe with SMTP id d2e1a72fcca58-85ed8ed8414mr5132871b3a.13.1788334410213;
        Wed, 02 Sep 2026 00:33:30 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db2adcbedsm926914b3a.20.2026.09.02.00.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 00:33:28 -0700 (PDT)
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
Subject: [PATCH v6 09/10] of: reserved_mem: mark /memreserve/ entries as MEMBLOCK_NODUMP
Date: Wed,  2 Sep 2026 15:31:15 +0800
Message-ID: <20260902073116.802752-10-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902073116.802752-1-chenwandun1@gmail.com>
References: <20260902073116.802752-1-chenwandun1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_083332_857031_7DA0FA35 
X-CRM114-Status: GOOD (  17.15  )
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

The /memreserve/ entries are memory reservations made by the bootloader
or firmware, their contents are not needed for kernel crash analysis,
so mark them MEMBLOCK_NODUMP to have kdump omit them from the vmcore.

Entries that overlap a dumpable region (such as CMA) are left unmarked,
because the pages of a dumpable region may carry crash-relevant data.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
---
 drivers/of/fdt.c             |  1 +
 drivers/of/of_private.h      |  1 +
 drivers/of/of_reserved_mem.c | 33 +++++++++++++++++++++++++++++++++
 3 files changed, 35 insertions(+)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 286fd4db6312..9a727941b5af 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -1286,6 +1286,7 @@ void __init unflatten_device_tree(void)
 	/* Save the statically-placed regions in the reserved_mem array */
 	fdt_scan_reserved_mem_late();
 	fdt_mark_reserve_mem_nodump();
+	fdt_mark_memreserve_nodump();
 
 	/* Populate an empty root node when bootloader doesn't provide one */
 	if (!fdt) {
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 505735732c13..6497404ec751 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -188,6 +188,7 @@ static inline struct device_node *__of_get_dma_parent(const struct device_node *
 int fdt_scan_reserved_mem(void);
 void __init fdt_scan_reserved_mem_late(void);
 void __init fdt_mark_reserve_mem_nodump(void);
+void __init fdt_mark_memreserve_nodump(void);
 
 bool of_fdt_device_is_available(const void *blob, unsigned long node);
 
diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index f29a07e8fb23..a42cf6eac55b 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -251,6 +251,39 @@ static void __init __rmem_check_for_overlap(void)
 	}
 }
 
+void __init fdt_mark_memreserve_nodump(void)
+{
+	u64 base, size;
+	int n;
+	const void *fdt = initial_boot_params;
+
+	if (!IS_ENABLED(CONFIG_CRASH_DUMP))
+		return;
+
+	if (!fdt)
+		return;
+
+	for (n = 0; ; n++) {
+		int i;
+
+		if (fdt_get_mem_rsv(fdt, n, &base, &size))
+			break;
+		if (!size)
+			break;
+
+		for (i = 0; i < reserved_mem_count; i++) {
+			struct reserved_mem *rmem = &reserved_mem[i];
+
+			if (rmem->dumpable &&
+			    base < (u64)rmem->base + (u64)rmem->size &&
+			    (u64)rmem->base < base + size)
+				break;
+		}
+		if (i == reserved_mem_count)
+			memblock_mark_nodump(base, size);
+	}
+}
+
 /**
  * fdt_scan_reserved_mem_late() - Scan FDT and initialize remaining reserved
  * memory regions.
-- 
2.43.0


