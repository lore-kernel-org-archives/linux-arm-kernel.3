Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D17CF65EF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 12:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fBYbJMWSJI3EdgW+3CF1O1ERPj/u7YL/V4ygr00tHtA=; b=DJsTHUpRrU0gqxcbOnhT71vNAA
	UpbUKNH2GO8ifJsigjs0qpZqVZFJHoQt+p1kENufrlBUkteRkfvG5Pdo9SaiwluqnIO7Wqte7Rhdx
	0fH36o3G86s6xUHAnZEtoowYNV+HdmI7hvaPxGr49b63AHIA8Mprtlnig6De+HPGLY1MSR0iuq3L2
	ei3cXsbtnM3TG1qoe8xnv87/xWJdYse//Pyh1dd5cyjVweYtIG+6o4EnPWjQ1zPFsW81b9BeXj5SW
	xcESwKUouSrpolHScUZbtsTA3D2czvzGJIFDijNoZOljr0ZqxE3IQFllumU9L1Wdf1jWCxnPZTgvo
	HjC3kwKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkLXV-0000000CV7T-0Rtt;
	Mon, 26 Jan 2026 12:17:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkLXF-0000000CUtc-2YEB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 12:17:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5E952443EB;
	Mon, 26 Jan 2026 12:17:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A7DDC2BC9E;
	Mon, 26 Jan 2026 12:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769429856;
	bh=tyIKkhm3K0P/fvjpxY/oYTkavJM8zjKv6f4KHx/szYc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UvtsIZeUVxLa+zWaNTZJbrP3MGSQDF+z16KPslzIfIH6rkK5FBuGyT16yW/bicshV
	 H8WwDySTBY9ydM+FksUJLi9YMK6ZyWlgtCrs/8kvYdO7YAoigT67QGedg7HY1t6G4y
	 uAFfsHVl7XqoIxPH0V/dVNJuZYGCowKRCC0JYhIGJsPfHRztxEmRRaGEa/4d3rFBEL
	 xePnLWnnRccGtYypuKxKza5jWbY5g8St4uYf28L6CQOJY89ZfZ+ANQjQIDYFwjwSKl
	 McodIyL5+Un7bJCBe4XEeOO/K38wHVqDS0pQ8ZguMeoceXtBwY+s9DanUrHeJeH/tl
	 wGMQ3majn/9IQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vkLXC-00000005hx6-1x5S;
	Mon, 26 Jan 2026 12:17:34 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH 12/20] KVM: arm64: Add RESx_WHEN_E2Hx constraints as configuration flags
Date: Mon, 26 Jan 2026 12:16:46 +0000
Message-ID: <20260126121655.1641736-13-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260126121655.1641736-1-maz@kernel.org>
References: <20260126121655.1641736-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_041737_759185_EA6FB3EE 
X-CRM114-Status: GOOD (  15.39  )
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

"Thanks" to VHE, SCTLR_EL2 radically changes shape depending on the
value of HCR_EL2.E2H, as a lot of the bits that didn't have much
meaning with E2H=0 start impacting EL0 with E2H=1.

This has a direct impact on the RESx behaviour of these bits, and
we need a way to express them.

For this purpose, introduce a set of 4 new constaints that, when
the controlling feature is not present, force the RESx value to
be either 0 or 1 depending on the value of E2H.

This allows diverging RESx values depending on the value of E2H,
something that is required by a bunch of SCTLR_EL2 bits.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/config.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index 1990cebc77c66..7063fffc22799 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -26,6 +26,10 @@ struct reg_bits_to_feat_map {
 #define	MASKS_POINTER	BIT(3)	/* Pointer to fgt_masks struct instead of bits */
 #define	AS_RES1		BIT(4)	/* RES1 when not supported */
 #define	REQUIRES_E2H1	BIT(5)	/* Add HCR_EL2.E2H RES1 as a pre-condition */
+#define	RES0_WHEN_E2H0	BIT(6)	/* RES0 when E2H=0 and not supported */
+#define	RES0_WHEN_E2H1	BIT(7)	/* RES0 when E2H=1 and not supported */
+#define	RES1_WHEN_E2H0	BIT(8)	/* RES1 when E2H=0 and not supported */
+#define	RES1_WHEN_E2H1	BIT(9)	/* RES1 when E2H=1 and not supported */
 
 	unsigned long	flags;
 
@@ -1298,10 +1302,24 @@ struct resx compute_resx_bits(struct kvm *kvm,
 			match &= !e2h0;
 		
 		if (!match) {
+			u64 bits = reg_feat_map_bits(&map[i]);
+
+			if (e2h0) {
+				if      (map[i].flags & RES1_WHEN_E2H0)
+					resx.res1 |= bits;
+				else if (map[i].flags & RES0_WHEN_E2H0)
+					resx.res0 |= bits;
+			} else {
+				if      (map[i].flags & RES1_WHEN_E2H1)
+					resx.res1 |= bits;
+				else if (map[i].flags & RES0_WHEN_E2H1)
+					resx.res0 |= bits;
+			}
+
 			if (map[i].flags & AS_RES1)
- 				resx.res1 |= reg_feat_map_bits(&map[i]);
-			else
-				resx.res0 |= reg_feat_map_bits(&map[i]);
+				resx.res1 |= bits;
+			else if (!(resx.res1 & bits))
+				resx.res0 |= bits;
 		}
 	}
 
-- 
2.47.3


