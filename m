Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDFE4C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 11:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=azWhDzZbtoxtjhQWlpXB32XSGr+Msg3K3f2k/5PFntI=; b=3lONO35D1bUk679BHuptCoRvrv
	lzo3zktPBGLSF9SqOOn5yxohQibpdlP5AE6VMSvU46JbQjvD7ihn0kVptcqwEl3kplQZ8q4kHUMhP
	vhoIMiUAMd/t7XyI35V0S8mw7gvpVmDtd5ngM2RWCUz5EKhNXZLM16IDOYUnJUIrz/dwP5LKLP8vS
	t3+iMuou565/F/AR34bOaYcr8fio0kCmxqcYNHoRmOAnnxP8NIfIMul2ushzWXvINpoi+3/7WxnGz
	fyxtRzFgPg4qmmLNBUQ4pxbsBJJN9mzmZ7d7CB+IVkmlMCyMKDZrq2kGzG8ADOcVq0Ua0E4L5aIUj
	tvK6G4UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9CJ-0000000AkW4-2E4j;
	Thu, 06 Mar 2025 11:15:27 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq8yO-0000000Aib7-0Seq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 11:01:05 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4393e89e910so2294805e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 03:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741258862; x=1741863662; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=azWhDzZbtoxtjhQWlpXB32XSGr+Msg3K3f2k/5PFntI=;
        b=Lw/P58vb0FYEFB7JgDf8Ag65ivkWljANDj7dBsjmczvF8qqhpDImA2MpUOWAhgWuaq
         HJMVbkaEVT/lpO+1H+eAgsrfrlsbeIyv9h7cOuciv2dhO5LhswY+16iNLv3w0V58YfLy
         ojVSGce/0S/0/ztKt3K4c8SKv9GdMD/RJMLVeVkRsVMi65hBkdFRLtb64dZVVGPa8Qrz
         8IrrIqKgAsE1JuS6IWt1VRjkKY9k/XL5SauUcE76TalT//gz1elMAXYO9stVswamENQl
         qtdjCNSbwnTZcsIo/eiwfjcQMVkCujTSXaDjaEhOXr/xwqbIiaCubM8uHPMvU06NRy+u
         Rcfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741258862; x=1741863662;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=azWhDzZbtoxtjhQWlpXB32XSGr+Msg3K3f2k/5PFntI=;
        b=lQrDwnM+IkbVbq7DzAEeOZsBLWP3U+gZFOtttVp7R/FxnHzNuEx6p7rPXrSqUj9nMP
         j0AKqKe8SEyET2YEYsGmavpK0k6lUmp50CDfX7FZT+XZVYtMrSCbiZkO0IAPz2OegqY+
         2hMsgXhrxcS2dH5wzy8NdgjG76vhyvbsWqI12nPkr7IFC2aOd9zKw7DOoQBp8X0mSEzV
         c73RCJzhkx8sMOMmO7RQulaklpR7F14O9m3FG55S1LvIFbQa7cezqiE7sggcdzdBnNpF
         J8myb7LFpPHkPaMgeX/qmtbo941ljBBCtuVz7RSYGRwNSa4+uTVM5/Zeze1eGeDdRwuC
         BD7w==
X-Forwarded-Encrypted: i=1; AJvYcCXTmeAOK/LXmqROsHjG0owNHwCQz3UhrnVj9Wv8s45G85AQUL2bKo58xAubL5TTA2oA5bSZIr6JMCP94TGczgKm@lists.infradead.org
X-Gm-Message-State: AOJu0YydolPmUY91AGpy7ARXSBhTD032ikLh6EE7IHIVlL73Y1x/7FIF
	6edmL7+YJkS1ISgahAO/u9StwIm16JNE54MzBNnmhHb2J0jgk6sCIQMIai2yiGYVk0X5G0qSDl1
	x87cp+wbZPAKsuZDi0Q==
X-Google-Smtp-Source: AGHT+IHaLhB8g0ea9IzCe71YUfuaamK20WvX24Cg501MmU1HL29IV3XbEohWkl/ds2ZX3TqbOYoDRDMXlJjEcXa3
X-Received: from wmbeb18.prod.google.com ([2002:a05:600c:6792:b0:43b:c205:3a80])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4450:b0:439:98ca:e390 with SMTP id 5b1f17b1804b1-43bd2af45eamr50778475e9.27.1741258862389;
 Thu, 06 Mar 2025 03:01:02 -0800 (PST)
Date: Thu,  6 Mar 2025 11:00:37 +0000
In-Reply-To: <20250306110038.3733649-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250306110038.3733649-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250306110038.3733649-9-vdonnefort@google.com>
Subject: [PATCH v2 8/9] KVM: arm64: Stage-2 huge mappings for np-guests
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_030104_164508_03B7CF2A 
X-CRM114-Status: UNSURE (   9.57  )
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

Now np-guests hypercalls with range are supported, we can let the
hypervisor to install block mappings whenever the Stage-1 allows it,
that is when backed by either Hugetlbfs or THPs. The size of those block
mappings is limited to PMD_SIZE.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 61bf26a911e6..b7a995a1d70b 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -167,7 +167,7 @@ int kvm_host_prepare_stage2(void *pgt_pool_base)
 static bool guest_stage2_force_pte_cb(u64 addr, u64 end,
 				      enum kvm_pgtable_prot prot)
 {
-	return true;
+	return false;
 }
 
 static void *guest_s2_zalloc_pages_exact(size_t size)
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 1f55b0c7b11d..3143f3b52c93 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1525,7 +1525,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	 * logging_active is guaranteed to never be true for VM_PFNMAP
 	 * memslots.
 	 */
-	if (logging_active || is_protected_kvm_enabled()) {
+	if (logging_active) {
 		force_pte = true;
 		vma_shift = PAGE_SHIFT;
 	} else {
@@ -1535,7 +1535,8 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	switch (vma_shift) {
 #ifndef __PAGETABLE_PMD_FOLDED
 	case PUD_SHIFT:
-		if (fault_supports_stage2_huge_mapping(memslot, hva, PUD_SIZE))
+		if (is_protected_kvm_enabled() ||
+		    fault_supports_stage2_huge_mapping(memslot, hva, PUD_SIZE))
 			break;
 		fallthrough;
 #endif
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 9c9833f27fe3..b40bcdb1814d 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -342,7 +342,7 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
 	u64 pfn = phys >> PAGE_SHIFT;
 	int ret;
 
-	if (size != PAGE_SIZE)
+	if (size != PAGE_SIZE && size != PMD_SIZE)
 		return -EINVAL;
 
 	lockdep_assert_held_write(&kvm->mmu_lock);
-- 
2.48.1.711.g2feabab25a-goog


