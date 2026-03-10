Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51829EA854E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 08:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=unk1hnkLj8qfz9Lgm4/vL8pWVNpUxkF+NrPESZuwUF0=; b=Fz6lqFlwnVb3AEEq+YyzWSXTjf
	KYSJwmcvn9SW4r8LZhQC/O7VKgM5s2NEUWaq7UHbAEE4WYGzBqMKDJ/HgHIxylLOVKnVKXbq5E1Jd
	EpkRwWwHQVDprbLVBholBiCiKZ80DrOCBM8GCJ+En6eoT/8xryikbviekjpkeOwst+Ke+j5nDplmG
	kKVUPuCO5O54YGFkfdYOWww9/0OneY1WggjCa5pz5zJvlEMrxBJsKjyNtOFkGZrpyk98CNawd1CPB
	aO7Pz8zcMnCXIPEHkkGZWbgw53uJNqWBV3PC/AB3dnw9r6z0Pt9QSvsf6BwcqyuQ82UrWSWy8P09G
	FKcDipVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzsrh-000000090bm-1i3r;
	Tue, 10 Mar 2026 08:54:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzsrg-000000090bg-1QRc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 08:54:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6450260054;
	Tue, 10 Mar 2026 08:54:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F34AC19423;
	Tue, 10 Mar 2026 08:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773132895;
	bh=+IGCKgqPFHDe5JXoy8PHXf111KpMuolV8jtRpNeWfQc=;
	h=From:To:Cc:Subject:Date:From;
	b=mq5rd7+EfhMEwbrTHQdfWHOa2RLs8tXbtHUagjVTbtXoOgVpV3WjiGSW2n+lEcX4f
	 GwAvCwrN4vS9TZTb9kgPLKwa5b1LZLnWS2GjrOx8mB44opLBfGLEShHjKHKnvF6vCl
	 SjuI2+pDexe4RKaHNEYfOzmYb17/74RiK5GolGGK5OKZrpHzU6BhkC9QA3fl/1uXG2
	 NVHGHyPm7MqRLPuGE/UlXZb5W+D0PMpRWWgjx1luKpnaa2F+ganVR+DvuqSlOmgtEd
	 3CrVdtcsdo85M8IjOA+Pefx++wCMEvX+Tyu/TIuoj7yCbplA+gL3+QPOaV5RsH0I6s
	 aSCZWUa6qGFkg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vzsrd-00000000Lpv-0ITl;
	Tue, 10 Mar 2026 08:54:53 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	stable@vger.kernel.org
Subject: [PATCH] KVM: arm64: pkvm: Don't reprobe for ICH_VTR_EL2.TDS on CPU hotplug
Date: Tue, 10 Mar 2026 08:54:33 +0000
Message-ID: <20260310085433.3936742-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, will@kernel.org, catalin.marinas@arm.com, qperret@google.com, tabba@google.com, vdonnefort@google.com, stable@vger.kernel.org
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

Hotplugging a CPU off and back on fails with pKVM, as we try to
probe for ICH_VTR_EL2.TDS. In a non-VHE setup, this is achieved
by using an EL2 stub helper. However, the stubs are out of reach
once pKVM has deprivileged the kernel. The CPU never boots.

Since pKVM doesn't allow late onlining of CPUs, we can detect
that protected mode is enforced early on, and return the current
state of the capability.

Fixes: 2a28810cbb8b2 ("KVM: arm64: GICv3: Detect and work around the lack of ICV_DIR_EL1 trapping")
Reported-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
Cc: stable@vger.kernel.org
---
 arch/arm64/kernel/cpufeature.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index c31f8e17732a3..947ff71b3b66b 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2345,6 +2345,9 @@ static bool can_trap_icv_dir_el1(const struct arm64_cpu_capabilities *entry,
 	    !is_midr_in_range_list(has_vgic_v3))
 		return false;
 
+	if (system_capabilities_finalized() && is_protected_kvm_enabled())
+		return cpus_have_final_cap(ARM64_HAS_ICH_HCR_EL2_TDIR);
+
 	if (is_kernel_in_hyp_mode())
 		res.a1 = read_sysreg_s(SYS_ICH_VTR_EL2);
 	else
-- 
2.47.3


