Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9FB8C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 00:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=J6qxru/ZU7mjcy9dq/qBygy2wjcpMXVRO33dvCDLuJ0=; b=I1Zo33SSZ8xS/2i0lSdsNjksL6
	F9zC6T1VmWpSwykDyAatdbSSU0XqPMGaFQDNnbornSsjT76uK51L6BAKpR759z/lpK4j3EQ/PC8Fs
	u2AodV1QJxIqA/RLZvWd8bzi0SHw8x5j79Vjx9K4ccUgbijvuExRz59SVB6vIV47cJifNxnnM0tDQ
	yugdc1aCUqJK7JxiBBgX65tq7cBkDhybQN536ipUyWOhR2W7M7L031RyeioiKYB9ImngxPBjqFBY3
	BaKtcLTmO3exIdM1d1c8z72xsA46+i3kwDMEabPRrjxwpk0zTn6CD0ct1406u2j4WJKwXayKpwkpX
	n8mRZGpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti0gU-00000005hwF-1TFE;
	Wed, 12 Feb 2025 00:32:58 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti0eQ-00000005haL-1NUs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 00:30:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D264DA40ECE;
	Wed, 12 Feb 2025 00:29:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCA3FC4CEDD;
	Wed, 12 Feb 2025 00:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739320249;
	bh=NJ/KIhRbLqKKRZOIuLEK+yaV4RpOOTdBF4uFF/FtH8c=;
	h=From:Date:Subject:To:Cc:From;
	b=KPyjScDSvbFkYyWQdp+eI6YuMaJZIqR+icltgr/z63FhS1M13Dj2AM5zF3rUWyoT5
	 OG2BcP0tc2yCG9jCnsGvqdzDtmbYvv0zba+DK7Z4vNjKOru8kaX/7T4b+SfSg8cKuJ
	 Ig5O5na0GUIwcKGDeIbmEw4xIMzvv6Wgza7WdbSdjWtAUYul2i5kpRnZHRmIRBmGf6
	 AoUBNQstEt3ll4OBmdvSc/2J8bHy/1MxhxOchFQk1bVZvMJJWSe8w2aIMxSsHYuVJT
	 PYO4DU2VzgJG7QOf/LLscisq86NSDHBTI04W1awbBKjdignPABR3tyn+7nO0lqtVM9
	 fi2/lp0fjKWyA==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 12 Feb 2025 00:30:42 +0000
Subject: [PATCH v2] arm64: Add missing registrations of hwcaps
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-arm64-fix-2024-dpisa-v2-1-67a1c11d6001@kernel.org>
X-B4-Tracking: v=1; b=H4sIALHrq2cC/22NwQ6CMBBEf4Xs2TVtoW3w5H8YDhUW2KiUbA3RE
 P7dSjx6fJOZNyskEqYEp2IFoYUTxymDORTQjmEaCLnLDEYZq4zyGOThKuz5hTmqsJs5BXSlDbZ
 22qm6hTydhXJj116azCOnZ5T3/rLob/oTavVfuGjU2HnfV2Xrr8aW5xvJRPdjlAGabds+2dEcd
 bkAAAA=
X-Change-ID: 20250207-arm64-fix-2024-dpisa-635a5961609c
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=2294; i=broonie@kernel.org;
 h=from:subject:message-id; bh=NJ/KIhRbLqKKRZOIuLEK+yaV4RpOOTdBF4uFF/FtH8c=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnq+u2MYEJMHcoB61+KLJFvAOZqDPmOsElNgJ/zTde
 0HBaoVCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ6vrtgAKCRAk1otyXVSH0I6UB/
 4jM3gyMSYvWY6GmGz4t2iIx+eAB7faBazfS2nutpETqdnRqubc7jOuPrAwJdHCxUpNg9QckoXCSsZI
 ZDNCSayXq++pwEhxVpBxjHLyzisAgiKvu2d70uxc7fM2Qw5kwUKon9EjfogJ3oCjLOaMK8HEnH6nbz
 XxF3gZCn2TMkendPIq0bexYYTbb35YOnrn3YOIaNX8O7PthY/f9iOQQykUkpNzgZ0Yb9H38pggCSFI
 16eS5p0D4EFQ1kVV28DJVjvmG79JqmCl8XUhBU3aUOrjRcHUX6MIDp0jW2Ar2hdr/Hj/nGycGk+dNm
 +wquF9ny8qGqAFWd+JLXDk+YyfM7zE
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_163050_498362_CB3EBBF0 
X-CRM114-Status: UNSURE (   9.19  )
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

Commit 819935464cb2 ("arm64/hwcap: Describe 2024 dpISA extensions to
userspace") added definitions for HWCAP_FPRCVT, HWCAP_F8MM8 and
HWCAP_F8MM4 but did not include the crucial registration in
arm64_elf_hwcaps.  Add it.

Fixes: 819935464cb2 ("arm64/hwcap: Describe 2024 dpISA extensions to userspace")
Reported-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
Changes in v2:
- Add FPRCVT.
- Link to v1: https://lore.kernel.org/r/20250210-arm64-fix-2024-dpisa-v1-1-d77f43c7b253@kernel.org
---
 arch/arm64/kernel/cpufeature.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index f0910f20fbf8c18fbeb63bcee18abf13371b1d5e..d561cf3b8ac7b11784282dc889852ef52a7b8f6e 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -3091,6 +3091,7 @@ static const struct arm64_cpu_capabilities arm64_elf_hwcaps[] = {
 	HWCAP_CAP(ID_AA64ISAR0_EL1, TS, FLAGM, CAP_HWCAP, KERNEL_HWCAP_FLAGM),
 	HWCAP_CAP(ID_AA64ISAR0_EL1, TS, FLAGM2, CAP_HWCAP, KERNEL_HWCAP_FLAGM2),
 	HWCAP_CAP(ID_AA64ISAR0_EL1, RNDR, IMP, CAP_HWCAP, KERNEL_HWCAP_RNG),
+	HWCAP_CAP(ID_AA64ISAR3_EL1, FPRCVT, IMP, CAP_HWCAP, KERNEL_HWCAP_FPRCVT),
 	HWCAP_CAP(ID_AA64PFR0_EL1, FP, IMP, CAP_HWCAP, KERNEL_HWCAP_FP),
 	HWCAP_CAP(ID_AA64PFR0_EL1, FP, FP16, CAP_HWCAP, KERNEL_HWCAP_FPHP),
 	HWCAP_CAP(ID_AA64PFR0_EL1, AdvSIMD, IMP, CAP_HWCAP, KERNEL_HWCAP_ASIMD),
@@ -3190,6 +3191,8 @@ static const struct arm64_cpu_capabilities arm64_elf_hwcaps[] = {
 	HWCAP_CAP(ID_AA64FPFR0_EL1, F8FMA, IMP, CAP_HWCAP, KERNEL_HWCAP_F8FMA),
 	HWCAP_CAP(ID_AA64FPFR0_EL1, F8DP4, IMP, CAP_HWCAP, KERNEL_HWCAP_F8DP4),
 	HWCAP_CAP(ID_AA64FPFR0_EL1, F8DP2, IMP, CAP_HWCAP, KERNEL_HWCAP_F8DP2),
+	HWCAP_CAP(ID_AA64FPFR0_EL1, F8MM8, IMP, CAP_HWCAP, KERNEL_HWCAP_F8MM8),
+	HWCAP_CAP(ID_AA64FPFR0_EL1, F8MM4, IMP, CAP_HWCAP, KERNEL_HWCAP_F8MM4),
 	HWCAP_CAP(ID_AA64FPFR0_EL1, F8E4M3, IMP, CAP_HWCAP, KERNEL_HWCAP_F8E4M3),
 	HWCAP_CAP(ID_AA64FPFR0_EL1, F8E5M2, IMP, CAP_HWCAP, KERNEL_HWCAP_F8E5M2),
 #ifdef CONFIG_ARM64_POE

---
base-commit: 21fed7c223e20e694b91dbf25936d922a50c8b19
change-id: 20250207-arm64-fix-2024-dpisa-635a5961609c

Best regards,
-- 
Mark Brown <broonie@kernel.org>


