Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 450FAC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 07:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rAMd6rGhip9Etdi0DcL12HaRjFlmNQeXSBT7tbE4ZZA=; b=QK67PUjWu+hK1ngqeBmMPNnrmm
	OjF0K7o8a1tgqKDCTzpxCir4PMtFBRxKn03v5fYhNj2qmqOzkLmUpyCkdgXfQ8V3cezp7AyJYSQa2
	JsizzIlMalmNK6DzELfdzIEDFS12tLahfub3UaC+X+32Jyb/sUqfQfGjmoveTk/K2ArtxgtEO/BPH
	k44PKec0Vf2qMZj3BJ9h/lVEceV0l6q2xT1rY8xfcJboh+mZUuoTYsPNasaCGAMIRWmsrkQ25CnLS
	3lVQUJeX0VnV+emedsfJlA71Lfjm6f7UCadlKO+5vLTeAR7vzUCToe2DQNJv4psLNLucqGK5MUDVa
	1dc+Pusg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tscZF-0000000AHf1-3evM;
	Thu, 13 Mar 2025 07:01:21 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tscW2-0000000AGxm-2C5n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 06:58:03 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-22359001f1aso14744495ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 23:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1741849082; x=1742453882; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rAMd6rGhip9Etdi0DcL12HaRjFlmNQeXSBT7tbE4ZZA=;
        b=VIPEUNhegCXRKCZj/ePqrH5FOhskGl53WTXqn+66EYJhj+U8sHSILONUHgD8xVVGT7
         0RxzKRP4PtEnawqEstQ6SSnmLosgQQbwW3UhSqte2sYlQO+DLO+AhOrLLrBL8vakpJJn
         cVHYjiPWoi9+5j3jNa84ySPCdeFo+QlMLI2vYog4yaNFax7nhPALw2XaHuBq4v8narDI
         02FuAC1WDNK/OF1fRnLmh9QZ5ET4AgKmmLs75gxp5cQvdPySXyVcfXY4wlaaPAbUH70i
         4M2GKOGU7TtWxOkbeIxsdtxcUkeVEbinfp20FEgWCluj4yK2zogmhh3RZvqPVbFSwODl
         amLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741849082; x=1742453882;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rAMd6rGhip9Etdi0DcL12HaRjFlmNQeXSBT7tbE4ZZA=;
        b=oYCLmkPx6hz+wxQ7VthpyWUmX6nJhaG+DEoyDqhTuFYFmASTNw3QRQiE3zowyX2YZB
         +JBdVb7H77CFX/XZo7QELi85N/J+wXfN204TsC80vhSskyYfqOff2RgEhX4Hh5Q52Y1k
         0YMryW7ViEF6EC/z1WjYjkLIIe/ZJk7jSEmxcPk7PdzftRURhh55n8lYx+26/528sSck
         +aFQXa/u65MA93qb0/gBOZUyLffX+FtoHaJu98iyo5Uy+e4nv13K0wgnD1AUE5xDmOdH
         plcqDkgILKundFZSVh4RZ8il7ImF1z0rEZvAMZzdkEBOzn6vs8Zm7no96C1w3zi5dVw4
         GmWA==
X-Gm-Message-State: AOJu0YySQMfxV/9h0Sci84UJYOErzq7N8byHYlxcBK3vLAmP6NXYE7kA
	+y5A05/rPHE0mbAQJuZ8nJkrtayBFCkq40aEZRK5YmZthcmi7fSwds8IeUY3s3k=
X-Gm-Gg: ASbGnctGREOj7FgRLJFrKcKmSP14qV0OTqifZ5U9ZZCx+GDbXcn1of4RG8+/RI2GWm5
	iLLQ8pr/8PMhoEUbmtVZfWe6IeATL5rXAnirwMDynMqJRH+gdV0x1qj7q23xYISQdmM7mSU6Bsp
	3wBjLvmCnmiA5sMnZF5aM3zDEwSpUaljcGAFPt6CNOXOenPaMJBVo0No5i42BjYlza6XD91Rtm5
	5laiXHp0kjms2E6gR/9XN61/uzAFaCJdQn43R+tlihdiFs2BYlG4YB2afY5RfRlPJzHtm1FH3mB
	863VBxrmINWtsrLjx6biVt/o42eVvaMtPMqrdBNYM1GE09+0
X-Google-Smtp-Source: AGHT+IGCLVrEGNjCO/QnspZOy0VKIly8ZUkVAApjFMGze7gowWxFFi+tM448yykvGdA29pKzg5pogw==
X-Received: by 2002:a17:902:d2ca:b0:216:3d72:1712 with SMTP id d9443c01a7336-22428ad53e6mr379581645ad.48.1741849081724;
        Wed, 12 Mar 2025 23:58:01 -0700 (PDT)
Received: from localhost ([157.82.205.237])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-225c6bd7bb4sm6378025ad.237.2025.03.12.23.57.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Mar 2025 23:58:01 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Thu, 13 Mar 2025 15:57:42 +0900
Subject: [PATCH v4 1/7] KVM: arm64: PMU: Set raw values from user to
 PM{C,I}NTEN{SET,CLR}, PMOVS{SET,CLR}
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-pmc-v4-1-2c976827118c@daynix.com>
References: <20250313-pmc-v4-0-2c976827118c@daynix.com>
In-Reply-To: <20250313-pmc-v4-0-2c976827118c@daynix.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Andrew Jones <andrew.jones@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devel@daynix.com, 
 Akihiko Odaki <akihiko.odaki@daynix.com>, stable@vger.kernel.org
X-Mailer: b4 0.15-dev-edae6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_235802_584110_F57D8669 
X-CRM114-Status: GOOD (  11.90  )
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


