Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD69CC28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 13:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TCAwKKa1hp4qKIGSTMOyXPQD5trWA7N2WyBVQxGWCbk=; b=q/Z61NVNquwI7Yb/0gi0xjSlyC
	Wd7T52UKJNyPI2PuyTUmCs80rSjfVQ3597zdanCwbuMVcGerrAXgVF9ZLCuBnVxJ50nGuaOfdrNj3
	Gg5wXqedus20jczp6J3RG6xDeZR3eKkSShFIHhe9nn8AH6pfkbNAIBGimaRRKWN53OJEfaRcttSNI
	BiIWYBzAcKLZRqOBlZEfIDS0KsRfoMzALGCRfP0qBqjzyHyaf1o/PuL2+2q4jvZjvSpDEZ2qPa25K
	TmR5TDeScHKRiHzLh9ZdANcBrBMhC5dQEUFmgd1s4VS/ePR961SbQQV9diJ8dubyi1E9EjgE5Vq4+
	s9wSkJmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsLif-00000008UCb-420v;
	Wed, 12 Mar 2025 13:01:57 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsKhN-00000008KRR-3CUO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 11:56:34 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2ff784dc055so9089504a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 04:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1741780593; x=1742385393; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TCAwKKa1hp4qKIGSTMOyXPQD5trWA7N2WyBVQxGWCbk=;
        b=nG12mpDgMiGss7WEdVNfURP/1wJDz4+AhLp/Zg2Ib8r0BNMo2aM1AKP9+nyTDB4nfp
         BpTsWx2rRISCnkot/nBAU/h8I5L5jQr38apDfrVtgTX2rXo7QIFwD0Lfp5pRFF7Kvd3U
         fu0e91Ol4QvcEqWCfnxRxX117TnCZHgWbUfpUTVX2GFArlaJAf2TCDDZDeAb6p52/Ia9
         jjPhct9Ay9xf2a+yGydyyc5RVL0xTC/jdwVd1gCnhHMWaySV6VXZX3Mn1A/RJZQuB1u9
         SX33hjMcvxh3dXqJfhkFmvJXazYEZbLeWnq1zhvXK9P5RPGhUFLdhb3VCNXkz6yJkPPm
         VZfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741780593; x=1742385393;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TCAwKKa1hp4qKIGSTMOyXPQD5trWA7N2WyBVQxGWCbk=;
        b=wRvAaapofgMv/aPOURpt8h8DDBhpjF5IIuOVXGqqcoWQ+wAuEFhLqy9oRlvUaEjKX+
         JRouNw9oBMCRwththy/8jm+f7j7JNB/UFpNEk3+zkPhS+V7trtXxj4xV+XB48yF/aEbH
         hORWTyJrMou4oVQIIkK+89+57Q3XeMEUsbWRDwrnCkmsFU4aNgobYkqsJ3wp4T1MAlI1
         H5uM7XWzA1RnaCiunFZTFvxAXD/Wu4YyeiYixvpyx71M24nir2QK2hiDUwXVkAJwwakB
         JQJGoFoRzZTvei/m2RCL2Exew33KigM95Fe4v9T5kfvEig5TkUPzZ7aeu5y8fflis+2U
         phVQ==
X-Gm-Message-State: AOJu0YwXgnoLJZdwENY3DwMaEr5sDogcsrTsnVBfOSR/g6gzziR4hyE6
	kxSUtNDB5vozsSSAmXFGFTSca96RFksMKzqFHSo0WZLEehF6/VXZHEQIp1nEno4=
X-Gm-Gg: ASbGncs/+6HmqOiwVFVOwUpsHPl0tVVIwBW9jPQoOU0NmXN9qL7Z47fOaIrG6WOTeWY
	xKS5td7IG6OKm6KKTy76105hIdNLFAX8QhSVEikfD+/eRkHEswbmzzC0nIHG1v3qXLci0JFZ3ip
	rqhTORfzfwEGYwRVD1pnEHo9mWgoaCqn3/aXiNfgnnXk3vjb/Nlx+Z/UuqSV2Yw2vow4abxSHyV
	JMvL3yb9I6FG9eldhyS8+CmvmoVxn6E22DRh421sX4n5pGPKeFCufdgjQ/Ba9rRM6Zp42oets0Q
	QHvMViN52MqVh6czEhyR2LJ1XLL7y24Ibng+MYwlcAB322Vm
X-Google-Smtp-Source: AGHT+IEt7ftF0+X9PEZlO2xjYhcH13J+1KUiYMwfGTA62pbfX70/qK8tdqWOcbGMQp5ETZdkFMGsvQ==
X-Received: by 2002:a05:6a21:6e01:b0:1f0:e706:1370 with SMTP id adf61e73a8af0-1f58cbdcb9emr12506243637.35.1741780593100;
        Wed, 12 Mar 2025 04:56:33 -0700 (PDT)
Received: from localhost ([157.82.205.237])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-af2f01909a6sm9911068a12.7.2025.03.12.04.56.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Mar 2025 04:56:32 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Wed, 12 Mar 2025 20:55:59 +0900
Subject: [PATCH v3 5/6] KVM: arm64: PMU: Call kvm_pmu_handle_pmcr() after
 masking PMCNTENSET_EL0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-pmc-v3-5-0411cab5dc3d@daynix.com>
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
X-CRM114-CacheID: sfid-20250312_045633_808630_A830D6A2 
X-CRM114-Status: GOOD (  10.24  )
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

kvm_pmu_handle_pmcr() expects PMCNTENSET_EL0 only contains valid
counters.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 arch/arm64/kvm/pmu-emul.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index 78cfa8b0964d..2d19c6048091 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -831,11 +831,11 @@ void kvm_vcpu_reload_pmu(struct kvm_vcpu *vcpu)
 {
 	u64 mask = kvm_pmu_valid_counter_mask(vcpu);
 
-	kvm_pmu_handle_pmcr(vcpu, kvm_vcpu_read_pmcr(vcpu));
-
 	__vcpu_sys_reg(vcpu, PMOVSSET_EL0) &= mask;
 	__vcpu_sys_reg(vcpu, PMINTENSET_EL1) &= mask;
 	__vcpu_sys_reg(vcpu, PMCNTENSET_EL0) &= mask;
+
+	kvm_pmu_handle_pmcr(vcpu, kvm_vcpu_read_pmcr(vcpu));
 }
 
 int kvm_arm_pmu_v3_enable(struct kvm_vcpu *vcpu)

-- 
2.48.1


