Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C13C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 11:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=84BQ3xuE/YOejwCkRVmGYfJqvNZTn+GmxFcneIOkJqE=; b=WEdvfx3sDgCiwxsCoU4AWP07XR
	gKZppMkm7w3f0a2XO0WgXcs++KnZ2jYy1upEKhTrG/iv8V2XcjZoSv9IVYC2j+7VpOPlG3DJ6ZfUx
	EirSJ3I3Icw546z2Go6SfHvzGk5ZpSTM3rrjADzuvLGWyTV6Pm0/WwgasbvHJ0+H8qBEasqM6Ln/+
	/v50JigfRstNqesJ1GdbwuHRaRq8T3IhQr5QFXeI2AmiXHPWgy6lBmikUBKYHbyu7qZjCO3S2RH8w
	dCvnSI9zNy58GZmA1gEMQrlUl8rB92FFpxvO7L+KCs6xg56E5Vp8yrbNKtr1n2qlqfrF6fhEAd9eE
	/Kdil51Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqVWL-0000000Dye8-3l9N;
	Fri, 07 Mar 2025 11:05:37 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqVMq-0000000DwpZ-2euQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 10:55:49 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-223594b3c6dso29389255ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Mar 2025 02:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1741344947; x=1741949747; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=84BQ3xuE/YOejwCkRVmGYfJqvNZTn+GmxFcneIOkJqE=;
        b=NR3bKu0Gmj7f4LfrLSvU/juXx8HJxkgVKP8F+C1FR0EGnuhAQQ5QjjBBLhzY055bgQ
         aI5tNZSRyxCeNp/JyjL3Bk4SoxvODAv/bw95HuoMc5Jkiq7zqIPx3aVbuwMiyyYmSKeQ
         iu1Z4XI/rTb8FA79rKIEG/Aryq8kpdcYVHE0q9V8B5KMNWqK+UkRCIsiBsTHV1eFfsVq
         u3ataOja/Gu7Gf6syDvkOVLwR83YIBge7n7AXH9io623gevqpZoH2v/3TSKjMSbkl5Yw
         bNDDT3/S7mbvQV8gbveECHuT0uQKvKYENrhgKWG+VrHff0rYzbLpfVny/xgda2oXEtRB
         K07g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741344947; x=1741949747;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=84BQ3xuE/YOejwCkRVmGYfJqvNZTn+GmxFcneIOkJqE=;
        b=l+zxt8b3sCJ916WGXUgvN7y1vjvUPfjVaSjB/G1oT+HNreZUrNr8wfBL3tR/r4lLQe
         zJzZZRZmxTgkXcRaDXYA0oihk5LTc+cA5zIpoE653fe2gVnwHVULzm0eEzx/dKRyinHD
         5j1GsZbx7Pk8B4Y6dqf67mEloSjOLNQd7qBj/BExb5pmuML0GynSlVY14Rx2BkRAHe7U
         dqqWuqXHcwYK0rVTg3cVKrXMzuvKc6N0DSiVhteUQbGIkL0u6y0jqNJ1wWOQmoTsWq1x
         St09tIXNVJKcGQRsrpUSdS6Me8XzT51rGAunuu9xYIsQeGargR05lGqTbZDTMIw0+eaq
         uszQ==
X-Gm-Message-State: AOJu0YwrYGVxjpa6qyMURgMNU4RcJ+2t60gV+0dPy8+8b+67Iv+YwqQt
	siFdopUewoJlSyFbshGMuDrGlg9j6bRGiLTAAqtNQewqwZTFdJQJmeIY8XcASfw=
X-Gm-Gg: ASbGncsdUwy43QD1RtGR/sOeI9YfJQWC48390vQyeRZC5/N3VoKnAWfC1QTDhyPenPd
	j5Sgz2HSJhHC4ZHGccVaF19OsdK+D3iCd2BKzVcQ7vWorX02bST7xq97CA9KSckkUy4QLtKaq/Y
	v5XjhWTPszL9sRrtdbuWtKtkFu2KVzZA0gechC0v2JN6RrzepRwDS15ea+Gw8xBNnNhfmbRp0mn
	3tq8SU/0l1uOHNg3vy2mUPoecZ+Uk1OHhKPi1p0FUCAKHQ5zbD3xroTGOlsXsdXTVHDqwdFQ/Nh
	bulnSwfK0hyz8lBgX5C2Xr72b8iFn/rOCzN0uK/fJLdwHr4m
X-Google-Smtp-Source: AGHT+IF+CLimdfiOZ0VORULGUWByolFc/6pJXp6pWb1JSm9n2C2SEbnZP1Xs53CSe+DMcCSm/ABWvA==
X-Received: by 2002:a05:6a00:174b:b0:736:6ac4:d204 with SMTP id d2e1a72fcca58-736aaa0f48amr3972025b3a.11.1741344947618;
        Fri, 07 Mar 2025 02:55:47 -0800 (PST)
Received: from localhost ([157.82.205.237])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-736985191cfsm3016761b3a.145.2025.03.07.02.55.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Mar 2025 02:55:47 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Fri, 07 Mar 2025 19:55:30 +0900
Subject: [PATCH v2 3/3] KVM: arm64: PMU: Set raw values from user to
 PM{C,I}NTEN{SET,CLR}, PMOVS{SET,CLR}
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250307-pmc-v2-3-6c3375a5f1e4@daynix.com>
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
X-CRM114-CacheID: sfid-20250307_025548_688010_864CDDC5 
X-CRM114-Status: GOOD (  12.66  )
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

Fixes: a45f41d754e0 ("KVM: arm64: Add {get,set}_user for PM{C,I}NTEN{SET,CLR}, PMOVS{SET,CLR}")
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 arch/arm64/kvm/sys_regs.c | 21 +--------------------
 1 file changed, 1 insertion(+), 20 deletions(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 51054b7befc0b4bd822cecf717ee4a4740c4a685..2f44d4d4f54112787683dd75ea93fd60e92dd31f 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1142,26 +1142,7 @@ static bool access_pmu_evtyper(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 
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
 	kvm_make_request(KVM_REQ_RELOAD_PMU, vcpu);
 
 	return 0;

-- 
2.48.1


