Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA059D41C1F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 11:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TSfRNcqgdYRR94XeQNW+/XHpT2F5cVFLgBSNfHWFmoY=; b=WXp7XI1Bd9mevluwCr9COdBoBu
	UDUbTBk2ZkgArqhi4aYEoEwXYAPNQ4qquV9D5kxCTpDf0r3+9mUNuKIS1bnae66kKPJMqJl1c5mWB
	k9C1Pn3jqGg77OzX4KrPv42AjsnbTHgEOb5+KdurFFFl/qnefDkRnXxHLt/DmAvhZvJTOF03ssvIL
	+HGn5tms3eTEpSsUfqbpz0dz8m+82AzwI404kMLk1PuShrPz1DXJO7TT45vHrUAzSAb+o4e8emVcy
	XbaWgnPMpj4BteB7wtzTrof5z9AEIHZnchfAwmQUVZMfelL8Jawqw674BSX6q2Uw/ntvth3WTj91/
	ABHNEX7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTf0N-0000000GYDe-2f4s;
	Thu, 11 Dec 2025 11:38:43 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTf0F-0000000GY9D-3rlh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 11:38:37 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4779da35d27so6430075e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 03:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765453113; x=1766057913; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TSfRNcqgdYRR94XeQNW+/XHpT2F5cVFLgBSNfHWFmoY=;
        b=AS8wgIEjYrOdv1EOZzzqSSxVyis5jRotYv6dYa9QAFSXMYfl+mJI/XiAYW/y9rdwfK
         FcIdjxyezfkv9Azvfw2LUge3euq+eP35mCH1ZINcu5ZUBAW1qdObkqec/rTj+0ng+yCR
         Byi1Oqer0wzc2ZEb/ugKZLto37MVw5g1rtFkRdB2R6N2aQKCd/75iOvPenVimfBCzXe6
         Nl9Iw8GMwQJImxO50emtDaT/xFxEeajPXO80L2Sg8EnVdlTTTd6P3UJtHs1RxbkhEPL4
         q9Fd9m6zaUZGCjNWiOJc05AQFmoO8CvReKHWbbEyzXK/GJvBG8gEsOhjc4DOMIIAk+Hp
         oGPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765453113; x=1766057913;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TSfRNcqgdYRR94XeQNW+/XHpT2F5cVFLgBSNfHWFmoY=;
        b=O2cbQ+MR1StQiLOfv8HdL+akieSYWKwMyx1/bECcJfvkF3+Zw61Z5ZYsav4QZoXA8I
         79uQwfjXSdS5rSH6/A377uHU3/QgWnQfC3wTvQuYx36i3fcS8kRsQmWefJxT0yGHj0yf
         xxsmRJFvGYTDSPvvdnEtd8Ric/2O6IvQWdpE9vT4fkb09qhzL1PkWT3tC+yNOjrp9791
         ftwuMUC4qqS3BBNUBmQYqC+zJD3NmDgVi/hMmd0KWrPwmwIjB7w7wxYJTcteJA393ILh
         eFJP+EF1+WsNhujDXwu5nD5QzCoga29o8ELO/SWpwFlGWUaAOtKEM2tEples4Mj/ldFF
         0Pyw==
X-Forwarded-Encrypted: i=1; AJvYcCXM3pr8+ZKym+b3KlVW4K0A2EpGBBBg6ddp1eRUwcFN+IreyPg2bO0/N+Ie9nBEDZufRE89bJVCYvDk0TEdXkTU@lists.infradead.org
X-Gm-Message-State: AOJu0YyJkABhd28poWg8StrCy7gXcJCYey7cFUneqaBXWYCbfmBhbMz5
	jwjQvTno6U5j+bsVyDgibOBkW37xAwWFFNJOdBXpRWpgmGyGcF04BuX73dEEITsIetFlVFPM834
	BZw==
X-Google-Smtp-Source: AGHT+IE3m9ReGHk5thHgnr5mene8nSTtvswTou0C94251E4SNHdCUfcxFkOSYWkF5uoeb8ochQ55sz6G2g==
X-Received: from wmjy22.prod.google.com ([2002:a7b:cd96:0:b0:477:9976:8214])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3514:b0:477:28c1:26ce
 with SMTP id 5b1f17b1804b1-47a837fd255mr52324735e9.7.1765453113506; Thu, 11
 Dec 2025 03:38:33 -0800 (PST)
Date: Thu, 11 Dec 2025 11:38:28 +0000
In-Reply-To: <20251211113828.370370-1-tabba@google.com>
Mime-Version: 1.0
References: <20251211113828.370370-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251211113828.370370-6-tabba@google.com>
Subject: [PATCH v2 5/5] KVM: arm64: Use kvm_has_mte() in pKVM trap initialization
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_033835_983584_46B035CB 
X-CRM114-Status: GOOD (  12.90  )
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
2.52.0.223.gf5cc29aaa4-goog


