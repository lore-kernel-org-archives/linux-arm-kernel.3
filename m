Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5CBDC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 21:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d+AVNmc7bxNcn/rO1HQVw2ctu+vF90GSumiH6SoPhnc=; b=Pm5sY+5CnjALLTkLBJPXsfr2tk
	8rdgbSFc8ZJtpLNnDcme2XYeIIgNTASO9vL+9kMX9lVEkQUgyOBiY0bI1qwfsfG+MdWB/xPtLyUTy
	PvcvmGhfOJw13GwCbSuhA+o32svC5P73fVTvocpvqr1Xz3o9+dsYl2D86S8W5uKisRt3rLom8rPXd
	kyWu+lL4oPMmXrFqU1szv9VUxwzhizYv15KnuIlEp5bNWCn6r4y44dD2Btz+Mbd12+k4skqUVX6ov
	u4xFbot5Y/BW961KXOJKm8CVJ/2iJPFQYIXyiwRDoC2y4KV4jSl+XgZtGtaBq746W/NxXc4yrIfRI
	zhQubk8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1WNY-0000000DQB4-2hTt;
	Tue, 01 Sep 2026 21:50:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1WNX-0000000DQAa-2iUv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 21:50:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 69F6243C61;
	Tue,  1 Sep 2026 21:50:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FCEC1F00A3A;
	Tue,  1 Sep 2026 21:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788299451;
	bh=d+AVNmc7bxNcn/rO1HQVw2ctu+vF90GSumiH6SoPhnc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=W9iOQjI1rrGa1yMi5srYxmava0qzeI6BZLFUoSa0j0w1ktZJM2em3YKd/d57Oybmf
	 ifZBTWZglgn/fvnxEOJjjV4wcBZ7Ph9IJn+A0CXw/4GIj0PFQ80j/SVmssThOX3j5y
	 iHjdwlFEfgqRn97u5PHbadcwYz9X5g8mTb3dTkGmzOrAtQR1rsAvHo15IdMFiQxXpJ
	 5DseeF5YcwLgefuIpus1U4EZJeL6rvIrhT7V5gRDcjyzbOYj0Q0I1S3Vka26zzBVJs
	 1CUv2p9+41kb+6eKVF3SxWo9rF7fewwB6xXX9g0OcszCU7fY/SJJagjGEbpfPXl+Mz
	 KMj7Io+9cQS3Q==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 01 Sep 2026 22:47:02 +0100
Subject: [PATCH v20 04/14] KVM: arm64: Ensure GCS memory effects are
 visible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-arm64-gcs-v20-4-f31750bdfadb@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1878; i=broonie@kernel.org;
 h=from:subject:message-id; bh=LwMT3EVZoWU5eNa5DiJ2GGvvTQFQp0oHfZnwyQfQBTQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBql0ifKxbOLVWORa3S4gy8SI5WMrDaK9fxgLlXc
 /ggZP58ZZeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapdInwAKCRAk1otyXVSH
 0FPFB/9+UT3nttgf5in3uZHBX+a83G4M3mzsPxIAtI5dFCKihmUZJYyUl3Hrv2Pd8Srnlv5oUYs
 u5z+FAemxHbTL0wxShYystY3zBLfLuTHn6buak8cKPgI/aA6oPQ0i85ugxkCnzGctkADLwTgkZA
 /OW7ciq7enmv/DA8vyEO2OzCVbb7gV7td7MlGizbWKKPFKjHa+QSOBm0PZXMDbcwCsL4YKiIotp
 i1tO2KR43yiB+lUUF23XcMt1/saoH+eO6ol9c8kLApMCgZCfL6YSm+h1M9S1TxsqeD8x7cvWCWs
 TIo8UFvc6YXlVB1Qj0Rz7oqtZtn4fkJnCRcZIaurEzPoE1ei
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

In order to allow efficient implementation of GCS implementations are
permitted to do GCS specific caching, with barriers implicit in stack
switch operations and GCSB DSYNC as an explicit barrier.  Since we do
not use GCS in the hypervisor or host kernel the hypervisor cannot rely
on any barriers being present in vCPU context switches other than those
it explicitly inserts.  Add explicit barriers when loading and saving
vCPU state.

Signed-off-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>
---
 arch/arm64/kvm/arm.c               | 7 +++++++
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 8b080804bc90..52f53f682e6a 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -755,6 +755,13 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
 			vcpu_set_flag(vcpu, PKVM_HOST_STATE_DIRTY);
 	}
 
+	/*
+	 * Ensure any GCS memory effects from the outgoing vCPU are
+	 * visible elsewhere.
+	 */
+	if (kvm_has_gcs(vcpu->kvm))
+		gcsb_dsync();
+
 	kvm_vcpu_put_debug(vcpu);
 	kvm_arch_vcpu_put_fp(vcpu);
 	if (has_vhe())
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 9a3b92e626ad..534db037c5f6 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -261,6 +261,13 @@ static void sync_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 	fpsimd_sve_sync(&hyp_vcpu->vcpu);
 	sync_debug_state(hyp_vcpu);
 
+	/*
+	 * Ensure any GCS memory effects from the outgoing vCPU are
+	 * visible elsewhere even if the host skips syncing.
+	 */
+	if (kvm_has_gcs(hyp_vcpu->vcpu.kvm))
+		gcsb_dsync();
+
 	if (pkvm_hyp_vcpu_is_protected(hyp_vcpu)) {
 		host_vcpu->arch.ctxt = hyp_vcpu->vcpu.arch.ctxt;
 	} else {

-- 
2.47.3


