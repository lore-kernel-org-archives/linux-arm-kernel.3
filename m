Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F90C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 13:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ciUEmziHwKoR8EZ15kFmNQQUeftjWJUBtJzEaxlx9Y=; b=1Dfr1u62GI5mb33VUa84gOaKVm
	9xp4pEg+QTj8kdL0U8oVZsKgxOCL5wBE4smbs3OmrRRcK9ax6L5wo34afPyP4pq3oHsI6oixjsJ9u
	F+9Si1q4/AYEezY6ZAYEIJuCfVq9OaCQ2QiE8LSYvse7vOhFhhXfGT+ukIDp/EquKI4tVxzGLz2/h
	nlOk8w9W6eeQiKznwUDW/VSr/mJ7kaG+HNGB3E1YtFgyTOsHSX7C4m17wEo2mivBFNmbYc+Y31Xmq
	BEAMMdj+eb6o6mK1LVexGtvOmYugyzZivQ38gtI3hPN2RY6sGNYeB9ujumOiKgdmKbjDuj2pRlNbD
	r//mV3JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpSbz-00000004ppE-1LT2;
	Tue, 04 Mar 2025 13:47:07 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpSYs-00000004p37-3oC1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 13:43:55 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43bc97e6360so7287475e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 05:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741095833; x=1741700633; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3ciUEmziHwKoR8EZ15kFmNQQUeftjWJUBtJzEaxlx9Y=;
        b=4rRvhrrdPPXeC0oggHtXFCpXVV1cBGxUcvVculpw0iNfVQRVirhO9D5ItLZw7dyukl
         2+Mp9oDOf/G/K5R25IIRnDjlxjOvCVjlbHigExbYzT8oYaUyWREWIOMselciQxiLOcTN
         R3D6GhPfnuQCEmFTVS/oTSsN4H7aSuwT5ET10MI7QMPoKytJ1MkWR3ZBQdIu+VXbnlyD
         Ph3cs1IkTpxE9BLuOOQ1y6jp9qgG9zf0H+xpDJPua7KQzzpUxacbpyiCw31uwFjEme01
         kwEbzBtqHFS3K2Z58PO4NuRrYtF2wsIkvb62VnWPMim8WSkCDdkS8pkBkAkpPuSrr++c
         JUSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741095833; x=1741700633;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3ciUEmziHwKoR8EZ15kFmNQQUeftjWJUBtJzEaxlx9Y=;
        b=hUljtvC0HsqlDrsq4rnwES7DDQjrRqgO+/RZFnVcGoA/H9IvJAxfQVo4EFN8wybOOV
         e5NZ5MT2Wa41a1w/94Xdd/gYgzIpdIcmlRpbl6/Ejquh67L3DF+EcbgKGwlzGUymraZi
         uZphyjI8DKDyKUCo728tU4i4i0Lg/I43A0qT84pJCN1XUJPzoEBK7wF8FwqBmYHv+c9T
         oktFgbopN8yyO2zDOLiRvkbIKD+7OI/l8C0N3axQzVyFFcrU/JzDpYKJ3maeau573jwy
         btjxCOgrTei5c1pqmihf/YOJJ7DrmVgf3GqZhPARbVavt6IKiorSu5f/9DKOXB7wmw2h
         lzxg==
X-Forwarded-Encrypted: i=1; AJvYcCWgnwW5TfjL3xsnlFcb+WMDcDsmrC9yioDFVbQyuYBDJtTvKSz0qNpQy35jfCtC+3CwYwQ+otKdt1vob0UTJzyC@lists.infradead.org
X-Gm-Message-State: AOJu0YzDsDRoVXpYJpGkjvNcZ0A+FnCuamV1KLHJNc9RKKLpsY27pE6l
	aqw1pVoR6C11zQOJo1kAba+SkULGBJ1U6gjY8tNOofVMjTbCu2JzZMwSUjqCIYZSnqEjTP3fetq
	G91OGfDFqB4P/ozEIAg==
X-Google-Smtp-Source: AGHT+IFHZt3BnQxTnjrinSVy1JtKhEMHkRg+LEokGOtmOBZxYSPyEETqTBFJckhElghvkIX1hmSvWSCVF9ljT4k9
X-Received: from wmsp7.prod.google.com ([2002:a05:600c:1d87:b0:439:88bc:d27d])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f86:b0:43b:ca39:6c7d with SMTP id 5b1f17b1804b1-43bca3972efmr32164545e9.3.1741095833346;
 Tue, 04 Mar 2025 05:43:53 -0800 (PST)
Date: Tue,  4 Mar 2025 13:43:44 +0000
In-Reply-To: <20250304134347.369854-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250304134347.369854-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250304134347.369854-2-vdonnefort@google.com>
Subject: [PATCH v2 1/3] KVM: arm64: Add flags to kvm_hyp_memcache
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_054354_945308_745A9805 
X-CRM114-Status: UNSURE (   9.64  )
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

Add flags to kvm_hyp_memcache and propagate them up to the allocation
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
index 1f55b0c7b11d..68d99baa76c2 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1086,12 +1086,12 @@ void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu)
 	}
 }
 
-static void hyp_mc_free_fn(void *addr, void *unused)
+static void hyp_mc_free_fn(void *addr, void *flags)
 {
 	free_page((unsigned long)addr);
 }
 
-static void *hyp_mc_alloc_fn(void *unused)
+static void *hyp_mc_alloc_fn(void *flags)
 {
 	return (void *)__get_free_page(GFP_KERNEL_ACCOUNT);
 }
@@ -1102,7 +1102,7 @@ void free_hyp_memcache(struct kvm_hyp_memcache *mc)
 		return;
 
 	kfree(mc->mapping);
-	__free_hyp_memcache(mc, hyp_mc_free_fn, kvm_host_va, NULL);
+	__free_hyp_memcache(mc, hyp_mc_free_fn, kvm_host_va, (void *)mc->flags);
 }
 
 int topup_hyp_memcache(struct kvm_hyp_memcache *mc, unsigned long min_pages)
@@ -1117,7 +1117,7 @@ int topup_hyp_memcache(struct kvm_hyp_memcache *mc, unsigned long min_pages)
 	}
 
 	return __topup_hyp_memcache(mc, min_pages, hyp_mc_alloc_fn,
-				    kvm_host_pa, NULL);
+				    kvm_host_pa, (void *)mc->flags);
 }
 
 /**
-- 
2.48.1.711.g2feabab25a-goog


