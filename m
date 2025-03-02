Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8117C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 08:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=84McYKpkJJYqDhwKGbOb4J/jLEFuGbb2JLYOWqIz1bA=; b=J20JhXn8cAp4jjey1jGBZ6Lodg
	VOXpryMgnERxHGoWILUTtcInllMQzsl8Tugq93ya3w85dE0Ou5zS2u4kB8ge4nWd2WpXA2p/NwO0p
	5xcJwOvcptvpy355tEiON1c/YNMlT8F84OFVIwuynLFDmOB5cz1PSeN+6FbkiUhrVid9V4bbQ7ZeL
	l46Ahb8pbsIqX7vE3zU1vDRTnrGhRVd7XeW8ZQhKT+xMw5XshyhuAqqJxzpgJZMFAkJVirZS+DVH5
	LlQ6dR78lmkxhnpPlcWgctuQqgqtIqDbYzXpbu5IK7UiSt9hqiW2JtHYcIvn9D5TKmo+LzIkw4N1A
	qQAVaF8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toeTA-0000000FdSf-3jn5;
	Sun, 02 Mar 2025 08:14:40 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toeRc-0000000FdM4-3ar5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Mar 2025 08:13:06 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2fe82414cf7so6826209a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Mar 2025 00:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1740903183; x=1741507983; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=84McYKpkJJYqDhwKGbOb4J/jLEFuGbb2JLYOWqIz1bA=;
        b=WDd0k0YGnaAIffSVoKKwvaTB5FHLZ3JDwETATbNBahGKGBwpfouvleLOdReu9x/YKU
         Ol3Zz1xdmyo+RrCMn7XmvuEOaVUN/Up8ToYSt/yQV9ttRho7FECA1PPyl+3F+6ava2yn
         18YVkeOCtHB1sUc8QSE+5Vi9o+kSpHgdeav5Y7Z8dBDMqWFjurMS1XQ1/9cR7gDunlmi
         nPBWo98pZNo/hsIzPBq8xKVwtOzGmP7JADXPyOzOdDb0N0zAgaUMDTHzvyyeFweXKk7G
         KDX+KJKFjI/g9rAH4fLgU+P8XJA8x1SSm4TCIdKQ3+nbzqIBpXv05BaPsF7JIxyK2C6r
         +Vpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740903183; x=1741507983;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=84McYKpkJJYqDhwKGbOb4J/jLEFuGbb2JLYOWqIz1bA=;
        b=unpFvm5c6lZ8Zsj2V75VwumddfZcc8Ttjmz0XM+cLGvrxTFBSBiVjYOXGdyDkB1O11
         6tusaY+MLDzor36LwVJ5UGyH/l/H6Lb+068ZH58GG6lgsblNiXuF9fBv/hQqaYvqsp+o
         kC5mpXAUvx26wubZauxfLdnv/TOmnJmAqVm4tCwq8URvw+KnjzylvpKD81mkeQRE/1n0
         8ZcialCABpKIJpraYHJV2QsxmO4BvzJOANnHMIMUoxOM+LHn03rwpqhX+nk9+2YfyOiB
         t3FYjeOZT6x3Ta/RVvuHbLQk+KSAtRlpAs6IjimQwIBni70x1VtuEFdRvynN9yQHcyNl
         +Yyw==
X-Gm-Message-State: AOJu0Yzum0ah80OP0/DfkpZ01PcUA+7Y7x7xMXyEsCt89n81dUSKSZ5Z
	BxJWVqqbD0Gi/K0WitRyIc9JxIxYDYi7NOc1TtIVEaFP5esxKbDJj73YlX1AjrM=
X-Gm-Gg: ASbGncvQmZUyioZh1chBMoPtJg5RJWpqXRvinJqoH9ydmDgneo6A3IDv8zKuarwRGAw
	TcmLpgluGYiTI5hFGEY5mGEZkJfx38fDOQ97CQo0w5JSP28bJwSGVCoIT7IZ/hxPXzW8GM2zmeV
	laXkf6RkkqBkGJFf6qtemjcqwQK1MC3vt3UGt7CTLuXu9TqsxxasXmPZ0Z0sTs1vf1MpchyLoGX
	djm1FqATq1Qdo9crRuw/1v9gNpdqzgdwcz60v7NkD3oXxGkSpGCG2ixnanRU9UcoYAzwRebq/Le
	3XqaYUyzSS2BOJaCpC+Brgl1ivHVeunUqMWon+bXwdSKUh7I
X-Google-Smtp-Source: AGHT+IEm3T6IHk5ovRAm0FLQbBTvAowwUDJVCwuWzj30KVnm2jDxufS66tVGFXW4MWOrLXmcQD8Ulw==
X-Received: by 2002:a17:90b:3ec9:b0:2ee:9e06:7db0 with SMTP id 98e67ed59e1d1-2febab50f40mr14774270a91.11.1740903183521;
        Sun, 02 Mar 2025 00:13:03 -0800 (PST)
Received: from localhost ([157.82.207.107])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-aee7dedf5a8sm6079482a12.70.2025.03.02.00.13.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Mar 2025 00:13:03 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Sun, 02 Mar 2025 17:12:54 +0900
Subject: [PATCH] KVM: arm64: PMU: Fix SET_ONE_REG for vPMC regs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250302-pmc-v1-1-caff989093dc@daynix.com>
X-B4-Tracking: v=1; b=H4sIAAUTxGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDYwMj3YLcZN0kS4NEC7PENEsT02QloMqCotS0zAqwKdGxtbUAQ6KKqlU
 AAAA=
X-Change-ID: 20250302-pmc-b90a86af945c
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
X-CRM114-CacheID: sfid-20250302_001305_156112_A1A5B5FE 
X-CRM114-Status: GOOD (  15.57  )
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

Reset the current perf event when setting the vPMU counter (vPMC)
registers (PMCCNTR_EL0 and PMEVCNTR<n>_EL0). This is a change
corresponding to commit 9228b26194d1 ("KVM: arm64: PMU: Fix GET_ONE_REG
for vPMC regs to return the current value") but for SET_ONE_REG.

Values of vPMC registers are saved in sysreg files on certain occasions.
These saved values don't represent the current values of the vPMC
registers if the perf events for the vPMCs count events after the save.
The current values of those registers are the sum of the sysreg file
value and the current perf event counter value.  But, when userspace
writes those registers (using KVM_SET_ONE_REG), KVM only updates the
sysreg file value and leaves the current perf event counter value as is.

Fix this by calling kvm_pmu_set_counter_value(), which resests the
current perf event as well.

Fixes: 051ff581ce70 ("arm64: KVM: Add access handler for event counter register")
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 arch/arm64/kvm/sys_regs.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 42791971f75887796afab905cc12f49fead39e10..1de990edc6a3e9be2a05a711621bb1bcbeac236a 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1035,6 +1035,22 @@ static int get_pmu_evcntr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r,
 	return 0;
 }
 
+static int set_pmu_evcntr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r,
+			  u64 val)
+{
+	u64 idx;
+
+	if (r->CRn == 9 && r->CRm == 13 && r->Op2 == 0)
+		/* PMCCNTR_EL0 */
+		idx = ARMV8_PMU_CYCLE_IDX;
+	else
+		/* PMEVCNTRn_EL0 */
+		idx = ((r->CRm & 3) << 3) | (r->Op2 & 7);
+
+	kvm_pmu_set_counter_value(vcpu, idx, val);
+	return 0;
+}
+
 static bool access_pmu_evcntr(struct kvm_vcpu *vcpu,
 			      struct sys_reg_params *p,
 			      const struct sys_reg_desc *r)
@@ -1328,6 +1344,7 @@ static int set_pmcr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r,
 #define PMU_PMEVCNTR_EL0(n)						\
 	{ PMU_SYS_REG(PMEVCNTRn_EL0(n)),				\
 	  .reset = reset_pmevcntr, .get_user = get_pmu_evcntr,		\
+	  .set_user = set_pmu_evcntr,					\
 	  .access = access_pmu_evcntr, .reg = (PMEVCNTR0_EL0 + n), }
 
 /* Macro to expand the PMEVTYPERn_EL0 register */
@@ -2682,7 +2699,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	  .access = access_pmceid, .reset = NULL },
 	{ PMU_SYS_REG(PMCCNTR_EL0),
 	  .access = access_pmu_evcntr, .reset = reset_unknown,
-	  .reg = PMCCNTR_EL0, .get_user = get_pmu_evcntr},
+	  .reg = PMCCNTR_EL0, .get_user = get_pmu_evcntr, .set_user = set_pmu_evcntr },
 	{ PMU_SYS_REG(PMXEVTYPER_EL0),
 	  .access = access_pmu_evtyper, .reset = NULL },
 	{ PMU_SYS_REG(PMXEVCNTR_EL0),

---
base-commit: 97eab90817fc214843ca8ccd4cdf68b8115ed424
change-id: 20250302-pmc-b90a86af945c

Best regards,
-- 
Akihiko Odaki <akihiko.odaki@daynix.com>


