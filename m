Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A7B0C44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 11:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GbpJOUsj+jmFdKgKTCHaN8Qj3FdeUCxTExCcXcyJF/8=; b=O4+DUdVeZrmh0JaBu1+lh2TUwt
	4u/GKXrkdNgNvMpcAojwffDm+wemuy+uW7nZyqS4EVfj7wiZUGAtfQVLAp0VXgcA1e8c8Kcr1rM/2
	EeT+Zq/bSscKZRLBzoc/L1E7Lcix3Zo0LyUZ6KjccL9e/PJy/N1+Sq5E4VoLLnUsxJiINSeckoQds
	Ajz4xMMUsSFhoV7TyUT7fOFVc9SeT2qUkVTWGPMZJ2bHA2CxuvHOdQ/e+V4+tOAUgBIwRERcpbiUq
	7FpiW4GEc8nHHJRsBzE8sWS8G6tmnTP6AJuZEw4F9KqEVuqlrB5YIBWuQa/o9DGKXHc0v++XUgqhJ
	h6lbcSkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vislg-00000006x1t-3w3Z;
	Thu, 22 Jan 2026 11:22:28 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1visla-00000006wz4-2gU9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 11:22:23 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-43065ad16a8so537989f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 03:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769080940; x=1769685740; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GbpJOUsj+jmFdKgKTCHaN8Qj3FdeUCxTExCcXcyJF/8=;
        b=GSvOkqBfWKXSjd2cYuiRuh0XqI76EnyVEOCcJ2Avf9T0wkysdokIv3JNJL3ExxBtDq
         ldfqO/zdiOaAyKeXpwcze7jX5meUp2YBaDBfFUvExn0YkfXMMVBj2PWRsKlDtNb5R8wc
         eH2i8H2N5+AmMA42lyBqjnYzA94xAeYKd+QOpkzsxooMJO3oinuwYNWftOcXwz+C4dM8
         1otgdvoJv60MWaRq3JYMkDEX6FlolzRC5D4HqR+LGa0vaXPp5vAkLJ7GzET8f4eNRRq0
         q6aIGPyeahrpSPx1NRLMRVeBrASnGPcuJyd3GeswARbcauDkqf7H9jl3675RR6wlGzWu
         CesQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769080940; x=1769685740;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GbpJOUsj+jmFdKgKTCHaN8Qj3FdeUCxTExCcXcyJF/8=;
        b=pmdhwns5bfyA8PxNrw92/ZFWBVhDyjttsHuxpiNg87IM4qizt2Pv0f5hbKEE6TzKCx
         aRVrpwv9ElriPc9UmaHYSwnKwMKZEbXIZprCeEpPk4QQpQwaEpkqgrnRlG5n1uoggTuz
         4miLgdAdtL/y57XcrMP9I+fkQUISukgYTsfiW9q9wG9PyuN0bFZVSv98cU3iqYtFnoJo
         GpE79eB+3GX47/1MwzW49KKQzdarL2ocUgvXqe99PDzrx+Oa25wc/1ubn0uf8u6WprWV
         PKpfCj1UCHyZzB0QkCnI3BS8MM1GdstjC2uBeI6CnOBYya6u9ae2BK1Oobhafa4p4WX9
         EjXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIOJLCFD1DTkKWvVvUHMRrBcrjoyczOmsfiCAUHxTQPVnNysGSEmO3NIFsP41v/oIIH71mLlMqixkbKAdN0cQL@lists.infradead.org
X-Gm-Message-State: AOJu0YwfKrtZ34sz9YFECYByBBK9bJoHrcSowEo/hCegO+NMm4O8OHyO
	Y+uq4cM929dgN+LGAqlbF+ymHjgmONU/fENHCsXCh0nq5xEbCrB5e+3h8ivnAal9v4E4KIxpaE+
	kKw==
X-Received: from wrbcp14.prod.google.com ([2002:a05:6000:400e:b0:430:f2e6:376e])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:5552:0:b0:435:97b2:a9b
 with SMTP id ffacd0b85a97d-43597b20ad9mr9445342f8f.37.1769080939974; Thu, 22
 Jan 2026 03:22:19 -0800 (PST)
Date: Thu, 22 Jan 2026 11:22:15 +0000
In-Reply-To: <20260122112218.531948-1-tabba@google.com>
Mime-Version: 1.0
References: <20260122112218.531948-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260122112218.531948-2-tabba@google.com>
Subject: [PATCH v3 1/4] KVM: arm64: Remove dead code resetting HCR_EL2 for pKVM
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_032222_680662_43C2937B 
X-CRM114-Status: UNSURE (   9.40  )
X-CRM114-Notice: Please train this message.
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

The pKVM lifecycle does not support tearing down the hypervisor and
returning to the hyp stub once initialized. The transition to protected
mode is one-way.

Consequently, the code path in hyp-init.S responsible for resetting
EL2 registers (triggered by kexec or hibernation) is unreachable in
protected mode.

Remove the dead code handling HCR_EL2 reset for
ARM64_KVM_PROTECTED_MODE.

No functional change intended.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/hyp-init.S | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-init.S b/arch/arm64/kvm/hyp/nvhe/hyp-init.S
index aada42522e7b..0d42eedc7167 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-init.S
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-init.S
@@ -260,11 +260,6 @@ reset:
 	msr	sctlr_el2, x5
 	isb
 
-alternative_if ARM64_KVM_PROTECTED_MODE
-	mov_q	x5, HCR_HOST_NVHE_FLAGS
-	msr_hcr_el2 x5
-alternative_else_nop_endif
-
 	/* Install stub vectors */
 	adr_l	x5, __hyp_stub_vectors
 	msr	vbar_el2, x5
-- 
2.52.0.457.g6b5491de43-goog


