Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F548CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 10:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0YFcRPBWc1sBVr+dWmTbZ0TsBZp12xAJxg+DiPsswnA=; b=YEI0ua930I3Pn1KpQHmILUXCoN
	DhOKMyG2ikOVp9ia5uZH1VYd5XBxDv2QbSdRYvnr0ilKENxKQd4ZREFXEM0/HpwYYy+kAguuWxgRI
	F+zYn1Y9sdkJhN9w5P11UOet7Fny37PJjbQtFXaR5t0l5A3MBO0xgDWsQYHy0/3JGXe4EtusCv02p
	JzvLPl1hX1uZU9b7Oz9pI9y6rrfBTXAFD6o17Kuxx/hsvcTaPMx16EHogeeRek6kVp46SjHp2TO9I
	h0haeeHK5QTO18pdeIWGmpzNyfRxdEPdCW8ix3l7ExZFtELCzCBPQr9UqfSfRu8bvcrCe0+md+Z2d
	hLRIs2pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXz3J-0000000AkO6-2gpc;
	Fri, 12 Jun 2026 10:23:53 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXz3H-0000000AkNi-0yzB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 10:23:52 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-490b8adf8b8so6970995e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 03:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781259829; x=1781864629; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0YFcRPBWc1sBVr+dWmTbZ0TsBZp12xAJxg+DiPsswnA=;
        b=ot2KC0HJRScRB5xAbztMvTo7oHu/1clrlNn7VqQp5jKp72rEgjuH7ZMznMwXZu+1M9
         6G6Al4XIQK/BPB9R3QtkIZpijhPlhhZrYpeQ2jdqJJOdO7BzPJ56GuG+x2JjEnm2/FUF
         mEY848teQDjmWzPDobFmldtDeSZ2t1O3gV84Asa/BYn/MyDVSYT4hzFXa5BuyLNtSitU
         elm9TH8TIgpVkrr7o94f2U++zDheGA95hnQMQaHE59nO1wGRy3BBMKKJ9trQE+9Z9YPL
         dQKqlz3tNIxsrfyY9U52qIrkgx618l97iCQvN3C6oHtPLlUW9KSTPrDs2OmNXUuKfQrC
         UkSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781259829; x=1781864629;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0YFcRPBWc1sBVr+dWmTbZ0TsBZp12xAJxg+DiPsswnA=;
        b=CUj8UKwqdDlE+HA4+E4F727ylEsZCcOlbOrmVxfKxymz2g/OB/2LyT5VIFv7+dAGgg
         +KaN6wxAzHg9m3sLkN8DHTNUbHos56QWtF5SWp2J/VuQMZp/hcSWakHpiAShvwCKph9Y
         236VANNH+e6G3Ab2VMFFWhVFo/M++CUyxUtT/NvJ5kBqVrSJljV0q7XZgZEKYr0z5Lab
         hy2DN5cg73w12sWe6NuTgDY+dg18QVduRRDH86JtVmOU/vZTWWT7VmkwYpRWVVEUbRq4
         dQEhVMpLibLd8iLtr5hNlGbk4j4gCc3Svxq56utwRo4IDd9015fYf1tiRG9Balci+rjB
         hW9A==
X-Forwarded-Encrypted: i=1; AFNElJ+B6v/Dhfnnw4982+fKJwYH0odZArNNRu8cHtiePHh6gntbPtuZ8QDP4XBM53/vakipSResKoi3SJ75VCsnofFB@lists.infradead.org
X-Gm-Message-State: AOJu0YxfnNkCXGlrjirxUYPa+VVV9jLZaUvgyJ6CpYcl2ONb/IRRq9S1
	WiZSkxg2XSyD3X09Ke/WJq2LROjj0T0aY5YmB82QN/7DUYKyLZS1EQCuIt/nUrrM27d20BSEjpP
	zgw==
X-Received: from wmlu18.prod.google.com ([2002:a05:600c:2112:b0:490:b58a:2c9b])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:21da:b0:490:b99c:9337
 with SMTP id 5b1f17b1804b1-490ec4c1712mr18163655e9.10.1781259828771; Fri, 12
 Jun 2026 03:23:48 -0700 (PDT)
Date: Fri, 12 Jun 2026 11:23:47 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260612102347.914994-1-tabba@google.com>
Subject: [PATCH] KVM: arm64: Sync SCTLR_EL1 when injecting an exception into a pVM
From: tabba@google.com
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev
Cc: Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Sascha Bischoff <Sascha.Bischoff@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_032351_307840_A9550681 
X-CRM114-Status: GOOD (  12.44  )
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

When pKVM injects a synchronous exception into a protected guest,
enter_exception64() reads SCTLR_EL1 to set the new PSTATE's PAN and
SSBS bits. pKVM refreshes VBAR_EL1 from the live value before injecting
but not SCTLR_EL1, which is untrapped for protected guests, so a guest
that updates it and then traps takes the exception with stale PAN/SSBS.

Sync SCTLR_EL1 alongside VBAR_EL1.

Fixes: 798eb5978700 ("KVM: arm64: Sync protected guest VBAR_EL1 on injecting an undef exception")
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/sys_regs.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
index 8c3fbb413a06..7608cc4030b8 100644
--- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
+++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
@@ -257,10 +257,11 @@ static void inject_sync64(struct kvm_vcpu *vcpu, u64 esr)
 	*vcpu_cpsr(vcpu) = read_sysreg_el2(SYS_SPSR);
 
 	/*
-	 * Make sure we have the latest update to VBAR_EL1, as pKVM
-	 * handles traps very early, before sysregs are resync'ed
+	 * Sync VBAR_EL1 and SCTLR_EL1, both read by enter_exception64(),
+	 * as pKVM handles traps before sysregs are resync'ed.
 	 */
 	__vcpu_assign_sys_reg(vcpu, VBAR_EL1, read_sysreg_el1(SYS_VBAR));
+	__vcpu_assign_sys_reg(vcpu, SCTLR_EL1, read_sysreg_el1(SYS_SCTLR));
 
 	kvm_pend_exception(vcpu, EXCEPT_AA64_EL1_SYNC);
 
-- 
2.54.0.1136.gdb2ca164c4-goog


