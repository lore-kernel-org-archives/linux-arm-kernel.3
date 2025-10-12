Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4CE0CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Oct 2025 15:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=etGXtXgYukUwOM3oh9xUMwzEF3+F73hM03oAFvr8aAo=; b=mjpxmrQsrJdVTTwQex95q1hTC5
	vIkKLpwS6idyhmoPojnyspctryjJIR7I5bEadyP1eZ3wz0EGJ3VkTrJhBHaOyCYrwvpm+OPyN1x7n
	GdNY+5g9hkCHhECVv/aF9qT0cFMCVCNpmkdLDPTxOxupWkeEGaQv/KNZU95BOx4/H73MbV3UaCzZb
	L3i1IKAeAZW50Ztu6m3+yd911piPcLJUesotC0hWfsCWp7PQ+GGLSuxyjTA9T9izTdbGs0AY+aaym
	7Fa+hjLtLkzG6+plW9lSGIRBKD6mhGjKJi1DpGoEQ5AhsqTD9p5uAhcqw/QXkHvl94KfeciUGL4BT
	1yic+vqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7yF7-0000000BVKw-0iZV;
	Sun, 12 Oct 2025 15:44:17 +0000
Received: from out-188.mta0.migadu.com ([2001:41d0:1004:224b::bc])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7yF3-0000000BVK4-2orj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Oct 2025 15:44:15 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1760283847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=etGXtXgYukUwOM3oh9xUMwzEF3+F73hM03oAFvr8aAo=;
	b=bHOHnH3eJTHwsi1Fj7c3KNiiKjZdFYo821vrKDIiZbQUB7028AdAa9tb9hzMHq3CLNqc24
	Evbf740RK9A5zEr67dFFqOmIaHfmAg46qdmtwP5f42FRoh7nVLrg1vBhfWawL6D+I6THUL
	4zsnjBGWnWDUKRfXHJWggrh5FN1e2SU=
From: Zenghui Yu <zenghui.yu@linux.dev>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	Zenghui Yu <zenghui.yu@linux.dev>
Subject: [PATCH] KVM: arm64: selftests: Sync ID_AA64PFR1, MPIDR, CLIDR in guest
Date: Sun, 12 Oct 2025 23:43:52 +0800
Message-Id: <20251012154352.61133-1-zenghui.yu@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_084414_600003_EB6499E0 
X-CRM114-Status: UNSURE (   6.87  )
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

We forgot to sync several registers (ID_AA64PFR1, MPIDR, CLIDR) in guest to
make sure that the guest had seen the written value.

Add them to the list.

Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>
---
 tools/testing/selftests/kvm/arm64/set_id_regs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
index 8ff1e853f7f8..5e24f77868b5 100644
--- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
+++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
@@ -249,11 +249,14 @@ static void guest_code(void)
 	GUEST_REG_SYNC(SYS_ID_AA64ISAR2_EL1);
 	GUEST_REG_SYNC(SYS_ID_AA64ISAR3_EL1);
 	GUEST_REG_SYNC(SYS_ID_AA64PFR0_EL1);
+	GUEST_REG_SYNC(SYS_ID_AA64PFR1_EL1);
 	GUEST_REG_SYNC(SYS_ID_AA64MMFR0_EL1);
 	GUEST_REG_SYNC(SYS_ID_AA64MMFR1_EL1);
 	GUEST_REG_SYNC(SYS_ID_AA64MMFR2_EL1);
 	GUEST_REG_SYNC(SYS_ID_AA64MMFR3_EL1);
 	GUEST_REG_SYNC(SYS_ID_AA64ZFR0_EL1);
+	GUEST_REG_SYNC(SYS_MPIDR_EL1);
+	GUEST_REG_SYNC(SYS_CLIDR_EL1);
 	GUEST_REG_SYNC(SYS_CTR_EL0);
 	GUEST_REG_SYNC(SYS_MIDR_EL1);
 	GUEST_REG_SYNC(SYS_REVIDR_EL1);
-- 
2.34.1


