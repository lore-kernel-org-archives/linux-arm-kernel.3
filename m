Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 946ACE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 12:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DtU04MdUtaba/29cBZEvCyfcbZiq9/Rr2f3d3RSXEMM=; b=XXmWHGyV9kUyDcGUy7Rhi2epJ+
	W7D0NhNgHfGcLQTo4cdHiq2iX7nUjTh+nnIMWffxZ3c7vTxWxVHEf4WlaKbhLyQ4XMJGEiQW0VriK
	kDyYjcDwTSijQd9CvZDJcOpTp5YCETlHhhj/96hVf8CKQr00vez6IzmsYLs8Dxs3geXfxYkFzZy52
	inoeVS7+59jyN0LbbiYoSh3DmZ6IzS1JQxQieYPCwAK7PPi82osSWOQ4Cd6HP99JgeDv3LufNmPMT
	M3lkSrOZjgpC1IV9PaU5Lypd0Y6czGWO2MUNHfzRMcIz1kpyDvdClabCw/9zF4fTDpcQ2pfmCBk9M
	v2MDmGmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWE47-0000000FFkJ-13vC;
	Fri, 10 Jan 2025 12:24:39 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWDzP-0000000FEkE-0mlZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 12:19:48 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-5d90a59999aso2372386a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jan 2025 04:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736511585; x=1737116385; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DtU04MdUtaba/29cBZEvCyfcbZiq9/Rr2f3d3RSXEMM=;
        b=u6zMu3faTbE6HSVmlc3m7YfCxlWE/4XXHqurTcWWEIhzbFJMVLDP1JLoZM3hpxJgm9
         XAFY/ltXgz1ezy9UIrAHCR51cOz+247QEdRpkzf4+Tb/ohq2XrFoUk/0eWow+T9orh8q
         eIW9PhcLHl1WEYpyNF/SYpAW1JYhPr4OKT/G5uMcKKYVK5pRtUQAXJ5ML4L3tODy+KGz
         CJ459K04uNFtR7lzheLgsH5AtLTYzDj2jUxn/BFJ/gHGc4uVosHb+M+YGZsbkhPEYRRh
         JD/axS06gc6O4bMqmC7pEVButR7DzNyUR7DesjLiRGkGasX/PGpcckzAwOb50hc7HMlB
         siVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736511585; x=1737116385;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DtU04MdUtaba/29cBZEvCyfcbZiq9/Rr2f3d3RSXEMM=;
        b=Mcf1bTKA7TNFyM1nK95Q+S4C+xNHYhz20Y52ZkTtoUHkooEYqN52K1ez0z3TaREJnS
         f19rSjcjmY/ujbmcbF+Fyel8AJ8b89IfmjHQR4ItE2I7rcBwa9Wgt2idDkgK3yvj8rmc
         IGVSCNCG5OtCyb2oPpa5pBCR8WAjxzwwku43hMkevYX4W0R7w3uhhkCdHqgkMkXVTBhw
         23Z8G9jqKDhe/av72/kRe7XhiDwD5FcUuLWR5ra96yNekUXQoHlpeNY/8UdtSgbk49Xm
         dWBJVtjCBWkRMUnpS1yUCsX6fkYf1QSLhnWYQGrgIGIj0f4+BbEcTlz+rbBMq911yubs
         r2Rg==
X-Forwarded-Encrypted: i=1; AJvYcCUfVko3VckFEl00yGbqmHK3HT+iNLmrwo+MARvUE0I3GeyWVPw8zLJDFyNU8vfr7NHPOaJ23x1thSYHutyNJ3hi@lists.infradead.org
X-Gm-Message-State: AOJu0YzuSNc/d/pmDWlSpslGuwg/9FzETZs2bVDTwK967GpkAtB+899s
	xamvFCGm0o08Yjbw41LdtXAtv5gLDwYcZtz0W1mlIfT8ExN8qePCFJOxuvCSUMLDb1FDsZZQAQE
	5Y46bIg==
X-Google-Smtp-Source: AGHT+IE8pwm0WuzijwFJnnfkKAp3whvfOVqnR4Hnv/2il6Ym21FdKGzx1FIDYLM5L/rv1DqQUki8rJPPSNQ3
X-Received: from edbeh15.prod.google.com ([2002:a05:6402:f8f:b0:5d9:103a:855d])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:254d:b0:5d0:81dc:f20e
 with SMTP id 4fb4d7f45d1cf-5d972e1c5cfmr9641811a12.17.1736511585431; Fri, 10
 Jan 2025 04:19:45 -0800 (PST)
Date: Fri, 10 Jan 2025 12:19:36 +0000
In-Reply-To: <20250110121936.1559655-1-qperret@google.com>
Mime-Version: 1.0
References: <20250110121936.1559655-1-qperret@google.com>
X-Mailer: git-send-email 2.47.1.688.g23fc6f90ad-goog
Message-ID: <20250110121936.1559655-4-qperret@google.com>
Subject: [PATCH 3/3] KVM: arm64: Drop pkvm_mem_transition for host/hyp donations
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Fuad Tabba <tabba@google.com>, Vincent Donnefort <vdonnefort@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_041947_232543_FD4C947B 
X-CRM114-Status: GOOD (  14.20  )
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

Simplify the __pkvm_host_donate_hyp() and pkvm_hyp_donate_host() paths
by not using the pkvm_mem_transition machinery. As the last users of
this, also remove all the now unused code.

No functional changes intended.

Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 285 +++-----------------------
 1 file changed, 32 insertions(+), 253 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index cd8d233b9527..7ad7b133b81a 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -583,39 +583,6 @@ void handle_host_mem_abort(struct kvm_cpu_context *host_ctxt)
 	BUG_ON(ret && ret != -EAGAIN);
 }
 
-struct pkvm_mem_transition {
-	u64				nr_pages;
-
-	struct {
-		enum pkvm_component_id	id;
-		/* Address in the initiator's address space */
-		u64			addr;
-
-		union {
-			struct {
-				/* Address in the completer's address space */
-				u64	completer_addr;
-			} host;
-			struct {
-				u64	completer_addr;
-			} hyp;
-		};
-	} initiator;
-
-	struct {
-		enum pkvm_component_id	id;
-	} completer;
-};
-
-struct pkvm_mem_share {
-	const struct pkvm_mem_transition	tx;
-	const enum kvm_pgtable_prot		completer_prot;
-};
-
-struct pkvm_mem_donation {
-	const struct pkvm_mem_transition	tx;
-};
-
 struct check_walk_data {
 	enum pkvm_page_state	desired;
 	enum pkvm_page_state	(*get_page_state)(kvm_pte_t pte, u64 addr);
@@ -675,56 +642,6 @@ static int __host_set_page_state_range(u64 addr, u64 size,
 	return 0;
 }
 
-static int host_request_owned_transition(u64 *completer_addr,
-					 const struct pkvm_mem_transition *tx)
-{
-	u64 size = tx->nr_pages * PAGE_SIZE;
-	u64 addr = tx->initiator.addr;
-
-	*completer_addr = tx->initiator.host.completer_addr;
-	return __host_check_page_state_range(addr, size, PKVM_PAGE_OWNED);
-}
-
-static int host_initiate_donation(u64 *completer_addr,
-				  const struct pkvm_mem_transition *tx)
-{
-	u8 owner_id = tx->completer.id;
-	u64 size = tx->nr_pages * PAGE_SIZE;
-
-	*completer_addr = tx->initiator.host.completer_addr;
-	return host_stage2_set_owner_locked(tx->initiator.addr, size, owner_id);
-}
-
-static bool __host_ack_skip_pgtable_check(const struct pkvm_mem_transition *tx)
-{
-	return !(IS_ENABLED(CONFIG_NVHE_EL2_DEBUG) ||
-		 tx->initiator.id != PKVM_ID_HYP);
-}
-
-static int __host_ack_transition(u64 addr, const struct pkvm_mem_transition *tx,
-				 enum pkvm_page_state state)
-{
-	u64 size = tx->nr_pages * PAGE_SIZE;
-
-	if (__host_ack_skip_pgtable_check(tx))
-		return 0;
-
-	return __host_check_page_state_range(addr, size, state);
-}
-
-static int host_ack_donation(u64 addr, const struct pkvm_mem_transition *tx)
-{
-	return __host_ack_transition(addr, tx, PKVM_NOPAGE);
-}
-
-static int host_complete_donation(u64 addr, const struct pkvm_mem_transition *tx)
-{
-	u64 size = tx->nr_pages * PAGE_SIZE;
-	u8 host_id = tx->completer.id;
-
-	return host_stage2_set_owner_locked(addr, size, host_id);
-}
-
 static enum pkvm_page_state hyp_get_page_state(kvm_pte_t pte, u64 addr)
 {
 	if (!kvm_pte_valid(pte))
@@ -745,52 +662,6 @@ static int __hyp_check_page_state_range(u64 addr, u64 size,
 	return check_page_state_range(&pkvm_pgtable, addr, size, &d);
 }
 
-static int hyp_request_donation(u64 *completer_addr,
-				const struct pkvm_mem_transition *tx)
-{
-	u64 size = tx->nr_pages * PAGE_SIZE;
-	u64 addr = tx->initiator.addr;
-
-	*completer_addr = tx->initiator.hyp.completer_addr;
-	return __hyp_check_page_state_range(addr, size, PKVM_PAGE_OWNED);
-}
-
-static int hyp_initiate_donation(u64 *completer_addr,
-				 const struct pkvm_mem_transition *tx)
-{
-	u64 size = tx->nr_pages * PAGE_SIZE;
-	int ret;
-
-	*completer_addr = tx->initiator.hyp.completer_addr;
-	ret = kvm_pgtable_hyp_unmap(&pkvm_pgtable, tx->initiator.addr, size);
-	return (ret != size) ? -EFAULT : 0;
-}
-
-static bool __hyp_ack_skip_pgtable_check(const struct pkvm_mem_transition *tx)
-{
-	return !(IS_ENABLED(CONFIG_NVHE_EL2_DEBUG) ||
-		 tx->initiator.id != PKVM_ID_HOST);
-}
-
-static int hyp_ack_donation(u64 addr, const struct pkvm_mem_transition *tx)
-{
-	u64 size = tx->nr_pages * PAGE_SIZE;
-
-	if (__hyp_ack_skip_pgtable_check(tx))
-		return 0;
-
-	return __hyp_check_page_state_range(addr, size, PKVM_NOPAGE);
-}
-
-static int hyp_complete_donation(u64 addr,
-				 const struct pkvm_mem_transition *tx)
-{
-	void *start = (void *)addr, *end = start + (tx->nr_pages * PAGE_SIZE);
-	enum kvm_pgtable_prot prot = pkvm_mkstate(PAGE_HYP, PKVM_PAGE_OWNED);
-
-	return pkvm_create_mappings_locked(start, end, prot);
-}
-
 static enum pkvm_page_state guest_get_page_state(kvm_pte_t pte, u64 addr)
 {
 	if (!kvm_pte_valid(pte))
@@ -812,94 +683,6 @@ static int __guest_check_page_state_range(struct pkvm_hyp_vcpu *vcpu, u64 addr,
 	return check_page_state_range(&vm->pgt, addr, size, &d);
 }
 
-static int check_donation(struct pkvm_mem_donation *donation)
-{
-	const struct pkvm_mem_transition *tx = &donation->tx;
-	u64 completer_addr;
-	int ret;
-
-	switch (tx->initiator.id) {
-	case PKVM_ID_HOST:
-		ret = host_request_owned_transition(&completer_addr, tx);
-		break;
-	case PKVM_ID_HYP:
-		ret = hyp_request_donation(&completer_addr, tx);
-		break;
-	default:
-		ret = -EINVAL;
-	}
-
-	if (ret)
-		return ret;
-
-	switch (tx->completer.id) {
-	case PKVM_ID_HOST:
-		ret = host_ack_donation(completer_addr, tx);
-		break;
-	case PKVM_ID_HYP:
-		ret = hyp_ack_donation(completer_addr, tx);
-		break;
-	default:
-		ret = -EINVAL;
-	}
-
-	return ret;
-}
-
-static int __do_donate(struct pkvm_mem_donation *donation)
-{
-	const struct pkvm_mem_transition *tx = &donation->tx;
-	u64 completer_addr;
-	int ret;
-
-	switch (tx->initiator.id) {
-	case PKVM_ID_HOST:
-		ret = host_initiate_donation(&completer_addr, tx);
-		break;
-	case PKVM_ID_HYP:
-		ret = hyp_initiate_donation(&completer_addr, tx);
-		break;
-	default:
-		ret = -EINVAL;
-	}
-
-	if (ret)
-		return ret;
-
-	switch (tx->completer.id) {
-	case PKVM_ID_HOST:
-		ret = host_complete_donation(completer_addr, tx);
-		break;
-	case PKVM_ID_HYP:
-		ret = hyp_complete_donation(completer_addr, tx);
-		break;
-	default:
-		ret = -EINVAL;
-	}
-
-	return ret;
-}
-
-/*
- * do_donate():
- *
- * The page owner transfers ownership to another component, losing access
- * as a consequence.
- *
- * Initiator: OWNED	=> NOPAGE
- * Completer: NOPAGE	=> OWNED
- */
-static int do_donate(struct pkvm_mem_donation *donation)
-{
-	int ret;
-
-	ret = check_donation(donation);
-	if (ret)
-		return ret;
-
-	return WARN_ON(__do_donate(donation));
-}
-
 int __pkvm_host_share_hyp(u64 pfn)
 {
 	u64 phys = hyp_pfn_to_phys(pfn);
@@ -964,30 +747,29 @@ int __pkvm_host_unshare_hyp(u64 pfn)
 
 int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages)
 {
+	u64 phys = hyp_pfn_to_phys(pfn);
+	u64 size = PAGE_SIZE * nr_pages;
+	void *virt = __hyp_va(phys);
+	enum kvm_pgtable_prot prot;
 	int ret;
-	u64 host_addr = hyp_pfn_to_phys(pfn);
-	u64 hyp_addr = (u64)__hyp_va(host_addr);
-	struct pkvm_mem_donation donation = {
-		.tx	= {
-			.nr_pages	= nr_pages,
-			.initiator	= {
-				.id	= PKVM_ID_HOST,
-				.addr	= host_addr,
-				.host	= {
-					.completer_addr = hyp_addr,
-				},
-			},
-			.completer	= {
-				.id	= PKVM_ID_HYP,
-			},
-		},
-	};
 
 	host_lock_component();
 	hyp_lock_component();
 
-	ret = do_donate(&donation);
+	ret = __host_check_page_state_range(phys, size, PKVM_PAGE_OWNED);
+	if (ret)
+		goto unlock;
+	if (IS_ENABLED(CONFIG_NVHE_EL2_DEBUG)) {
+		ret = __hyp_check_page_state_range((u64)virt, size, PKVM_NOPAGE);
+		if (ret)
+			goto unlock;
+	}
 
+	prot = pkvm_mkstate(PAGE_HYP, PKVM_PAGE_OWNED);
+	WARN_ON(pkvm_create_mappings_locked(virt, virt + size, prot));
+	WARN_ON(host_stage2_set_owner_locked(phys, size, PKVM_ID_HYP));
+
+unlock:
 	hyp_unlock_component();
 	host_unlock_component();
 
@@ -996,30 +778,27 @@ int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages)
 
 int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages)
 {
+	u64 phys = hyp_pfn_to_phys(pfn);
+	u64 size = PAGE_SIZE * nr_pages;
+	u64 virt = (u64)__hyp_va(phys);
 	int ret;
-	u64 host_addr = hyp_pfn_to_phys(pfn);
-	u64 hyp_addr = (u64)__hyp_va(host_addr);
-	struct pkvm_mem_donation donation = {
-		.tx	= {
-			.nr_pages	= nr_pages,
-			.initiator	= {
-				.id	= PKVM_ID_HYP,
-				.addr	= hyp_addr,
-				.hyp	= {
-					.completer_addr = host_addr,
-				},
-			},
-			.completer	= {
-				.id	= PKVM_ID_HOST,
-			},
-		},
-	};
 
 	host_lock_component();
 	hyp_lock_component();
 
-	ret = do_donate(&donation);
+	ret = __hyp_check_page_state_range(virt, size, PKVM_PAGE_OWNED);
+	if (ret)
+		goto unlock;
+	if (IS_ENABLED(CONFIG_NVHE_EL2_DEBUG)) {
+		ret = __host_check_page_state_range(phys, size, PKVM_NOPAGE);
+		if (ret)
+			goto unlock;
+	}
 
+	WARN_ON(kvm_pgtable_hyp_unmap(&pkvm_pgtable, virt, size) != size);
+	WARN_ON(host_stage2_set_owner_locked(phys, size, PKVM_ID_HOST));
+
+unlock:
 	hyp_unlock_component();
 	host_unlock_component();
 
-- 
2.47.1.688.g23fc6f90ad-goog


