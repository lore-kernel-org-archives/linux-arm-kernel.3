Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF090D32D95
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 11:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UdrH76534AdnOkkz/8MUO16ELoaDJWuaGxP7kufZ9lk=; b=C4WiF1mQb/hixhCAQidrg5ibML
	x89UXU+42k+qa9xwlZTCmUdwPB09DVFC6WGXBLVLXfdj7p2qmbsDnlmYp7GMrw8wtTgEjm0+gU/oQ
	mIXos8zYDbfmEs/SUDhqQIpMsuLVAHcY5GMqC96bsaSx5onpblzRe9PClG5kBMB8G8ejgUXNSzF1L
	1vVWoCBc+MUYbZiycALaEJeMYcbZ7qFbKUJ+jIrTASfQc5KuiXpvtLUiAjAYf8BMjPeNZ5QQmf95t
	v9QXxLmQ70bwlfF8JjuPoRC0fFBkT4k11JOqYokcu+BYD4wIhbtbycr8pYYq0JqJYYzOW2QauChVR
	NJ5ycnYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAp2T-00000003Dci-2saV;
	Tue, 12 Nov 2024 11:26:29 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAoHr-000000034lp-32PD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 10:38:20 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4315baa51d8so48384435e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 02:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731407898; x=1732012698; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UdrH76534AdnOkkz/8MUO16ELoaDJWuaGxP7kufZ9lk=;
        b=i08cHEFQ3MYGws02quiRNzjZc7gU+wYyUI8iAzZGt8XYfwHRZvN9k0WEB6N3vU/Rbl
         Kvza1yKAVcVCnE3rmt4o3rkPvw2rX99WC7qZMtIAscTX0AlAs4cCrYsrM2kjJ5JNHq4H
         X4EgP5Igb5lmyftEkyrBlH/UWSVQs5voabNIJ7xSg+iLjFBS1TgRrHTdxKAX3631+uqa
         L6c8/3Xf801qbsQ5oDnRcpR+pWW3dpkE+oFb1ySw/lbbDK5fhaKFdW5o0bpN+8fbCI9q
         nvyiRKH0+PPbvr8EOyvLJOPJKP60aYusnzmCLnyXIKKBM1L1hrwrK3JIBsoT6SJenGid
         TckA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731407898; x=1732012698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UdrH76534AdnOkkz/8MUO16ELoaDJWuaGxP7kufZ9lk=;
        b=hUj84J2xlhSkoc125NNdRKrGrAZuA/lIQvA5ATzupYD2n6BdhG6IIizQxFzVA6q9AM
         BthCDSOADs6MAOV7vKilrAIUYACZy6BnnDL7z6suv9fegGAaCd0ofSvlArPahmwtimyj
         1wgpzdgVc2RdVN6xl1mOdj2rMD+PaLozT0897SawF/Kj6+A8VyHf/mlHm/XYt5+9rGFR
         dkj31vlOmHkwuAtaaJHAKpyTxA5gvk4bZkX9+uu6fq66miCl7O5Uy/IQ7uKi7cKRLS/C
         uJWqpf859u3A9WBkkP1gskRdzfdyWn0IKPDjjLOkRZ7WfWcSDUVm0Ev/t5Rthfg0T1UJ
         KpqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfvW2luCdOZduMXJ86bwjpdypxc0sCfUi4yeYB47+ftRaJXx9LEFNsxVJcHXduQ8Z0BVGm8FWM/6n+jxCjYvT0@lists.infradead.org
X-Gm-Message-State: AOJu0YzHbFPI3jB9dKRqQug/EYy3sq/Z4ohNRY2Gsv849idt1KEfai16
	Zsx1PO1hWDlOTWMv+GDTpHxr9S861WFWXe+er6ZaHgX5RuANpq6DNf7hO+ZIAbI=
X-Google-Smtp-Source: AGHT+IF1FS9ufu9o4Y4stQLYGJvoNNDm9mRT+SEMwJRqakkQKPd/4nKseuKIJE+lWn0kSfJLNtfHQw==
X-Received: by 2002:a05:600c:3b22:b0:431:52da:9d67 with SMTP id 5b1f17b1804b1-432b74fdaf9mr140208015e9.3.1731407898314;
        Tue, 12 Nov 2024 02:38:18 -0800 (PST)
Received: from pop-os.. ([145.224.90.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432bbf436ffsm142270955e9.44.2024.11.12.02.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 02:38:17 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: suzuki.poulose@arm.com,
	oliver.upton@linux.dev,
	coresight@lists.linaro.org,
	kvmarm@lists.linux.dev
Cc: James Clark <james.clark@arm.com>,
	James Clark <james.clark@linaro.org>,
	Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	James Morse <james.morse@arm.com>,
	Shiqi Liu <shiqiliu@hust.edu.cn>,
	Fuad Tabba <tabba@google.com>,
	Mark Brown <broonie@kernel.org>,
	Raghavendra Rao Ananta <rananta@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 06/12] KVM: arm64: Add flag for FEAT_TRF
Date: Tue, 12 Nov 2024 10:37:05 +0000
Message-Id: <20241112103717.589952-7-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112103717.589952-1-james.clark@linaro.org>
References: <20241112103717.589952-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_023819_789776_73CB5266 
X-CRM114-Status: GOOD (  15.19  )
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

From: James Clark <james.clark@arm.com>

FEAT_TRF can control trace generation at different ELs so this will
enable support of exclude/include guest rules when it's present without
TRBE. With TRBE we'll have to continue to always disable guest trace.

Signed-off-by: James Clark <james.clark@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/include/asm/kvm_host.h |  2 ++
 arch/arm64/kvm/debug.c            | 14 ++++++++++----
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 61ff34e1ffef..5dfc3f4f74b2 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -939,6 +939,8 @@ struct kvm_vcpu_arch {
 #define HOST_FEAT_HAS_SPE	__kvm_single_flag(feats, BIT(0))
 /* Save TRBE context if active  */
 #define HOST_FEAT_HAS_TRBE	__kvm_single_flag(feats, BIT(1))
+/* CPU has Feat_TRF */
+#define HOST_FEAT_HAS_TRF	__kvm_single_flag(feats, BIT(2))
 
 /* Pointer to the vcpu's SVE FFR for sve_{save,load}_state() */
 #define vcpu_sve_pffr(vcpu) (kern_hyp_va((vcpu)->arch.sve_state) +	\
diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
index cf5558806687..fb41ef5d9db9 100644
--- a/arch/arm64/kvm/debug.c
+++ b/arch/arm64/kvm/debug.c
@@ -89,10 +89,16 @@ void kvm_arm_init_debug(void)
 	    !(read_sysreg_s(SYS_PMBIDR_EL1) & BIT(PMBIDR_EL1_P_SHIFT)))
 		host_data_set_flag(HOST_FEAT_HAS_SPE);
 
-	/* Check if we have TRBE implemented and available at the host */
-	if (cpuid_feature_extract_unsigned_field(dfr0, ID_AA64DFR0_EL1_TraceBuffer_SHIFT) &&
-	    !(read_sysreg_s(SYS_TRBIDR_EL1) & TRBIDR_EL1_P))
-		host_data_set_flag(HOST_FEAT_HAS_TRBE);
+	if (cpuid_feature_extract_unsigned_field(dfr0, ID_AA64DFR0_EL1_TraceFilt_SHIFT)) {
+		host_data_set_flag(HOST_FEAT_HAS_TRF);
+		/*
+		 * The architecture mandates FEAT_TRF with TRBE, so only need to check
+		 * for TRBE if TRF exists.
+		 */
+		if (cpuid_feature_extract_unsigned_field(dfr0, ID_AA64DFR0_EL1_TraceBuffer_SHIFT) &&
+		    !(read_sysreg_s(SYS_TRBIDR_EL1) & TRBIDR_EL1_P))
+			host_data_set_flag(HOST_FEAT_HAS_TRBE);
+	}
 }
 
 /**
-- 
2.34.1


