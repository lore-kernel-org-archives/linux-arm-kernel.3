Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96AF1D29FA5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 23:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LKGCrYIrhhlWG02vkwGzbCBrx12AqXSmuV0SrITzFRE=; b=caWZBR5jQRVCNpSI75nqjvLdIs
	MCzHWwkP4yBAMspFwtgXVW7ZMSQMYjo0Aj5XkL2tkp94ljHbm8MbZMjeDESP6F02+vNkPXZjblw7d
	WlpQGS8Nx27QwTIlg+jKPnGulP1oGbeC9xo1r3Qs5Dxqw+92Dm6ZVdRHDSRv0f04S1nczAnBZMBrU
	a58PQgqw8kWtqzV/jVjN+L60TGrhyHCu/54FE82CEDZENV9fTtXl0O7SZHRBAyu33sTT2+OvfzpvS
	ZZAz3EqhecbwYqkhz4yfIqvegq3XgDYlxfb0msyR423N7/TlR8kRDtPv47SZWhaT0Q8sKxo8BKohc
	1EhYdL8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8pLM-000000051zD-2ikE;
	Wed, 06 Nov 2024 23:21:44 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8pJb-000000051hd-1Px1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 23:19:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A0B12A43218;
	Wed,  6 Nov 2024 23:17:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04C03C4CEC6;
	Wed,  6 Nov 2024 23:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730935194;
	bh=xa0JnPmZ/CyZNTM4J3xKzey4B7+1QOg2HfgQ0FKNFiE=;
	h=From:Date:Subject:To:Cc:From;
	b=cvvh2Kh+7g63DNA3sO+QbwCD86FZW5m2zE4w+q/GHfYwWiEDvIdSSckJgVFK+ycpd
	 mAcmCDMmbV9stDIaxueYLfeX+x1+dc/No+GmVB/otvZ67Gwew9DY6f7Wyslh5GfEyR
	 9aLx0au0Um1wvVW0qkBkiqFsn0g+lNirIYhCklNCDg2Y6qyP+xsMVOBJRULCEhbywJ
	 ddoFrE1XpHCGNqCQ4ILZeq2buDDZT51mb25s85ub1k4/B4FVqcQaSotbh8ajqR5751
	 ey7yVm21i6X7JjejoPpA5UqbG320LIGnBWLfLdwNWNbH8bs1ztckxtHBwAEDovYVpS
	 2T4iorAl8HJ0w==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 06 Nov 2024 23:18:23 +0000
Subject: [PATCH] arm64/fp: Don't corrupt FPMR when streaming mode changes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241106-arm64-fpmr-context-switch-v1-1-e6dbad4acd05@kernel.org>
X-B4-Tracking: v=1; b=H4sIAD75K2cC/x3MTQqEMAxA4atI1hNotf7gVYZZ1Bg1C6ukZRTEu
 1tcfov3LoiswhH64gLlv0TZQob9FECLDzOjjNlQmtJZaxr0ujYOp31VpC0kPhPGQxItWA+uI+t
 aqkYDud+VJznf9/d33w9C89hPawAAAA==
X-Change-ID: 20241106-arm64-fpmr-context-switch-5b48c147c3d0
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=1595; i=broonie@kernel.org;
 h=from:subject:message-id; bh=xa0JnPmZ/CyZNTM4J3xKzey4B7+1QOg2HfgQ0FKNFiE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnK/mXMlHYIabf/0jKlvAJv0pWizypnJT8W8eZIS9p
 g/ZIAgiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZyv5lwAKCRAk1otyXVSH0DZqB/
 9OJoVadk3tAZ9FcMjaQlY5N++mRnnc5OZM2FtP9digYoDTUQccC1WDyYoxjpAVEiqfY88V88tDGv0A
 it1hxnnacubY+Ah7a91E9fLF1XPxggH6EmpRKbdchAZTchLGmvhxTyDvcKHzqboASO45rXcZT3ls4W
 QM/wxa16v9dVEz2OiyGJYkvzbmuFPIUDNSW2m3LyMFd/YzQmRZc3/bAPgXnXGXTwORnkArEHfB3h9Q
 jD62XtbsZWOnZKdBNGQIXo4WrrCab/lAdGZ4IzBocBPAGuzJvwc1AFe/5tQZsc3Sp8TRdDwSgv+H4M
 Mk0gklXvhfEgLpuv3D2HgqSqfna467
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_151955_478913_0C289AA2 
X-CRM114-Status: GOOD (  11.82  )
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

When we enter or exit streaming more FPMR is reset to 0.  This means
that when restoring the floating point state from memory we need to
restore FPMR after we restore SVCR, otherwise if we are entering or
exiting streaming mode as part of loading the new state the value of
FPMR will be corrupted.

Fixes: 203f2b95a882 ("arm64/fpsimd: Support FEAT_FPMR")
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kernel/fpsimd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index 77006df20a75aee7c991cf116b6d06bfe953d1a4..b26d93a444ce6cb2a0f1759240cb1fe88e7c76a0 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -359,9 +359,6 @@ static void task_fpsimd_load(void)
 	WARN_ON(preemptible());
 	WARN_ON(test_thread_flag(TIF_KERNEL_FPSTATE));
 
-	if (system_supports_fpmr())
-		write_sysreg_s(current->thread.uw.fpmr, SYS_FPMR);
-
 	if (system_supports_sve() || system_supports_sme()) {
 		switch (current->thread.fp_type) {
 		case FP_STATE_FPSIMD:
@@ -413,6 +410,9 @@ static void task_fpsimd_load(void)
 			restore_ffr = system_supports_fa64();
 	}
 
+	if (system_supports_fpmr())
+		write_sysreg_s(current->thread.uw.fpmr, SYS_FPMR);
+
 	if (restore_sve_regs) {
 		WARN_ON_ONCE(current->thread.fp_type != FP_STATE_SVE);
 		sve_load_state(sve_pffr(&current->thread),

---
base-commit: 8e929cb546ee42c9a61d24fae60605e9e3192354
change-id: 20241106-arm64-fpmr-context-switch-5b48c147c3d0

Best regards,
-- 
Mark Brown <broonie@kernel.org>


