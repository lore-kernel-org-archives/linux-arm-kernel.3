Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B28AC61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 07:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cwr70l9V39DZcorg71LVRPBxIRt7bXPqTCF0S2pUJMg=; b=K/CJWdEDaL0yWfzKmjPEM2vzUx
	UDe+RnOJRyR/1xfLKF7LwMdmaNcmP9b/H3w0EX1BOTcab30hhLPtkt/ebp6VqAEajIe9qOiUvi6b/
	FJQu23AI/WHsbg4zylSJ3vvT41vGbxo4bZSykeg0eb2bd/a7thkgJg2H9EAgCOH/7qA5MEGpxDJLV
	WQAVqwYAwzLmHREFTG74rok2LnBjhF4pYk5G7o9A9WiyaJMhQrqSki0y2Gn/GF/X1DaCAQtISwMNi
	c/O8Klb/rVvxRjVlYJ2cmGchgmviV35p8u4Kjg54s89mfx8NRaKR/0kHgloOK/lvz026+BnSARELo
	b8dEpe1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fSS-0000000DwC1-49Zz;
	Wed, 02 Sep 2026 07:32:33 +0000
Received: from mail-pz2-x0a.google.com ([2607:f8b0:4864:3b::a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fSL-0000000Dw58-3d9l
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 07:32:29 +0000
Received: by mail-pz2-x0a.google.com with SMTP id 41be03b00d2f7-cc1d7f6f26aso411025a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 00:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788334345; x=1788939145; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cwr70l9V39DZcorg71LVRPBxIRt7bXPqTCF0S2pUJMg=;
        b=HV5jH1loxqoSyL0PjIOJVJ7Ra7S6Su4X5odupomH1lP+NmtD25gf8q4vQEd44lvT49
         2g136MyzY7dAxeg4HypiFewzwh2rllkbjTHyyEib0pOsxiBrhwlKf4UH1CUQTJcA6aVq
         BYMKs21vj073ygitcjPKw1khHZ7K7GZZfbolFd8lNtnWJN+VGKG/7pduxafkFc5J90kb
         sd44EPYkCYpYvbtp0im1/0HjxWdlishhyk8qUg/eicBiRrEvmBOY7YgKIH8uYubydJO4
         gfjbVVwZH9utVqy3RSDmbZi4cX7SPJhEbjIK661ZjRbsTp3EZifSZirRRaFt6qs32tpa
         MwUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788334345; x=1788939145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cwr70l9V39DZcorg71LVRPBxIRt7bXPqTCF0S2pUJMg=;
        b=oVBFiLAoutm0NBeOsyKnYjJU6N+5qV8T52xsZ6d6Zo6OpGMaoEF+nbMfk0LzBWcxmd
         P2f6WiQR2/XriC6NzO7gqmDznx49Lt74X6VMnP/uD1W4rZ8nfiATlHuJCvTXPdS9VNwj
         2sg7oiTF2FHY0Dpb7Ol63WuBA7hx1AoNb4l6KOCuZSWOXOWtLsUfxcSgVxgCaC+ahzOu
         BRkSWiyay0LkvRAx1KuKtsc4JZmdhkuo2OxP7Zmqa/KhEfgJHVXwAeyqeQFPYV0iHVak
         yCuSK8j+GFMBeMrofLnQJHxYS8B7gROQjlsV4inPnvW/sXRx5BywbCiS4BcY9KTr/m+h
         KuHA==
X-Forwarded-Encrypted: i=1; AKwUvByYiTY9IBQRGTcwWxtbALiZ2KE6z+HyZe15rdGOQFmwuWhVstCUr0Llsx5X30pYOQdSbnomR2v2r3iaGRuxv0gW@lists.infradead.org
X-Gm-Message-State: AFuF++n1CGuWz1qprLqyBH6M3d2SBBxANS7K2ON3sCKqeQL+jurhZGaD
	v5aXYKosRXb4rPPntcc9Jxqrxi7vkOGq0+trWb7oR5HLzG8ubStsEb28
X-Gm-Gg: AYBFou3NAM0aB7oCvZOMsf/+VRqz/XS+YtcNx53pym5isEuNEHkLneqVURBQ7g47YlF
	028Q2vIL2BukG03PW42ue8F7fNUrT8VDmpXzQMeitsCHfwhIPF9XTgEB7JT2UW/+zmofR6vIWOo
	v2MtG3OkGYKJMYxRfjCptZYoTkfm4sR8KjHMBp4oOvvTtxBXv3xEpXcJDshM8dOXx3eDwFmd3m6
	NXoJMP8QC3X4UXokN4ha5XgJIm8HtJH58Pf3QcnZ0fk+Mi46WVNN3NhbtzBzA8Ao1J94gAWLpEp
	Ekdqmvke6OZh5bpo5jNBiA1ZmZady6J1D8vht46BmKyspk6d/IzmM9daaMQPBikF1fH23WRTJDZ
	7/HIgXY+Yl2gxIUf7rvxBzU8pBKpTimI8KgzDgW1lcVpy5VBBcXMIia9n7g45eik6qZA+u6Z3xh
	IDIi9exYLIThJpeadgUPt1vwBbPt7zgLDb8fHW5BGxoWVQvh7W84I12hVIGWVLmuNUyJJM2TbPF
	PXmkFQ7gxM=
X-Received: by 2002:a05:6a00:238b:b0:85c:c8db:8e4b with SMTP id d2e1a72fcca58-85ed23dea9emr4650515b3a.6.1788334344871;
        Wed, 02 Sep 2026 00:32:24 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db2adcbedsm926914b3a.20.2026.09.02.00.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 00:32:24 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	robh@kernel.org,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	m.szyprowski@samsung.com
Cc: mark.rutland@arm.com,
	kernel@xen0n.name,
	alex@ghiti.fr,
	hpa@zytor.com,
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
Subject: [PATCH v6 04/10] crash_core: serialize crash header preparation against hotplug
Date: Wed,  2 Sep 2026 15:31:10 +0800
Message-ID: <20260902073116.802752-5-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902073116.802752-1-chenwandun1@gmail.com>
References: <20260902073116.802752-1-chenwandun1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_003226_284576_90E797BB 
X-CRM114-Status: GOOD (  17.06  )
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

crash_prepare_headers() counts memory ranges before populating the
allocated crash_mem array. The weak implementation used by ARM64,
RISC-V and LoongArch walks memblock.memory, while x86 performs the same
two-pass operation over system RAM resources. Concurrent memory hotplug
can change range source between the two walks and make the populate
pass overflow cmem->ranges.

Take device_hotplug_lock when preparing crash headers during
kexec_file_load(). The x86 memory hotplug path already takes
device_hotplug_lock, so call __crash_prepare_headers() directly
to avoid recursive locking.

Sashiko reported this issue in [1].

Fixes: 3751e728cef2 ("arm64: kexec_file: add crash dump support")
Fixes: 1bcca8620a91 ("LoongArch: Add crash dump support for kexec_file")
Fixes: 8acea455fafa ("RISC-V: Support for kexec_file on panic")
Fixes: dd5f726076cc ("kexec: support for kexec on panic using new system call")
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Link: https://sashiko.dev/#/message/20260806101002.1F84E1F000E9@smtp.kernel.org [1]
---
 arch/x86/kernel/crash.c    |  2 +-
 include/linux/crash_core.h |  2 ++
 kernel/crash_core.c        | 17 +++++++++++++++--
 3 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
index e681ec9cf1dc..284d78bc3fd0 100644
--- a/arch/x86/kernel/crash.c
+++ b/arch/x86/kernel/crash.c
@@ -465,7 +465,7 @@ void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
 	 * Create the new elfcorehdr reflecting the changes to CPU and/or
 	 * memory resources.
 	 */
-	if (crash_prepare_headers(IS_ENABLED(CONFIG_X86_64), &elfbuf, &elfsz, NULL)) {
+	if (__crash_prepare_headers(IS_ENABLED(CONFIG_X86_64), &elfbuf, &elfsz, NULL)) {
 		pr_err("unable to create new elfcorehdr");
 		goto out;
 	}
diff --git a/include/linux/crash_core.h b/include/linux/crash_core.h
index bc087124cd78..28e7a81cf263 100644
--- a/include/linux/crash_core.h
+++ b/include/linux/crash_core.h
@@ -61,6 +61,8 @@ extern int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_ma
 				       void **addr, unsigned long *sz);
 extern int crash_prepare_headers(int need_kernel_map, void **addr,
 				 unsigned long *sz, unsigned long *nr_mem_ranges);
+int __crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
+			    unsigned long *nr_mem_ranges);
 extern int crash_exclude_core_ranges(struct crash_mem **cmem);
 
 struct kimage;
diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index 77285ae3ce60..3adee1ae120c 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -16,6 +16,7 @@
 #include <linux/mm.h>
 #include <linux/cpuhotplug.h>
 #include <linux/memblock.h>
+#include <linux/device.h>
 #include <linux/kmemleak.h>
 #include <linux/crash_core.h>
 #include <linux/reboot.h>
@@ -338,8 +339,8 @@ int crash_exclude_core_ranges(struct crash_mem **cmem)
 	return 0;
 }
 
-int crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
-			  unsigned long *nr_mem_ranges)
+int __crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
+			    unsigned long *nr_mem_ranges)
 {
 	unsigned int max_nr_ranges;
 	struct crash_mem *cmem;
@@ -376,6 +377,18 @@ int crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
 	return ret;
 }
 
+int crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
+			  unsigned long *nr_mem_ranges)
+{
+	int ret;
+
+	lock_device_hotplug();
+	ret = __crash_prepare_headers(need_kernel_map, addr, sz, nr_mem_ranges);
+	unlock_device_hotplug();
+
+	return ret;
+}
+
 /**
  * crash_exclude_mem_range - exclude a mem range for existing ranges
  * @mem: mem->range contains an array of ranges sorted in ascending order
-- 
2.43.0


