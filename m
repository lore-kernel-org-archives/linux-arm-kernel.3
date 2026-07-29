Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EDF2C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 10:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K02Zc2FPpwU1iNxboRFAfwSxbZJokRwSrilQtmz2Fa0=; b=nJnuQTnJJT/T2arOEDtnJZFc3t
	K0r+UD8hj6y3xghdvgDelkZpOQYmGbKCyjH2eloppLRWJSYzQuX3osNANP9YR6thwPJ5NeMv43s90
	52tIltopiG9F/Xh3sbJjWhPHJphqUUpkiv5oILna0/PgOo0+bdq02e5l3XrXEom6HPXYGd2xTIKEn
	1YdggmR2lX35mjpwXbkP5subNAU/RXs1v9Anh6YT7qoZqddrsNGG2Q82oM/gHHFfZJJl0gTvJLX2v
	w7NWW7F6UsTvf3RZlMLSzsTs7xicxGaicA25+btpfUzALsR0QUtB6kjdMBWjyHbLe5igSs1Lq4YOb
	LykO+1xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp1ok-00000007amG-1hOA;
	Wed, 29 Jul 2026 10:47:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp1ob-00000007afZ-194V
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 10:47:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B5251688;
	Wed, 29 Jul 2026 03:47:04 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BA4873F66F;
	Wed, 29 Jul 2026 03:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785322028; bh=wA/Gf0BWpFp54XV49Ev6GaOvlsiX9alXZSU5n1DJWp0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PYl86dk18O21VeaNfvwB9P48elqISXA6MMUK7aFacADEjoTGzb9Cc9RHnzMTkMuNw
	 qYsDdnFh/XknOC8Z3qGqn2gL9FWX25/KsIglfKDlM0LwWy3pQjMKkZ+Mnr+q0UJY0x
	 EjhSMDmDJzCBdAq3wZIEoaroRJbGcXYw9ErU506E=
From: Leonardo Bras <leo.bras@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	James Morse <james.morse@arm.com>,
	Leonardo Bras <leo.bras@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	mrigendrachaubey <mrigendra.chaubey@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Zeng Heng <zengheng4@huawei.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	James Clark <james.clark@linaro.org>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Tian Zheng <zhengtian10@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org
Subject: [PATCH v3 11/11] KVM: arm64: Enable KVM_HW_DIRTY_BIT
Date: Wed, 29 Jul 2026 11:45:46 +0100
Message-ID: <20260729104548.3439958-12-leo.bras@arm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729104548.3439958-1-leo.bras@arm.com>
References: <20260729104548.3439958-1-leo.bras@arm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1129; i=leo.bras@arm.com; h=from:subject; bh=wA/Gf0BWpFp54XV49Ev6GaOvlsiX9alXZSU5n1DJWp0=; b=owGbwMvMwCX2pizjszvTwvWMp9WSGLIyb14/4ia3/+0W29hPflf/yqSeaDNcoKejJDdBuyXt2 5WlB8/+7yhlYRDjYpAVU2SRfTR/Fc/3KRlHrvxYADOHlQlkCAMXpwBMxKaVkeH3pp3XZs5c+6Kd 4f9921rDP/KmesLXt2vkzdxY9LD0kr4xI8OXpQ+ZAj3mnlDfJxRhaNR3LvSp0sGGoK+7KhNnT0v f2sYOAA==
X-Developer-Key: i=leo.bras@arm.com; a=openpgp; fpr=36E6C95AE0F111CC5B6F4D2E688C33F8A0C5B0C5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_034709_355340_EE564249 
X-CRM114-Status: UNSURE (   9.13  )
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

Set the corresponding bit to enable hardware accelerated dirty-bitmap and
dirty-ring cleaning for arm64. Actually using acceleration depends on the
cpus enabling FEAT_HACDBS as well as the pre-requisite features for it,
such as FEAT_HDBSS and FEAT_HAFDBS.

Signed-off-by: Leonardo Bras <leo.bras@arm.com>
---
 arch/arm64/kvm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index 449154f9a485..3264d8ca093e 100644
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
+	select HAVE_KVM_HW_DIRTY_BIT
 	select SCHED_INFO
 	select GUEST_PERF_EVENTS if PERF_EVENTS
 	select KVM_GUEST_MEMFD
 	help
 	  Support hosting virtualized guest machines.
 
 	  If unsure, say N.
 
 if KVM
 
-- 
2.55.0


