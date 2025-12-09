Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20B79D3B999
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 20:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eILdFka/rsHJNMit/75Sq+eu11TjmQop/YtCpvpq3fA=; b=XtcavSKTkGFUcRQ5qKm5o0v3yA
	NxeOzE2mnJHbbupZzrHcFuvhW34xkZu6uXrxbKRNESBSojWijSgUu+jJnKgRUEirz7BAng2vs1h91
	ALMuVzyAefHy3QzmmiMIv+88yyVSwq2GnTdVrJiLoxJxCkRtmFEyCFS2uV9pHj5CQSVUgvbpVwMul
	qINFWT7ZlqHmPMmZj22pHTUJkXY6CjQz5HNFg98yQUUSmUejDvZUehxsNH3RjKOygQrKXpnwAvhQu
	fhOHPG6k7jq10BQ4Ye8j7on9NFLZZ4zSW9w5KKbaOyLg1gHiGWnxC8xv0KNjlXHBylsMHSR+lN6A4
	v2g0jHpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT4hX-0000000EkxO-3DZM;
	Tue, 09 Dec 2025 20:52:51 +0000
Received: from mail-oa1-x49.google.com ([2001:4860:4864:20::49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT4hL-0000000Ekgm-2gDi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 20:52:40 +0000
Received: by mail-oa1-x49.google.com with SMTP id 586e51a60fabf-3e88de1d93aso7193392fac.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 12:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765313558; x=1765918358; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eILdFka/rsHJNMit/75Sq+eu11TjmQop/YtCpvpq3fA=;
        b=DqUT0VMOVV7IEekq7CBDaySRJLt9hB1MN/ywWDmt3XaWXZxtW294HonR7X564IFhwJ
         rgWlarD5YK2wVNUB4qM+lNW0MxLl55wsX8C2FmLCAkI17hZXBzq1+TYy4KreeLDeLJTS
         mKv1ROfk5WH2OnDPIgF++Bi0ejH05rJjs/Dr9ZjUhlaND10vG7hwSrkRW7MdObfMMvho
         XsHAZA02gSehqHCDubZcUmCSEZMmfE/ACxJ3izjY3CsoXp21Y3esCKLQ6jMz4QxfwOp5
         XvU0hmzuBHUUvqoXRbRNi+lEgosKWyxT3C1PsRDP1pYI9MGDJWamyys1JR45AkM5l9XE
         IR2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765313558; x=1765918358;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eILdFka/rsHJNMit/75Sq+eu11TjmQop/YtCpvpq3fA=;
        b=JmAEd2VhUoxx2B4oV7Smpey07Qefy8daAfD6QCfB0oUXnGrTRgjl1CjSEsdHpK6CwY
         HI9ikddDbflvYB5fTZwtdYsb2RqgGjU8za72kfeyB6h/+J9+So89pa+bHsl7HWAMbNNm
         0pS/mf+Da7hSqfmrE2LvuUj3oGFqyNu6UU+KgswZl8Ok6DNDZ3efdF+9sjsl8ep5ggDA
         SNTvFKWftCP2wx7G1DD7hxVaPnvXKWPsKxWiQBrKfCUu+Lar2yCckTPMFwS0qCIgjaru
         /qLucUhKvSebbLqb0id/YtDlcyPT0o9kJ4Dpr5JS9DEEw33hNJUcqhBhrNQk3TqDcpMG
         dWAA==
X-Forwarded-Encrypted: i=1; AJvYcCVCFqem15LLlGL3lg9qMqwr+jTK950CIEyUl9HGk0bL4sxU1yxSrb2ASOZivG3T0i0X1OBUchk/vzl55mvMqdwc@lists.infradead.org
X-Gm-Message-State: AOJu0YwhVKtScBmq+hgVEI0n1jnuQQRuOrRfiDapqM9UtH4iJFQSL4GG
	eSo7Sq9ZCygCHfcn/vOlQoMhPbcjtleJL5i4BRoiYVlvpfcTIUBro/qKVeeMXJvIaaH5h7I5LE4
	hlT4aQP7GpR0ZjzaVJx58ROzcRA==
X-Google-Smtp-Source: AGHT+IGFO7LxHdl3SUALrs39mwNrx9NW2pYEpCVi8R5YZ4pkCq168hpaasS4MHYzaxE05YVUGX0GL3A0G5bIBNL23w==
X-Received: from ilbcp5.prod.google.com ([2002:a05:6e02:3985:b0:433:e44:c729])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:4d08:b0:659:9a49:8f57 with SMTP id 006d021491bc7-65b2abec3e1mr136653eaf.28.1765313558233;
 Tue, 09 Dec 2025 12:52:38 -0800 (PST)
Date: Tue,  9 Dec 2025 20:51:09 +0000
In-Reply-To: <20251209205121.1871534-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20251209205121.1871534-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.52.0.239.gd5f0c6e74e-goog
Message-ID: <20251209205121.1871534-13-coltonlewis@google.com>
Subject: [PATCH v5 12/24] KVM: arm64: Use physical PMSELR for PMXEVTYPER if partitioned
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Mingwei Zhang <mizhang@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Mark Rutland <mark.rutland@arm.com>, Shuah Khan <shuah@kernel.org>, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_125239_705568_7E79FAD3 
X-CRM114-Status: GOOD (  14.23  )
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
to an invalid write. Use the physical register when partitioned.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/include/asm/arm_pmuv3.h | 7 ++++++-
 arch/arm64/kvm/sys_regs.c          | 9 +++++++--
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/arm_pmuv3.h b/arch/arm64/include/asm/arm_pmuv3.h
index 27c4d6d47da31..60600f04b5902 100644
--- a/arch/arm64/include/asm/arm_pmuv3.h
+++ b/arch/arm64/include/asm/arm_pmuv3.h
@@ -70,11 +70,16 @@ static inline u64 read_pmcr(void)
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
index 0c9596325519b..2e6d907fa8af2 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1199,14 +1199,19 @@ static bool writethrough_pmevtyper(struct kvm_vcpu *vcpu, struct sys_reg_params
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
2.52.0.239.gd5f0c6e74e-goog


