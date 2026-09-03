Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 829D3C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 16:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YklBsdT8d8AQN5ePeo9eCvAKupUJF17L2rSWU/heWUg=; b=R99UMwpRibdMeRW0K7DZACMI1K
	M0YOCOMczjVsNBedq3nJ6ajYid8VW/mABzBpjP7pYJ8yE6yh2vVJeyuNYYjRt2ahUZk9kkZsb+VAf
	SVoqCHlKTDJRjmv1FUzVaiiEBj9bbXGXvXKaol+UCgWgVqH515fD2fV5M/FW6IPeAnO2hrM23FuEA
	gK0iqAQBX70Do6Mx+ePLEtmSVRLbcv7zoY6pKBXwqwdy43KB8Jq/uYt3CV4y3V9wj/jJo//ctfyUh
	+WJG57JXUAE12r5che1j3OaaA4S/pINO43Dz9V0UmzLELzH2S+nKQyWVDYyKHyfKKy9tv30wqy0Hx
	zQgwWwzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29xe-0000000053D-1Nra;
	Thu, 03 Sep 2026 16:06:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29xa-000000004zp-2DFl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 16:06:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 022521596;
	Thu,  3 Sep 2026 09:06:38 -0700 (PDT)
Received: from e140010.cambridge.arm.com (e140010.arm.com [10.2.213.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB0833F673;
	Thu,  3 Sep 2026 09:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788451601; bh=KRsytHCjVYrI/He9Vivq384CY+lKsfqtVtL5OpWLDQE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=XMG4YcD79DKgN3anhQzRYRyNe+6ozkgII7QCHy5x8wnM1Gr3j2dg9d9IoLI5XyIVm
	 iIWLcjIUX3XyOzeGt05GKBt5r/ebZLjYG5YFHQP+G+5kWkAtdrBI9YjnA5ZXSzYy0Q
	 B2KzDl6QraImVpPcBNfDxWcrqTFnEpI/jmgdUTQI=
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
Subject: [RFC PATCH v7 03/28] KVM: arm64: Add CONFIG_KVM_ARM_SPE Kconfig option
Date: Thu,  3 Sep 2026 17:05:58 +0100
Message-ID: <20260903160623.315525-4-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903160623.315525-1-alexandru.elisei@arm.com>
References: <20260903160623.315525-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_090642_602688_EEB11FD8 
X-CRM114-Status: UNSURE (   9.78  )
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

Add a new configuration option that will be used for KVM SPE emulation.
CONFIG_KVM_ARM_SPE depends on the SPE driver being loaded because:

1. The SPE driver maintains a cpumask of physical CPUs that support SPE,
   and that will be used by KVM to emulate SPE on heterogeneous systems.

2. KVM will rely on the SPE driver enabling the SPE interrupt at the GIC
   level.

The option will become user selectable after SPE support in KVM is
implemented.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arch/arm64/kvm/Kconfig | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index 449154f9a485..fece4c02b97c 100644
--- a/arch/arm64/kvm/Kconfig
+++ b/arch/arm64/kvm/Kconfig
@@ -103,5 +103,14 @@ config PKVM_STACKTRACE
 	  If unsure, or not using protected nVHE (pKVM), say N.
 
 endif # NVHE_EL2_DEBUG
+
+config KVM_ARM_SPE
+	bool
+	depends on KVM && ARM_SPE_PMU
+	default n
+	help
+	  Adds support for Statistical Profiling Extension (SPE) in virtual
+	  machines.
+
 endif # KVM
 endif # VIRTUALIZATION
-- 
2.43.0


