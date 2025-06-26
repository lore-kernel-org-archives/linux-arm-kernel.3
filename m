Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB6B5C7EE33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 22:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/x7IKRsWOtConph2bUpKtMTviRfv4NZ5l+qpFLQ4pko=; b=AEgUz0EaHEkf7iytHcVfu9//en
	g/1Y2vfKidjHubagP3lM3Y6M8lGJgmyBwD4JdVuri+NpbrNWYQErkcurdVrHlIjHxAWLorWloil8T
	tDreKdEC08+O8v1Z5ikAukM7oJVHrO9U/vIY2sIXz9ZZZ0PhZlemnBY94oLAocR8z49RhfjB2AV/q
	f3OhHF1n/Wp2RszFSBJ32b3qAQ5Coro7CHQcchZZ9zNAP75XyM9Mc/KfVrfqsQlRcDA++ylm+jSW3
	va1ubVODdXyRQ+09/20C7/98+Dl7Q9GdQrl26mClZLdeqieQjk3ZailXE+6Yh9w9IM+5LISUbAntz
	KgjfB/5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUueM-0000000CtYr-0q4M;
	Thu, 26 Jun 2025 22:00:54 +0000
Received: from mail-oo1-xc49.google.com ([2607:f8b0:4864:20::c49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUsrC-0000000CgjU-1oMd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 20:06:04 +0000
Received: by mail-oo1-xc49.google.com with SMTP id 006d021491bc7-6114de00ef5so359321eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 13:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750968361; x=1751573161; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/x7IKRsWOtConph2bUpKtMTviRfv4NZ5l+qpFLQ4pko=;
        b=OKQ4UN/F/7DhbT03OPV4CapWUM5Wn4V5flQ5nENe2mUKfhXZxK23o9o4Z6nKx44YJg
         Ve+jqVz3M7GufhoGalu+SjrZ1+lq8syTGXl2LWj4kNV3peKb5QylmdE1CpdlyJlMESmT
         UYj8IVmvdGAb2PDzyXyPqoyoTheyiWkQnXNWUWwb5yJ+Ykym4HkVN9fVApqgNjfRmA4H
         26ObiPzPCYAmuy7RRf8z5zXs1HIwUMPVnac7RfCueJGLdrSyFnKnmiel0tzvsr7FGNJB
         rWmtGpp+52Ai5xmJHfkyqcItdTyWfWR8gryIY/5cgWVRWLwXRVsaxLTqwsMf2jfywSdm
         urMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750968361; x=1751573161;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/x7IKRsWOtConph2bUpKtMTviRfv4NZ5l+qpFLQ4pko=;
        b=cWbL1mO3eTX8gHKMUzPhC4Lqsvi8Ags7AOEGNCom8r6+cwXQC7Io9aeXPBhSbeiDni
         Ymw8oEWyYY5FbQHH4TP4ouat3iMezSzZ2vlXqQiUeXT966oJfzWFq+hbc6kbW2TD9Olm
         zd2vNMD6HC+fYTU09yLJeFWvafA2HbNCPVVrOua7JC/h3ApE2XYBIAgUkC7ceY6dVwcK
         jwCXe/h9u6ezbBrQ0T34xAMk9OsK5LRWQEypPPa00Apu54vrFzBoS87KvwASwq9RvsXb
         ZLTYW5TesTOzNW/xq6FmbBtfl5hMnK6l9VimRKY5lAHxCmZ5BNK/f2CW/F5pDUKTFfUl
         Ag+w==
X-Forwarded-Encrypted: i=1; AJvYcCUR+t58RXdIgMmoMdwh9Oy4b7DDk4qHaQ5fGgbPWMcTHUzoyzXUFst66/Rn4dCC1YfCtbDMZL8tuc1F/4NJwsDe@lists.infradead.org
X-Gm-Message-State: AOJu0YyDUoFaRmG1UcFBwmk+NgTx8LeGEOfguv919jYE1ZDcNGJroFTq
	bvN8cbzA/VDrazNfUNUdstbktcfkoq9YYM0fAM+Do3Yc/keR1P/5xojZaJOSK40RPNO8JcF+eQk
	Xb6xx8tJC13tyZ8fl47KZeGopQA==
X-Google-Smtp-Source: AGHT+IE+CkaZ5iXFv3dTlFyH7UdGDZHsbvzoJSe9buN7PuL7mIyZPRSBWsO96oSxssKGqZuLRqFlyodkFZoXyb0msA==
X-Received: from otber8.prod.google.com ([2002:a05:6830:3c08:b0:72b:8c86:a47f])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6830:720b:b0:72b:9bb3:67cf with SMTP id 46e09a7af769-73afc5c355dmr285473a34.9.1750968360578;
 Thu, 26 Jun 2025 13:06:00 -0700 (PDT)
Date: Thu, 26 Jun 2025 20:04:45 +0000
In-Reply-To: <20250626200459.1153955-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250626200459.1153955-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250626200459.1153955-10-coltonlewis@google.com>
Subject: [PATCH v3 09/22] KVM: arm64: Correct kvm_arm_pmu_get_max_counters()
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Mingwei Zhang <mizhang@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Mark Rutland <mark.rutland@arm.com>, Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_130602_473453_F799FE86 
X-CRM114-Status: GOOD (  12.88  )
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
2.50.0.727.gbf7dc18ff4-goog


