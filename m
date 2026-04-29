Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE24FF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 07:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nuWPT+XdRkD5quZoMJ/j/U0upX+W05bC344BAJoReBo=; b=2mL9an46JIsHmGGUs+GCmp0kjc
	9zFrq/JyXyH4QM7ghFyuIGFMfvApo8f2zklpOr5BZR8n1Qy7QI1EMkugNjwBC8X+uVHN4sa+4DSOP
	+KTZJWsAtHU5IHPCVzcEhs9+ELBw/GmyZ3nh7UQ6yrjhQ7SyKO1yk0o8FeckxlgnQoskOhZwRErqo
	YxIyxTr6qRmkGaBpzGZB15UDuWgBO4XY7uimNU2rnkpsXmdBurSBy5Ys96vrTz6RuTGgxfuMKj8oZ
	iS7lPgBfqV4CsIPfFjOI+aU//3q4ENRFZjZRcwzFLsNTGSjQaI6v+c0FXRw6/Kq+1KE8vNwA1OWTm
	QjmbedRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHyts-000000035j0-2Gcl;
	Wed, 29 Apr 2026 07:00:00 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHytl-000000035aY-3jh1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 06:59:55 +0000
Received: by mail-pg1-x541.google.com with SMTP id 41be03b00d2f7-c6dd5b01e14so4277081a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 23:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777445993; x=1778050793; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nuWPT+XdRkD5quZoMJ/j/U0upX+W05bC344BAJoReBo=;
        b=L3nK81GOZXZNhp/3hXpYCJO2FcqXuQokXYf5yFBjqo836PowFhlse4oPppN1mgMUj7
         uXQTjSVFDi9WQqipt2OSquoCbjBlb0SFgo862sswObaTfmsZp+uTZLWPotr8FJ3cPnHO
         MQgjvNvmsv4W+IVKcLb3uUGlbDhn6R5tziyfXhMBwUesO+ooPos+I0ERS+mQX96H2v1L
         jMMtoywn7p062kG0/BmqqxQQ7EgTFgjYUqb5xx/3pwK1aq2tvuNjpD+uNRR3hxUEVFho
         6U2N736v2D1a2FiY457hr4Vn/eU89/23NuHwrADdFPHWR6diD29tIg3XhLSNZeF2eRwD
         sECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777445993; x=1778050793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nuWPT+XdRkD5quZoMJ/j/U0upX+W05bC344BAJoReBo=;
        b=JDEaPILw/z9/FM7kAxUF1TXk1DJh8XlzTud22csbci7Pja1F8OMAeVcZjPeF2qq4tf
         bNe4+wFJY/JEqxTSLY94WfbM7wVZCgjgP75FB1V0GL8EsfpkEzuSFpioE3UiZUa66mlM
         1FzoTcHUavl8/wnPUGWJeZo4v32sqYJGdwUDVa867uILSFuV9iP1oiYBwtR3VsQ28k5x
         Z8MCEXahR8qXF4zGUVdVSt56NIIA2NxRXUly+bFf+q+Iq595XQbmoA3i+KNcBgTa9CY3
         dY6eAK5ginX4DZSJepbHZHW9tFcGrJadJO3Xkl2s0ExXKDGEVjI5h5OZJN5n3idQLGO6
         wUcw==
X-Forwarded-Encrypted: i=1; AFNElJ9RyzzQXHOdtH18hFfBdRwtbmU/o4H4pTrh6cEkEa7NSLs3WhUXc4yk88z9vQqxa3Fq7PDOnP1Xdqz308rhxGMt@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7PfIhvUVPio0beI+gFdDKZ27EYsChMzCEOJ3ddnZArB+KCP9O
	PLSAfg2YKntTawa09f3QHF3uK1tcNNhU1iroKJl+eSdyDXLFwpcshw7q
X-Gm-Gg: AeBDieuuNYeo7m5LwrwIkEfg+GfLrsKHdt2XP/0u/RgT33dvGWGlSnSeDQ3vRbn+QaQ
	10BV/w5hsPwsHp8JyRYNQFYQUuwU+SqJ1FBgj2UbybKeWYjTHR+znNjHhuRBZwFU9i/wK6rvgsa
	qhfXWBjEbkVgwd8fJL31DfuefSGEwiTvE1PpzKsQuVwN0j52XvDsHTacAm7jqS+mmQVQEr90NHs
	D9u0cXwfmNHWGgDmnAXh6sqoU97vgJ+H8+VmE4cReN/6qaibC8Wl5j6WfLyD1iGkw7CjbHCxvqZ
	3FezrkI7dn3nWdZQ0mAdAztPBoehtSXO14+aAAZSBwRXAJiQBCxtlmm+L1+9yBSyc03lG6XIS5P
	3nprMxMvHnN8Msghwr57jx1aVc16pYqpjdLG+pWfjwu+/i2tphh/fRqu8iSfGwE8xZRo7G0iqND
	WE7dq7Zaa+KZPt8A4DB/hW4Kxqu02PL/mNNZmCGCOBo1TyHq9JaW3fOg6R8Nk=
X-Received: by 2002:a05:6a21:33a7:b0:3a2:cc5f:2187 with SMTP id adf61e73a8af0-3a3af541a19mr3029899637.28.1777445993005;
        Tue, 28 Apr 2026 23:59:53 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eaf93sm1043146b3a.40.2026.04.28.23.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 23:59:52 -0700 (PDT)
From: Chen Wandun <chenwandun1@gmail.com>
X-Google-Original-From: Chen Wandun <chenwandun@lixiang.com>
To: kexec@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: akpm@linux-foundation.org,
	bhe@redhat.com,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	saravanak@kernel.org,
	chenwandun@lixiang.com,
	zhaomeijing@lixiang.com,
	everyzhao@126.com
Subject: [PATCH 07/11] of: reserved_mem: add no-dump crash_mem exclusion helpers
Date: Wed, 29 Apr 2026 14:58:27 +0800
Message-ID: <20260429065831.1510858-8-chenwandun@lixiang.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429065831.1510858-1-chenwandun@lixiang.com>
References: <20260429065831.1510858-1-chenwandun@lixiang.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_235954_054106_CC962C96 
X-CRM114-Status: GOOD (  18.27  )
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

Provide two kdump-oriented helpers so that arch kexec_file code does
not have to open-code the no-dump filtering loop:

 - of_reserved_mem_no_dump_nr_ranges() returns the number of reserved
   regions flagged with linux,no-dump. Each exclusion may split one
   existing crash_mem range into two, so callers use this count to
   pre-size their crash_mem allocation.

 - of_reserved_mem_exclude_no_dump() walks the reserved_mem[] array
   and calls crash_exclude_mem_range() for each no-dump region.

Both helpers are guarded by CONFIG_KEXEC_FILE; empty inline stubs are
provided for the !KEXEC_FILE case so architecture code can call them
unconditionally.

The consumers are added in the following arm64, riscv and loongarch
patches in this series.

Signed-off-by: Chen Wandun <chenwandun@lixiang.com>
Tested-by: Zhao Meijing <zhaomeijing@lixiang.com>
---
 drivers/of/of_reserved_mem.c    | 54 +++++++++++++++++++++++++++++++++
 include/linux/of_reserved_mem.h | 15 +++++++++
 2 files changed, 69 insertions(+)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 4b80420da2d2..038056a6408a 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -27,6 +27,10 @@
 
 #include "of_private.h"
 
+#ifdef CONFIG_KEXEC_FILE
+#include <linux/crash_core.h>
+#endif
+
 static struct reserved_mem reserved_mem_array[MAX_RESERVED_REGIONS] __initdata;
 static struct reserved_mem *reserved_mem __refdata = reserved_mem_array;
 static int total_reserved_mem_cnt = MAX_RESERVED_REGIONS;
@@ -916,6 +920,56 @@ struct reserved_mem *of_reserved_mem_lookup(struct device_node *np)
 }
 EXPORT_SYMBOL_GPL(of_reserved_mem_lookup);
 
+#ifdef CONFIG_KEXEC_FILE
+/**
+ * of_reserved_mem_no_dump_nr_ranges() - count reserved regions flagged
+ * with the linux,no-dump property.
+ *
+ * Each such region may split an existing crash_mem range into two when
+ * it is excluded, so callers can use this count to pre-size their
+ * crash_mem allocation.
+ */
+unsigned int of_reserved_mem_no_dump_nr_ranges(void)
+{
+	unsigned int i, n = 0;
+
+	for (i = 0; i < reserved_mem_count; i++)
+		if (reserved_mem[i].no_dump)
+			n++;
+	return n;
+}
+
+/**
+ * of_reserved_mem_exclude_no_dump() - exclude no-dump reserved regions
+ * from a crash_mem list.
+ * @cmem: crash memory list to modify
+ *
+ * Walks the reserved_mem[] array and calls crash_exclude_mem_range() for
+ * every region with no_dump set. Intended to be called from arch kdump
+ * code when constructing the elfcorehdr.
+ *
+ * Returns 0 on success, or a negative error returned by
+ * crash_exclude_mem_range() on the first failure.
+ */
+int of_reserved_mem_exclude_no_dump(struct crash_mem *cmem)
+{
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < reserved_mem_count; i++) {
+		struct reserved_mem *r = &reserved_mem[i];
+
+		if (!r->no_dump || !r->size)
+			continue;
+		ret = crash_exclude_mem_range(cmem, r->base,
+					      r->base + r->size - 1);
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+#endif /* CONFIG_KEXEC_FILE */
+
 /**
  * of_reserved_mem_region_to_resource() - Get a reserved memory region as a resource
  * @np:		node containing 'memory-region' property
diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
index 29674f572673..cd0f88f29579 100644
--- a/include/linux/of_reserved_mem.h
+++ b/include/linux/of_reserved_mem.h
@@ -8,6 +8,7 @@
 struct of_phandle_args;
 struct reserved_mem_ops;
 struct resource;
+struct crash_mem;
 
 struct reserved_mem {
 	const char			*name;
@@ -94,6 +95,20 @@ static inline int of_reserved_mem_region_count(const struct device_node *np)
 }
 #endif
 
+#if defined(CONFIG_OF_RESERVED_MEM) && defined(CONFIG_KEXEC_FILE)
+unsigned int of_reserved_mem_no_dump_nr_ranges(void);
+int of_reserved_mem_exclude_no_dump(struct crash_mem *cmem);
+#else
+static inline unsigned int of_reserved_mem_no_dump_nr_ranges(void)
+{
+	return 0;
+}
+static inline int of_reserved_mem_exclude_no_dump(struct crash_mem *cmem)
+{
+	return 0;
+}
+#endif
+
 /**
  * of_reserved_mem_device_init() - assign reserved memory region to given device
  * @dev:	Pointer to the device to configure
-- 
2.43.0


