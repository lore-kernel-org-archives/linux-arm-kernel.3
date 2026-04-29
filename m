Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C2C6FF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 06:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ejmHsY9aPO4mjE6CDrxULTYgFgw7tdPgcMhiefmNm8=; b=SunQJfAYzkPpjhjUvh4kGWPgHq
	fj6/+4oZ0iSGYAStq5jUcN80O6qdF0RLwKJcK5+RM08YrOPsP0PBLZ/4MC5SGJNTU8G5WRP+OUP4v
	CPvtad3tFat24ldbT97vCeQ2QgI6bbjzHrDguiHZoM4UN/3rAYRX+PYSnAsyvDE81/5X8/mmsQK/m
	eupiJCAqHVcibcYQnBnGwLEsrkGAG3eRpeZRl/ASyZ6zfStIMA9eICuAw5GNw3+S92MSmTg8Lq8H+
	MPqZ4b/gSrSY4TATntu49NkqMi+iF6OPISJXY/S/X283op7CZjGG9IgHMMJAR1cqirIy1YWlN6ftl
	4IIZ1dFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHytW-000000035NO-3M7u;
	Wed, 29 Apr 2026 06:59:38 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHytS-000000035II-1Ayc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 06:59:37 +0000
Received: by mail-pf1-x444.google.com with SMTP id d2e1a72fcca58-8318293f02bso296581b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 23:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777445973; x=1778050773; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ejmHsY9aPO4mjE6CDrxULTYgFgw7tdPgcMhiefmNm8=;
        b=UTu2oixlGqRGYxZ4LCMzwJEzB4VnaXbdUkh2QceAPsDwx5icYaL+uJ7snt9/QINbTX
         Cu3b8jvgfQ9HoaPZhyi02ZAL1HCDJKkjcRu371yu8+wyran1aWIQky9dHEayhbyWbjKD
         QsV6Rgly7Z0CeBUM70Tdn7fxb6PYlUDW1x7jex5WGLpiRgQ0pVd35SnArzspAT0JnP9D
         Q5qVOyc12koJKB8+gvjaJ4HhZCHUMZOzdxeDaRSyeOAxd7iosQZaQwrXPjLEjQefEvAa
         kTxKuJ+hkBoVEPcWnGu//B2Zj8+VFl3+dUAHFL+ca4YNL+kpm6jgZhmGd+1QcB/QQbbJ
         sy3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777445973; x=1778050773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8ejmHsY9aPO4mjE6CDrxULTYgFgw7tdPgcMhiefmNm8=;
        b=AgClQ7e3VVy0gTT0Q6ByUzqpHACFONnGoVYXsft/uDnwUogVwKG8vBmYRuWMSNdX4C
         9AbUEJcxFI1no9kURi1ugzhSqCInJ8HN+tL4zXYzj7GX7z/S8xcBnNHfa1hL4yhVKC29
         sFh019bB2Z39hhMYu1s/jv+Vc45swfyyzZIjHBZYfkBNCGQqh/ne0dt5N9JlUEmmQMYU
         e2wSIXShIDtpZhREuF16hiz/T5uR7RgAly24lEuvlIZ8RQ/trhEu395U+nf+Wd4NJQ+I
         CpdLiLW78/blc/7mx9ERxTjVjhhc7zRSYik9/MZDX/Mp7WiU9+aZA/9vJ6zA2P681Mw/
         nMcw==
X-Forwarded-Encrypted: i=1; AFNElJ8lBg7rD2Cgkcm6sivCLP3AtX7da41rSJ+JNfaFYLKDmKqT0R+MRGl7Kwi1oJn26IhNY+i35HusjZCeoixwCZGZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwiONXVk2JrTGCgKL5wWPSDdRpyKXsglwjrmzoLCy7aq4GUZZon
	RqYoPQXKpDwD10PdWryTlxavUqyKZ5auUBytaHXw7oIvoTHMTVZtxbOS
X-Gm-Gg: AeBDievWCjTrQUsZIslhBaEyOJlYLYL9HcxC55TuUVFNGtaUkr6l9buf27KRGiYx+92
	RSbz9odVS8WR/W5yLy+I5c428BOjDqrtnewETcoTBWQoYiEH2gOD0Ng/bebppPZZptj94f9kLAY
	bQ4RSNsTJtgMDq7xud8t8uJfMdPLtys7SWSJkD6koi4pR0ube6uX0Euq/IB9tSHtpvXEBi0TIfe
	cxddnSCQnfBz9du+k2Cru9Vt6tK1g+ldr3yM2L5Rx/me5oezaOk982tx4YqoP10D7XybDnvrThn
	X0no9SeKxrp1mQnPIvfg3l51hjjRyxI5iynocyTkbW96Q+56DigUYY8wdwA5Q9ZNwnjeD/Pxrxu
	g9zGvaZNZUn4QXQbiy9BHR8XWHq1PTeilEefQh0pkL4v9blQ8S9thKQjeX72IyQuNmwxkEkJ/ig
	pDCeAnoi7xS0EJWx7nRD8/T51JUKN6y+2DEf0JoSfs/1frKxBbftasGfJBX0w=
X-Received: by 2002:a05:6a00:2e93:b0:82f:2d48:f8fc with SMTP id d2e1a72fcca58-834eb3e4d01mr1774850b3a.6.1777445973470;
        Tue, 28 Apr 2026 23:59:33 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eaf93sm1043146b3a.40.2026.04.28.23.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 23:59:32 -0700 (PDT)
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
Subject: [PATCH 05/11] of: reserved_mem: add linux,no-dump property support for reserved memory regions
Date: Wed, 29 Apr 2026 14:58:25 +0800
Message-ID: <20260429065831.1510858-6-chenwandun@lixiang.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429065831.1510858-1-chenwandun@lixiang.com>
References: <20260429065831.1510858-1-chenwandun@lixiang.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_235934_353024_337DD08F 
X-CRM114-Status: GOOD (  18.91  )
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

Add a 'no_dump' field to struct reserved_mem and parse the
'linux,no-dump' device tree property during reserved memory node
initialization. This property allows device tree authors to mark
specific reserved memory regions that should be excluded from kdump
vmcore dumps.

Reserved memory regions used by device firmware (e.g., GPU, DSP, modem)
typically contain data that is not useful for kernel crash analysis and
can significantly increase vmcore size. The 'linux,no-dump' property
provides a declarative way to indicate these regions should be filtered
out when constructing the elfcorehdr for kdump.

The property is named with a 'linux,' prefix because kdump/vmcore is
Linux-specific and the property is an OS hint rather than a hardware
description, matching existing properties such as 'linux,cma-default'
and 'linux,usable-memory-range'.

The 'linux,no-dump' property is only effective when the region:
 - Does not have 'no-map': these regions are already excluded from
   vmcore since they are removed from the linear mapping (MEMBLOCK_NOMAP).
 - Does not have 'reusable': CMA reusable regions are actively used by
   the kernel for movable page allocations, and their contents are
   valuable for crash analysis.

The no-dump status is also printed in the boot log alongside the
existing nomap and reusable flags for diagnostic purposes.

Corresponding dt-schema binding update:
  https://github.com/devicetree-org/dt-schema/pull/193

Signed-off-by: Chen Wandun <chenwandun@lixiang.com>
Tested-by: Zhao Meijing <zhaomeijing@lixiang.com>
---
 drivers/of/of_reserved_mem.c    | 13 ++++++++-----
 include/linux/of_reserved_mem.h |  1 +
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 93585af9f8a3..ac3d8b837d61 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -654,6 +654,7 @@ static void __init fdt_init_reserved_mem_node(unsigned long node, const char *un
 {
 	int err = 0;
 	bool nomap;
+	bool reusable;
 
 	struct reserved_mem *rmem = &reserved_mem[reserved_mem_count];
 
@@ -662,11 +663,14 @@ static void __init fdt_init_reserved_mem_node(unsigned long node, const char *un
 		return;
 	}
 
+	nomap = of_get_flat_dt_prop(node, "no-map", NULL) != NULL;
+	reusable = of_get_flat_dt_prop(node, "reusable", NULL) != NULL;
+
 	rmem->name = uname;
 	rmem->base = base;
 	rmem->size = size;
-
-	nomap = of_get_flat_dt_prop(node, "no-map", NULL) != NULL;
+	rmem->no_dump = !nomap && !reusable &&
+			of_get_flat_dt_prop(node, "linux,no-dump", NULL) != NULL;
 
 	err = __reserved_mem_init_node(rmem, node);
 	if (err != 0 && err != -ENODEV) {
@@ -680,13 +684,12 @@ static void __init fdt_init_reserved_mem_node(unsigned long node, const char *un
 		return;
 	} else {
 		phys_addr_t end = rmem->base + rmem->size - 1;
-		bool reusable =
-			(of_get_flat_dt_prop(node, "reusable", NULL)) != NULL;
 
-		pr_info("%pa..%pa (%lu KiB) %s %s %s\n",
+		pr_info("%pa..%pa (%lu KiB) %s %s %s %s\n",
 			&rmem->base, &end, (unsigned long)(rmem->size / SZ_1K),
 			nomap ? "nomap" : "map",
 			reusable ? "reusable" : "non-reusable",
+			rmem->no_dump ? "no-dump" : "dump",
 			rmem->name ? rmem->name : "unknown");
 	}
 
diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
index e8b20b29fa68..29674f572673 100644
--- a/include/linux/of_reserved_mem.h
+++ b/include/linux/of_reserved_mem.h
@@ -15,6 +15,7 @@ struct reserved_mem {
 	phys_addr_t			base;
 	phys_addr_t			size;
 	void				*priv;
+	bool				no_dump;
 };
 
 struct reserved_mem_ops {
-- 
2.43.0


