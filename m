Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E639FED2E4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 08:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g97hWssFn4sWTqAvgPZaDkvAx9UyrHyXX93JyLOhQT0=; b=Ne1N4heoBOiH8n6awQFXMhEvvA
	T0qHd2Ru9RHWsMSD/n/YVyRuloUxfdAPTp4jAbltHWy/tIqVceavrkQlrOMX4Qxt8isVfE+zQpbZ5
	XdIkg8XppCvZh4HfxARqZPWIWcYEbqP40v6fzmx/0YCukq1VeSfAQP2QO1pIbOpMiZsELLIIEYffz
	TfVIirLEQO3IzCHzHLwqFyS+xzGKzuFvICFa7Xdo8aT67aIXOVnwX4mJcYx/1r2YKNxTQ0K5Je3ij
	VhSgMKmtAWjh0gWrp7tKIymP4Vt0DWiY4+YBoPv43Fgmk2aALXmDGlF789JcDSzqhVB8d9yWtFQjS
	kloxR2PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0azb-0000000DZDd-0x8A;
	Thu, 12 Mar 2026 08:02:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0azY-0000000DZCy-1FVt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 08:02:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0CFBC404E5;
	Thu, 12 Mar 2026 08:01:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD661C116C6;
	Thu, 12 Mar 2026 08:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773302518;
	bh=u+K2YX0UiSGjqu/03TsV46CS2J8/TdkIpbUuur3YNrI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vb82oAZQB5riuIp6fPLoLpOePoCwPydEF1xFAVupqMWfuEQP0NvsxQIC6ZS3hIulO
	 827rgOsl/s4E5/l49GFccCO/LlvHivBjgkq3zgfnYCgpuSQiu7aVceFaw9YY+VD6Zb
	 KW50EqulVzvveWrVjPO90feb+l1eV2A3/7ZITBV4zngj5bkspJqqimawN4jkMM1GZ7
	 OtLo2/R7vept85hSX5SaGWjXzILwV/Uyr031CLBZkMLn8vYTvudhYe400Nfutj+jYd
	 zfQ48riBOWQHt+4T8W0o1DnEJsyvq/unfEzR8JtMhPeanEQeWDFMR3XeNdgY1NUGv2
	 HtfMWnQmXHPXA==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-coco@lists.linux.dev,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Dan Williams <dan.j.williams@intel.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Steven Price <steven.price@arm.com>
Subject: [RFC PATCH v3 01/10] KVM: arm64: RMI: Add and export kvm_has_da_feature helper
Date: Thu, 12 Mar 2026 13:31:20 +0530
Message-ID: <20260312080129.3483585-2-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260312080129.3483585-1-aneesh.kumar@kernel.org>
References: <20260312080129.3483585-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_010200_386731_B30B6A3A 
X-CRM114-Status: GOOD (  10.76  )
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

Add kvm_has_da_feature() helper for use in later patches.
Update reserved fields based on Alp17 spec.

Cc: Marc Zyngier <maz@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Alexey Kardashevskiy <aik@amd.com>
Cc: Samuel Ortiz <sameo@rivosinc.com>
Cc: Xu Yilun <yilun.xu@linux.intel.com>
Cc: Suzuki K Poulose <Suzuki.Poulose@arm.com>
Cc: Steven Price <steven.price@arm.com>
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 arch/arm64/include/asm/kvm_rmi.h | 1 +
 arch/arm64/include/asm/rmi_smc.h | 3 ++-
 arch/arm64/kvm/rmi.c             | 6 ++++++
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_rmi.h b/arch/arm64/include/asm/kvm_rmi.h
index 1b2cdaac6c50..a967061af6ed 100644
--- a/arch/arm64/include/asm/kvm_rmi.h
+++ b/arch/arm64/include/asm/kvm_rmi.h
@@ -90,6 +90,7 @@ u32 kvm_realm_ipa_limit(void);
 u32 kvm_realm_vgic_nr_lr(void);
 u8 kvm_realm_max_pmu_counters(void);
 unsigned int kvm_realm_sve_max_vl(void);
+bool kvm_has_da_feature(void);
 
 u64 kvm_realm_reset_id_aa64dfr0_el1(const struct kvm_vcpu *vcpu, u64 val);
 
diff --git a/arch/arm64/include/asm/rmi_smc.h b/arch/arm64/include/asm/rmi_smc.h
index 1000368f1bca..f6f786bfb9c9 100644
--- a/arch/arm64/include/asm/rmi_smc.h
+++ b/arch/arm64/include/asm/rmi_smc.h
@@ -86,7 +86,8 @@ enum rmi_ripas {
 #define RMI_FEATURE_REGISTER_0_HASH_SHA_512	BIT(33)
 #define RMI_FEATURE_REGISTER_0_GICV3_NUM_LRS	GENMASK(37, 34)
 #define RMI_FEATURE_REGISTER_0_MAX_RECS_ORDER	GENMASK(41, 38)
-#define RMI_FEATURE_REGISTER_0_Reserved		GENMASK(63, 42)
+#define RMI_FEATURE_REGISTER_0_DA		BIT(42)
+#define RMI_FEATURE_REGISTER_0_Reserved		GENMASK(63, 61)
 
 #define RMI_REALM_PARAM_FLAG_LPA2		BIT(0)
 #define RMI_REALM_PARAM_FLAG_SVE		BIT(1)
diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
index 478a73e0b35a..08f3d2362dfd 100644
--- a/arch/arm64/kvm/rmi.c
+++ b/arch/arm64/kvm/rmi.c
@@ -1738,6 +1738,12 @@ int kvm_init_realm_vm(struct kvm *kvm)
 	return 0;
 }
 
+bool kvm_has_da_feature(void)
+{
+	return rmi_has_feature(RMI_FEATURE_REGISTER_0_DA);
+}
+EXPORT_SYMBOL_GPL(kvm_has_da_feature);
+
 void kvm_init_rmi(void)
 {
 	/* Only 4k page size on the host is supported */
-- 
2.43.0


