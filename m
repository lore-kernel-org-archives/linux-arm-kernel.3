Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E06D149E8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 19:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tm9klPokIaTyW3+rN5LwBgShYgrwmCrkRkYvLTHZaEA=; b=giSf4UdR1ILBUIScpNE0VCRpzn
	aPBUPijaua53+ZfRdwjkOcTHnXa6jiSkVcilcHnXnMAIfHCRxuY/ZdWPwaHOKP6ZEeyZqjE6PdoMk
	oibuSgObE/ZX/3+ztoAr1n0hPkxdtDjeAIJehgtX7MJKDHmoLGF8oXg/CTDIH8H/+lGOy3IX7hZ13
	5i8/zfGsLajxHru5FlpLkgizuBR1swyM9nXRScRtDv0J6XduKHy6329EVLOk5kjrUF0RekudRL7gZ
	NyxR7dfEBgzGibYd/VZHLxi4GZkoVyKVM9zE7XXTPc7pgPkgFw3OPYbJptQFF/T4KuKrXwQOzE168
	FGx7WtCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Pi9-00000004uPR-0SIj;
	Fri, 25 Oct 2024 19:11:01 +0000
Received: from out-186.mta1.migadu.com ([2001:41d0:203:375::ba])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Oz0-00000004mqK-2jwr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 18:24:24 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1729880660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tm9klPokIaTyW3+rN5LwBgShYgrwmCrkRkYvLTHZaEA=;
	b=xAAF1zESpqxl1al57F1z2eSH8ygVVG+N3KSq01OZtIqfAMMSELrvox0sC+4RDq+b9SYJq3
	MdECuMdcFKZZeXmfrvw2ReJZEt2Xhj5DRyrQ+E9c1sKn6HWz7kRsEq+SA4iui5q7WCxFQR
	6/i4BWazmfpCJnUoc5vmnA7L1o61H2g=
From: Oliver Upton <oliver.upton@linux.dev>
To: kvmarm@lists.linux.dev
Cc: Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Oliver Upton <oliver.upton@linux.dev>
Subject: [PATCH v4 06/18] KVM: arm64: nv: Allow coarse-grained trap combos to use complex traps
Date: Fri, 25 Oct 2024 18:23:41 +0000
Message-ID: <20241025182354.3364124-7-oliver.upton@linux.dev>
In-Reply-To: <20241025182354.3364124-1-oliver.upton@linux.dev>
References: <20241025182354.3364124-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_112423_001885_6BBADDF9 
X-CRM114-Status: GOOD (  10.20  )
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

KVM uses a sanity-check to avoid infinite recursion in trap combinations
that could potentially depend on itself. Narrow the scope of this sanity
check to the exact CGT IDs that correspond w/ trap combos, opening the
door to using 'complex' traps as part of a combination.

Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
---
 arch/arm64/kvm/emulate-nested.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 05b6435d02a9..da7ab14e036d 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -2021,7 +2021,8 @@ int __init populate_nv_trap_config(void)
 		cgids = coarse_control_combo[id - __MULTIPLE_CONTROL_BITS__];
 
 		for (int i = 0; cgids[i] != __RESERVED__; i++) {
-			if (cgids[i] >= __MULTIPLE_CONTROL_BITS__) {
+			if (cgids[i] >= __MULTIPLE_CONTROL_BITS__ &&
+			    cgids[i] < __COMPLEX_CONDITIONS__) {
 				kvm_err("Recursive MCB %d/%d\n", id, cgids[i]);
 				ret = -EINVAL;
 			}
-- 
2.47.0.163.g1226f6d8fa-goog


