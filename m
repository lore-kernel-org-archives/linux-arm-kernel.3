Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8DC5C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 11:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pOQy/PNkKkoEowxNbThyv2leDUZfqMcfcwikaBspss8=; b=wfp4NnYYZHPpDHFLJ75FkwOpuA
	JCDeSL0WMLBnbrsgmTwNnZiWZab5ReHH55RbL1IuPo2XgdSfIeeX6UYGTf8JFXsoqOL3JS/1qiwau
	yT+Kx9l14UyfmfmLo6c9GNKqxQZq0BHDiJuJBplJJhAxfa8eUsJA/b4SZem0H+8ebX8T7vZmWy7x3
	KhaQQm82zYwulZCeur56Da46PbgmG/cmvoYS2YDkQ0OWlleiM82ZImB5os+nAsjTZf89qWUv9LgQA
	SJBh722je6DNlaFwJf80CHScluE9qlhAzNKTJb0PLeqDc3oA1j8OEpTtSM0joBOXq4QPEzrcOEv3S
	x+G+mc4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqW1L-0000000E4aU-1lrM;
	Fri, 07 Mar 2025 11:37:39 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqVy9-0000000E42L-0Tty
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 11:34:22 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43941ad86d4so7975515e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Mar 2025 03:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741347259; x=1741952059; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pOQy/PNkKkoEowxNbThyv2leDUZfqMcfcwikaBspss8=;
        b=bwWrarSj19sZxwnOt5jX8tSHS0a8/43Z/McniOSfPbrpsU9XHhLlDvPnVNsN2vS64J
         PyeDW7I7wsj6DpSExnn4xp4J8gh5qbiXMiLgKCglYvI8c12TXRGXtpClJx7WPvnpoNX0
         WP3m/pDIvQxVTHpKSn9gCB0UpG0EE/Q66kpKBC4W5j9GanG1Be0shsEh1jIjlzGrmiKu
         uSlsuubmkKWDZbAjTKMqec7HH5UcLZZ+h0ceK5zLuCLXbdzqS4okLU3AXHF52ap5Y1xl
         lXbVs7GF4RQ9b38oGeBd51/PGymtbBV7kLC0HETnut++UPTqmz4Rn4gkVaOyU6USIbiz
         01mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741347259; x=1741952059;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pOQy/PNkKkoEowxNbThyv2leDUZfqMcfcwikaBspss8=;
        b=UwwEJcoF9aA2iXnh7Uukuiu2pXHJ1A7weNbtaBDd9v4UaPbNRCsM4kN35b9NJAsF/Z
         z8Ct/xG+7vg/ye5xSp5CcmMXjzlse0X8HoCcAq34HsoNfU1+XoX1e7tdM1xO077iWgI1
         gwL5T1eDvJRF9QRQ543b8Aefn629dLVc4Xh7CtvBwBuv7n907gEKu5595o6KpYyTxY1+
         vpAKDR1nvvT6HeooRq6du1o/zthXKwwPncYCnvUMGZuZPQ8dt2L2Gh/ZBAI93h4+dToS
         8zBCvYk81ZlDbL2KmDbF3TY1s5+4kZFajI/pO9vrbKOK+Y+hgYLx51i0rvamp26BW7os
         3ogQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBU6eKIzO4AxuPF/EgKQZblxJ2XeQj0DDmbL3zWW2qN3Ne5ErdHmVgLufjBpDBgC4sd4vtzFoXs1WFKAl7hYjb@lists.infradead.org
X-Gm-Message-State: AOJu0YzE2vFi38xQW9e4s/o5/NTZNEnFMv9JxDW2xbe/wKScOejMd9Sk
	FP8jbpzlE8c6xqk+MccsiHvAMVo5sheycDUhTz/Gjq1K0QrI70FPzSWE/ZFB2+H7keYkn3iuZ8S
	wQe3aIy8b0fiODcs/Dg==
X-Google-Smtp-Source: AGHT+IEufDVmieTtOmTjD0ozshwtJsjGuKwUjK5sVkafXGyepALDAzCQ7cNYVDR3nM3liRfh3n/pBfr+E6zRFIsK
X-Received: from wmgg5.prod.google.com ([2002:a05:600d:5:b0:43b:bd03:5d2])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b1a:b0:43b:cc87:374a with SMTP id 5b1f17b1804b1-43c601e1294mr21499365e9.18.1741347259383;
 Fri, 07 Mar 2025 03:34:19 -0800 (PST)
Date: Fri,  7 Mar 2025 11:34:09 +0000
In-Reply-To: <20250307113411.469018-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250307113411.469018-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
Message-ID: <20250307113411.469018-2-vdonnefort@google.com>
Subject: [PATCH v3 1/3] KVM: arm64: Add flags to kvm_hyp_memcache
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_033421_151373_B863D183 
X-CRM114-Status: UNSURE (   9.38  )
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

Add flags to kvm_hyp_memcache and propagate the latter to the allocation
and free callbacks. This will later allow to account for memory, based
on the memcache configuration.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 3a7ec98ef123..12691ae23d4c 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -86,6 +86,7 @@ struct kvm_hyp_memcache {
 	phys_addr_t head;
 	unsigned long nr_pages;
 	struct pkvm_mapping *mapping; /* only used from EL1 */
+	unsigned long flags;
 };
 
 static inline void push_hyp_memcache(struct kvm_hyp_memcache *mc,
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 1f55b0c7b11d..c01ad4430729 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1086,12 +1086,12 @@ void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu)
 	}
 }
 
-static void hyp_mc_free_fn(void *addr, void *unused)
+static void hyp_mc_free_fn(void *addr, void *mc)
 {
 	free_page((unsigned long)addr);
 }
 
-static void *hyp_mc_alloc_fn(void *unused)
+static void *hyp_mc_alloc_fn(void *mc)
 {
 	return (void *)__get_free_page(GFP_KERNEL_ACCOUNT);
 }
@@ -1102,7 +1102,7 @@ void free_hyp_memcache(struct kvm_hyp_memcache *mc)
 		return;
 
 	kfree(mc->mapping);
-	__free_hyp_memcache(mc, hyp_mc_free_fn, kvm_host_va, NULL);
+	__free_hyp_memcache(mc, hyp_mc_free_fn, kvm_host_va, (void *)mc);
 }
 
 int topup_hyp_memcache(struct kvm_hyp_memcache *mc, unsigned long min_pages)
@@ -1117,7 +1117,7 @@ int topup_hyp_memcache(struct kvm_hyp_memcache *mc, unsigned long min_pages)
 	}
 
 	return __topup_hyp_memcache(mc, min_pages, hyp_mc_alloc_fn,
-				    kvm_host_pa, NULL);
+				    kvm_host_pa, (void *)mc);
 }
 
 /**
-- 
2.49.0.rc0.332.g42c0ae87b1-goog


