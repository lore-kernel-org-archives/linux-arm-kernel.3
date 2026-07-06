Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00BCC43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 10:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sf3aVvVWV5y32+hWgZQOR7Ij0Kq541DNImzJ0Vu0T7Y=; b=rXHCM6psrMniPztKRgKSe95vaL
	3eYUC2SdnWQy433iFjdtCxVQy/e0mchMsWQtHFMqoRgRY7ZESM4mRaEVjBYVr6W5HPWCO5sPA8oJU
	rUTL38eZuasvWa6/4OtzN9sAFeMkQwZDCfKJvhjB/nIU6cK9/p1lBpGjOkEmmvFS/JzW7k1QkeC7n
	8bW9uP/Xx3Ykzl1A7lRV8vTRbI7d3F3oWm4NLJjX+Guvx1Xn/bSvyi2O1+9NZrsXbk538eBP7Sa9z
	sGKjkQvwqlE8wT4gaYDiqribfk2Ge6E4zS7Jo6fovDOx7ucpsGcZiDt6tbNxURrA/7AKkrn8mKXMJ
	8H0+l9ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggc2-0000000CDxR-36Pe;
	Mon, 06 Jul 2026 10:31:42 +0000
Received: from out-188.mta0.migadu.com ([2001:41d0:1004:224b::bc])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggbz-0000000CDuJ-1BGW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 10:31:40 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783333897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sf3aVvVWV5y32+hWgZQOR7Ij0Kq541DNImzJ0Vu0T7Y=;
	b=HyBiiCAsxm62at1/d1SoF3e4BUauw5uVShsxvFGFJumWpcj/EaO3A0Lb1NUDa3A2jyJyR2
	4JyoG9Codo2PEfpRDG1+yeV17tFmKInZUaddCU5PV8csfFuNzxeWgg9oWS//lhwPvtJ1e1
	3b7lYo1Mf2AZpfQPuNchABPHMysyjiU=
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
Subject: [PATCH v2 2/3] KVM: arm64: Remove unreachable early checks in pkvm_init_host_vm()
Date: Mon,  6 Jul 2026 11:31:28 +0100
Message-Id: <20260706103129.706974-3-fuad.tabba@linux.dev>
In-Reply-To: <20260706103129.706974-1-fuad.tabba@linux.dev>
References: <20260706103129.706974-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_033139_459389_4F263324 
X-CRM114-Status: UNSURE (   9.87  )
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

pkvm_init_host_vm() runs once from kvm_arch_init_vm(), while the VM is
still being allocated and is not yet reachable by another thread. Both
early checks therefore test impossible state: is_created is still false
(it is only set on first vCPU run) and the handle is still zero (this
function is what reserves it). Neither branch can be taken.

Remove them.

Reviewed-by: Keir Fraser <keirf@google.com>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/pkvm.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 053e4f733e4be..67b90a58fbea2 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -230,13 +230,6 @@ int pkvm_init_host_vm(struct kvm *kvm, unsigned long type)
 	int ret;
 	bool protected = type & KVM_VM_TYPE_ARM_PROTECTED;
 
-	if (pkvm_hyp_vm_is_created(kvm))
-		return -EINVAL;
-
-	/* VM is already reserved, no need to proceed. */
-	if (kvm->arch.pkvm.handle)
-		return 0;
-
 	/* Reserve the VM in hyp and obtain a hyp handle for the VM. */
 	ret = kvm_call_hyp_nvhe(__pkvm_reserve_vm);
 	if (ret < 0)
-- 
2.39.5


