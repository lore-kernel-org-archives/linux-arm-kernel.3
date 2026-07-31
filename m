Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C842C54F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 14:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qKOwBg8VjRp3KcPnvImzU2H7TkPNw/D0Sb8YPOClQWM=; b=fP3jjcDnTqnrcGJzcz5ByeNqwD
	0cd83OjaPehTzWR2hbFcEw+Z+4GtKUvRxZImZ8fhkLSsP3RI0MHAEq7F2/5rhzfxpNPvJdipqZ8s2
	WwmYleiervhN3YXKrJRE3wpaRKUq0Lln+GOc5GRFJNbFWQ3xqCG7ZP2NKTCWVHa3HGua55wkC8hsV
	w73PA2CSJKUnp28ep0zQgJmQze/1NvYvZf81Pqnez0oJ2H6WRTT+t3HYzEkRRT0LUiiOqnzig7HJ2
	Fw+zsSjKcAKtUw6KGdsJvMt4ozKUDXRG33rGcRt3cLOphlyNELQ5TzkO8W6u8ybglaDvnq3d8cHax
	v6QBKsCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoLA-0000000CjSb-1vQ2;
	Fri, 31 Jul 2026 14:36:00 +0000
Received: from mail-ej1-x647.google.com ([2a00:1450:4864:20::647])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoL8-0000000CjR0-2Vz7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 14:35:59 +0000
Received: by mail-ej1-x647.google.com with SMTP id a640c23a62f3a-c15cec1ccb6so103280566b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 07:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785508556; x=1786113356; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qKOwBg8VjRp3KcPnvImzU2H7TkPNw/D0Sb8YPOClQWM=;
        b=gt0UxLGHgLg7kXsMTHs33pbdwgRO4b0+OZG7KBOXzsR1W5yM/inAPLRqZc7MI3q3qt
         Sf3II4nNkcxxQqyAJ2d36OZAeMrDNfxKD2HV3FGqTTYpWfW9I8KL5NFRSKMtV3PoMd8G
         LrjpuSNbA+jHB+yQiYufMwRUFVTvCCboAeRxulwPkyyk7Dtu0yTsPUPq/lrtxJ0mFCQb
         LwzBbI+ChibTL83ClIVTHBYZjsM+XoSrzvUnDXOybSWpmc7Q3O7e3GSnoGZbhWS9Lr2T
         B32MxT1UCxtkjWWAWVZ/vt8M81Q9p+44G2FriVpwZoPBqm8h7Ob9mB3SKiF3nOjOXMgg
         yQYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785508556; x=1786113356;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qKOwBg8VjRp3KcPnvImzU2H7TkPNw/D0Sb8YPOClQWM=;
        b=KHTzeBJtvGVl07eadYf6etF0gXMADWv21Pcd6FCMkCa19N9jcAH08JRaYgmwJBibGG
         Ao5HKwwc4KXEwRRgylU8saVfboV+0O/Ji6L4ZVgd05mjZL5N3+Ide+8JhvjI8b0WNIVZ
         PgJnKLOv+YUwVJOm3BGMBzGuTn3m8J5LYlCc22yDgKbt7rJ7aXVWa2dtR+WWb2aUn0cj
         exDNV2YBQKWUKCfxQk6fgDFnx97GQU64sURsYPiEnSQtJllBSszMLv82UTfYIk4qocOl
         K0FvZHEK/kdJy2kx4x684079A03FA1V/OuinnGgBnnqqg29x7teQRGAv/4HZB5nN29Qa
         9HmQ==
X-Forwarded-Encrypted: i=1; AHgh+RrWVRRcvmOqiRQpIJG5aT2DoCrXQUM2mv8A87KbAhcA2kG1oeezFlcWI5IDx9a+XHyDPIHa4rt9FklZW5eml9L+@lists.infradead.org
X-Gm-Message-State: AOJu0YwWx6aaH7nW+g2MM74/h8T/uAb+cTAxW2YXJKh8BdnhSJ5UnfJW
	QnqRZ9eqBDaKbLxhDPBSYUiQAkN6FXa+j3oJLoyQXir0Xb+Kvzfmh1/Q/c0HmKfEVAoahYTI/Lj
	joRxG2ZyWLtzYD0S6F2ykjQ==
X-Received: from wmcq19.prod.google.com ([2002:a05:600c:c113:b0:495:3f99:8463])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:fe05:b0:c16:19fc:9976 with SMTP id a640c23a62f3a-c1fd26d6344mr149012766b.53.1785508555746;
 Fri, 31 Jul 2026 07:35:55 -0700 (PDT)
Date: Fri, 31 Jul 2026 15:35:25 +0100
In-Reply-To: <20260731143541.956291-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260731143541.956291-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260731143541.956291-2-vdonnefort@google.com>
Subject: [PATCH v4 01/17] KVM: arm64: Add pkvm_private_va_range_pa
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_073558_652711_09782938 
X-CRM114-Status: UNSURE (   9.63  )
X-CRM114-Notice: Please train this message.
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

Mappings in the pKVM private range are not identity mapped, making the
standard __hyp_pa() unsuitable for translating these addresses.

Introduce pkvm_private_va_range_pa() to resolve physical addresses for
this range by walking the hypervisor page-table. This will be useful for
the upcoming pKVM heap allocator.

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mm.h b/arch/arm64/kvm/hyp/include/nvhe/mm.h
index 6e83ce35c2f2..85f1e3c711d9 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mm.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mm.h
@@ -30,5 +30,6 @@ int __pkvm_create_private_mapping(phys_addr_t phys, size_t size,
 				  unsigned long *haddr);
 int pkvm_create_stack(phys_addr_t phys, unsigned long *haddr);
 int pkvm_alloc_private_va_range(size_t size, unsigned long *haddr);
+phys_addr_t pkvm_private_va_range_pa(void *va);
 
 #endif /* __KVM_HYP_MM_H */
diff --git a/arch/arm64/kvm/hyp/include/nvhe/spinlock.h b/arch/arm64/kvm/hyp/include/nvhe/spinlock.h
index 7c7ea8c55405..260e14d6d200 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/spinlock.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/spinlock.h
@@ -17,6 +17,8 @@
 #include <asm/lse.h>
 #include <asm/rwonce.h>
 
+#include <linux/cleanup.h>
+
 typedef union hyp_spinlock {
 	u32	__val;
 	struct {
@@ -122,4 +124,6 @@ static inline void hyp_assert_lock_held(hyp_spinlock_t *lock)
 static inline void hyp_assert_lock_held(hyp_spinlock_t *lock) { }
 #endif
 
+DEFINE_LOCK_GUARD_1(hyp_spinlock, hyp_spinlock_t, hyp_spin_lock(_T->lock),
+		    hyp_spin_unlock(_T->lock))
 #endif /* __ARM64_KVM_NVHE_SPINLOCK_H__ */
diff --git a/arch/arm64/kvm/hyp/nvhe/mm.c b/arch/arm64/kvm/hyp/nvhe/mm.c
index 3b0bee496bff..755630c0d15e 100644
--- a/arch/arm64/kvm/hyp/nvhe/mm.c
+++ b/arch/arm64/kvm/hyp/nvhe/mm.c
@@ -90,6 +90,24 @@ int pkvm_alloc_private_va_range(size_t size, unsigned long *haddr)
 	return ret;
 }
 
+/**
+ * pkvm_private_va_range_pa - Translate a private VA to a physical address.
+ * @va:		The private virtual address to translate.
+ *
+ * Return: The physical address corresponding to @va.
+ */
+phys_addr_t pkvm_private_va_range_pa(void *va)
+{
+	kvm_pte_t pte;
+	s8 level;
+
+	guard(hyp_spinlock)(&pkvm_pgd_lock);
+	WARN_ON(kvm_pgtable_get_leaf(&pkvm_pgtable, (u64)va, &pte, &level));
+	WARN_ON(!kvm_pte_valid(pte));
+
+	return kvm_pte_to_phys(pte) + ((u64)va & (kvm_granule_size(level) - 1));
+}
+
 int __pkvm_create_private_mapping(phys_addr_t phys, size_t size,
 				  enum kvm_pgtable_prot prot,
 				  unsigned long *haddr)
-- 
2.55.0.508.g3f0d502094-goog


