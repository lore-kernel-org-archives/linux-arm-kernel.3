Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3710BC5DF65
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 19:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YWlLd/PWbYINVwpXcYMDnYu5TnVLNXcprwUMzPtexF8=; b=qRiUNJqK2Hel26AVzK3z8JJldb
	/idmfUHzYr5kXwcxItgI/GzYOMd6Yhp5sA/4FidhnDfBogelvuVb02IovFwm0M2UUo9ypMZdw4S/B
	Ufo73tKTFaNgPFAL7W6PRDH8JSE6J/vv3kNk8X7b7JZwCTQw0zaH/oa5z08GGDmPenKRkD92Rwuy/
	RBIwWG026lSD3msOdJiJ1apkY9a8TrxWU1Ag/yepQpLmlpekPoF2HEc6ybkE4Zjlq9kF6IodDY0XQ
	HBbruQ+LmtbxUO7tiZ0es3E6RKYWPaWP074iD6R+bSctlwsfGMgCzWBt8xC/zxZoWbQqb4kdb2SgX
	UGwFMnKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuEOD-0000000Grbp-00b6;
	Wed, 12 Aug 2026 19:13:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuEOA-0000000GraS-29vk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 19:13:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BFFDA60A7D;
	Wed, 12 Aug 2026 19:13:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92C381F000E9;
	Wed, 12 Aug 2026 19:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786562001;
	bh=YWlLd/PWbYINVwpXcYMDnYu5TnVLNXcprwUMzPtexF8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Hr2MvsEuaaEzcnb7pqx0fDgksL9RmFYJMkgCZLgfSVmtA2v5njcIiu97WrxWFn4e1
	 Ov1BoT7tE/ncfuzI4cZV4HWqOzyHA9RrhJ2qNsb9fGFQhi1f2p6HOanh63+MmAo35b
	 NdiKSOZ8ijOwnGNF0HdLXL2INR9Kds3iDADAxkTZFnYk4tunKWPbviJfnUoXT850ZW
	 sxugucq/tXcbt0eVpe/42oRB2eMRnPrhEzN+UCrVfdZPhEkRR4KLpNj7ngfi4neZop
	 oLNwP6k7zmx5bfnPzbe5sIO3aJWpRnJJ9H7XyOpw56QN8zypl0W/FIiGTgJAoXyL62
	 GQ4rk0QPx3kIg==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 12 Aug 2026 20:12:01 +0100
Subject: [PATCH v19 02/14] KVM: arm64: Fix FGT mapping for
 HFGITR_EL2.nGCSEPP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-arm64-gcs-v19-2-9105afd828ac@kernel.org>
References: <20260812-arm64-gcs-v19-0-9105afd828ac@kernel.org>
In-Reply-To: <20260812-arm64-gcs-v19-0-9105afd828ac@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>, Fuad Tabba <tabba@google.com>, 
 Oliver Upton <oupton@kernel.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Yao Yuan <yaoyuan@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1184; i=broonie@kernel.org;
 h=from:subject:message-id; bh=cmvAQBxB4SuCRvDZjmRe7yIsmwDDWXuwPP1P7cDHpHg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqfMW7xoiqvOLOz8+6G2+5A+ZgECZ+QwPkUzOLt
 FoOuI2C4wCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCanzFuwAKCRAk1otyXVSH
 0IvaB/wI/FpFkLyGyj1sYsB6MEmyR0ik9n4QuHmN5KWkK73wFPPVJsIFSFHjknqTDNsyB09SjFz
 azxPsfYekK80iNCgjxwTwfZqBYbDJ9VCV0jR8GREHkM73c1Xgrxhxev9hYi4lUg8+jkNfj76Pfc
 6tOt3aT09Z27h7IaMmdSielrg7qg3PbnwnRoYALFINkCnDbbgkwtPWOGvlR7jZIuJPcjucaiVtv
 R4HNujT7W66L6kcHqwHmr/2YTOFZ50XerlMMiQ58ACSEjFPPZVlyAyboWYGt4xsHd4N83IqGZrP
 64uyKkPUJd7AoFscpOZfS/MS6WnpxsrMNcPidD03h80zddgz
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

The encoding to trap mapping currently maps a FGT on OP_GCSPOPX to
HFGITR_EL2.nGCSEPP but as per DDI0601 2026-06 this FGT controls trapping
of GCSPUSHX and GCSPOPCX, and not the separate GCSPOPX instruction.
Update the mapping to reflect the architecture.

Fixes: 863ac38984a82 ("KVM: arm64: Add missing HFGITR_EL2 FGT entries to nested virt")
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kvm/emulate-nested.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 3c82f392845d..b32742d9dd73 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -1432,7 +1432,7 @@ static const struct encoding_to_trap_config encoding_to_fgt[] __initconst = {
 	SR_FGT(OP_AT_S1E1A, 		HFGITR, ATS1E1A, 1),
 	SR_FGT(OP_COSP_RCTX, 		HFGITR, COSPRCTX, 1),
 	SR_FGT(OP_GCSPUSHX, 		HFGITR, nGCSEPP, 0),
-	SR_FGT(OP_GCSPOPX, 		HFGITR, nGCSEPP, 0),
+	SR_FGT(OP_GCSPOPCX, 		HFGITR, nGCSEPP, 0),
 	SR_FGT(OP_GCSPUSHM, 		HFGITR, nGCSPUSHM_EL1, 0),
 	SR_FGT(OP_BRB_IALL, 		HFGITR, nBRBIALL, 0),
 	SR_FGT(OP_BRB_INJ, 		HFGITR, nBRBINJ, 0),

-- 
2.47.3


