Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F10CA6007
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 15:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uxc7RC90yOYNMPOiKZa+i5XwHxmLCQG909I04eO4BWE=; b=oZR/q8k0O2t0txljPvHbuFn58X
	76hYyBsvyW1qsyJmWKkx8W6dwoorjowzEhc5IUr/XFcLjtJBIDBvCYaxB6++g5gH/WlmxqO9CHeRE
	rmcWpKzRH1Byb459cenIkk3n8qQkn9hiv4+STUmw3hF1grnC2BN0pwfv3L1xTo4V6dFpk73lXZy3v
	QiTsR7zCwBQZmWprmre+yYzK6ToDiRQq3Komf1We8cEDUPohx8OqvmV024QTGn+t/0Ydh/n8pkWSw
	kaGvyLLw5payM2Tiky89qgXC8hFes/OxFm200SxJCrTqNdN1nKalADfp13ZyL/1sqb95e/iVfB2ZM
	c2CJ5iZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xETBE-00000002fuh-3peL;
	Wed, 07 Oct 2026 15:03:41 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xETB7-00000002fqt-3I41
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 15:03:35 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-4a1721559b4so31380655e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 08:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791385412; x=1791990212; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uxc7RC90yOYNMPOiKZa+i5XwHxmLCQG909I04eO4BWE=;
        b=VCCKqplVdkmAt28OffuJ8/K4uVOxEJ2m2T6tBMm4lAER/ad+3dl2Kk1l9t8xPwa+7F
         qIS6kJu1e65/lNvK65UCIEOc+JU9yTyU0WPSa0LhVyxFsKIdqsgQjwoqep4QI50ZJgCB
         KEJwGUxXPcdKZvBmfhVaNOBQFdarq55FWGLhObQPDRAyCki+P2kNA6g3adCDcR9ukGZx
         15JRKlXBbyar9JQYzrvhfljvxZE9jJFjd48/UbUT1cksBHzFPeitr4OhrvfUu5Uk9+kJ
         g43gW8BRrTAOQNLEmRgi1SHHPCVJPSKCNOBA+6JWXcKqkLG+qsm4pIyxRbD31vT3pUx4
         1v4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791385412; x=1791990212;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uxc7RC90yOYNMPOiKZa+i5XwHxmLCQG909I04eO4BWE=;
        b=ZMi/lNgRzhgkLP4TdcpwKWDiY3cROjrqL6tyzzwtgkmF3bU1ixNd3WDw1ftiwJPFCo
         rrXGE3AxnslfxLIOzpcd5FVTWCjdcX0/3NuJxwib6yM+hp8wIbjn7uHP9SUVLcr6O2/r
         h+1k3GqvaGMNei/e0e81olvsTvmchW7utgOeAdAbxagVA6eoa27zjcFXMBrc6Jr0g2ih
         Vguucm7H0POLk7DASc9iyVWoIRIAWo98ZkHwKNIuuqAGOnpPzFHHGI+79kRg7MXFNx91
         MygWGFtvZwW+WsirW7+bel0mtG2MSO29Q9JKxYX5a4deP2+EjoQmktOhnitvXAiUsyjc
         TX6Q==
X-Forwarded-Encrypted: i=1; AKwUvBypdOVvLd/seXfQd2QRKHhFJBnSmf8M1Hnsy5jRnOL+sPi1Ft4rxSrZe0wOc2ZXvUUYLR9hzCYNF+aSWAFxFTkt@lists.infradead.org
X-Gm-Message-State: AFuF++m2bf4vyfD6NoPvxb6w3lAOvVfnKbj8b+xEivxHHCkmwbTzTNWQ
	fxjQNubtuYGNAsXovOiAtLkSTyMktUaO0qUjY/ok2G/xIeKAQwKLxj5D32VZq95xcKFns+Hq16I
	V2fAMUUpmacU2XsUPKwCwPQ==
X-Received: from wmpx21.prod.google.com ([2002:a05:600c:1895:b0:4a1:83d6:73cc])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:190c:b0:4a0:1723:2d90 with SMTP id 5b1f17b1804b1-4a1800d4278mr40750015e9.4.1791385411517;
 Wed, 07 Oct 2026 08:03:31 -0700 (PDT)
Date: Wed,  7 Oct 2026 16:02:53 +0100
In-Reply-To: <20261007150255.1648849-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20261007150255.1648849-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261007150255.1648849-4-vdonnefort@google.com>
Subject: [PATCH 3/5] drivers/virt: pkvm: Handle a granule larger than
 PAGE_SIZE for MEM_SHARE
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org
Cc: mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_080333_867365_AAE8D9B6 
X-CRM114-Status: GOOD (  15.05  )
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

From: Fuad Tabba <fuad.tabba@linux.dev>

In preparation for allowing protected VMs to run on a system where the
granule is bigger than their PAGE_SIZE, allow the encryption/decryption
callbacks to work with the hypervisor granule increment instead of
PAGE_SIZE.

Reject requests which are not aligned with the granule.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
Co-developed-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c | 42 +++++++------------
 1 file changed, 15 insertions(+), 27 deletions(-)

diff --git a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
index fbcb57c31186..98b1026cf68b 100644
--- a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
+++ b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
@@ -20,35 +20,19 @@
 static size_t __ro_after_init pkvm_granule;
 DEFINE_STATIC_KEY_FALSE_RO(pkvm_guest);
 
-static int arm_smccc_do_one_page(u32 func_id, phys_addr_t phys)
+static int arm_smccc_do_range(u32 func_id, phys_addr_t phys, size_t size)
 {
-	phys_addr_t end = phys + PAGE_SIZE;
+	phys_addr_t end = phys + size;
 
-	while (phys < end) {
+	if (!IS_ALIGNED(phys | size, pkvm_granule))
+		return -EINVAL;
+
+	for (; phys < end; phys += pkvm_granule) {
 		struct arm_smccc_res res;
 
 		arm_smccc_1_1_invoke(func_id, phys, 0, 0, &res);
 		if (res.a0 != SMCCC_RET_SUCCESS)
 			return -EPERM;
-
-		phys += pkvm_granule;
-	}
-
-	return 0;
-}
-
-static int __set_memory_range(u32 func_id, unsigned long start, int numpages)
-{
-	void *addr = (void *)start, *end = addr + numpages * PAGE_SIZE;
-
-	while (addr < end) {
-		int err;
-
-		err = arm_smccc_do_one_page(func_id, virt_to_phys(addr));
-		if (err)
-			return err;
-
-		addr += PAGE_SIZE;
 	}
 
 	return 0;
@@ -56,14 +40,16 @@ static int __set_memory_range(u32 func_id, unsigned long start, int numpages)
 
 static int pkvm_set_memory_encrypted(unsigned long addr, int numpages)
 {
-	return __set_memory_range(ARM_SMCCC_VENDOR_HYP_KVM_MEM_UNSHARE_FUNC_ID,
-				  addr, numpages);
+	return arm_smccc_do_range(ARM_SMCCC_VENDOR_HYP_KVM_MEM_UNSHARE_FUNC_ID,
+				  virt_to_phys((void *)addr),
+				  numpages * PAGE_SIZE);
 }
 
 static int pkvm_set_memory_decrypted(unsigned long addr, int numpages)
 {
-	return __set_memory_range(ARM_SMCCC_VENDOR_HYP_KVM_MEM_SHARE_FUNC_ID,
-				  addr, numpages);
+	return arm_smccc_do_range(ARM_SMCCC_VENDOR_HYP_KVM_MEM_SHARE_FUNC_ID,
+				  virt_to_phys((void *)addr),
+				  numpages * PAGE_SIZE);
 }
 
 static const struct arm64_mem_crypt_ops pkvm_crypt_ops = {
@@ -90,7 +76,7 @@ static int mmio_guard_ioremap_hook(phys_addr_t phys, size_t size,
 	while (phys < end) {
 		const int func_id = ARM_SMCCC_VENDOR_HYP_KVM_MMIO_GUARD_FUNC_ID;
 
-		WARN_ON_ONCE(arm_smccc_do_one_page(func_id, phys));
+		WARN_ON_ONCE(arm_smccc_do_range(func_id, phys, PAGE_SIZE));
 		phys += PAGE_SIZE;
 	}
 
@@ -118,6 +104,8 @@ void __init pkvm_init_hyp_services(void)
 		return;
 
 	pkvm_granule = res.a0;
+	if (pkvm_granule > PAGE_SIZE)
+		pr_info("pKVM: sharing memory in %zu-byte granules\n", pkvm_granule);
 	arm64_mem_crypt_ops_register(&pkvm_crypt_ops);
 
 	if (kvm_arm_hyp_service_available(ARM_SMCCC_KVM_FUNC_MMIO_GUARD))
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


