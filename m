Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A13B4CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 20:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WmM4LftI21357OgeVjH332v8ir12kSjHUiMiWxV6Jy4=; b=3YfntGdX8d+ox/cxRnECRBXEAz
	L3ARoIOxjzoQ/wUWRU4Z9XMuK2skMP70uRv2ySq/bhvGGx1HP6RCWVp2HUWzF6HwBU3SmTyYch3yb
	fSvTsRPVtBpoY/089YX0WK4QdnLuFU0bw8LVLTXQAqZER5uU2HR4DgHKXe1b+lQ9IbTgJ9kP/EM6N
	zDxrKM4SrMI5IPhJY3U2AxkPvqXbEI2An+FYBr3cDxrewC9XjxX0RZh3hUOuCAgb4dKbjrFNwz+v9
	jkhQjnIDFuoU3T3DML1ByZxislW5QMvsPx4TGTLLfTJSZDx+O6EQ5r2qEk4DO1kz1zLL3Z01ImleD
	co9NoXqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uviIh-000000028B5-2Edx;
	Mon, 08 Sep 2025 20:17:19 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uveqX-00000000n4n-01H1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 16:36:02 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3d3d2472b92so2596836f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 09:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757349359; x=1757954159; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WmM4LftI21357OgeVjH332v8ir12kSjHUiMiWxV6Jy4=;
        b=vvVmTvmiK8B4ELrQ/5fa4S+U3OA3LjJqScblIpp+rS1ztzq/4VWRgzaLwegOng+xje
         FJ5hr9fstCgHObHgWzt0oZezgSeB62LdhXT82f2Zo0yWPfHpC0s6h6MPLkc9lTbNYT39
         H+d5APEk/WAeR/DvHJ5dvMdVbGOlTDQV6R96sNuLdQ0DJFnkHC2rfuTLs2lG+IoA0JKw
         cY9iX10PQWG0Tjt//L9aQPYMP7EEicI7JY/bEOtLEUcD/7Rb/ZPz9GEedYW3JOkAhWsy
         oqMcH3JEAkP/D1VjpdyLoigeQq4jrMWOUYq40JyP8B+4nRertR7qBtiG5iK3ijMh0yKf
         cuNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757349359; x=1757954159;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WmM4LftI21357OgeVjH332v8ir12kSjHUiMiWxV6Jy4=;
        b=nQJfOUQxCeytdbeOZ+wuXC7zO3LzFeOtOBnhOR7hXfGu9tdhBOpo4OLS/LiKlXAtzx
         l8h1ikaXOh1Mu1g7FUOzW9qWZeHNm7W2c8I34nvgH1ZYcMlobYIXE1hhwaU7t7bOUgcd
         cCVT/XNDDkcU4FOWQhDN0x+fSZxHPBqzOJal/n9kq2GOPxeEdpDErfuFlKtmdH1tF+yi
         k1UdI/ZO0bmb8C5kXn47DhMMxn8s5EWORAudcbRjguPymHQ0t/oaMe61hTMmN1TQD/Q6
         6mLzIbxHw9Z6rYNM3ZEAp6qHpYa21WeWlq2zbbSi0SmndjyNCQ+JHmTae4FtsAKrefNP
         vaEg==
X-Forwarded-Encrypted: i=1; AJvYcCUukqR2P81yv9Dq6B25VM7Fub8/AaWFu49q8pl1nflrbcCwD5zKlhwEky+4tnigzCOLBFWwXVEoqGVamhhXYcb5@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0yMec/Xv0Dmsa/nGEJYOnZAcNUv7Dj9xDfUW+sbgnfPhEL/CQ
	MFKt0McoxLVukqF4UaboES9CQBEvVBE85flHatpUE6hNfo4ANOVtIUSgqdyjSoDhhxmXIQ9vh+8
	haw==
X-Google-Smtp-Source: AGHT+IEPtQhZHhaSSiFrRywARpqA9kmZE1Y6TE2e26K2tyWQbsjjS1YtpIf0he6IaQ2gQJGqetaDUms3uQ==
X-Received: from wrbet15.prod.google.com ([2002:a05:6000:230f:b0:3c3:cdfb:e634])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:184d:b0:3e7:4265:66de
 with SMTP id ffacd0b85a97d-3e742656b0emr4522585f8f.8.1757349358812; Mon, 08
 Sep 2025 09:35:58 -0700 (PDT)
Date: Mon,  8 Sep 2025 17:35:57 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.355.g5224444f11-goog
Message-ID: <20250908163557.2419780-1-tabba@google.com>
Subject: [PATCH] KVM: arm64: Fix parameter ordering for VBAR_EL1 assignment
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_093601_043242_A3AA4499 
X-CRM114-Status: GOOD (  14.49  )
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

The __vcpu_assign_sys_reg() helper expects the register ID as the second
argument and the value to be assigned as the third. However, the
existing code was passing these parameters in the incorrect order.

Fix the function call to properly read the live value of VBAR_EL1 from
the guest and update the vCPU value immediately before pending the
exception. This ensures the vCPU's value is the same as the guest's and
that the exception will be handled at the correct address upon resuming
the guest.

Fixes: 798eb5978700 ("KVM: arm64: Sync protected guest VBAR_EL1 on injecting an undef exception")
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/sys_regs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
index 71d2fc97f004..82da9b03692d 100644
--- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
+++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
@@ -253,7 +253,7 @@ static void inject_undef64(struct kvm_vcpu *vcpu)
 
 	*vcpu_pc(vcpu) = read_sysreg_el2(SYS_ELR);
 	*vcpu_cpsr(vcpu) = read_sysreg_el2(SYS_SPSR);
-	__vcpu_assign_sys_reg(vcpu, read_sysreg_el1(SYS_VBAR), VBAR_EL1);
+	__vcpu_assign_sys_reg(vcpu, VBAR_EL1, read_sysreg_el1(SYS_VBAR));
 
 	kvm_pend_exception(vcpu, EXCEPT_AA64_EL1_SYNC);
 

base-commit: 76eeb9b8de9880ca38696b2fb56ac45ac0a25c6c
-- 
2.51.0.355.g5224444f11-goog


