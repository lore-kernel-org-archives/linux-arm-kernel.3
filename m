Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D57DD77885
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 16:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oxANfC6PqtKF0iPF6cJGgZsurzMqdo94Ts7ie4tNTNA=; b=KRXOSg1TYP4bgYMWg7WBpr70pP
	Avmx8Z+U2agtS9S5RqlX41vOFX62pLXTiqhQnWsP9bMgtRmo4F8k/5MWjV6/Kg/lMQReU2rpSiBV1
	0J3N5yNIbIZGd58EOFbTamFsSghkggVBZT8+UDYQToT4jzZg7pBkco0aUi7A6osLCKAduBvHgKfj8
	X6UXrRucoippSQ8f16Y8S1MoMCMeJLW3Ozl1Z8kTFmRBLgws6LIp2VZolhwXEoxB3XjLZp6QaUETa
	X5kOw5Svy3R2Lj5FYqtxDJFJfYJIiktLQd0HqQI4u5/OIFlkyUDcNOBQtnBTwsC0q8Dx4fmcFGOQl
	9neznWHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjKNp-00000009EQa-3cwU;
	Fri, 23 Jan 2026 16:51:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjKNb-00000009EC8-2GCg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 16:51:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 99F4A1515;
	Fri, 23 Jan 2026 08:51:19 -0800 (PST)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B78583F694;
	Fri, 23 Jan 2026 08:51:24 -0800 (PST)
From: Joey Gouly <joey.gouly@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: alexandru.elisei@arm.com,
	andrew.jones@linux.dev,
	eric.auger@redhat.com,
	joey.gouly@arm.com,
	maz@kernel.org,
	kvmarm@lists.linux.dev,
	Oliver Upton <oliver.upton@linux.dev>
Subject: [kvm-unit-tests PATCH v6 14/14] arm64: gitlab-ci: add EL2 tests to CI
Date: Fri, 23 Jan 2026 16:50:53 +0000
Message-Id: <20260123165053.2250754-15-joey.gouly@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260123165053.2250754-1-joey.gouly@arm.com>
References: <20260123165053.2250754-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_085127_693051_D68092B0 
X-CRM114-Status: UNSURE (   6.39  )
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

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
---
 .gitlab-ci.yml | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 7e3d4661..ee3274dd 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -126,6 +126,36 @@ build-aarch64-clang-efi:
       | tee results.txt
  - grep -q PASS results.txt && ! grep -q FAIL results.txt
 
+build-aarch64-el2:
+ extends: .intree_template
+ script:
+ - dnf install -y qemu-system-aarch64 gcc-aarch64-linux-gnu
+ - ./configure --arch=aarch64 --cross-prefix=aarch64-linux-gnu-
+ - make -j2
+ - ACCEL=tcg MAX_SMP=8 EL2=y ./run_tests.sh
+      cache
+      debug-bp
+      debug-sstep
+      debug-wp
+      gicv2-active
+      gicv2-ipi
+      gicv2-mmio
+      gicv3-active
+      gicv3-ipi
+      its-introspection
+      its-trigger
+      pci-test
+      pmu-cycle-counter
+      pmu-event-counter-config
+      pmu-sw-incr
+      selftest-setup
+      selftest-smp
+      selftest-vectors-kernel
+      selftest-vectors-user
+      timer
+      | tee results.txt
+ - grep -q PASS results.txt && ! grep -q FAIL results.txt
+
 build-arm:
  extends: .outoftree_template
  script:
-- 
2.25.1


