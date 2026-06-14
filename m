Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25275CD98DF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 16:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DTU517bylf7hW4wRPEZ03YW0srH2bIdRmAB9JurEalI=; b=FcvVfJQMWNFG9AiynQPn5XVDs3
	v5rVM+B8mjyic0ITuy2FXkuzB3rh2gaSaYohZSFoLd7d8+jrRdQaNU/CnXV8NhMg3UqXPMmJlPxxB
	vhV2Qvfne8+wKV/lfrp6Udv3Oo01dqom9o+4L5yeCMFGNc9sGAK99WH7pqpvz+IzJia0z2BScTIPS
	Onx3NaN01pXjru+5e8Aa/LR4VVTr55Qa1FTPOEGt44wBG/E/LAgCnttcLsH3r/nEuxDrJt4QofZ9B
	D2lbNmDXbcEgigUFsbYHamv7lPquGfTsQ1urMNvggalBgPdKz9ybZCbhN2DRx+mX9mqzlYcgWRubj
	dBHlpzMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYnmV-0000000DAoB-2pyG;
	Sun, 14 Jun 2026 16:33:55 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYnmM-0000000DAiP-1ahk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Jun 2026 16:33:47 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-490bde3d239so16939455e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Jun 2026 09:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781454823; x=1782059623; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DTU517bylf7hW4wRPEZ03YW0srH2bIdRmAB9JurEalI=;
        b=aWThOEX8p/WCo2zyr17//l/txXVbqh60GVwGUHdfXUXp2blqqDFF7Wex6J4G0pJof0
         lXmXpYmLmhqgyd5OynUPDRQQ/7pscjUhL7HeRJdC6XW6zTze/eeAMBWY3wUWYOhqp08F
         S4vDiFq4/lA3PwyTu5I+PQ37wh2bE7kSifBs4e+DhP/GOQ88hXNUDF2EZ8j8AH9er7bH
         s+ZYYj3oikXhV9b3F8tbX1q3NPGeFAcVCrcEvnHtNTd08yA0GfsXCy8CICK0z3dMjUXs
         p1c6TS90NyfzHlzebhoSVC9Ef2J05HNq3VvIL6wdGz6+aQEI5YbGoeIaqF0aJwddkrpc
         U4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781454823; x=1782059623;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DTU517bylf7hW4wRPEZ03YW0srH2bIdRmAB9JurEalI=;
        b=A+ofver+FB3Mk631gvnH0PxJg5z85RJ8HbHoJpxlnGsXwjp60KtnJNk3Q5iRna2yQG
         rDNKhrlu1JnXsT1HbPihRud75szHJ4+6/MUQX1I101tshpOAqlYrV+Jiv7Ym3e4KfXAh
         S8tND17hMZTDJbZBjkrX5614nWboY/iV5wBaBGeHo6MwGzx6LIYZksAkvmVFF1EqryYo
         Wyjvl44wzA4rdaMTVX7UCmLtlw000EeCUI+qJIwGI2/a6kisX+uvFvLP+dV0GzO9BtuX
         LuPAWXk3PSpP/J2rxFjWjb8SKZo1DG/V+2fsPu34QR3v0NK4tZ3gH8P7XjyHwUiBot/0
         yi8w==
X-Forwarded-Encrypted: i=1; AFNElJ+WprVTtFD70McTocVYozmqtA1b8KaGSxp3lhHQqlNfF8rRhKaFapqpTaETcIs4Mwj9Kv5OyN/lnMk0c/ve4GXu@lists.infradead.org
X-Gm-Message-State: AOJu0Yyi9sWALugEuUiWQaOU7a838vJ5fiBZjVdfm8QP3LN2YFpJFDj1
	1NTj6LrG+8JNDado9XAac9qFNHBgZdLxu9t0JmnG3EoMtmdFz4zCYkM4CYe7FOwp+5AYFzLn8hg
	bhg==
X-Received: from wmqe21.prod.google.com ([2002:a05:600c:4e55:b0:490:b058:c623])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a7b:c8d9:0:b0:490:b3e7:4614
 with SMTP id 5b1f17b1804b1-490ec5020dbmr94558075e9.25.1781454822969; Sun, 14
 Jun 2026 09:33:42 -0700 (PDT)
Date: Sun, 14 Jun 2026 17:33:34 +0100
In-Reply-To: <20260614163336.3490925-1-tabba@google.com>
Mime-Version: 1.0
References: <20260614163336.3490925-1-tabba@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260614163336.3490925-6-tabba@google.com>
Subject: [PATCH 5/7] KVM: arm64: Set IL for emulated SError injection
From: Fuad Tabba <tabba@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Sascha Bischoff <Sascha.Bischoff@arm.com>, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_093346_429040_09FE3FEC 
X-CRM114-Status: GOOD (  10.16  )
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

kvm_inject_serror_esr() constructs an SError syndrome without IL. The
architecture mandates IL=1 for SError unconditionally.

Fixes: f6e2262dfa1a ("KVM: arm64: Populate ESR_ELx.EC for emulated SError injection")
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/inject_fault.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/inject_fault.c b/arch/arm64/kvm/inject_fault.c
index 444d219b0217..d6c4fc16f879 100644
--- a/arch/arm64/kvm/inject_fault.c
+++ b/arch/arm64/kvm/inject_fault.c
@@ -381,7 +381,7 @@ int kvm_inject_serror_esr(struct kvm_vcpu *vcpu, u64 esr)
 	 */
 	if (!serror_is_masked(vcpu)) {
 		pend_serror_exception(vcpu);
-		esr |= FIELD_PREP(ESR_ELx_EC_MASK, ESR_ELx_EC_SERROR);
+		esr |= FIELD_PREP(ESR_ELx_EC_MASK, ESR_ELx_EC_SERROR) | ESR_ELx_IL;
 		vcpu_write_sys_reg(vcpu, esr, exception_esr_elx(vcpu));
 		return 1;
 	}
-- 
2.54.0.1136.gdb2ca164c4-goog


