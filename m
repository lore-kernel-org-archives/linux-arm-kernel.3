Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D65CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 11:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D2LtQD8pZs6oI2DhWYcXuaGFcRtBeIKav/R8T2ZWcB0=; b=Clhjbc/G7fZKftsyjZh8R2Uppp
	jlqxk31OmQKVg8l7m0z2MEKezeEWr9hBnFDzzbYjbd5d3P5s+YNqyDYfdzRmW3gb7/gK8jJiY28Ea
	1kE0MD3imUnDUimrxgiuxuiXLoX2o/yAaPoZjup+lnEElR5Y/xAbRfi4YNS9+cT2eku6ErPQMhKub
	vmm+vDTjbM60Ej0aoP/0T6rSOE8NLDR/n9HNL9XuNoskY/eicT868UMSxaY5RSY7oE30ytR1Gu0br
	77Si9YFKnZquz95uuOnvBSSOavG7p+qhO3GMn/h4A2H1htxcvhENc9tZf4Xm745ZL0C7KakJVGzoY
	961ZlwlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIPNf-00000005LoH-2q8A;
	Thu, 30 Apr 2026 11:16:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIPNV-00000005LeZ-1Coi
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 30 Apr 2026 11:16:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=D2LtQD8pZs6oI2DhWYcXuaGFcRtBeIKav/R8T2ZWcB0=; b=glorQYIcHl9UvkfYgJ0VMwq5ga
	wXsu1waJYIO92g4OGxN+7a+b34yYgyWICGuf6Uf2j0GkC5pig0krQKcZWEyDH9r/Zm1uXySVMLLCx
	Ks9HPdeUI1BhiZnwhbZa7nk1Yf3x7T5rFA4fCRm3fHIBfFNu/lCZ+Gy+GIFCmAwTR5SrWSB3SAz8l
	7jKMVzRvBFiWPTQjSSXcOQP2TmMOSJ7vKE5eI7pEpyQmIDffeQzBskdO6w2G6E3FbrTnTB9rHxrvK
	4B6MxnkR/7ESmwbj84C2H6p6PDVXCwh2Tsv7AOFf/JbQpQIu6qIKs8A4ZVbZy0vWyD7T5wPLVrh8N
	e/TFyVTw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIPNQ-00000007DsV-3YXZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 11:16:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0DC61356C;
	Thu, 30 Apr 2026 04:16:10 -0700 (PDT)
Received: from devkitleo.cambridge.arm.com (devkitleo.cambridge.arm.com [10.1.196.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 18E533F763;
	Thu, 30 Apr 2026 04:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777547775; bh=/RURBevpFF+4tw+ka7Tw3QDbKLsEWw0aWfJtqGVfHwQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Dg83rIEnCnvnNNd90W6UyyYmALfyt5w3xkYcgsMDx7kJQnSLWr+aI1bKWqOcI7gUb
	 f3YA79bgia7x7C+As0zyTHsMVTPe98UnOnrZcgz57AqdzZNuP3ALca1cAQCPqPWKxP
	 gHZ6XNUy68+rW5XuA+jTKVIrUYB6Ky9olnogHKH4=
From: Leonardo Bras <leo.bras@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Leonardo Bras <leo.bras@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Saket Dumbre <saket.dumbre@intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Chengwen Feng <fengchengwen@huawei.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Miko=C5=82aj=20Lenczewski?= <miko.lenczewski@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Thomas Huth <thuth@redhat.com>,
	mrigendrachaubey <mrigendra.chaubey@gmail.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	James Clark <james.clark@linaro.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Vincent Donnefort <vdonnefort@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Tian Zheng <zhengtian10@huawei.com>,
	Wei-Lin Chang <weilin.chang@arm.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev,
	kvm@vger.kernel.org
Subject: [PATCH v1 12/12] KVM: arm64: Enable KVM_HW_DIRTY_BIT
Date: Thu, 30 Apr 2026 12:14:16 +0100
Message-ID: <20260430111424.3479613-14-leo.bras@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260430111424.3479613-2-leo.bras@arm.com>
References: <20260430111424.3479613-2-leo.bras@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_121617_666348_AED5A2E9 
X-CRM114-Status: GOOD (  10.79  )
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

Set the corresponding bit to enable hardware accelerated dirty-bitmap and
dirty-ring cleaning for arm64. Actually using acceleration depends on the
cpus enabling FEAT_HACDBS as well as the pre-requisite features for it,
such as FEAT_HDBSS and FEAT_HAFDBS.

Also, add myself as maintainer for the new bits introduced.

Signed-off-by: Leonardo Bras <leo.bras@arm.com>
---
 MAINTAINERS            | 7 +++++++
 arch/arm64/kvm/Kconfig | 1 +
 2 files changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d25342ca8aa1..4b8a2b05b916 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2069,20 +2069,27 @@ F:	arch/arm64/boot/dts/Makefile
 ARM ARCHITECTED TIMER DRIVER
 M:	Mark Rutland <mark.rutland@arm.com>
 M:	Marc Zyngier <maz@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	arch/arm/include/asm/arch_timer.h
 F:	arch/arm64/include/asm/arch_timer.h
 F:	drivers/clocksource/arm_arch_timer.c
 F:	drivers/clocksource/arm_arch_timer_mmio.c
 
+ARM STAGE-2 DIRTY-BIT TRACKER/CLEANER ACCELERATOR
+M:	Leonardo Bras <leo.bras@arm.com>
+L:	kvmarm@lists.linux.dev
+S:	Maintained
+F:	arch/arm64/include/asm/kvm_dirty_bit.h
+F:	arch/arm64/kvm/dirty_bit.c
+
 ARM ETHOS-U NPU DRIVER
 M:	Rob Herring (Arm) <robh@kernel.org>
 M:	Tomeu Vizoso <tomeu@tomeuvizoso.net>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/accel/ethosu/
 F:	include/uapi/drm/ethosu_accel.h
 
 ARM GENERIC INTERRUPT CONTROLLER DRIVERS
diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index 449154f9a485..db8487bf738b 100644
--- a/arch/arm64/kvm/Kconfig
+++ b/arch/arm64/kvm/Kconfig
@@ -27,20 +27,21 @@ menuconfig KVM
 	select VIRT_XFER_TO_GUEST_WORK
 	select KVM_VFIO
 	select HAVE_KVM_DIRTY_RING_ACQ_REL
 	select NEED_KVM_DIRTY_RING_WITH_BITMAP
 	select HAVE_KVM_MSI
 	select HAVE_KVM_IRQCHIP
 	select HAVE_KVM_IRQ_ROUTING
 	select HAVE_KVM_IRQ_BYPASS
 	select HAVE_KVM_READONLY_MEM
 	select HAVE_KVM_VCPU_RUN_PID_CHANGE
+	select HAVE_KVM_HW_DIRTY_BIT if ACPI
 	select SCHED_INFO
 	select GUEST_PERF_EVENTS if PERF_EVENTS
 	select KVM_GUEST_MEMFD
 	help
 	  Support hosting virtualized guest machines.
 
 	  If unsure, say N.
 
 if KVM
 
-- 
2.54.0


