Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E61CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Aug 2025 20:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5XtMCqwtvst6jDxbdscWkXjDGCoH4jBDpKoKKMgZvWM=; b=FkWTrqO3O06seG8dzLuEpzsr+J
	F8nwbLTLBB9DJ7lVfehol613+M+SjHYvoIHXy3g8mJQd5AOUBdeUnILhceEJPtsrvH3OLfUvh+ab7
	cKfnHCNigeJwUxBgF9cxTh+165fursuTgIA//3j6hrOKTlAjvaW2gLwERsXPCoLymWTgqxJ8kWcRv
	wcJQf42hrSYGx+x9EDTsi2LHljYZ7jcEC7XKKdT6F0KATG32t7JfjdMMZ2ju+hvrqKHspmvCn8cyW
	Cec1BOi9vj5fVcZw6V6n349QWyP5OdMK9OBfg3QV1eiKfQpeK1yPMor9Trje2WeG8f/p+C7HMWSKj
	iu8rI/Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unk0v-000000061SL-28xd;
	Sun, 17 Aug 2025 20:30:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unjtH-000000060QX-1yea
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 Aug 2025 20:22:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 66D2243E72;
	Sun, 17 Aug 2025 20:22:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39544C4CEED;
	Sun, 17 Aug 2025 20:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755462125;
	bh=RXgWRSGH4nGx0A8lxjTwK5dMqds4qncvFuceBa86+kY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qsj6nrTUnvYJ7KlkpI4Viy+RR1VJWN0kRVZ8DarcSE/KiLsCBVU7tG7V9Uo2vflx4
	 FYLyQ/vTqqsCZ+1K89hATqkTPCyHRWOGSzYKpnBNL7YJy2YYrTlWyhd+lbgZnPvB2o
	 H8aQVQFSvvpY+B9nM9lbYttLMGFLLge0m1r8kYQLvYOPVXBmiytsURANAHQ8ohwoMd
	 296rQqmV5O9vU2q5LN3rKrWt/eN8mGYNVtIqv8CBF2DRyJh9CpAu5OTFhVZbcI/sfM
	 QbQ2qptiGxtwCuM2ONUWbC1k4VddZhrZG/mgVjXygHCj5jm2baziP9Nljz2Owb4FYO
	 Be3fLpOusr/Ww==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1unjtD-008PX0-1U;
	Sun, 17 Aug 2025 21:22:03 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v3 1/6] arm64: Add capability denoting FEAT_RASv1p1
Date: Sun, 17 Aug 2025 21:21:53 +0100
Message-Id: <20250817202158.395078-2-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250817202158.395078-1-maz@kernel.org>
References: <20250817202158.395078-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, will@kernel.org, catalin.marinas@arm.com, cohuck@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_132207_562075_B1D0506B 
X-CRM114-Status: GOOD (  13.50  )
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

Detecting FEAT_RASv1p1 is rather complicated, as there are two
ways for the architecture to advertise the same thing (always a
delight...).

Add a capability that will advertise this in a synthetic way to
the rest of the kernel.

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kernel/cpufeature.c | 24 ++++++++++++++++++++++++
 arch/arm64/tools/cpucaps       |  1 +
 2 files changed, 25 insertions(+)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 9ad065f15f1d6..0d45c5e9b4da5 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2269,6 +2269,24 @@ static void cpu_clear_disr(const struct arm64_cpu_capabilities *__unused)
 	/* Firmware may have left a deferred SError in this register. */
 	write_sysreg_s(0, SYS_DISR_EL1);
 }
+static bool has_rasv1p1(const struct arm64_cpu_capabilities *__unused, int scope)
+{
+	const struct arm64_cpu_capabilities rasv1p1_caps[] = {
+		{
+			ARM64_CPUID_FIELDS(ID_AA64PFR0_EL1, RAS, V1P1)
+		},
+		{
+			ARM64_CPUID_FIELDS(ID_AA64PFR0_EL1, RAS, IMP)
+		},
+		{
+			ARM64_CPUID_FIELDS(ID_AA64PFR1_EL1, RAS_frac, RASv1p1)
+		},
+	};
+
+	return (has_cpuid_feature(&rasv1p1_caps[0], scope) ||
+		(has_cpuid_feature(&rasv1p1_caps[1], scope) &&
+		 has_cpuid_feature(&rasv1p1_caps[2], scope)));
+}
 #endif /* CONFIG_ARM64_RAS_EXTN */
 
 #ifdef CONFIG_ARM64_PTR_AUTH
@@ -2687,6 +2705,12 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.cpu_enable = cpu_clear_disr,
 		ARM64_CPUID_FIELDS(ID_AA64PFR0_EL1, RAS, IMP)
 	},
+	{
+		.desc = "RASv1p1 Extension Support",
+		.capability = ARM64_HAS_RASV1P1_EXTN,
+		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
+		.matches = has_rasv1p1,
+	},
 #endif /* CONFIG_ARM64_RAS_EXTN */
 #ifdef CONFIG_ARM64_AMU_EXTN
 	{
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index ef0b7946f5a48..9ff5cdbd27597 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -53,6 +53,7 @@ HAS_S1PIE
 HAS_S1POE
 HAS_SCTLR2
 HAS_RAS_EXTN
+HAS_RASV1P1_EXTN
 HAS_RNG
 HAS_SB
 HAS_STAGE2_FWB
-- 
2.39.2


