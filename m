Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39DB0C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Mar 2025 03:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Lqb2eZQ/+kMWvbgl9EAomxF8FEK43YLgtDWWib56z+o=; b=VBEeq35KhndmV8ceM7fgN8WIqq
	C68Pt+KiDaMQ8d7OjNRKUQBwnR6qCNZhQRDOHh+utmW2tzhl6uVG6DfQwS3/BbAivT2lmVBhnTVva
	5r/aCqI25zHwRPmy3hh5XHUNVLk8yn6TtL/8hLPEgYUOVP2zg2A155KzPEpx8SwQa4aRYcRx38rEI
	AlWMHu18pbrFM1L0M1vx8tkDTvbjY98KhOBpQxxQsQTuKGq52RuGil54w20X2Lg8YQCUAg0w8i4sd
	ksaxDzxmJO5tbI5YWqJETmOxwwSDAYOhvBEmXIQfqMSjk0jr9y7GLnoQW/OwZ5VdYDp022ACkCbyq
	jGre1w1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvpvH-0000000GnCj-20hW;
	Sat, 22 Mar 2025 03:53:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvptb-0000000Gn7a-00oS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Mar 2025 03:51:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 324DD106F;
	Fri, 21 Mar 2025 20:51:38 -0700 (PDT)
Received: from entos-yitian-01.. (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 04ADF3F694;
	Fri, 21 Mar 2025 20:51:26 -0700 (PDT)
From: Jia He <justin.he@arm.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jia He <justin.he@arm.com>
Subject: [PATCH] KVM: arm64: pmu: Avoid initializing KVM PMU when KVM is not initialised
Date: Sat, 22 Mar 2025 03:51:15 +0000
Message-Id: <20250322035115.118048-1-justin.he@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_205139_103923_D99FBD39 
X-CRM114-Status: GOOD (  10.22  )
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

Currently, `kvm_host_pmu_init()` does not check if KVM has been
successfully initialized before proceeding. This can lead to unintended
behavior if the function is called in an environment where KVM is not
available, e.g., kernel is landed in EL1.

Signed-off-by: Jia He <justin.he@arm.com>
---
 arch/arm64/kvm/pmu.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/kvm/pmu.c b/arch/arm64/kvm/pmu.c
index 7169c1a24dd6..e39c48d12b81 100644
--- a/arch/arm64/kvm/pmu.c
+++ b/arch/arm64/kvm/pmu.c
@@ -227,6 +227,13 @@ void kvm_host_pmu_init(struct arm_pmu *pmu)
 {
 	struct arm_pmu_entry *entry;
 
+	/*
+	 * Prevent unintended behavior where KVM is not available or not
+	 * successfully initialised, e.g., kernel is landed in EL1.
+	 */
+	if (!is_kvm_arm_initialised())
+		return;
+
 	/*
 	 * Check the sanitised PMU version for the system, as KVM does not
 	 * support implementations where PMUv3 exists on a subset of CPUs.
-- 
2.34.1


