Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CFBFCED279
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 10:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rWGqG9HBDM5MYbkTEiLSiFJkNqeWZECqlysUIUisiZg=; b=Ob+1RafwY+UxDv437G2FEdO2D4
	bUt2rx6rvhplGzcrZszCFld/DaqSMVOHk8y9IjKk/L1OBzMdmE3DlptvooelSYszYk2WVpheo6z9y
	oKJQcra4Uxwp79BSHwT1I2cIbcp9SIZPLsrC44McZeQllYn7Tr5IT8OOVRjiWQYVQTdwYPMQ+PIBK
	g5O4c0MvlJYdoX3OO9u42n4a8WPKWddlsa+todBjxx+u6dJqqTIghLwE9ljmG9ivToQrW0X+Onevr
	WHaJ4HKOHUo/2fmd46WKXkYCyOM0XVvHOFWFLTH35lAx1gcq1laiCNI3Oj9u4GrCnMfWS5vDzhEIA
	PvIDAIyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLJ6K-00000000Fkv-0zxP;
	Tue, 18 Nov 2025 10:38:20 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLJ6C-00000000FgP-1APl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 10:38:13 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-640789adcd2so5380341a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 02:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763462289; x=1764067089; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rWGqG9HBDM5MYbkTEiLSiFJkNqeWZECqlysUIUisiZg=;
        b=ypFFQiMvzTCdQQ1RESwFyGQDqkafnS1epYm4cG3+kU1orUcDTXoq3U0HNibQ3peU/I
         rmKC+N1HRj6Su7cLJnGRdPpKmy+IX+Y0r/xRnpBFTxQKnWCCJoFWfA7nA8ymqQqDtRT4
         0Z5+TX+VwC5AevERrWXkq3C45Ogimis8gZJr8X4EFBmrB90duFD+aVgChIkwkDYI4P/x
         z6SmixlORR3n6jcUXbNR8Zx/tQSNPm+9I29Gqnhmif1f+P3Tmatpgg5InxSmkT4Bykwc
         HjsaopFY1f9LT4HpZldy/HWYZo7UN1UrY72RU9b/0bww31pjxeeKWeJfOZ0EHghNvY3k
         ItJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763462289; x=1764067089;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rWGqG9HBDM5MYbkTEiLSiFJkNqeWZECqlysUIUisiZg=;
        b=JA8DrsI5SCPEPyWRgTq3xASA5JXqCdHEYw5OEK5CSttA9qt+WMBwWw04TaPqNDxqR5
         +Xns0YrmjG/dAB+Al/pQN4SmMdSBXbUXOQP63ovpTq6V6X9GmkfEokzx+rhSg0x5qA8J
         gnEaepQr6Yd+X+2Srga3rKwX3Myje3qt8H0hpSFRReNCyshy1raj3IyzmNmpThDp3vup
         taSMOefkE1VPROGKczLApwsUlps2xiXvpk2745p5XLeQ9l0xWVMuUKHrXp/p28OwhE7n
         ad7/316hkhgzPaO9MjCrB0yUpF8hi1BLGp4umu92gR38SRmXa0+82c2CGpxIx6GzwPIh
         +Mxg==
X-Forwarded-Encrypted: i=1; AJvYcCVbhIOwLB8HRo6pvh6KnLxl0PisBcNdzLBe0BmO73uQcHZ10/4xMPCSP00OoAdC1YbdwxsNgHyK1G6Y3VfLwMwU@lists.infradead.org
X-Gm-Message-State: AOJu0YzLlD550pxYUcseFPNWyhOuKeSp5g5dqmbr9RcnlU5KIR24YuNt
	pdtR4QjoXRTjIn4Bq8BiOJdDkUy9HVN3ubANYxU8itTySLDlYCD9A8XP0nk5D/dcmWPxkfL1+aN
	glQ==
X-Google-Smtp-Source: AGHT+IG6HxNtm++TYyHj1tg8cZi7k6EmVQSculrddaKbzII66k6Fs3R1cbsaPQyajmBlPWJiddeR8efdbg==
X-Received: from edben10.prod.google.com ([2002:a05:6402:528a:b0:641:9d03:a220])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:90b:b0:643:8301:d14e
 with SMTP id 4fb4d7f45d1cf-6438301d518mr8628981a12.28.1763462289501; Tue, 18
 Nov 2025 02:38:09 -0800 (PST)
Date: Tue, 18 Nov 2025 10:37:59 +0000
In-Reply-To: <20251118103807.707500-1-tabba@google.com>
Mime-Version: 1.0
References: <20251118103807.707500-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251118103807.707500-3-tabba@google.com>
Subject: [PATCH v5 2/9] KVM: arm64: Fix Trace Buffer trap polarity for
 protected VMs
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vladimir.murzin@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_023812_319352_8B6B6D48 
X-CRM114-Status: GOOD (  12.65  )
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
2.52.0.rc1.455.g30608eb744-goog


