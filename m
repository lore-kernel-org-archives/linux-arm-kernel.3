Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63527CCFA06
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 12:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bb81JLsWJk82J+wzmAOK9fA3Gew6mQBIHRnpR84BUr8=; b=jF7B304D48eaQuknphjzonrW0k
	VU2zHbhA+rk5himgKOA4OvP8WyBQo2PuhX1B4eKioZ+P/7BsdXbJ3++SQgvhVjp4m7MKsRdz4OgIr
	KfNmPtZ3O00MDNZiUace+iToXgXkxtDNDcSixYIC3sllfELi/5ret5pLUiJC58zgoRxCTAKCaoISS
	080J2bAnclVBfRAkSM+0lghiKR385UarWNyihoeqPNFJVnLDEtWnCMY5t7ty86ovOANbivFwNF/AK
	rMPvKefLHIhp7ganeA8I/7QXnfT5mdTnNFAUVTX1F3hoU/pbqalC5uu/tC9b6PZhRmeKWYD8IrwA8
	5t0E01GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGGd1-0000000Bp61-126h;
	Tue, 04 Nov 2025 12:59:15 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGGcw-0000000Bp36-4AuY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 12:59:12 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-64091bef2ecso5266457a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 04:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762261149; x=1762865949; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bb81JLsWJk82J+wzmAOK9fA3Gew6mQBIHRnpR84BUr8=;
        b=XMTHeDOuHbCl3YHbzP7mlFyr++CsUFypoD4ylIZ+2zLtqkpr57w9bBenLtJRE4Pw7z
         MCIc8bnJwriUtCuTsEGOzaXtm0+FxqzqzYdhp0Vpk7up4T3ylnuUVZILjNz6GO7Zc2do
         ecpepfdv/AQ7UVZgj91oLeJLrbGhoNbiqffqHyYMJ/RVaBQAlK4QkxBSvuTfVsVMDBRL
         sJTH1BEJUxrpl+uEYBvHYv9dQij7p71vN1rBf0QqrJjZpOj1LEpGAY0r2Wr4Id3QpFUE
         Nt1e2jo11jUXEqib3UjNSg9dW4oi3Jbg1cFOM4ix+7mP0JKqYltLRdJSuS3q/rYlkTzA
         eNvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762261149; x=1762865949;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bb81JLsWJk82J+wzmAOK9fA3Gew6mQBIHRnpR84BUr8=;
        b=ZpvegvCPoTj03/Pd0jKnI/ZC8KFEz0a5h6a3Fr/PyO9kl/N3QlrGhCVYnC+o9bwHD1
         OgZLBsHfBXvpM2LUrWBnpuft1dPIYg9d/aaYG6uKlfd5Jm4wShTE+Y7eNZxB4otyasFF
         naJrGu9bmzehHGs3R2j8S+noA0N1qeEgc2OwLzcgYNuMAvPle/kKmgCHICDgscto8jIZ
         CTB93Tj09LLbR6V/ntmOwWNEpvOGkCYfU/ERz6ZUB5Jg2zffZFAaDF9VXMyMnrP0eDXL
         DIL9QErqFxPc6j1pOm91kj9teiXK70OvCeo+4eplEJ005RuJVJvhWigJmvoOPL3vipSv
         xAvA==
X-Forwarded-Encrypted: i=1; AJvYcCXKUBwhqB3JfEvonOikj2A9O0VBoqeePUDgtvQoe1h3v0MCi0eIiyajXp9N/vqIOQQcxm0vqQDOkgSb7gPZxusR@lists.infradead.org
X-Gm-Message-State: AOJu0YxlHb6BAAROFnWJOk0i+7ZXyB+d55UeWVuR4LTx52E/58k8Kn0J
	H1of/MI1B8LbCgFEtFUY2vJC8GGdtq2GMDxn4TGHJkkLRKo0wa0nmMHbih7sTnwU5XvZgYFdvQG
	bEw==
X-Google-Smtp-Source: AGHT+IHUIOJxyeolBcosQO5hwfJGjU0ZOr0h3B9Uz02Yp0VjiDtO0sBxCHmO9LvEuqq8wtzpWFZ9kwMaRg==
X-Received: from edrm19.prod.google.com ([2002:aa7:d353:0:b0:63c:2658:67f3])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:4619:10b0:640:e78f:f34f
 with SMTP id 4fb4d7f45d1cf-640e78ff72dmr1945558a12.10.1762261148622; Tue, 04
 Nov 2025 04:59:08 -0800 (PST)
Date: Tue,  4 Nov 2025 12:59:00 +0000
In-Reply-To: <20251104125906.1919426-1-tabba@google.com>
Mime-Version: 1.0
References: <20251104125906.1919426-1-tabba@google.com>
X-Mailer: git-send-email 2.51.2.997.g839fc31de9-goog
Message-ID: <20251104125906.1919426-3-tabba@google.com>
Subject: [PATCH v1 2/8] KVM: arm64: Trap access to ALLINT if FEAT_NMI not
 supported by the guest
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vladimir.murzin@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_045911_041377_076A2B44 
X-CRM114-Status: GOOD (  10.94  )
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

Access to ALLINT is part of FEAT_NMI. If a guest does not support this
feature, any access to this register must be trapped to the hypervisor
(EL2).

KVM didn't configure this trap, potentially allowing a guest to toggle
all interrupt mask when it doesn't support FEAT_NMI. Fix this by
checking if the guest has FEAT_NMI support.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_emulate.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index 0f8311263edf..3fc62808c548 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -688,6 +688,9 @@ static inline void vcpu_set_hcrx(struct kvm_vcpu *vcpu)
 		else
 			vcpu->arch.hcrx_el2 |= HCRX_EL2_MCE2;
 
+		if (!kvm_has_feat(kvm, ID_AA64PFR1_EL1, NMI, IMP))
+			vcpu->arch.hcrx_el2 |= HCRX_EL2_TALLINT;
+
 		if (kvm_has_tcr2(kvm))
 			vcpu->arch.hcrx_el2 |= HCRX_EL2_TCR2En;
 
-- 
2.51.2.997.g839fc31de9-goog


