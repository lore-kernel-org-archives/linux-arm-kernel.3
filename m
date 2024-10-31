Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE77E68976
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 11:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SgD3pKPtdFzcz4t1a0u04lcW4uB7d9j6oqT5niate0A=; b=ugJZBwmaGBjwmvdOl0W5EMWw0u
	mDynM1zqnyz6ikZnFH9OzXSdDcNAUeMVf00NGNZeyfm7XwXmPXJI64vp7zdvmwuoHEhIV/JsV8vMp
	EOe20wdCv+i4v5O7zHJucnJye6MZ2MYH860DcM/4JXudbuD24it+ziT0KTKzMQn8qCWU0vCxfKNpQ
	tnTorvQaDlffVJeOHWOqLPPY6HHRoohFQMJyXQsR6tFJ8PUMHNgPTjvrWA0h5Jq55rsyqlctsIpGI
	mLhSf9w3VG46ztmA/wfQc4/VpFydc0i94uZSDsTOUBl9vOXhJEmHzW8FvnFTTuPC8ZNCYwyuDCgpM
	kD9FFR/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6TGK-00000003NpM-0GEB;
	Thu, 31 Oct 2024 11:22:48 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6TEe-00000003NbD-173f
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 11:21:07 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-207115e3056so7348305ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 04:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1730373663; x=1730978463; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=SgD3pKPtdFzcz4t1a0u04lcW4uB7d9j6oqT5niate0A=;
        b=lbtkfcIzhckBs6Q6Yl7C/Y6z+14gxxy73vQIk2xUqSblvbvNNxTcpxJPyycYClFtq5
         efPTuNeKtzWIF7iuAX4DOsbJRM1VBN3Mi41xnDdR1akMxQx8SrzRRzViTVhc26jUJkcN
         isQ+Z0tmoWuwUPipYayQsUnLknA/GKv9yzeG7ymZaWocDVdYX3DDrQAhryoZWNsv+7+S
         i1WXgZ3zHRHCIb2knUq5G1chwxE7bq94k64KX6wX8ac3uRNQkUWH0/617vckg+CL/yDP
         okmFaUMFr83pxEGWbuEBPtSsmc8JVXmzl8J8vYVWzODXEXYNrS0mmGSYyJbEPxZukP4+
         hozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730373663; x=1730978463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SgD3pKPtdFzcz4t1a0u04lcW4uB7d9j6oqT5niate0A=;
        b=AdcCzTiUHAOjVDhpD4fuOkLcnxEX8B0OJQKfXtBLI/+HwqfUTpU6mAWRyp+wA3fO5X
         uSJy7JV2P9FP8LwxfYxfXm+agFi22T07r/iU5DIbRj1BqdsyFD1+HpqNrnEyfzGdtQiY
         rXX2a9CZPWH9L/qe1yEM6TA2dlpejOIxQ0r/gmuyO+PgAACKP5RkkwNCWlfatn/YulIO
         4VVOxWVEwPqwvO49endcdVSWYKpKcmU4L4puQnkir2Lslg22OeyrcHvErIBp4Yn6HctA
         hTqYT6w8Z9IHAjf9GZM+BNqu1T5mJHUT05WGbtIVd1dF03G9yk+BK0kPhi2XcGHEL7EQ
         RhPA==
X-Forwarded-Encrypted: i=1; AJvYcCXDOdoshM8lwGehVgXbIrT/NxTX1D4bRU2mhgtPRer11F1RU8ns75xiN4i7JuyL94rEj+DT4+7eltEbuFDszJOb@lists.infradead.org
X-Gm-Message-State: AOJu0YwTviog2PGADAjYRyELKIlUobUQ5F0WenO5BaF8RXD/d6kJvAsT
	gCB8QyKuTQPTbkI5k9jefFHU0tqi5HBAaQaJf3/HHUUWHjRImcVytOm2rWVJQ9U=
X-Google-Smtp-Source: AGHT+IF6rCp8uA7CIfzXSTYHLrzQK+lu+COWzmT52riKYUQh7Yt9+TYvl4AYGhI2GgQcWukgSatRcQ==
X-Received: by 2002:a17:902:da82:b0:20c:cccd:17a3 with SMTP id d9443c01a7336-210c6c346a9mr224734955ad.46.1730373662606;
        Thu, 31 Oct 2024 04:21:02 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.227])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211056efd01sm7513455ad.52.2024.10.31.04.20.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 31 Oct 2024 04:21:02 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: punit.agrawal@bytedance.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	rafael@kernel.org,
	lenb@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	sudeep.holla@arm.com,
	guohanjun@huawei.com,
	prarit@redhat.com,
	gshan@redhat.com,
	cuiyunhui@bytedance.com,
	dwmw@amazon.co.uk,
	Jonathan.Cameron@huawei.com,
	liuwei09@cestc.cn,
	maobibo@loongson.cn,
	sunilvl@ventanamicro.com,
	alexghiti@rivosinc.com,
	haibo1.xu@intel.com,
	jeeheng.sia@starfivetech.com,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH] ACPI: fix the warning reported by the sparse
Date: Thu, 31 Oct 2024 19:20:30 +0800
Message-Id: <20241031112030.72647-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_042104_337231_7EB9E230 
X-CRM114-Status: GOOD (  13.44  )
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

All architectures use early_memremap() instead of early_ioremap().
Therefore, to solve the warning detected by sparse:
../arch/riscv/kernel/acpi.c:213:30: warning: incorrect type in return expression (different address spaces)
../arch/riscv/kernel/acpi.c:213:30:    expected void [noderef] __iomem *
../arch/riscv/kernel/acpi.c:213:30:    got void *
../arch/riscv/kernel/acpi.c:221:24: warning: incorrect type in argument 1 (different address spaces)
../arch/riscv/kernel/acpi.c:221:24:    expected void *addr
../arch/riscv/kernel/acpi.c:221:24:    got void [noderef] __iomem *map
The __iomem attribute of __acpi_map_table() is removed.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/arm64/kernel/acpi.c     | 6 +++---
 arch/loongarch/kernel/acpi.c | 2 +-
 arch/riscv/kernel/acpi.c     | 6 +++---
 arch/x86/kernel/acpi/boot.c  | 2 +-
 drivers/acpi/osl.c           | 2 +-
 include/linux/acpi.h         | 2 +-
 6 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
index e6f66491fbe9..69017dadb82d 100644
--- a/arch/arm64/kernel/acpi.c
+++ b/arch/arm64/kernel/acpi.c
@@ -88,10 +88,10 @@ static bool __init dt_is_stub(void)
 }
 
 /*
- * __acpi_map_table() will be called before page_init(), so early_ioremap()
- * or early_memremap() should be called here to for ACPI table mapping.
+ * __acpi_map_table() will be called before page_init(), so early_memremap()
+ * should be called here to for ACPI table mapping.
  */
-void __init __iomem *__acpi_map_table(unsigned long phys, unsigned long size)
+void __init *__acpi_map_table(unsigned long phys, unsigned long size)
 {
 	if (!size)
 		return NULL;
diff --git a/arch/loongarch/kernel/acpi.c b/arch/loongarch/kernel/acpi.c
index f1a74b80f22c..a29c1d86e274 100644
--- a/arch/loongarch/kernel/acpi.c
+++ b/arch/loongarch/kernel/acpi.c
@@ -34,7 +34,7 @@ u64 acpi_saved_sp;
 
 struct acpi_madt_core_pic acpi_core_pic[MAX_CORE_PIC];
 
-void __init __iomem * __acpi_map_table(unsigned long phys, unsigned long size)
+void __init *__acpi_map_table(unsigned long phys, unsigned long size)
 {
 
 	if (!phys || !size)
diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
index 2fd29695a788..861ab56962a2 100644
--- a/arch/riscv/kernel/acpi.c
+++ b/arch/riscv/kernel/acpi.c
@@ -202,10 +202,10 @@ struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu)
 }
 
 /*
- * __acpi_map_table() will be called before paging_init(), so early_ioremap()
- * or early_memremap() should be called here to for ACPI table mapping.
+ * __acpi_map_table() will be called before paging_init(), so early_memremap()
+ * should be called here to for ACPI table mapping.
  */
-void __init __iomem *__acpi_map_table(unsigned long phys, unsigned long size)
+void __init *__acpi_map_table(unsigned long phys, unsigned long size)
 {
 	if (!size)
 		return NULL;
diff --git a/arch/x86/kernel/acpi/boot.c b/arch/x86/kernel/acpi/boot.c
index 3a44a9dc3fb7..e1ed297552e7 100644
--- a/arch/x86/kernel/acpi/boot.c
+++ b/arch/x86/kernel/acpi/boot.c
@@ -105,7 +105,7 @@ static u32 isa_irq_to_gsi[NR_IRQS_LEGACY] __read_mostly = {
  * This is just a simple wrapper around early_memremap(),
  * with sanity checks for phys == 0 and size == 0.
  */
-void __init __iomem *__acpi_map_table(unsigned long phys, unsigned long size)
+void __init *__acpi_map_table(unsigned long phys, unsigned long size)
 {
 
 	if (!phys || !size)
diff --git a/drivers/acpi/osl.c b/drivers/acpi/osl.c
index 70af3fbbebe5..a36486b59bca 100644
--- a/drivers/acpi/osl.c
+++ b/drivers/acpi/osl.c
@@ -334,7 +334,7 @@ void __iomem __ref
 	}
 
 	if (!acpi_permanent_mmap)
-		return __acpi_map_table((unsigned long)phys, size);
+		return (void __iomem __force *)__acpi_map_table((unsigned long)phys, size);
 
 	mutex_lock(&acpi_ioremap_lock);
 	/* Check if there's a suitable mapping already. */
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 4d5ee84c468b..d4627d96c13b 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -207,7 +207,7 @@ static inline int acpi_debugger_notify_command_complete(void)
 		(!entry) || (unsigned long)entry + sizeof(*entry) > end ||  \
 		((struct acpi_subtable_header *)entry)->length < sizeof(*entry))
 
-void __iomem *__acpi_map_table(unsigned long phys, unsigned long size);
+void *__acpi_map_table(unsigned long phys, unsigned long size);
 void __acpi_unmap_table(void __iomem *map, unsigned long size);
 int early_acpi_boot_init(void);
 int acpi_boot_init (void);
-- 
2.39.2


