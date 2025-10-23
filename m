Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A252CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 21:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aAohNAJl2itpx22Fqka//OJPv8ioQrMT6Kh7spVee88=; b=EUVO02lc0sDF8lwBKJlG44bTMN
	ytd6pGesiXjGufPiMjuGM4nhAyDv8jBgllrx4fJ0vHOyeVswACILurd1kDe1DVED62rcQdZ8Xl3DR
	AgVo3TXSRRp1LkEHwEnkuVLgdnddu4rxkH11+1tsj56oYG33kI8NRnt2eADd1vFrsogRJbPQ+0ql6
	ohPMCercJJy/IkncT5lk/QHEZ7Lm7KSPBBuTYvo0gpDuLPc1IaMngLVaZIvhpkCiOtJX0HTyW4c5X
	q2cI4v8ZD21G8X6yzt/lRi53R4ExcwYttLK2t60R+WzHmhrB4cuGSG5WjI+bDP22+MYbT5KdeQYfi
	vOdfr8Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC2jZ-00000007dCT-2xMW;
	Thu, 23 Oct 2025 21:20:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC2jX-00000007dBu-32Yp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 21:20:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1C12B44F15;
	Thu, 23 Oct 2025 21:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE34FC4CEFB;
	Thu, 23 Oct 2025 21:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761254431;
	bh=CnOMQMjrqhKtD/EhlScExXFn3jDF3wbOMnBmzOuuz8s=;
	h=From:Date:Subject:To:Cc:From;
	b=PyfkBUm1aFy2wRFZV4lD8D0CNFOxRgPgft1bZRCvlbGHjiTDOEDRSHPeaxJ4hs8mL
	 Q0jiKSY7lNBab/qIAnfhp5rZzKA3f/XjXM+lKbDCV2QcQZ0uzMRt+fSLULsluNrdvK
	 agcvDqY7q5cJVJYUSF4Wh2HIyZS5qjcZFTr9r52jHnmnQ1IUKhkoNA6X8gExYpe82b
	 7HrKWlXLgLsgYDSdZhu4tSjag0qtLicxp3osJDmoAZQhJl0qxWInHWojzf4CsZ7mdJ
	 BVSszA1Ve/HeM+IWLqL8P4gUyQumpvN6PSIrfDlICimkA0AuhZIN17BmGV8vgSunAq
	 Cm5E2RJPk7d1A==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 23 Oct 2025 22:19:29 +0100
Subject: [PATCH] KVM: arm64: selftests: Add SCTLR2_EL2 to get-reg-list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-b4-kvm-arm64-get-reg-list-sctlr-el2-v1-1-088f88ff992a@kernel.org>
X-B4-Tracking: v=1; b=H4sIAOGb+mgC/x3NQQrCQAxG4auUrP2hTcciXkVcjDUdg9MqyVAKp
 Xd3cPlt3tvJxVScrs1OJqu6fpaK7tTQ+IpLEuizmrjlc9dyj0fAe50RbR4CkhSYJGT1Ah9LNkh
 mMLOEoZdLjBPV0tdk0u1/ud2P4weLEUR6dQAAAA==
X-Change-ID: 20251023-b4-kvm-arm64-get-reg-list-sctlr-el2-222e463e8aaf
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-88d78
X-Developer-Signature: v=1; a=openpgp-sha256; l=1429; i=broonie@kernel.org;
 h=from:subject:message-id; bh=CnOMQMjrqhKtD/EhlScExXFn3jDF3wbOMnBmzOuuz8s=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBo+pwbFbGYn/J+XnOrZGFvXgcvTyRkw0UD8ItGS
 HcdNtUNIyuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaPqcGwAKCRAk1otyXVSH
 0KyIB/9Hifq35A9damYTTSqJ1l1r/u0aFiu0nLatsjdRqqy5ohdrChk54+ZgkggtTGEhEgfUmpR
 c1KDMeSzsd0gkcrIH2V6OxPvd6q0uBkzZhdy/rfOakWyasCWU1jT1ecCVopPQvnSBMqAROgqOcK
 /DADf3whJVgNl2m1Vbt9NWO5VDsygGuZKyXxm2dc+HoeWCB5HTh9tLNszdX1gUgDKn4YYFD+ty7
 HMkuYLOKJiP6zCoAbwbW7/ZTZ4R3qqPxgvmIhkm01Stka/J+btGZ6SwvIPF9Crs+1N3O66Jyjig
 IVjVSM2/9MCzdxXyL+rfw61UAeqmauigvno1wNf/XARiKQhb
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_142031_784890_2DB63DB3 
X-CRM114-Status: UNSURE (   8.90  )
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

We recently added support for SCTLR2_EL2 to the kernel but did not add it
to get-reg-list, resulting in it reporting the missing register when it
is available. Add it.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/kvm/arm64/get-reg-list.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/kvm/arm64/get-reg-list.c b/tools/testing/selftests/kvm/arm64/get-reg-list.c
index c9b84eeaab6b..2abef0a86d46 100644
--- a/tools/testing/selftests/kvm/arm64/get-reg-list.c
+++ b/tools/testing/selftests/kvm/arm64/get-reg-list.c
@@ -63,6 +63,7 @@ static struct feature_id_reg feat_id_regs[] = {
 	REG_FEAT(HDFGWTR2_EL2,	ID_AA64MMFR0_EL1, FGT, FGT2),
 	REG_FEAT(ZCR_EL2,	ID_AA64PFR0_EL1, SVE, IMP),
 	REG_FEAT(SCTLR2_EL1,	ID_AA64MMFR3_EL1, SCTLRX, IMP),
+	REG_FEAT(SCTLR2_EL2,	ID_AA64MMFR3_EL1, SCTLRX, IMP),
 	REG_FEAT(VDISR_EL2,	ID_AA64PFR0_EL1, RAS, IMP),
 	REG_FEAT(VSESR_EL2,	ID_AA64PFR0_EL1, RAS, IMP),
 	REG_FEAT(VNCR_EL2,	ID_AA64MMFR4_EL1, NV_frac, NV2_ONLY),
@@ -718,6 +719,7 @@ static __u64 el2_regs[] = {
 	SYS_REG(VMPIDR_EL2),
 	SYS_REG(SCTLR_EL2),
 	SYS_REG(ACTLR_EL2),
+	SYS_REG(SCTLR2_EL2),
 	SYS_REG(HCR_EL2),
 	SYS_REG(MDCR_EL2),
 	SYS_REG(CPTR_EL2),

---
base-commit: 211ddde0823f1442e4ad052a2f30f050145ccada
change-id: 20251023-b4-kvm-arm64-get-reg-list-sctlr-el2-222e463e8aaf

Best regards,
--  
Mark Brown <broonie@kernel.org>


