Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF98CD3424
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 11:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pkGXruA+MAauMM9ApRELF9QcQ1O0uA1Qqp7VMYhHPII=; b=21YrrvX1ypA9GUaSN+eA11VyLu
	FVl/oOnPcgi/fOju/dwrYsf60WTshNqIFRRoKw48BGDX/f0EibI7T4eAp039gjsYp+N+/CQoudaTO
	ZjPdgOBp9ACkCR4338aQkbz8G8nCkN+CXf8EIEQ1cfhoyfiQ5eiLBW0nJTiRL2NlENZZ2nDjmOVqg
	nu5v/Dd1nT13lCHfJRSWFbxwwoYoQxYKloS4Ms8drFSPzcvnvWZ9jp2FeWZijISAkq1RfY6TYebDJ
	Qq+F+Y8Ig2NLnYuhmjZsY+5otf/sxni/vwQx3OqEJGYmZONfI+XmkAKB8nutwxtihv9/gtrlhOjg3
	D1zLzKOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIlwW-00000006eoT-1mbi;
	Fri, 01 May 2026 11:22:00 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIlwT-00000006ekQ-0UjT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 11:21:58 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-44a122a5128so787263f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 04:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777634515; x=1778239315; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pkGXruA+MAauMM9ApRELF9QcQ1O0uA1Qqp7VMYhHPII=;
        b=KdnjXTnFIiOFW4LY6+sNUYsKAONPTMqkUduQrMFrwYl5CCe0026v5EJ1u9vzqQ0QYg
         6/mf0evltzxc8v7GQr4Jw0/XuwleggMvHFYe+m+y0suKGGfi50RSJWN1aVXIedkvzOa4
         vCWjtWJlm/X0j7hhuV31b9MGyWWfJUQ72NoOUhIlIuoxn6pmaLsCSMj5lF/Qq35NfEkp
         aIKP8MOE/6Ou4AoawDU4VQmQAr68SLfgyEOlowqrDgpSLtyjPT1JEAi7NnVUFOZ9JT0n
         D2CJPJlMd1H1KX5RRtjeGFx5NwRPOM781ZX2I6ovUZA/La+K4t+PZMWEdjcVGq7FxfiJ
         6how==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777634515; x=1778239315;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pkGXruA+MAauMM9ApRELF9QcQ1O0uA1Qqp7VMYhHPII=;
        b=MLlBNzmtlXHYNZ40/cCWDk+XrfwPSk6btV1ngak1pekSSZMLPfEs5RfZDwwskqUyAT
         bD9oltvDn5UBy9k5ouGAXTgzzbHpF9OB8P41lffvhFUNr49i+eNn/bs8sulhZ+nC5Gwy
         ApczaUQVr71ov/GQH6v7T2lfYUhNuIVgDAV1kXVlPKfjnhQXFUbRrCfHalNyb3HxGtu5
         b4yYCG6k5rzQ1f26kfm4JGS+L1qQJ/faBCJqAXEgQlywjaGX0EIDwrROFSkZZz1C9dcl
         tE2KwkGJe4vDvpHKxwsZv8xo8vEVbCq1Dp8E1hIl88fPtnk2dClFuxH+0J+tpMf6HUvw
         OAjw==
X-Forwarded-Encrypted: i=1; AFNElJ/18fB2BQe/PsCtMpopewjs9aNXC0XVa0amrRftUpg+zC83HwkkKE2Ks7OmtBo3Fy9vu6SUJtUbw/JPBxtH2WRW@lists.infradead.org
X-Gm-Message-State: AOJu0Yxpe+UThjkZOk2/PAikQdHG+4D+zK4gUfkO/fZ+iy7nEOmwIAKe
	WWxLS6kwYrTnDKlsDfaXLTd8v8dqygXwWXA0J5Wups+pA9rgAF1ZCWE7B0JOB+M60sZLrnuumz/
	RJA==
X-Received: from wrcz10.prod.google.com ([2002:a05:6000:454a:b0:44a:2a68:f4aa])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:24c5:b0:43d:71f4:7ed5
 with SMTP id ffacd0b85a97d-4493cc3fdffmr11707041f8f.17.1777634514643; Fri, 01
 May 2026 04:21:54 -0700 (PDT)
Date: Fri,  1 May 2026 12:21:46 +0100
In-Reply-To: <20260501112149.2824881-1-tabba@google.com>
Mime-Version: 1.0
References: <20260501112149.2824881-1-tabba@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260501112149.2824881-4-tabba@google.com>
Subject: [PATCH v2 3/6] KVM: arm64: Fix __deactivate_fgt macro parameter typo
From: Fuad Tabba <tabba@google.com>
To: maz@kernel.org, oliver.upton@linux.dev
Cc: james.morse@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	qperret@google.com, vdonnefort@google.com, tabba@google.com, 
	catalin.marinas@arm.com, will@kernel.org, yaoyuan@linux.alibaba.com, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_042157_197802_42DF61D6 
X-CRM114-Status: GOOD (  12.55  )
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

__deactivate_fgt() declares its first parameter as "htcxt" but the body
references "hctxt". The parameter is unused; the macro silently captures
"hctxt" from the enclosing scope. Both existing callers
(__deactivate_traps_hfgxtr() and __deactivate_traps_ich_hfgxtr()) happen
to define a local "struct kvm_cpu_context *hctxt", so the macro works
by coincidence.

A future caller without an "hctxt" local in scope, or naming it
differently, would compile but bind to the wrong context. Align the
parameter name with the sibling __activate_fgt() macro.

The "vcpu" parameter remains unused in the body, kept for API symmetry
with __activate_fgt() (which uses it).

Fixes: f5a5a406b4b8 ("KVM: arm64: Propagate and handle Fine-Grained UNDEF bits")
Assisted-by: Gemini:gemini-3.1-pro review-prompts
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/include/hyp/switch.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index 98b2976837b1..bf0eb5e43427 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -245,7 +245,7 @@ static inline void __activate_traps_ich_hfgxtr(struct kvm_vcpu *vcpu)
 	__activate_fgt(hctxt, vcpu, ICH_HFGITR_EL2);
 }
 
-#define __deactivate_fgt(htcxt, vcpu, reg)				\
+#define __deactivate_fgt(hctxt, vcpu, reg)				\
 	do {								\
 		write_sysreg_s(ctxt_sys_reg(hctxt, reg),		\
 			       SYS_ ## reg);				\
-- 
2.54.0.545.g6539524ca2-goog


