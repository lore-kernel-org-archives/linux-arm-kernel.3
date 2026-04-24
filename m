Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 662B6FE51E5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 08:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tqPUzeIZ3aoS8p3NlrhVF5/x2KSp4t36eDNrPTZ/mqs=; b=iAnw8NWoNENj8gG9wjmWJPNEha
	bqYfGhIpJZH11gdv/IoP0qejTL+eZe5gC1v2uKsV1QB182U50FQZgTI+gkcidxX8dE9Y2VBNdBN+x
	R17FstuhQNAWMb2vjebx8rD0/5h4T5gXCBa43w6ijSmc3vdQ0J9P93s1+YnIxfB95i6xldLU8wb9D
	g2NI5FKbdKjO8iupCb2LcqCoVDirDdmTx1E+VYcEdYBRMbrhuGQXJIvokiq7auRcR1MmfBJjbhRA7
	TPH0XHr5j1RTcIErGUbPHPeRoSGpKQvQ0R4GFUgeRSFAlPQQzMziGN/EKC6oEU/lZeWEwj+j6iVJW
	WBy/XmQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGCE3-0000000Ct68-3A5X;
	Fri, 24 Apr 2026 08:49:27 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGCDt-0000000Ct0d-47IB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 08:49:19 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-488be33b7a6so54096645e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 01:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777020556; x=1777625356; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tqPUzeIZ3aoS8p3NlrhVF5/x2KSp4t36eDNrPTZ/mqs=;
        b=QbAr/PUCjCkyhCkBA81/9B298HM7u/bSYuIyxUMz+Uof32HS1kIMh1kH2kUTgYUxS2
         Kjn7hawvcuxnCVnZY3LA76xNymqurgs14jJScvnKuVi2YylD3gCEi0fM8MxgOJmTYP5y
         53vjPBONm87kvJtbb9SXcA1eXTPKFZPBfcr/6M/mL+Ki1xUFvcz1fbmy+Vp39iDaqo3m
         fAPd4ETtwyIG0+8BMHGFPeqrEV8P3xOLUped0pQPo2l3jJX/um5LHe85EM34VC/52eIx
         O9GHGj8Mupyi2lR2U8+1U+VXcqULwG+ET5KbgSS7H5YgQ6yUu7VyPV3Yaz8r0GBMn3/Q
         buBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777020556; x=1777625356;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tqPUzeIZ3aoS8p3NlrhVF5/x2KSp4t36eDNrPTZ/mqs=;
        b=KCI8zf4Q9Gi6iQLakdqj0J8eOR8WCJjyvjc5srwBhq5X/+tCJV0SaUxrLBX72lvKBI
         nqazLUL59MhG9LMWeBzdNCF2RbcL5aKR5zFHbASUl3OcghIdjzK3Tbm8FBI4YNqLuQx2
         7SV8dDlBOVtXhiO6eeaiM4j/X1fJopgJ0xCMkT4+xuf1ocJ6wX3ejYCGAU/KMV6Dx7Mf
         n/o3esvFJhTb/Qmye0xmWmr7tpbW/5ek1qvwIPFjiO7tUzu6ydxJ9QFZuJtsGEi1x5N4
         2sIVAFzLkyj2Ei6SEmC88ZUdnaThXqJQozl9WAjSkXDouX6AUktYQBojJhJ6PW5hvzFc
         tZEw==
X-Forwarded-Encrypted: i=1; AFNElJ9ZgpnOKgDzecPiuyDAVfCNEmkHIairYC4KxLrLXoTC0Sie2fpMpcX9c1J+0dRhexZdJ7Fk3IXHpQLktoUPEKfW@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0F0lU7HJ9TX5JXHvK8wa7+c3ZS8svP2PQ9FWjUSFvrudV96gL
	xGvZYD8Zrxt9VckSJe8JyYVioQQZ2UfSamxkqMeC+dz0G7JihQZ6pKrYJjOluY0ZVbcwv/VH7l0
	/Vw==
X-Received: from wma12.prod.google.com ([2002:a05:600c:890c:b0:485:40d2:1ebf])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:c090:b0:488:c744:49b
 with SMTP id 5b1f17b1804b1-488fb74a53dmr326821365e9.7.1777020555512; Fri, 24
 Apr 2026 01:49:15 -0700 (PDT)
Date: Fri, 24 Apr 2026 09:49:08 +0100
In-Reply-To: <20260424084908.370776-1-tabba@google.com>
Mime-Version: 1.0
References: <20260424084908.370776-1-tabba@google.com>
X-Mailer: git-send-email 2.54.0.rc2.544.gc7ae2d5bb8-goog
Message-ID: <20260424084908.370776-7-tabba@google.com>
Subject: [PATCH 6/6] KVM: arm64: Fix initialisation order in __pkvm_init_finalise()
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Cc: tabba@google.com, catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oupton@kernel.org, qperret@google.com, suzuki.poulose@arm.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_014918_026551_6D50F1A7 
X-CRM114-Status: GOOD (  12.32  )
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

From: Quentin Perret <qperret@google.com>

fix_host_ownership() walks the hypervisor's stage-1 page-table to
adjust the host's stage-2 accordingly. Any such adjustment that
requires cache maintenance operations depends on the per-CPU hyp
fixmap being present. However, fix_host_ownership() is currently
called before fix_hyp_pgtable_refcnt() and hyp_create_fixmap(), so
the fixmap does not yet exist when it runs.

This is benign today because the host stage-2 starts empty and no
CMOs are needed, but it becomes a latent crash as soon as
fix_host_ownership() is extended to operate on a non-empty
page-table.

Reorder the calls so that fix_hyp_pgtable_refcnt() and
hyp_create_fixmap() complete before fix_host_ownership() is invoked.

Fixes: 0d16d12eb26e ("KVM: arm64: Fix-up hyp stage-1 refcounts for all pages mapped at EL2")
Signed-off-by: Quentin Perret <qperret@google.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/setup.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
index d8e5b563fd3d..d461981616d9 100644
--- a/arch/arm64/kvm/hyp/nvhe/setup.c
+++ b/arch/arm64/kvm/hyp/nvhe/setup.c
@@ -312,10 +312,6 @@ void __noreturn __pkvm_init_finalise(void)
 	};
 	pkvm_pgtable.mm_ops = &pkvm_pgtable_mm_ops;
 
-	ret = fix_host_ownership();
-	if (ret)
-		goto out;
-
 	ret = fix_hyp_pgtable_refcnt();
 	if (ret)
 		goto out;
@@ -324,6 +320,10 @@ void __noreturn __pkvm_init_finalise(void)
 	if (ret)
 		goto out;
 
+	ret = fix_host_ownership();
+	if (ret)
+		goto out;
+
 	ret = hyp_ffa_init(ffa_proxy_pages);
 	if (ret)
 		goto out;
-- 
2.54.0.rc2.544.gc7ae2d5bb8-goog


