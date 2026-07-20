Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82BE9C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 17:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n84aHT6T0oE5lzqBHFQym45G2HUtzO8AvZXDSFiZelQ=; b=vjYSe+tNtqLMZF7ZDf0U8uybyu
	hCdFJM+P4AR+pAlffzKO3MTPrCXahbu6KEXg/ULGjYxWMWDrZ9LcZPVWN2DE5Zbt7BYO1FdBOuXGe
	GT2KVwhuHro5KnCY/mxwgj2pJvj3wzm+E/J+F4xh5hbTazSg7QFAsCQMU4Er/70vIeoCs2jvJGoRf
	YPJS9j7A3r6BLnAMiajLqSE2snf05dih6Uht6Dw+WR1un0+O0HIDMCxUxxvuKlt/tkge5r+NlDP+7
	eXVSCNEab9BAS41+DFyp+6Di/C2QV43gqn2pjMmFOwVFzHmLdt8OCbw9h+w7rHQdPXUCdJZtSj2ad
	75bAb46A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrab-00000007Usv-1ilS;
	Mon, 20 Jul 2026 17:15:37 +0000
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlraQ-00000007Uih-1Nlf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 17:15:27 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-49560dddaa4so5634765e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 10:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784567722; x=1785172522; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n84aHT6T0oE5lzqBHFQym45G2HUtzO8AvZXDSFiZelQ=;
        b=uG+noj78iEoA5U9N4b0UZJrALojU67r9O7ZzMDVnHZ1UEyRhjavOAAl7b6sM8YqGkC
         T4GNPreRj2fVrIw4nRlT4kjQazC7lAV5Gv9QD+x3uMUuchtEyxUTmIY7C5+Wq1LAwj1X
         sNJw/qNbLm38CCsuWXvA6JC/QnV3xT71M09d02KsPSn1emFYCcE2VRN95EmEOS926hO9
         AE+2eGxWtov0Cr7jTmQ7/IRJvjTnllkNeRRbgkFXZ5mG1VNBpGHjwpypPg6EyngVlVXx
         u3/hbowQA2N1C6aLd5jSt/HlSNIptDqo2gnRUku3YRUyihVzRRiP2igjg1eHzyXvOpE5
         t7Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784567722; x=1785172522;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n84aHT6T0oE5lzqBHFQym45G2HUtzO8AvZXDSFiZelQ=;
        b=hrDelMQDXlVTQ9mDbSNMy3NEmVJCa0K9AZki2R0Am7A0mcTc4U1J1GBHnUsGUSh0Ai
         3mWnX9Z8Vuxs0chlynTCNFaH1tVHQVZl4IfpgTiftcN+ZcwQpsAe97JENabPKXRClQNC
         xIbqZ7nzgf4yKr0oiCgy7PB/1p8hJ7BffXs/yUcd97kO7D6YoaIW8GGJ2GYHUBnCJ3gn
         VoaHsy28EaTa6HZV25CcSa/KIhBhcxZiGhMlM0PX0s/OArz2qQpajCk7vCcGB950Pxav
         nzL7F9lJZTwgRKb0HJbLSQ1g0SnoRrsCsScZjjcDikLzTPWKE89eoBcsDUluPhDn+03h
         39hg==
X-Forwarded-Encrypted: i=1; AHgh+Rr9G2rmJWxwRf2XmtrTsT6Cq1Yz4ylQpqlKQASXwf4vWJdSAqgIn0x8GCtuXejpylDa44JCqrjld97Yw1cGN8HQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8CgZRm4EFfMXk0sqyfX/otWSNdpf1BbFqqHhcELeU6Sld5bvr
	eUOUo7qQe1QLs2FI1KGuzx4S8LJHQDPXBt7jBV+CQibT9HctAqGYS8xfQ1x6lYLf41OBegMt0Ia
	ES0rv/uVJYxAi7iU2HBdllA==
X-Received: from wmix23-n2.prod.google.com ([2002:a05:600c:e557:20b0:495:549c:80ad])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c16:b0:495:5022:71b9 with SMTP id 5b1f17b1804b1-495502272f2mr148937275e9.33.1784567721456;
 Mon, 20 Jul 2026 10:15:21 -0700 (PDT)
Date: Mon, 20 Jul 2026 18:14:59 +0100
In-Reply-To: <20260720171513.1415357-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260720171513.1415357-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
Message-ID: <20260720171513.1415357-4-vdonnefort@google.com>
Subject: [PATCH v3 03/17] KVM: arm64: Add pkvm_map_private_va_range
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, tabba@google.com, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_101526_388253_B2D5F422 
X-CRM114-Status: GOOD (  10.95  )
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

In preparation for the pKVM heap allocator, introduce
pkvm_map_private_va_range() to map a physical range into the pKVM
private range.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mm.h b/arch/arm64/kvm/hyp/include/nvhe/mm.h
index 00cadd13ee5d..ea97ea49820e 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mm.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mm.h
@@ -31,6 +31,7 @@ int __pkvm_create_private_mapping(phys_addr_t phys, size_t size,
 				  unsigned long *haddr);
 int pkvm_create_stack(phys_addr_t phys, unsigned long *haddr);
 int pkvm_alloc_private_va_range(size_t size, unsigned long *haddr);
+int pkvm_map_private_va_range(void *haddr, phys_addr_t phys, size_t size);
 phys_addr_t pkvm_private_va_range_pa(void *va);
 
 #endif /* __KVM_HYP_MM_H */
diff --git a/arch/arm64/kvm/hyp/nvhe/mm.c b/arch/arm64/kvm/hyp/nvhe/mm.c
index 5cd2f1fe51e4..20e4445dd57b 100644
--- a/arch/arm64/kvm/hyp/nvhe/mm.c
+++ b/arch/arm64/kvm/hyp/nvhe/mm.c
@@ -25,6 +25,7 @@ struct memblock_region hyp_memory[HYP_MEMBLOCK_REGIONS];
 unsigned int hyp_memblock_nr;
 
 static u64 __io_map_base;
+static u64 __hyp_private_va_start;
 
 struct hyp_fixmap_slot {
 	u64 addr;
@@ -90,6 +91,31 @@ int pkvm_alloc_private_va_range(size_t size, unsigned long *haddr)
 	return ret;
 }
 
+/**
+ * pkvm_map_private_va_range() - Map a physical range into the private VA range
+ * @haddr:	The virtual address in the private range.
+ * @phys:	The physical address to map.
+ * @size:	The size of the range to map.
+ *
+ * The hypervisor VA @haddr must have been first allocated with pkvm_alloc_private_va_range()
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int pkvm_map_private_va_range(void *haddr, phys_addr_t phys, size_t size)
+{
+	unsigned long addr = (unsigned long)haddr;
+
+	if (!PAGE_ALIGNED(addr | phys | size))
+		return -EINVAL;
+
+	guard(hyp_spinlock)(&pkvm_pgd_lock);
+
+	if (addr < __hyp_private_va_start || addr + size > __io_map_base)
+		return -EINVAL;
+
+	return kvm_pgtable_hyp_map(&pkvm_pgtable, addr, size, phys, PAGE_HYP);
+}
+
 phys_addr_t pkvm_private_va_range_pa(void *va)
 {
 	kvm_pte_t pte = 0;
@@ -450,6 +476,7 @@ int hyp_create_idmap(u32 hyp_va_bits)
 	 */
 	__io_map_base = start & BIT(hyp_va_bits - 2);
 	__io_map_base ^= BIT(hyp_va_bits - 2);
+	__hyp_private_va_start = __io_map_base;
 	__hyp_vmemmap = __io_map_base | BIT(hyp_va_bits - 3);
 
 	return __pkvm_create_mappings(start, end - start, start, PAGE_HYP_EXEC);
-- 
2.55.0.229.g6434b31f56-goog


