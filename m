Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1542CF3D330
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 16:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=11VRqYRJ5Pqc2nNG60kzy1sCOR7Z8KyAMmnGQpaAEQI=; b=4IYw2ivitiHkXEqRV3Wp1jVLvM
	DkYWMoz0ofU5IMkS0sAyPWPWJtIZcd5YLgVn+wTHJ17fPivDbtlK1NI15erB8VKqesYY/Ik9kFZ3P
	JXpVdEkNwESqvIQ49+cLaE2dxCxLCgRyVb+H41Tvgf8vTbh+nviccJzV14dVfWhOrUKszEjuZ2CHv
	N2Nk+JJVE+Uksd6hob6O/AR9I0hN0H4+lRLgCOL5PYV40DAijatcpMHpsaNYDluVS9nJTZxjbZHXC
	yOlOlAv/W3cf48gnPhIT6LtZB7vIjrn8EDjwvQO6q0GTTnY2Bjf2r9LLr8+1Da6jyiVeYcxfUZPF4
	qIGfSGLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyBZI-00000002Cxi-0osG;
	Thu, 05 Mar 2026 16:28:56 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyBZD-00000002Cub-0wI5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 16:28:52 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-439b8a3f2bcso3733495f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 08:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772728129; x=1773332929; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=11VRqYRJ5Pqc2nNG60kzy1sCOR7Z8KyAMmnGQpaAEQI=;
        b=w8n3qHxK7HLeylF1DuqHk5rAP6CflZTwE/mew9zozhGNWDY9xXBzvo8qi3QFXACcFf
         3AkgA27qXP6xEiINfkGMW9pA++2mxWOiRl7/fRR/eX501pRT2GcR+FE4/l/qk7AEfoYc
         rAfLnqWZATmJvJsK2NuFOCM/YUioeqohrvhKLdqiJT1FRZNtgd3YmxSpvmcGT3wnfIvf
         Ai3NVDG2gWseRfQlMuvEDmGSyPEq0ZI9EFZLv6puBL1V1At65GkI419XnuwAKsDhBPhC
         8m7FgUt4NVcPbK/WIm+DgxgYaIbdIpVwQCKa1fFQzCHstyo3qjdrzah2Gb7Ylbtlpz5c
         zWAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772728129; x=1773332929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=11VRqYRJ5Pqc2nNG60kzy1sCOR7Z8KyAMmnGQpaAEQI=;
        b=CTzMX5u9CFFD78I3DglBKipz6QtmglVXbjE3n5KIRfIDnAp/Wmh1P4HCoRHZ3haITE
         GlV+5j1UbXBn9sd2N39SzwMcp09Sll4+3utjcffchD9301BrJM4yZoMk8eA0R1L+oioY
         8PQUyeyTmaDfjfl3ZokvjZvci7VljhDhvLaf4eur9RyhjND5t1FSCJHK9BNmDoXfjsjH
         lTxUx5fh+D/hLo+A/5BdIlE5vKucp7r/+Bnjw0bKrvM+jXxEA38ut1EEf6oAZAgIPQy3
         1fsPoH59NhDyLmegLn2Pj133B6jqZbqlYph9nJZ8L25ngpTcCNQaXw+Jhkoqy95F0OUM
         yG8g==
X-Gm-Message-State: AOJu0YyPeybfJ7ChT9owNWZBTc8hwI/2gUgA84vWNew5O7LkY9c7/XMk
	01IFC0y2ifxpnV6fqDT4FEyS5RicvxkKDaUtXQpQiRK8VljCrQ1xtyBSRVUEb3LDbuE=
X-Gm-Gg: ATEYQzw1ir6mYwiCW2ncJpxj9+zyIgjudTLC/MOHuV6Ubr9rz0LTnhNcHwjsBg9JyIg
	JlgdoYJiygR46OYwr/OSaS1pPXhvxib/ILqadoejMEGOdYySLzwbmKWIYeRzTIcBwdh+eEj4Mxh
	NVhHjVyLgypxAB7BFWBlLdLow17nBciHwXgM/R0ceZdELl79++JSv7CYKDHiFGpRjizbvS5MG1X
	LKu7nCl7+Y5sfE70hSDHs+a+/tZ04M9eeFyJu/pP067y8WvO8qAsEazvTX/sgsJaU2dT+m23DyQ
	QPQLBsir+oLcbGgxZTQQWDX5ag0LjBfDPMQjMF8QwwBl6ah0vCPG7jOX9U9I3ZBF6Ny/9cZjlmA
	TlUPVVhzVjzi/zM1MlTM/xURZ2yhkCTREdy1yuSKBmSS0H1ROYo2xtMexX6HkHdxmkUvydrHMal
	d2MfVL7NQJ1qOssuvRvfg1C6SiY+QoyRB7
X-Received: by 2002:a05:6000:2401:b0:439:c1ca:82be with SMTP id ffacd0b85a97d-439c7fffe76mr12612831f8f.28.1772728129352;
        Thu, 05 Mar 2026 08:28:49 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439c2f8c0e7sm19596034f8f.29.2026.03.05.08.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 08:28:49 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Mar 2026 16:28:19 +0000
Subject: [PATCH v2 3/3] arm64: cpufeature: Use pmuv3_implemented() function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-james-kvm-pmuver-sign-v2-3-ee80a125af9b@linaro.org>
References: <20260305-james-kvm-pmuver-sign-v2-0-ee80a125af9b@linaro.org>
In-Reply-To: <20260305-james-kvm-pmuver-sign-v2-0-ee80a125af9b@linaro.org>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Colton Lewis <coltonlewis@google.com>, 
 Alexandru Elisei <alexandru.elisei@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_082851_283103_BCA2C555 
X-CRM114-Status: GOOD (  13.10  )
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

Other places that are doing this version comparison are already using
pmuv3_implemented(), so might as well use it here too for consistency.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm/include/asm/arm_pmuv3.h |  7 +++++++
 arch/arm64/kernel/cpufeature.c   | 12 ++----------
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/arch/arm/include/asm/arm_pmuv3.h b/arch/arm/include/asm/arm_pmuv3.h
index 2ec0e5e83fc9..ecfede0c0348 100644
--- a/arch/arm/include/asm/arm_pmuv3.h
+++ b/arch/arm/include/asm/arm_pmuv3.h
@@ -238,6 +238,13 @@ static inline void kvm_vcpu_pmu_resync_el0(void) {}
 
 static inline bool pmuv3_implemented(int pmuver)
 {
+	/*
+	 * PMUVer follows the standard ID scheme for an unsigned field with the
+	 * exception of 0xF (IMP_DEF) which is treated specially and implies
+	 * FEAT_PMUv3 is not implemented.
+	 *
+	 * See DDI0487L.a D24.1.3.2 for more details.
+	 */
 	return !(pmuver == ARMV8_PMU_DFR_VER_IMP_DEF ||
 		 pmuver == ARMV8_PMU_DFR_VER_NI);
 }
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 07abdfd40756..cc9783b26443 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -77,6 +77,7 @@
 #include <linux/percpu.h>
 #include <linux/sched/isolation.h>
 
+#include <asm/arm_pmuv3.h>
 #include <asm/cpu.h>
 #include <asm/cpufeature.h>
 #include <asm/cpu_ops.h>
@@ -1927,19 +1928,10 @@ static bool has_pmuv3(const struct arm64_cpu_capabilities *entry, int scope)
 	u64 dfr0 = read_sanitised_ftr_reg(SYS_ID_AA64DFR0_EL1);
 	unsigned int pmuver;
 
-	/*
-	 * PMUVer follows the standard ID scheme for an unsigned field with the
-	 * exception of 0xF (IMP_DEF) which is treated specially and implies
-	 * FEAT_PMUv3 is not implemented.
-	 *
-	 * See DDI0487L.a D24.1.3.2 for more details.
-	 */
 	pmuver = cpuid_feature_extract_unsigned_field(dfr0,
 						      ID_AA64DFR0_EL1_PMUVer_SHIFT);
-	if (pmuver == ID_AA64DFR0_EL1_PMUVer_IMP_DEF)
-		return false;
 
-	return pmuver >= ID_AA64DFR0_EL1_PMUVer_IMP;
+	return pmuv3_implemented(pmuver);
 }
 #endif
 

-- 
2.34.1


