Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA115D69104
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 12:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rGNx4KryUAWkUrEyK556nEdWmNkAb7CXLB+nZikEwWs=; b=y3AlkCggiKnTnqnAPKGZg6O4Op
	FbIkFFFjMzGlnwNQNXdBJtoJ3hC0WJad1Aw9dYlAAdQs0yijJl8w8YRykU3/NJ2DJZaoio/kOwjqh
	0OszUQcshxzyfdYJAyd+CNnQOif4qlaIIWlEX8hQnTzGgcroLMWCjn+u5OfyWJAYmljYED6i9ze/i
	W8CaI7lUHouwuifedMIHHGYuiMNsEnptNxHifviqiMfiTODDh/FIXijKVkpX0g1GMKyvRUS1zPlMQ
	bMu30lcuqJJBA1G6Qjdprr9r26/10iBAw5qAnG3TVTTSm8ELzqFIwc1d8EJdh7GFmYDX4zff8AhyI
	PF3toqng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGdwD-0000000FX5y-20RP;
	Thu, 28 Nov 2024 12:48:05 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGdkF-0000000FVPz-1suE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 12:35:44 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-382480686f2so418573f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Nov 2024 04:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732797342; x=1733402142; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rGNx4KryUAWkUrEyK556nEdWmNkAb7CXLB+nZikEwWs=;
        b=k52W9HYujUgvfofEBpkVaJRCp869w0qCbXHHbfdhV0MJ7+a86zOatHF6eISY/Wzb/B
         aUq99tLOoLeiLZ/AU8HXINkS78MXKV5knglIW6q9XoCAK+MrDiML2WKp8DKQs8xI/BMt
         WmqjXuW/pMuTEALcTmL7lqYNiUSKgbOOP1Ftf5TK4uXabps+J+sX+gIP2aa+Fh2oiLN/
         C5DMa7k6p+R9jkq9qTVLCNajm0kKOAahZpT8kKSt38dOn/BqYVBJqds0emEaqnv0ArVD
         xkc5VPKJ68gf7Ze/7DrbvNYmlijCUfRtqVyKuuJoZMiMw8TmQSM7VegqpJd8yyvMIZDx
         ZO+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732797342; x=1733402142;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rGNx4KryUAWkUrEyK556nEdWmNkAb7CXLB+nZikEwWs=;
        b=s6m6Rl2nSVgNMMQA4vEI+3R6SyC4hzeJ45AuJLc+tWW09oon16UNT6XjXzxHI9kcPI
         JHo8YEDOuDRohcFBr0i7wocqbm9OomnxQ27sNpnSrzkt7K/48oCz/AStr7SWz2vencW+
         u7W+3w0i1W3ClRDP/EBu3DdTKoJnSx/ghUoUM+MmuSCB+K6oyE2mWdMLA5CezxvMLzL3
         IuRQ5hJXEuuGMv2z9qdm0P4/xIsciRhtg9frzLeEIIew8YdhhNIeZtCzf7qOsp07M74O
         Vzp0ppuet6tDxjZfQm/CfesRcuHGBMHZ+yxuU3GjH07mC58BphKeRWE6f+toTSKDvep8
         amLA==
X-Forwarded-Encrypted: i=1; AJvYcCVR+/lyFgpL8NwUKvuVNOAf6Vp43Gk6Y5jZHtfe2M89xmaYmyeUUqJHViWJ5tvgXuhF2UpTMsYo/ebsiTaU2aK2@lists.infradead.org
X-Gm-Message-State: AOJu0YzblGKMwgtHXciGkMJUXxynK8Aq7pNhXFYpqqG4KlAmhwcsI8Vw
	DBnULh/Jl2xHXO5Uet0mzXL8PjesdyPjYfGd/wXBcmgG6LwOm8eaS8dhVAxEvoq1TzFc3ACHlQ=
	=
X-Google-Smtp-Source: AGHT+IFLI3Jh7eWipSkuJnJEhB0CPELVPrf0f9jEJFqCsPBLEldQwio+BPzXSPDF2U9CoUeaJI7R6c0Vvw==
X-Received: from wrfi10.prod.google.com ([2002:a5d:584a:0:b0:382:5479:b8cf])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:4708:b0:37d:4fe9:b6a4
 with SMTP id ffacd0b85a97d-385c6edc3f2mr5536291f8f.50.1732797341940; Thu, 28
 Nov 2024 04:35:41 -0800 (PST)
Date: Thu, 28 Nov 2024 12:35:12 +0000
In-Reply-To: <20241128123515.1709777-1-tabba@google.com>
Mime-Version: 1.0
References: <20241128123515.1709777-1-tabba@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241128123515.1709777-13-tabba@google.com>
Subject: [PATCH v3 12/15] KVM: arm64: Fix the value of the CPTR_EL2 RES1
 bitmask for nVHE
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	qperret@google.com, kristina.martsenko@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_043543_484206_BC8EC323 
X-CRM114-Status: GOOD (  12.95  )
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

Since the introduction of SME, bit 12 in CPTR_EL2 (nVHE) is TSM
for trapping SME, instead of RES1, as per ARM ARM DDI 0487K.a,
section D23.2.34.

Fix the value of CPTR_NVHE_EL2_RES1 to reflect that, and adjust
the code that relies on it accordingly.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_arm.h     | 2 +-
 arch/arm64/include/asm/kvm_emulate.h | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_arm.h b/arch/arm64/include/asm/kvm_arm.h
index 3e0f0de1d2da..24e4ac7c50f2 100644
--- a/arch/arm64/include/asm/kvm_arm.h
+++ b/arch/arm64/include/asm/kvm_arm.h
@@ -300,7 +300,7 @@
 #define CPTR_EL2_TSM	(1 << 12)
 #define CPTR_EL2_TFP	(1 << CPTR_EL2_TFP_SHIFT)
 #define CPTR_EL2_TZ	(1 << 8)
-#define CPTR_NVHE_EL2_RES1	0x000032ff /* known RES1 bits in CPTR_EL2 (nVHE) */
+#define CPTR_NVHE_EL2_RES1	(BIT(13) | BIT(9) | GENMASK(7, 0))
 #define CPTR_NVHE_EL2_RES0	(GENMASK(63, 32) |	\
 				 GENMASK(29, 21) |	\
 				 GENMASK(19, 14) |	\
diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index 7b3dc52248ce..6602a4c091ac 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -640,8 +640,8 @@ static __always_inline void kvm_reset_cptr_el2(struct kvm_vcpu *vcpu)
 
 		if (vcpu_has_sve(vcpu) && guest_owns_fp_regs())
 			val |= CPTR_EL2_TZ;
-		if (cpus_have_final_cap(ARM64_SME))
-			val &= ~CPTR_EL2_TSM;
+		if (!cpus_have_final_cap(ARM64_SME))
+			val |= CPTR_EL2_TSM;
 	}
 
 	kvm_write_cptr_el2(val);
-- 
2.47.0.338.g60cca15819-goog


