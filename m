Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C36F2C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 13:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=batJW7N99udsH5or2fGgRKZ12NqGfXHTrvw8DYDS8OY=; b=adqV/l0K2/pR+QOnNmx/IoYKNQ
	C8WxEZ2hBQltzFHCFOy3agQOJUcQOfSsvGoymHO/mU2RO+nvvI1Xiqsw/66TIPh5SPrdBYCQn0CIs
	z9/r97rulx4Lwq55k/Gn306lxzGaThcjG3KgaGTMV5tiZTzrJA6vctPepHwqYV2GP/6KEoqPdk323
	87zN1KwV67iHqr1KcssSQSLnKODs6AwxXeAinpG0TrBNH/WFBTjVZzoTxmCBkav0fAisig5nWTQTY
	b2tHA/A/KGWI+vmWwRc1+hHJ9pbaER5UBSidVS/dN5AFAphrSdUIFKIGa+4WCtiQFaxkZy04jUVCF
	A6IJWOuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsLh3-00000008U0q-170D;
	Wed, 12 Mar 2025 13:00:17 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsKhJ-00000008KQA-2CaA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 11:56:30 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2241053582dso35485335ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 04:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1741780588; x=1742385388; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=batJW7N99udsH5or2fGgRKZ12NqGfXHTrvw8DYDS8OY=;
        b=0vOo6eOpDp0zJvO/niL+1nm1cl9SqBEEmaK98aEl8xFRB0C+6vwFanQC1eu7dfdgVB
         MAo2vj7U2AfdX/fAlD+EhKs0o4tb/R9oHk2TJ+6CJQkHKyZ+rf6RM0TaWi7Fo6MS9rHQ
         3dPdJsfNvv2h8qe5yaR7Kv3cUjkN28a/IsrLvgcrepy3RVFdcWSfSj2MiloyCHIPQq7K
         eabuJOYvnPQD+o+ke4mPG7Quep33BKBGw4ulQ15TxHsWVjw/8tuu+lRFUi5iP2CWbQUB
         xpEpEtUL7l/3hXgIlcZDWIFVGmvjpr3WMSig4Q+g29Ku5fO7te6wjzTdV1kgaFKoi2eC
         jINA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741780588; x=1742385388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=batJW7N99udsH5or2fGgRKZ12NqGfXHTrvw8DYDS8OY=;
        b=PzGw5slSSmIF0scKzjrsW/dn+CdMnfcxyKReAfwt6U0S9io6ZxAG3/SQh4fmADJb4p
         mbtvqcIEPbr3mLX9D2lPImYXu7geNPwfor7549KuOP0gybpYPg2C52ii6a/A8v5V9Gvn
         9exitHy0dRkhRPndtKBMRv96QoU/Rcx3TOuh2B4gTTV70wfh6MOggZhXquaYfcdmf4Su
         sGgVsezUC4jq1GwgpDC69PI1QNwsJyye9modttG2u4mDXj13pRybjLvUnP9LsUlUBuGm
         CYnWaePgTygumhh2k13+s5SUVRG3X6mvsrRnnU1sf0CT+DOoqS++ZK4Pt9RSz+2l6SPd
         dNuA==
X-Gm-Message-State: AOJu0YwGrK4chzvDruwWBk0xD4+k5IpfSC1JQ9+7bFSgkGppvK/zmmrF
	PvFvJSXGW7UheMSGmuHDG/wxmPomV5q8NamrxT9GIkeAqc8nRMWhf1K8Ux7O60I=
X-Gm-Gg: ASbGncvSnCmj0G2CWsV1C2iO3ei3tD9vPFKYT9vin11ZydMwt9seGJ76HtOVbax9Ymk
	EVUIObm/XKxyHQyWepDXAtpV5ZQ0kggOyX/N6OkCtgvkPaxu4j4JSv17v9x45dRFDquH1QG3cq4
	gvUKKOajFBr6Bc9+z7ZcEp0USwmEtH54Ut6O7sQi4xrRgzhSgcg3gKySmSPbgxXlbmnh0Krd5ci
	u6rhQnJLhQjRjT9TrrXUhFeZXX5e0Gn6gYs9U0LNRtGJBpI1Wjde1rOQ9ECiB0kK/yA8p+RlePI
	yhXaqxnAiPUcggP3jQvqLqo7apTR8h1Tuqh5cWqA8W8M9EOr
X-Google-Smtp-Source: AGHT+IFrXL/c2aUmiggWa0jbXOlzV9E33S5G3t7pznZh6+1oFT+Cw3t/yJk10DJ41f3H26UTFexAtg==
X-Received: by 2002:a17:903:40cb:b0:21f:85ee:f2df with SMTP id d9443c01a7336-2242888adfemr319563085ad.15.1741780588669;
        Wed, 12 Mar 2025 04:56:28 -0700 (PDT)
Received: from localhost ([157.82.205.237])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-22410aa457csm114113705ad.212.2025.03.12.04.56.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Mar 2025 04:56:28 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Wed, 12 Mar 2025 20:55:58 +0900
Subject: [PATCH v3 4/6] KVM: arm64: PMU: Reload when user modifies
 registers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-pmc-v3-4-0411cab5dc3d@daynix.com>
References: <20250312-pmc-v3-0-0411cab5dc3d@daynix.com>
In-Reply-To: <20250312-pmc-v3-0-0411cab5dc3d@daynix.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Andrew Jones <drjones@redhat.com>, Shannon Zhao <shannon.zhao@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devel@daynix.com, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.15-dev-edae6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_045629_566099_EFF36954 
X-CRM114-Status: GOOD (  15.31  )
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

Commit d0c94c49792c ("KVM: arm64: Restore PMU configuration on first
run") added the code to reload the PMU configuration on first run.

It is also important to keep the correct state even if system registers
are modified after first run, specifically when debugging Windows on
QEMU with GDB; QEMU tries to write back all visible registers when
resuming the VM execution with GDB, corrupting the PMU state. Windows
always uses the PMU so this can cause adverse effects on that particular
OS.

The usual register writes are already handled independently, but
register writes from userspace and ones for reset are not covered.
Trigger the code to reload the PMU configuration in these code paths
instead so that PMU configuration changes made by users will be applied
also after the first run.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 arch/arm64/kvm/pmu-emul.c | 3 ---
 arch/arm64/kvm/sys_regs.c | 6 ++++++
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index 1cfe53b6353e..78cfa8b0964d 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -862,9 +862,6 @@ int kvm_arm_pmu_v3_enable(struct kvm_vcpu *vcpu)
 		   return -EINVAL;
 	}
 
-	/* One-off reload of the PMU on first run */
-	kvm_make_request(KVM_REQ_RELOAD_PMU, vcpu);
-
 	return 0;
 }
 
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 26182cae4ac7..307ce37d0434 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1143,6 +1143,7 @@ static bool access_pmu_evtyper(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 static int set_pmreg(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r, u64 val)
 {
 	__vcpu_sys_reg(vcpu, r->reg) = val & kvm_pmu_valid_counter_mask(vcpu);
+	kvm_make_request(KVM_REQ_RELOAD_PMU, vcpu);
 	return 0;
 }
 
@@ -1303,6 +1304,8 @@ static int set_pmcr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r,
 		val |= ARMV8_PMU_PMCR_LC;
 
 	__vcpu_sys_reg(vcpu, r->reg) = val;
+	kvm_make_request(KVM_REQ_RELOAD_PMU, vcpu);
+
 	return 0;
 }
 
@@ -4259,6 +4262,9 @@ void kvm_reset_sys_regs(struct kvm_vcpu *vcpu)
 	}
 
 	set_bit(KVM_ARCH_FLAG_ID_REGS_INITIALIZED, &kvm->arch.flags);
+
+	if (kvm_vcpu_has_pmu(vcpu))
+		kvm_make_request(KVM_REQ_RELOAD_PMU, vcpu);
 }
 
 /**

-- 
2.48.1


