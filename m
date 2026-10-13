Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D154CC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 13:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KUy8+UnM32a/TISywaq2/8D37Uuaxb5LafymWJd9kM0=; b=ZqJFWI1Bh10ppFU+9c3NnOJe9m
	78cgm7N1w/GLFAabZkxIZKWz83MOg2On495aaoP+L/nfnGHjv9Gp2mizSEIZJXRAmtVpXbNCThk/g
	4DeZK05N3rj0jQVIrQLGYLFMq4pJF6VoYVXs5hI1n+3jUSm5RUkgtS+/h0IJzaPbUApN4/6LRnsDh
	1wPRLQRWxP48WW9fQQyhkQPmAk+kRn7L5e69V7s58rQnVLxJ6xFky85oJ6Sk/LnM825qGxUmvBmHS
	ip90Oq59GyxMeHgoExqaC6InUbMpH8KuigUJp9zG4ENGJR9zLiqn/NytIvmQnOiNSJ0onny51XSwg
	z1Gr8QGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGc9w-0000000CtoT-07s1;
	Tue, 13 Oct 2026 13:03:12 +0000
Received: from out-93.mta1.migadu.com ([2001:41d0:203:375::5d] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGc9r-0000000CtmE-0XY9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 13:03:08 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=6pfi29I7iZeVkWM5Pq02jetXzg693tfWNUUszIMV4EE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791896585; v=1; x=1792501385;
 b=pqOiIlGxgUonKJwRaQXd7Z5ju8E/o9w4OPzciRxGcJyg6WF3B/AcLWNT6cYHz4YOE/SIMd9X
 9XIzX10MZ8KF04w/IHZABJo0lcVTut+hw0BOj7vC/4v51QIFrmB6ebeYP2NXDkg4Bk0nUFBsk+7
 yZSjWUkLQaWoLzfo/Sh11hf0=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 89b7ad62b8944177;
	Tue, 13 Oct 2026 13:03:04 +0000
X-Mizu-Trace-ID: 89b7ad62b8944177
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
Subject: [PATCH 2/4] arm64: sysreg: Fix the names of two misspelt fields
Date: Tue, 13 Oct 2026 14:02:45 +0100
Message-Id: <20261013130247.4135515-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261013130247.4135515-1-fuad.tabba@linux.dev>
References: <20261013130247.4135515-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_060307_360626_B43E5EA5 
X-CRM114-Status: GOOD (  12.14  )
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

Two fields in the sysreg file have the wrong name. In DDI0601 2026-09,
bit 10 of HFGRTR2_EL2 and HFGWTR2_EL2, which traps SCTLR2ALIAS_EL1, is
nSCTLR2ALIAS_EL1, not nSCTLRALIAS2_EL1, and bits [39:36] of SMPRIMAP_EL2
are P9, between P8 and P10, not F9.

Rename both, along with the three KVM users of the first. The second
has no users.

No functional change intended.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/config.c         | 4 ++--
 arch/arm64/kvm/emulate-nested.c | 2 +-
 arch/arm64/tools/sysreg         | 6 +++---
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index 1053676551aff..e93919cadf860 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -804,7 +804,7 @@ static const struct reg_bits_to_feat_map hfgrtr2_feat_map[] = {
 		   HFGRTR2_EL2_nCPACRALIAS_EL1	|
 		   HFGRTR2_EL2_nCPACRMASK_EL1	|
 		   HFGRTR2_EL2_nSCTLR2MASK_EL1	|
-		   HFGRTR2_EL2_nSCTLRALIAS2_EL1	|
+		   HFGRTR2_EL2_nSCTLR2ALIAS_EL1	|
 		   HFGRTR2_EL2_nSCTLRALIAS_EL1	|
 		   HFGRTR2_EL2_nSCTLRMASK_EL1	|
 		   HFGRTR2_EL2_nTCR2ALIAS_EL1	|
@@ -825,7 +825,7 @@ static const struct reg_bits_to_feat_map hfgwtr2_feat_map[] = {
 		   HFGWTR2_EL2_nCPACRALIAS_EL1	|
 		   HFGWTR2_EL2_nCPACRMASK_EL1	|
 		   HFGWTR2_EL2_nSCTLR2MASK_EL1	|
-		   HFGWTR2_EL2_nSCTLRALIAS2_EL1	|
+		   HFGWTR2_EL2_nSCTLR2ALIAS_EL1	|
 		   HFGWTR2_EL2_nSCTLRALIAS_EL1	|
 		   HFGWTR2_EL2_nSCTLRMASK_EL1	|
 		   HFGWTR2_EL2_nTCR2ALIAS_EL1	|
diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index f59d89d04ecaf..fc23c793ef176 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -1431,7 +1431,7 @@ static const struct encoding_to_trap_config encoding_to_fgt[] __initconst = {
 	SR_FGT(SYS_CPACRMASK_EL1,	HFGRTR2, nCPACRMASK_EL1, 0),
 	SR_FGT(SYS_PFAR_EL1,		HFGRTR2, nPFAR_EL1, 0),
 	SR_FGT(SYS_RCWSMASK_EL1,	HFGRTR2, nRCWSMASK_EL1, 0),
-	SR_FGT(SYS_SCTLR2ALIAS_EL1,	HFGRTR2, nSCTLRALIAS2_EL1, 0),
+	SR_FGT(SYS_SCTLR2ALIAS_EL1,	HFGRTR2, nSCTLR2ALIAS_EL1, 0),
 	SR_FGT(SYS_SCTLR2MASK_EL1,	HFGRTR2, nSCTLR2MASK_EL1, 0),
 	SR_FGT(SYS_SCTLRALIAS_EL1,	HFGRTR2, nSCTLRALIAS_EL1, 0),
 	SR_FGT(SYS_SCTLRMASK_EL1,	HFGRTR2, nSCTLRMASK_EL1, 0),
diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index f2812545f336e..341db8e9b6c37 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -4336,7 +4336,7 @@ Field	14	nACTLRALIAS_EL1
 Field	13	nACTLRMASK_EL1
 Field	12	nTCR2ALIAS_EL1
 Field	11	nTCRALIAS_EL1
-Field	10	nSCTLRALIAS2_EL1
+Field	10	nSCTLR2ALIAS_EL1
 Field	9	nSCTLRALIAS_EL1
 Field	8	nCPACRALIAS_EL1
 Field	7	nTCR2MASK_EL1
@@ -4355,7 +4355,7 @@ Field	14	nACTLRALIAS_EL1
 Field	13	nACTLRMASK_EL1
 Field	12	nTCR2ALIAS_EL1
 Field	11	nTCRALIAS_EL1
-Field	10	nSCTLRALIAS2_EL1
+Field	10	nSCTLR2ALIAS_EL1
 Field	9	nSCTLRALIAS_EL1
 Field	8	nCPACRALIAS_EL1
 Field	7	nTCR2MASK_EL1
@@ -4592,7 +4592,7 @@ Field	55:52	P13
 Field	51:48	P12
 Field	47:44	P11
 Field	43:40	P10
-Field	39:36	F9
+Field	39:36	P9
 Field	35:32	P8
 Field	31:28	P7
 Field	27:24	P6
-- 
2.39.5


