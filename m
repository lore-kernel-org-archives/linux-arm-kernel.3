Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C41BC624D4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 21:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7S1u1NUBMcaYrnhlVutGEefRSHacesekDiD9O9QWeIU=; b=p0TBEByIalW9BcHCLIUmaXFGez
	1LGrUSgeqqu9jFi0I4mBiMfzWfimJXsBN+6jDILgffXTRheCg5nmdY2b4TmOrCAMM/iZ5zMfu3Zmp
	s+XUPHse9fYpX84XyZa1VIBZiVtP7GeOEGkeCNV0wAKWJcC7hxvYcwkvTBZldcT2LvtljTaNNbwMB
	O8Th4FaOnS6YwFF7w68h/axicGUL9j9TL2/jGL309dMe/SYB3QQKG7YyWoXqhTklTXmLS5bc1X2Bw
	+QTUA2RHeI30bcz26QjQnfnizWky3Fw3rccsEt6MZO3elOAOqXY5g9hITSIh1Beb8pGG0JV16Z54L
	4KD/pCNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1WNS-0000000DQ7q-1JCx;
	Tue, 01 Sep 2026 21:50:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1WNR-0000000DQ7X-08Mh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 21:50:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 71C3A43B0C;
	Tue,  1 Sep 2026 21:50:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4769B1F00A3D;
	Tue,  1 Sep 2026 21:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788299444;
	bh=7S1u1NUBMcaYrnhlVutGEefRSHacesekDiD9O9QWeIU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Bk0TvFDCwLVa+GQJHJYn2g7CLDqrNRx0t0IqP5iFtYv5KihthFDWcW0rmSuMhehPG
	 kfXiXGAd/yykMQof/0C0cr4A8wJfmJtIA8HIgC+myjcg2xaTjBYyqNTchxDeNSmvNo
	 YfupBRL2gUXAQ6dVCG2eOx4TRdW8tjWYv14EfKzRWnJm/G9Qm2aJCg/FYToS8A9VNi
	 Dr1KSsaG5FDn0Jcf7wSLmViLAY0XqT6wHFEZVqMp8WRTfj64jajrhysMzqrvYim9lF
	 iKrBAWaH4f+JkkFy7aM3AIprw3LZTNy53cuLJr/4d6k7j3T1jfn7g4x50R+ib/l/Vo
	 5qqyOR47O+jKw==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 01 Sep 2026 22:47:00 +0100
Subject: [PATCH v20 02/14] KVM: arm64: Fix FGT mapping for
 HFGITR_EL2.nGCSEPP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-arm64-gcs-v20-2-f31750bdfadb@kernel.org>
References: <20260901-arm64-gcs-v20-0-f31750bdfadb@kernel.org>
In-Reply-To: <20260901-arm64-gcs-v20-0-f31750bdfadb@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Leonardo Bras <leo.bras@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>, 
 Yao Yuan <yaoyuan@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1231; i=broonie@kernel.org;
 h=from:subject:message-id; bh=03IFzhMIe86O1tDUwMFTAH2bc2Wf2e5ofSlKnmvMwps=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBql0ieJtASYG9gKhKYFZFR2q7jGqYsV3vGZdvtf
 ZfQo6jxSpaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapdIngAKCRAk1otyXVSH
 0P/hB/92IeSeCJYmi34v1rDavY+z6TcZkqhldqLJ87GeFsA+t4Lqg2T/3+OggmtRPI3DvRwVthB
 fEr9uV/PDr9mBoEBBfDqNB0O0NwfGFh0DhuB5YiyJEdNe0F901O06pO/kVL5RHnn+0RSIpeeCKr
 HqYPVcsRCsgcpgvIow19RMoSzDQLo6hPKWgtPITjYOiOFadtUquVw5O3xQxEoBkImMXr2CPPat3
 zf4+6V4KXWcU1eW7nQjMePPdTUBUpz83W74CH82ePiMRt8s/RUDwojdqbMywWJrc7AG+8HQ7+55
 uq6ZUfAE+VZoEkHHMMCzQnHsFoR+SECdmjnPA0oN7BjdILIY
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
Reviewed-by: Leonardo Bras <leo.bras@arm.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kvm/emulate-nested.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 625604019fb3..3806ff0920fe 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -1445,7 +1445,7 @@ static const struct encoding_to_trap_config encoding_to_fgt[] __initconst = {
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


