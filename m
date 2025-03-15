Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB0CC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Mar 2025 09:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/FbB5lDaUNvpC7XuDXTEGvGqSXp+ZEz8J1AwcsET8uY=; b=Kbp/I4aYZPqzYxzpdOEjp5bN3C
	8WfyBbMF14kg0+ReYIJRYgIy48cEnygidL3qlSVBVLE0LUG10YaXUqfpWHL4PBV500olARqs0yfxx
	9rHAvyUAkr+3VddGqTW/RR0GF8cqHp/mn8odCy+lrRZpg1RbPhSmGBDcTnuySGCz28p9TXjcMfvFH
	15CEYMlMsFfyJyVyRP8YOefmugbvgcXCB+pVU+/CMvllApTuRd+AgB7ckUC4zmvc+GUtKvJRCL+Er
	MSEiT8VF05aWDN6TU41ad4xUsrBbVJ4o8KlwpkQDJ6APtzJmFvN/aGsxY25aYEmRNTsBdVc+z+Drw
	iBITgWAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttNhk-0000000G7Xv-1Qr8;
	Sat, 15 Mar 2025 09:21:16 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttNZl-0000000G5qZ-0Qtj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Mar 2025 09:13:02 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2fecba90cc3so1157978a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Mar 2025 02:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1742029980; x=1742634780; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/FbB5lDaUNvpC7XuDXTEGvGqSXp+ZEz8J1AwcsET8uY=;
        b=i0AUuzlzuqSYBjuxVm7U/pMPyVe1CkcjXULL7Eyx78LZkVtMoL5mxzM0n5Gkq9R9oF
         aj7bfpkRg9CZTLbPlMtGZRe7tr/UroE1A/6GQXSGN/SWo2wfJbW3shIR3PNEWGLEaAX9
         Zj2w9MGcjYEFbvFVwU31yF9b/nbzHEqHlw6HhC7IcoM82X111ad50MIeXsLl8uFyn2Ud
         JiyafRnP6rG/lcsWBmqjzRFSoTGlCZvVvqaxo0Q/P1ye4JU/z1gKWv1Vrt5jey6PujaA
         YfnpforKoiDfQXnVZfdh9Y61Gge3dUYHhuBZbQ8ZshmaHGgOgJwWqZ1JxRJvRW3nYpv2
         jrYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742029980; x=1742634780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/FbB5lDaUNvpC7XuDXTEGvGqSXp+ZEz8J1AwcsET8uY=;
        b=qL+JzOeSE6o1/GUpFaOB4GGkrNYnnydXH74sTXZOBFkVaAkOI0p+j1fKej14Ulwb7Q
         gdefhx9S2wlm9cVoyGpaKuljXFdEoy9FwX6kMXisqO8mGGPRSsrlKOA2Y5JGjPZXdTa5
         /hsPZbqfjGHM3qcQNrktrOQvckydKmzRj+lZ52LsC8sYAmDl6wmlQyAHJIW+SlHaMyUF
         MEhS/C8CSrqEjS1gjvn7qWKGSGQViJUqlorkI+luGczvVBfoPyvAC45FIpcNoKu3bCiC
         210f6+HcmORrQsGJt/Wr8GH6rZJLK/0dcaoVmwPeRYHjPOFMnT0U9xkEPQ5/VFnJbiKM
         yhtw==
X-Gm-Message-State: AOJu0Yx+QbtDB5+PLuoD3meVgR/TDI5DwBUSKgT/hGeDFc0OcS8vL1gk
	5IfuP6EHkS6vIJBf8Vj7U+VEmABED/GmTsBJxS76SuwhewQ5YZ4Y+NTyTnD/DtQ=
X-Gm-Gg: ASbGncuCb9/Qb8oy+iYBhN9Dj34cfKlyOlIwxNFSCfJSCj15MRBRI+cBdxnXeskMoZz
	0Im70bhEZZINdGcQ6v9nzIOvSl0hpos/07ytuuEIahum0JI+soMxez6czEdY/kDsuOKfvjJH4r7
	Btu0JyqDbScxYq96nxxuGFEx2TXkm6lcWiitL+k4CKcrQgdNEryzOJT8zvrL+UI51ko1FQmlv9t
	Uiiq9fmHkCuOUjBmfZpFrDToZ0mSfEQY0zj4L3M6YKEqao5kOaEA0B/BY+h6SfCj4vu3CN9GO9W
	On7IInRrwyWKsRFm629ga7CBT6fn3jJDK6S9H9mCDp6jk2XDGYtVrPYZ3qk=
X-Google-Smtp-Source: AGHT+IHaYE3C8lcppzvNgVq++/gQW7jqz6vA6hT6Z68AyNtCpi+E5uRU4W2Fjw9r55KOhScD/9aGrg==
X-Received: by 2002:a17:90b:4b83:b0:2ff:6f88:b04a with SMTP id 98e67ed59e1d1-30151ca6de6mr7547868a91.15.1742029980303;
        Sat, 15 Mar 2025 02:13:00 -0700 (PDT)
Received: from localhost ([157.82.205.237])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3015364ec2bsm2630846a91.46.2025.03.15.02.12.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Mar 2025 02:12:59 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Sat, 15 Mar 2025 18:12:13 +0900
Subject: [PATCH v5 4/5] KVM: arm64: PMU: Reload when user modifies
 registers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250315-pmc-v5-4-ecee87dab216@daynix.com>
References: <20250315-pmc-v5-0-ecee87dab216@daynix.com>
In-Reply-To: <20250315-pmc-v5-0-ecee87dab216@daynix.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Andrew Jones <andrew.jones@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devel@daynix.com, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.15-dev-edae6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_021301_147784_62346B7D 
X-CRM114-Status: GOOD (  14.18  )
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

The usual register writes and reset are already handled independently,
but register writes from userspace are not covered.
Trigger the code to reload the PMU configuration for them instead so
that PMU configuration changes made by users will be applied also after
the first run.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 arch/arm64/kvm/pmu-emul.c | 3 ---
 arch/arm64/kvm/sys_regs.c | 4 ++++
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index 593216bc14f0..8e10124a7420 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -917,9 +917,6 @@ int kvm_arm_pmu_v3_enable(struct kvm_vcpu *vcpu)
 		   return -EINVAL;
 	}
 
-	/* One-off reload of the PMU on first run */
-	kvm_make_request(KVM_REQ_RELOAD_PMU, vcpu);
-
 	return 0;
 }
 
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 4d1ef47d0049..727579acc7f6 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1070,6 +1070,8 @@ static int set_pmreg(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r, u64 va
 	u64 mask = kvm_pmu_accessible_counter_mask(vcpu);
 
 	__vcpu_sys_reg(vcpu, r->reg) = val & mask;
+	kvm_make_request(KVM_REQ_RELOAD_PMU, vcpu);
+
 	return 0;
 }
 
@@ -1228,6 +1230,8 @@ static int set_pmcr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r,
 		val |= ARMV8_PMU_PMCR_LC;
 
 	__vcpu_sys_reg(vcpu, r->reg) = val;
+	kvm_make_request(KVM_REQ_RELOAD_PMU, vcpu);
+
 	return 0;
 }
 

-- 
2.48.1


