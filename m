Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F07E77183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 10:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VDSaYlu5BNMFCP2Ps/7sY6DRsZy+2NDNRO3YTy1dJqE=; b=iEzPPOkuuTR5MxJrJqJInwCCM/
	aI109OWz6guqn1ED1hdT94CKf9HFoe6/Dbijcf0U30V3ugeTuWyNaDc2BNt2cZ8y62l2AIJW7h5Ao
	LpeEco5xdaUD1nN6ucCUig4D+0MuSlBl4FOhEvF2PUdKiSAZx5yjhueS4uwyWWcb7Hl3e1DQcZcF5
	tFiv51siQqZutsuIVMlGcOzNHp1+ZuInR56TAsdtrX1RJwAnqI3fZU0k6tPldN5O3c2C8H1+QoCKQ
	HttRGS+g0kaILrHLRV2f6BmF5gjEZyeeXuk0hsHni20fcN02X8SjXGulwApDyxiN6YGNAWSkWHVjn
	K8fEM1zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN8pH-00000009lBf-06At;
	Mon, 16 Dec 2024 10:59:47 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN8h1-00000009jyW-0Y0S
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 10:51:16 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-436328fcfeeso20789395e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 02:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734346273; x=1734951073; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VDSaYlu5BNMFCP2Ps/7sY6DRsZy+2NDNRO3YTy1dJqE=;
        b=SEnN9fDLoAAGm+9pv6Fv8E2Vz7YCBLveGf/51iHFFD2e4QgAQepGigRKFhTJXd8k97
         bMI+wRTB211M0+wVYs+On7Suf85MBPE2CsJuaYd/lYamsH+3DxvFzqEOHu7fo1LvmclT
         501lOlXaItvYJtzNlUqHdDLcdS4QLNBU5Xycx0VzLU45xGKJLlIjM/Fu339bkWFTvE8F
         4qcyCRXwC0iYO0nZBHhrbXZPC9RUcX3NjZfrZRO6lFW2urG49zVh57r6DU/5+s6Ezl1/
         S6YF13fKc1DPAURoc3m+ROh5t0SzY8XapItTrxW6L1fcs+WoHXPXxdFHo3AjkAR/sElt
         k7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734346273; x=1734951073;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VDSaYlu5BNMFCP2Ps/7sY6DRsZy+2NDNRO3YTy1dJqE=;
        b=o0yS9/NFX0q1PfwvccnjuILe9t7s9r10MCceUbOjFgH3Z5mkca+BvE1eI9ec9Yaut4
         C24IRA0zuHzXuC4mGlv8PP5OAz/GBb8L9OkwYza9Np2sUX8NakSfUVnVdsVREpg56LJY
         j+J8X7K/nCpSfpjn3Huhjqyek5WIEQPEeIkDCOHBbnkRhqUWfp5WEqQv81LxjoE0ln4v
         YpzsSEw5eCGAxEl85K9WjqQFjiNBsmi+cZZBPOm2fuCxyx/RXz7e2oztctb1pv5OES8N
         OXBKDCZKlCFN3qMO4DyR9UwTeHA3T8T+sfa0qZAE/n6fD00vWZTGqp3s+HJXh1W/VaN9
         nO2w==
X-Forwarded-Encrypted: i=1; AJvYcCX94lrvdH9k3Vxc6o5xa0nIqpkvs6nDFCPuIz8+VnzBdrmUPZ2MhvLT72HbM98kbhbu8rkRNVZJFcSknHA35HwT@lists.infradead.org
X-Gm-Message-State: AOJu0YxtemFb8WmLUUWdeFJq5IIMKeMT03NzNQc4JlRLtnn+be4vVDGp
	p2z460TFnY/BJihLrBEG3fPV6ZXA1WH0zPwv5f/xJ4b4tdMpaT2uEjp5xBBtx8Es4NOSQbZZQA=
	=
X-Google-Smtp-Source: AGHT+IGTCUWt0z19T0g5/8JOxHn663C/7YVEmI38PMNTQ3Odt4zIxqDGQFfmtIF8bmQlzq9AaQluAPJkGw==
X-Received: from wmik26.prod.google.com ([2002:a7b:c41a:0:b0:434:f801:bf67])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:c0d:b0:431:52b7:a499
 with SMTP id 5b1f17b1804b1-4362aa97465mr91799405e9.20.1734346273238; Mon, 16
 Dec 2024 02:51:13 -0800 (PST)
Date: Mon, 16 Dec 2024 10:50:47 +0000
In-Reply-To: <20241216105057.579031-1-tabba@google.com>
Mime-Version: 1.0
References: <20241216105057.579031-1-tabba@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241216105057.579031-8-tabba@google.com>
Subject: [PATCH v5 07/17] KVM: arm64: Fix RAS trapping in pKVM for protected VMs
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	qperret@google.com, kristina.martsenko@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_025115_164552_20565597 
X-CRM114-Status: GOOD (  11.11  )
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

Trap RAS in pKVM if not supported at all for protected VMs. The
RAS version doesn't matter in this case.

Fixes: 2a0c343386ae ("KVM: arm64: Initialize trap registers for protected VMs")
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/pkvm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 3014f3295d81..25bbd4c99d30 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -70,9 +70,8 @@ static void pvm_init_traps_hcr(struct kvm_vcpu *vcpu)
 	 */
 	val |= HCR_TACR | HCR_TIDCP | HCR_TID3 | HCR_TID1;
 
-	/* Trap RAS unless all current versions are supported */
-	if (FIELD_GET(ARM64_FEATURE_MASK(ID_AA64PFR0_EL1_RAS), id_aa64pfr0) <
-	    ID_AA64PFR0_EL1_RAS_V1P1) {
+	/* Trap RAS */
+	if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64PFR0_EL1_RAS), id_aa64pfr0)) {
 		val |= HCR_TERR | HCR_TEA;
 		val &= ~(HCR_FIEN);
 	}
-- 
2.47.1.613.gc27f4b7a9f-goog


