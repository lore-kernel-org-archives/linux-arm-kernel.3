Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D920CD6E43
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 12:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P7DIYy/NA1CowFMUedyn+8E7FgwfAdykU+tJsf37FuI=; b=sH6qwF3i4UJUlJV3ijuxgJhtjQ
	lVl3+T9W/t9YsK0xy7A/qXa4aJqcbJTL+jclkTRvcDKvVsv0S6SNHpMxfJ5Tr4rjm54K8iYXmjsXz
	HB4rNCpGt2E9tTOaAGHSD9sSOz/V91kZAyUHCr2qW3l+J4BJXtRPFnVp9xv7aNfeTc6Ol+7uQz8hJ
	4wKYNMV7H70z5fazygRraGlEfg0O+zC33BFLjoRzwQGc5neGMNEDwWtguI2hW0Mzvkz0a1OByVuSS
	OROXcYjVhL1cBxcTgl1uPu+YWzggQah9J3/UwgqK7imT5K/mUs4qNP7pRGHRIbL+0ExzIVZgjr+Gu
	t+rFzx+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSwAI-00000007MMM-2TPY;
	Fri, 29 May 2026 12:18:14 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSwA6-00000007MHk-2KpZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 12:18:03 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-45eec27f5a5so943112f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 05:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780057080; x=1780661880; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=P7DIYy/NA1CowFMUedyn+8E7FgwfAdykU+tJsf37FuI=;
        b=UzJnVemeerKjE+otwsxk8Eea9i6S13A95sZ71O/IyBWzhr9+FZJ0w4B7rLt46mqGYe
         uhG6rCV45vK9ll6N2Zu9b8N8cWrONC+De2MvWmPQLCLZIZ5lzzNN8QkXRhs2ghfoVvN6
         /tyDRlGk/wOMGgaOu4ixGH9CTVkL4SCibvVdi2njWvzKCYTdHV6fENz37AxQSzRbd5tR
         iCkEJQcf64Ne/36/r4vWSVK9+DKLusfGL1gNxF6DWQlY6QjEeuVxFQRRV0+Gz6a9e0Xj
         oZlgFtuWVMWlidNAWQrw3z1xRWwQsdsBWdFg7Mg8z0ZLyM/2uuX8VI8dWL//XdtfZusx
         fmgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780057080; x=1780661880;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P7DIYy/NA1CowFMUedyn+8E7FgwfAdykU+tJsf37FuI=;
        b=fx0y0P5rAXem4+ZBtHL1Vd94B7aoLlHucerYMReJ4iIet18F/PjiGhBpQ048gW1w/Z
         4s+PolLjiB0//lmRztUKTBzz+wopC61fcfHOLVxQWOlgxp7oZjvyiZGZjCtC0O6A/SlV
         SMNngqMVeMqEjrhccNMVivyeLIqgviqzoHNfZfoobQ9Dgiv6dl6YPbHqqb2NxgsvJUht
         2qzfddZQEtLfaiXvJJZaYHNZnV+5EFzDRB50PlBV81H1rlwA+UmZzarBw/koSXM2ul1e
         QNy0CxQV+WvORsoyqC+EZrDjMXB/MSs6JKjVJEZ9NEDNI8ouj3TtCfOWv+53q3JygQqI
         OYWw==
X-Gm-Message-State: AOJu0Yx8ujxhYPfz5GdTzkyPdgzMFCJmZogn7fT9KsYrbX5vC5M7fd80
	OTnY9H244XjfuWFFwLXWBJ4aXkqQTgxQiuYaXdNQtmvk5vte91N96zrmA8rciQ4xQa35gYNjDII
	0vw==
X-Received: from wmjt12.prod.google.com ([2002:a7b:c3cc:0:b0:490:3974:b74f])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1d09:b0:490:a1a6:6f24
 with SMTP id 5b1f17b1804b1-490a1a67021mr16515805e9.15.1780057079441; Fri, 29
 May 2026 05:17:59 -0700 (PDT)
Date: Fri, 29 May 2026 13:17:54 +0100
In-Reply-To: <20260529121755.2923500-1-tabba@google.com>
Mime-Version: 1.0
References: <20260529121755.2923500-1-tabba@google.com>
X-Mailer: git-send-email 2.54.0.929.g9b7fa37559-goog
Message-ID: <20260529121755.2923500-3-tabba@google.com>
Subject: [PATCH v2 2/3] KVM: arm64: Avoid host/hyp share desync on unshare
 hypercall failure
From: tabba@google.com
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Quentin Perret <qperret@google.com>, Vincent Donnefort <vdonnefort@google.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_051802_607476_768CBDB0 
X-CRM114-Status: GOOD (  14.24  )
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

unshare_pfn_hyp() erases the tracking node from hyp_shared_pfns
and frees it before invoking __pkvm_host_unshare_hyp. If the
hypercall fails (e.g. EL2 refcount still held, or page-state
mismatch), the host loses its record while EL2 still holds the
share, breaking later share/unshare attempts on the same pfn.

Invoke the hypercall first; erase and free only on success.

Document at the kvm_unshare_hyp() call site that the WARN_ON() is
left non-fatal: a failed unshare leaks the page (it stays shared
with the hypervisor) but breaks no isolation guarantee.

Fixes: 52b28657ebd7 ("KVM: arm64: pkvm: Unshare guest structs during teardown")
Reported-by: Sashiko (local):gemini-3.1-pro
Suggested-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/mmu.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 4a928fb003ff..e08503e89fc4 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -524,13 +524,17 @@ static int unshare_pfn_hyp(u64 pfn)
 		goto unlock;
 	}
 
-	this->count--;
-	if (this->count)
+	if (this->count > 1) {
+		this->count--;
+		goto unlock;
+	}
+
+	ret = kvm_call_hyp_nvhe(__pkvm_host_unshare_hyp, pfn);
+	if (ret)
 		goto unlock;
 
 	rb_erase(&this->node, &hyp_shared_pfns);
 	kfree(this);
-	ret = kvm_call_hyp_nvhe(__pkvm_host_unshare_hyp, pfn);
 unlock:
 	mutex_unlock(&hyp_shared_pfns_lock);
 
@@ -581,6 +585,11 @@ void kvm_unshare_hyp(void *from, void *to)
 	end = PAGE_ALIGN(__pa(to));
 	for (cur = start; cur < end; cur += PAGE_SIZE) {
 		pfn = __phys_to_pfn(cur);
+		/*
+		 * A failed unshare leaks the page: it stays shared with the
+		 * hypervisor and is no longer reusable for pKVM. No isolation
+		 * guarantee is broken, and this is not expected in practice.
+		 */
 		WARN_ON(unshare_pfn_hyp(pfn));
 	}
 }
-- 
2.54.0.929.g9b7fa37559-goog


