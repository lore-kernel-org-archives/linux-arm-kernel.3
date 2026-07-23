Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EFB9C531F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 16:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8fLZBrc7U0OaH9gD4/eAb175qJMFqjKMfWGNNQ6QKQA=; b=gcQbXFFrLF7dXd6v3AAmpkK2oo
	Ma/XUQBxUOes7LoFp6cm7QN+UUbb/uQJMhfWhluv0fL0XpZsidK3++B4J2gA1vrn3OdBrBstQk7ad
	bfF9A955Y3HERiN7AQEWDQnjs6E4dheOyw5hNXXhO7N4wcvVPpWJe6pNJGpGDllsZJTvm6tygWxmY
	Tay+9nGKb2aNuKhELrs830MZZ1C7zWGyqghHC+4DVtdXz5uPCBq8PVZ+5vfUmFhgyRjv7gU6Kq/yc
	VJNEbE3WGpAn3G8eClC5x6+vG9RHGzaOBB09O2QGa5ibJhpQisFrGwwk+LIyRrzMkNwlANEFn+MQy
	86SbI+2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmw9i-0000000Ehe1-3rPR;
	Thu, 23 Jul 2026 16:20:18 +0000
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmw9f-0000000Ehd5-2sbJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 16:20:16 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-49561facb1dso7281975e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 09:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784823613; x=1785428413; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8fLZBrc7U0OaH9gD4/eAb175qJMFqjKMfWGNNQ6QKQA=;
        b=S89dXyiknDOf5pcbxFc4RkoyldqB6YOGwBQYOF/cm3OMuNbWD6BRrbg9hKuvtrsmLy
         r2JVXcF334i/ZFkCy4/lqMYRuVviCzmraYEp4kqepFRqFI/3KP8DvZiVEG1iRqTBFgvU
         uHTpBn40SejPBcGLX80mQGE6S6YrCNBG5q1aoYQ7+9cvqgLC8FMP0a+8CVmlrgV5uqQB
         fHA82bc4Yj1rrfSQ5qqAmstrsugQ9dvV2q8iyRMBJImy9v9ito+ApwsnCOZiW94qjNH0
         VeoF4ucIlQdELccWxtbrDeLNgXF//WK/4MsyTS9mfQmaNCqevnWVpxt3TZnpu11URgch
         1lmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784823613; x=1785428413;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8fLZBrc7U0OaH9gD4/eAb175qJMFqjKMfWGNNQ6QKQA=;
        b=jKFRNwa5ENZow+JbRpsqo/G3oT7JilznfmYsCVVy5C+ayuNOZJTanJ5ocGNN7AZthQ
         8XAgTvTDmgRQcL5JW422Z2uRKfHZejzDxkKq3oWkXuddLE1ArgRM4aGlCBPzt6QEV4A7
         KbqA0ThNHvB1C2c3gWuuSpKzbIP3BM7OUExCTp9xSsoCT+yvbK9GgHin/yV0z0PeUGjz
         ika7Vt8fA2XTmr4jBnkTKwbX+ZxXFralcqrjZvVb6+tQySvYu4AI3vbfRfB516By0Sma
         4Eo1n4xIoyU1PW3nXswI74q3eu6gedRNfer59GA8m+U4+d9owhHbjLe7PwTboR39ypN8
         GkOQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrafu2e4yXmiXeC+bBqGgs3vR+yn90f13j4JrEPWUlCSbDdrzsWuvAyz+/P9edmvMZv2FDBmDhz7HCnFgXVOipp@lists.infradead.org
X-Gm-Message-State: AOJu0YyXRhWPH4OH4KCuElMs2zahAx3hC3kvDPk5x5m/STO6yCU9kHRi
	SbejUJ0Qtc1HdJjOclaXb4MnH+GjRLLnN2uWsUkaO+f4NKI9jc9rLMmK6ZdxyOMrnWDDh96vd3k
	mXq7872MXFHp1Hg==
X-Received: from wmnq10.prod.google.com ([2002:a05:600c:2eca:b0:495:5b4a:53f1])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4685:b0:495:63e4:3a91 with SMTP id 5b1f17b1804b1-49573d132f3mr42321645e9.35.1784823612359;
 Thu, 23 Jul 2026 09:20:12 -0700 (PDT)
Date: Thu, 23 Jul 2026 16:20:02 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
Message-ID: <20260723162002.3848054-1-smostafa@google.com>
Subject: [PATCH v3] KVM: arm64: Optimize protected mode with FWB and DIC
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oupton@kernel.org, seiden@linux.ibm.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, vdonnefort@google.com, 
	tabba@google.com, sebastianene@google.com, keirf@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_092015_744704_5DC9D095 
X-CRM114-Status: GOOD (  10.35  )
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

KVM opportunistically enables FWB if supported by the system for guest
VMs, which allows it to elude cache maintenance for data as they are
forced to be cacheable from stage-2.
In that case, __clean_dcache_guest_page() will immediately return.
However in protected mode, before calling __clean_dcache_guest_page()
it loops over the range and fix_map/unmap it, issuing TLB
invalidations, dsb() and isb() unnecessarily.

This can be optimized by returning early if FWB is supported,
kvm_pgtable_stage2_map() already issues dsb() and tlb invalidation
functions issue dsb() for the unmap path.

Similarly for DIC, we can omit the call in
invalidate_icache_guest_page()

No isb() needed as ERET is context synchronization event.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 4e329e39a695..39aa8911f62c 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -261,11 +261,18 @@ static void __apply_guest_page(void *va, size_t size,
 
 static void clean_dcache_guest_page(void *va, size_t size)
 {
+	/* See comment in __clean_dcache_guest_page() */
+	if (cpus_have_final_cap(ARM64_HAS_STAGE2_FWB))
+		return;
+
 	__apply_guest_page(va, size, __clean_dcache_guest_page);
 }
 
 static void invalidate_icache_guest_page(void *va, size_t size)
 {
+	if (alternative_has_cap_unlikely(ARM64_HAS_CACHE_DIC))
+		return;
+
 	__apply_guest_page(va, size, __invalidate_icache_guest_page);
 }
 
-- 
2.55.0.229.g6434b31f56-goog


