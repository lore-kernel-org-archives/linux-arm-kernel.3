Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93893C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 22:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EUwcqeVf5KIMoAmCHhrWA0WRgfRVQt5PquOGXBH2GsU=; b=wNtaym/N6GF9JBZRjY4bZKzadh
	UhU+zwX0fA5skR3oP9G7pW8ETR+rnI8T0KoAATPE8gifWpK8yNhrFXhyJ0YhxD488YPCABlyzAJ8O
	gUWCFNHMp2kh6sC+1+4rKUCeFuR0dTm/+l4yr8spfSHtFs1T4vMHEjvQ/kMVWxw5FAlPhBhmmbueF
	bAswwMKwrudZbmfxUvL6WIpVo1O1cmF4+FWA3gxPTD3qEo8whJWkJNNbwcWlqwElYTCdS+M/gHF2s
	TtgOkYElZWtXDNM6n4tRlUUZOKGxNa2UztjlhznqqQEhaD35RnDs8j4z2Q4eCZ2t4JxnHjvn6WZmW
	BnCvzZbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSkbS-0000000GlfU-2waL;
	Fri, 20 Jun 2025 22:52:58 +0000
Received: from mail-il1-x14a.google.com ([2607:f8b0:4864:20::14a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSk4T-0000000Gh8J-1Rs9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 22:18:54 +0000
Received: by mail-il1-x14a.google.com with SMTP id e9e14a558f8ab-3ddb4a92e80so28361955ab.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 15:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750457932; x=1751062732; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EUwcqeVf5KIMoAmCHhrWA0WRgfRVQt5PquOGXBH2GsU=;
        b=RJERNcyXdDwLULBrwSwUnfRNr1L4sceFyVsq/sDgPpoVd4yyypzIgDuVmqzW5RKjGg
         rtT+gfAB52bp4xEyg3Sn4akNNoPELb6T46RxkiXcsSA/muMXgqjzkS+pPgDI4J6A7MEl
         TEgxGkhdcQrRZLLj6WHMZeCiHGDjI8u9LOru5p4fkVYREZ/YzpG6gGRWCAknsPxQxaxy
         aEX6UCA1Fd+jkkwAGxs6yOFB7RjN985AAR4vTaRvfsT1f0hpoVsqR68EMra/gOUVu++N
         hk2mcrF90JHkQPUXwUK/b+8Zl8JeasTQdb15VfSYwnUgPk1/fnZM4UUE6Vt48IaRmNDE
         vVmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750457932; x=1751062732;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EUwcqeVf5KIMoAmCHhrWA0WRgfRVQt5PquOGXBH2GsU=;
        b=NIOjhAKSrIgWFmuTPbY1YpA3xC4DycxVOC9HgkVsDOoOAMVyQPlQkQxuxP0fW+TXpz
         l7PGzlNLTb+el+xXl8IKjLoBwZB3eGIAtaWquXCenSlCRhj9bd22EVlladEp56m6TQ/l
         OoseFeSL1EqpsjN4u2cTCXZiImo54YE2Ys7WXLv6Vbum5vI7AC/nIyBK2BPfVhqOmLMU
         vQE21ZMAKYO8d05myGQsd1YvQQJSRTovuBW8j84B5nbzNhktrhW9RrBXAFzpcnnCIhbt
         z0WfE5JN/BzcEDMwMsDAyrzJ2SHxt2QLUd8FSH2thB9fCL4QAOpw0CIu+25qUBoBfNbH
         uQzg==
X-Forwarded-Encrypted: i=1; AJvYcCXfdLZ4vHL9nLk+GbsH+0dr7PkE/KYVE/nI5x3S70k8kd0Y+cV+C6Bxrs2spDEx8oBzXmJtcCEvF5t9E1SCUTUu@lists.infradead.org
X-Gm-Message-State: AOJu0YydNYRw1OHrllarbazbZRzsQH+fEJIHkPPtu5Z6la4/7DAZX18W
	zz0ICq/6bWzyZdAg7MXln94k0G6PNbynNYajtr5wxmL116CghyuYiwKiHlxCy3nw8TOBRzziSck
	+X9worTF4C60GaH+yPq4gjpi3Lg==
X-Google-Smtp-Source: AGHT+IECQiJFomMTnsPbeme3Oi7RJjR0YLkrmdcXG9nsdHvxsNa0RAqjFaN0Cl+MqvohmdUapqaunpxSDwgZDSywoA==
X-Received: from ilff3.prod.google.com ([2002:a05:6e02:5e03:b0:3dd:a3df:9d57])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:16ce:b0:3dd:d653:5a05 with SMTP id e9e14a558f8ab-3de38c1bec3mr55840665ab.3.1750457932182;
 Fri, 20 Jun 2025 15:18:52 -0700 (PDT)
Date: Fri, 20 Jun 2025 22:13:15 +0000
In-Reply-To: <20250620221326.1261128-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250620221326.1261128-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.714.g196bf9f422-goog
Message-ID: <20250620221326.1261128-16-coltonlewis@google.com>
Subject: [PATCH v2 14/23] KVM: arm64: Writethrough trapped PMOVS register
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
X-CRM114-CacheID: sfid-20250620_151853_382148_74AB2071 
X-CRM114-Status: GOOD (  13.36  )
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

With FGT in place, the remaining trapped registers need to be written
through to the underlying physical registers as well as the virtual
ones. Failing to do this means delaying when guest writes take effect.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/include/asm/arm_pmuv3.h | 10 ++++++++++
 arch/arm64/kvm/sys_regs.c          | 17 ++++++++++++++++-
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/arm_pmuv3.h b/arch/arm64/include/asm/arm_pmuv3.h
index 1880e426a559..3bddde5f4ebb 100644
--- a/arch/arm64/include/asm/arm_pmuv3.h
+++ b/arch/arm64/include/asm/arm_pmuv3.h
@@ -142,6 +142,16 @@ static inline u64 read_pmicfiltr(void)
 	return read_sysreg_s(SYS_PMICFILTR_EL0);
 }
 
+static inline void write_pmovsset(u64 val)
+{
+	write_sysreg(val, pmovsset_el0);
+}
+
+static inline u64 read_pmovsset(void)
+{
+	return read_sysreg(pmovsset_el0);
+}
+
 static inline void write_pmovsclr(u64 val)
 {
 	write_sysreg(val, pmovsclr_el0);
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 3140d90849c1..627c31db84d2 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1174,6 +1174,19 @@ static bool access_pminten(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 	return true;
 }
 
+static void writethrough_pmovs(struct kvm_vcpu *vcpu, struct sys_reg_params *p, bool set)
+{
+	u64 mask = kvm_pmu_accessible_counter_mask(vcpu);
+
+	if (set) {
+		__vcpu_rmw_sys_reg(vcpu, PMOVSSET_EL0, |=, (p->regval & mask));
+		write_pmovsset(p->regval & mask);
+	} else {
+		__vcpu_rmw_sys_reg(vcpu, PMOVSSET_EL0, &=, ~(p->regval & mask));
+		write_pmovsclr(p->regval & mask);
+	}
+}
+
 static bool access_pmovs(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 			 const struct sys_reg_desc *r)
 {
@@ -1182,7 +1195,9 @@ static bool access_pmovs(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 	if (pmu_access_el0_disabled(vcpu))
 		return false;
 
-	if (p->is_write) {
+	if (kvm_vcpu_pmu_is_partitioned(vcpu) && p->is_write) {
+		writethrough_pmovs(vcpu, p, r->CRm & 0x2);
+	} else if (p->is_write) {
 		if (r->CRm & 0x2)
 			/* accessing PMOVSSET_EL0 */
 			__vcpu_rmw_sys_reg(vcpu, PMOVSSET_EL0, |=, (p->regval & mask));
-- 
2.50.0.714.g196bf9f422-goog


