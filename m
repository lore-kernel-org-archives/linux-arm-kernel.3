Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A12EB48EC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 09:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hohgtHRfz1v94OB8xvfSs3emKAePAKag+PCIiCzGg6U=; b=b4YJnOIiL4uvFkqpGSV3A426Ao
	rKLtzrv6qOLIJbcmofRzCFEq9K1b64fH/YhSnCblA/i4v5jz1F08DlvJjqioS2NuKMCBmUoTRToCo
	YSpF4UWWlFvKfiaqSkNE/Y7lqhxZHBYYGtnyGTSHDR8XcZn9nxkbCKCyGU8VRqkp3y7fyGz1kQP/V
	9y7QSDI1NbK1TipRM4eK9E0IWPv2Hl/q1dILfWjVLbdgvh+s7EMMpUWwdkzS1abIakWyYNJZN7m5c
	ZpSp8r1arOfxfI7D+vAjk2oVYYLmtI0LuerC47tOCgfRUsrCIrn5pYFjq0va5KHroC+uE1EO7074O
	0lnlaWbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqSbK-00000001nhj-0fZk;
	Thu, 12 Feb 2026 09:03:06 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqSbB-00000001neA-0H3K
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 09:03:01 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-65932e533daso3469613a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Feb 2026 01:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770886974; x=1771491774; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hohgtHRfz1v94OB8xvfSs3emKAePAKag+PCIiCzGg6U=;
        b=kgXl4bZUJKTC3x5Hw2tlM8yRqJTO0XWN3K4r7p9/qshEvnAWNT14D6wg1OlUtl651p
         VYwPtpDLWbfjuTSjn46ooR5duQLhvvmIxHbQgfBeY+A+WgPuICW391QxpBVeNbn1Bmkf
         kUlEOzN5FGS5+5kndyakTz1cPETcAUOPPP/ltAheYPv+EVL8tvpm1RsEKWvJx0O+4OMn
         ZnCM3QG/q0+0hEAAxr07hxczrrjZmzeE6yIsP3pQUbwkGYwqfmqeqaTk7H4GNMi7UrFZ
         VpVEIc3togD/J/AccUBwg/rdbXpOYEhPgvIL/I9G801YK7jmYN9BCUqNq8waGIovAtrW
         CxeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770886974; x=1771491774;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hohgtHRfz1v94OB8xvfSs3emKAePAKag+PCIiCzGg6U=;
        b=szpN8FZENkk2DlI8Y9u9gZZ0x/AXlv3owfplJcc4oON53SGunEkgmcvzmQGA5uzoaO
         cwVfugVRVDCDuNbZC9dPKbrrtHWRsb/ENECKQdNkAM1y1q3+XFFWRVNNh0RpJ4iyTGdA
         FggpKOBgU02YP2bklCriTWKeolcKR/QWpMtfP8U7qncKP9XcabmY8u6CgZqzM6tRiZtE
         sO2hBid6SOLEuaD62a2nCifURN2Wve3gAFnUKgLWr9Vx09cSXMqizgQovxkARKVkABgY
         jsuDY8sOZgjUnOxSY3N4BnXu8+RgirE01TVCu1CbTzluG+JQLXn4qKS1IjuhR8rsgvIi
         QbYQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0uMEU2IRLhKJliLvmFbae8OjU/EkB22nPMN+7+CcETwmqyIc4fub5+F0UtdjgTg38Y7IsuLXdAaXvaDH10zBq@lists.infradead.org
X-Gm-Message-State: AOJu0Yxl6k7ZrNrKP3d6IZiFDJXebqmM1RC7AcSanafTwKwdhCn27z5K
	a5mHsee8tJGflpsD13otfRz/tA28uBOithquJphD3g80+f0QIvnVLEQOZGGjJqoL0LZ8uTxt8zo
	Xzg==
X-Received: from edpj17.prod.google.com ([2002:aa7:c0d1:0:b0:65b:a58f:6579])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:2681:b0:659:3671:137
 with SMTP id 4fb4d7f45d1cf-65b9dabcd34mr606478a12.1.1770886974387; Thu, 12
 Feb 2026 01:02:54 -0800 (PST)
Date: Thu, 12 Feb 2026 09:02:50 +0000
In-Reply-To: <20260212090252.158689-1-tabba@google.com>
Mime-Version: 1.0
References: <20260212090252.158689-1-tabba@google.com>
X-Mailer: git-send-email 2.53.0.239.g8d8fc8a987-goog
Message-ID: <20260212090252.158689-2-tabba@google.com>
Subject: [PATCH v1 1/3] KVM: arm64: Hide S1POE from guests when not supported
 by the host
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, tabba@google.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_010257_107085_762761F3 
X-CRM114-Status: GOOD (  14.46  )
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

When CONFIG_ARM64_POE is disabled, KVM does not save/restore POR_EL1.
However, ID_AA64MMFR3_EL1 sanitisation currently exposes the feature to
guests whenever the hardware supports it, ignoring the host kernel
configuration.

If a guest detects this feature and attempts to use it, the host will
fail to context-switch POR_EL1, potentially leading to state corruption.

Fix this by masking ID_AA64MMFR3_EL1.S1POE and preventing KVM from
advertising the feature when the host does not support it, i.e.,
system_supports_poe() is false.

Fixes: 70ed7238297f ("KVM: arm64: Sanitise ID_AA64MMFR3_EL1")
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_host.h | 3 ++-
 arch/arm64/kvm/sys_regs.c         | 3 +++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index ac7f970c7883..7af72ca749a6 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1592,7 +1592,8 @@ void kvm_set_vm_id_reg(struct kvm *kvm, u32 reg, u64 val);
 	(kvm_has_feat((k), ID_AA64MMFR3_EL1, S1PIE, IMP))
 
 #define kvm_has_s1poe(k)				\
-	(kvm_has_feat((k), ID_AA64MMFR3_EL1, S1POE, IMP))
+	(system_supports_poe() &&			\
+	 kvm_has_feat((k), ID_AA64MMFR3_EL1, S1POE, IMP))
 
 #define kvm_has_ras(k)					\
 	(kvm_has_feat((k), ID_AA64PFR0_EL1, RAS, IMP))
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 88a57ca36d96..237e8bd1cf29 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1816,6 +1816,9 @@ static u64 __kvm_read_sanitised_id_reg(const struct kvm_vcpu *vcpu,
 		       ID_AA64MMFR3_EL1_SCTLRX |
 		       ID_AA64MMFR3_EL1_S1POE |
 		       ID_AA64MMFR3_EL1_S1PIE;
+
+		if (!system_supports_poe())
+			val &= ~ID_AA64MMFR3_EL1_S1POE;
 		break;
 	case SYS_ID_MMFR4_EL1:
 		val &= ~ID_MMFR4_EL1_CCIDX;
-- 
2.53.0.239.g8d8fc8a987-goog


