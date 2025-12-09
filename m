Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F939D3B994
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 20:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tlzYgLY8Hya1ebzZsNsRPfgfqZdf/pfSg0Aip8i1MzM=; b=Ztpag2WnC2CmPRrZVL7MONTDNz
	L90iS8ypewGpMAoBVm09IQne1Iqyv/1w3w8vWDfyaCkYeGHqjm4VGyK18nLkf3zRQo6Tj1z1YVAzF
	idr8hE/D5scEd6r3ZLKZ7nHD3SnjTX3kZ08TdO1rlx4gohYOjIBHHVKoNmnpTTrCxnEKCruFGfbsJ
	Fil4TJH7eq5rdf7mb1vWwuT6hdO3oattO8zmzg1oNhMVjFlZdZ31dOZvsmgSE8OWA59tnrTmKNR33
	TJRnKEh476LQBiYpsdgObYKDXx37L7dPCqfmTDd9qkEq2Uv0udIH9/EGDyORx5mYICZ22+BQzORZ9
	U2D1LCBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT4hW-0000000EkvE-1Fe1;
	Tue, 09 Dec 2025 20:52:50 +0000
Received: from mail-oo1-xc49.google.com ([2607:f8b0:4864:20::c49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT4hK-0000000Ekfx-1L5H
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 20:52:39 +0000
Received: by mail-oo1-xc49.google.com with SMTP id 006d021491bc7-656b2edce07so8449187eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 12:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765313557; x=1765918357; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tlzYgLY8Hya1ebzZsNsRPfgfqZdf/pfSg0Aip8i1MzM=;
        b=Jbt3iAkL/8Sfgoo6mHBvheSJ8ZamWaV6jrvnFxn6n1aCRxO9ipM6V6z2WSKE951N3a
         xtFVg3Q8geeewLL674wszOSLiEtbhdmAYKqFXLEQzKvV3r0oZBJpdBuTMS5/kXWE8dlw
         JHHJNB0xEBbeJ78pV4M0sUzeGqqg+KdWRteTaA/8jLsTDItVZ810sAMoCTsw/KROoa92
         k5/TrnDf07ctDJPPRnvvoIoOaQry5FDwKVBjWRwmw2ncAIYwHeWAIAcSVYY9LiCx1eyA
         E9Si88xx1AYgbI8R4Up2jEGiJq1mGObJw0xaaegsMT4lDnYmrVNP+5Tx+/Qb6sd+8XeG
         vlRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765313557; x=1765918357;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tlzYgLY8Hya1ebzZsNsRPfgfqZdf/pfSg0Aip8i1MzM=;
        b=GIaF4yN0IgGWNxgVv7n8m25I8k18Gfyzq8CD0lzULOugey6xm8vhqw3OVsUC+SyNgD
         y2XUkDFyhDAJi86q8AP4pK1JaE7camltQ61QiJoYotRAWbqTwqmk5a9xYXik2dT1YpgR
         xZrt+fW1PtuiyGtjeCNjPMr0lXQ9pCIKzrVkoqGQbgeK0PwDEoUAr9eeZCViuouW47Ld
         lFHUVMCIM9ZUCOQJbvw+8TOvf513RX/8wotz+r+9aFs3FXW2kSeK70UEvQmT5KyfF2vb
         ptQmLhr9bRlcCDfAWcWK/e5kUbjD5//7/VvDPhCIkBjur67kb1W6Ffc7vix/ShUIsVmd
         ls3w==
X-Forwarded-Encrypted: i=1; AJvYcCXftCxvKRhRdaM6S+aLMAwx3uUYRrS+TgWK7ybA1L743P+75bc7GBU5Re9wBZMtGpn7YTpLm2PZI2qgimKlwjtK@lists.infradead.org
X-Gm-Message-State: AOJu0YwDzPAB1u7ZKaV8BBXke9LnXYIiRvEnQLekzh+ynGHN7RISHpAd
	h2z3iEdRFuo9cZKmdGHjwEfJ5bm+EkwpW6iD+W0fmYVQHeZTTzrWR/AfNKHAz7FPXgncFUUtgJ7
	ONj8zsZNeI5mfb7o27Z27BVzsgA==
X-Google-Smtp-Source: AGHT+IFjXkWMzT4yuAEaLB+dJ2qXq9BXOkkzzf3nS3SdXsepbg3bqK/U0WpaHKFNBgIw1WNvMEX2vLOAaq9kL+8k3A==
X-Received: from jabhd27.prod.google.com ([2002:a05:6638:4e9b:b0:5b7:56fc:a47d])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:6acf:b0:659:9a49:8f3d with SMTP id 006d021491bc7-65b2ad9f5eamr96621eaf.78.1765313557028;
 Tue, 09 Dec 2025 12:52:37 -0800 (PST)
Date: Tue,  9 Dec 2025 20:51:08 +0000
In-Reply-To: <20251209205121.1871534-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20251209205121.1871534-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.52.0.239.gd5f0c6e74e-goog
Message-ID: <20251209205121.1871534-12-coltonlewis@google.com>
Subject: [PATCH v5 11/24] KVM: arm64: Writethrough trapped PMEVTYPER register
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
X-CRM114-CacheID: sfid-20251209_125238_368390_9468DA44 
X-CRM114-Status: GOOD (  16.79  )
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
ones. Failing to do this means guest writes will not take effect when
expected.

For the PMEVTYPER register, take care to enforce KVM's PMU event
filter. Do that by setting the bits to exclude EL1 and EL0 when an
event is not present in the filter and clearing the bit to include EL2
always.

Note the virtual register is always assigned the value specified by
the guest to hide the setting of those bits.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/sys_regs.c | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index c636840b1f6f9..0c9596325519b 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1166,6 +1166,36 @@ static bool access_pmu_evcntr(struct kvm_vcpu *vcpu,
 	return true;
 }
 
+static bool writethrough_pmevtyper(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
+				   u64 reg, u64 idx)
+{
+	u64 eventsel;
+	u64 val = p->regval;
+	u64 evtyper_set = ARMV8_PMU_EXCLUDE_EL0 |
+		ARMV8_PMU_EXCLUDE_EL1;
+	u64 evtyper_clr = ARMV8_PMU_INCLUDE_EL2;
+
+	__vcpu_assign_sys_reg(vcpu, reg, val);
+
+	if (idx == ARMV8_PMU_CYCLE_IDX)
+		eventsel = ARMV8_PMUV3_PERFCTR_CPU_CYCLES;
+	else
+		eventsel = val & kvm_pmu_event_mask(vcpu->kvm);
+
+	if (vcpu->kvm->arch.pmu_filter &&
+	    !test_bit(eventsel, vcpu->kvm->arch.pmu_filter))
+		val |= evtyper_set;
+
+	val &= ~evtyper_clr;
+
+	if (idx == ARMV8_PMU_CYCLE_IDX)
+		write_pmccfiltr(val);
+	else
+		write_pmevtypern(idx, val);
+
+	return true;
+}
+
 static bool access_pmu_evtyper(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 			       const struct sys_reg_desc *r)
 {
@@ -1192,7 +1222,9 @@ static bool access_pmu_evtyper(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 	if (!pmu_counter_idx_valid(vcpu, idx))
 		return false;
 
-	if (p->is_write) {
+	if (kvm_vcpu_pmu_is_partitioned(vcpu) && p->is_write) {
+		writethrough_pmevtyper(vcpu, p, reg, idx);
+	} else if (p->is_write) {
 		kvm_pmu_set_counter_event_type(vcpu, p->regval, idx);
 		kvm_vcpu_pmu_restore_guest(vcpu);
 	} else {
-- 
2.52.0.239.gd5f0c6e74e-goog


