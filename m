Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B76CC02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 22:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GaVkSfHrHzVfJjq8AwEUCvEhNWS7AN/5lexlisUUmk8=; b=ghTsuCpSQnrSIcblJ5YfFldW1T
	7o7/GlaUlrJe49sSpuLdAY0nvMm49vbH9Af9i2cWghWzulLpZxCVqWhsne5L6FLBEjKAUaAZVU8Pj
	8LxNnUDUTghSL9Y5MnxGL3cHCIl+ZNk/+CuA4Hy5LSmkDlgve7hFWvtAyjJ7T7IZNslrRQ5yl8nty
	wF7r2IYewrx2ExRA9hC/Qiw7by90x9qkKza97QXbZX3bAdplgQs2uNf21WGIxrkbQ/vwaqy3DMbYM
	+2PnUHAifhyJYwIKgZ9cXTSUHdy7tWO1vbL/D9SGyqTuN3hHQoXQBQowCWYxXApCJaIVrb8LyymJL
	mDopWqZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcXZp-00000003P8H-2mp8;
	Mon, 27 Jan 2025 22:27:29 +0000
Received: from mail-il1-x149.google.com ([2607:f8b0:4864:20::149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcXTS-00000003NdE-4Adn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 22:20:56 +0000
Received: by mail-il1-x149.google.com with SMTP id e9e14a558f8ab-3cf6ceaccdbso37306875ab.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jan 2025 14:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738016453; x=1738621253; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GaVkSfHrHzVfJjq8AwEUCvEhNWS7AN/5lexlisUUmk8=;
        b=kCYh3YmArJN023kSlOuIiSu0ANLPVpdO7W+NhWISKYNQvhCGTNFY8tngLXPKkQXpnI
         BdwAx/BwwR4sS0nuck2FWs6mVKtUxg5yfIwWb8YrKji1ShQmJOsv5rOQaOa7tjRAQPD4
         NxIZBUISZhOqOD8+uvKvYgVIOvfhTWkKfW1lhf3kmdj8iWYHRukioEhBvs2nnyDHg5nC
         gjKLqjRxp71WGUI7ZF0f0+6/aXyMujAtmEtIVti/1TgCbwU7XigV0zHfgdjREd2R+byW
         SmeSvTN/9JzFogccFF8r3RSgvcv2Z9xfVkhsqN4ViUhbHayTNp/Xy8fmHop7tjJRodra
         zsTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738016453; x=1738621253;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GaVkSfHrHzVfJjq8AwEUCvEhNWS7AN/5lexlisUUmk8=;
        b=he4YVAHHVtWmNydyiCmbXOlaB0dFktpNGeBpIzXOX1hUwCjJ8N8hoBGE4AGcJcxJaf
         d8NjNB1j7YjLmYe1bU8vsaPmml/QtBOWXZh69MmdFBG5rHupX+1TDx+CZWKLp71XN/D2
         pLddU1JMAEFhpWW+Opu4XrXsYtHDLNNAEyZIPLbwRCUVU88ovPpNvGf6HNf0mBYddnCn
         5w9qtOg6MK+5kYDL7de/93hxnMe+Ji00FPN//HTFRsNGVM+N+/sUvB9btCFz5QfAXPR3
         bxT9H2+41EYPQLFuV9XXiM7+Z8nLZ7jNth4vThndbfln2Iq6Q9P3ciSSMNgS0YakVSWH
         /Dzg==
X-Forwarded-Encrypted: i=1; AJvYcCWvLeo5aDUBKKEkOuIsZJyHaBPvarqsGSsYbL6SaP8By6Bg8u+K2+1J+TgGZEN0BwGXAEKYy7XjJH6ZLVhrR9uf@lists.infradead.org
X-Gm-Message-State: AOJu0YyiyOI3mSUX6pe/9Sa7wXvGmEbdXf5Gcee/PieRVxSLkC3Lywe8
	J18VtRpky5vOauauWEBCKkrVuY/ztccs+UjXy3papNBBfAcucN0+F7eMj2V5yPTWvMyeG/qEolh
	wPv6CBqN5KgOrWdwEHaUTgg==
X-Google-Smtp-Source: AGHT+IFYMP4DnSoUUl5kkRFoQsqHI/1D0lC2aOLiNQgEnibJSp/Pb6c49edDE2uZE1uw/6tcaw+6CTgspGEMpXa6dw==
X-Received: from ilbbu12.prod.google.com ([2002:a05:6e02:350c:b0:3ce:8579:c1eb])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:1f85:b0:3cf:b08e:7e91 with SMTP id e9e14a558f8ab-3cfb08e7f5bmr197753565ab.13.1738016453125;
 Mon, 27 Jan 2025 14:20:53 -0800 (PST)
Date: Mon, 27 Jan 2025 22:20:28 +0000
In-Reply-To: <20250127222031.3078945-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250127222031.3078945-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <20250127222031.3078945-3-coltonlewis@google.com>
Subject: [RFC PATCH 2/4] KVM: arm64: Make guests see only counters they can access
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_142055_041014_9250857E 
X-CRM114-Status: GOOD (  14.70  )
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

The ARM architecture specifies that when MDCR_EL2.HPMN is set, EL1 and
EL0, which includes KVM guests, should read that value for PMCR.N.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/pmu-emul.c                                 | 8 +++++++-
 tools/testing/selftests/kvm/aarch64/vpmu_counter_access.c | 2 +-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index 6c5950b9ceac..052ce8c721fe 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -993,12 +993,18 @@ static bool pmu_irq_is_valid(struct kvm *kvm, int irq)
 u8 kvm_arm_pmu_get_max_counters(struct kvm *kvm)
 {
 	struct arm_pmu *arm_pmu = kvm->arch.arm_pmu;
+	u8 limit;
+
+	if (arm_pmu->partitioned)
+		limit = arm_pmu->hpmn - 1;
+	else
+		limit = ARMV8_PMU_MAX_GENERAL_COUNTERS;
 
 	/*
 	 * The arm_pmu->cntr_mask considers the fixed counter(s) as well.
 	 * Ignore those and return only the general-purpose counters.
 	 */
-	return bitmap_weight(arm_pmu->cntr_mask, ARMV8_PMU_MAX_GENERAL_COUNTERS);
+	return bitmap_weight(arm_pmu->cntr_mask, limit);
 }
 
 static void kvm_arm_set_pmu(struct kvm *kvm, struct arm_pmu *arm_pmu)
diff --git a/tools/testing/selftests/kvm/aarch64/vpmu_counter_access.c b/tools/testing/selftests/kvm/aarch64/vpmu_counter_access.c
index f9c0c86d7e85..4d5acdb66bc2 100644
--- a/tools/testing/selftests/kvm/aarch64/vpmu_counter_access.c
+++ b/tools/testing/selftests/kvm/aarch64/vpmu_counter_access.c
@@ -610,7 +610,7 @@ static void run_pmregs_validity_test(uint64_t pmcr_n)
  */
 static void run_error_test(uint64_t pmcr_n)
 {
-	pr_debug("Error test with pmcr_n %lu (larger than the host)\n", pmcr_n);
+	pr_debug("Error test with pmcr_n %lu (larger than the host allows)\n", pmcr_n);
 
 	test_create_vpmu_vm_with_pmcr_n(pmcr_n, true);
 	destroy_vpmu_vm();
-- 
2.48.1.262.g85cc9f2d1e-goog


