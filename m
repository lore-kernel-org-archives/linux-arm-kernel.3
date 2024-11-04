Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D875D132C8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 13:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C3cxg1LygKNu1O6MtAV/wXocYa0JdKRd+G1uF5af3p4=; b=1K21VAfxfDXkJwMikc3Gb7oq36
	bZgz5fVDdp41+F3QlCP6YqJoS9WlC335boCvUMJweJtPk8AZ6q90PFO9xBwIiCpxak3vdXDFihvMw
	jj8uE2brOjBcwwsjfUJYWo9VAgMfI6islgsKTcaq/5/byTM8gkb+dRY34QSfJCkHAS+7ZOgy+2tP9
	GUtOoX1FtJ/gofFl76xKbZiqlAJsrFRBHn1yD48f0V4xe/JmRnkyGV/BwAuE4x2YzYnzcPrY64HAb
	aGMFWHZMyQhi+otStEuxy1lQZ0lZV+D8Xx6MushqnyxabW2rpcgwyx/tqJ1zj598lHQueT+rFVutc
	CaGUK/5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7xLW-0000000Dunh-21NQ;
	Mon, 04 Nov 2024 13:42:18 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7xBj-0000000DsGE-3rKN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 13:32:13 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6e59dc7df64so53895847b3.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 05:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730727130; x=1731331930; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=C3cxg1LygKNu1O6MtAV/wXocYa0JdKRd+G1uF5af3p4=;
        b=Hezc8ft1mY+UL6hsfmP7Few/TK4fl3GQgnWzSX6GV6TUM+Zn3U+/XKKX/r3iLaoFT1
         oTB9I6QUb7G45e7ES65UvHyb87VjSrMMgmZNADmy9ooslk8yW+xHD5RLoc68LGjgNEpa
         nVIRR/hwgVi46X44IW4mGbF4FCxvwWhxAZJz8tgOqh6/Pw1n1tQLQjp2TUfTUQYgCIoT
         nk0eQ5hjApzYLITU6StojS5hiE/OyyvxN4hxxCl2AtPt6d/U9rLCmPaGgFrexWATSipW
         TbTyxb2KVWw4bp2j4U6pnBmbgXd+bJXMx02Xj3y/gBeyXCafS3eiXQsIzctVOt5KArL4
         4oxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730727130; x=1731331930;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C3cxg1LygKNu1O6MtAV/wXocYa0JdKRd+G1uF5af3p4=;
        b=pye9uYDFXgukASzWSus5EXlbeRndG3D1X5iwA63ukb2lXSYIGZB6xWWEGL35wd9/5r
         sATxF61/EoN9dL7m1Uk/H6cJ5eVIWht5bfZFs2gmjNSxHv/QgQXREvhazEJlQuKDx941
         OQMXgpXn32JEeOO5UIwasxjaVZCPkNpCIXVWs+uUpTJwW93a6o0bmoZ3iYDGB/2qd3Tk
         3KQ2VALK3pdnfBdR3e15i4hCcWA0dtRD8kr0PxfEZGtE5MKYepd9VDMdXFYXj0VbE7pA
         npAT3qeWbQnxZnYBcJgoqAAuGzfpkaWOptpR3dTPmq19iOawfke5N5hBRRJmQQcBIWzf
         ZbpA==
X-Forwarded-Encrypted: i=1; AJvYcCU/RtO7xhkBaJOqLJNj7SHCK9FayznRGABCYFNc/3MSgwzKkGt6P2iw68uw+2DzKQy45vPslLD19Uky7wofxymv@lists.infradead.org
X-Gm-Message-State: AOJu0YwXhkVD5UV2HyjsKwOsUkMIQDW+sPikcpaboVEH17ZhTO8DPW9e
	XPV6omET/FxanklzkqpeklOd6I2+ND/KDMRPIlEDsh9PPTaN0Uh4G7yCLzTgjbyw8E2En8q5JBe
	r9WFVbw==
X-Google-Smtp-Source: AGHT+IG4oLvWKjpenUPcwb9MUEXuA4k9iUal4VcJqIm7bVxly8pKYoHiLyM9jmlzbnyR07kVBLqdiArEOR21
X-Received: from big-boi.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:129])
 (user=qperret job=sendgmr) by 2002:a05:690c:3603:b0:6e3:ad3:1f19 with SMTP id
 00721157ae682-6ea557a7a11mr2085187b3.3.1730727130106; Mon, 04 Nov 2024
 05:32:10 -0800 (PST)
Date: Mon,  4 Nov 2024 13:31:47 +0000
In-Reply-To: <20241104133204.85208-1-qperret@google.com>
Mime-Version: 1.0
References: <20241104133204.85208-1-qperret@google.com>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241104133204.85208-2-qperret@google.com>
Subject: [PATCH 01/18] KVM: arm64: Change the layout of enum pkvm_page_state
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Fuad Tabba <tabba@google.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Sebastian Ene <sebastianene@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_053211_981496_C4916806 
X-CRM114-Status: GOOD (  11.82  )
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

The 'concrete' (a.k.a non-meta) page states are currently encoded using
software bits in PTEs. For performance reasons, the abstract
pkvm_page_state enum uses the same bits to encode these states as that
makes conversions from and to PTEs easy.

In order to prepare the ground for moving the 'concrete' state storage
to the hyp vmemmap, re-arrange the enum to use bits 0 and 1 for this
purpose.

No functional changes intended.

Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index 0972faccc2af..ca3177481b78 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -24,25 +24,28 @@
  */
 enum pkvm_page_state {
 	PKVM_PAGE_OWNED			= 0ULL,
-	PKVM_PAGE_SHARED_OWNED		= KVM_PGTABLE_PROT_SW0,
-	PKVM_PAGE_SHARED_BORROWED	= KVM_PGTABLE_PROT_SW1,
-	__PKVM_PAGE_RESERVED		= KVM_PGTABLE_PROT_SW0 |
-					  KVM_PGTABLE_PROT_SW1,
+	PKVM_PAGE_SHARED_OWNED		= BIT(0),
+	PKVM_PAGE_SHARED_BORROWED	= BIT(1),
+	__PKVM_PAGE_RESERVED		= BIT(0) | BIT(1),
 
 	/* Meta-states which aren't encoded directly in the PTE's SW bits */
-	PKVM_NOPAGE,
+	PKVM_NOPAGE			= BIT(2),
 };
+#define PKVM_PAGE_META_STATES_MASK	(~(BIT(0) | BIT(1)))
 
 #define PKVM_PAGE_STATE_PROT_MASK	(KVM_PGTABLE_PROT_SW0 | KVM_PGTABLE_PROT_SW1)
 static inline enum kvm_pgtable_prot pkvm_mkstate(enum kvm_pgtable_prot prot,
 						 enum pkvm_page_state state)
 {
-	return (prot & ~PKVM_PAGE_STATE_PROT_MASK) | state;
+	BUG_ON(state & PKVM_PAGE_META_STATES_MASK);
+	prot &= ~PKVM_PAGE_STATE_PROT_MASK;
+	prot |= FIELD_PREP(PKVM_PAGE_STATE_PROT_MASK, state);
+	return prot;
 }
 
 static inline enum pkvm_page_state pkvm_getstate(enum kvm_pgtable_prot prot)
 {
-	return prot & PKVM_PAGE_STATE_PROT_MASK;
+	return FIELD_GET(PKVM_PAGE_STATE_PROT_MASK, prot);
 }
 
 struct host_mmu {
-- 
2.47.0.163.g1226f6d8fa-goog


