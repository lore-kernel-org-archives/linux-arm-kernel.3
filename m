Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E26FE51E4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 08:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YJY1gPOgAaLT6+Kz2+e0ENJlulAl4LJwepN5ROf8PcQ=; b=Cpbn2TgA+bluVcioGeqxzCI8HF
	iAWlBnB6gepIrAprjBRGXbm/JgP/ATmHDjnFQ5M0F3ABBU8GsKGlyr0LV402l0EAGsUNZu+2u2049
	enZyXec/kEOKDe59XJgsLJ6Bnz6sdfNIqZ+jKv5kw2fiILKB9xs8exrJJl5X1Nn/DdUHuFY0j8C7h
	ZZfLmGRdOpZ5swcmidXH1LM1msYP1NdsteG7GDZ+XRFQlexxgz13Jed3KfJtg2YTq/NU8auX1NtD8
	FFzYoacFlOccqEoYwtESqM9cxDw/aCcwSqfR/r0DmDFWO9Kr1uIwpo+M3Jr6vvfRWl1yt4PIPTazw
	O/QoVxAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGCDu-0000000Ct2O-3EiZ;
	Fri, 24 Apr 2026 08:49:18 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGCDs-0000000Cszn-0WGL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 08:49:17 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-488dcaf2f2fso60939055e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 01:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777020554; x=1777625354; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YJY1gPOgAaLT6+Kz2+e0ENJlulAl4LJwepN5ROf8PcQ=;
        b=F/YLscbO/m0tbzGRqgW5Wfo52J7oB/gJZuogktUawabQSP6FlQcvzod0kFFjmvh7mg
         arcQRi3Z+w+Lp0GDnMJrepI08vHlBFS0tXvGzoYlnwftBMwUbXgT8IM2pikSCeS08LIJ
         LOMn9maSt3mYjYtIxm/RU4k1oZbWzMoWd9sHyJhyyaRHSrFNkX0jzKfxp2xx5Iu7MmKA
         xjZiNw3huYQmtzmkxnAY/3MpiIzdP+6JIJD1Z4ENAxjLvVz0q9OZ/mr/r1Bl8fXnWVcp
         5RxG1fkGBFTzsp/NZjI9GNmtb4SJnx0Gp+npOCXiX0FRYk66lPOzO/j0ZcMi0SpHKe7b
         74JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777020554; x=1777625354;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YJY1gPOgAaLT6+Kz2+e0ENJlulAl4LJwepN5ROf8PcQ=;
        b=mAZz1N9HLtD3oR6G2l1iPRTE9ddEaI2437HmmLm6/7/R9mR9NrwcRwDBcmzNC1bX/3
         ECdEPEuMs4v9bPuWespS7XJnNSn7skdNDD27F08tshCVUQFfB8UDmcBF9cuEq/zoSp55
         wqftlVY59OUhpKZ6mfQzRJM+KtnjibTRWaXISC5e8b7cXihpiTlXmQIfRN4KNg2Qdd65
         4739aYqE4gRYGlRxob5X5ualbwMVvr78ZylaRAHSiOVKGlwUqBaKAOw65B1dmyTnI8lS
         gi3CT9/lHM/5DF90aGyJmSP4YGrekSOPqIsbSUzDlVxF6xTl6iIUHW5DjYL6Tf6RY6GS
         kG6Q==
X-Forwarded-Encrypted: i=1; AFNElJ8o1mELLE7QuJrMILZTAAsXDQM2Czi14ZWycgb5FHT2iKR3bBSjRA5quZ9gAZlHQagWcl7JHXKLkqvsZQ1ep8kA@lists.infradead.org
X-Gm-Message-State: AOJu0YymbotH7sNfJHBUqFvIw8Cy24INNGSXjFNRDVmA3mSsTcrzTuF2
	nprrV4FbbObQOF7kiQG/u65GOXd8aD/Y8QqJ4w7k9wE+DeiWSH9lvHslGFDEuqCCarOJBWyP+vo
	bjg==
X-Received: from wmpz12.prod.google.com ([2002:a05:600c:a0c:b0:488:ab5f:9e9e])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:19cf:b0:48a:66a8:9981
 with SMTP id 5b1f17b1804b1-48a66a89b9dmr10997185e9.27.1777020553789; Fri, 24
 Apr 2026 01:49:13 -0700 (PDT)
Date: Fri, 24 Apr 2026 09:49:06 +0100
In-Reply-To: <20260424084908.370776-1-tabba@google.com>
Mime-Version: 1.0
References: <20260424084908.370776-1-tabba@google.com>
X-Mailer: git-send-email 2.54.0.rc2.544.gc7ae2d5bb8-goog
Message-ID: <20260424084908.370776-5-tabba@google.com>
Subject: [PATCH 4/6] KVM: arm64: Fix kvm_vcpu_initialized() macro parameter
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Cc: tabba@google.com, catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oupton@kernel.org, qperret@google.com, suzuki.poulose@arm.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_014916_170040_064AEE08 
X-CRM114-Status: GOOD (  11.86  )
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

The macro is defined with parameter 'v' but the body references the
literal token 'vcpu' instead, causing it to silently operate on whatever
'vcpu' resolves to in the caller's scope rather than the value passed by
the caller. All current call sites happen to use a variable named 'vcpu',
so the bug is latent.

Fixes: e016333745c7 ("KVM: arm64: Only reset vCPU-scoped feature ID regs once")
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_host.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 851f6171751c..0e5dbc1c5879 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1548,7 +1548,7 @@ static inline bool __vcpu_has_feature(const struct kvm_arch *ka, int feature)
 #define kvm_vcpu_has_feature(k, f)	__vcpu_has_feature(&(k)->arch, (f))
 #define vcpu_has_feature(v, f)	__vcpu_has_feature(&(v)->kvm->arch, (f))
 
-#define kvm_vcpu_initialized(v) vcpu_get_flag(vcpu, VCPU_INITIALIZED)
+#define kvm_vcpu_initialized(v) vcpu_get_flag(v, VCPU_INITIALIZED)
 
 int kvm_trng_call(struct kvm_vcpu *vcpu);
 #ifdef CONFIG_KVM
-- 
2.54.0.rc2.544.gc7ae2d5bb8-goog


