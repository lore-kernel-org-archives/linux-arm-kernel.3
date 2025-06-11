Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC4E6C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 01:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HFNzybZyx0Wu7yBkyufuhZBtndB539SrR/i7yvdQCgY=; b=CSqZmz3RhEXmTEgSbL13Lq//9J
	LneUd4Rl2T52UWMOpOoXXniic31YOH/Ci1ixAFzsJOsisJjXZ/xfxKYOKwbENvQ4kLsIyG9hwLUnL
	XRvJhz7VWwAoYwhbyBp5bwYkUfnHmw5OEIteXbgGF3tvRrqbL+CYb3GipX3XNt2hfe4haD5Om022h
	tysdwBBGO/hXJE+Px95S0Mh2KzKr6jCQI21Z7r1nh9pc3gdQr38yr997RGMhscyibhM/7dQMRWtjE
	qDkU+2/tV9+yAyIVcPo3JrzuwqDOM6UBDOZemAqPK0PN85wrg2o3LwQSPWmrrpAMBT1lDX9CUgUSH
	HcCDKatQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPXCA-0000000BvHu-2X8q;
	Thu, 12 Jun 2025 01:57:34 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUF5-0000000BXpm-2Rnj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:48:24 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-747d84fe5f8so177155b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682102; x=1750286902; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=HFNzybZyx0Wu7yBkyufuhZBtndB539SrR/i7yvdQCgY=;
        b=cCEL/2eNNU88+QaLOrUPX+0uagGQaKg4fLSB/TiQ9am9lgCnlHHg4d27oEQkDxzLSw
         SSGtO3GK0hcGqx7uQaMbssodEs4cIiRR85zP4polkfa6WGOO2eZlCXfjjvipCVrwHLjf
         Wjyh5CGM8tFlSo5dR1AULSou8Y8wDr69kNgiKBHc2YnszNO5JcJSC50HMpHLdjbixDX/
         gYZt7bObjKKzOaBCA+b4MMOGV4x4TnCv77ko6b8K9Tezx9DN/BG59h3NM9Vd/kvnVIq3
         5yFfEkA0bqX+krp5QcVRLQgXo71F/iR5ivWApxkReJrvjbYimnWDG+YlP7DcMkWFEB72
         edzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682102; x=1750286902;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HFNzybZyx0Wu7yBkyufuhZBtndB539SrR/i7yvdQCgY=;
        b=oqZcetl/p9PBafMA22b9DlCAdiXaJhZg01rQPzebn0Fm5NreWhXP8vLQh2czJbgwkL
         nYqHRkHvAS5TDU2g+kM+RseNDjn4kYFTy7RBeoLFjFwu9tHz8xCSojFnbpOEbm9TOHfG
         mJwwvZ3TrAXpKIf8yeo78Ovau8uq9cUgnYMrcwuM230RlS48ymu1u8vjGhQgt+cwW8eu
         AF6IQeXMPFePB2kZTPrvlh3XlAahLovvQaex0quKSR3tY4TW+QwjIBfKuA3smCrkGhkR
         HOevE6NsMo1jX1D8Lo3sp+n3y3zwHkZzpsu8giy6e0oLcVXY9p4KSZSkUA9e/infaYgP
         FiOw==
X-Gm-Message-State: AOJu0YzI4Z+VV3HIdPIaPRxWxAigOQbUNsUVs+3KWW0nnU2Qt1mkmww3
	9a3qtmONUBkWr/Z3qj6mRzXQsnQalfnXFRatc6AHBQGj32l6z0zPjXcp62KRuUngc0WLPtF6AII
	0mNKbnw==
X-Google-Smtp-Source: AGHT+IEnvdDx8CXnODrzRbVPzUSjqGM5XPwQPio/AeEGGkkzZchdEypRUZqvj+dxhae05POY2+Y5SsikCKY=
X-Received: from pfbiv13.prod.google.com ([2002:a05:6a00:66cd:b0:736:38af:afeb])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:92a0:b0:748:1bac:aff9
 with SMTP id d2e1a72fcca58-7486cbd90f4mr7663758b3a.18.1749682102554; Wed, 11
 Jun 2025 15:48:22 -0700 (PDT)
Date: Wed, 11 Jun 2025 15:45:53 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-52-seanjc@google.com>
Subject: [PATCH v3 50/62] KVM: x86: WARN if IRQ bypass isn't supported in kvm_pi_update_irte()
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Joerg Roedel <joro@8bytes.org>, 
	David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sairaj Kodilkar <sarunkod@amd.com>, Vasant Hegde <vasant.hegde@amd.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	Francesco Lavra <francescolavra.fl@gmail.com>, David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_154823_619887_F04D5381 
X-CRM114-Status: GOOD (  13.19  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

WARN if kvm_pi_update_irte() is reached without IRQ bypass support, as the
code is only reachable if the VM already has an IRQ bypass producer (see
kvm_irq_routing_update()), or from kvm_arch_irq_bypass_{add,del}_producer(),
which, stating the obvious, are called if and only if KVM enables its IRQ
bypass hooks.

Cc: David Matlack <dmatlack@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kvm/irq.c b/arch/x86/kvm/irq.c
index 45cb9f1ee618..9c03a67fedbe 100644
--- a/arch/x86/kvm/irq.c
+++ b/arch/x86/kvm/irq.c
@@ -517,7 +517,7 @@ static int kvm_pi_update_irte(struct kvm_kernel_irqfd *irqfd,
 	struct kvm_lapic_irq irq;
 	int r;
 
-	if (!irqchip_in_kernel(kvm) || !kvm_arch_has_irq_bypass())
+	if (!irqchip_in_kernel(kvm) || WARN_ON_ONCE(!kvm_arch_has_irq_bypass()))
 		return 0;
 
 	if (entry && entry->type == KVM_IRQ_ROUTING_MSI) {
-- 
2.50.0.rc1.591.g9c95f17f64-goog


