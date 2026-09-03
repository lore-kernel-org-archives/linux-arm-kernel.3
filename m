Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5586CC624D4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 16:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=21Jud5DHHmxLTrULHsEkVpy+ja0cGfYwieQZrEq5hoI=; b=YZpZ+qlL7eg80QbC2dwg7oGVBY
	R8jhOg+8CaJlPQzmqR/M8qFrHMFSH2xba99V7z45tyBg0HbqGeR+bwIr7BcjR+tQUvfprBf1adcAh
	R4Ig9bKT7ThFS8mo15n6cMjI1W3kmhSmLw8uXjGKOUAmaRAigK5ZYwxoKNACTdYcYk3i/SsJB4EZC
	5ZKdCj+yZzr/h7gYIu0PWQlmkWE8a4T/geVYDiq7ORpiS8PHb8KSFXPBmgtADJbh/wn9+rbHD1tdK
	X4WQeaqJQ1MhSvi7qYxJsDcRDQZz2V9RmPrkzlxWTO0FzwLpNjoQKBvv4R9HglLcdAGanvxhyXeaz
	dhCGJU1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29xr-000000005HL-0NBb;
	Thu, 03 Sep 2026 16:06:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29xm-000000005Be-3IJ6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 16:06:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5ED751596;
	Thu,  3 Sep 2026 09:06:50 -0700 (PDT)
Received: from e140010.cambridge.arm.com (e140010.arm.com [10.2.213.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 535C63F673;
	Thu,  3 Sep 2026 09:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788451614; bh=IYyXPaD2XdK0iGsJ5jrFv2i/pbUyFXfVwjRaAB3XpoA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Grivi6jszekcIPalic01O2eraKmuo0GM5jNL3EGrS4orjaFKvo/NpHGcVVCkCSNil
	 YLviMhVFXECzDKHQkbu4NJJmIFbu8YmqraWj4UlPvJiEygjf1Sa+VqgtcFzhnAaRCe
	 yf+tBt5deD4uwh0kyIUW0CgUkzb1Giup1gIlju5c=
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
Subject: [RFC PATCH v7 09/28] HACK! KVM: arm64: Enable SPE virtualization only in VHE mode
Date: Thu,  3 Sep 2026 17:06:04 +0100
Message-ID: <20260903160623.315525-10-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903160623.315525-1-alexandru.elisei@arm.com>
References: <20260903160623.315525-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_090654_881874_07723697 
X-CRM114-Status: GOOD (  10.49  )
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
 arch/arm64/kvm/spe.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/spe.c b/arch/arm64/kvm/spe.c
index 97160d1fae81..00908aa2576b 100644
--- a/arch/arm64/kvm/spe.c
+++ b/arch/arm64/kvm/spe.c
@@ -22,8 +22,8 @@ void kvm_spe_add_instance(struct arm_spe_pmu *spe_pmu)
 {
 	struct spe_pmu_entry *entry;
 
-	/* TODO: pKVM support */
-	if (is_protected_kvm_enabled())
+	/* TODO: pKVM and nVHE support */
+	if (is_protected_kvm_enabled() || !has_vhe())
 		return;
 
 	guard(mutex)(&spe_pmus_lock);
-- 
2.43.0


