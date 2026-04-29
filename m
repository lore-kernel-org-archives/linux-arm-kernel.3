Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B4CFF8873
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 07:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2+aKzcozrfPvAHDOI307L3sGfueBolTmIlF5K5tQEKM=; b=vqHeUQR2uo7M9LpX31g8Q19q3e
	mZfDO10BYTq0sBgW6XI+0eeH2Hn+Tk5dgwYMtB5YNPWXjWaMzjfPZzvw8n3XYOGhkiUY35/XvMO8e
	seJoF03Dx3GQVysxzBCcPQCkm0fjU0UBqIYEzC/JH2j7iyt7ebPzug6IdmYNEqRk7Ukg1KrXyxUsc
	xHE9Ia7MPEeOhUrqjMBqCMibfg6dlOBaWD9Zpy18CAvG6Wh9YkdHX88F5O/CFpcPYMYSN3xEMkYtO
	f+lDQ1jBFjZgfS26ug0oFo3mZH3srzI5/WyaVqCTzXu+IExRKofbVBkOAD9AqjEZUiOixRgEJ3Xs2
	PfON5QPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHyuD-0000000365E-0fHn;
	Wed, 29 Apr 2026 07:00:21 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHyu5-000000035xD-3Dt3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 07:00:15 +0000
Received: by mail-pf1-x442.google.com with SMTP id d2e1a72fcca58-82cf636dac8so5271962b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 00:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777446013; x=1778050813; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2+aKzcozrfPvAHDOI307L3sGfueBolTmIlF5K5tQEKM=;
        b=WmSXNrhEVjbg9XQjpcmbBweiOctow6zt8L0Yvr2TyyfjfYUFsXeGfE6hEREg4wBAf5
         ana3HJ63efBHbQlNPO7RCAs61dIhGZAuHD56oIvjBNgS8SmMwHOEU9/djVSKvG7t5OSd
         +yFthVt46Sv5CNIpxKL8GSVSe92g/VudoTLz/c6I15jnb7sRSOzUj7G8m0efRKTfof2a
         bbKZXTqhAKXwHqAul8u41L+26DaqB9kTamfgm8rYaMS0uU89dhCifhnj2p49wLyVZHuy
         hUwn9YDsbGhO8HfT0/esOlzFHDgC8M6CdkabH4My5/nnqZmsshnQUF+f0jAT7i0LYTll
         LDnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777446013; x=1778050813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2+aKzcozrfPvAHDOI307L3sGfueBolTmIlF5K5tQEKM=;
        b=fmS7CMmNzyH03Cc/8RqTJJ/iEjmWGklRCurXhAkN66SQO+4XYWBpe09Kzn+c8AfsQF
         xpXsJdcrsgwXlCt7lm/qe6RoTdvpU54WqKgKE7dFaC67hNjW2HITLxYOXAtEDxpTkkz0
         rjDMQQqNe40akgfmM3qN9OMfcZiTymrX+1E013BXOgNTW0RoKvTOviYP05GO2XPEFeHK
         wS4yIbhify+YvXV+kGg2CTSrmrg/UJv+P9jbGkug1sybO5S4lOcOkzKESB61VbgYOPP3
         wXKwVsqydAvZDrCxkLkJyiA+FP3KD1RDIozOXVPp5MS6ZaLeNMMOCQZ4BGqcQJv7qPdE
         DC9A==
X-Forwarded-Encrypted: i=1; AFNElJ+aXQWUJq22tYT3NQF8Htfzh8tfDu3Ocs05kwiL/Nk86a9RmrNKBH+EbDMQTucA0G/kHMPoMtKaEQLNUvXfvrU5@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6f1gpDSxvuW64zC5UYOsf599kMYJqKMqntOyXgnh+xUlpck+d
	kDSvrL+/D40fsN6ftf7O672jAxwrx/zCTZXynxIsbu9Dtzks6hc2F9dm
X-Gm-Gg: AeBDietstjc6NWjpqtjBMWpyVie5xq80wh3+lS500A30ZxVmxYv9Mcy63tUzblrCtMa
	cVcRh8Ixr0aQEQervicWe8LrKhWrY7DEaHFC80AZXoF76GhEo9bmQi39bss+U7ZpZ4EVzLQh6mo
	tCs+SQAeLc3Xy5EQ90ccJjbTaFyRnINwo2kiJaBTZMNaQSZB0ufSxwHhK6lfB9q1SeWs1D1nuVr
	wZUI0wgTMk/OjpBYMX7jPnWa9FrgMv7ijofcz7StrwCB+xiLazf+v3yF2xtzTopPCfNyPfTcJt4
	fsbdn8qxH29qluaaIbwwf39Vnia2z6caaCvf+vy4off4cmv5no+y1x/0hZOnMjGuobT8JSzMa1u
	AWmEUOPfcntPVtiAK+y/LcwbF1NEL8xLJMzNO+YjMqRRwyrZ1g4ZGuLrq+roLwc+aRqWCVuqQEj
	9O1l91ohSo0PM4NFJ7awFfxe1EOtGH+XtJIxgb3s3GNArFttIC
X-Received: by 2002:a05:6a00:995:b0:82c:9fe1:aa4d with SMTP id d2e1a72fcca58-834ddb2d0d8mr6649550b3a.13.1777446012829;
        Wed, 29 Apr 2026 00:00:12 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eaf93sm1043146b3a.40.2026.04.29.00.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 00:00:12 -0700 (PDT)
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
Subject: [PATCH 09/11] riscv: kdump: exclude no-dump reserved memory regions from vmcore
Date: Wed, 29 Apr 2026 14:58:29 +0800
Message-ID: <20260429065831.1510858-10-chenwandun@lixiang.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429065831.1510858-1-chenwandun@lixiang.com>
References: <20260429065831.1510858-1-chenwandun@lixiang.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_000013_815585_2BAEADB2 
X-CRM114-Status: GOOD (  11.48  )
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

Apply the same no-dump reserved memory filtering to RISC-V kdump as was
done for arm64. Use of_reserved_mem_exclude_no_dump() to drop flagged
regions from the elfcorehdr PT_LOAD segments, and
of_reserved_mem_no_dump_nr_ranges() to pre-size the crash_mem array.

Signed-off-by: Chen Wandun <chenwandun@lixiang.com>
---
 arch/riscv/kernel/machine_kexec_file.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
index 54e2d9552e93..012885ac9b79 100644
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
@@ -63,6 +64,7 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 
 	nr_ranges = 1; /* For exclusion of crashkernel region */
 	walk_system_ram_res(0, -1, &nr_ranges, get_nr_ram_ranges_callback);
+	nr_ranges += of_reserved_mem_no_dump_nr_ranges();
 
 	cmem = kmalloc_flex(*cmem, ranges, nr_ranges);
 	if (!cmem)
@@ -76,6 +78,8 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 
 	/* Exclude crashkernel region */
 	ret = crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.end);
+	if (!ret)
+		ret = of_reserved_mem_exclude_no_dump(cmem);
 	if (!ret)
 		ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
 
-- 
2.43.0


