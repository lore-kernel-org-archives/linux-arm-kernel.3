Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE89E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 11:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tx00l9gj3r75Pyuu5HDGlCD21/i3mIfLGI99rWPrWTA=; b=NUyDz1I/EO2obYfe9tfrha9O5Y
	5pa+BgTeDgvJUldN60g+rMiTYrQeL0kw2q1SoUji6hw/8YosVU/loQFpej3t+Xb1uwYfGQN3ZJL2y
	1f1bZRN7ns9aSi3ZqDG4reAXMig+DtrXujfU3yQyCVnK8IwnNV5nBhE3Efnj3JoSCz9GlzUDTHmmW
	2chdroMrbA3vkoxr/a7xVGpKBzJZhuGJcnDKOobphAGImhrgGEyJ+ljRV7SBT/EtIniGLaNs9k+KF
	VryTIwsbPG4Yt9C9F0NatGyYjWoW/zWf7gvoz3xrNk90TiZbUduyzi2a3mXL6gzGDNMG8Or6uz6iN
	IWaOdncw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV83o-00000004cwc-1476;
	Tue, 07 Jan 2025 11:47:48 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV7rl-00000004a0i-0dNI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 11:35:25 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3862f32a33eso6952868f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 03:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736249719; x=1736854519; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tx00l9gj3r75Pyuu5HDGlCD21/i3mIfLGI99rWPrWTA=;
        b=xVoeYNIhO5+YNonNHc6F81sTVvNJokeEMpEM8wFo05zgI67Ci2pCwGGe+j0TjBM50f
         juRvj/V+5dYY4tafD34OKUbrbHQvpFpe60D8duHoWbf9ldPKMhrPwpnfHtGZR6MDpUZV
         0g23/qqlERnDBx0aLh3gz38k9pEi/fg9ho1DFGs0JzWN5LN8NWYhI72hKr1IUqFvFFbk
         4bi4ARkzkkL0Lb7Ci9tfICBrebFLh9/FnK8wGtjlGM4Z6gx5EsRX+nVPXdUlXeR7MuHH
         rE7Rp9pFLNTiIllIrSHttMqq3JwwjvxR+hPGcDtptdxZY5VfLP9HMPVOvkjoHr3uGeb5
         qlUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736249719; x=1736854519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tx00l9gj3r75Pyuu5HDGlCD21/i3mIfLGI99rWPrWTA=;
        b=IrJL4fsG9H2DSQDJa4pCLXx9MyBpDP+lj27IhOlxWAGXCrssyKdlAZ18CYNIHIAcwS
         nl9xernHyMe9mzoPeTF9Ef4iWpSW5jX2ubJsrEGvwDoyzccZGB8PJm3Qx25iCfhYIgL1
         MCVPNugTLYysvixPjeA7sxmYfTdX1q1rPXtQuL63vP8H9OzmblHgQWIl6eY8Fyrpq1HX
         MCh5h3Gg6piCGESB4LtHRy7+6uY24kF1r/WVvbHp90v2bCsYyMi4JmC7rB14JYuwI2+5
         kI/y8DtPfAi2NIpH3bSHEownQIX8CFgj17VLVyj2kdvhMeyBiUjYbHUzXI7TEqmdgPrd
         k1jQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyd8AEErGg+KzLeatGWqCURG5yIvZ8rdybGvAYVG1cN43nQBC6edM6DjNJWGSWcKgRS3l3hrDje7rRRtcDuq+H@lists.infradead.org
X-Gm-Message-State: AOJu0YydxqdjenT6c5RMWbduOvGVG43cb0wgmGlnxX6Sd7ef19DAyZoN
	DgNLg8wn2nWgpKfSkUo1/9Oua0Rf6zzwUV+rYELx5HSRpIxbuVrOj9C9X32suL0=
X-Gm-Gg: ASbGncsuW3PN+XzjXvG5m/iM/G5aQuuu4eVLC0D1BzO8OsC4gyCiBIpH7DRXP8VXzao
	io1ZUBTP/lsKhVPOPJWvw/yMY4d2ykSJvxj5ePJ4pxdnpTEeZymiId9e7QWLB5mDumK7KrPURom
	ioH3385C6F1g9YOEO5fUHlFvXr+eRQ53M0S/7TE3F3S4hwjCiRQ7MRI3sHMkaJ0cKeBLbqch7po
	4w7K+aXg7jE/7EB1verqxnAMGGYII91PzquoiWxUROx/pnnuxpCJy6d
X-Google-Smtp-Source: AGHT+IG6ssd+zopKDv9p4eYWzeGZXI+rmR402qUYF0KXs7CGMwpDT/5oKkPAsjDCmwrKzLWBArlwFw==
X-Received: by 2002:a5d:47cf:0:b0:385:ee59:44eb with SMTP id ffacd0b85a97d-38a221fa9ffmr50282094f8f.33.1736249719405;
        Tue, 07 Jan 2025 03:35:19 -0800 (PST)
Received: from pop-os.. ([145.224.66.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e1acsm50299218f8f.68.2025.01.07.03.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 03:35:19 -0800 (PST)
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
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Mark Brown <broonie@kernel.org>,
	James Morse <james.morse@arm.com>,
	Shiqi Liu <shiqiliu@hust.edu.cn>,
	Fuad Tabba <tabba@google.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Raghavendra Rao Ananta <rananta@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 09/10] KVM: arm64: Support trace filtering for guests
Date: Tue,  7 Jan 2025 11:32:46 +0000
Message-Id: <20250107113252.260631-10-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250107113252.260631-1-james.clark@linaro.org>
References: <20250107113252.260631-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_033521_188358_9C8DF9C7 
X-CRM114-Status: GOOD (  12.59  )
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
index b244ec44bd3a..1284f4c2da27 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1388,6 +1388,7 @@ void kvm_clr_pmu_events(u64 clr);
 bool kvm_set_pmuserenr(u64 val);
 void kvm_enable_trbe(void);
 void kvm_disable_trbe(void);
+void kvm_tracing_set_el1_configuration(u64 trfcr_while_in_guest);
 #else
 static inline void kvm_set_pmu_events(u64 set, struct perf_event_attr *attr) {}
 static inline void kvm_clr_pmu_events(u64 clr) {}
@@ -1397,6 +1398,7 @@ static inline bool kvm_set_pmuserenr(u64 val)
 }
 static inline void kvm_enable_trbe(void) {}
 static inline void kvm_disable_trbe(void) {}
+static inline void kvm_tracing_set_el1_configuration(u64 trfcr_while_in_guest) {}
 #endif
 
 void kvm_vcpu_load_vhe(struct kvm_vcpu *vcpu);
diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
index e1ac3d2a65be..22815a40d2ee 100644
--- a/arch/arm64/kvm/debug.c
+++ b/arch/arm64/kvm/debug.c
@@ -339,3 +339,21 @@ void kvm_disable_trbe(void)
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


