Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63821E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 14:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RxHaRwE8K9zHhfXkFI0ar+C1f1f9RJaVIjhqGS2PIW0=; b=cjMr6jdgx2UZAQl7aCegTo5c/G
	yXx+rDNBW9/NY+d3AsnGivR3h+gqS8jeJ/DIj0poA3AHmqLIHg4LzE9ZLthSz06AdOupaMWhezFrh
	GJVKdDiJTArz25zT6ygYt+Ejm22gzsDk46/b95pk5M4X2UxEMWZS4Ll+lCKtH3mfsJYnI+pnvxIEz
	YNSXUChcSZ/5U+N3c8AHGHvDIt1+BrQTIBwdHmpXlX7ibRLhaD+G11K68do8f8Uf+JKjTknDQiwFa
	mTThMSZ4FywNlvnieXPysglewlP2566QxM2KlWZPZtU5Q9Fd0hhWzemxaRDFp+LTrIMeIhVWFAt/O
	+vqsWI3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUoJk-00000001cMF-1gyH;
	Mon, 06 Jan 2025 14:42:56 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUo2x-00000001Z71-2RYW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 14:25:36 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-435f8f29f8aso104370885e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 06:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736173534; x=1736778334; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RxHaRwE8K9zHhfXkFI0ar+C1f1f9RJaVIjhqGS2PIW0=;
        b=iju8SVZATCjxcbQuOJK8zJGZ1r6+1atrySGmpvMSGJF56IgCdbZb5NQg2Qmk+h8s42
         u8PJ/wG5mST7o0W7efk2yCD3ossxgobbWdm67/G9OcsvU+zQSIzTs9bgf/bREMF3m6Tb
         h2tmM2vf56UMpwxP+FBXdf/oaFBfgNkF9q0CnLUxGNK4Rw78vQzMinS8SX1NXHguQtLv
         ghiINXgPY7bAzv2pmokSF00SuBbOumUm3yYs9qBLpknknzZktDuJUFHqhXYevxAbD9/Q
         pUU7k655Jsfa+zpBOUslDCK2VsyWOf9DL3kzXM8v//Y5ZQWllN6KXY5zcNjqkJuO9kJ1
         2c2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736173534; x=1736778334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RxHaRwE8K9zHhfXkFI0ar+C1f1f9RJaVIjhqGS2PIW0=;
        b=dJHLIMFLTLaPxsrUv7y9B3zBW9kWn3jbiISagULTIRg96YH3WcXPvZo4/xA3OlPl2v
         VYBrDa0U+gzBL+WCvrjYnOI1Kkk4IXkZvzOEzb+RjnjuWomBhmtsvw6GPV2houvETmup
         yAIOxBm7RFZHrYhIKJw2fzgILsb+GbV7qwKFtbMiJIZ47ZDkkSA4I01wlsA87WDthDlu
         UxOWstDCWVdHKlQlNfbGJZwhlqdFxx1S/PI63Du+F2gFDf7C7FY0aDb+ntnFHnHAXqMK
         Dd/UJW/GYtoEpu7HyGyN2EBfvBWDGVYgNLHBOIHdXdqnW9FaO7zP+pOkHMSDQ0AXJhQU
         Kybw==
X-Forwarded-Encrypted: i=1; AJvYcCUqtjPGRZlxYHCHO9XrMCXfL/lWO13m6JYU39YaZOTOGC02FdrTxFvoazlyaXfU6OU96uGLga/Uww86UjvlWdtT@lists.infradead.org
X-Gm-Message-State: AOJu0YzIvGHSNU81Pe+WV+CqsanZOfn1RC8b+khe/tp9f7C1lW7iyKt3
	/7BHmKujQxWpGNr4GEJb6j4D+rjRcydoD6SqkLfTuxcCs0JWHvPYIOHcnMDnp04=
X-Gm-Gg: ASbGncu5LvHELnFqW+Riyf0vm7PZEQgTnSh0NmYBZLuxCfHzCrruB14/L8Q01or6fqf
	F++uE1dxpYOuvqfnViBQoj4rwkoPtoImfJ97vHB8a1AYBbToZ5AihX+oKXB69t4r5L9RePvS8xQ
	QZC24H5bLNYI6jp06ql2JUXZ6UEMgLtVXw8rYgMspglsWGS7cjjsjrend5TSJhwBeGXhCEaByCi
	Q0wgmPCEGpMAehY30QNkEhr3lJtobeeP1HZ60xpM00TXTwNZOCSxpE2
X-Google-Smtp-Source: AGHT+IEgYl+0/TPin7WWSmn3OhX4sdnJNx6WPFGc3EzpxEqMLoC40XXnqOZPGdvtsWkfJKcw8cZ2Pw==
X-Received: by 2002:a05:600c:46c7:b0:434:a4b3:5ebe with SMTP id 5b1f17b1804b1-43668b5e244mr445600755e9.24.1736173533153;
        Mon, 06 Jan 2025 06:25:33 -0800 (PST)
Received: from pop-os.. ([145.224.66.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4365d116d8fsm577295045e9.17.2025.01.06.06.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 06:25:32 -0800 (PST)
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
	Mark Rutland <mark.rutland@arm.com>,
	Shiqi Liu <shiqiliu@hust.edu.cn>,
	Mark Brown <broonie@kernel.org>,
	James Morse <james.morse@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Raghavendra Rao Ananta <rananta@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 6/7] KVM: arm64: Support trace filtering for guests
Date: Mon,  6 Jan 2025 14:24:41 +0000
Message-Id: <20250106142446.628923-7-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250106142446.628923-1-james.clark@linaro.org>
References: <20250106142446.628923-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_062535_619856_BC0D6AAE 
X-CRM114-Status: GOOD (  12.62  )
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
 arch/arm64/include/asm/kvm_host.h |  2 ++
 arch/arm64/kvm/debug.c            | 18 ++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 8fdc7b6efc79..7cfa024de4e3 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1396,6 +1396,7 @@ void kvm_clr_pmu_events(u64 clr);
 bool kvm_set_pmuserenr(u64 val);
 void kvm_enable_trbe(void);
 void kvm_disable_trbe(void);
+void kvm_tracing_set_el1_configuration(u64 trfcr_while_in_guest);
 #else
 static inline void kvm_set_pmu_events(u64 set, struct perf_event_attr *attr) {}
 static inline void kvm_clr_pmu_events(u64 clr) {}
@@ -1405,6 +1406,7 @@ static inline bool kvm_set_pmuserenr(u64 val)
 }
 static inline void kvm_enable_trbe(void) {}
 static inline void kvm_disable_trbe(void) {}
+static inline void kvm_tracing_set_el1_configuration(u64 trfcr_while_in_guest) {}
 #endif
 
 void kvm_vcpu_load_vhe(struct kvm_vcpu *vcpu);
diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
index 92a24adadb0e..0e4c805e7e89 100644
--- a/arch/arm64/kvm/debug.c
+++ b/arch/arm64/kvm/debug.c
@@ -245,3 +245,21 @@ void kvm_disable_trbe(void)
 	host_data_clear_flag(TRBE_ENABLED);
 }
 EXPORT_SYMBOL_GPL(kvm_disable_trbe);
+
+void kvm_tracing_set_el1_configuration(u64 trfcr_while_in_guest)
+{
+	if (is_protected_kvm_enabled() || WARN_ON_ONCE(preemptible()))
+		return;
+
+	if (has_vhe()) {
+		write_sysreg_s(trfcr_while_in_guest, SYS_TRFCR_EL12);
+		return;
+	}
+
+	*host_data_ptr(trfcr_while_in_guest) = trfcr_while_in_guest;
+	if (read_sysreg_s(SYS_TRFCR_EL1) != trfcr_while_in_guest)
+		host_data_set_flag(EL1_TRACING_CONFIGURED);
+	else
+		host_data_clear_flag(EL1_TRACING_CONFIGURED);
+}
+EXPORT_SYMBOL_GPL(kvm_tracing_set_el1_configuration);
-- 
2.34.1


