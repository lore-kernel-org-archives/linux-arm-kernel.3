Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFED3CD98FA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 15:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1pwPD1KH2b+Cpkv4lKdVXGbrd4INrg0lf0YXXB80NYE=; b=m2PUM84X5HSoaMAbg+OtW3mwMK
	5t0KH8ugA6KuCQZQWVihtMCIU4FXZxUiyBmyYuAdDT78BkYhvov4K5InQ5aLSHlJHVPYpzMHvqbJu
	jQu6rDlGZY6n6cor5+Okmc542V07kDaS5a6D8St9QGCKlZ2kaqUacMVNW5gjh77Hpq3Pt75HZlKe3
	uWHqQ8ONxHdo8g3oHygyZy4vJ+BpeFv1kNy3X4P5dxOTlbcvBegGwz2Jpjtq1Ie41H7YWYJ4U8C2b
	dcCwNzBo6EXwycRYA6EDv93+dR/CCuig3QoFhWwGDPNO9n3JfmdTAUaf3lvHSky9MCGEt1/dyqLjf
	JYWhSyyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waF17-00000001WEn-30Et;
	Thu, 18 Jun 2026 15:50:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waF0x-00000001W8J-33J6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 15:50:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 58BF848FF;
	Thu, 18 Jun 2026 08:50:42 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9CD273F62B;
	Thu, 18 Jun 2026 08:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781797847; bh=rM/qb4gw46Qqf9cHzz1C3xGmiBkv/MNy4YRJ4Y9Y62g=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=SZBO9HAUs+HPcU3jlkrcip4mKA0xhRLTnJ4I989g59/LF4O5wO2TCsInqFTfsLPki
	 KWndm8tn11x/PszkDwoZxq81NHVoZ93+zgeYSzJAydcSK6KHzkDFbNFiRp2/C4TOJg
	 Ak/gWWEVf5IiWIN8kVyOUMD/+ihMWQ2/ZRBuRabs=
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: will@kernel.org,
	julien.thierry.kdev@gmail.com,
	maz@kernel.org,
	oupton@kernel.org,
	jean-philippe.brucker@arm.com,
	andre.przywara@arm.com,
	suzuki.poulose@arm.com,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Subject: [PATCH kvmtool v2 7/7] arm64: Improve KVM_ARM_VCPU_PMU_V3_CTRL diagnostics
Date: Thu, 18 Jun 2026 16:50:01 +0100
Message-ID: <20260618155001.226266-8-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618155001.226266-1-alexandru.elisei@arm.com>
References: <20260618155001.226266-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_085047_885067_9C91351E 
X-CRM114-Status: GOOD (  10.56  )
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

kvmtool issues several ioctls when configuring the PMU, and each of them
can fail for different reasons. Be more specific about the ioctl that
failed when that happens.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arm64/pmu.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/arm64/pmu.c b/arm64/pmu.c
index 92cacd62479e..78c15f153fad 100644
--- a/arm64/pmu.c
+++ b/arm64/pmu.c
@@ -12,6 +12,24 @@
 
 #include "asm/pmu.h"
 
+static const char *pmu_attr_names[] = {
+	[KVM_ARM_VCPU_PMU_V3_IRQ]	= "KVM_ARM_VCPU_PMU_V3_IRQ",
+	[KVM_ARM_VCPU_PMU_V3_INIT]	= "KVM_ARM_VCPU_PMU_V3_INIT",
+	[KVM_ARM_VCPU_PMU_V3_FILTER]	= "KVM_ARM_VCPU_PMU_V3_FILTER",
+	[KVM_ARM_VCPU_PMU_V3_SET_PMU]	= "KVM_ARM_VCPU_PMU_V3_SET_PMU",
+	[KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS] = "KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTER",
+};
+
+static const char *pmu_get_attr_name(u64 attr)
+{
+	switch (attr) {
+	case KVM_ARM_VCPU_PMU_V3_IRQ ... KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS:
+		return pmu_attr_names[attr];
+	default:
+		return "UNKNOWN";
+	}
+}
+
 static bool pmu_has_attr(struct kvm_cpu *vcpu, u64 attr)
 {
 	struct kvm_device_attr pmu_attr = {
@@ -32,13 +50,12 @@ static void set_pmu_attr(struct kvm_cpu *vcpu, void *addr, u64 attr)
 	};
 	int ret;
 
-	if (pmu_has_attr(vcpu, attr)) {
-		ret = ioctl(vcpu->vcpu_fd, KVM_SET_DEVICE_ATTR, &pmu_attr);
-		if (ret)
-			die_perror("PMU KVM_SET_DEVICE_ATTR");
-	} else {
-		die_perror("PMU KVM_HAS_DEVICE_ATTR");
-	}
+	if (!pmu_has_attr(vcpu, attr))
+		die_perror("KVM_HAS_DEVICE_ATTR(%s)", pmu_get_attr_name(attr));
+
+	ret = ioctl(vcpu->vcpu_fd, KVM_SET_DEVICE_ATTR, &pmu_attr);
+	if (ret)
+		die_perror("KVM_SET_DEVICE_ATTR(%s)", pmu_get_attr_name(attr));
 }
 
 #define SYS_EVENT_SOURCE	"/sys/bus/event_source/devices/"
-- 
2.54.0


