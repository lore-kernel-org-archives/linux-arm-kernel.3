Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4926DC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 13:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l1vzWonbvw1kesRAEIztqlwEh1d74B2tbqL5td3IoWo=; b=rCcT0MtmeWlGleUEDl+JIOz/p2
	O+cEWKkDy+al/7UPhKsmd3Dg9k261GGiyauBVpwZjaPLbVeIH+hGslb3t/zXdMUoF6NUb42daSTda
	leL4vR3XDMJ7Z8u3tHjmgfJteg8PtQHDd5kKusNOblVR1K/BtHpbWG9hf4A8o+6Q4Ddb+StDOZJu7
	OLYDiVKB9RIv3r5kNigtbDtOGc/+Nu1xW4hkH6rJC/nuwmabPwWlR/+Go+SV2QkT4GU19A3H9Hztl
	1E19t0LtSSckFv/RjEYhsZoVROMm2SVEsV2nLDaydHpEG/7By2c4F5rLtLJxeEeFwfFdR9FBydP+z
	8NsD9PZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8fDN-000000023CA-007o;
	Sat, 26 Apr 2025 13:05:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8eeN-00000001z18-1ky7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Apr 2025 12:28:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 849CA49F8B;
	Sat, 26 Apr 2025 12:28:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EED3C4CEEB;
	Sat, 26 Apr 2025 12:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745670534;
	bh=Bpk6RKCUS8mCcn0z7DGT1SGuzw/M+c16uxJw8Nsfl3s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hOfE/T3oqYgwp07Vjl8Xm1oyVvMer6w0TMVbNitcezajYzRrZ6gJfEml7LejolVXz
	 qBBGjpO81EYj5q9T37ikEVEyjjto8q3KDETtfS5haBZnrMXDXS5teDTEmrSACLMqig
	 lKjFrIyiyhwGgI2nt/7OYxthdmbHHxM0fYPB1XYHn4lcUrXBhCUFfzMIKsKTrlI8XC
	 E55bxiQeezJ+ig7Z0XIQtzWEwmXzLBWrBCDnL9yCUEURIB79sWTIqZ/wuMSIPGmOFl
	 7Cx0tcyklZEbji4ON7QoL9+eOV/tloz4M1N6blKZEU0tXSLL9/TID3nc5AX9yvEc7D
	 gHPkVdd2N1wyw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1u8eeK-0092VH-9v;
	Sat, 26 Apr 2025 13:28:52 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH v3 14/42] arm64: Add FEAT_FGT2 capability
Date: Sat, 26 Apr 2025 13:28:08 +0100
Message-Id: <20250426122836.3341523-15-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250426122836.3341523-1-maz@kernel.org>
References: <20250426122836.3341523-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, mark.rutland@arm.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_052855_476173_660370DF 
X-CRM114-Status: GOOD (  11.89  )
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

As we will eventually have to context-switch the FEAT_FGT2 registers
in KVM (something that has been completely ignored so far), add
a new cap that we will be able to check for.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kernel/cpufeature.c | 7 +++++++
 arch/arm64/tools/cpucaps       | 1 +
 2 files changed, 8 insertions(+)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 9c4d6d552b25c..bb6058c7d144c 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2876,6 +2876,13 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.matches = has_cpuid_feature,
 		ARM64_CPUID_FIELDS(ID_AA64MMFR0_EL1, FGT, IMP)
 	},
+	{
+		.desc = "Fine Grained Traps 2",
+		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
+		.capability = ARM64_HAS_FGT2,
+		.matches = has_cpuid_feature,
+		ARM64_CPUID_FIELDS(ID_AA64MMFR0_EL1, FGT, FGT2)
+	},
 #ifdef CONFIG_ARM64_SME
 	{
 		.desc = "Scalable Matrix Extension",
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index 772c1b008e437..39b154d2198fb 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -28,6 +28,7 @@ HAS_EPAN
 HAS_EVT
 HAS_FPMR
 HAS_FGT
+HAS_FGT2
 HAS_FPSIMD
 HAS_GCS
 HAS_GENERIC_AUTH
-- 
2.39.2


