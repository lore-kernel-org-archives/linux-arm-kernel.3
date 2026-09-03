Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38438C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 16:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f6VskqS0TvkoY5qNH6DjQiH1hm31yUpNt1ETVOZHcEI=; b=RayQhzCEcHwaM/YhoNRuG9IbE0
	NY7w8RVkvddG28zWi9Uk/V/0xo2f/C5yU6GH0cSncQooFLUUmQIkduttqbpzeTqWu6Jrt99S6GOyF
	fJfmaN/jIiK0vVQQA34G5DEKDGqdz1RUUlD8OO4P1NQpv42wYbzByQgOFiJdzQ+/JqdGaRxgkWijx
	uOu+9LBL3HVDnb01DBTpWp5KCyQALo6lem7NvDw+soVUyNpTHioIJR6QZnd+mDhq7tQUtuQeQmn5M
	v5GsGEHo2qz5CXtfK96dyUnKX0fokDapwmmXg11F63D1onj7Y1gyVGyXu0ymwNoBfogXq+osKJgjk
	9k66uB3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29xn-000000005DZ-4B6y;
	Thu, 03 Sep 2026 16:06:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29xl-000000005A7-2nZO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 16:06:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F85C1650;
	Thu,  3 Sep 2026 09:06:48 -0700 (PDT)
Received: from e140010.cambridge.arm.com (e140010.arm.com [10.2.213.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 43FD93F673;
	Thu,  3 Sep 2026 09:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788451612; bh=ppWn8zxveAr9HnN+Ue1ihaXYa9wTPVehLcQtaWF0KrA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=aetRBJc5PZWQ1UkyNsOnC/mYjjacSfvMMK14/JoLlaOy4Co7lejhoC0cR3grQC8dW
	 WFPaJ2Xmxywb6q7NxVWpVe/jazif4dVGyvcPMjk0hfK9u2b9ZQWy+S2L3QkRSIrT/n
	 lRcS4YPZAF+gEsdwJHBjNZer4RubrtDbbJuaFXy0=
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: maz@kernel.org,
	oupton@kernel.org,
	fuad.tabba@linux.dev,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-perf-users@vger.kernel.org,
	catalin.marinas@arm.com,
	james.clark@linaro.org
Subject: [RFC PATCH v7 08/28] HACK! KVM: arm64: Disable SPE virtualization if protected KVM is enabled
Date: Thu,  3 Sep 2026 17:06:03 +0100
Message-ID: <20260903160623.315525-9-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903160623.315525-1-alexandru.elisei@arm.com>
References: <20260903160623.315525-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_090653_741989_A127E8CB 
X-CRM114-Status: UNSURE (   8.90  )
X-CRM114-Notice: Please train this message.
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

For RFC only.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arch/arm64/kvm/spe.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/kvm/spe.c b/arch/arm64/kvm/spe.c
index 646806a60d66..97160d1fae81 100644
--- a/arch/arm64/kvm/spe.c
+++ b/arch/arm64/kvm/spe.c
@@ -22,6 +22,10 @@ void kvm_spe_add_instance(struct arm_spe_pmu *spe_pmu)
 {
 	struct spe_pmu_entry *entry;
 
+	/* TODO: pKVM support */
+	if (is_protected_kvm_enabled())
+		return;
+
 	guard(mutex)(&spe_pmus_lock);
 
 	entry = kmalloc(sizeof(*entry), GFP_KERNEL);
-- 
2.43.0


