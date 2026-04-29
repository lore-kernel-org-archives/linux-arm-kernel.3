Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF35FF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 06:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OzSUcXeQbcSyOJLVmBDEIvlXQPXERsU2BOZ+obvdQ0o=; b=jAYsRVDcplA7raVN9nKWPEIyoN
	yH3HGSGC1KF0Mox588FnHvmotUMLljf/Mw/LwhhWh232PYKfRh7we4gJ7j1UVucRMMCZCPP4knlCd
	wkxrUZgwFXjqgPO4VZlIjoXrpC9hEzlBIMuE07DSUqADsOTO8duLOh9g6vczhIDV/nvuudZ/t3pqv
	+hLbPyfjPu82UxubOMhReSFBGfCQ7Br0K4VxFFyduEQrTK03dji0OsPSOIaSw2hZioAkdEyfNo4FQ
	HGGfZ7GjCfnVzvilq79TglcO12vzPtc3UZZJYKglliyoZ0yWHXvJIvVu1WAQVtxUdNmLPxhz/Y/tv
	z6yCxTHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHytM-000000035Bi-0lMZ;
	Wed, 29 Apr 2026 06:59:28 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHytI-0000000357V-1GC1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 06:59:27 +0000
Received: by mail-pf1-x441.google.com with SMTP id d2e1a72fcca58-82f1bfc9b8fso5570252b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 23:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777445964; x=1778050764; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OzSUcXeQbcSyOJLVmBDEIvlXQPXERsU2BOZ+obvdQ0o=;
        b=MNRMc12aTw7tVn0SwKdqG72t88iUfldpZOQj4GM4MLyOo3UldWs8oOXI4uAKG8kufJ
         iYDItdF9GGodJX5/Iu53dPP7GO6jExKpnFr4pL5VTvV76VdEByigL0sPBiM6BQ2zuhvT
         kEpLHK2G6WwOcaKfYsvAqqLniFds9kebBJWus0kFX04KzaWrGRzZ3P26mEFgWHaYLFui
         PgS86aouaKTXL6ZnAAMsy8u36iyXjC/i7wcP7ZRYS+cBd5SVPoThWt48UNviEsFeEt0z
         5sQPj60IhXEobPhsDIkvWL7Eft7V/UqT69ti+5xWENTrFgVw3xjpVMFSl3/mQoLaeBaD
         1kTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777445964; x=1778050764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OzSUcXeQbcSyOJLVmBDEIvlXQPXERsU2BOZ+obvdQ0o=;
        b=IGHgzK4T7yjIqTFTmLkIg8kjYqYO1ubOfKYekyEP9reeABcyXnPj2kXqtmAt2g9mlN
         t1TP+RKJ7Vjze5oGf5YHNJjAY+ZCvYlJJp1BJMSDiwO7DXC+KcegpbkRHMJM611ttcvx
         RYML//dfBpG8FeE2j1Vh8JI5EP/ElFn15FCEoymstXDq3iDbYEl/MmcA8TzQO4PD2E46
         bg9Tqn9LK1FiOkpHxFQ7Ca5S7hYBTO5zAcCSElLEgBtn1iau698v72o6dLZYZj2JUtKn
         1GL1Bq8XeHy97X10pTT5umQipb4aH9XesCTzeoITFIXiU+B0zQyVfWMRR8kh3ZmTfVZ8
         +vxw==
X-Forwarded-Encrypted: i=1; AFNElJ/QtZL+kuPp6bXVP1SiHy4LHOqK8xAUmDKx42zMnOTMQfWHSsEDrBAisAm7khpOOBNx26AcXaUnzYGKyFLzFqPa@lists.infradead.org
X-Gm-Message-State: AOJu0YyYcA6g/SqkuvpfJ1lHY1LJZtBFhP5+no+Nm8FxEjhXq/+1WCY2
	cBpBu2HScTMTZb6BF9O7ldjMtKk0WB3gu54/JXf1FpkupwiKw7Wy5rZW
X-Gm-Gg: AeBDievu4hDAzrdQzdiCHRfe7z3ZhAId318y6dVpZ33V3EqZ4RDvdKS8Pc/h8AhMU/z
	gVo/aj/l8eTFOR2tISuGQ1r9XhsbsJD50GFSLVJ9LsCTdrSSocOtvKNBNrX981j9gWXUXrOfZ04
	RBDPwK6DCQeKQjle5tj5yrWxjqP9CGUM3w/MKeihUjCycTJ4GCj9xPTlNmP41YyZXoBAhKvg0Tm
	v2KDoKOO5GaDY8+pJ8nSLJUzMEUfcvI1wU85mswDRXpUW4wmFyi9ISY5s7JskWLCqpJ9Em1//3f
	aAnfm/tW4NMflvWd5Kr/U0uQDW29PiI4CzAS+IQ2UZ9fAQQZBDCajwPJjzGLdsCuQ80fzyNNQhP
	F3lMt/uZKT1g74bgtfi7gGoYcdKzSxr2IqmukD1PO2+ZnRC0TIV6aPeK2oWQN4SE3/xQZZ3E8Lb
	JNzrDNVVaPGTWjFdiVAAVsOrqnjgSqwX42WMWz7sSA9uRr8q1W
X-Received: by 2002:a05:6a00:1c8f:b0:82f:29fe:7239 with SMTP id d2e1a72fcca58-834ddc4bf7fmr5980744b3a.50.1777445963631;
        Tue, 28 Apr 2026 23:59:23 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eaf93sm1043146b3a.40.2026.04.28.23.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 23:59:23 -0700 (PDT)
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
Subject: [PATCH 04/11] of: reserved_mem: skip reserved_mem array allocation when there is nothing to save
Date: Wed, 29 Apr 2026 14:58:24 +0800
Message-ID: <20260429065831.1510858-5-chenwandun@lixiang.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429065831.1510858-1-chenwandun@lixiang.com>
References: <20260429065831.1510858-1-chenwandun@lixiang.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_235925_429411_E45058C7 
X-CRM114-Status: GOOD (  15.37  )
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

fdt_scan_reserved_mem_late() unconditionally calls
alloc_reserved_mem_array() after confirming /reserved-memory exists.
Two issues with that:

 - When __reserved_mem_check_root() subsequently fails, the call
   returns right away, leaving the freshly allocated array unused.
 - When /reserved-memory exists but fdt_scan_reserved_mem() found no
   entries to save (total_reserved_mem_cnt stays at its freshly-set
   value of zero, e.g. empty node or all children disabled),
   alloc_reserved_mem_array() ends up calling memblock_alloc() with
   zero size, which returns NULL and logs an "Failed to allocate
   memory for reserved_mem array" error even though nothing was
   expected to be allocated.

Move alloc_reserved_mem_array() past the root-node check and gate it
on total_reserved_mem_cnt, so the array is only allocated when there
is at least one entry that needs a slot.

Fixes: 00c9a452a235 ("of: reserved_mem: Add code to dynamically allocate reserved_mem array")
Signed-off-by: Chen Wandun <chenwandun@lixiang.com>
Tested-by: Zhao Meijing <zhaomeijing@lixiang.com>
---
 drivers/of/of_reserved_mem.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 807b222fce5f..93585af9f8a3 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -276,14 +276,22 @@ void __init fdt_scan_reserved_mem_late(void)
 		return;
 	}
 
-	/* Attempt dynamic allocation of a new reserved_mem array */
-	alloc_reserved_mem_array();
-
 	if (__reserved_mem_check_root(node)) {
 		pr_err("Reserved memory: unsupported node format, ignoring\n");
 		return;
 	}
 
+	/*
+	 * fdt_scan_reserved_mem() sets total_reserved_mem_cnt to the
+	 * number of entries that need a slot in reserved_mem[]. If it is
+	 * zero there is nothing to allocate or save.
+	 */
+	if (!total_reserved_mem_cnt)
+		return;
+
+	/* Attempt dynamic allocation of a new reserved_mem array */
+	alloc_reserved_mem_array();
+
 	fdt_for_each_subnode(child, fdt, node) {
 		const char *uname;
 		int i, len;
-- 
2.43.0


