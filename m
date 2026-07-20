Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE2F0C44529
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 20:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LA6BVqbIhEwIMVMXHgwJu8nqjN0TgDEofdIQtGf4DJQ=; b=S4PkNe5yRCBEUPXsUT7pUPQ8t9
	oX+5bYqVbGhaTGlzwyKBJYZTzMPTeaoWcy2rl5sInd+ug2DuLnrkZ7YVG0YH1nL7iu6F7phiYOob7
	Veix7Y6Hm5PAm8IJ9LZCF44090ZOi7rPO7po2Gaxj24AbsOUm1WN+AQC5ZXrAwOzEFdx16J7QCqD4
	3S/z2c01GEIsLSQU2x0RgujHkZzSldsj0S9lPOk+2pUvh3NKj6plnq440KvYtajaDwlcbH+7DCVOQ
	qA1RxYXXJcCMUjCIh8/Ud20QrBxdtEudW8wS8kG34wQWtFPc+esxPNpHL0VCS49uTMipb3IDuQ/Oc
	0H3RTvPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wluiA-00000007sam-322X;
	Mon, 20 Jul 2026 20:35:38 +0000
Received: from mail-wr1-x447.google.com ([2a00:1450:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlui8-00000007saJ-36Mm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 20:35:38 +0000
Received: by mail-wr1-x447.google.com with SMTP id ffacd0b85a97d-472c330e555so5143246f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 13:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784579733; x=1785184533; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LA6BVqbIhEwIMVMXHgwJu8nqjN0TgDEofdIQtGf4DJQ=;
        b=sPguIAmq7sKzVlKPiGSnkhO1TpsC+ms5lKF0EXYWu+e5BIxBPdeumzzZJeAzrFekNX
         7McWko54aR+G1mbsbbRH451ueBHFzk/vhmF2V/N+e0tZ7uZC7ER4V1xVgHoQ8+VDufeY
         L3enyj1ZUo8Ysy82o61cWy06HZVpYBgEqy+DxPMv0bGsuKI25Os1a88IxXYDtwMp/QU9
         ekjzDy2c7jNW7EnbB7SAgS7FJM5GjxVTZ42mHXbeq8Ip+9cu3ARzwFSRR4i9bUI0Yxah
         SWnkJaHUD2XimvVsSRyJjyM/wBaPGaFPi3z3yx3F5DCzAAcELch4R7tA0D6Fe4bEjzYB
         acqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784579733; x=1785184533;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LA6BVqbIhEwIMVMXHgwJu8nqjN0TgDEofdIQtGf4DJQ=;
        b=G6ob67F5Kpk4YPiA3ITdKTOwGVnslTRXJWLYsMyMX1anm7B1NpHJ2hCf2GTxepoNkT
         MkLuStJItE/qmoUVir07tSpUmPTiMwN3iRH0Iw/pwKybrdwREBcXHrE0UrlbEUwGk9De
         UdMRaGeV7k04lIHd8Y7hQXMFCmweNUFJm0UC5Y4W4m29v7R8lb9uGQjRaZhAJFZLKENO
         QNKIMe+WJpwLOS7Undk+jekAPDAZEs5v1uKcpkLKxETwomHxj7nTQbbilDSQzxhaOeXm
         N9Fc2/qIbHs62YN1mqSHRwGv6uRKFRJO0L2FHXSdWPp58vDizgb6zJouOq+MnhXUXzjF
         XDmA==
X-Forwarded-Encrypted: i=1; AHgh+RoU2I1RViG+jvPe7BAE1kSeNUlJbbNA9OUC8kz8GDDAQk57r4sR+AOUyCEbH5cEyR46vCy6LoXNBJY89SNKn1rj@lists.infradead.org
X-Gm-Message-State: AOJu0YyX6iLDgW6d/dJTDFJ7oJzasFJLGBbUcqCBsdQzsl5dSP3IYcUq
	lqJwAOrvtQwsLJ6RthvT144RxWMPVlGBF3kwzngYm5dq01ZxanO4wTT68x0ZY8ZHhSlqh6HGBa4
	qDpQdLoPQt1GlEg==
X-Received: from wmpi31.prod.google.com ([2002:a05:600c:4b1f:b0:489:1b01:386f])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:310e:b0:495:52dc:73a1 with SMTP id 5b1f17b1804b1-49552dc776bmr119110015e9.29.1784579732667;
 Mon, 20 Jul 2026 13:35:32 -0700 (PDT)
Date: Mon, 20 Jul 2026 20:35:29 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
Message-ID: <20260720203529.1276355-1-smostafa@google.com>
Subject: [PATCH] KVM: arm64: Optimize protected mode and FWB
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
X-CRM114-CacheID: sfid-20260720_133536_788291_A2EE1777 
X-CRM114-Status: GOOD (  10.64  )
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

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 4e329e39a695..6e9229106a25 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -261,6 +261,10 @@ static void __apply_guest_page(void *va, size_t size,
 
 static void clean_dcache_guest_page(void *va, size_t size)
 {
+	/* See __clean_dcache_guest_page() */
+	if (cpus_have_final_cap(ARM64_HAS_STAGE2_FWB))
+		return;
+
 	__apply_guest_page(va, size, __clean_dcache_guest_page);
 }
 
-- 
2.55.0.229.g6434b31f56-goog


