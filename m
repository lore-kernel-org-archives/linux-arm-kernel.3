Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DDDD111A8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 12:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P0wJO5vV2lK/fO4Afzg49DdO91IUwV4uHMwdgGwAU7A=; b=a3/ahAp185DR/Fo15BEuuBqAbq
	RRT9qWSCeW37KwCScCgI0ULQTJP9YxqIMa7WRnLmttRHdTaU0Typ9LnaQVkbwE5uG5lTpzgbFuyB0
	cdZZGqsjS2ftjFnLOxnEpcdIol2tJoIP85g7YQa5kFTHMtZi3tKTgvcNIsk788pzO72YRT8/qaSss
	OBqv6Om8xlOyRtvbt/TWnlG7o3/G9J9rtK4MNpTmpXuoNfbMXmIH9iF9ypHlIHw36PA2klKs/yEBN
	1cdu0pLObPOqVs9+eRCRKzA1+7FOqW05LBROnYrFuJkiDP4rC4bvWXou8rEQmkZYtGGeuA3ar6JL8
	TYq97heQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOb0x-0000000GXjr-3UVi;
	Thu, 27 Nov 2025 12:22:23 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOb0s-0000000GXgB-1pYT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 12:22:19 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4779b432aecso4220185e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 04:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764246136; x=1764850936; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=P0wJO5vV2lK/fO4Afzg49DdO91IUwV4uHMwdgGwAU7A=;
        b=Gp2MqV4hbHVYwUTAd+asGi0PYsTR4tU5nTHyHtifPiEtIdmaWTrAI7c6Lhq9FT5Thm
         5WjDm0ITIaPW1Eg2g1ixZIdWL0nx/7j9ku7WFDc71d44xcRsuqFV9c5z2lSpIzh69Zcc
         bDaZ8MTcWzLrCpQ061hUcz2tGs2MTxBmNNK2dk1SvZCZr7QzeSjfF8CajGnt+FhQVdDU
         Z1F9Rifl93K72vtQNWEa8fyvvI8pX1xbsHFIpGyZzbjvoCJ3N9Ua4cgBvZHkL45S76TQ
         KFbKj1zKpgynnvnLTY/GL7GlRpJ1mGPaHetPUnGn7POKCioR/QGwrJPNpnnD+ey3l6FM
         dR2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764246136; x=1764850936;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P0wJO5vV2lK/fO4Afzg49DdO91IUwV4uHMwdgGwAU7A=;
        b=Rcpvnaopa+69qsQqx7LTy8ID/9Zo/tXWzwsbVl4oIT2gaaQtn1fN4TI5l9DeVPPS4+
         YhP5hBH/46y9lKpQUGlr60qnNFUB4K9lWtoS6s/EvkqklvqXBMyujhX6hUmOjQIwPIKs
         IHBMSUllxw2dYC/Xn7mhF/ZazDDLh1I5P5atLpzIMww/nhGla5tnqvOWzAiyOnq0owIR
         9soN6WoOmkcR4b6ZrEgCIfE+o0+8KNEzfB8Pv6V2MzrihJvlHXqsoXWjTgzNtnUkPQds
         JdMj/NvoM+npnvEIfSX1dfVmxOvFnlCivaRdowQmH8ZT0eBhu4gCeu66oWzQWvKE1hya
         ML4A==
X-Forwarded-Encrypted: i=1; AJvYcCXF7EEH7shGUAL7lEXQpZNaW+Qh44PEvFezakuSO6v4B8G+WxoDY0flmI3D0y3bmxmwZVyzs568qkXDuq0griR8@lists.infradead.org
X-Gm-Message-State: AOJu0YyctGGBMsyi0wYU9b0BV1vT22lInxjUdPTGBoovZ6VlxuzGz8R+
	K6N8BJIE3PPFI6zjuQ1qzrX+lIuWlNASfrDgf2l9jMWYAblKFyHGf8l3KVpVXv5LSUjIUAkAiez
	+Qw==
X-Google-Smtp-Source: AGHT+IGVtx5zzqqRmyzyliqynf3VcT/FvMKF3RNUJTbpXA9UYgwsZe54duelP0na7/gXBebJWiULjm2O2Q==
X-Received: from wmgp1.prod.google.com ([2002:a05:600c:2041:b0:477:9f92:40da])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4e93:b0:471:9da:5232
 with SMTP id 5b1f17b1804b1-477c10e1ccdmr242794015e9.15.1764246136570; Thu, 27
 Nov 2025 04:22:16 -0800 (PST)
Date: Thu, 27 Nov 2025 12:22:10 +0000
In-Reply-To: <20251127122210.4111702-1-tabba@google.com>
Mime-Version: 1.0
References: <20251127122210.4111702-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.487.g5c8c507ade-goog
Message-ID: <20251127122210.4111702-6-tabba@google.com>
Subject: [PATCH v1 5/5] KVM: arm64: Use kvm_has_mte() in pKVM trap initialization
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_042218_500883_DB6A0FA3 
X-CRM114-Status: GOOD (  12.87  )
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

When initializing HCR traps in protected mode, use kvm_has_mte() to
check for MTE support rather than kvm_has_feat(kvm, ID_AA64PFR1_EL1,
MTE, IMP).

kvm_has_mte() provides a more comprehensive check:
 - kvm_has_feat() only checks if MTE is in the guest's ID register view
   (i.e., what we advertise to the guest)
 - kvm_has_mte() checks both system_supports_mte() AND whether
   KVM_ARCH_FLAG_MTE_ENABLED is set for this VM instance

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/pkvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 43bde061b65d..f2060ca66e5d 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -82,7 +82,7 @@ static void pvm_init_traps_hcr(struct kvm_vcpu *vcpu)
 	if (!kvm_has_feat(kvm, ID_AA64PFR0_EL1, AMU, IMP))
 		val &= ~(HCR_AMVOFFEN);
 
-	if (!kvm_has_feat(kvm, ID_AA64PFR1_EL1, MTE, IMP)) {
+	if (!kvm_has_mte(kvm)) {
 		val |= HCR_TID5;
 		val &= ~(HCR_DCT | HCR_ATA);
 	}
-- 
2.52.0.487.g5c8c507ade-goog


