Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B02C43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 07:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wN/H1G2k/2fwCg/1D3i4ik2O19md4fRGx2OQL5vrZCY=; b=EAlklULGYLIrdKlm5RUaN4vWop
	D4rbR9YqE2Do8xsAPPMlkB4G4hB+hTCjtfuHnpihwpkOgcYbKDDp0XynRpDp30hgMHxXyvWenVXsh
	iEVfY7bgapoC5l/7aTlNd0BuMo1YwGD9rqpDEb+ZsapVUS+WrzhCLoftmCk7QWYb2X0DYND+1cuTA
	VnFqjx7dyNlGoHbijHt9ni1B4CX5Cf5mw1y1RgmmWvdAvAPFwYhJaKEs8XUwMFNSWMyCl+VGrzH6S
	6/5mMCAX16itUm8j3J8GZEfngqNEtqfFLkmg9b7qGmUWPIcd5s9vyP2O0Jfdd6djUk73ZQn41ukoy
	8IL6r9cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTCX-0000000G9gy-3AoZ;
	Tue, 30 Jun 2026 07:48:13 +0000
Received: from mail-pj2-x04.google.com ([2607:f8b0:4864:39::4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTCU-0000000G9cx-16t5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 07:48:11 +0000
Received: by mail-pj2-x04.google.com with SMTP id d9443c01a7336-2c80ff1bbb1so3652275ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 00:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782805689; x=1783410489; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wN/H1G2k/2fwCg/1D3i4ik2O19md4fRGx2OQL5vrZCY=;
        b=T/5i3CGlXSB3okos35ZQP6tdPlgHt7+wWwOkLIyM9zyETdHwurEoY6qVFVTvXG4L4d
         Ej9IyHzmuyij2dRhKdFkicytrEVmiQNjJjRrGPShRgbsAj0VlXUcw8kP++LXY53Chrwr
         hWcuRm2o08GezqApArOjEjegY3NfwwmswWQa7lPLRptxzVwMMAcCozjItTvz9/ru4SQK
         Cim/eHMLAUuUhq0heiegfg2WOYby4Vj6PnzL9GIMi86RLHJisahcTEgqTw5IAAmuY743
         hTaNYuzruIOZrnXo+KwoHDmG8duHS8BLLp2/vmM9NDm50oOd5Td7fAZj9U2s26F+Dwce
         2noQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782805689; x=1783410489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wN/H1G2k/2fwCg/1D3i4ik2O19md4fRGx2OQL5vrZCY=;
        b=ZfxND7yA4FPsqMiQ8tvCaF+EA01qVdSanq/botnmKymEB2WkjvletcM65leq+exj+V
         xuTnHNnjGhEjeQKyRqDJVGDGMxMhZfC2wqPBlwGbApC56H14pSzpkDuyaFAZr3UCfjke
         Pm31NL6Zu11LTQu8cdZYo1RRymJMWFXI8MxIAItRLDRxaFaqhiQaXwtBTfZyksrhJzkh
         gpBfjyPHr9SdudaKEnpQBg+7JvE21W2T3HyNkKnqJk4n2l/5c4Vp++zHwPL/GaqhMFCa
         z3YrPSBhaDm7m/+G0Zz7yqfa4O4uA4wRiM8mFlYKIzZfdKWqTEr9NksugA+0K9Sg35Em
         h6Vw==
X-Forwarded-Encrypted: i=1; AHgh+RqHhmOxRttkaIvgfWOQ84puKgQY0zqhhAC3meHXEt3ygzp7xcAMTY0dUhZCyQxOGGuw5p3PgF9fp2UAb0TFhsWB@lists.infradead.org
X-Gm-Message-State: AOJu0YwjwPHF9ju/dnw6YeRsaN3aKZQho+Q4oGDWFk7NgyQR+8QWob8c
	40wnILhZSS4yJzOg9W0eP4Rq5UYSTR3+JQjF4WAYRHGBuZqnSEAFmZ6B
X-Gm-Gg: AfdE7ck2M1V6gC5fknsjnJr4iCWDbcptUZTFGd3UVioYJH+vGqA3uEdzuI84x3cQegR
	40WulbQLLuiNdKQTBwAiHjmGsEj3CQeTiDkytuyectb/b0DuLZBmwcPOJQ0QuLh7vHNShTJviCZ
	YMm+lsUIOteku8jraJ1HbLTHLHrE4DG0mteYUEt9plz3aRwd45x/Be7YaCemeWhTdysv1gVbDRN
	Xjq0VJSQinONxfLyIm2zrSFBm8hHEoKkZKWE+3j65zgp1wbLENnNNNqZvhJR+BbLHN6Z9cz33lA
	1beYAmvaa+gv6VFgAmLejGCDq2yHQtIL/s1lyW8bUWt/20PoOM7r5G89m7at2onVCaweb2NfRW0
	7MhdNb3WuF3P4/uIFapbgri7Qmv9UQzFCpFFhRO55CzUTPyyag+j1L3fF5xF8KKvbusWPG8h2X8
	Tw3duNtYrraQSaLLvT20xxqMlqZA==
X-Received: by 2002:a17:902:ebc2:b0:2c9:cf41:adf9 with SMTP id d9443c01a7336-2ca2ec34870mr20905945ad.47.1782805689451;
        Tue, 30 Jun 2026 00:48:09 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382a2d3dsm7821045ad.55.2026.06.30.00.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 00:48:08 -0700 (PDT)
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
Subject: [PATCH v4 04/10] of: reserved_mem: split alloc_reserved_mem_array() from fdt_scan_reserved_mem_late()
Date: Tue, 30 Jun 2026 15:47:08 +0800
Message-ID: <20260630074715.4126796-5-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630074715.4126796-1-chenwandun1@gmail.com>
References: <20260630074715.4126796-1-chenwandun1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_004810_309263_6A037336 
X-CRM114-Status: GOOD (  18.83  )
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

Prepare for storing /memreserve/ entries in the reserved_mem array.
alloc_reserved_mem_array was skipped if the device tree lacks a
/reserved-memory node, pointer 'reserved_mem' continues to reference
the reserved_mem_array which lives in __initdata, storing
/memreserve/ entries into reserved_mem_array would result in metadata
loss, and an out-of-bounds memory access will occur if the device
tree contains more than MAX_RESERVED_REGIONS /memreserve/ entries.

So split alloc_reserved_mem_array() from fdt_scan_reserved_mem_late(),
and call alloc_reserved_mem_array() whether or not there is a
/reserved-memory node.

No functional change.
The actual /memreserve/ population is added in a follow-up patch.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
---
 drivers/of/fdt.c             |  7 +++++--
 drivers/of/of_private.h      |  1 +
 drivers/of/of_reserved_mem.c | 11 ++---------
 3 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 26f66046cc32..b97775f6c9d4 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -1282,8 +1282,11 @@ void __init unflatten_device_tree(void)
 {
 	void *fdt = initial_boot_params;
 
-	/* Save the statically-placed regions in the reserved_mem array */
-	fdt_scan_reserved_mem_late();
+	/* Attempt dynamic allocation of a new reserved_mem array */
+	if (!alloc_reserved_mem_array()) {
+		/* Save the statically-placed regions in the reserved_mem array */
+		fdt_scan_reserved_mem_late();
+	}
 
 	/* Populate an empty root node when bootloader doesn't provide one */
 	if (!fdt) {
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 0ae16da066e2..81c8ec9378b9 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -187,6 +187,7 @@ static inline struct device_node *__of_get_dma_parent(const struct device_node *
 
 int fdt_scan_reserved_mem(void);
 void __init fdt_scan_reserved_mem_late(void);
+int __init alloc_reserved_mem_array(void);
 
 bool of_fdt_device_is_available(const void *blob, unsigned long node);
 
diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index e1bd35115cc1..f6c02b37deb7 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -69,13 +69,13 @@ static int __init early_init_dt_alloc_reserved_memory_arch(phys_addr_t size,
  * the initial static array is copied over to this new array and
  * the new array is used from this point on.
  */
-static int __init alloc_reserved_mem_array(void)
+int __init alloc_reserved_mem_array(void)
 {
 	struct reserved_mem *new_array;
 	size_t alloc_size, copy_size, memset_size;
 	int ret;
 
-	if (!total_reserved_mem_cnt)
+	if (!initial_boot_params || !total_reserved_mem_cnt)
 		return -ENODEV;
 
 	alloc_size = array_size(total_reserved_mem_cnt, sizeof(*new_array));
@@ -266,17 +266,10 @@ void __init fdt_scan_reserved_mem_late(void)
 	phys_addr_t base, size;
 	int node, child;
 
-	if (!fdt)
-		return;
-
 	node = fdt_path_offset(fdt, "/reserved-memory");
 	if (node < 0)
 		return;
 
-	/* Attempt dynamic allocation of a new reserved_mem array */
-	if (alloc_reserved_mem_array())
-		return;
-
 	if (__reserved_mem_check_root(node))
 		return;
 
-- 
2.43.0


