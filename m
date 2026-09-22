Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E10CDC982FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 08:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a1DOWyR/dLH3AEbWE3m8aVGig/7kxpUIrM7nXUawY8c=; b=q/9TnPbXFxAM7JFOKJA/1lju52
	1S0qlwQjL4D6TV2QMF+nxXo3P9ekiEPFDTHQTrQPu6aNhXdqiphhhDH9FmcOoP3WTEIhoXW/03v32
	tCmkxK1yfoVVf90aHqWHnyE2Z8sZv7xZYIOtjNu/L9RDxE3RJotI+jkn+t0Ofi1p4OnGsQ8qpMq2Q
	LA2Dr0IS0k1VCZIa2qEkxvQWxEFKS5G1Q+CT0gBlBkmgiZ8oh0TYFjL0VB/QRguo8tS9p7V69HICg
	463bvjh0Z1bibN+9dUV2dQ+FjgSZb4YLn5hZGWkvpgYD6JiIchcGz+qYyHueQ6dkW+Mb8TpCNS7sD
	RLaj3WoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8w6V-00000004ik7-1L39;
	Tue, 22 Sep 2026 08:43:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8w6T-00000004iia-3MpM
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 08:43:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=a1DOWyR/dLH3AEbWE3m8aVGig/7kxpUIrM7nXUawY8c=; b=M8qlsOiX+w9ib9SrCYnDwUooK3
	RJJttBpjX+LbJBR8HyrNMn6O2kO1AURlDu+DnXMT8/L/xiEeAFzYpNI6dqg2BVXr7wTwg+24CYa2T
	DBdwK0wEw6KEYkBkWJBke5dEqeU+hnQS+InsaoLhFsYtLtjYNLZZGQ3YT3358FZEOHeWobZR+AotB
	ZtdXqeSj08ygwMjeUSbtu+v0nODVy4dB69rDnIqGJDBmSG28s5M+qMQuIloDW+n1O7eGcOPJrlPyc
	tT+XBqHnFQzKvFel9bTQE+rVg2asFZrCcGb91TywLh7tud3oWNicC4izLpwh5v0riafvjKbkzKeVD
	YH9UTYBw==;
Received: from mail-pj2-x0b.google.com ([2607:f8b0:4864:39::b])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8w6O-0000000DHX2-3DX2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 08:43:52 +0000
Received: by mail-pj2-x0b.google.com with SMTP id 98e67ed59e1d1-398a0a87595so5078362a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 01:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790066627; x=1790671427; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a1DOWyR/dLH3AEbWE3m8aVGig/7kxpUIrM7nXUawY8c=;
        b=m45IA6I6EZTXPfu3Xkq5n5ENSy5KhLUxAucVQw5j2oZhwMFY05eQpglESarHFNx6Mz
         HF8+u+VJbrAxhpFI8c0mPwCfpiIm0+uIHsTQNWanXwzQ7x0BNHp1Utm8HmEuo3u1YGcq
         osB+02YCH7WdiK3qdDzXOLGa58oOiI5kEISLQ8mn95lmb2EGkOn8Qsxo0+LmHK+tCb4G
         z1XUOE9g6uVT9Gw78LCPfh+OL4VjdTybOvclkltLUwnx3+8QScMlcc+aNzm3ZY+sv5yP
         nf5qjGwlhnkquCs1N2diHH0qJuoxDclqRsGQPifPdKE1eDmgZJSzy9ELvmSRsQBLnshI
         vVSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790066627; x=1790671427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a1DOWyR/dLH3AEbWE3m8aVGig/7kxpUIrM7nXUawY8c=;
        b=qy3u1t6wpO2Z+LrL8PuUc0IspZQfWl4QOs+2OSbt5zNfR519oM8f9HNg26Tw2pl0yI
         nrq5e2LA3IXtIGRuUrjxHnp46RyftCxAYttone/+zEM9+H1QnbDpxo2X8FTNHb6ei2eW
         j7ADOcufp4o23yLsH2Q1dEjXEAh4ycwjS8+PFuAYI6bpZHxUKi7drSaSHc3KDBcPKYv5
         OPoGCBh2/dyKU2S40Af1+uV+/K5KfSB6H+cySWJZFqRHND/pt/xpr/vBROm728PI+dHr
         lUttHw85MmxeKrKm030sIDkVtZ7EoUNnxS1jYAFzr3opq3chGkQ8E9MfRy6wctkmnpcS
         oAHg==
X-Forwarded-Encrypted: i=1; AKwUvBzEnOOpDXscK9SKJsbC4rZEQkUViVSMPlsRBENRF/ZXz0zkW3WY+p3q8uxmWy2yTwKDKoMVBhKYUU7NCz9C9f2D@lists.infradead.org
X-Gm-Message-State: AFuF++kDn1f8lBxUrGRzLqIp75DYrNktC4Ilef0N25Q6m40EvBMfAviD
	gIb/rw6bfjnAC7lclcCwBz0mYLmdU1DxktAbGSCq2mcZbZwJCEZIejrW
X-Gm-Gg: AYBFou1Nmx5UCP9OoimpGLgVgP/G9WbwSjULlsCajU3YiR7jhLvfKwJOrMX3ZCR74of
	vdV4Q86uGZULsMJZ4sE3NTmnLrDYA1+shAGwwYchbE6enPdU8pu6EQcMyDUzmpeANUeU5zPVxHJ
	3ZYbr4GoKq2hPlodGk2vFlm+iCf1FSN2yzb0dHblSfkORvh2V2Y3V6+TAumtE5U2C4Ix+Iz9xSR
	YbQG5Xz9FPVyWEEugAG0HR3uDJGbxLkyBtrl0HTop05duIX+CRu7utOc7qVxniOZX1nuDVwjgGr
	1m7K3Z+GQIgeEJDleb7o6K7omA2U3RLCZVtZz7ux4OBHMGHYgEd5i0wNxUkJiaZn5W6VFmjSjXQ
	I4I7nlVD8sZGbkNZ0pL3WQmZIU02p0USPdduF9cwqerTpIpibiJvBRZd3zHPf2PuI0qbONzzSls
	pjs6W1SLyg3nKYKlzf5BSIvikpLvysGDVwAcg/UnAUUPnXJrYoSnvXWUPg58Mja53xosGGym3GH
	+5u782J4XE=
X-Received: by 2002:a17:90b:5546:b0:39e:14db:437c with SMTP id 98e67ed59e1d1-3a07309c886mr542158a91.4.1790066626997;
        Tue, 22 Sep 2026 01:43:46 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0674a5ae4sm3670016a91.12.2026.09.22.01.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:43:46 -0700 (PDT)
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
Subject: [PATCH v7 3/9] crash_core: serialize crash header preparation against hotplug
Date: Tue, 22 Sep 2026 16:42:50 +0800
Message-ID: <20260922084256.1515554-4-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922084256.1515554-1-chenwandun1@gmail.com>
References: <20260922084256.1515554-1-chenwandun1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_094349_130941_9BA58D5E 
X-CRM114-Status: GOOD (  16.66  )
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
Acked-by: Baoquan He <baoquan.he@linux.dev>
---
 arch/x86/kernel/crash.c    |  2 +-
 include/linux/crash_core.h |  2 ++
 kernel/crash_core.c        | 17 +++++++++++++++--
 3 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
index e6f23933a6df..bef008a0cb22 100644
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
index d201638d11f3..d0cc2496dc09 100644
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


