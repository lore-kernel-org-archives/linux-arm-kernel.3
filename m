Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4177BC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 20:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dnYlFKw2gC6YhmPu1z4HDJiUvpQLTVAYFHuFiV6NB1w=; b=gTtaV+A9NaBIqVbau25AbuARs1
	lcowtvubnJL7lNZQ2i5+698S592uk7XZzPhpWcNACqzTKEwY+HVyJmkjAG8xMCXTD//HPqqOCKYhw
	YBjSa2IcZiR1hVcyoBlo52UijlYlJz/XypH5AJZfmvbZRznf7x/V0O0qfDv4OqjxJyEl6pOJxAj+d
	Hve3yMwF1PuZcaazF3wIa3kf3bZbp8TUrgFkiVc9zfo/RNOvpAr/h8sFF0DcY5SsqxMhjsb7iLGu7
	b1UmC5z9SpoBG58kn4a0sHUlFvwurEqcWP+8F6X1nITNNPVZk/Ab5JSTFyS32fKy0YiMMyq/qvcB2
	p9ezS5gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXR26-0000000CXBk-0LBD;
	Thu, 03 Jul 2025 20:59:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXMlx-0000000BzPq-3NDT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 16:26:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 37E3E61451;
	Thu,  3 Jul 2025 16:26:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6259FC4CEEE;
	Thu,  3 Jul 2025 16:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751560012;
	bh=90CTXdhM4nXMyJJrevGmqFnP/+4mWVosryCVClyymX0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CEixGJF1mZ2cvbi1whnnoBju4b6BNMXqM+52MvLEa731G3dWLfx7wm9QqaaE0ff6w
	 92x6T0QqUD7m+vWr6+Wi8RexCsndRtgvTUsnnRSCmCpYhyt1P5aOqUp/lPCIDL9PWv
	 E2NhPFlXGMbz6LhfjRDr4NwbpvmJ7eq26aWN/HMfSkAkB2OB5sVVwxkx3CGpwWC2Zf
	 RTnvzGswGgYT0OLz1QS5MqpTnWBLof6z6CS/kiZpRSnKNAEq3i+r1QYDwmDpVaYlO/
	 XNHFznVxWDeqC6q9Rl6J8wbcHBjkyyMKYKGlSBJR1QJoeLdkyrByX9yEqaYN7VBgRF
	 5AIaCR3s2l3Rg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 03 Jul 2025 17:23:23 +0100
Subject: [PATCH v2 2/3] KVM: arm64: Expose FEAT_LSFE to guests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-arm64-lsfe-v2-2-eced80999cb4@kernel.org>
References: <20250703-arm64-lsfe-v2-0-eced80999cb4@kernel.org>
In-Reply-To: <20250703-arm64-lsfe-v2-0-eced80999cb4@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-cff91
X-Developer-Signature: v=1; a=openpgp-sha256; l=1325; i=broonie@kernel.org;
 h=from:subject:message-id; bh=90CTXdhM4nXMyJJrevGmqFnP/+4mWVosryCVClyymX0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoZq9C+PfNQji4jba2ZysHPz8RoGObA6Pa/ZuWX
 F9jDQV8oHmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaGavQgAKCRAk1otyXVSH
 0NURB/9mggTPUYzWc+KsavFv2cEdY88MaY/uPfK+lU0MZ/eV24pYzWxdyncYKMlpvGOTW/22arP
 LU2zJ7Cl/P9ppUb3g/ZXttd2/xPMyK0YtGfiOiNhXCmqHEh0Z3lQ5e2Q8m/p7MMsPsoncg0Fm/X
 yGVSILA+DZNaV0LVr8Xn2IM2F/8VAKutGl+eZrB9egoZpVRamvADN9B7neZ6T/QCFYOWnzONmRR
 RHELmLfa6K2FKCb66+BrJVabOZGUeG4xEbYMPjlnBj1iBZZZNxc6IYH/Nlp9em53JThcIcqADab
 l31LOKbssiK1EmDk52tldTp9jYGCP+85/8XlOzI77kCwqk1p
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

FEAT_LSFE (Large System Float Extension), providing atomic floating point
memory operations, is optional from v9.5. This feature adds no new
architectural state, expose the relevant ID register field to guests so
they can discover it.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kvm/sys_regs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 76c2f0da821f..be685422bf9b 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1636,7 +1636,8 @@ static u64 __kvm_read_sanitised_id_reg(const struct kvm_vcpu *vcpu,
 			val &= ~ARM64_FEATURE_MASK(ID_AA64ISAR2_EL1_WFxT);
 		break;
 	case SYS_ID_AA64ISAR3_EL1:
-		val &= ID_AA64ISAR3_EL1_FPRCVT | ID_AA64ISAR3_EL1_FAMINMAX;
+		val &= ID_AA64ISAR3_EL1_FPRCVT | ID_AA64ISAR3_EL1_LSFE |
+			ID_AA64ISAR3_EL1_FAMINMAX;
 		break;
 	case SYS_ID_AA64MMFR2_EL1:
 		val &= ~ID_AA64MMFR2_EL1_CCIDX_MASK;
@@ -2921,6 +2922,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 					ID_AA64ISAR2_EL1_APA3 |
 					ID_AA64ISAR2_EL1_GPA3)),
 	ID_WRITABLE(ID_AA64ISAR3_EL1, (ID_AA64ISAR3_EL1_FPRCVT |
+				       ID_AA64ISAR3_EL1_LSFE |
 				       ID_AA64ISAR3_EL1_FAMINMAX)),
 	ID_UNALLOCATED(6,4),
 	ID_UNALLOCATED(6,5),

-- 
2.39.5


