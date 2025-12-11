Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B79A8D41C21
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 10:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kkwoqFxFyD3NTqkLTtawAgSOr5TM3pE6TGLZ488viKo=; b=H/T5NRRj+t7bg/sgr8ByPMiBEr
	UaIAaMpstHX6tBnkynjSd8NPsByZIgN+6Uok/6uPLB7FanDCywXLmTMHy3shAUYFAXqa26c1pi3uN
	y5R/oG/vx0qkCurXGAlXbwCpDfAw85glYTju7Y2cjeFGxWLjLf5W3q9Qf/AsgLMW4v6t6Oo8hwL2T
	qhAwAmRtl5BCGibp5PDBuaoeAoEGzoQiX6k1FtQX0MIlV2oFdC0aG4eAhBlZk9tu7HYh83UG7Z+BE
	fRqEeyQ0gQvZPkclLi8DYqaTTFpobk9czAbI6nFkoKA5Bhk3RcDDjPBZyvqFmnEZrEt+0t+4rAOXz
	06Lq3JsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTeCd-0000000GUrN-3eVi;
	Thu, 11 Dec 2025 10:47:19 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTeCY-0000000GUnP-2N1T
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 10:47:15 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-42f9f40a9bbso362328f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 02:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765450032; x=1766054832; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kkwoqFxFyD3NTqkLTtawAgSOr5TM3pE6TGLZ488viKo=;
        b=xfwuuYqTJ1EdTszG3oB8QPh90HOT20cbPYlDbkvem8/UMqcpHe7e+pNMjDTw/jtU4Z
         8FnKiilT5YVERXg9ImBzEc6rQ6HDGOiUmNL4TTeoiULc0lOB/n63REa/EWA/k2O7LrxN
         2UPadiQUJBsaV6d3wDlZQyIUlOqmIm8b01l7nI347bDFinok125fBqa9aImTTEsuTlcy
         OwjxdNsuLdtelsuDHJNJBj7LOST9EJvn1Gazxwm5r7/ChJ+xVNW5TxBtrsuhhd79Bc0H
         won2jpqHDQI3oIRPwslZHq7I/HUn2eQWCdbzHSr7vVRv0zvtlSVxbM58fVxoHLYCKU3W
         Kbxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765450032; x=1766054832;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kkwoqFxFyD3NTqkLTtawAgSOr5TM3pE6TGLZ488viKo=;
        b=HQUAIicd2qUAaRzGtGD9cVd5XyInLF3C/yfhRhI824FNSPtROM8XMC8PvoOJIr3AnC
         b2QaodqMpvKYhaVClnj317U3yiYRJsEmJscAiR0pIY63Xr4NfvU2idpBLS7hktJOsF2J
         CoAsiWZsLI6MozkiaPe8qxq3Fr6Yez5XM2SfSch70zVyjY6PbU9BmNpT4mxUp/j/XtYQ
         CIT019VgcdCLiaGaziPzv27tHjlPDa89XOnygazs/pRr6Mq/Qhl9HntT35WsqRzbmwD7
         g898aA33M99zbGk6cWCOLhUkfMF8ZW4PBpAl39OlcOPpATvRUzR3BUeiwzuGsCTd5p2G
         7GLg==
X-Forwarded-Encrypted: i=1; AJvYcCW4kTlKu/wDwl1bW72vR7TDykKtN1/HJx5A7ssRF6LSTd+rFQu8cKACpeRfsoDKptx8HdVGmKSXw08TrctccMjz@lists.infradead.org
X-Gm-Message-State: AOJu0YyLBYxNMR8MH/Fy4pU0+ZRAYmhv88uOHG1af843KRHgRazB0moz
	UKhvMcncZme8g/YiaysMAbpXplAZb4Ihzl04bYb2Cc32/Oq9ZVvgnspWe2mrcF946RipV4FSJJR
	AEg==
X-Google-Smtp-Source: AGHT+IFUK9qOhltxBwj/CqkUNy38yNFCB7+W2fU+SCaB3Rn2njvoxByJe2i60UDZ3pAyc0yyl1XO+MzqSQ==
X-Received: from wmhf26.prod.google.com ([2002:a7b:cc1a:0:b0:477:a0a1:eae8])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:33a9:b0:477:af74:ed64
 with SMTP id 5b1f17b1804b1-47a86a55951mr21200815e9.27.1765450032433; Thu, 11
 Dec 2025 02:47:12 -0800 (PST)
Date: Thu, 11 Dec 2025 10:47:02 +0000
In-Reply-To: <20251211104710.151771-1-tabba@google.com>
Mime-Version: 1.0
References: <20251211104710.151771-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251211104710.151771-3-tabba@google.com>
Subject: [PATCH v6 2/9] KVM: arm64: Fix Trace Buffer trap polarity for
 protected VMs
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vladimir.murzin@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_024714_607476_2713CBBC 
X-CRM114-Status: GOOD (  12.34  )
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

The E2TB bits in MDCR_EL2 control trapping of Trace Buffer system
register accesses. These accesses are trapped to EL2 when the bits are
clear.

The trap initialization logic for protected VMs in pvm_init_traps_mdcr()
had the polarity inverted. When a guest did not support the Trace Buffer
feature, the code was setting E2TB. This incorrectly disabled the trap,
potentially allowing a protected guest to access registers for a feature
it was not given.

Fix this by inverting the operation.

Fixes: f50758260bff ("KVM: arm64: Group setting traps for protected VMs by control register")
Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/pkvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 8d06a246dfd1..f6f8996c4f97 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -118,7 +118,7 @@ static void pvm_init_traps_mdcr(struct kvm_vcpu *vcpu)
 		val |= MDCR_EL2_TTRF;
 
 	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, TraceBuffer, IMP))
-		val |= MDCR_EL2_E2TB_MASK;
+		val &= ~MDCR_EL2_E2TB_MASK;
 
 	/* Trap Debug Communications Channel registers */
 	if (!kvm_has_feat(kvm, ID_AA64MMFR0_EL1, FGT, IMP))
-- 
2.52.0.223.gf5cc29aaa4-goog


