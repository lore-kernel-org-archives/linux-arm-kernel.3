Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE337CE8D4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 16:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LSNNNRGJE6Roe81kv70x0bnZGCa3q3sCRKm9zClLAyQ=; b=hUofY06YtUbtsSKUneqMV5yf6A
	jmxTQWtwYDzjOfGAq3Z1DFjDKVFVzxLtwQ+TOHWcD7BDv/tiHzY4NDTX1LJswwz//WrM9sRcuY426
	hniMmtotc/dUaaQcxSF3ZH67Vh1iEwLpRsYLTij94R/u3u10RS+HkLtASnA75nyLMeHrQbH+PQGzJ
	JeHuPmEIQZaeqb7pumXtCCyJL+FIqwKIw47qLslO0gjhtE/Cq01tyVDia11YPX/uE79Hfc0q3958c
	078a7E+X7WGuc7KSN4PcvU0UaPeTXPwDKoLHbwgDkU1r+LWIIARyi01vNi0rePS0t3GQzUhOyxkRj
	6BY1QmSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwMZ-0000000CgsI-1ct6;
	Fri, 14 Nov 2025 16:09:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwMH-0000000CgU5-3c80
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Nov 2025 16:09:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=LSNNNRGJE6Roe81kv70x0bnZGCa3q3sCRKm9zClLAyQ=; b=DBl+sc4fdDHC/xgL14XaT0ttMY
	J8VkiWNQvOsUzCCn7Bou9UppYPOAAuWovwsTSzSitvo4nb+6VMR/FLKiO2dr516+Wcx/24xnCwgDL
	AImAoDkQWEzZg5Yh8y3m4ZR154z1ylacQJ8/Ur4rSLngZWWNEgtUPyYCbGJ2xuORudHNqTghHnvOH
	StxxKLr+TZZ5Rr1RN7pWUkF5hY4CDqJNAOZrwOBBSb360Wbsy92aSRbmkwCEWJCJ6yxqyUNRM1RYV
	ThxMM6Xbk/yL9mj+KnhIOUqDCuGqbKTOOhSZJGUIN+c2ikNp7D5nBPtyJgQTYNonfI4x/YjR1RvoX
	02IIDSlA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvUW-00000002vhz-1Aps
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 15:13:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E3CDF1BF7;
	Fri, 14 Nov 2025 08:08:54 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 640933F5A1;
	Fri, 14 Nov 2025 08:09:00 -0800 (PST)
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: james.clark@linaro.org,
	mark.rutland@arm.com,
	james.morse@arm.com
Subject: [RFC PATCH v6 35/35] KVM: arm64: Allow the creation of a SPE enabled VM
Date: Fri, 14 Nov 2025 16:07:16 +0000
Message-ID: <20251114160717.163230-36-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114160717.163230-1-alexandru.elisei@arm.com>
References: <20251114160717.163230-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_151336_679435_3C25EFCF 
X-CRM114-Status: UNSURE (   9.57  )
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

Everything is in place, allow userspace to enable SPE for a virtual
machine.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arch/arm64/include/asm/kvm_host.h | 2 +-
 arch/arm64/kvm/Kconfig            | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index b730401717b5..1c987274556e 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -40,7 +40,7 @@
 
 #define KVM_MAX_VCPUS VGIC_V3_MAX_CPUS
 
-#define KVM_VCPU_MAX_FEATURES 9
+#define KVM_VCPU_MAX_FEATURES 10
 #define KVM_VCPU_VALID_FEATURES	(BIT(KVM_VCPU_MAX_FEATURES) - 1)
 
 #define KVM_REQ_SLEEP \
diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index 31388b5b2655..f746df3c2c28 100644
--- a/arch/arm64/kvm/Kconfig
+++ b/arch/arm64/kvm/Kconfig
@@ -84,9 +84,9 @@ config PTDUMP_STAGE2_DEBUGFS
 	  If in doubt, say N.
 
 config KVM_ARM_SPE
-	bool
+	bool "Support SPE in guest"
 	depends on KVM && ARM_SPE_PMU=y
-	default n
+	default y
 	help
 	  Adds support for Statistical Profiling Extension (SPE) in virtual
 	  machines.
-- 
2.51.2


