Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2768C43638
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 07:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kilHQAUiYtCIXGoXTLzkG+QFNETPWES64QJavnYCw8Q=; b=XWnvTBKubGhCkzPWOy1LhpqA7k
	G/wbXbdih57M72WyAYcfBLK9pCFtmETD0dYHJLDqOZLJiiXWtCboSTvlRqBFJClDQUa4qtv7REnCz
	kcM+Op9UgfdzOREUyhl6TFP4VziobgsyyjemvAse+njoY/uS/bl84ZVUmWpaY04LVV3IUREqH/qVz
	mUubvnBtr4EdB/D18h7/txbPAYi2p53NnEoXriYMNnOuQEVU7FzSUHPa54kTUiLkXo+6w+fK7wWVV
	f+T5K4dP/DWQnG43zhh7Zd/eWwnIjFhGXlAkp76ZmJUdqzl8iVCP+6n6iTr50vRpQsH/hEmoTrqI3
	VM4rFcZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTDg-0000000GBF3-0zfA;
	Tue, 30 Jun 2026 07:49:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTDG-0000000GATH-41Sn
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 30 Jun 2026 07:49:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=kilHQAUiYtCIXGoXTLzkG+QFNETPWES64QJavnYCw8Q=; b=Qit+AsWSVple84+iO0k79UM8Fz
	HBZ2tu/PQw7zpy+h4xkqe5OCy4mY/w8KicRYyvrfpgcuIqGaDtQbj6YR7OyMQ60hp3PdXBS1kQ4S6
	5w7n56gCIgP49/2NVRZixCYmknYIldL4/xzcfRn6mbC+xecLS/7la/DJnpwPZndaU+ALJDWwOECTq
	b3EA1Tor30pvn6W2dG7ljYtBkQIn5SNk+SdQk4NsvT3hdFwvMIgHojWg7/TTALfT9SsowqN1mN8lb
	Pu5ytlrjTe76fImyNOAugBEQEumLhQEvezWh0h7UzJ0Lzt8U2Im+yezgwexCPtq/56ytn8PPZIp/S
	v3UZH6MQ==;
Received: from mail-pj2-x04.google.com ([2607:f8b0:4864:39::4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weTDB-00000001cqe-1hSt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 07:48:57 +0000
Received: by mail-pj2-x04.google.com with SMTP id d9443c01a7336-2c99784b434so2273875ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 00:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782805731; x=1783410531; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kilHQAUiYtCIXGoXTLzkG+QFNETPWES64QJavnYCw8Q=;
        b=Lxa3SNLewfjO1XWJBqKFQQAD+AD3/E18whJvgN/xGrbdPwTASdXJwiXHSP35YSqv00
         pT5FLKLDQUEgygiJTtGJl9UvOuDnTz0Kgiux5x+E7lWwZU4tbjr3JHsOuC4wpJMVMBKX
         zAi9dHNOKWrM7Qa72WowRkzpSlcstIWrMXSLV0u/7TJAKhs0B8c5uBOa2DxoHoTq88tR
         +bmwdZaUew2XBwS8ZsTXlLF3wdjVjnilBKErPP2S2mmzXCGpW4aUH0thzsDRInhyvnRq
         XbEjTnqNGhNxhf0LbvnvmLlHPKNzRsxs1s/exgazcnSqMG1ewH6Fa4bZcnOHYPACGVJd
         vusg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782805731; x=1783410531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kilHQAUiYtCIXGoXTLzkG+QFNETPWES64QJavnYCw8Q=;
        b=a/jZc3qfrpNaNPV+HTeJvbFBjJQnX39MvrIRH7f02tovs8A5fscKR/SPHWEhm3EJLw
         1qCrP+okL3QCnMlXsnsH3X80Y0vs451QmCpmyQHg32d46zYHP1wAZ2JjtKsfOPfh2jsl
         ctxk4teiv7/N6kZap0WXDTWNVLhuNIWFGAjaxffo1+CsiNcY8bobtldSHCjQjbozKDXy
         WhP7iSR2lGqUuoScvzZsQjVewayTrlOmuIPeFwt6lDnyEkyt2d5f0gCz9NDxO6CEx0+W
         y0B2aLW79jVc52hOZbq2De8OKMmpaayBDcHSjKyvTozFKenGBTQ/mYuxhwFmk+cdiScF
         kWnA==
X-Forwarded-Encrypted: i=1; AHgh+RoTwnayXIE3qdMp2fsfuGoN6M7DFTyWoSHsex0ViZ4q3fhKCDhiB5bo+C/ZaiZFciPyXwdaO9rvpD/B4snjWGWq@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5Evop8T/euHoINzCWtRREzyUHlDCq+3WllWgvl/SG8GKCk7Za
	u8T33B0BV5gSgDBXC+xSuln/TgDvYtI2EaY7FGkG4Ce1G+YsqrIYNO0P
X-Gm-Gg: AfdE7ck1yNkQpZIuUzm4nTb9DGer2mKCp2i33ZNApNmCIOPF9LS8oxwxjqv89Arfo6L
	Mi6RSbUbAtsY8l09ZgOCYrGW7iuSooSHu1cceof/WO+LQi0zuD6LYKI1ZX+x2i+VeV7QrLmylV1
	g5eZCXvCmghs4Bd8wevUKucqut45wCCxCLq0uedg+kFfPR3N65jpyy8P0Mv8wWuBHknlHgBP3Ji
	E1VUc7h6FAkSm8UG9Ao+PBnXpvA/NIL3j60ZC3XkJv5uHnyBPr2N1xJrTSepNE0RbS8GWoG8kg2
	Jf8huguH4KWN3Nx4fHxc2attZKWedktPOQrGXdfZzRBuF6dJ/eSKd7o1ym1HqR9b2HxmBpCx235
	fnyowEetfloAt6U8L3KqSwA9qBvKwyhzUYNmXFlmAMCKXb6zGA1BOL8bwaGaoqSdQoDjys6ipUv
	8xxjxEEyppYxm3zmLrvw0/v/3N/A==
X-Received: by 2002:a17:902:dad1:b0:2c9:d55d:2d3 with SMTP id d9443c01a7336-2ca2d55dedbmr19212325ad.15.1782805731371;
        Tue, 30 Jun 2026 00:48:51 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382a2d3dsm7821045ad.55.2026.06.30.00.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 00:48:50 -0700 (PDT)
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
Subject: [PATCH v4 08/10] arm64: kdump: exclude non-dumpable reserved memory regions from vmcore
Date: Tue, 30 Jun 2026 15:47:12 +0800
Message-ID: <20260630074715.4126796-9-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630074715.4126796-1-chenwandun1@gmail.com>
References: <20260630074715.4126796-1-chenwandun1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_084855_428460_A9A9FB41 
X-CRM114-Status: GOOD (  11.70  )
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

Reserved memory regions are excluded from vmcore by default unless
marked dumpable. Honor the dumpable flag to filter out device firmware
regions (e.g., GPU, DSP, modem) reserved via device tree, since they
typically contain data not useful for kernel crash analysis and can
significantly increase vmcore size.

Use of_reserved_mem_kdump_exclude() to perform the exclusion, and
pre-size the crash_mem array via of_reserved_mem_kdump_nr_ranges().

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/machine_kexec_file.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
index e31fabed378a..1d65320c6ba4 100644
--- a/arch/arm64/kernel/machine_kexec_file.c
+++ b/arch/arm64/kernel/machine_kexec_file.c
@@ -17,6 +17,7 @@
 #include <linux/memblock.h>
 #include <linux/of.h>
 #include <linux/of_fdt.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/types.h>
@@ -51,6 +52,7 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 	nr_ranges = 2; /* for exclusion of crashkernel region */
 	for_each_mem_range(i, &start, &end)
 		nr_ranges++;
+	nr_ranges += of_reserved_mem_kdump_nr_ranges();
 
 	cmem = kmalloc_flex(*cmem, ranges, nr_ranges);
 	if (!cmem)
@@ -75,6 +77,10 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 			goto out;
 	}
 
+	ret = of_reserved_mem_kdump_exclude(cmem);
+	if (ret)
+		goto out;
+
 	ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
 
 out:
-- 
2.43.0


