Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D26C87FD8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 19:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZeRx7vP/138KQFxr0SX14a6MVSvUsa68vsZQFRiGNJw=; b=rkuV+fT+qCUQ5X/PkF5yUeHja5
	13zNWQMvCev6cWwfsCuE0AX7oPcs3wsbREtn15zyKhNbRuRiXaSFTNCycByOdtTqNaIhptZSw3vFw
	RVm29lfJqLWbMZe2kH5AlrfxHssxFnBLlUCZqL8mGYOAwDfEXVSa1t0/ERNHkYbrYGjrp9Yu3DdSs
	0jQw0JNXgvLUMv7PVQS7Uyh8auBfve1+iaeoKhxbNVnQJPT4kFMejJ/zQjUdRiO/h4g668g4NSL9E
	Sz5cAvCrm7Zrf8FKoMWce4GjW0Mij+D2+CivSgyhST//I61GSqEPXprYahwaBdGGv4cDbRvEPpMhr
	lhp/s7Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugTib-0000000FHm4-0zmh;
	Mon, 28 Jul 2025 19:41:05 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugS2X-0000000F8q5-1pRY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 17:53:34 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4538f375e86so36587065e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 10:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753725211; x=1754330011; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZeRx7vP/138KQFxr0SX14a6MVSvUsa68vsZQFRiGNJw=;
        b=ZgoopMys75s530wRnLOU9uUi0g/uoyVpI+AUx8WhCzcTYxeA4rGyECpQuw2JPO1IPK
         95FbeU4/BchWW752CoyRoomvKJ08tPYiTdcJ7tx2CBHKEJBFlBT8HAywb1gaDCMAzQDF
         Vlx6dujBYQi0L6PHaVjt6m+HyzMGqNzw5y2PxSx2qf1koYBuqa9xAY11YT7363wkVU8p
         kz55669ge7uElxNTVq0IyVaQE14tFJX/luw5NL1U6E7IbwIBxO0uJD8XLVGLLYnhzUv0
         Iju8RMRJEqzIu2sNa7GTlMSUiq7CciCecw+Yg0nqf9axbHT+evQQNxUNd798tQ08DP+2
         nAMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753725211; x=1754330011;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZeRx7vP/138KQFxr0SX14a6MVSvUsa68vsZQFRiGNJw=;
        b=PxSJeqH8LRLg8P80rrfAFYxmegPwetfD4YHLh9xK7a6KUbrjWPRKAtWupOltQIQhvM
         O9AlToJ7negkEC7yGkqdISwtcFrB1oLkxTcTYYIajKxz1LzDpu98xcO6DnVdZNAsK/qz
         Kc1ToyRazP3YCsy5wkB2JVHolTOqxgeMch+vPtsmx8oo76MnRth8CHuKDf/Tiqe/5FyZ
         7+TOPgMqau1jYF6fBGjga5yQC/NsAJKyrxt3YqMCtkvmOqKLiHlEK8SX4dz5jxo7C7A5
         BDHpu79DiNybtiBvwL2AvIrRQkIuYOrFb+7pQEwSzNVyIKaxEk6GE7H7DjM4+xuTygvP
         qLCw==
X-Forwarded-Encrypted: i=1; AJvYcCUN+TCdPvcL48lpcJ2/LEAxfNoFLKndMtzzmBHXfZsnANVm5wK/D4zaWI7HiLt7cVZ06r9qtFwLOvm0M2ET+foI@lists.infradead.org
X-Gm-Message-State: AOJu0YyuzicEwnfxIBbgzH3e0ijxasbzHlTp5/zB0ajfWwjPdC/0W0k1
	eFJ+5i/67hIyObzt/0dxjDEpRFq+QlRBPkQ2N+SNun0/no84egGYl5jokpCfoD57XMIVeRmTZlV
	VzHL9HllgGxgtIA==
X-Google-Smtp-Source: AGHT+IE1QKRH8xd41th/Qwnod5XKPsVgVqg7Mv68PdXhnIKZKddzbjKbt+QRa+9zTDVfDxi6tBL2YQdZsrDI2Q==
X-Received: from wmsp14.prod.google.com ([2002:a05:600c:1d8e:b0:456:c7c:3165])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:138c:b0:456:58e:318e with SMTP id 5b1f17b1804b1-458852534ecmr52353185e9.30.1753725211674;
 Mon, 28 Jul 2025 10:53:31 -0700 (PDT)
Date: Mon, 28 Jul 2025 17:52:48 +0000
In-Reply-To: <20250728175316.3706196-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250728175316.3706196-1-smostafa@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250728175316.3706196-2-smostafa@google.com>
Subject: [PATCH v3 01/29] KVM: arm64: Add a new function to donate memory with prot
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, robin.murphy@arm.com, jean-philippe@linaro.org, 
	qperret@google.com, tabba@google.com, jgg@ziepe.ca, mark.rutland@arm.com, 
	praan@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_105333_479555_47ACD341 
X-CRM114-Status: GOOD (  11.65  )
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

Soon, IOMMU drivers running in the hypervisor might interact with
non-coherent devices, so it needs a mechanism to map memory as
non cacheable.
Add ___pkvm_host_donate_hyp() which accepts a new argument for prot,
so the driver can add KVM_PGTABLE_PROT_NORMAL_NC.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  1 +
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 11 +++++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index 5f9d56754e39..52d7ee91e18c 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -36,6 +36,7 @@ int __pkvm_prot_finalize(void);
 int __pkvm_host_share_hyp(u64 pfn);
 int __pkvm_host_unshare_hyp(u64 pfn);
 int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages);
+int ___pkvm_host_donate_hyp(u64 pfn, u64 nr_pages, enum kvm_pgtable_prot prot);
 int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages);
 int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages);
 int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 8957734d6183..861e448183fd 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -769,13 +769,15 @@ int __pkvm_host_unshare_hyp(u64 pfn)
 	return ret;
 }
 
-int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages)
+int ___pkvm_host_donate_hyp(u64 pfn, u64 nr_pages, enum kvm_pgtable_prot prot)
 {
 	u64 phys = hyp_pfn_to_phys(pfn);
 	u64 size = PAGE_SIZE * nr_pages;
 	void *virt = __hyp_va(phys);
 	int ret;
 
+	WARN_ON(prot & KVM_PGTABLE_PROT_X);
+
 	host_lock_component();
 	hyp_lock_component();
 
@@ -787,7 +789,7 @@ int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages)
 		goto unlock;
 
 	__hyp_set_page_state_range(phys, size, PKVM_PAGE_OWNED);
-	WARN_ON(pkvm_create_mappings_locked(virt, virt + size, PAGE_HYP));
+	WARN_ON(pkvm_create_mappings_locked(virt, virt + size, prot));
 	WARN_ON(host_stage2_set_owner_locked(phys, size, PKVM_ID_HYP));
 
 unlock:
@@ -797,6 +799,11 @@ int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages)
 	return ret;
 }
 
+int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages)
+{
+	return ___pkvm_host_donate_hyp(pfn, nr_pages, PAGE_HYP);
+}
+
 int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages)
 {
 	u64 phys = hyp_pfn_to_phys(pfn);
-- 
2.50.1.552.g942d659e1b-goog


