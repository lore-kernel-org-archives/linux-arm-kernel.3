Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F08ADC44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 14:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H8ElnFeb1Z3Bn7wd2FbJtfPrUjLWHnVW3u35FM1dhvg=; b=GmbndNpYWd6uP/ghfmWlKIh8YD
	hNHcYJiCDwJtAChPvPpE0DehCxOy5MiUFyG2FnnHYABC/tyDtmkXPLNjBtDiGlhZzlO1UKpAqCbFh
	NbtgJyLz4dE4DmACo50d8PJctppzZ78uXPC+A0smIMVmTDGsfCgdfnIMhMFvQ5OhuZCQQR8qY/hym
	WeD9CvJ5po1eWp58Yc5XfpSqtpy10XTAhp+auKtIj9byU0Kda8IuOHiQX+tfnY14iJh/hB21v92WG
	cEG++dC11OhxKBEzxVWchIP7tBVn+HzHY2M2EzMdZdYsmiA002b3TtvWp+31OKbb4okT0qR+eU0E0
	O9VIvgEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk0eQ-0000000FAcf-0Tdd;
	Wed, 15 Jul 2026 14:31:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk0dp-0000000FA1c-3HeF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 14:31:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA18F15A1;
	Wed, 15 Jul 2026 07:31:12 -0700 (PDT)
Received: from e122027.cambridge.arm.com (e122027.cambridge.arm.com [10.1.25.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0459F3F7B4;
	Wed, 15 Jul 2026 07:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784125877; bh=/DkC06ykICbYbu8lRH1puAEPBlPtvdphP1WP+AibYYM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Mkfra4+IcJ0yxokQd4mwR1MWgWfiDKuRjdn49nomVQc2bK/inpRfIaPDYkzt+wEGh
	 7B7RSCiauG7iw7RB6PQODvm29CUcIkOmXG4etFnbVhdGgBGjlq3jIuksREVyCNI+O9
	 tWqm6qMaCmwG1cPaXPwJN6sUlxr/7/BljXrsDKxs=
From: Steven Price <steven.price@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>,
	linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Emi Kisanuki <fj0570is@fujitsu.com>,
	Vishal Annapurve <vannapurve@google.com>,
	WeiLin.Chang@arm.com,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: [PATCH v15 30/37] KVM: arm64: CCA: Prevent Device mappings for realms
Date: Wed, 15 Jul 2026 15:28:32 +0100
Message-ID: <20260715142841.80544-31-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715142841.80544-1-steven.price@arm.com>
References: <20260715142841.80544-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_073118_005476_1BDABD04 
X-CRM114-Status: GOOD (  11.14  )
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

Physical device assignment is not yet supported. RMM v2.0 does add the
relevant APIs, but device assignment is a big topic so will be handled
in a future patch series. For now prevent device mappings when the guest
is a realm.

Signed-off-by: Steven Price <steven.price@arm.com>
---
Changes from v6:
 * Fix the check in user_mem_abort() to prevent all pages that are not
   guest_memfd() from being mapped into the protected half of the IPA.
Changes from v5:
 * Also prevent accesses in user_mem_abort()
---
 arch/arm64/kvm/mmu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 79119cb136b0..dc27f3dfb337 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1261,6 +1261,10 @@ int kvm_phys_addr_ioremap(struct kvm *kvm, phys_addr_t guest_ipa,
 	if (is_protected_kvm_enabled())
 		return -EPERM;
 
+	/* We don't support mapping special pages into a Realm */
+	if (kvm_is_realm(kvm))
+		return -EPERM;
+
 	size += offset_in_page(guest_ipa);
 	guest_ipa &= PAGE_MASK;
 
-- 
2.43.0


