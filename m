Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 859AEC87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 11:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wymr5DPyr9UcQwytV6Y0LOBfEz/pKmcBvYGZjuVzQrI=; b=3X3DitXlBUfeMBsmFBhG7QWlvF
	+yJPo++xGRr6iYPXSqTzwWdFW86ntXB0g91g1UTS1d30QNCrKqJRqHFp81BJiIXruEXoH6fW+fu0M
	2jCBG0IDlL/rJwRGNSeyEfqUkDqPkFyOUrlzEem/kNBvgwqIFAyqp3iHSjwX/c431huGjskRK3j7A
	9xAPCxGocOqax01zqSP5grxPKI9e5UhKu+b6WyQJ11OzUhMvl6eObJtkYRK4d2UU5uycNOGklQhr2
	qizkappy17cw+g0UiLzffTCP54MJVsgky20ti2ND7ANeO+vK+mTg09/OnsiFW2P+2hyLpgQuYNAzP
	SGeoLaPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udorb-0000000H7SF-1yG1;
	Mon, 21 Jul 2025 11:39:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udncu-0000000Gwl3-32ql
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 10:20:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DBEF960205;
	Mon, 21 Jul 2025 10:20:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 812B0C4CEF1;
	Mon, 21 Jul 2025 10:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753093207;
	bh=+398xTfyPjG6r7g/gjMZKa7+vZ8AGhHVgFuqAGzWumw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dEOJeD/Z6p+mVFRTLhivCVVNclshHZDejVkOPJiUrqRSTopxjFZQQXK9bcKWbkFjw
	 EeaNr23QfwjkmdFdz+spyjEn9gpiD5pJxk58sLzAmKruTydIk3zSPvhK1ejocP1qAi
	 Xzd/qEjm5Rjp0kM8lwEeZZCS4/I3jbFyRt9TP6BJ9WOuZV7mfFVS4YWE20AMnixgpY
	 vXAiiaSn18qonsF0sQ7Sl8CHFtuh3G7mWBjud/QhSADDkf1zDcnzt4r4f7PPSQZa9j
	 xhAfn5YsgDGHFsR+CIK85+Xv7vdvxJ00ZWhd60p6N1FG2UY4g8GJOwYpC5/XyZwFsJ
	 RR8ofAdBOxKvg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1udncr-00HZDF-KA;
	Mon, 21 Jul 2025 11:20:05 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH 1/7] arm64: Add capability denoting FEAT_RASv1p1
Date: Mon, 21 Jul 2025 11:19:49 +0100
Message-Id: <20250721101955.535159-2-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250721101955.535159-1-maz@kernel.org>
References: <20250721101955.535159-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, will@kernel.org, catalin.marinas@arm.com
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

Detecting FEAT_RASv1p1 is rather complicated, as there are two
ways for the architecture to advertise the same thing (always a
delight...).

Add a capability that will advertise this in a synthetic way to
the rest of the kernel.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kernel/cpufeature.c | 24 ++++++++++++++++++++++++
 arch/arm64/tools/cpucaps       |  1 +
 2 files changed, 25 insertions(+)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index a40b94f8e14e1..2da246b593ff7 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2235,6 +2235,24 @@ static void cpu_clear_disr(const struct arm64_cpu_capabilities *__unused)
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
@@ -2653,6 +2671,12 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
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
index 115161dd9a24d..eb7f1f5622a8f 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -52,6 +52,7 @@ HAS_S1PIE
 HAS_S1POE
 HAS_SCTLR2
 HAS_RAS_EXTN
+HAS_RASV1P1_EXTN
 HAS_RNG
 HAS_SB
 HAS_STAGE2_FWB
-- 
2.39.2


