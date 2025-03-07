Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D54C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 11:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aFXBjMpQQucibqgokFHkSZnj9y5cZChrzp1Sa0fcrAc=; b=WmNR7+j040wpPL8AGj24O96QlL
	9sIJMC/Ej55234k0BigNnOAfc91e6Vghtt+gtBFZQYsmk2zK6A7tF1q4q6L7szZGTSdRaeRjfJoti
	cXJAj6B+JfPWFgEvUaElEqifywZFSGnJyHLoKF2voLYys28+snT51jJHx2jRJYuygU4/ublRSCtnS
	TiolAW1CbDECQpDSKZLak/5NrlbjL+nHovuyhI7TWz+qw09JpS4csOEi13icallmy0H6pwaJso8iW
	hbwHvn55D+2zMsZxlSWqUvcUoQNMuwR9CM1ERIGTn9KAv7YB5FlZYqk0Qg43yCsgYwhbkv6KzRgxO
	EUKxx97Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqVUl-0000000DyHN-0eHm;
	Fri, 07 Mar 2025 11:03:59 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqVMm-0000000DwnC-0Lvk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 10:55:45 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-223fb0f619dso32864555ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Mar 2025 02:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1741344943; x=1741949743; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aFXBjMpQQucibqgokFHkSZnj9y5cZChrzp1Sa0fcrAc=;
        b=m14fJ9wgje7+GGAE285xKxEKoSjPNpQ0AR2CYEqcGEJ3obHSfkTBk27vR1+YrizOWd
         pnmppsO5FFDJGtyyqq3VY9dloDmZsNuIMIdfJVrh3I8Xz7z4VoSCUmMvdlTdPdTV7CJm
         AUiU8yqTViGsvpjuO+YTeTAPejRuDJpD+qsZWErXm6aJwOxqMazNJih+XiNyAOuUPSxb
         ePEIIodq7QkFkq59tfiIUlvPjQOCXiHaUq1vdh8n2Lw7B2v6dQS2CyzIJxCViW9uRFpx
         Ljc/OBPOXZ7U/Nxatlbf5qnxKku/IxRo6MBv7gN+FYMEK/HGfTIN1nhHl0d8pRgYHeTl
         Iopw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741344943; x=1741949743;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aFXBjMpQQucibqgokFHkSZnj9y5cZChrzp1Sa0fcrAc=;
        b=fAckQjI4TVSvyRNWu38N9zM0ihNb23Kxa8VLQzpmszvbo3IsPrFvOMfqDLuZN0GWht
         jfS8F8ylCoYO9gSBYCczWj+uf2+5xbe5ydn8UPi/hP57uB9dW/nysnE9Or/Uw9mdi5AX
         Lu6BMoNwSGtzNDJeQv7i/jR2oN+fEtMpPxN9nSU9EU46Xrl6xz5+1DLayAKJ7XTrqipT
         iSCoEaCk2HoKSPTJCIDbu8lSV0EfQeMjM0VFc2eYVwcM8UYbEPZzNSGAkxXlD2FSgrkI
         QmXnlTkklZgI41UAUXcKgfjhZF3brkh9hlTa2NuQhcNTgXDgt+YTy3iU9ML+9dXf6cxR
         ZQag==
X-Gm-Message-State: AOJu0YwZh8y5ApEfQhE2Vdgm1LduQVtOAdwm22s8ni7zSV5NPBXz2NMx
	BipjHTAa5SDmOMdetUtdQ+akp1CKTOBzSHw0CQOj2Pv2ZgC6XJRFA7sbxYhkG20=
X-Gm-Gg: ASbGncvp0yCohfDhQuJBF52jr1nzJCZwPGZjD3GPSB/XCJ0UzGKJHOQgUkiIjOz3Ee7
	Tv3x8oXzF1wXtQm5mN7ggTgEH79EurcJ3cl0apHnwo27esGpvMvEfbPLPBSqp3CyrBP7/p9DrkC
	LClPuCs1x1vVygzgCZWnrAv5yJNF7jsmlrO6ZvQaPs+pAGccjd/vK2/AX9eSx7K+TeX2trgnS0K
	y4eBClLsPjchjJpIJcljqL3or+eXv7XHPzcRUlygjv1Tcd5nl9E/dmZDoESHtUE7hXs4PsT2b67
	WXjnwO0TPVpuqa48u+S9DBcJNQkYa6+eKR6L6VoG/LPtA5W3
X-Google-Smtp-Source: AGHT+IEoXfkwPsJZHGHUH2StrQHAqmGfaA3Jdeh6jSgOLkAwNCLg5rn0a7T5je10X9eqSxa+av8pdw==
X-Received: by 2002:a05:6a20:1590:b0:1f3:47cf:514b with SMTP id adf61e73a8af0-1f544acd2b0mr5322641637.3.1741344943258;
        Fri, 07 Mar 2025 02:55:43 -0800 (PST)
Received: from localhost ([157.82.205.237])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-736ab812cb0sm1257087b3a.164.2025.03.07.02.55.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Mar 2025 02:55:42 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Fri, 07 Mar 2025 19:55:29 +0900
Subject: [PATCH v2 2/3] KVM: arm64: PMU: Reload when user modifies
 registers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250307-pmc-v2-2-6c3375a5f1e4@daynix.com>
References: <20250307-pmc-v2-0-6c3375a5f1e4@daynix.com>
In-Reply-To: <20250307-pmc-v2-0-6c3375a5f1e4@daynix.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Andrew Jones <drjones@redhat.com>, Shannon Zhao <shannon.zhao@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devel@daynix.com, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_025544_133403_F8F00262 
X-CRM114-Status: GOOD (  12.57  )
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
Trigger the code when a user modifies a PMU register instead so that
PMU configuration changes made by users will be applied also after the
first run.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 arch/arm64/kvm/pmu-emul.c | 3 ---
 arch/arm64/kvm/sys_regs.c | 5 +++++
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index 1402cce5625bffa706aabe5e6121d1f3817a0aaf..04eb3856b96576fad5afc8927c8916ff9738f9d7 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -888,9 +888,6 @@ int kvm_arm_pmu_v3_enable(struct kvm_vcpu *vcpu)
 		   return -EINVAL;
 	}
 
-	/* One-off reload of the PMU on first run */
-	kvm_make_request(KVM_REQ_RELOAD_PMU, vcpu);
-
 	return 0;
 }
 
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 27418dac791df9a89124f867879e899db175e506..51054b7befc0b4bd822cecf717ee4a4740c4a685 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1162,6 +1162,8 @@ static int set_pmreg(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r, u64 va
 	else
 		__vcpu_sys_reg(vcpu, r->reg) &= ~val;
 
+	kvm_make_request(KVM_REQ_RELOAD_PMU, vcpu);
+
 	return 0;
 }
 
@@ -1322,6 +1324,8 @@ static int set_pmcr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r,
 		val |= ARMV8_PMU_PMCR_LC;
 
 	__vcpu_sys_reg(vcpu, r->reg) = val;
+	kvm_make_request(KVM_REQ_RELOAD_PMU, vcpu);
+
 	return 0;
 }
 
@@ -4276,6 +4280,7 @@ void kvm_reset_sys_regs(struct kvm_vcpu *vcpu)
 	}
 
 	set_bit(KVM_ARCH_FLAG_ID_REGS_INITIALIZED, &kvm->arch.flags);
+	kvm_make_request(KVM_REQ_RELOAD_PMU, vcpu);
 }
 
 /**

-- 
2.48.1


