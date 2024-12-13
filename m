Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C28C5E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 15:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WIAyRklPQmqf9KZJxMUGFpriShtgf5N1bsq1t9wgGwE=; b=yn8ekDQtU1t6pZGUmlKJnameCa
	+sclLDtmAUeofS+WgopFpiWvAKPwgCoI6XydUpmttL4h+gxCzIZEbZEb0+QBF3ENga7fAJPJCugUx
	/GtBW8snt8ImZ7L9f5YDklC8guGkwnvsVl+DHsQuq0OVEdQ+UKlBJfHG7gMzBnSolNp3T/djPetuA
	SG57k8WFPiPNTmgX96GttRdzgc0cSRQl61XyAJZ0mVhFdlrx3YUyey+TxRqf5OLeeciC0h2pFWpv6
	S/mefifYtatfIBt/HVKXhfS3HRRjRDr74wQ+GUBCivL7h2kRdvlIMOw1Rh2jdTatxuwHC1P2UO04K
	2ye+Q1+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM7Ei-00000004D53-2tGO;
	Fri, 13 Dec 2024 15:05:48 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM77X-00000004BPg-1SQA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 14:58:24 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5d3d2a30afcso3134609a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 06:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734101901; x=1734706701; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WIAyRklPQmqf9KZJxMUGFpriShtgf5N1bsq1t9wgGwE=;
        b=Tqgi5AdZOZCeI23baBo9BSwRljODzIjq32TeXpPbw4h2dyLUNbUYPM+oh35uw+gJEQ
         F92ZfvAowVW+5rjrSXrvYuUuMJiUYP3fF31ljhn0uE+ffkVJDs0/RMWxwGV4swFW28Gp
         yW87TnZXKESc3PO0SBuoY2B+Czn6B/w9G5jAVzzjXzxj/PYJnM+h9BH6L1fCnmrxAilN
         aTuyXbguHL4d6wQG3T8b9XDsAI0Xlqx3X1o5FY9MqbTFfD1ODEJXludN7ym3gD045Z01
         Z1EcwHump6oc3Pf76JWUnQr/T8UlVECUjPC+O8yw6KkzDRCXgBWDktvUbZi5PocGY+sw
         +2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734101901; x=1734706701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WIAyRklPQmqf9KZJxMUGFpriShtgf5N1bsq1t9wgGwE=;
        b=LgPN5+YpobOHesDsC2AOxBj7PW49++2vIh3FUWPgqSFrF1lHN2QBfFuD16oPdRZjUM
         b+MPcEnvlWYG6au8H78QL44y68IpZ/gIaDDU8IJ7C42h79O6sqzcEOMJ3EopY8yjQ1OF
         IYj5G4u7Q2JOjyQUhF2SsiHhHGzoPXio6gOWWb3s8rkseGOuFaEW4g08nDdTC6lNkaUC
         E7blMm3mOj63yH3z8nJiUaTYEdt/vZhgNYM6nMhcOloAk4GlCFRJKc2/ZcTh4SnW8Lfc
         66DhbmF/SZmMJqxrHWvWWiiNEq60Rl7e9FNYhBeaYRFJvjY2XOk7jtmIz9vjDWDShFTv
         sC4Q==
X-Gm-Message-State: AOJu0YzptjyZnetTJS6z9xbn+7NyW2tFK9wzoI0nDO4vRpIiR+wg7cDK
	NKoujLVJcV9tknYDz6msH7cnI+uhJdVpVAIgksZcAZ3jnadhfRpSfOqdldkT
X-Gm-Gg: ASbGnctcYxyT00hqSKumro4J7TSKTkAswgkpKR6AmW687ABnUJhWsN+2Og+N0E51o3W
	7YW4Sivh61F/tUO6yvWpXQoXg6n4MswmN1GB0rorY3UtQ2C7CrWnRQPLkzW+dVZ11VADFdzDDcK
	rZbwSBmpm2uY+4fqPfY5RzFb6JITS9n8c8miL4foQo50mgXZBPdFKlXIrx6gYI8dmACl7X4gpKl
	Pb35Cw6fps9ceCXA6PtCPepWI2MopcJUslsc3P3w65GcDJb99T5jA7/xP6rcjTS1A==
X-Google-Smtp-Source: AGHT+IH1tqiOuYhFc9ioeNHPkf8qQaZvXIjpk64aKZaDXNtayA3HfPmpe9Y22E4UKaBziVSZVldg9g==
X-Received: by 2002:a05:6402:3890:b0:5d3:cd85:36c6 with SMTP id 4fb4d7f45d1cf-5d63c3ac2a0mr2656510a12.24.1734101900740;
        Fri, 13 Dec 2024 06:58:20 -0800 (PST)
Received: from localhost.localdomain ([46.248.82.114])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3cedbb8fesm10048424a12.22.2024.12.13.06.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 06:58:20 -0800 (PST)
From: Uros Bizjak <ubizjak@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH 1/3] KVM: arm64: timers: Fix percpu address space issues in kvm_timer_hyp_init()
Date: Fri, 13 Dec 2024 15:57:52 +0100
Message-ID: <20241213145809.2918-1-ubizjak@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_065823_382578_D2A1894A 
X-CRM114-Status: GOOD (  12.71  )
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

Cast return value from kvm_get_running_vcpus() in the __percpu
address space to the generic address space via uintptr_t [1]
to fix a couple of:

arch_timer.c:1395:66: warning: incorrect type in argument 2 (different address spaces)
arch_timer.c:1395:66:    expected void *vcpu_info
arch_timer.c:1395:66:    got struct kvm_vcpu *[noderef] __percpu *

sparse warnings.

There were no changes in the resulting object files.

[1] https://sparse.docs.kernel.org/en/latest/annotations.html#address-space-name

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>
Cc: Joey Gouly <joey.gouly@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Zenghui Yu <yuzenghui@huawei.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/arch_timer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
index 1215df590418..a13bb9e8dc19 100644
--- a/arch/arm64/kvm/arch_timer.c
+++ b/arch/arm64/kvm/arch_timer.c
@@ -1392,7 +1392,7 @@ int __init kvm_timer_hyp_init(bool has_gic)
 
 	if (has_gic) {
 		err = irq_set_vcpu_affinity(host_vtimer_irq,
-					    kvm_get_running_vcpus());
+					    (void *)(uintptr_t)kvm_get_running_vcpus());
 		if (err) {
 			kvm_err("kvm_arch_timer: error setting vcpu affinity\n");
 			goto out_free_vtimer_irq;
@@ -1416,7 +1416,7 @@ int __init kvm_timer_hyp_init(bool has_gic)
 
 		if (has_gic) {
 			err = irq_set_vcpu_affinity(host_ptimer_irq,
-						    kvm_get_running_vcpus());
+						    (void *)(uintptr_t)kvm_get_running_vcpus());
 			if (err) {
 				kvm_err("kvm_arch_timer: error setting vcpu affinity\n");
 				goto out_free_ptimer_irq;
-- 
2.42.0


