Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11990C4453C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 07:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AhyYZoRfqIfREPPS8CErWw/Y/QryBhe2Y1Mvp9CHj5Y=; b=c0PkukyIOetAPcpQqnjjvBH38G
	n402raHU0qEZRYmAvVBWefHes82lxX/C+eTL9RsDNzXeslbPFQOlTDCrDhHLny0NWC/58+lAk54Ch
	Fqhj9P40/JftkMbzzMqvz1d0/zrTkWLTwaqKM0Zk/OEkWxvRKOGo+fU9l8figNgF7HT74Aq6UADxG
	ub2YzWZ7FR73W4Wb+B7KBJR41Mcb+3Fg8AxetKm/XsgpkgmU8ei0XRReYxHxPpYwo72WSkrTPKspG
	XXgajE+wv/GToMzTbbF637BEPGyVAvLaDtzYL3phuOPgxQo7Q+WvL6Un642ndzPor1WfXyBhVVy2V
	rxF2sPSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRc0-0000000B74T-36gH;
	Wed, 22 Jul 2026 07:43:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRbW-0000000B6hK-3i9b
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 07:42:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9DB0D43F87;
	Wed, 22 Jul 2026 07:42:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 847D51F00A3D;
	Wed, 22 Jul 2026 07:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784706178;
	bh=AhyYZoRfqIfREPPS8CErWw/Y/QryBhe2Y1Mvp9CHj5Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HO/E8mN117DnD5Deg+HgykdpZQ75cmy80vDQkILn8Slw7LPVsu/iRJmTrM6/qUZwx
	 P+/yDR0pwJQJksplcW63bfFwFza1+sEaH3hl41khx6KXGrud/LwByQR/JVgexMzYDC
	 eE6usvwN+uAQYRGdyz6RE1katSLlExYsBvdkjtxAqtHgRh20YZr64YECdQyDj9tGOQ
	 gOoF3pUF/tT4zHktxEz4nVw2uMNrUep9bYvi1bJ/X2y5amI0cFXesa5bZABuPUYbs1
	 O8q4NIaeclYVtgnz0+Is9PodekmuJhdzWUZS+hq4iix5BRmDZlsDPnQQlVgNQRKNoo
	 gpVSqyalcfVOw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wmRbU-00000007VfN-3pHl;
	Wed, 22 Jul 2026 07:42:56 +0000
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
Subject: [PATCH v3 12/28] arm64: Add FEAT_NV2p1 detection
Date: Wed, 22 Jul 2026 08:42:18 +0100
Message-ID: <20260722074234.3330999-13-maz@kernel.org>
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

Add the necessary NV2p1 probing to the cpufeature infrastructure.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kernel/cpufeature.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 9a22df0c5120f..c9c124b0ccc8e 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2620,6 +2620,13 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 			{ /* Sentinel */ }
 		},
 	},
+	{
+		.desc = "FEAT_NV2p1",
+		.capability = ARM64_HAS_NV2P1,
+		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
+		.matches = has_cpuid_feature,
+		ARM64_CPUID_FIELDS(ID_AA64MMFR4_EL1, NV_frac, NV2P1)
+	},
 	{
 		.capability = ARM64_HAS_32BIT_EL0_DO_NOT_USE,
 		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
-- 
2.47.3


