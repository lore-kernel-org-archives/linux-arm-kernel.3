Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F15BCD3436
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 22:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ua9DP8bxNVeP3OMgw66O02tdFbDSKg07QfaNr/ggdeQ=; b=T/O0KZEdZNNz9zNgsehhuyiEB3
	gBG1+e8L50EfNYpNAn2qlqp2gEg34Z6pJ8KTbUpeQjhi5ZwiBQZxKd/2XWlJErMBmrGWlN6s3fXmz
	S0/BB6fp1GkZ12ikm05+5bro9X8LpzXa2IkvO+R2kYr1ncXhuUoLoydae+VNd03pjJFotUq3ba/e3
	nt8aXpUejEl+q34d973Nk0THrcIyeckc9C6YqBkO8kHLpA78KZROuqjZtuKSbWcmIQ+iKm3sngTkI
	f0Y95XU5mFwJJSMQ6IniLczk9l0FfilTkKbG8a5aF8PxAYDXUmkvI2ts4BhJGewGO6oOvUt6sGbDX
	lIOblXEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK1zu-0000000EVJh-2QWp;
	Mon, 04 May 2026 22:42:42 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK1zs-0000000EVIG-2ioI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 22:42:41 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2b99eb06178so85281495ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 15:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777934559; x=1778539359; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ua9DP8bxNVeP3OMgw66O02tdFbDSKg07QfaNr/ggdeQ=;
        b=QTFlNxeRYjXE2RU6MfmkWWr4feSP99AEAQ+bwf/d7GVLpQ1STCaHcih6VBwpgzjpRV
         348o2BY2EnDhlKcAMsAuGl/epoU0Dt0vt0dXjl+fHSo+DORYzEoUzSGASp+BE2vc09T+
         BmFnsYK2NXsSZ05uTOig0yX/J8+gBOYPSxALcUAmocDTgmupYkCMxLRzIQ+a6H//Ga0B
         ghBLELGvkcGBBKKTGokTXheCRSkMWTvIKQACZRNY+5gd0CnmG2jWXDd8WseHd9Jw0yY5
         9IcDV9KpLWWC/iEr2NG0rBuW2ldYYw3R8hk/HTeE0Yfsd7Hus5NSeEPztLtKXKM4xa5F
         w6Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777934559; x=1778539359;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ua9DP8bxNVeP3OMgw66O02tdFbDSKg07QfaNr/ggdeQ=;
        b=R2IxnfstGIOsoVHhmTVEPwDWUFZ5U67Y3bx2jVC0UHqsN0FNrPQO1/Sn5rG017fQQw
         XkxnZ41GkgnEyKMqWHRBikFyHusUCJs9ghg9xkJzM8HcK1LLTYkefGPmdvq8NeOOfJJF
         2zb/pMmNfxveGjPYoht2LIga5x0vdiiJflsNV6ppDLCfnEwKB38puVt1QGNVZ8L0WtPV
         k9p6ACzaMZnnB41+7mX7kamZo9VGsnOke4bqvZhCjMZ/eKwiN0Wz5AiFEjcp1YJbUm30
         bGeROtMzeIVU2y9YoHTxzVmglI97HxBMBFNVmFsUUzDb1ep1lGN5PfqBVsMNMh46zWCD
         oRZQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Xp1oVzPvDdZZDCgXiQvqF+fswmbczFigrgD7sCadWJslMmjoSlLURmH/qKE/fbA8Yv75rttE+elx9+/UPfX3A@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0UBTIbFgbjX/wBKBugVA/u2rPUBP2ObQtmM3zl2GVxa9/Cni4
	jnB/k3uH9qNYc7pFy1+dPQE7+yktcLX3mC4S0YgimbLxaANfb2lCFpkXp4L+VzZ7SSg/qC5MtCl
	V9jdOJi+uok6KgJafABXnnA==
X-Received: from pgvh2.prod.google.com ([2002:a65:6382:0:b0:c79:81df:1175])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:7e86:b0:3aa:3e4c:9182 with SMTP id adf61e73a8af0-3aa3e4c9385mr220269637.7.1777934558985;
 Mon, 04 May 2026 15:42:38 -0700 (PDT)
Date: Mon,  4 May 2026 22:42:09 +0000
In-Reply-To: <20260504224213.1049426-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20260504224213.1049426-1-jthoughton@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260504224213.1049426-3-jthoughton@google.com>
Subject: [PATCH 2/5] KVM: loongarch: Grab MMU lock in kvm_arch_flush_shadow_all()
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Sean Christopherson <seanjc@google.com>, Gavin Shan <gshan@redhat.com>, 
	Shaoqin Huang <shahuang@redhat.com>, Ricardo Koller <ricarkol@google.com>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, James Hogan <jhogan@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, James Houghton <jthoughton@google.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_154240_689485_7969E0F9 
X-CRM114-Status: GOOD (  11.15  )
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

kvm_arch_flush_shadow_all() may be called concurrently on the same
`kvm`. This could at least result in accounting mistakes (e.g.
underflows on `kvm->stat.*pages`).

Cc: stable@vger.kernel.org
Fixes: 752e2cd7b4fb ("LoongArch: KVM: Implement kvm mmu operations")
Signed-off-by: James Houghton <jthoughton@google.com>
---
Note: This is compile-tested only!

 arch/loongarch/kvm/mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/kvm/mmu.c b/arch/loongarch/kvm/mmu.c
index a7fa458e3360..5dbce9b18e1c 100644
--- a/arch/loongarch/kvm/mmu.c
+++ b/arch/loongarch/kvm/mmu.c
@@ -486,7 +486,7 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
 
 void kvm_arch_flush_shadow_all(struct kvm *kvm)
 {
-	kvm_flush_range(kvm, 0, kvm->arch.gpa_size >> PAGE_SHIFT, 0);
+	kvm_flush_range(kvm, 0, kvm->arch.gpa_size >> PAGE_SHIFT, 1);
 }
 
 void kvm_arch_flush_shadow_memslot(struct kvm *kvm, struct kvm_memory_slot *slot)
-- 
2.54.0.545.g6539524ca2-goog


