Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E81A5CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 16:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P0JxDDL/a2cg7BfWdupOKX50oyJPHi3eGmAcnoWVFfs=; b=qT3lIJwCXd1muyr/AEn+NvvJHs
	KvwhHKDDm6ILk9zJZqc9p1bgiSQbPvQaOvhBujjpVwH/MGOFHROdp+ds12em8XhxtNbIEtulGFtyQ
	MQ73U17bphArOM2ggheE49t4xeylOv17QKfDT7/bgMIW235S4KKz2Vy0aCFSzUoe03EBtFVB7fnFK
	TD2AL1wooBS61Vq/s5l48rOStFVzvePtzDykOK/Ok8kJSF/L9a7Oxg2iyyq5K0KrXbY1kKsK/VjIM
	2cKt/aE7m4YmZ4BhSZjBuNgE/e/YxuBTOWuEDjaM7IPk9vTts3EtGoYWbkHMJCfaV0DYPjIAtJeiE
	kwsO7yqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYnmV-0000000DAns-2POm;
	Sun, 14 Jun 2026 16:33:55 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYnmK-0000000DAi9-2C1f
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Jun 2026 16:33:46 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-68b3e28267dso2650907a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Jun 2026 09:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781454822; x=1782059622; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=P0JxDDL/a2cg7BfWdupOKX50oyJPHi3eGmAcnoWVFfs=;
        b=U7POq4cZ4JfskPYOwwmH1MnnU7C96jBIKD+sws878dmXqlA9qzsxGLkN52rFSTULqt
         BCax+IhvdJh6eq4HS4blpLPXDDLYOWYNTfyaVKOSzaU8PAR55gPzHvO/P386amX//LO8
         p6lyulDun/WPC1zWoqC+zUxqLbTGoblTY590jtAn8UaG4xI9jUm9rbRWA5Yoeb31RGDC
         0ca4YxFiNdEECxf1/b8M0gyDaFrijkSfviuurRE8uMY8LMOpYANmBvWyBwE/6B7i8XxU
         uNKR4B8hQ5uwsHL2qqQrKtiUgrSX6mdiMMxTgPi0/ejF2HoWE+LrYcTHb10Z4NL45ZNN
         cUPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781454822; x=1782059622;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P0JxDDL/a2cg7BfWdupOKX50oyJPHi3eGmAcnoWVFfs=;
        b=E1ZaeD4HVyxudFIO49J8+G7Y7CX4jiqy7coACozckie4NBo7ecciWqxKP/nH+7SIBB
         +LFOLJU6xOM2bAz+3vi7DoaWakXunbAnrVtlHR8kO3RgJsAW8sqPfMLJ1yUjKHi/mENS
         Fc1dzh6MgQBURR+8Xu/qXz7EqWbZ4DxNGFT0mN6doBPWIh+uqgs3GIbGwAu6J83GybAL
         NpwfRrZT2bIsHRFWRmAr7AarL0N6Z05TrhlK5bW+2hCHBqoTwRuQplnn5dsY7PvVoxsb
         21hs++h1sukPX7lRbLBMPq3BRk09Kn8hmLO+yhBN3/mm7e2TUxxV3BJWS6WJDLjHxUdS
         3ZOg==
X-Forwarded-Encrypted: i=1; AFNElJ8lyrlnSX5ewrsrLyFI3HZoR/MO2qWOe3RqDre8L4Bf3QfDJ3mIKGVWmsl/wCbpPSjg0K65O3YQDiIwtZRp4lQ2@lists.infradead.org
X-Gm-Message-State: AOJu0YwR3qoIcAWnYEfKUGYcckPt65Slvw3Jl5xHq20hmklHbBo4hduL
	iWPFAjmJP8unP8K/+RM5dZ7NDN1wV7gCtbNm81q/MEQanvLhgOheUh76ZtvGRUF/JBwOa6SbedI
	80w==
X-Received: from edup20.prod.google.com ([2002:a05:6402:10d4:b0:68d:af88:b33b])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:350c:b0:687:9c0f:5897
 with SMTP id 4fb4d7f45d1cf-693c6a16992mr2491039a12.9.1781454821737; Sun, 14
 Jun 2026 09:33:41 -0700 (PDT)
Date: Sun, 14 Jun 2026 17:33:33 +0100
In-Reply-To: <20260614163336.3490925-1-tabba@google.com>
Mime-Version: 1.0
References: <20260614163336.3490925-1-tabba@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260614163336.3490925-5-tabba@google.com>
Subject: [PATCH 4/7] KVM: arm64: Set IL for injected FPAC exceptions during
 ERET emulation
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
X-CRM114-CacheID: sfid-20260614_093344_583514_2A6D4127 
X-CRM114-Status: UNSURE (   9.99  )
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

The FPAC syndrome constructed during nested ERET emulation does not set
IL. For FPAC (EC=0x1C), IL reflects the instruction length. ERET and
its authenticated variants are always A64 32-bit instructions, so IL
must be 1.

Fixes: 213b3d1ea161 ("KVM: arm64: nv: Handle ERETA[AB] instructions")
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/emulate-nested.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index dba7ced74ca5..4b39363cf891 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -2777,7 +2777,7 @@ void kvm_emulate_nested_eret(struct kvm_vcpu *vcpu)
 		 */
 		if (kvm_has_pauth(vcpu->kvm, FPACCOMBINE) && !(spsr & PSR_IL_BIT)) {
 			esr &= ESR_ELx_ERET_ISS_ERETA;
-			esr |= FIELD_PREP(ESR_ELx_EC_MASK, ESR_ELx_EC_FPAC);
+			esr |= FIELD_PREP(ESR_ELx_EC_MASK, ESR_ELx_EC_FPAC) | ESR_ELx_IL;
 			kvm_inject_nested_sync(vcpu, esr);
 			return;
 		}
-- 
2.54.0.1136.gdb2ca164c4-goog


