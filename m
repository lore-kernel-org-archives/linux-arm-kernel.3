Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FCB9CCA462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 06:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ICQyIKowVj3RyrjMn4gMzYuhROzG3qohL1WARXEfQY=; b=cmrjiSwKqy2dneuc/MiKs/6fTD
	mM1LgfNQwW6EwFhzKEcYjG6D05VcGdRermLmzQXXNv7BkMOpwDtc2c3f/wgTGsKS/uBO/T9qa3uoH
	q4uVr+b5vFUpKxCKUA+RUUwO5ktnYeNR4v/Ha5vK9wfPNhfG/TsCqip5wAiDiX5NU8wZ6wUxJvzCJ
	olJ4+FAT7DRtc+a3OL7nvyOueZJsGHtQJw4AdlmwMVhh6Gtukqu4LrqL9482pu7hoX1zZciJJgUCv
	XgemuDVvYmJuhfwnunJvuqmqKWX3m5WYwiet7ZGoX21MbP9wrwq6W1wcMMlI4uudQG6k7wf7X/QtJ
	9dTa+aOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHbG9-0000000267E-0wRc;
	Fri, 16 Oct 2026 06:17:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHbG8-0000000265l-1bO1
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 06:17:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=9ICQyIKowVj3RyrjMn4gMzYuhROzG3qohL1WARXEfQY=; b=EZqEy0jieMekzTzKtcieD4ck9g
	dKP9PQf4S4pcXBsfbi9/JG1/smkhIwMVHcpSu0KOlWXbPl8aFHenrZloVL0ESP1fXAivJcas4oQwq
	WhYw73zii89eQ/qZ4Wp45g9YUhOG07pjJODWRtZiiuRoS2kBZ7jzY7bPk0M5XZEhe9I1U67QTehVy
	rxCyGSuxmeiDHRQqBbEI0h6fD5rPrlv0Ks4eU0+3mjg6NBRrCgLTf7yz88aZFvVpfFAxGOk6e3yuw
	CpKbPqONW1VM2sLgaIfkvrbwwZtdMNduMDlubFxKF23oDQI2hDuCZyPQRTe/bZTNsqYTHeDNrXfiE
	MHULls+w==;
Received: from mail-pz2-x0b.google.com ([2607:f8b0:4864:3b::b])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHbG2-000000019rJ-3oV7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 06:17:38 +0000
Received: by mail-pz2-x0b.google.com with SMTP id 41be03b00d2f7-cd65a511e43so73739a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 23:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792131453; x=1792736253; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ICQyIKowVj3RyrjMn4gMzYuhROzG3qohL1WARXEfQY=;
        b=TGg/1iiwz6O4Zix/0UXhNig29Yfefl+J0q1Mz2KPkZOYD5OWNE6XHQapjJyGZLDX3U
         F50Ddirkxzk6MH9idpoClz3i+Qrc10O8PXG3sECOl4J48m31oQuaT+YfCfAv67a396WF
         1Z2CMbYNTukoqH5fbReRjAoBSfuR+ddTq94bPoi7iy12AGBWRVZsYOaM/u+sZxASichn
         PRosWdk/WvHp2T1IurmPwFA3FFGqYdRKgZ/SFQD9ftiAwVGr3aQ5fKoeTSDUFY656QSb
         rlHXviO7y4xDxEeJCkSmOSLGBSemxs34TSJ7vJIy6FXodVl8L2SkrtBp1TWXdXEE36c8
         ding==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792131453; x=1792736253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9ICQyIKowVj3RyrjMn4gMzYuhROzG3qohL1WARXEfQY=;
        b=vd2qlMvGqzlLt85B21KXXDQVhy0rAuP9RvoH0YJPnZnu6zMXq0hRY6ntKnqcBwkd84
         gyhF2HkocNbaiV0qDXqzT6O2QPV6znC6KcEO3yc7V4jUnmVYcQ13gDfFom44BNLmAHC6
         gMIZW1PJ0Oz2OqyXVsrdIcmebhVTqU7c/HJygnsGpAD1ALUQ3GJOqk6C4cbEw5BHGuAm
         NZATHoxPMfL235QuQlsNTHRIe2zDLImOVj9SzDF5WkmgEfHNSF2hueETfv9c1bzD/UpG
         tpkNL89TsDjnw2zdIBUgZdPzekWfGu7MBN0jDLu2rTFhHZ/GMgQDl1DvLha2eQdqr7KF
         Qdsw==
X-Forwarded-Encrypted: i=1; AKwUvByROlPOhTUf6PrsTJOyNGa3nDvwECLIYJsI+e4ez5c24I5OZruzG8qfEaknnjbYd92OfL+R48s9riIxWR0DbUt7@lists.infradead.org
X-Gm-Message-State: AFq9FYIyWKXVgZiZQu5DZ7pfQNTiWiVIs5eAZjLNGtn6LOQ6kd/ssMKm
	6tZfS054/HIG6uyQc5O835wD3G4BnSJt/NkQa6pZLioGI1c8/G+eca2k
X-Gm-Gg: AYBFou1tDI6jBgewbJ6hsWDmtasDyDtTxWGQzjCYXsaMhoVviC0s5gvBKlbbVjSCmCo
	UgiXvVAQ1LhRLT7AK5QjQk/4V+pzw+zdhbZwnWciT2wZ9CUZuzQ/utBAZoRoGnY2Hbxk251tWsC
	9qTIQ6QLc4VDxNpJV/49r0yszZNxJ+oUAEafe7xZ8kOHLfDRbkiFct44XoFYTmWwgWEsBLwlmdj
	e01m/Ysda28jalyG+eWfg15qSJF0oTYhcoRYpYEyISj+1x6JiPrDXQRYS8joWKjsw6jMzg3824r
	i2yszB/JIEhLeQV0udh1EWz3eimEKUtwJ0PF3cLOikbGihAQUWkOK7CNXHub+Yc5891RZhRDGsb
	5JcaSHQDgMHZLxvTf7EnY0pGKgwAPAh9DdnzpCaTKcb0501e90Lfo0n8feKtVwNFuyaFFk+Lii0
	xtZMIv5CnesmdmBiCM5Yd5YgRbI7EJG28MpZr1F9d18+2xTIQ2l1aJHMY4ilagbvWFJBMYrw2Sd
	NSyB3LHXqQ=
X-Received: by 2002:a05:6a00:1941:b0:89d:7f51:6492 with SMTP id d2e1a72fcca58-89d7f51698fmr8778955b3a.32.1792131453020;
        Thu, 15 Oct 2026 23:17:33 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57b334e6sm586375b3a.42.2026.10.15.23.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:17:32 -0700 (PDT)
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
Subject: [RESEND PATCH v8 7/8] of: reserved_mem: mark /reserved-memory entries with MEMBLOCK_NODUMP
Date: Fri, 16 Oct 2026 14:15:48 +0800
Message-ID: <20261016061549.4181390-8-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016061549.4181390-1-chenwandun1@gmail.com>
References: <20261016061549.4181390-1-chenwandun1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_071735_586734_D2E6DB96 
X-CRM114-Status: GOOD (  14.98  )
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
index ecc923102622..a5f223a74b7e 100644
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


