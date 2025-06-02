Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A15C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 19:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p/Q7iQgArbZ1+tQ0dSc/WoTlOEBgZJ24X0IeGAOsgLg=; b=07NZfgWXLoLwAODwa2mscRDYc7
	OUXt9BcG1NQEQi+Tf1/BxH7Bp+1k6MApp3FIT0m8lgFeJjblDuXytgmHfFkdwjP2dyXobPufwM9qG
	LZ2cVeoJbVLt0PPVoJ6NeCRw6PqGs3exVAEpeyj6fWwLWvUwua0dg9o3CQFnMEJ7HVqZO7dhTBNeE
	Ur0LUj7mhy7oSb2IG1WyOOqeXkTTXh3ifDLDO67mldHH5w8QU0l3xeEVEshZD8KoEqXicesAacxYK
	hnURO7A0bzI9zDloYDXw+pGbdytdE2miqA6ay6RZUZHk0JHNpd7e4tkVH6mOAA6L0jlIc+j4mHN2h
	iHS5j0mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMBGd-00000008dLf-2Kly;
	Mon, 02 Jun 2025 19:56:19 +0000
Received: from mail-io1-xd49.google.com ([2607:f8b0:4864:20::d49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMAqM-00000008UKa-1Bov
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 19:29:11 +0000
Received: by mail-io1-xd49.google.com with SMTP id ca18e2360f4ac-872fe8c4fa5so188184539f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Jun 2025 12:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748892549; x=1749497349; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=p/Q7iQgArbZ1+tQ0dSc/WoTlOEBgZJ24X0IeGAOsgLg=;
        b=1AFkrB8cPZeWAM0GMI5bQot0i/TeHtq88ZvVJgHM9diwg7uSowkvTG71EOTGv14exZ
         XyEg9c3d4hzIX0RYY8UDybom7WPUkl/I+4Cq46v3BAdWtrkLiohKM+icgMRoIq+v55YI
         nOftBG5G+iyyoWJ7BbE1ULeaT6gRAebHqfeyqAEDry7KRdW/jN8Nkr45pDHE85vMwxZF
         iRlRxGsPTVk9ylEC/FHANj96wo86N4pcE4GUWHcxeHvUVXRlPDLhBGhFmt623KSvJ2dB
         NOIN2AC6yS//GcCOx/AaFuDXkaGKEu21faaAf5rmxF0LVdmurBipRdBVxxWxuuFU/vMe
         u0pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748892549; x=1749497349;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p/Q7iQgArbZ1+tQ0dSc/WoTlOEBgZJ24X0IeGAOsgLg=;
        b=U2EA7v7NDqSHx3Leguum6Rfuyu+tKhqBwN2Lpucx0XrdNh505g5whW/CR5CeHK9vTi
         oQAFQmYeZ3JQFd8tO5g+FfymAUUhkpYUUlOxy0NYgrcNOUzmkOGJwWwk77TIgE9w6J4/
         iDhokWppMuKEWEW+ti2cW6esU3HeIysnJJ/o37IW4OwPSKnhJ8VtCWh98g3eG+97p/pe
         NDy81jFRmngDNsFgI6qxSK2rur+A7dw+9DNtAnljK4qNlSvu+ssgyodji3s9PV7YBAGL
         UWNVDPTnkMyzydS+QytQVnSvZiT7AL4Dbja0Bsx63ZdeQ/mjaVuPY1x54/jz1owxsB79
         9h2w==
X-Forwarded-Encrypted: i=1; AJvYcCVt6s3J9Ul0OtBSNFkcjiqSWibWAbA1MCI/ljWdPfDLfYJpxCJytRtEzTm77KCXjL0USuZvilnK/EdSSOGZ3kST@lists.infradead.org
X-Gm-Message-State: AOJu0YzwdS3twvTaYe+22nklehtondDUUCH9umawfvTPpOovuZlXCW2U
	yo9UfJcNXur1ciap1G+1VefPW4XHD4KH7vnZ0KuIi2OBAX/WSxO8YUxhL7Q2oTRhNU8DZRFAhPk
	YT6SkmUWI4TgF2wnetUeVuktO1w==
X-Google-Smtp-Source: AGHT+IFh0r8fdtRevJfULp2m0AI+wpxfd5UxvO3vZFtqup+r9hHTOSopW5KVBegS6S2BOnnva8v5qQTcx27amQki3g==
X-Received: from ilbbn9.prod.google.com ([2002:a05:6e02:3389:b0:3dd:a4c2:242b])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:3e02:b0:3d4:3db1:77ae with SMTP id e9e14a558f8ab-3dd99c28958mr177500035ab.18.1748892548842;
 Mon, 02 Jun 2025 12:29:08 -0700 (PDT)
Date: Mon,  2 Jun 2025 19:26:56 +0000
In-Reply-To: <20250602192702.2125115-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250602192702.2125115-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250602192702.2125115-12-coltonlewis@google.com>
Subject: [PATCH 11/17] KVM: arm64: Use physical PMSELR for PMXEVTYPER if partitioned
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_122910_327954_5871EE88 
X-CRM114-Status: GOOD (  14.61  )
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

Because PMXEVTYPER is trapped and PMSELR is not, it is not appropriate
to use the virtual PMSELR register when it could be outdated and lead
to an invalid write. Use the physical register.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/include/asm/arm_pmuv3.h | 7 ++++++-
 arch/arm64/kvm/sys_regs.c          | 9 +++++++--
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/arm_pmuv3.h b/arch/arm64/include/asm/arm_pmuv3.h
index 32c003a7b810..8eee8cb218ea 100644
--- a/arch/arm64/include/asm/arm_pmuv3.h
+++ b/arch/arm64/include/asm/arm_pmuv3.h
@@ -72,11 +72,16 @@ static inline u64 read_pmcr(void)
 	return read_sysreg(pmcr_el0);
 }
 
-static inline void write_pmselr(u32 val)
+static inline void write_pmselr(u64 val)
 {
 	write_sysreg(val, pmselr_el0);
 }
 
+static inline u64 read_pmselr(void)
+{
+	return read_sysreg(pmselr_el0);
+}
+
 static inline void write_pmccntr(u64 val)
 {
 	write_sysreg(val, pmccntr_el0);
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index afd06400429a..377fa7867152 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1061,14 +1061,19 @@ static void writethrough_pmevtyper(struct kvm_vcpu *vcpu, struct sys_reg_params
 static bool access_pmu_evtyper(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 			       const struct sys_reg_desc *r)
 {
-	u64 idx, reg;
+	u64 idx, reg, pmselr;
 
 	if (pmu_access_el0_disabled(vcpu))
 		return false;
 
 	if (r->CRn == 9 && r->CRm == 13 && r->Op2 == 1) {
 		/* PMXEVTYPER_EL0 */
-		idx = SYS_FIELD_GET(PMSELR_EL0, SEL, __vcpu_sys_reg(vcpu, PMSELR_EL0));
+		if (kvm_vcpu_pmu_is_partitioned(vcpu))
+			pmselr = read_pmselr();
+		else
+			pmselr = __vcpu_sys_reg(vcpu, PMSELR_EL0);
+
+		idx = SYS_FIELD_GET(PMSELR_EL0, SEL, pmselr);
 		reg = PMEVTYPER0_EL0 + idx;
 	} else if (r->CRn == 14 && (r->CRm & 12) == 12) {
 		idx = ((r->CRm & 3) << 3) | (r->Op2 & 7);
-- 
2.49.0.1204.g71687c7c1d-goog


