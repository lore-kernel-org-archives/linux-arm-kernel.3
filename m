Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8484BC43327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 09:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=miEM+ZI1eBAN6H+hUm7y5SHAIdsM2tNi01WsyWumT6E=; b=ejTMgpcBgBHLKd6NqowSv2LeLS
	nn1/70fvgwQveJ+UZBJrIVjRZ+1Jrn+DGGXzJRmILspBrI/D9GpoupQkqIEkOKRUBExXtfWl3K4Lq
	bCuRQV9U9QnTk53aQ8n2O83hnImBIgk3MSvGAWKoMYP2GCaghwkkW9vyOsgBUaTj/SJDQAzd4jPgu
	c6aAWLCCLSKbTuQjrWQcvc9SFTl6ZHrwrz1atcfmCz3NA5RkXSBdVVouLYKyyS29/J32GGu49zrsC
	rQpSZWegBmbKUDGL47cVOjPAJwGT39gDJM0ynN2UtAdelRvfpU9SklIJbdvR3Xog7baJlwHB9pgCB
	xlQjasMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTDo-0000000GBRi-1byN;
	Tue, 30 Jun 2026 07:49:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTDQ-0000000GAnp-1JBe
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 30 Jun 2026 07:49:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=miEM+ZI1eBAN6H+hUm7y5SHAIdsM2tNi01WsyWumT6E=; b=hTv3SQfOBv27N1b7HW4DHyhq5L
	pa+v1FumJ0jfsMp5V6jK9/zNtVdGLkaTMd0MtFtpie8Ymlp3pw4rEoxQTydol1msvdXLG4fueUz5s
	Y2FKbDUjXXJAg7qKFeaHN2y8u7N1nUiRxkNbZXcxas0J7GRHmIYYV9TpQA1QZSVmetOgiuXVz4D3v
	Yq1azja5oDefcUh/hP42cwsbEqtsyOO0SenAb2RsTFcXZEssqYbHgTVXTV4K4iHASPHdEb7jBM14F
	b4bMoV0VTP59uYw+3We1mQc/yLSx/9/Bn7YyIxG88/3bzV0wdng4ZubKikzyYpo1igEh+nfwOZ7+m
	KzTT6Wbg==;
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weTDM-00000001ctj-0uVM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 07:49:06 +0000
Received: by mail-pl1-x644.google.com with SMTP id d9443c01a7336-2c7cfa17fedso34254925ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 00:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782805742; x=1783410542; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=miEM+ZI1eBAN6H+hUm7y5SHAIdsM2tNi01WsyWumT6E=;
        b=ixQLsS+A63rePmdkpfuTziJ9qMnyOYNgdJ8e1gnTM+Ur1phooF0RHmJaeOt6ihnOOn
         2rJ8Wmbu4nwxv8grCgjQhwhf7NBsYkOiWYd59AFRbwoKk+aS9CnDz2glNOVKMBT6pxSe
         lTCdGF7kufKHQMD1lyOY6j5cOPgoUTdbZy2bQIfosrnqoXp/HWXh9buC4Toy92HUTfMA
         hdy7kYnRYvixFQbGxf4GLLixV7lISyq6Y0DEe8XoiBP7Rs/GAkoRl0pmSUBveUskjUmN
         Y21vJkjmTieCHzeGf8hPQ4tn5dyAVrRF9IYCqYItisS9plHQ7/hSUZRlU4flvbChsdJG
         x0WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782805742; x=1783410542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=miEM+ZI1eBAN6H+hUm7y5SHAIdsM2tNi01WsyWumT6E=;
        b=Kwroedl7sW2wJzBP8qMujVlVgKYbCqNYKpz370Fq5n2ODr9FmUGq/kXQSnK5Bbzbx2
         ny8QQAtsPBmjK/v5HX8GNLAc2sKrLBwih+dBoA1R20d9Bx/7iDwPWx3/HYhUv0Tzp02B
         rZm32RC8Vp+/0Mg/ntwWEi1rtfrZ9g4PaOqBairJSisQdfBvuC9Uy1rxgi290arK8Jc7
         5AeECC1cnVuo0ouLv1s8wBOADdK9aog6iybBW9OI723tVuWGjCLaXF1z4aTGTsZQdyYv
         /6CvKE+VdhnJauAQo12yyv+MHt5c0OanNshITm2M8W/KyI+k6/ZXLEOcZfEzK4vNLC6C
         4D4Q==
X-Forwarded-Encrypted: i=1; AHgh+RqICcQR1qP+/5dz0dZ4ZDkD2UfqoEUHZUWeOztlqoHU3QbrbC/NNVVWahA7r1GUG+NfmJy41Yz0PzZVIXbwdJNd@lists.infradead.org
X-Gm-Message-State: AOJu0YzWnKiFsBiKHChmUe4AdEMgGKuo7qqx8ddXlKoNV7RFZuwPV5YE
	6ZgCZKDA9+Rfg6rBnRSj9mVS+UPMZNT5nUGUhsO5b1WnsBk27dzyTE/e
X-Gm-Gg: AfdE7cmCvpzSaOnfoIFZJma0fTgB+cj1KXpbUigmM/dB9lAYIoS7Le9BRG8ooQwbuNL
	0PQvSPSjztQXmFVfvjyKN3NniZbKK7k0HCt5v0vzK6/bZ2vJJXr2CVDZVwSnuH5ujyk/9eZWn5V
	ieDyK1CkSnpmuD7r46MUO34UzP78nr0poXQR0baLUTXiogjbRIGAGuv/X2JV8/7umbsvaCptwy7
	H54lZwa3dilt/4Nc/vkauyW0pnqXLUQ5XwXm9jdlemXHFopc2fbg4tby6pH/HgDc8/QD+iJ6kxO
	z63ggBToNUvoWaZoXGqNjvg5ZSMG4sf5pJcxQBJ8WT9ci0bgaqNWRfO4UvQKN85TE8Qut+aXHk8
	ecW8G2kFBwDEsMXzUvxdHjIAd5KDx9KhZN4YOsk+/d3HcTqCgEMfUfZDvxPC9d3eUlmgpQSAqmh
	58OjIbUDwV0nOv0pNjgNUV7Lxk3Q==
X-Received: by 2002:a17:903:186:b0:2c0:a746:7b16 with SMTP id d9443c01a7336-2ca2d8a616amr19688075ad.22.1782805741701;
        Tue, 30 Jun 2026 00:49:01 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382a2d3dsm7821045ad.55.2026.06.30.00.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 00:49:01 -0700 (PDT)
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
Subject: [PATCH v4 09/10] riscv: kdump: exclude non-dumpable reserved memory regions from vmcore
Date: Tue, 30 Jun 2026 15:47:13 +0800
Message-ID: <20260630074715.4126796-10-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630074715.4126796-1-chenwandun1@gmail.com>
References: <20260630074715.4126796-1-chenwandun1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_084905_335650_AB6782A2 
X-CRM114-Status: GOOD (  11.84  )
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

Apply the same non-dumpable reserved memory filtering to RISC-V kdump
as was done for arm64. Use of_reserved_mem_kdump_exclude() to drop
flagged regions from the elfcorehdr PT_LOAD segments, and
of_reserved_mem_kdump_nr_ranges() to pre-size the crash_mem array.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
---
 arch/riscv/kernel/machine_kexec_file.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
index 59d4bbc848a8..25359d583bc3 100644
--- a/arch/riscv/kernel/machine_kexec_file.c
+++ b/arch/riscv/kernel/machine_kexec_file.c
@@ -10,6 +10,7 @@
 #include <linux/elf.h>
 #include <linux/slab.h>
 #include <linux/of.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/libfdt.h>
 #include <linux/types.h>
 #include <linux/memblock.h>
@@ -64,6 +65,7 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 
 	nr_ranges = 1; /* For exclusion of crashkernel region */
 	walk_system_ram_res(0, -1, &nr_ranges, get_nr_ram_ranges_callback);
+	nr_ranges += of_reserved_mem_kdump_nr_ranges();
 
 	cmem = kmalloc_flex(*cmem, ranges, nr_ranges);
 	if (!cmem)
@@ -77,6 +79,8 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 
 	/* Exclude crashkernel region */
 	ret = crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.end);
+	if (!ret)
+		ret = of_reserved_mem_kdump_exclude(cmem);
 	if (!ret)
 		ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
 
-- 
2.43.0


