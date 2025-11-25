Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6927D0EE04
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 16:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CAa++IS7AbGYa+kbztTch4WvOZorGo1JgFK/O9u7lUE=; b=Lc43Wi3C6oijmtEO8s6SiKkMUi
	m1y5K+50CZyYk9CyzgCppQII9Y4Cx/dYjkXhA7ulDBweoUVXfAGMLcN6wA35J3oXkv4gpH1M003aN
	fF5n+x14uzB+YY1dYRZnkVoV0DjtYydBRj0Boybwi/Jm+aslPvgDP+/DfvMQQGq0rKu/MxMBhrgBt
	LDTGX58IswzNgv67ZMWjfDsrn+HqNY7i65gS9H5UZAPkEL50hX/lkYfhXLUZLhh/QqXofwiiIjT4a
	LarTYLGhdlNeYA+TK4G+aen4NlfnlOKmmV8MpBQVtrQCgxF3tunjNOQifcNApXbUQaFeT52FGwv7I
	g4zfk1Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNvUp-0000000DXyW-1Kaf;
	Tue, 25 Nov 2025 16:02:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNvUo-0000000DXyP-09lT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 16:02:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2304960052;
	Tue, 25 Nov 2025 16:02:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C96AEC116C6;
	Tue, 25 Nov 2025 16:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764086544;
	bh=5uKOvlafiq2x+XURvl8Zo9WIMRkudbGHaY/ohACMNKs=;
	h=From:To:Cc:Subject:Date:From;
	b=WIDaOA/VDK7fWVSiPxyn/lU3XEpuw6/AQXwVWlcLjAJroxd3JNn4nAakhxp824DpK
	 gc2hbsD0aVLiAHD0w06sPFUy/D5L8Q/LSTSTxFvpFWMgTgaSiAHaL2OD4hpzj8tJJt
	 2q4ykPBpM03ZJOoa8vGj9QypwZPtQGaEkPZjrwwlrfZ+LsiNO28qpNQpONlWjQpYgD
	 2IeC/iZDzFraAOWfVwWuDAwD5/rMXuIVC9x6dLspe/M+RbJha8+vUUm6hDKv3h4GU0
	 LmndmXxjY6nU7hMVD5HlEwhVTiAgBY5gJBO/4XldqjyE9XSxturPq4frbxsJWfv3O5
	 u1QcVK6m/2tkg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vNvUk-00000008Cm6-1qY2;
	Tue, 25 Nov 2025 16:02:22 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH] KVM: arm64: Convert ICH_HCR_EL2_TDIR cap to EARLY_LOCAL_CPU_FEATURE
Date: Tue, 25 Nov 2025 16:01:44 +0000
Message-ID: <20251125160144.1086511-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
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

Suzuki notices that making the ICH_HCR_EL2_TDIR capability a system
one isn't a very good idea, should we end-up with CPUs that have
asymmetric TDIR support (somehow unlikely, but you never know what
level of stupidity vendors are up to). For this hypothetical setup,
making this an "EARLY_LOCAL_CPU_FEATURE" is a much better option.

This is actually consistent with what we already do with GICv5
legacy interface, so flip the capability over.

Reported-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
Fixes: 2a28810cbb8b2 ("KVM: arm64: GICv3: Detect and work around the lack of ICV_DIR_EL1 trapping")
Link: https://lore.kerenl.org/r/5df713d4-8b79-4456-8fd1-707ca89a61b6@arm.com
---
 arch/arm64/kernel/cpufeature.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 5de51cb1b8fe2..75fb9a0efcc8e 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2325,14 +2325,14 @@ static bool can_trap_icv_dir_el1(const struct arm64_cpu_capabilities *entry,
 
 	BUILD_BUG_ON(ARM64_HAS_ICH_HCR_EL2_TDIR <= ARM64_HAS_GICV3_CPUIF);
 	BUILD_BUG_ON(ARM64_HAS_ICH_HCR_EL2_TDIR <= ARM64_HAS_GICV5_LEGACY);
-	if (!cpus_have_cap(ARM64_HAS_GICV3_CPUIF) &&
+	if (!this_cpu_has_cap(ARM64_HAS_GICV3_CPUIF) &&
 	    !is_midr_in_range_list(has_vgic_v3))
 		return false;
 
 	if (!is_hyp_mode_available())
 		return false;
 
-	if (cpus_have_cap(ARM64_HAS_GICV5_LEGACY))
+	if (this_cpu_has_cap(ARM64_HAS_GICV5_LEGACY))
 		return true;
 
 	if (is_kernel_in_hyp_mode())
@@ -2863,7 +2863,7 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		 */
 		.desc = "ICV_DIR_EL1 trapping",
 		.capability = ARM64_HAS_ICH_HCR_EL2_TDIR,
-		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
+		.type = ARM64_CPUCAP_EARLY_LOCAL_CPU_FEATURE,
 		.matches = can_trap_icv_dir_el1,
 	},
 #ifdef CONFIG_ARM64_E0PD
-- 
2.47.3


