Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FBF2E9B365
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 11:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hxcQkUNv28wJqthr7LcIAysnAWD6m+d8qaqANOX4VZs=; b=kw9fmLSnbYSB4Dxr1yIKMIn3eY
	hSCTEltzGQ+v6u98qY9E17rj3haQwEOgwjy4s0RsQDfa6Qnt+gn91yjLQ8MkC0QBjszoK07XGSrKT
	Gy5KLLxX4CJsRrDyzxiULEyKC+V6TmNAvQoUGPpvm5IAo1OmIS8lKCPGdofUmobJ0eUpjplmptLmB
	w9UF7HPDi6hRBFv/NdqVuglWCl/Yz/jkiCEoK4jgkwhFBQYFhPJAo2K7pRxfjkQ4fX8VjIFqw9jiU
	2x+0nAxKDbbc0VD+uPlIIYMXepQP8FEcSBp1ynkx5RwRXiHPtBztrteiI8mjMCs27DofdUq+Z9GM+
	bwGqY+3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1tl-0000000CsKZ-3FLo;
	Mon, 02 Mar 2026 11:57:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1tk-0000000CsIE-0sJi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 11:57:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 92061600AD;
	Mon,  2 Mar 2026 11:57:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F9C1C2BCB0;
	Mon,  2 Mar 2026 11:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772452635;
	bh=03KzXW9o4wnm5Pioh4GRaVPRsT8qGqkIjVh3cZzOc2M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BTrjRrBAJoMNmuG4YH/dXUGZjwNJp6WEejIhEOZ1YBd2QLTrI2nTq+rF+3g8LrM9K
	 ZxsztjR8jMMJq3obolgt6KcsFi0CDCphv2MyzWbCHRUd5fjBbY7MZtRlBt1/hq+37n
	 bHuW8PIcZ1bMFvHobRycqvVy0R8hvQkdTa6Rr1JxvnAN+GSogcqS2N6Y28FmVITq6l
	 OnV075GNbHfUTAayAy4u+ecDDFoX3Ag0aPf2SgctFnWXniSlOVByVLt+fmCPq1f60L
	 HVAymUt8rOLy+VIfFIVw9M2nrbMzxZ16Ae4RzMJIk3wpgdyUJrTieXDVJDrDkRlODV
	 GCSczdrcvV2Aw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vx1th-0000000FDFJ-1H7U;
	Mon, 02 Mar 2026 11:57:13 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v2 02/11] arm64: Add a helper setting a feature field to its safe value
Date: Mon,  2 Mar 2026 11:56:43 +0000
Message-ID: <20260302115653.1517326-3-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260302115653.1517326-1-maz@kernel.org>
References: <20260302115653.1517326-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, tabba@google.com, will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

In order to make the code more readable, add a simple helper
setting a given field to its safe value, and update the only
user so far. More will be added later.

Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kernel/cpufeature.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 28fc77443ccd3..102c5bac4d502 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -926,6 +926,11 @@ static u64 arm64_ftr_set_value(const struct arm64_ftr_bits *ftrp, s64 reg,
 	return reg;
 }
 
+static u64 arm64_ftr_set_safe_value(const struct arm64_ftr_bits *ftrp, s64 reg)
+{
+	return arm64_ftr_set_value(ftrp, reg, ftrp->safe_val);
+}
+
 s64 arm64_ftr_safe_value(const struct arm64_ftr_bits *ftrp, s64 new,
 				s64 cur)
 {
@@ -1066,9 +1071,8 @@ static void init_cpu_ftr_reg(u32 sys_reg, u64 new)
 		if (ftrp->visible)
 			user_mask |= ftr_mask;
 		else
-			reg->user_val = arm64_ftr_set_value(ftrp,
-							    reg->user_val,
-							    ftrp->safe_val);
+			reg->user_val = arm64_ftr_set_safe_value(ftrp,
+								 reg->user_val);
 	}
 
 	val &= valid_mask;
-- 
2.47.3


