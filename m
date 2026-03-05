Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C34F3094B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 11:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iUs+CGKlSXZwATM56oVixVPREmsA3EmoDPmnZPV6UKk=; b=veDVjJktzh6cJX5ZWt8RAyae3l
	KTl6DmSXeDRep3GthKMYUAq9OJuHmy2khH9uR16hX6Ax6NIrPSleGcvhon9U2GcuyCiToctl2En5o
	bA2abMJ7r3LyhXe7Xgb5B2BxJTH3Xq3pYqIAQFelz4Jb/g3vJZLJCsdnMqfAPLfu+Vlxq2CXGwoZI
	AJFPc9epvH+ThraeT161yue0dNzDqx4+Sy3hIvLbH2CXBIp7hEsj+qknZ8IVrDgJZiMZiwTMm9dm9
	kkyQb3b03r1ib5UKcR19bK8ezClqiFDDHy3Bhf6a7rsqiS/6A6tK2p95Ckfu+e1o9hRo+f6qbugI/
	pTaROB3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy7Du-00000001hwU-06YM;
	Thu, 05 Mar 2026 11:50:34 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy7Dr-00000001hvo-3M9R
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 11:50:32 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-439afc58ac7so4965216f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 03:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772711430; x=1773316230; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iUs+CGKlSXZwATM56oVixVPREmsA3EmoDPmnZPV6UKk=;
        b=CPUoJEn90L8bCDQiiNphny28O7MEkw28rK2S+AzTU5U+gSC92x6DVHfuoIGDq6qd+C
         EEiAOFzEcigqmOoea6qT9yX087U4aLmq9awuVoZXy50rmk28m9HIuTuoDXGMPCE3d9ey
         PQJ5kVmcfaamP3H37X3AEHrgNyToM9j2BxuL74TvHpZxWBdV60xwo+ubGpbP9zWw3mLC
         6oDrxQffKCotS3klX43uknqDCake7CfF/BcgtQL7IVYqNzpIE5YEBf4bgMBMz74Yi0JO
         hyMNBwBH1pBf+LKfeA2bekg6hNOOy1XZ7FH5Yj0WTUG5lk8K/KeM+nmmGHA6O8nRGcGJ
         P8+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772711430; x=1773316230;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iUs+CGKlSXZwATM56oVixVPREmsA3EmoDPmnZPV6UKk=;
        b=sVuQHQGVtCQ3xsU+kSRfZA0eDRz51Av+e8eKQcu4VCKm/e1X9oKwPrk+l9tSp1qNnD
         8q4Vm7t4LFXYvVAqP4DtwZ28I7vUgPYqhl2Gh/PxBRKEIetPHDNSVxVuqLlICUPnHEqd
         cnmuUevOxSY0G/EjMJ3kJmEFs7XqcT0EJyxAxU/Wx2lGH6UOTIcN3cvkCFxXC7/KRB7N
         KDCHMCcdUnW/RNCypBddXOnrvfhiN3cWIi460VRdof89htCJzuKnFmfWZK5m3EI6nPCm
         J9yPBC+TMSLCTc7R1a80L+nLlKbq2/AekIjfRKfevwwBNKnE/qRicON6Mk733YxnbuV9
         SDow==
X-Gm-Message-State: AOJu0YxLfo6z95fBXYtaZBzlk42nX9snMN1I4aySgodsFSw39KnPz53d
	1Gmr9IThzEVYdjEDtq3xTIzkSDdv83bjgTuFl2Y6j4A8vQHLRQMNFUbrWwwWKzNsyY8=
X-Gm-Gg: ATEYQzxWOfIFf/oz3ThuzTT85ew9OtieuCiNqzR8yycjcIh7rmAkVT0uD4CntsL+N2C
	6Sydwx6G0A4kGEbnF3871GSqnlMeJ+qmdnMzAbD/KG60ZmJ/vC+yl7u30Ot6SoWtkBcuhARrnZO
	PlCPdMkJNB0hD/jjcj8yGYkR7VLAl6ajHzwxt/b8yCmzQYV7OdhUokjS1LRSnsleoIGilU/eB3o
	+OUtnY836ZjsbVBOFuJ/UtAZNWuHRs3i+sOYZxN+CO/I9JkaMWwRRCq5x9mrzUpAMej8dCAf4mA
	qN37Q0rtPW+BulZWFI+FrGkReJ1UEVfGj0F7oXuaVi1tRA7SO6bojrYTSe3lHlpj1PIcuVK8E1z
	bb000rGd6QPYzcrJWwnVNOsYepjra3NZww6+7ptbnxYc35zLDSVyGIH4pozB2BJZ0d9X1zVyI3W
	vF7fqgotW27F1isoyMHWZNxOQagAbfmHvz9KpQ3BMI5pU=
X-Received: by 2002:a05:6000:18a9:b0:439:b486:ba7f with SMTP id ffacd0b85a97d-439c8015847mr10303402f8f.49.1772711429861;
        Thu, 05 Mar 2026 03:50:29 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c60e40fsm48919998f8f.7.2026.03.05.03.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 03:50:29 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Mar 2026 11:50:01 +0000
Subject: [PATCH] KVM: arm64: Read PMUVer as unsigned
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-james-kvm-pmuver-sign-v1-1-eea0a2116dd0@linaro.org>
X-B4-Tracking: v=1; b=H4sIAOhtqWkC/x3MQQqDMBBG4avIrB2IEaV4FXGRNr92lETJ0FAQ7
 25w+S3eO0mRBEpDdVJCFpU9FjR1RZ+viwtYfDFZY3vTmo5XF6C85cBH+GUkVlkiz3i15u3hvPV
 U2iNhlv/zHafrugEKnUWbZwAAAA==
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
X-CRM114-CacheID: sfid-20260305_035031_852242_B30C421B 
X-CRM114-Status: GOOD (  12.07  )
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

ID_AA64DFR0_EL1.PMUVer is an unsigned field, so this skips
initialization of host_data_ptr(nr_event_counters) for PMUv3 for Armv8.8
onwards as they appear as negative values.

Fix it by reading it as unsigned.

Fixes: 2417218f2f23 ("KVM: arm64: Get rid of __kvm_get_mdcr_el2() and related warts")
Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/kvm/debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
index 3ad6b7c6e4ba..b8632edba9a3 100644
--- a/arch/arm64/kvm/debug.c
+++ b/arch/arm64/kvm/debug.c
@@ -76,7 +76,7 @@ void kvm_init_host_debug_data(void)
 {
 	u64 dfr0 = read_sysreg(id_aa64dfr0_el1);
 
-	if (cpuid_feature_extract_signed_field(dfr0, ID_AA64DFR0_EL1_PMUVer_SHIFT) > 0)
+	if (cpuid_feature_extract_unsigned_field(dfr0, ID_AA64DFR0_EL1_PMUVer_SHIFT) > 0)
 		*host_data_ptr(nr_event_counters) = FIELD_GET(ARMV8_PMU_PMCR_N,
 							      read_sysreg(pmcr_el0));
 

---
base-commit: c107785c7e8dbabd1c18301a1c362544b5786282
change-id: 20260305-james-kvm-pmuver-sign-fe830bdead2d

Best regards,
-- 
James Clark <james.clark@linaro.org>


