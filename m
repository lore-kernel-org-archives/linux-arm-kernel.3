Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D54CC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 13:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IssmhnqRudZsxjiRsA8TYrjZCkSxLOLV3HUbHzh9fsc=; b=5A3CkCqQPF01HzzSZ6C2M6Z5Z7
	LBj1A7HxlLO15KuDN58tpFOs/Xm8EZoW0qD6HY2l0g2mwJ58hRMkpEhxJfzOqcITkKP8Uxl/BwZEu
	HHem/48SBAi7klSDJzzgQ54Kctrw9Y1ZJmAHA0afiuUkRCVyVdxsmiLWjURo6FlJLgIYZiH7PdyDB
	ueCUe6Tk9MLrZVjvfhf0PDXsyOFOm1TrSRuyobnUIBQD/W9RaFNwuVCIf5We3lIkCwAoKwimj+a9T
	F99hJqgDWK/t8dlnjLYvrF0HPJzCMQEmifk5pkC9VKEouXcP+sF/qgKnquIU0jszKc2zn4+lwh5Rb
	d8jTGPrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGcA3-0000000CttW-1WGF;
	Tue, 13 Oct 2026 13:03:19 +0000
Received: from out-110.mta0.migadu.com ([2001:41d0:1004:224b::6e] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGcA0-0000000Ctqc-21ND
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 13:03:18 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=CaYuksYIH3T9mue+o25Jw5LFw402j/q0Agp5Li01cWU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791896594; v=1; x=1792501394;
 b=IG3Zvy601YEUx85CV0MJ+ThtPVQyiTOp0mg35T0kjYR1Cm6RQ7t01K2+F4JkQ86558rWwmdP
 6TayDZw7/hN+7N/+ZABN8GGk6n6bRgZL3y+o+nD+4MXSgNOYLc6oVGtkUBLOX38LFwTqMKzBe3C
 RHS2YH+V2MU2Y+pv0YOLQ8aw=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 5fed7ca6c3443aa9;
	Tue, 13 Oct 2026 13:03:13 +0000
X-Mizu-Trace-ID: 5fed7ca6c3443aa9
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Mark Brown <broonie@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] perf: arm_brbe: Remove the check for TME transaction states
Date: Tue, 13 Oct 2026 14:02:47 +0100
Message-Id: <20261013130247.4135515-5-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261013130247.4135515-1-fuad.tabba@linux.dev>
References: <20261013130247.4135515-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_060316_668212_2A788D89 
X-CRM114-Status: GOOD (  11.92  )
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

When an event samples branch flags, the BRBE driver warns once if a
branch record has BRBINFx_EL1.T or LASTFAILED set, which its comment
calls TME-related information. FEAT_TME has been withdrawn from the
architecture, and both fields are RES0 in DDI0601 2026-09, so the check
tests fields that no longer exist.

Remove the check and its two accessors, which were the only users of
the fields' defines, and mark both fields RES0 in the sysreg file.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/tools/sysreg |  5 +----
 drivers/perf/arm_brbe.c | 18 ------------------
 2 files changed, 1 insertion(+), 22 deletions(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 99af1c39478be..b15a59b9e95dd 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1338,10 +1338,7 @@ Res0	63:47
 Field	46	CCU
 Field	45:40	CC_EXP
 Field	39:32	CC_MANT
-Res0	31:18
-Field	17	LASTFAILED
-Field	16	T
-Res0	15:14
+Res0	31:14
 Enum	13:8		TYPE
 	0b000000	DIRECT_UNCOND
 	0b000001	INDIRECT
diff --git a/drivers/perf/arm_brbe.c b/drivers/perf/arm_brbe.c
index 254be4da8ae29..073d145847417 100644
--- a/drivers/perf/arm_brbe.c
+++ b/drivers/perf/arm_brbe.c
@@ -166,21 +166,11 @@ static bool brbe_record_is_target_only(u64 brbinf)
 	return brbe_record_valid(brbinf) == BRBINFx_EL1_VALID_TARGET;
 }
 
-static int brbinf_get_in_tx(u64 brbinf)
-{
-	return FIELD_GET(BRBINFx_EL1_T_MASK, brbinf);
-}
-
 static int brbinf_get_mispredict(u64 brbinf)
 {
 	return FIELD_GET(BRBINFx_EL1_MPRED_MASK, brbinf);
 }
 
-static int brbinf_get_lastfailed(u64 brbinf)
-{
-	return FIELD_GET(BRBINFx_EL1_LASTFAILED_MASK, brbinf);
-}
-
 static u16 brbinf_get_cycles(u64 brbinf)
 {
 	u32 exp, mant, cycles;
@@ -627,14 +617,6 @@ static bool perf_entry_from_brbe_regset(int index, struct perf_branch_entry *ent
 			entry->mispred = brbinf_get_mispredict(brbinf);
 			entry->predicted = !entry->mispred;
 		}
-
-		/*
-		 * Currently TME feature is neither implemented in any hardware
-		 * nor it is being supported in the kernel. Just warn here once
-		 * if TME related information shows up rather unexpectedly.
-		 */
-		if (brbinf_get_lastfailed(brbinf) || brbinf_get_in_tx(brbinf))
-			pr_warn_once("Unknown transaction states\n");
 	}
 
 	/*
-- 
2.39.5


