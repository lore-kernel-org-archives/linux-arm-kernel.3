Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AFEBC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 10:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e/ipqegKk/EDFfUXsHGBuepdJETo3GeI79VTrPNPXuo=; b=YymVhMcrOqJccMjHAmyr8oFBdi
	4SUafzJeqMOW5ZUE62p5mwltJpeBbfYOG5rr2WV5GVelGXHb7zM2GbCx7y0hwiS0zDJimBfaWIdId
	oy9kSAFVk4ZcfSHCsodaD7/IbJCmW/DjIh9xH5GNGrOYvSAPIiXWFCnDwZuDLpSqSEL7INpBb3jQ8
	qZKVarJgB9MOreKicAIgAJbjaLgQcrm8SmiJ8IUJMn+c8y5EjUiDrAJhnYUsrfeAyH2jSD+oKrnRX
	6hP+juv8CEXfRRd0jfXjFoQaATA0zZaa1Z7k0SCAqRGFlf1gTJOA+myZ5fwjBSPJrmoAZ24zjFpCC
	Xg1UsXig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggc5-0000000CDzH-3qwV;
	Mon, 06 Jul 2026 10:31:45 +0000
Received: from out-186.mta0.migadu.com ([2001:41d0:1004:224b::ba])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggc0-0000000CDva-4BaC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 10:31:42 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783333898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e/ipqegKk/EDFfUXsHGBuepdJETo3GeI79VTrPNPXuo=;
	b=Nmmu6IaOrdu6PBW/jnkewszoEC/rWSD1PRGq5VlcO3nSUoGX0RRL/cU+kCeymTymlnW5GX
	NXTfN77zactK172DKBzUvh4R8VrNeKzrU0rx7uWb7avw40TYpRVgw7XUuZT64QgUvPUuZf
	RtgdErx9A8biXmpazxNXQ0MRDAZdyGY=
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Keir Fraser <keirf@google.com>,
	Hyunwoo Kim <imv4bel@gmail.com>,
	Fuad Tabba <tabba@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] KVM: arm64: Drop redundant READ_ONCE() in pkvm_hyp_vm_is_created()
Date: Mon,  6 Jul 2026 11:31:29 +0100
Message-Id: <20260706103129.706974-4-fuad.tabba@linux.dev>
In-Reply-To: <20260706103129.706974-1-fuad.tabba@linux.dev>
References: <20260706103129.706974-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_033141_185209_4C9CF467 
X-CRM114-Status: GOOD (  10.17  )
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

is_created is written under config_lock. Every concurrent reader is
serialised against that write: pkvm_create_hyp_vm() under config_lock,
and the memslot path (kvm_arch_prepare_memory_region) via slots_lock,
which the creation writer also holds. The teardown-path accesses have no
concurrent writer. The read is therefore serialised, and the READ_ONCE()
is unnecessary.

Reviewed-by: Keir Fraser <keirf@google.com>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/pkvm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 67b90a58fbea2..008766273912e 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -185,7 +185,11 @@ static int __pkvm_create_hyp_vm(struct kvm *kvm)
 
 bool pkvm_hyp_vm_is_created(struct kvm *kvm)
 {
-	return READ_ONCE(kvm->arch.pkvm.is_created);
+	/*
+	 * Serialised by config_lock/slots_lock, or by VM lifecycle at
+	 * teardown, so a plain read suffices.
+	 */
+	return kvm->arch.pkvm.is_created;
 }
 
 int pkvm_create_hyp_vm(struct kvm *kvm)
-- 
2.39.5


