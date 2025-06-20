Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF1EBC7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 22:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qBxhIed3fkpmOQu/SLH3ienlsanfX2Wz3izzC9sfark=; b=WytMEt/I/FeilsDYEqRMdtvPSR
	zXxx2SAQiVagGuAR01n1mG2C8wJrTSeWvsKhHUVQXvEW5FiSWUct6pqQ6JFRZag99y9o+sYJ0VE2w
	N4cWiyLSJ7c90N8duuOXcfXYPN/tOkPYR4Iz17Eu1HizH/4FQVwXzxpaYqPrfZe0YnBdXC2EbCBtm
	5Foj/tlRG5Pa2ulKqj0p7M768oO/rRll/DM9HOFm6GdNf8dZm8Qr8A+itZVy0EBk1bci1/WK7oinK
	FIHvFOzBsiYrgyyyBd06FfnDKV43wv8BBOyUosITR/qmD/sdKfZz1pzNvj6roA+CIMj4FoQQu4aAX
	Q5553uPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSkUp-0000000Gl2U-1xLm;
	Fri, 20 Jun 2025 22:46:07 +0000
Received: from mail-il1-x14a.google.com ([2607:f8b0:4864:20::14a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSk4O-0000000Gh4j-3AKT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 22:18:50 +0000
Received: by mail-il1-x14a.google.com with SMTP id e9e14a558f8ab-3ddafe52d04so70001635ab.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 15:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750457927; x=1751062727; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qBxhIed3fkpmOQu/SLH3ienlsanfX2Wz3izzC9sfark=;
        b=XR82sKxAYlyYoTwyYOIAoBmiFRXh3X7WpvUWzGBkc+nMUyLCUFAiLdNzTwucaOhnzh
         O2kT1qgT4kLMZxGo8ea2ow7SPd1Fe9K055eXY0lR+533GQcGe1SfBlhGW5s5zyMZObK/
         h0JmKV1hP9vrlys4N08utjut13RpHPoidRnPfczPDFx32F6mnEprJTLSp8fTZbHroqwG
         2c7G21OSxucgJSZFSiH5yWL8RB4kYjEhP0GI49IGg2v1dlc+jWR9MtDabQFWCv5wK0bE
         3ED1mLGqu1nf0rkTYl2zmym5NtVo6E9rgxBQKFsAQZm4SgjKnyyRv3lDgfc2gVXOrDCx
         GmXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750457927; x=1751062727;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qBxhIed3fkpmOQu/SLH3ienlsanfX2Wz3izzC9sfark=;
        b=CgjjXh56y0tDIJdmYjgMNHheXh2FnTGT2wVN5jPof0VTFgLbd+OZ2A55RQ+oHnfclP
         TgoWJNnl5kHYZdiZ82F9sot3/Lyzd0Vbg2odbF11yrmBfIvCXPJ16qbbot5A7Aw2VjZE
         bq+bWOcpT5WwGFT+YUgxWmFsaog4A8VfpOqby2MQ0m2KRpg9ECwlgS/LwB01e9s10Ryo
         opWsFrLqO3sML5eKr7G4askOv+V3oFggHk1vppPcsTvbTob7Sn/s5dQFfPHc0nQz8DAz
         ysR7aBvrXnsFbQHdhSfsX/ktu2zpOevbOGZsQKZKw6aXCQWSg67muvOzGhj4sd60hdVm
         Owug==
X-Forwarded-Encrypted: i=1; AJvYcCWNla+rzsUmZDHpKqcpOg7BDl8ufwg/Q83Bx0JYaqeo32rkRuTBONMnoY/UjVqygaD2ErVok825pWYECfREF8WK@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2SAxcXaup67z1gD0eG3+pUb8JBMuiA1HEkfaYzrX6f067Xj5b
	dLgddBBc08G3LUZGVECS57Nlu6rbOifob/oVJepEIAYDAQvVqzSIG9Er7RFShZn9Ky6uhn1BWXe
	GY/iVWYewrxlJAIUZ0QshLsOZBA==
X-Google-Smtp-Source: AGHT+IFTbBL04tu/5o1zgL0CZq/zWbduiqa+Y5YKeofcr7jFQYs86cUlPmuIGNSiiyk8Ax4cMVHcBUNCIBRZtQH70g==
X-Received: from ilbcp10.prod.google.com ([2002:a05:6e02:398a:b0:3dc:756a:e520])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:2488:b0:3dd:c40d:787e with SMTP id e9e14a558f8ab-3de38c1b8f3mr60278825ab.2.1750457927652;
 Fri, 20 Jun 2025 15:18:47 -0700 (PDT)
Date: Fri, 20 Jun 2025 22:13:11 +0000
In-Reply-To: <20250620221326.1261128-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250620221326.1261128-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.714.g196bf9f422-goog
Message-ID: <20250620221326.1261128-12-coltonlewis@google.com>
Subject: [PATCH v2 10/23] KVM: arm64: Correct kvm_arm_pmu_get_max_counters()
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_151848_792787_D18D01CB 
X-CRM114-Status: GOOD (  12.49  )
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

Since cntr_mask is modified when the PMU is partitioned to remove some
bits, make sure the missing counters are added back to get the right
total.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/pmu.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/pmu.c b/arch/arm64/kvm/pmu.c
index 79b7ea037153..67216451b8ce 100644
--- a/arch/arm64/kvm/pmu.c
+++ b/arch/arm64/kvm/pmu.c
@@ -533,6 +533,8 @@ static bool pmu_irq_is_valid(struct kvm *kvm, int irq)
 u8 kvm_arm_pmu_get_max_counters(struct kvm *kvm)
 {
 	struct arm_pmu *arm_pmu = kvm->arch.arm_pmu;
+	u8 counters;
+
 
 	/*
 	 * PMUv3 requires that all event counters are capable of counting any
@@ -545,7 +547,12 @@ u8 kvm_arm_pmu_get_max_counters(struct kvm *kvm)
 	 * The arm_pmu->cntr_mask considers the fixed counter(s) as well.
 	 * Ignore those and return only the general-purpose counters.
 	 */
-	return bitmap_weight(arm_pmu->cntr_mask, ARMV8_PMU_MAX_GENERAL_COUNTERS);
+	counters = bitmap_weight(arm_pmu->cntr_mask, ARMV8_PMU_MAX_GENERAL_COUNTERS);
+
+	if (kvm_pmu_is_partitioned(arm_pmu))
+		counters += arm_pmu->hpmn_max;
+
+	return counters;
 }
 
 static void kvm_arm_set_nr_counters(struct kvm *kvm, unsigned int nr)
-- 
2.50.0.714.g196bf9f422-goog


