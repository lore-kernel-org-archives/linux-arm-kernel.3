Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DBBDCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 15:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cqgx5sehgSsUJ6ykKsNMbPDDuPZW2QQ5bkclTXcvltI=; b=knMDoAKx50DCQtO7/GZu3pgnE2
	wfbSWgqYR9ShDZxlF0fe8Y9eLZES6MjNIBr2rNk1wFlhtlRMdoZfB3PtA+EWaYqkXOAiB9PTZ4Meh
	v2BVjg5Q9BekxDslPnALFqgr4h5CtRYv8JRKfKyvfRAHJEqjXQeqhpBwm4QaEOINYh4qX76vsLwcd
	1ukXRbp6RdBNWrH/8FDw76DPZrHNn+XcPBFCyAlOAdbQil/o+Qmrh0NI54e91xr7rGZHHhYs4TPBa
	NruRejMsNK7v0Oowa/h4dhuhukzQR6O8jZKCtnOknPATstVNw1fLIn/2ejXJ7UHpeJ6rp11miOFfs
	TE3I2hvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPipQ-00000004z2p-1xqQ;
	Wed, 20 May 2026 15:27:24 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPipN-00000004yzp-3LJB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 15:27:22 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-48fdca5c638so37376545e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 08:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779290837; x=1779895637; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cqgx5sehgSsUJ6ykKsNMbPDDuPZW2QQ5bkclTXcvltI=;
        b=t3R/QZO3W/+AoVDrQ5QtXFqn6pwJMOKT1N+y0eFGzyz7RMFjpF3XWVx0mbVktRyyWT
         H2Zlo9WXoAMEn/hz79yF6oThPmVHMkDZcNtljXq2YCEctIfPhnKO7FiEMCVxUuiD8zsn
         AdQsMOpwZKRePjgJDNAEDtA3mUVLCMgIk4bXhl9wdROsQj5qztbwW6RkHYXfzqI+tnxY
         2NRG9yQBhuxzwH24XvAb1bFfAX7XzlQAsGboAkdDACtM4uhYvVZUNQ5sFAd2r1XVoLlk
         fog7Tu14le4aRhx8NEqJ1LqeDxuS6zqzeCLP8xHQIZkwJCg4YweayaU7XPlDi17F57B8
         BfiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779290837; x=1779895637;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cqgx5sehgSsUJ6ykKsNMbPDDuPZW2QQ5bkclTXcvltI=;
        b=DoGiW51u0T+SKw5LyViFoexTjUZ73ewKztWTLI0zwHQJVD3YWe8CpMobuD9RvUNomF
         ogkleZNcGcpUr4xkH+lj1PbfMwjQuaKOT7GmbstJ/SZNzklVcegEVdfX9qgcx+h7mk/E
         tb01wOE3pTZC266/R15g1kAbGNGCbd0sD1Natbxjp13Kih2ZCT+M30GSOc5PsGNoGHrG
         OJWUb7pNjEwerZUv/a8g9SFgHa+sPkpBTgG9KLf85mQIno35ScUAUQSHCjlECPQUvlqb
         XTU/CFJSOYOowJdBEOiHL/kgBApRldoQ7p+xqRRbfQtXeJeUT+yJZXSpGoI/9ViR/Xt5
         y9Mg==
X-Gm-Message-State: AOJu0YwkJ9cEyesDR3Ey5EZgBRlY82+/zC3pqZSWrX/N+RUYC21hGQbC
	j0tZMndsG7ltJM7fmr8/SFtNidmHMPTJBaTWdt3/eA1/TIk5b8Xb+2ga9svVY2o3Nbc5u4CXa6f
	iJv/cNUW63s4roh5Iv10LqA==
X-Received: from wmpw34.prod.google.com ([2002:a05:600c:9a2:b0:490:c16:889f])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1709:b0:490:327a:1b47 with SMTP id 5b1f17b1804b1-490327a1b5dmr14334175e9.8.1779290837309;
 Wed, 20 May 2026 08:27:17 -0700 (PDT)
Date: Wed, 20 May 2026 16:26:36 +0100
In-Reply-To: <20260520152650.4107895-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260520152650.4107895-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.54.0.631.ge1b05301d1-goog
Message-ID: <20260520152650.4107895-4-vdonnefort@google.com>
Subject: [PATCH 03/17] KVM: arm64: Add __hyp_allocator_map for the pKVM hyp
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com, tabba@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_082721_850210_266C8158 
X-CRM114-Status: UNSURE (   7.97  )
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

In preparation for the pKVM heap allocator, introduce __hyp_allocator_map()
to map a single physical page to a given virtual address in the hypervisor
stage-1 page-table.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mm.h b/arch/arm64/kvm/hyp/include/nvhe/mm.h
index 725bb0fb941d..98a7774b541c 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mm.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mm.h
@@ -32,5 +32,6 @@ int __pkvm_create_private_mapping(phys_addr_t phys, size_t size,
 int pkvm_create_stack(phys_addr_t phys, unsigned long *haddr);
 int pkvm_alloc_private_va_range(size_t size, unsigned long *haddr);
 phys_addr_t __pkvm_private_range_pa(void *va);
+int __hyp_allocator_map(void *va, phys_addr_t phys);
 
 #endif /* __KVM_HYP_MM_H */
diff --git a/arch/arm64/kvm/hyp/nvhe/mm.c b/arch/arm64/kvm/hyp/nvhe/mm.c
index ec59da1322a7..c1c01f81ac5f 100644
--- a/arch/arm64/kvm/hyp/nvhe/mm.c
+++ b/arch/arm64/kvm/hyp/nvhe/mm.c
@@ -160,6 +160,11 @@ void pkvm_remove_mappings(void *from, void *to)
 	hyp_spin_unlock(&pkvm_pgd_lock);
 }
 
+int __hyp_allocator_map(void *va, phys_addr_t phys)
+{
+	return __pkvm_create_mappings((unsigned long)va, PAGE_SIZE, phys, PAGE_HYP);
+}
+
 int hyp_back_vmemmap(phys_addr_t back)
 {
 	unsigned long i, start, size, end = 0;
-- 
2.54.0.631.ge1b05301d1-goog


