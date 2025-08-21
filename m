Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94A64CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 02:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=etQsx3Bjkyo2W+FnvyouolCpcLbOwVVqYYIcKcKxQxw=; b=w3NI79oDL+tUBtnESoisfTmf0s
	KasaUnIiT/UMFVWGc72METQ+vRytPPtjI5c5EE79OaQVQ7P2MWQJeNrYLa2N5Htl1LNgfn6rTkL64
	dzRG+W9HQ3VAmzYcJxWT0OyUbu47qaMGL6RT0br9tUUNsrmflcS2fouo665HtZk4aZOvLf/busU5c
	n2GINbrbBk8JhWsrQcEpl0GmAJviHZl9TBa2X5N4HuxwNdqeUB4G1mdWDYzpIQmLQzUmwzKKeUR7U
	X3a2WeH+A7RuiCvK/fqwQU4BzKEMlBrIe3fDUfQ8jfwYanrIcPQp4kS7RWYwQzukinIZ7y3MOM80K
	9VNP2zPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upHaJ-00000001Hjx-1uDA;
	Fri, 22 Aug 2025 02:32:55 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upCOu-00000000bRW-33LQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 21:00:50 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-b47174c667aso1198141a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 14:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755810047; x=1756414847; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=etQsx3Bjkyo2W+FnvyouolCpcLbOwVVqYYIcKcKxQxw=;
        b=LnImUb5/gTt2C8tqHQigyEUqHQ7V9PPsjyd3Cn50egueE+nyorlpZjJMegEdyFro75
         AGvlcKdqtDaNVu/jUbiv+LaBF5GYSPrZFXO8g5VhJoQsApURxeJwuDyzMzG4Ih7XA84F
         ULTFg0k+AvXWPgV2IQF/4EtpvfS+6Ie4Uun3Q++9L5SMfJdBfpG71P2Egd1sURRZm4Q7
         j3Mgm4eouK0VV9TYByo+e5ZlCRxTvi5+2e2rmLMi1Gkbg5CKkcUfwQK6mztp58XLp4uP
         jvSCKy4pLHvvlgCGOVXMvpkFM7VvVuftO83K7N5R+QJPCcuWJCrXNuviv5FDK30HEcTV
         sWyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755810047; x=1756414847;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=etQsx3Bjkyo2W+FnvyouolCpcLbOwVVqYYIcKcKxQxw=;
        b=HmCEc63cyeEpsTRf6dVId+GRgJaNUJVPKDRtMuvSiIouZyQtBjNOrC3k3ryXReoFhz
         8UZ1Y3OLXzvUfyYpR6Ih9qutb5H4tWZK0NpNNQBxcD+9e/r1sY+WJpXx7UJtAxZrBquZ
         L5JAGPtTLDuq/p+9JUVN9P+kepR78z4hR5GuQPwIG6rB6DcWezG9xXpK2cYTQnjfpYdv
         RXB2X/aVOfcGHM9Ob+HMNH2LQfThmkxAUOYcD0+coAkMDqqZbUayDT/wQymoBiXF6n5I
         xxb29qvEA27ZUTyLsP7wUSj5KG3OkVJ7MibpdZjBWb5OjJN+D5W4PFsjo8SxH3xrcNHu
         D8tw==
X-Gm-Message-State: AOJu0Yy8fqHVFGytP3Jaln3S8bhfzZ4yBcpLP5ko6oxZ47Mj8RpLHPLR
	sCIqW6gKGBqdclt31xhsUH1W/ukUIZFLspsZe34fRcnR439Ao2SG7cVo+XKy6mErdJJcckFh90B
	RpJVNCw==
X-Google-Smtp-Source: AGHT+IG+AbHEFENih72v8s75m7PziM02RS9Hkp0sUk/+ACGLaOQo6n0X4YmQa5UYgK3E6VY5WcrGDki7bAU=
X-Received: from pfqn26.prod.google.com ([2002:aa7:985a:0:b0:76b:b0c5:347c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:2446:b0:243:755:58b8
 with SMTP id adf61e73a8af0-24340d9268cmr736072637.57.1755810047367; Thu, 21
 Aug 2025 14:00:47 -0700 (PDT)
Date: Thu, 21 Aug 2025 14:00:27 -0700
In-Reply-To: <20250821210042.3451147-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250821210042.3451147-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
Message-ID: <20250821210042.3451147-2-seanjc@google.com>
Subject: [RFC PATCH 01/16] KVM: arm64: Drop nested "esr" to eliminate variable shadowing
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sean Christopherson <seanjc@google.com>, 
	James Houghton <jthoughton@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_140048_782486_5BB85927 
X-CRM114-Status: GOOD (  10.48  )
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

Drop a local "esr" variable in kvm_handle_guest_abort() that's used as a
very temporary scratch variable when injecting nested stage-2 faults, to
avoid creating a shadow of the function's overall "esr", which holds the
original state provided by hardware.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/mmu.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 1c78864767c5..dc3aa58e2ea5 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1904,19 +1904,15 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 	 */
 	if (kvm_is_nested_s2_mmu(vcpu->kvm,vcpu->arch.hw_mmu) &&
 	    vcpu->arch.hw_mmu->nested_stage2_enabled) {
-		u32 esr;
-
 		ret = kvm_walk_nested_s2(vcpu, fault_ipa, &nested_trans);
 		if (ret) {
-			esr = kvm_s2_trans_esr(&nested_trans);
-			kvm_inject_s2_fault(vcpu, esr);
+			kvm_inject_s2_fault(vcpu, kvm_s2_trans_esr(&nested_trans));
 			goto out_unlock;
 		}
 
 		ret = kvm_s2_handle_perm_fault(vcpu, &nested_trans);
 		if (ret) {
-			esr = kvm_s2_trans_esr(&nested_trans);
-			kvm_inject_s2_fault(vcpu, esr);
+			kvm_inject_s2_fault(vcpu, kvm_s2_trans_esr(&nested_trans));
 			goto out_unlock;
 		}
 
-- 
2.51.0.261.g7ce5a0a67e-goog


