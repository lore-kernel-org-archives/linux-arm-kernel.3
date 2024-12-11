Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED20FE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 01:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=os7q9rXpWyMafYgSJToWOi2Rk+/i+oOAwv2yJX0cn+4=; b=kECAU1vt928hdkHetFTKyEAKYF
	wmkcWU4FH6O1UQI80cm9E3fuw6FkStbV604pFqvxbNKrszFf9IP4kaClcln/HxOS3x2TPr1FjzHkE
	Oh1pEkzL+Ws5g6PpNd0fBGXLv/gkrpiQR2YJ2rG6YCHy+ca1/4MW0g/d0U9OXPERfw4FoK0ocZsAe
	AfGAudi+cGC2RJ88N+MiqQq+naS4p/lbOe4wBeSfQ8zTmevzBkzNW8cyYuZaVzvumFH8qqT1oNaRM
	dbqk7w40m9W16IFrLf6IRH/Wf48Hsw+/7s+VMZ4IpVHe4R6xY/m4wq8vRtvKKMlMuOWlwajaCblSo
	XrrtAjQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLBId-0000000DO2P-0PHO;
	Wed, 11 Dec 2024 01:13:59 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLB9m-0000000DMXY-0Xyx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 01:04:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E56A3A41D33;
	Wed, 11 Dec 2024 01:02:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7478FC4CEDE;
	Wed, 11 Dec 2024 01:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733879089;
	bh=cKym5jL1wVVG9G/7MeEDQVRM4fdPvM6wIXw2UfuLn2s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=est+jKTlMjjT0LteUy3l0s/bqzIPRBoO3iJZw0xbbgJUgc39gJnLG2FeGJUB7D5lJ
	 BMp18/ena+cJH9IGZ6xCSER8+HFKMakvpRy1zkAfSK8TAhe+8Z2TtlnOV4zcjh8VQm
	 DhJVCaOC0E3U55m93B/JaKUINPcYMsFYLOz7tP7FXkM4ysiRegyYJ76pOybkDUj0U5
	 IqrqHhEzJy0fFR4aB+cfD12Dvb5uOEshQz7m4qq+w0JL1f1t8nIvarVRGZdbG37Jnf
	 3jToVCG7N0Hd/RrhSc6E6HS8CYazhQFS7uvRb8jba0MZ0CEOWKCd7EJDqYtPEUdCH5
	 va5Byh4MWjXLw==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 11 Dec 2024 01:02:53 +0000
Subject: [PATCH v4 8/9] KVM: arm64: Allow control of dpISA extensions in
 ID_AA64ISAR3_EL1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241211-arm64-2024-dpisa-v4-8-0fd403876df2@kernel.org>
References: <20241211-arm64-2024-dpisa-v4-0-0fd403876df2@kernel.org>
In-Reply-To: <20241211-arm64-2024-dpisa-v4-0-0fd403876df2@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=1369; i=broonie@kernel.org;
 h=from:subject:message-id; bh=cKym5jL1wVVG9G/7MeEDQVRM4fdPvM6wIXw2UfuLn2s=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnWOUUhmVbDtN4zgUDprg+DePqkfqBwUsINMtFA3QJ
 1gHnRzSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ1jlFAAKCRAk1otyXVSH0KZNB/
 9kB6zoenu8X62lAzSiX4YYO7L6QYm3FGYNXOKN+jxzU5x+tdlQmsJmsZlWwG5i5WMlttwWiCn6nVqe
 Ym449g++ZZ5W1OiLpJOAxZhSMg26IvKox88qwXM+qdcROa0e5qgUiNMzlfHUTB8+/RT7tkDm4+s4kK
 POUeMmmA3u3gVm5wS4SWIF5I0FI0iCiTc2XU54nHfD8u+UifrayrbiTqJewtV9iHiSNH1sM+HrKtY1
 xvKpLgAElxMdEypMJvH5462BQKDj4PQISCJIGMCSBM+LROwiIZ2pwViVSYmL/52Hm9MaLrG0jcc2iB
 C3FUwcAO2DOUvyaQzphj7Bap5OvCu7
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_170450_232886_DA794C40 
X-CRM114-Status: GOOD (  10.61  )
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

ID_AA64ISAR3_EL1 is currently marked as unallocated in KVM but does have a
number of bitfields defined in it. Expose FPRCVT and FAMINMAX, two simple
instruction only extensions to guests.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kvm/sys_regs.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 83c6b4a07ef56cf0ed9c8751ec80686f45dca6b2..6efbe3f4a579afd1874c4cf844c1c1249ae8b942 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1604,6 +1604,9 @@ static u64 __kvm_read_sanitised_id_reg(const struct kvm_vcpu *vcpu,
 		if (!cpus_have_final_cap(ARM64_HAS_WFXT))
 			val &= ~ARM64_FEATURE_MASK(ID_AA64ISAR2_EL1_WFxT);
 		break;
+	case SYS_ID_AA64ISAR3_EL1:
+		val &= ID_AA64ISAR3_EL1_FPRCVT | ID_AA64ISAR3_EL1_FAMINMAX;
+		break;
 	case SYS_ID_AA64MMFR2_EL1:
 		val &= ~ID_AA64MMFR2_EL1_CCIDX_MASK;
 		break;
@@ -2608,7 +2611,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	ID_WRITABLE(ID_AA64ISAR2_EL1, ~(ID_AA64ISAR2_EL1_RES0 |
 					ID_AA64ISAR2_EL1_APA3 |
 					ID_AA64ISAR2_EL1_GPA3)),
-	ID_UNALLOCATED(6,3),
+	ID_WRITABLE(ID_AA64ISAR3_EL1, (ID_AA64ISAR3_EL1_FPRCVT |
+				       ID_AA64ISAR3_EL1_FAMINMAX)),
 	ID_UNALLOCATED(6,4),
 	ID_UNALLOCATED(6,5),
 	ID_UNALLOCATED(6,6),

-- 
2.39.5


