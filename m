Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 050D7C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 14:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rAMd6rGhip9Etdi0DcL12HaRjFlmNQeXSBT7tbE4ZZA=; b=kiPB9KegIVXPhYdFNaSbGQQx1j
	JmmnuaGO98W2hcRI9ga/QDL1Ay8TkDWEkNyFCbKf4+zPIxoQQEPeL0bTG4YyGWBJIVzYSg8165L8V
	CwwE7euTSFMHo/FDwu878k3tlTvkM98pEAtl7DXEzJ388w1GWafC7o3+1btaFi5JCHh5oa410gnEn
	4DK1FPFJ4pK4ivgae7cwY0M26k+XbL29mIoxvD9V4go4Ua/r7Iw+GnpTZ84mOUH9rAP7xeR5rfOkC
	E6xycU9DwqnXd95ygDxaNIPjanf5ZwnqziTXFipDi3F2hx/wH+mT8zNIaX7dTOlv9dyGIWp5IKkDk
	bHxjtaqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsMiQ-00000008eOa-41Oi;
	Wed, 12 Mar 2025 14:05:47 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsKh6-00000008KOF-1FZo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 11:56:18 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-22398e09e39so122424705ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 04:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1741780574; x=1742385374; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rAMd6rGhip9Etdi0DcL12HaRjFlmNQeXSBT7tbE4ZZA=;
        b=DqJcfRGvrB5NlnAps6PWvI8k4jzmsawTwFpoiQO6NJnmC+1c7uE/wJ9ipZdki8JxYn
         GRL8pQMiI6NFzfjC3dB8U6rk9kRHzQvGU+pvpXmN3dQXZ5M4X3tAylCuNh1bjAp31Eao
         ITxSGG9i2CMULDix4YojX8ORxEWkU5yj+Q3u4Az1Ayb2VJb7OFom2yMrHzy2mKlBsBoH
         rFR3Yycf4AShf0xwgcYFK3H6jaLzsVLRDGC53mBNSZnZzPp6jKXoToWfEjjGftxLirGK
         fRcYrEa5V0U8HRMoVDFKoZVBkSIITG86S7cB5YxWdN+i5tsOrbH3G42pkYuf1Xru3H5x
         KFoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741780574; x=1742385374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rAMd6rGhip9Etdi0DcL12HaRjFlmNQeXSBT7tbE4ZZA=;
        b=mGrkh14ou97Y615kiTUIIvBZ+cykVM6eD3TkFmxITYzMcpmPI/Z9wGK5f4DIBWHy3B
         QE/TZWeqCWW/NwE/mh9TXTH+8jPyBdHrnknXyX6KV+cnmWlz8KuzA0Tv1LqEdjfrDkuk
         3E0XVTa8bzOesDTqujWzq+RKQgFD7j1/DEYVrdhlsSvct17Xkob1qaHoZpkB2sb6zR97
         SeZFgOs+EhiwVAdM/SLbq1hJX6OLMkTjb6IUoAhXh8+t6tUCpjnHMkdBVBFG+APc9ZSh
         bnSY7UpLKwjxwDspRIE10KeIUT9BOanJcm9vsUyvlvts9WNW93EKdB645nz/f9roEA2o
         5VSw==
X-Gm-Message-State: AOJu0YzHLuWzyUFvM7PZz2Dt7Rmkfg+8Lf9+c0Qy4De1q4U4R6E0JWM8
	jTaE/mG8c0XwSpcSUqtHkwccPkAK5+5dmM0+2dQE3E7+DErjiP0DqaaODfKYiCVbLPmmiqxJg0d
	Mmsw=
X-Gm-Gg: ASbGncupVAmj9FaDt1XC74xAXRiWYEeOBZMLteB7tAajEfjzscVjDMWg+l6ZdmPKebe
	C6pZ3lQIQzhGCIoF1jVdKvc1/pjksZ+jpZwWPgjPXN5lj+njCFyRrl4UTm7NuXqjYOYJ05tmaAo
	L2Ncyl55lzSRKPe8cP803TcfUd/0dM6ZbTboZjOybOAnIrbnzhhL+b71YfvBB0DnLf3EUdXVd9s
	INUNTi3Q6PbnyyqKJlDOYU5ZUqfZFvFI3pSUmoXUpb0SsDFeh07QEEJri7U7amS8yuFVrkPssxq
	2YiXqqf3ihF83iiDpVtwg1sKcRJEHNUIkdixo1tJJCQ4S7cU
X-Google-Smtp-Source: AGHT+IGVJsaOES3D6e5IgzEgtMMcyBt78uD5r1dUvwmlCbFQdHU9CycZp7wTmKosTDLuCPhOfc8eNw==
X-Received: by 2002:a17:902:e812:b0:211:e812:3948 with SMTP id d9443c01a7336-2242850b42amr315559235ad.0.1741780574197;
        Wed, 12 Mar 2025 04:56:14 -0700 (PDT)
Received: from localhost ([157.82.205.237])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-73699da011asm11973015b3a.84.2025.03.12.04.56.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Mar 2025 04:56:13 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Wed, 12 Mar 2025 20:55:55 +0900
Subject: [PATCH v3 1/6] KVM: arm64: PMU: Set raw values from user to
 PM{C,I}NTEN{SET,CLR}, PMOVS{SET,CLR}
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-pmc-v3-1-0411cab5dc3d@daynix.com>
References: <20250312-pmc-v3-0-0411cab5dc3d@daynix.com>
In-Reply-To: <20250312-pmc-v3-0-0411cab5dc3d@daynix.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Andrew Jones <drjones@redhat.com>, Shannon Zhao <shannon.zhao@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devel@daynix.com, 
 Akihiko Odaki <akihiko.odaki@daynix.com>, stable@vger.kernel.org
X-Mailer: b4 0.15-dev-edae6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_045616_691199_1000AAB0 
X-CRM114-Status: GOOD (  12.29  )
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

Commit a45f41d754e0 ("KVM: arm64: Add {get,set}_user for
PM{C,I}NTEN{SET,CLR}, PMOVS{SET,CLR}") changed KVM_SET_ONE_REG to update
the mentioned registers in a way matching with the behavior of guest
register writes. This is a breaking change of a UAPI though the new
semantics looks cleaner and VMMs are not prepared for this.

Firecracker, QEMU, and crosvm perform migration by listing registers
with KVM_GET_REG_LIST, getting their values with KVM_GET_ONE_REG and
setting them with KVM_SET_ONE_REG. This algorithm assumes
KVM_SET_ONE_REG restores the values retrieved with KVM_GET_ONE_REG
without any alteration. However, bit operations added by the earlier
commit do not preserve the values retried with KVM_GET_ONE_REG and
potentially break migration.

Remove the bit operations that alter the values retrieved with
KVM_GET_ONE_REG.

Cc: stable@vger.kernel.org
Fixes: a45f41d754e0 ("KVM: arm64: Add {get,set}_user for PM{C,I}NTEN{SET,CLR}, PMOVS{SET,CLR}")
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Acked-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/sys_regs.c | 21 +--------------------
 1 file changed, 1 insertion(+), 20 deletions(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 42791971f758..0a2ce931a946 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1126,26 +1126,7 @@ static bool access_pmu_evtyper(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 
 static int set_pmreg(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r, u64 val)
 {
-	bool set;
-
-	val &= kvm_pmu_valid_counter_mask(vcpu);
-
-	switch (r->reg) {
-	case PMOVSSET_EL0:
-		/* CRm[1] being set indicates a SET register, and CLR otherwise */
-		set = r->CRm & 2;
-		break;
-	default:
-		/* Op2[0] being set indicates a SET register, and CLR otherwise */
-		set = r->Op2 & 1;
-		break;
-	}
-
-	if (set)
-		__vcpu_sys_reg(vcpu, r->reg) |= val;
-	else
-		__vcpu_sys_reg(vcpu, r->reg) &= ~val;
-
+	__vcpu_sys_reg(vcpu, r->reg) = val & kvm_pmu_valid_counter_mask(vcpu);
 	return 0;
 }
 

-- 
2.48.1


