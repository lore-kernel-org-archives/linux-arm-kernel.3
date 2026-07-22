Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC2CC531CE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 07:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=whHpJ36OI1bAClZaUTHR3b4xJe/NWRnqvq/wOSxIZAM=; b=ZznSHEVhp3shdqtRia0e4xYniy
	lXs6T6zK8wKoNeu52LOPDUJuvi2iTDl1jkTQlci5sFh4TmUtOt82ugPOeFhvpYYZhBz2v9i8XspDd
	EvPy1H5nwMAqeYn84Qkv5HOVI1LXqEyhKdiUjvXMm2igJHvzm9ikOE98Kp7ocseKqDHqiZREAyu9N
	uqdL6IEfkgsIzT1PKrVwgRZYBzHWaHJcrsbP6teVQIUDuJIK5MX4HHgqTI/G0D9rdU8cKmGodKCQU
	IGs5vtLjnt245sJFBSIzq0hQpKSUmg5l22qaRVf3gDWZx/88YcuQmyGgh7c0aNxwMJR15UwnUMb9I
	exvZriLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRc6-0000000B7Iz-0mYu;
	Wed, 22 Jul 2026 07:43:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRba-0000000B6lx-0Z6u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 07:43:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DF675450E8;
	Wed, 22 Jul 2026 07:43:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C61B91F01559;
	Wed, 22 Jul 2026 07:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784706181;
	bh=whHpJ36OI1bAClZaUTHR3b4xJe/NWRnqvq/wOSxIZAM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=S1ZoXlDyNva2/c8afoX2lQD+4zVgg2utFnbauV56l6yl5VkoDoPbcikWsd+tSHSDT
	 TmH/e0qFsNapNdtYjWX/6bFhIXdoIE4ZMzaxE2KSeNCBSihRV/wipxiQ4t0BMAnPe3
	 w97NlrZYSEWO8stidDyRK2SnMhngG+dOAhwzTsdZ2+XYTK1DH95W0Cf4z4fwAh5hgG
	 K5GPwmMWIwdyv8Kl1+JWZfxZt4us+kj6Gaane8EWOIFC9Pb8qAPt9eW3WMSbwN+nA8
	 0SGjYYHHr4oZJrx4DQgGKpm32hNvC3mZaGteTSSUfo7Rgrnjp3aorkowRds7OlgKqt
	 Gt0sQQ9XXRB1w==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wmRbY-00000007VfN-0ZEf;
	Wed, 22 Jul 2026 07:43:00 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH v3 26/28] KVM: arm64: Add FEAT_NV3 detection
Date: Wed, 22 Jul 2026 08:42:32 +0100
Message-ID: <20260722074234.3330999-27-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260722074234.3330999-1-maz@kernel.org>
References: <20260722074234.3330999-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, yaoyuan@linux.alibaba.com, weilin.chang@arm.com
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

Now that everything is in place to engage the FEAT_NV3 fast-path,
add the detection code to cpufeature.c.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kernel/cpufeature.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index c9c124b0ccc8e..6ae1c816e2010 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2627,6 +2627,13 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.matches = has_cpuid_feature,
 		ARM64_CPUID_FIELDS(ID_AA64MMFR4_EL1, NV_frac, NV2P1)
 	},
+	{
+		.desc = "FEAT_NV3",
+		.capability = ARM64_HAS_NV3,
+		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
+		.matches = has_cpuid_feature,
+		ARM64_CPUID_FIELDS(ID_AA64MMFR4_EL1, NV_frac, NV3)
+	},
 	{
 		.capability = ARM64_HAS_32BIT_EL0_DO_NOT_USE,
 		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
-- 
2.47.3


