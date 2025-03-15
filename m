Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 978FBC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Mar 2025 09:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fVQeHb+cCKo9FI3oCd5KZj2+ztmvI+IS1H6dV0Bffso=; b=V9K7WKM0+wS2F1J3bfft5mNbYA
	qYE7exY95WzHYMpGwfuKpk1MBDf4NmYhelgO5pKw/k07B1X23aiV8+TKGkItaN8hd+p7xGDIM135+
	ikILWgACJ+BMEkmbEyMa3upAiW6JPkyzcQAMSPWAwKJclt6+QpLqXgDnOSx9c5N7fQw5EFpZr1xX8
	YDhCy8CX+2Ntd7XnMn+SbIKkxUKVX5CU242st2BwIRfMq6hNA5BQTOC39uNglYpVCuyRI2JOq4ZP0
	zrBNjGrDplDrv13A6fxiD/MukGkchxrXYBU11IkVVzPfYbEMaW1Pe4Lhvse3ZZsdrcYUm1tx2xUTc
	lHjPUNTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttNcn-0000000G6Kw-3gt6;
	Sat, 15 Mar 2025 09:16:09 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttNZX-0000000G5mC-17MH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Mar 2025 09:12:48 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-22359001f1aso73397935ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Mar 2025 02:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1742029966; x=1742634766; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fVQeHb+cCKo9FI3oCd5KZj2+ztmvI+IS1H6dV0Bffso=;
        b=BjAM0eABzB3udYU4OKuTO69kjzkmcZo8Hqor9zLtg6yhBV5hb03xO6uSwEkD36UZ7O
         jc7xw/QYbHWdM3wxvm2e1COURztiUWGkV8ZX1ErID6rNbQyEYqDjszeSumj8QHiCn6aA
         BRDdY8kGH/Iw3lSpiTxwqtggaf0MC9DiQDoB5U5JquCix4GYCl3MQKeVCkJfmB5u3iUc
         wKfrnjYSvU1rjTY8UNNWV48GoZAyD/jcP6kgKKqJjg2y2wt2P2QGl6Q6czMoOqES3rGP
         exMM8uY9B2z+oC9fWfxqdOWeasfNw7gN/Gw7Yu+C8o2N/6dUttgKZYcS/hPusT6t2qO/
         TQ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742029966; x=1742634766;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fVQeHb+cCKo9FI3oCd5KZj2+ztmvI+IS1H6dV0Bffso=;
        b=ENd25DIpVUIoMPS5dwDuWL4VITiJCFriXhJMsRLZ8QWP2CCZmVPLbjBOYYwbtYCIie
         CHTR2K+Znm5Id11JRe5PdqUJkOjwcTteQuee5OwFnMpCNndEekeexpOOzVgqqo4wvjff
         Ukyf6P0ZGrq8a/0BTgaEYirXRMgf6q6e6q9DPVtlVKlbXhkYGXNsfYj9pBSF8Ron2tfz
         nHZXuwIfZPXDa8tHY05DYe3lR2v8CbNFx6lySVVq3soCwcYPpbXSbMpbOptkzaUH8177
         KlvSZotd1Xr4xzg+nzpuNSWjuYS9Vvzuj96cv/3wRuw5TX9+3jc6ItHB+An6PqtBsoyQ
         vtCw==
X-Gm-Message-State: AOJu0YxUuxMvLQ5qs8/Y5K8rWQoKbA493hZcAASIt+yrz/HPUteZqTlF
	ktZCkLOczzk5RGUH0Bn2NVSyJcSPZwFsc1gWngrD8Svr5Ui3kcGFIRgAyJEHYsA=
X-Gm-Gg: ASbGncsmsop3LYCpktAdzIV7azGHe+klu9Jy71O/anXQWyW9W+LHj8OYnyQXSmmkoAv
	CiRpDMkTloitwRTl0u0OGDJJLV/ixrx95C7Ag2rnuphM8PObmZdwMxSnF+kirmn97aXfISKZTNN
	Pwqd58OqIWnQCsCB4F6XBzz1vH+yso+/1Cb2suEhHnhErtTWV9Nx+Rk8Xs5zpVdAgS+oKUKQgpv
	3fPcjuauwtjKs4hUehg97FHqfjKTDPB0XKoLntu9avXVTH54M9scBWkSbTGyWdtJVq5CiOcwd7k
	6Km4daGM4NKp2TlbRLsyrcKlX8xi8wlXQ/KrroIOjGF7/k8D
X-Google-Smtp-Source: AGHT+IGQ8Gz6JOShy4dRcyVD/SiQ18YggMiPkdBJ/XbTFh26anmZdWe+vf8X98ZKiGLO7S3+Q3G5dQ==
X-Received: by 2002:a17:902:e750:b0:223:90ec:80f0 with SMTP id d9443c01a7336-225e0a6b3f8mr76818965ad.22.1742029966450;
        Sat, 15 Mar 2025 02:12:46 -0700 (PDT)
Received: from localhost ([157.82.205.237])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-225c6bd4a8fsm40925235ad.234.2025.03.15.02.12.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Mar 2025 02:12:46 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Sat, 15 Mar 2025 18:12:10 +0900
Subject: [PATCH v5 1/5] KVM: arm64: PMU: Set raw values from user to
 PM{C,I}NTEN{SET,CLR}, PMOVS{SET,CLR}
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250315-pmc-v5-1-ecee87dab216@daynix.com>
References: <20250315-pmc-v5-0-ecee87dab216@daynix.com>
In-Reply-To: <20250315-pmc-v5-0-ecee87dab216@daynix.com>
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
X-CRM114-CacheID: sfid-20250315_021247_310348_77713477 
X-CRM114-Status: GOOD (  12.01  )
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
 arch/arm64/kvm/sys_regs.c | 21 ++-------------------
 1 file changed, 2 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 82430c1e1dd0..ffee72fd1273 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1051,26 +1051,9 @@ static bool access_pmu_evtyper(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 
 static int set_pmreg(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r, u64 val)
 {
-	bool set;
-
-	val &= kvm_pmu_accessible_counter_mask(vcpu);
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
+	u64 mask = kvm_pmu_accessible_counter_mask(vcpu);
 
+	__vcpu_sys_reg(vcpu, r->reg) = val & mask;
 	return 0;
 }
 

-- 
2.48.1


