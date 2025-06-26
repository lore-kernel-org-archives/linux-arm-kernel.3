Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 918C1C7EE33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 22:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RE7YbU/rytuy8zxs8P9SeXUwLNfz8JPOxqvhnV3EEjQ=; b=johuVs4AITSDw/s/zF81NnHaIw
	Orfwk/nZlRxpI5RG1Ht8uQSHQe4a0AB/GEQQevi8E+yDjrXMhWHTAo+kTsm7vG1YGAW89fefPZ25l
	55R3SRAJYLPZnep+Ur/dL5c8+2/MRqjPcFf5aUNp/0gmO7M5pGvTPpThDfTSapvDUdX0au82hThvg
	7hAC4avw9O+cuzyYV/9W5pTz3RfLEfGu7z8qPbpaIOuTd5gQTh/lH1hYuMy//2xY4doLG3N+Kb2Q6
	YelDl7kKo8UMXyFAn0sHS5aA6ux2gPc0APxXkwUY57jb299YUhHLyRdr3r4TQvBG4bzo57ggPG0g2
	dLkaQ+dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUul2-0000000Ctyx-1kAE;
	Thu, 26 Jun 2025 22:07:48 +0000
Received: from mail-il1-x149.google.com ([2607:f8b0:4864:20::149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUsrE-0000000Cgkt-3rQe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 20:06:06 +0000
Received: by mail-il1-x149.google.com with SMTP id e9e14a558f8ab-3ddd5311fd3so12668455ab.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 13:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750968363; x=1751573163; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RE7YbU/rytuy8zxs8P9SeXUwLNfz8JPOxqvhnV3EEjQ=;
        b=KpQJ3ydljmrEJzyn+vcPnHv4b3P8FVrbN3ZfObCGZFlDFKvxt6CbMBy/CurqjyyUI8
         pjs70FWOFpMiYDcCWsTJHTKwhmhH8GnBTR33FP+aqqV9FrQEvbAR2DRCuUc0IIKVQv9J
         bjpAsUwXbFPgJ3eOVIp291X28SHem5alCaCpUI8lhu6w3a1sTs/YsNY/ZZUSEujM9OQ+
         2RIA2nhgXKzhDZ7vy3uddVXdUjOeZehGPKacxW04CMtOUKGGaWph0D11qU5YeAY4Jd1+
         bglshHfP3piw6sxOb2bTRPm30ME8B9Jao7DovCXLiekTUVA/Nd/EtCuGilggKVgHSlEu
         yKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750968363; x=1751573163;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RE7YbU/rytuy8zxs8P9SeXUwLNfz8JPOxqvhnV3EEjQ=;
        b=NFm1YOzxEl4f+anZGV876fWcZtDoKpNmDAcIvAJGAMXHA1cOBDhxdhKMf4MR0xlK9F
         qqhraRROgiorRaAXTLQ/88n6GvnarvucompneI0ToSZObzmX+w6g2LB/SPQGHbgeN8w4
         NbFf0WP5DOJ0cuUSbiEO3hRAFB/dV52oAPI2NTyAXRZpsOcBf5X7PhmgF35WCIGyNxWa
         C3pQvr/Ay5Wc7leb1w1Gi+GY312ucTTqR4wY6dpiIYpwdfXfRrpMbSCcvpdBWia9rU4B
         9MHUkI7RQUGryFoKNzYhhke9NXcz4Olku3EZs1TLDfUcNm3LDD4TWIjBkRZYf/yU4ZTU
         0tGg==
X-Forwarded-Encrypted: i=1; AJvYcCUXmVVSifW+Mk+iL6iQvVDjcS7y+g97SpOC5dBbwRSdK1+ndcsF+xSIO82dQX4jK1s3taQMiSI4jdjKTg4Z2mir@lists.infradead.org
X-Gm-Message-State: AOJu0Ywfd7tk62BQgSEVko1cGqMud67JZrfjwZq7S9S3pKDdqxoKGMIX
	BK9jVjEk+hsSgONgKVbEd3UYZ64AStlHBZM2YNHNZ7DCU9cA2UdHJl27U9TWy4leYJb1fBYsEfH
	9pSQxe+1WfRNpaGyTvQaJN/C4cA==
X-Google-Smtp-Source: AGHT+IFVSmW/JlkCptcGzCVO362c3Cn87QaRlSz6D4Ns1ZpQiarZzlH5o54K21jyXUKriqhtonfUrINv6bCNPdpvpA==
X-Received: from ilbee28.prod.google.com ([2002:a05:6e02:491c:b0:3df:31be:c2e5])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:248e:b0:3df:29c5:2976 with SMTP id e9e14a558f8ab-3df4ab85a5amr11374775ab.14.1750968363583;
 Thu, 26 Jun 2025 13:06:03 -0700 (PDT)
Date: Thu, 26 Jun 2025 20:04:48 +0000
In-Reply-To: <20250626200459.1153955-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250626200459.1153955-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250626200459.1153955-13-coltonlewis@google.com>
Subject: [PATCH v3 12/22] KVM: arm64: Use physical PMSELR for PMXEVTYPER if partitioned
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Mingwei Zhang <mizhang@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Mark Rutland <mark.rutland@arm.com>, Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_130604_955791_C4CE7A65 
X-CRM114-Status: GOOD (  13.95  )
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
index e2057365ba73..1880e426a559 100644
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
index 49e8e3dcd306..771d73451b9a 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1065,14 +1065,19 @@ static bool writethrough_pmevtyper(struct kvm_vcpu *vcpu, struct sys_reg_params
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
2.50.0.727.gbf7dc18ff4-goog


