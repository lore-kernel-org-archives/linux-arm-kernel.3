Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD85CC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 13:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1pAAkw7KfB62oERc1OuudxrxUnRfUu4xLLytcVX1Ohw=; b=wOYF9oNVoUMZ++HLI7o8gAKug5
	bkkxbB/lAtbCniaDSgY1rrE+pKKDOGAsR1G4lZdgzYHHYsJDSL85g4WDGre+M9UsvLfBHP1Tc74kP
	DXSGNboCXs2avpEIn9h02fnQvi5CVzDGDstKRC3S/I9FC/1AWOlReH9DWqUNQL70iRdQAdKwlFE3t
	QX83fYvLfe5A7tA0qGgHTqo0h8nbrZS8HB3FrBvWm7EawrT9n6aS3AS/IXbVQof1mKh4lQxXhyBR9
	/wTnCR47kz1FNk7ek4gPpuhqCxOBVHDCf8fm0eaYGPO4f+FDguuIgCgWS+pVLx3HOus7RWj9oZCTD
	q+h66mQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7DvE-00000007LyZ-2Edf;
	Tue, 22 Apr 2025 13:44:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Chp-0000000765c-0gTG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 12:26:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D04AA4A840;
	Tue, 22 Apr 2025 12:26:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F212C4CEEE;
	Tue, 22 Apr 2025 12:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745324788;
	bh=8iK6D+BtFfPpXhilVCWkUQ+VCnMea81DFQeOw2KQ8nc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DrFAWULe3zpVlqkkln/eMLp61v8DyREfh/ZmpESSy9xZUHxKrXFhKlvXWjoZQJL5o
	 66x5YUOeacsJjaW7zVmxvcIZKri1TlD12MCG/mXt/iDgmofgAI+Q0giRGVWTHxIpiT
	 nedwCl4o02LBsvBelNkKgDkxOZZz83JsigmFZ+a5R5fBJATUpiV/Pw6fFSjQCzaFt8
	 RDFA5rpG3bEiGqC0A+AbUYeMKaEpbsI90lolGCrDIGdK+s0d3U4CPnxG2ZmUyB07cB
	 r84+0/7GkzGK337WeuJNiTNWbpbyqsD6763FWoH+OXdoBiDzZJpXealwxMg5jYRgBa
	 ssIqgqwjZKijw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1u7Chl-007c9q-Rj;
	Tue, 22 Apr 2025 13:26:25 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	D Scott Phillips <scott@os.amperecomputing.com>
Subject: [PATCH 1/3] KVM: arm64: Fix PAR_EL1.{PTW,S} reporting on AT S1E*
Date: Tue, 22 Apr 2025 13:26:10 +0100
Message-Id: <20250422122612.2675672-2-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250422122612.2675672-1-maz@kernel.org>
References: <20250422122612.2675672-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, scott@os.amperecomputing.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_052629_244175_7D4BBCFC 
X-CRM114-Status: GOOD (  15.25  )
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

When an AT S1E* operation fails, we need to report whether the
translation failed at S2, and whether this was during a S1 PTW.

But these two bits are not independent. PAR_EL1.PTW can only be
set of PAR_EL1.S is also set, and PAR_EL1.S can only be set on
its own when the full S1 PTW has succeeded, but that the access
itself is reporting a fault at S2.

As a result, it makes no sense to carry both ptw and s2 as parameters
to fail_s1_walk(), and they should be unified.

This fixes a number of cases where we were reporting PTW=1 *and*
S=0, which makes no sense.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/at.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index f74a66ce3064b..3a4568e2de910 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -60,11 +60,11 @@ struct s1_walk_result {
 	bool	failed;
 };
 
-static void fail_s1_walk(struct s1_walk_result *wr, u8 fst, bool ptw, bool s2)
+static void fail_s1_walk(struct s1_walk_result *wr, u8 fst, bool s1ptw)
 {
 	wr->fst		= fst;
-	wr->ptw		= ptw;
-	wr->s2		= s2;
+	wr->ptw		= s1ptw;
+	wr->s2		= s1ptw;
 	wr->failed	= true;
 }
 
@@ -345,11 +345,11 @@ static int setup_s1_walk(struct kvm_vcpu *vcpu, u32 op, struct s1_walk_info *wi,
 	return 0;
 
 addrsz:				/* Address Size Fault level 0 */
-	fail_s1_walk(wr, ESR_ELx_FSC_ADDRSZ_L(0), false, false);
+	fail_s1_walk(wr, ESR_ELx_FSC_ADDRSZ_L(0), false);
 	return -EFAULT;
 
 transfault_l0:			/* Translation Fault level 0 */
-	fail_s1_walk(wr, ESR_ELx_FSC_FAULT_L(0), false, false);
+	fail_s1_walk(wr, ESR_ELx_FSC_FAULT_L(0), false);
 	return -EFAULT;
 }
 
@@ -380,13 +380,13 @@ static int walk_s1(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
 			if (ret) {
 				fail_s1_walk(wr,
 					     (s2_trans.esr & ~ESR_ELx_FSC_LEVEL) | level,
-					     true, true);
+					     true);
 				return ret;
 			}
 
 			if (!kvm_s2_trans_readable(&s2_trans)) {
 				fail_s1_walk(wr, ESR_ELx_FSC_PERM_L(level),
-					     true, true);
+					     true);
 
 				return -EPERM;
 			}
@@ -396,8 +396,7 @@ static int walk_s1(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
 
 		ret = kvm_read_guest(vcpu->kvm, ipa, &desc, sizeof(desc));
 		if (ret) {
-			fail_s1_walk(wr, ESR_ELx_FSC_SEA_TTW(level),
-				     true, false);
+			fail_s1_walk(wr, ESR_ELx_FSC_SEA_TTW(level), false);
 			return ret;
 		}
 
@@ -468,10 +467,10 @@ static int walk_s1(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
 	return 0;
 
 addrsz:
-	fail_s1_walk(wr, ESR_ELx_FSC_ADDRSZ_L(level), true, false);
+	fail_s1_walk(wr, ESR_ELx_FSC_ADDRSZ_L(level), false);
 	return -EINVAL;
 transfault:
-	fail_s1_walk(wr, ESR_ELx_FSC_FAULT_L(level), true, false);
+	fail_s1_walk(wr, ESR_ELx_FSC_FAULT_L(level), false);
 	return -ENOENT;
 }
 
@@ -1198,7 +1197,7 @@ static u64 handle_at_slow(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
 	}
 
 	if (perm_fail)
-		fail_s1_walk(&wr, ESR_ELx_FSC_PERM_L(wr.level), false, false);
+		fail_s1_walk(&wr, ESR_ELx_FSC_PERM_L(wr.level), false);
 
 compute_par:
 	return compute_par_s1(vcpu, &wr, wi.regime);
-- 
2.39.2


