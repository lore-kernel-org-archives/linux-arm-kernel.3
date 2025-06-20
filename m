Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC813C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 22:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fp13SX1Zh+VZLmNtKrEzp/HCcjo4sCQKHBsJF62MnBU=; b=A9U0PyU2QWUf7mW6XvNmtEvcNE
	pLcFRlq1J74SmXwos+DJAIs80ZWgwnME0n9ea0FLO6wWunLcKWYZKB46m1inXxsivmOzjM0bGV+jX
	du6GGRJg+ut4rD+xf8S6UjlGa5qonJIUgmWRFTQp5xf88QCqHtDz2CKm6cCNPWVzSbNF89jzebxVd
	N1HsfpGSGPACA892Le16IKwITb+R9pPlZUVgJ+XOiSM2eMF/QtUZygQ85NjhFDfty+ymWMKAw3yTt
	EPNc4DkUdDed2ifU0h/PS6psY7WGClm31rEJ8hfzTFaEafq5KLJ2gI0qyay0XmBF63Fqna2nt2E6R
	NGVN6Alw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSkD7-0000000GjWz-2C2p;
	Fri, 20 Jun 2025 22:27:49 +0000
Received: from mail-il1-x14a.google.com ([2607:f8b0:4864:20::14a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSk4G-0000000GgzU-13Xl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 22:18:41 +0000
Received: by mail-il1-x14a.google.com with SMTP id e9e14a558f8ab-3ddba1b53e8so23345275ab.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 15:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750457919; x=1751062719; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fp13SX1Zh+VZLmNtKrEzp/HCcjo4sCQKHBsJF62MnBU=;
        b=lPPvT7V3I9LmWMkU22BTbD4REx/iF4V458C78c/FUlHfzrrfZRFUEHT/P5+HcxiVXm
         YnNZXLfatIOoucZuT7peCm3Wf9gE7zhL6GzovR0QyPpbRYVmRU4chGEaIxAOHP6teEWZ
         KX4LpZKeairX/q5RTD400JE7Xc0vpsRdrdaf+08gwuQ6cGRqWNlcXaB/xBMmNsJhY79R
         L+ifh5ZIKvh+npWNUBntpOjOO0hShd22L4S5MPq7uSvHhV7pK4fp5w1SxB3IfuzO9yYJ
         kIVy7P4IZbE89tsD4UdAwKJoeY+R+59SIKDpb/YMW0ZQ8NozNoTd8phvHfCxDrDkvFUd
         hSPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750457919; x=1751062719;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fp13SX1Zh+VZLmNtKrEzp/HCcjo4sCQKHBsJF62MnBU=;
        b=D8U7QEP0MfFHLsjHCL1zLh/uj+y4f69V5mXwn0N1rcSAj1Ww/0off0ae+Erp9a8nEX
         wZASQ3xiwSMKFRoPZpsI/LZ59itq+qF1JOdVMZyLqHxYWnQDZO4vXTS/5AQMr/4Tjw1T
         Jx4K++nTkFjaHCtnlrnUQu9Py0R5EoBicvo5LE+ljlxG/REWQM1HamHSp4kMsYrgxaHd
         vv7ryTAZhqd0DovZZlwJtH7MDAQFEeHMPWPa2gD+MzD7QL42E2Moxsjd4eibDIGVKhuw
         ODd6C6JMGD8ql3yO/f7iypZSxKwZ7BR08evo/I8s6I3otSf4LWEE5zTkYH75ZrhvJuQG
         46PA==
X-Forwarded-Encrypted: i=1; AJvYcCWPbEGL+/kBUP/riWgkRebTIhlayjRYB7j/8Wq5A9JG2drxp0UoB523POhN+2ZV5BQnKnDCDUCiLNyh/YMgNN+x@lists.infradead.org
X-Gm-Message-State: AOJu0Yx94A9h3SFupVlbu6bTQhOMxhf+cQz7JKC7jdAmgh+gxMeZVpft
	3NWHGT9VnuKSG1JjHmXle/PygVU3i98R7rwAIPZ0k0mGky/KdKZdXX6MpA5uvfmCMNfDRFCYyuW
	31l6nO2g4Mqrg3kkiTJx6Hb1mkg==
X-Google-Smtp-Source: AGHT+IFEidHFMEbKk2OynEjRQvMLrVqFymZV1Kh1vRLY6IT0l2lygB4TWhQMZfNIZL6xIAJ9fHhQZ3Bjc4iSkEbXjw==
X-Received: from ilbcp10.prod.google.com ([2002:a05:6e02:398a:b0:3dc:756a:e520])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:3782:b0:3dc:7fa4:834 with SMTP id e9e14a558f8ab-3de38cb06a0mr47968995ab.15.1750457918713;
 Fri, 20 Jun 2025 15:18:38 -0700 (PDT)
Date: Fri, 20 Jun 2025 22:13:03 +0000
In-Reply-To: <20250620221326.1261128-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250620221326.1261128-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.714.g196bf9f422-goog
Message-ID: <20250620221326.1261128-4-coltonlewis@google.com>
Subject: [PATCH v2 03/23] arm64: cpufeature: Add cpucap for PMICNTR
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
X-CRM114-CacheID: sfid-20250620_151840_287371_424947FC 
X-CRM114-Status: GOOD (  11.11  )
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

Add a cpucap for FEAT_PMUv3_PMICNTR, meaning there is a dedicated
instruction counter as well as the cycle counter.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kernel/cpufeature.c | 7 +++++++
 arch/arm64/tools/cpucaps       | 1 +
 2 files changed, 8 insertions(+)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 278294fdc97d..85dea9714928 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2904,6 +2904,13 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.matches = has_cpuid_feature,
 		ARM64_CPUID_FIELDS(ID_AA64DFR0_EL1, HPMN0, IMP)
 	},
+	{
+		.desc = "PMU Dedicated Instruction Counter",
+		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
+		.capability = ARM64_HAS_PMICNTR,
+		.matches = has_cpuid_feature,
+		ARM64_CPUID_FIELDS(ID_AA64DFR1_EL1, PMICNTR, IMP)
+	},
 #ifdef CONFIG_ARM64_SME
 	{
 		.desc = "Scalable Matrix Extension",
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index 5b196ba21629..6dd72fcdd612 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -47,6 +47,7 @@ HAS_LSE_ATOMICS
 HAS_MOPS
 HAS_NESTED_VIRT
 HAS_PAN
+HAS_PMICNTR
 HAS_PMUV3
 HAS_S1PIE
 HAS_S1POE
-- 
2.50.0.714.g196bf9f422-goog


