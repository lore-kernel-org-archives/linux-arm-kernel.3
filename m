Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5894AD609C8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 10:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AQO33bk7JaoB2YQnA4dTR0HBdRzks1jGUji/o+mr5GU=; b=OnnnWG+VMRVO6OLGDmOMqaB2R4
	R0D58Kau6ZyblJ9riVesclFrcUVvpw+g02AbK8JltegIValoo6arual6G/J1OuujgvDUeLFNmlgWk
	YBnOy58VfmsJxwDObJGhp0R/wZRO4+wuo1kOVTUx7mOJKT1uFyBeLqw9qkmFAmzBXvK2X5XgR/MMX
	XcqaVC1NrsAd8hMUMwt1eFAzSHAuAFQkWBpohFTcBzIHbdBwh3sfdybzqbcbBby3qoMF3MDaPOcNe
	F7jeeASzARpBkNMO6UZvhkwOUD9XGS8gdZ0f/3Z+KJDuozBb12NKLyhCqx9fGLO02L7lmoEy4zczs
	QQSdc1zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGEzF-0000000CnBk-3BLe;
	Wed, 27 Nov 2024 10:09:33 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGEsU-0000000Clpl-1zZS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 10:02:35 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-aa560a65fd6so108354366b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 02:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732701752; x=1733306552; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AQO33bk7JaoB2YQnA4dTR0HBdRzks1jGUji/o+mr5GU=;
        b=uyjSz4dUS3XQBhwCvBi5tYPHPnkWVIskHJTaW9kibbcxwoiFQn4nvOFKkOWy8WqfsR
         tvYCrP3QWs/wJ1UtEmDP8wRdAo+T4nzDHmNao5Pd6Y9zxDPe+9vouQFxUIcA2zqBcA0C
         Dy9kIGPjyE6GQGBraE5FVcvz+wdzx728JLOvSiOnSJZHcwMiNVULFSdK/TrbvzJ7YWnM
         +aIbRxAZf3v5MvuKAh4j26MqHmF4XWGRSJHl6nkylk3dQwBIPPBjKRJjwEzi/vF09wxo
         MxRAwXJCZ+0wj1MLFZy/1PRFj5RdsaWbw5c3bZ1OUnjECERgHl33QRS6rvd1tzh7QAmC
         p6Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732701752; x=1733306552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AQO33bk7JaoB2YQnA4dTR0HBdRzks1jGUji/o+mr5GU=;
        b=KTB4VkX1Z89/yQvupJil+c7wHRxXGWsIhKlOhAUxRfzckFTOzFhw1kv8C6IbGZJx2Q
         WBAay9T3P464z+FLQvYQjKFTjiyj/Y+RluSl5o7FeFj8AIt3vsco+b/4HhMN5zhNiTxs
         aiffCRTExpFxequdFZUv9khgV7khtAe5+lTOQ86I7YanvPbv3JeXtA/WTxJ4PrrGMvtN
         sY0xT7h7xpi3v+6gT7IPfO4Jj1NxWvokhlAyL0ANMVluTcI2llKa0xcbBohws+A56OKD
         iyxN9iHB+OiIX7krGvrIQZ2ZbghJXlDobke5nMFO/x2b5VuUbVYQ6K6bbl1ewvYF0yrX
         NfHg==
X-Forwarded-Encrypted: i=1; AJvYcCWlCW4VEoHLTdAyp3jZdhcMLN2AH9tnz6b93pmeFBcHhQ6as5O3rpuUomafi22+5kL29sI2NAPY2PZSii6nyOs0@lists.infradead.org
X-Gm-Message-State: AOJu0YwhN2m7s0IjsJZr6tLI1kEvzgVc49Q4Ubmdut8KiffRilwfU+nT
	uF/sZUEiEI2tKfwwnHWb587xy/egxpJcjtOiK6PqeqKnC47Xke7ogEqQpHKfAaI=
X-Gm-Gg: ASbGncs3Jc4zdmCFNdnnJci0h7lmpcM2E+GK0KQSxHthtmS0z64a1SNqZvda3VpFvMc
	T9Z48zqgzMvMpGaany+Kd7QsCxkQgRF1M4y4eCsFmeB7Tcyua5B6BAsaIGiB7rLwJi5cqlDbcsJ
	Fii9b8ml6iEn9gSa08reFkTwCNXY3DfJ/d7HdEcZl2sGF/j7JwWZihc9EspmqBu/b0gmagc+SYG
	x/kogVwIYfDQpiAg+SbUB7BbnbMRFcadvwGfRpiT6gyIFWr9Q==
X-Google-Smtp-Source: AGHT+IFOprwWyU0EZiK3CjnWXpdoY6pqFDChObj/uIZutCL8jO6QK+gWZSMBFJTM121i68Qn0kESKQ==
X-Received: by 2002:a17:907:775a:b0:aa5:2a63:e93 with SMTP id a640c23a62f3a-aa57fac4512mr248698066b.12.1732701752519;
        Wed, 27 Nov 2024 02:02:32 -0800 (PST)
Received: from pop-os.. ([145.224.90.200])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa547ffb152sm421887466b.62.2024.11.27.02.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 02:02:32 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: maz@kernel.org,
	kvmarm@lists.linux.dev,
	oliver.upton@linux.dev,
	suzuki.poulose@arm.com,
	coresight@lists.linaro.org
Cc: James Clark <james.clark@linaro.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	James Morse <james.morse@arm.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Shiqi Liu <shiqiliu@hust.edu.cn>,
	Fuad Tabba <tabba@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 7/8] KVM: arm64: Support trace filtering for guests
Date: Wed, 27 Nov 2024 10:01:24 +0000
Message-Id: <20241127100130.1162639-8-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241127100130.1162639-1-james.clark@linaro.org>
References: <20241127100130.1162639-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_020234_508817_B5432DF4 
X-CRM114-Status: GOOD (  14.94  )
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

For nVHE, switch the filter value in and out if the Coresight driver
asks for it. This will support filters for guests when sinks other than
TRBE are used.

For VHE, just write the filter directly to TRFCR_EL1 where trace can be
used even with TRBE sinks.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/include/asm/kvm_host.h  |  5 +++++
 arch/arm64/kvm/debug.c             | 28 ++++++++++++++++++++++++++++
 arch/arm64/kvm/hyp/nvhe/debug-sr.c |  1 +
 3 files changed, 34 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index ba251caa593b..cce07887551b 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -613,6 +613,7 @@ struct kvm_host_data {
 #define KVM_HOST_DATA_FLAG_HAS_SPE	0
 #define KVM_HOST_DATA_FLAG_HAS_TRF	1
 #define KVM_HOST_DATA_FLAG_TRBE_ENABLED	2
+#define KVM_HOST_DATA_FLAG_GUEST_FILTER	3
 	unsigned long flags;
 
 	struct kvm_cpu_context host_ctxt;
@@ -1387,6 +1388,8 @@ void kvm_clr_pmu_events(u64 clr);
 bool kvm_set_pmuserenr(u64 val);
 void kvm_enable_trbe(void);
 void kvm_disable_trbe(void);
+void kvm_set_trfcr(u64 guest_trfcr);
+void kvm_clear_trfcr(void);
 #else
 static inline void kvm_set_pmu_events(u64 set, struct perf_event_attr *attr) {}
 static inline void kvm_clr_pmu_events(u64 clr) {}
@@ -1396,6 +1399,8 @@ static inline bool kvm_set_pmuserenr(u64 val)
 }
 static inline void kvm_enable_trbe(void) {}
 static inline void kvm_disable_trbe(void) {}
+static inline void kvm_set_trfcr(u64 guest_trfcr) {}
+static inline void kvm_clear_trfcr(void) {}
 #endif
 
 void kvm_vcpu_load_vhe(struct kvm_vcpu *vcpu);
diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
index 0c340ae7b5d1..9266f2776991 100644
--- a/arch/arm64/kvm/debug.c
+++ b/arch/arm64/kvm/debug.c
@@ -337,3 +337,31 @@ void kvm_disable_trbe(void)
 	host_data_clear_flag(TRBE_ENABLED);
 }
 EXPORT_SYMBOL_GPL(kvm_disable_trbe);
+
+void kvm_set_trfcr(u64 guest_trfcr)
+{
+	if (is_protected_kvm_enabled() || WARN_ON_ONCE(preemptible()))
+		return;
+
+	if (has_vhe())
+		write_sysreg_s(guest_trfcr, SYS_TRFCR_EL12);
+	else {
+		*host_data_ptr(guest_trfcr_el1) = guest_trfcr;
+		host_data_set_flag(GUEST_FILTER);
+	}
+}
+EXPORT_SYMBOL_GPL(kvm_set_trfcr);
+
+void kvm_clear_trfcr(void)
+{
+	if (is_protected_kvm_enabled() || WARN_ON_ONCE(preemptible()))
+		return;
+
+	if (has_vhe())
+		write_sysreg_s(0, SYS_TRFCR_EL12);
+	else {
+		*host_data_ptr(guest_trfcr_el1) = 0;
+		host_data_clear_flag(GUEST_FILTER);
+	}
+}
+EXPORT_SYMBOL_GPL(kvm_clear_trfcr);
diff --git a/arch/arm64/kvm/hyp/nvhe/debug-sr.c b/arch/arm64/kvm/hyp/nvhe/debug-sr.c
index 9479bee41801..7edee7ace433 100644
--- a/arch/arm64/kvm/hyp/nvhe/debug-sr.c
+++ b/arch/arm64/kvm/hyp/nvhe/debug-sr.c
@@ -67,6 +67,7 @@ static void __trace_do_switch(u64 *saved_trfcr, u64 new_trfcr)
 static bool __trace_needs_switch(void)
 {
 	return host_data_test_flag(TRBE_ENABLED) ||
+	       host_data_test_flag(GUEST_FILTER) ||
 	       (is_protected_kvm_enabled() && host_data_test_flag(HAS_TRF));
 }
 
-- 
2.34.1


