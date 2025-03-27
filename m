Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D4F6C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 16:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z51hX2ubcFhMKJ5by2u7YjCKZ3Nzr1b3Lq1PylQ9GKA=; b=xHXy0Q1mQ6GHTKeLf7dQJ62qHu
	mwor2oXUB3WmlhNk9ru9d2v+FSSF46i10ZG1PUkDTWnEiHSDMUkMV2l4xBaQR4CemozOfCnL9pbui
	iklF0TmMnrm1e0n7LVxSJ/5GXl4rSU4ABrPhP+84Vt53laf1wRoRzEPpQboq5UKVakKjrL84dG3OL
	hfmvzBVdffpWXqWtOQIcDiC/D/pjxZD9RnA+AGQFLLv5ZWOxxspyrgAgMuec3k9j2l5YWxmnorNEu
	Fe1x2cOr/ZO20mVntZRr8bpKLIqpcTiOWXeFRKcEnykJTg3Q4QVNt+BdUSJ1xKxrdkW+Mh1CZtLiv
	RcEGKmRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txqJn-0000000BYIw-3VsY;
	Thu, 27 Mar 2025 16:42:59 +0000
Received: from out-176.mta1.migadu.com ([95.215.58.176])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txqF5-0000000BXLi-3N8s
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 16:38:09 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743093482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Z51hX2ubcFhMKJ5by2u7YjCKZ3Nzr1b3Lq1PylQ9GKA=;
	b=gOi6g9wKrGSV5UH/x54wg6WFP3jRV9kCC53qdcKuyEwOYsTNbTvmY/kgEf70GSTgtes9jT
	RMIMsSF91b+mRVbfbms+jIBn14Dhmv3Skw6Jkb1GSznvz7Zm9v/3dJkyHjEwThs4pylu3s
	DUepdIINJzrmUGd3pr5cqru3B+DW/LM=
From: Oliver Upton <oliver.upton@linux.dev>
To: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Subject: [PATCH] smccc: kvm_guest: Align with DISCOVER_IMPL_CPUS ABI
Date: Thu, 27 Mar 2025 09:36:15 -0700
Message-Id: <20250327163613.2516073-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_093808_534869_6216EB05 
X-CRM114-Status: UNSURE (   9.88  )
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

The ABI of the hypercall requires that R2 and R3 are 0. Explicitly pass
0 for these parameters.

Cc: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Fixes: 86edf6bdcf05 ("smccc/kvm_guest: Enable errata based on implementation CPUs")
Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
---
 drivers/firmware/smccc/kvm_guest.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/smccc/kvm_guest.c b/drivers/firmware/smccc/kvm_guest.c
index 5767aed25cdc..ac2d3cf8a776 100644
--- a/drivers/firmware/smccc/kvm_guest.c
+++ b/drivers/firmware/smccc/kvm_guest.c
@@ -95,7 +95,7 @@ void  __init kvm_arm_target_impl_cpu_init(void)
 
 	for (i = 0; i < max_cpus; i++) {
 		arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_DISCOVER_IMPL_CPUS_FUNC_ID,
-				     i, &res);
+				     i, 0, 0, &res);
 		if (res.a0 != SMCCC_RET_SUCCESS) {
 			pr_warn("Discovering target implementation CPUs failed\n");
 			goto mem_free;

base-commit: 369c0122682c4468a69f2454614eded71c5348f3
-- 
2.39.5


