Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C06ACC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 18:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+PgJIk0VYwShwfczSbP/REczLdiMUz6JqC9aciUpCfM=; b=SMtKeAY+HCUA8L/GeVhAWNCnP9
	cp5AkkdELHvdCtJdL3rYViKuvN5eTKT09smyFGfAMjC4gbOZuLcBABkZA34JZTtd3Te2yJ5bPpTeE
	zRNyUjW58hvkLxruixF8wBfqDNA0nfoZ5FpRnfh2yrS+gfVK0MLFFnDVy52lOXM0Q7n3m36XfvC6B
	CTKUfu8tnlFRe5HWYOo3FpIUocJfr4GCjSj5OCelTo1vwiNatTKn+QoDjXFGz1LJbc5QtRu+1QWoG
	IAKQ6sNheQCdr3TiyGXxxwCfHAAEYuvDZ7IMxzFb7yUV8sGn2O43sOuuEKQKKFI+qKLFTxRtUr0Se
	ihLOy7jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmzPa-00000000rK2-2dMf;
	Tue, 25 Feb 2025 18:12:06 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmykd-00000000eA9-1qyu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 17:29:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E83CB612C5;
	Tue, 25 Feb 2025 17:29:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F384C4CEEB;
	Tue, 25 Feb 2025 17:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740504586;
	bh=xRpO2zj0gHFpycFMnNKG7Uh812YDKZ2YV9mcceXqpxY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BDnRM3IxjEJkeVQOBdCG4E8RMlRe1FBA8A71/YjD77XhbNWeYmpnhEksILDooMi7o
	 prlzTkZTndR3SXYKZZIiHty2XCUGV12rvNJSCT4WtL8mPK7fhsRXfwj7easx/UKoXG
	 p0wOx9Z4jdIigb3ACJrIsYX86gnLDltRp9qPwS7M5u+7/wcaHQTwNTg5OOlQ79EgPX
	 sD/CwrP74cyve3HYKvzSBrd/bT2Q1wts/7PzopMbtbkmrA/fO/AiY/bC/VuMd15Fni
	 For6uW8jAHc2QT1ZCypsLhT9urRSzGWJ4LEAdHbE8EllsQi0tNdzWvjhMJb+rK+QnF
	 KmznHTwFMbJKw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tmyka-007rKs-N5;
	Tue, 25 Feb 2025 17:29:44 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v4 05/16] KVM: arm64: nv: Add ICH_*_EL2 registers to vpcu_sysreg
Date: Tue, 25 Feb 2025 17:29:19 +0000
Message-Id: <20250225172930.1850838-6-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250225172930.1850838-1-maz@kernel.org>
References: <20250225172930.1850838-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, andre.przywara@arm.com, eric.auger@redhat.com
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

FEAT_NV2 comes with a bunch of register-to-memory redirection
involving the ICH_*_EL2 registers (LRs, APRs, VMCR, HCR).

Adds them to the vcpu_sysreg enumeration.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 3a7ec98ef1238..7e0dc6b4cb99e 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -557,7 +557,33 @@ enum vcpu_sysreg {
 	VNCR(CNTP_CVAL_EL0),
 	VNCR(CNTP_CTL_EL0),
 
+	VNCR(ICH_LR0_EL2),
+	VNCR(ICH_LR1_EL2),
+	VNCR(ICH_LR2_EL2),
+	VNCR(ICH_LR3_EL2),
+	VNCR(ICH_LR4_EL2),
+	VNCR(ICH_LR5_EL2),
+	VNCR(ICH_LR6_EL2),
+	VNCR(ICH_LR7_EL2),
+	VNCR(ICH_LR8_EL2),
+	VNCR(ICH_LR9_EL2),
+	VNCR(ICH_LR10_EL2),
+	VNCR(ICH_LR11_EL2),
+	VNCR(ICH_LR12_EL2),
+	VNCR(ICH_LR13_EL2),
+	VNCR(ICH_LR14_EL2),
+	VNCR(ICH_LR15_EL2),
+
+	VNCR(ICH_AP0R0_EL2),
+	VNCR(ICH_AP0R1_EL2),
+	VNCR(ICH_AP0R2_EL2),
+	VNCR(ICH_AP0R3_EL2),
+	VNCR(ICH_AP1R0_EL2),
+	VNCR(ICH_AP1R1_EL2),
+	VNCR(ICH_AP1R2_EL2),
+	VNCR(ICH_AP1R3_EL2),
 	VNCR(ICH_HCR_EL2),
+	VNCR(ICH_VMCR_EL2),
 
 	NR_SYS_REGS	/* Nothing after this line! */
 };
-- 
2.39.2


