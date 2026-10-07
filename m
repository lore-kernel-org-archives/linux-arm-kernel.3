Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A3E9CA6007
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 15:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OgSnC18Dz3quxUXIwZxhZ5WsitMjATqUzKSpKj/iUwM=; b=cEYflKY/Pd1VK9aFkDuLMNhYyB
	hbt7YZtnnBcUW7tw1yf80FaSTmDlz/yjTkgZYpDA5UpVFm3hwnaQzCSu/m7DmFn2o1wYwf96jB88G
	zkQFIjtlNu8b2s6dB60nxVXZ5LW3LxHFKWDjuJ4IeCorwaAUOfGF0ZWvLqhZqxQWeSZzpgsVp277A
	8ZWYn+bUxN5KUjHySgNZoHuARmZWJtwAVJZCVhkidHfuvC2AoioXrki2cULtH9qzgrxICZEnAIKqN
	QgMlolSTR1jfUr3e461YAbTt6r3nrl5iGfU2+aOc3UDvH9NBdoYUTrDIy0F6bjHUplb0rW0LYTUb7
	SpV82b6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xETBG-00000002fv8-08gc;
	Wed, 07 Oct 2026 15:03:42 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xETB9-00000002frZ-31In
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 15:03:37 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-49fcc575709so41482515e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 08:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791385413; x=1791990213; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OgSnC18Dz3quxUXIwZxhZ5WsitMjATqUzKSpKj/iUwM=;
        b=T6MOrJlH4Ddh60jRgpshoU54mNJ33b8YvT+O4QrfdcyZA1T9HMbK4CG0JV8HC3rcVT
         LFKEVpuWh82E8n38BcP2MYiuAh+IuxPPbWibop/3UACHs8oD1t9h+xQJfrLUlIALfHzI
         YzBxZfYSA0HUa6ZN3HrGNAdCuBp6uG3f27gy+aPIi6yXVuLKp3Gi86B4Wy/ZrKNdTViB
         hTD+vS7I3GlOUGAuSjkQTPmQM4Lj/DvZMgqBqDsKOHFCtp7vctaDsWWgvshaXAc3Tuzz
         MYeMMI9Q9eO5FlBDtBPjsDog9/DiHrcLibi+DWpjKU3peMxcTvuaqdS0+RTCxf/XzOEM
         6O/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791385413; x=1791990213;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OgSnC18Dz3quxUXIwZxhZ5WsitMjATqUzKSpKj/iUwM=;
        b=omIPEu+tZhoOS47xg7CSk9wQqaQSFLyZvclkyS8IWRYEgULUEPj1H63zS/FZmfJB4i
         p55ir9480Jy7HWhqTkr85fATpt7bC7YfyPFwm6lCjSuzk7qYxBD0AZENnBkeU3PaNJto
         yk43Yj3QpFbNchqVuWB6YB4BNJ2ofHG2iXPS33q2tF6q6D4s09Ztx/2N272ZGLDqkBAP
         8Wmeyw241HBY5MMP7ptfI4Kvp0OXa9tSyLYDwb7VDjCJK+DOso1I2AZqHOVztnL0SbJM
         XBGoLMlApiGJeCcxVcLdeFt06+ZOGxEAy9CwQzHwdtQVgh4k39r3cR3WUYMZDyknmkJ+
         u5nw==
X-Forwarded-Encrypted: i=1; AKwUvBwpfJ6Ju/M6xHzY4zzn7kFGCOtn0+MmM0wCDcv1qPqFOSnXz3tJ8UkXpvTawgreaSSKmxI0vW1C9tPBaxmac9VT@lists.infradead.org
X-Gm-Message-State: AFuF++nIl5CuJwGir6Flu8gpZBoE106edlCoRPLb3ECiNFp1fT7ic7ff
	rz8jFpQ//8UCgEBHH1t4uJ47cDIbHmLlZz61iV2ScXkZc2COeIdVKSdHlLbivEOyi6ZhcAHbfu3
	C0EGlHBJF7itoxZQhdmbOPQ==
X-Received: from wmbil21.prod.google.com ([2002:a05:600c:a595:b0:4a1:82c4:6b15])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:64c6:b0:49f:fe90:de63 with SMTP id 5b1f17b1804b1-4a180455e85mr45957945e9.28.1791385412933;
 Wed, 07 Oct 2026 08:03:32 -0700 (PDT)
Date: Wed,  7 Oct 2026 16:02:54 +0100
In-Reply-To: <20261007150255.1648849-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20261007150255.1648849-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261007150255.1648849-5-vdonnefort@google.com>
Subject: [PATCH 4/5] drivers/virt: pkvm: Handle a granule larger than
 PAGE_SIZE for MMIO_GUARD
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org
Cc: mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_080335_804878_40ACA036 
X-CRM114-Status: GOOD (  20.11  )
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

In preparation for allowing protected VMs to run on a system where the
granule is bigger than their PAGE_SIZE, allow MMIO_GUARD requests to
overshoot.

Validate the memory regions are aligned with the hypervisor granule
before enabling the MMIO_GUARD support. If aligned, then the MMIO
regions are and overshooting is safe as MMIO_GUARD is solely here to
indicate to the hypervisor where the MMIO regions are.

It is possible to add new memory regions with memory hotplug later.
However the alignment requirement is way more conservative than the
maximum granule size of 64K. Nonetheless, add a test to document the
limitation.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c | 51 ++++++++++++++++---
 1 file changed, 43 insertions(+), 8 deletions(-)

diff --git a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
index 98b1026cf68b..3852be6bd16b 100644
--- a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
+++ b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
@@ -12,6 +12,8 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/mem_encrypt.h>
+#include <linux/memblock.h>
+#include <linux/memory.h>
 #include <linux/mm.h>
 #include <linux/pgtable.h>
 
@@ -70,17 +72,50 @@ static int mmio_guard_ioremap_hook(phys_addr_t phys, size_t size,
 	if (protval != PROT_DEVICE_nGnRE && protval != PROT_DEVICE_nGnRnE)
 		return 0;
 
-	end = PAGE_ALIGN(phys + size);
-	phys = PAGE_ALIGN_DOWN(phys);
+	/*
+	 * It is fine to overshoot MMIO_GUARD requests. Its sole purpose is to
+	 * indicate to the hypervisor where the MMIO regions are and we have
+	 * validated the alignment of the memory regions beforehand.
+	 */
+	end = ALIGN(phys + size, max(pkvm_granule, PAGE_SIZE));
+	phys = ALIGN_DOWN(phys, max(pkvm_granule, PAGE_SIZE));
 
-	while (phys < end) {
-		const int func_id = ARM_SMCCC_VENDOR_HYP_KVM_MMIO_GUARD_FUNC_ID;
+	WARN_ON_ONCE(arm_smccc_do_range(ARM_SMCCC_VENDOR_HYP_KVM_MMIO_GUARD_FUNC_ID,
+					phys, end - phys));
+	return 0;
+}
 
-		WARN_ON_ONCE(arm_smccc_do_range(func_id, phys, PAGE_SIZE));
-		phys += PAGE_SIZE;
+/*
+ * Return true if the MMIO_GUARD service is available and if overshooting is
+ * safe, which it is if the memory regions are aligned with pkvm_granule.
+ */
+static bool __init mmio_guard_available(void)
+{
+	struct memblock_region *region;
+	phys_addr_t prev_end = 0;
+
+	if (!kvm_arm_hyp_service_available(ARM_SMCCC_KVM_FUNC_MMIO_GUARD))
+		return false;
+
+	if (pkvm_granule <= PAGE_SIZE)
+		return true;
+
+	if (IS_ENABLED(CONFIG_MEMORY_HOTPLUG) &&
+	    pkvm_granule > memory_block_size_bytes())
+		return false;
+
+	for_each_mem_region(region) {
+		if (prev_end == region->base)
+			goto contiguous;
+
+		if (!IS_ALIGNED(prev_end | region->base, pkvm_granule))
+			return false;
+
+contiguous:
+		prev_end = region->base + region->size;
 	}
 
-	return 0;
+	return IS_ALIGNED(prev_end, pkvm_granule);
 }
 
 void __init pkvm_init_hyp_services(void)
@@ -108,7 +143,7 @@ void __init pkvm_init_hyp_services(void)
 		pr_info("pKVM: sharing memory in %zu-byte granules\n", pkvm_granule);
 	arm64_mem_crypt_ops_register(&pkvm_crypt_ops);
 
-	if (kvm_arm_hyp_service_available(ARM_SMCCC_KVM_FUNC_MMIO_GUARD))
+	if (mmio_guard_available())
 		arm64_ioremap_prot_hook_register(&mmio_guard_ioremap_hook);
 
 	static_branch_enable(&pkvm_guest);
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


