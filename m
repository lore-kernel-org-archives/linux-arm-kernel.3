Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D47CCC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 16:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=whHpJ36OI1bAClZaUTHR3b4xJe/NWRnqvq/wOSxIZAM=; b=44zml830avLVaX1cu4OamuHNfn
	5qqjvnb1tOmb4kckeO8JwPt9WGQaSQReLAkZQmGIby4zfAmw9nHnMZm0k+PQ9xfoTio216YxaIlvv
	gnOq+YPHRSb4Sp9l3ryWd6r30ptrQV6PmOpHe2nIcMXUYkIgMZHQg/cwuwyvUO7aNZVysBDAZdamR
	y1GNgRgl+9gBN5D/avaWXia5BWEY69qodpgRVwRyUzoh/kDZh852L4++7PNy0ZpZ+p8LnMWfIYqFz
	lkzif5JRoOKfGXyA7F/gDXmoAtdv/53LdlPVJqW5kd3G2GvDk+tsH2xiLUE+kbNZazPCfmBDKOz0l
	A8bRrVeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJsh-00000004ueZ-0XMr;
	Thu, 02 Jul 2026 16:03:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJsY-00000004uID-08A5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 16:03:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 69010601F3;
	Thu,  2 Jul 2026 16:03:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E9FA1F01559;
	Thu,  2 Jul 2026 16:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783008185;
	bh=whHpJ36OI1bAClZaUTHR3b4xJe/NWRnqvq/wOSxIZAM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dm3HDKMo5I7SCRzVbeCAvh80M0blEDPp8JzeP5dZ0xd2b8Y1dl8XJ0f63aHATD743
	 gUCWC0kJ6GJIvUUgQnHwQe0D68v1BodFLjK61wJKw+UZCvVCZn/a7YScOObLRr+juq
	 iJlDNCBiRtpnoFKYpXniCx/bIWH1iOH3Tq4Ip679qKYYd7EqRqoqiNOTtGxDcSPJhP
	 UKEmO56MCxKHxSwmhcYQWZg6H+z50ykNxCyzJhgzgw/6eL7WXsDZTsVn+mZUS79lsv
	 7mhhmnO5UXsPGel94rTpln8O0lwbodY4tlZx8l4xOw8lenUnAGfM6hY3dHAs04O4Ss
	 gorA3VwZEDDIA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wfJsV-00000000ojd-1gRt;
	Thu, 02 Jul 2026 16:03:03 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 26/28] KVM: arm64: Add FEAT_NV3 detection
Date: Thu,  2 Jul 2026 17:02:46 +0100
Message-ID: <20260702160248.1377250-27-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260702160248.1377250-1-maz@kernel.org>
References: <20260702160248.1377250-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
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


