Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6851C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 00:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DGmJYM3ZdXjed+VdIIVOBszfWrx1X1fG4+VBkIzQ0l4=; b=TzsnbbTeawbkTfpE2RLl80orU7
	SGkMaUpSTquQlFuY/MPP5t5Fy2hilqs8/ayya1NGDJOH6HpPw9edQZy6Mof8Ph/NpijcTVNrbYoLw
	PgqcziAYXSrP62SWujhqkITehyDo0O3Eq4NXatgOwPj2S37DCD8VPTO0Sb75hyEO3ovKM7V6Mh4Do
	lpbo+yE/1AlGGdqR4r/xv/jOmiJyXlluQePrqeD4AunsiI0Px1I112Uk4pWe2AzP+02muF2uZFg6t
	yr4+ZE/roh3DTMpBIWGc4ju+jlS9vHdvX4p9nI3BX27TOqgsGzG7VrGgugbNy9uUveEpM4YnWJ0rQ
	AHKGOnHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnRz4-00000005qNV-3W6C;
	Thu, 27 Feb 2025 00:42:38 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnRq9-00000005osi-0oEI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 00:33:26 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-5e4c261813bso255116a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 16:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740616403; x=1741221203; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DGmJYM3ZdXjed+VdIIVOBszfWrx1X1fG4+VBkIzQ0l4=;
        b=UekrmJHiffQh3QD0w218huFFzuP5oi0pNPo/l1+hzJj9bX2coQB+1Ksb4Q501z7uMX
         pvWWz0zKG4CwwlabOB+bmeO6m6NQZktkFL86EBghI25Q7ZT/4IqKO8vufWqt68dRIjj8
         bqdhbehJKcEWJO4Xcc/Ry8epYWDi5VJoXOdGRz0F5qPztdyc6bKsU6dFZE9lXFaySmf2
         bhaajiq+GRRrWRdYAY7k+zeefaG1CFW1zDD4zugOhub3jkG+iqk1GLsSuxHFg/cbaqqR
         HbsS22MAUT00Fy+0y6JtqEqQpSGvjPYt6a5w8TCHJjza2GIdYIfZG/MOWp0S00ZWof1E
         S5RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740616403; x=1741221203;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DGmJYM3ZdXjed+VdIIVOBszfWrx1X1fG4+VBkIzQ0l4=;
        b=tR4GUoIHZvKT+iZdkFgjauQFXVKZ/b1ipJpTK4k+Q3te0yCh5r34wdN/oDYskKO1w/
         BTnYBJz8wM09Y7gYmtATpp93yiOxKEwWq9ZKdof1ClQeGJsN5tg18KA8VLG5H/TTVEw2
         WvoRc98EJougATJcnqAssRq4YDBEFxksD0Til0d78gud3xUDUpJSzmbbu5FMeKM+P7FP
         n0AgWQYNDqHSFmkKCkL5M3Pnl+ItZ6OHvBajvNXIl0zsLPl5y4t7/snWmyzMuQ/5wRB+
         RkuElwsLsoR8YyRhSpP/rToic3QpskJeHFGaRVq+GZTrsiaEYSE865szXl0iWEW4LNBN
         6AyA==
X-Forwarded-Encrypted: i=1; AJvYcCX7xBJbv6yLonfaVbn/q6G577x3njU1nNFVeMhNHN3vh0zFu7UXI1vWwbgwmh2cpqj8BhzzZGz4sgdL/xq9YaMA@lists.infradead.org
X-Gm-Message-State: AOJu0YzbXZbj5GAbSg0ImCtCgSoAQ3CxhDZrIinVd8S5UQZ8DKR+DdG0
	2QCw8fDpNYXyNNLax0LxkutMlSah0EhaWUoOUVAq86GqfZFdddv1fUEnaQEKbGZwC5r9zoPo9Aq
	zaneDLw==
X-Google-Smtp-Source: AGHT+IG/8xxJ0edTLXImN+8foUCiY3IiLHVItOY++3PsS94AT277t67Spxy60uaWfxFei8RcZX4NGH7I/+gI
X-Received: from edbeo13.prod.google.com ([2002:a05:6402:530d:b0:5e4:befa:4847])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:280d:b0:5dc:7725:a0c7
 with SMTP id 4fb4d7f45d1cf-5e44448139dmr11904494a12.3.1740616403358; Wed, 26
 Feb 2025 16:33:23 -0800 (PST)
Date: Thu, 27 Feb 2025 00:33:09 +0000
In-Reply-To: <20250227003310.367350-1-qperret@google.com>
Mime-Version: 1.0
References: <20250227003310.367350-1-qperret@google.com>
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
Message-ID: <20250227003310.367350-6-qperret@google.com>
Subject: [PATCH 5/6] KVM: arm64: Defer EL2 stage-1 mapping on share
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Vincent Donnefort <vdonnefort@google.com>, Quentin Perret <qperret@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_163325_229022_900CD0C8 
X-CRM114-Status: GOOD (  11.96  )
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

We currently blindly map into EL2 stage-1 *any* page passed to the
__pkvm_host_share_hyp() HVC. This is less than ideal from a security
perspective as it makes exploitation of potential hypervisor gadgets
easier than it should be. But interestingly, pKVM should never need to
access pages that it hasn't previously pinned, so there is no need to
map the page before that.

Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 3ab8c81500c2..ae39d74be1f2 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -686,7 +686,6 @@ static int __guest_check_page_state_range(struct pkvm_hyp_vcpu *vcpu, u64 addr,
 int __pkvm_host_share_hyp(u64 pfn)
 {
 	u64 phys = hyp_pfn_to_phys(pfn);
-	void *virt = __hyp_va(phys);
 	u64 size = PAGE_SIZE;
 	int ret;
 
@@ -703,7 +702,6 @@ int __pkvm_host_share_hyp(u64 pfn)
 	}
 
 	__hyp_set_page_state_range(phys, size, PKVM_PAGE_SHARED_BORROWED);
-	WARN_ON(pkvm_create_mappings_locked(virt, virt + size, PAGE_HYP));
 	WARN_ON(__host_set_page_state_range(phys, size, PKVM_PAGE_SHARED_OWNED));
 
 unlock:
@@ -735,7 +733,6 @@ int __pkvm_host_unshare_hyp(u64 pfn)
 	}
 
 	__hyp_set_page_state_range(phys, size, PKVM_NOPAGE);
-	WARN_ON(kvm_pgtable_hyp_unmap(&pkvm_pgtable, virt, size) != size);
 	WARN_ON(__host_set_page_state_range(phys, size, PKVM_PAGE_OWNED));
 
 unlock:
@@ -811,6 +808,7 @@ int hyp_pin_shared_mem(void *from, void *to)
 	u64 end = PAGE_ALIGN((u64)to);
 	u64 phys = __hyp_pa(start);
 	u64 size = end - start;
+	struct hyp_page *p;
 	int ret;
 
 	host_lock_component();
@@ -824,8 +822,14 @@ int hyp_pin_shared_mem(void *from, void *to)
 	if (ret)
 		goto unlock;
 
-	for (cur = start; cur < end; cur += PAGE_SIZE)
-		hyp_page_ref_inc(hyp_virt_to_page(cur));
+	for (cur = start; cur < end; cur += PAGE_SIZE) {
+		p = hyp_virt_to_page(cur);
+		hyp_page_ref_inc(p);
+		if (p->refcount == 1)
+			WARN_ON(pkvm_create_mappings_locked((void *)cur,
+							    (void *)cur + PAGE_SIZE,
+							    PAGE_HYP));
+	}
 
 unlock:
 	hyp_unlock_component();
@@ -838,12 +842,17 @@ void hyp_unpin_shared_mem(void *from, void *to)
 {
 	u64 cur, start = ALIGN_DOWN((u64)from, PAGE_SIZE);
 	u64 end = PAGE_ALIGN((u64)to);
+	struct hyp_page *p;
 
 	host_lock_component();
 	hyp_lock_component();
 
-	for (cur = start; cur < end; cur += PAGE_SIZE)
-		hyp_page_ref_dec(hyp_virt_to_page(cur));
+	for (cur = start; cur < end; cur += PAGE_SIZE) {
+		p = hyp_virt_to_page(cur);
+		if (p->refcount == 1)
+			WARN_ON(kvm_pgtable_hyp_unmap(&pkvm_pgtable, cur, PAGE_SIZE) != PAGE_SIZE);
+		hyp_page_ref_dec(p);
+	}
 
 	hyp_unlock_component();
 	host_unlock_component();
-- 
2.48.1.658.g4767266eb4-goog


