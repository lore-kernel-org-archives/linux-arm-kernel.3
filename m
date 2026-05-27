Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC52CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 03:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/p28EH8R5CXtCwys+lC44uig9HB9HdXcu6ohyUKifVw=; b=SKZJBgn5yVTpLNSd7VOvqoW9XI
	QB37InigokdEqlbbeTPUffbQ3UZRIUDkIoKCeXzMXfah/3V3xa5Z4GYXBdhwYZPw76YxcbCfVqsSL
	bq+PKtz1Ez51emc9J3hFMYE7O4LaCMrTXj10Rx8TJRDb+r/dvwIz+irmw29peY75Ozfe4buUSfcH/
	DFtn3v14g7zEV+1JK1cS7tviOIcljGU0yJ/L6N33P2UpRm+jbk6+hbJp57L+PDBK6xDtpFeUQ1AbK
	KefCHL4PUdnpzDQFI20hUX9GGNjEekFLC4hGajcLP1e08kZ+zy6y6lUI0mT2WPMo6M7sXZiv1wJTU
	MGbmtUqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS4yt-00000003FVI-3YJ4;
	Wed, 27 May 2026 03:30:55 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS4yp-00000003FSC-14KD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 03:30:54 +0000
Received: by mail-pf1-x444.google.com with SMTP id d2e1a72fcca58-8419ab3a297so1122582b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 20:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779852650; x=1780457450; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/p28EH8R5CXtCwys+lC44uig9HB9HdXcu6ohyUKifVw=;
        b=HLev4TSZuILLlLhS8SR0cR0L23fxKAvMBWHT7ndPeu4X/iiGFKV0AOVYpFzPn3c/5P
         h/eGEZ5IlEX8Ra5zRTbegsmmXfsftsEDZ22WEEz3zmUrsoCe+Rq9vUE+GrvxdAbPFYE4
         gwuh2aQdNNilVNIUjhMGzFA3wa3wpm0sF93dFJbZ6DUAV8V3tTdV+XRnWx/p7fpGSm1F
         pGbb6qZEkixj1Pw643y66ATQT3x5R55cQfpn1tY1708EXx/sRD6tvB68HSx7iXhBuJ1b
         6jHXby/9UscLkCXOga+G/DxEMFSioW9ky53ZWzWiPm0hcfq6NLdj/XqtzrujASQQwfkl
         sBtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779852650; x=1780457450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/p28EH8R5CXtCwys+lC44uig9HB9HdXcu6ohyUKifVw=;
        b=rwq9S01LYyHUCJOvAwM3u+mo078/MavLQ5IX7GPmKYMtSWLIpfMC3z2ZYVdrEnuCIU
         lWLv1eaawLaPq/uNYBNYfjNcrUL3PoCqN3/NAXZem6PYvY5IANgujX6xGIXO34Pw+ctM
         nY39VFkYgGsk1rwdeRt2HiLL8N32//V2I6w7DQKr0iMf2UbCgPXvhjJYt3X1kLQtW/Jl
         pqeFLzdlrlIKbzIjGJf+d28iyoAT/N/78ctdef2CsG9nfhAGMKOr3k2OZwA9RNIK/Axs
         koJz/43gkmMShDiBweFWjngMymRd3uQozxbU2R0VNtBdStS8Wba6aKNuZS7NV/frrNWO
         lkhQ==
X-Gm-Message-State: AOJu0YxJkodUlZrO8SqJY79WwHN/9eRZeyEHgOCi0l6C0Vu+p1tIGmo+
	abpiujRT/oTSaqZBcL8k18ONQznLOPZA1dZI+W0CseSbvyCa7gO7jL+XJs28TzEB6IjtRQ==
X-Gm-Gg: Acq92OGXCNFS425eoVPyja4lbnp2fT+toqekkxivfzqJNEucDHD6TKO6zswT+j3fbPS
	nb6QMMvt0GUd8pzcQHYzHOQHlvA0kAE+mYfHMG8ETSVnxFDPdQME6VFAcBiWHW5vAgCzsnGdl9r
	b8fAbpfY5qp3wDcjIRHtS7TrV1BairEjlFlfBMLoC7mk6WvZ/+On0smZ0+/QlsrRZy5xsLUgTWO
	08LjZzvq6tV/kSAkJTUwyT9Ki32aOuZwvQFgGW9EBCNTF9a0YgWWTP7JNeSEyZpGpt37iSGTCpx
	x71qAmAsrDBVNS12XvAbzmME/20UsH5gjMeVZjd01B1jqOua61koPMXz90MZ1um7pcJNAvzCUB6
	9tW1TiArHPaxeIqqYuLgNod520KKG/Ty6g95uUUU+ZQEW0FcezAmarUpgLOTL9XpKIDbkbyvclD
	BcoEio1U5y0GCAYJ4Aik7Kjmyk97dU6QcF0i2l
X-Received: by 2002:aa7:930a:0:b0:82d:24f:2509 with SMTP id d2e1a72fcca58-8415f0e26b7mr20587500b3a.1.1779852650451;
        Tue, 26 May 2026 20:30:50 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d7307596sm749688b3a.59.2026.05.26.20.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 20:30:50 -0700 (PDT)
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
Subject: [PATCH v3 07/11] of: reserved_mem: save /memreserve/ entries into the reserved_mem array
Date: Wed, 27 May 2026 11:29:13 +0800
Message-ID: <20260527032917.3385849-8-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527032917.3385849-1-chenwandun1@gmail.com>
References: <20260527032917.3385849-1-chenwandun1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_203053_731316_600DA8F2 
X-CRM114-Status: GOOD (  19.44  )
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

/memreserve/ is used by firmware or bootloaders, such regions hold no
useful data for crash analysis, they should be excluded from the
kdump vmcore, so save /memreserve/ entries into the reserved_mem array
for later exclusion.

If a /memreserve/ entry overlaps any dumpable reserved region, mark
the whole memreserve entry dumpable as well. This may keep slightly
more memory in vmcore than strictly necessary, but avoids splitting
entries and never drops data that may be useful for crash analysis.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
---
 drivers/of/fdt.c             |  4 +++
 drivers/of/of_private.h      |  2 ++
 drivers/of/of_reserved_mem.c | 55 ++++++++++++++++++++++++++++++++++++
 3 files changed, 61 insertions(+)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 83a2a474831e..745e53b1c564 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -499,6 +499,7 @@ void __init early_init_fdt_scan_reserved_mem(void)
 	int n;
 	int res;
 	u64 base, size;
+	int nr_memreserve = 0;
 
 	if (!initial_boot_params)
 		return;
@@ -516,7 +517,9 @@ void __init early_init_fdt_scan_reserved_mem(void)
 		if (!size)
 			break;
 		memblock_reserve(base, size);
+		nr_memreserve++;
 	}
+	fdt_reserved_mem_account_memreserve(nr_memreserve);
 }
 
 /**
@@ -1288,6 +1291,7 @@ void __init unflatten_device_tree(void)
 	if (fdt && alloc_reserved_mem_array()) {
 		/* Save the statically-placed regions in the reserved_mem array */
 		fdt_scan_reserved_mem_late();
+		fdt_reserved_mem_save_memreserve_entries();
 	}
 
 	/* Populate an empty root node when bootloader doesn't provide one */
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 50e5a533e059..30954e859689 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -188,6 +188,8 @@ static inline struct device_node *__of_get_dma_parent(const struct device_node *
 int fdt_scan_reserved_mem(void);
 void __init fdt_scan_reserved_mem_late(void);
 bool __init alloc_reserved_mem_array(void);
+void __init fdt_reserved_mem_account_memreserve(int n);
+void __init fdt_reserved_mem_save_memreserve_entries(void);
 
 bool of_fdt_device_is_available(const void *blob, unsigned long node);
 
diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 888dcb6bdce5..5e27f9403786 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -248,6 +248,43 @@ static void __init __rmem_check_for_overlap(void)
 	}
 }
 
+static void __init fdt_reserved_mem_add_memreserve(phys_addr_t base,
+						   phys_addr_t size)
+{
+	struct reserved_mem *rmem;
+	bool dumpable = false;
+	int i;
+
+	if (reserved_mem_count == total_reserved_mem_cnt) {
+		pr_err("not enough space for memreserve regions.\n");
+		return;
+	}
+
+	for (i = 0; i < reserved_mem_count; i++) {
+		rmem = &reserved_mem[i];
+
+		if (!rmem->dumpable)
+			continue;
+
+		if (base < rmem->base + rmem->size && rmem->base < base + size) {
+			dumpable = true;
+			break;
+		}
+	}
+
+	rmem = &reserved_mem[reserved_mem_count];
+	rmem->base = base;
+	rmem->size = size;
+	rmem->dumpable = dumpable;
+
+	reserved_mem_count++;
+}
+
+void __init fdt_reserved_mem_account_memreserve(int n)
+{
+	total_reserved_mem_cnt += n;
+}
+
 /**
  * fdt_scan_reserved_mem_late() - Scan FDT and initialize remaining reserved
  * memory regions.
@@ -305,6 +342,24 @@ void __init fdt_scan_reserved_mem_late(void)
 	__rmem_check_for_overlap();
 }
 
+void __init fdt_reserved_mem_save_memreserve_entries(void)
+{
+	const void *fdt = initial_boot_params;
+	u64 base, size;
+	int n;
+
+	if (!fdt)
+		return;
+
+	for (n = 0; ; n++) {
+		if (fdt_get_mem_rsv(fdt, n, &base, &size))
+			break;
+		if (!size)
+			break;
+		fdt_reserved_mem_add_memreserve(base, size);
+	}
+}
+
 static int __init __reserved_mem_alloc_size(unsigned long node, const char *uname);
 
 /*
-- 
2.43.0


