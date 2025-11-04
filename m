Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D5B4CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 12:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tEhk53Kdg2McQ7kEFZChXYgWniYrcrYlWUXlRqKFifw=; b=Kgg6IgwUq1grutYjLTqQ/RMt3P
	5PGJp/dXQb+rh8Ics0ME3IR2UTh5a84NbPDgSJRH5OcZ+y5E8LIj0ZLwOb5DnnRUu+pSrQZDZlM1W
	ki96+IH1bsYbg3EyeNAM0zoNjVpttVVfSPw3OBe79nvc0yC8KOMzZou/me/iJca+XNsbVL1wvNZDi
	TDx1x8Ke/tWiIVc34zszbeXanYOVfhsKZ6x3uqQdsvEF7XSM9jsXJklwXhO/qL/ouX5GiQeY7LVXw
	1sj64qpkuUjA0A6BnG7av6gR1rbzd5w5d91N3IC1ewV+Dz5GTY4YBK4vW9BMJ5sE/qfi/p7uGZCyv
	0UY+Pd2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGGcy-0000000Bp4o-3mu3;
	Tue, 04 Nov 2025 12:59:12 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGGcv-0000000Bp35-3mbr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 12:59:11 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4770c37331fso39342775e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 04:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762261147; x=1762865947; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tEhk53Kdg2McQ7kEFZChXYgWniYrcrYlWUXlRqKFifw=;
        b=eZZjmpUoON9jo+Mnqr0f28trDtNuKjFylK5ScNialQQbyZY1unwvZhXnyv0bxSelBl
         BKYkWgIXuEVOJueYmRBZICax1TmTrnGnUx3VfxDc28swfz/1u3eSgmJwtBlAs/afDi8/
         SQ0CcMhi7sXJiRNkGakxOWqEfaK3h/fu8aCfZvswNjCv3PWaEl6+EtjgwW/H+jHp5lcS
         QntT+z17wME9+bnAO4EwJZ+VQQVumOZBf60b0GHD/GEz/7XnoJcus5bzNFPVIbOvuhaQ
         0tFz9gmA3yqsA7nBT5B+jAQGMvihBM6/M1hR8yjNNsOkmTK5J1vrYGXWsHQpwsUYqZ/b
         nVGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762261147; x=1762865947;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tEhk53Kdg2McQ7kEFZChXYgWniYrcrYlWUXlRqKFifw=;
        b=nSR+NI7HBS6v6bG7FlWDsHtIbtoYaaXAkNAClU8yCxA31UcUF7YOJDPAgtmaBDgVGN
         qbDESliHux0rfnPame2OoVCZ3Wcw9WTxyRh2JSBthSQHGCm91yoa/ePtQoEs2BlH9YTY
         HW48pchtNWgYSUbxfPan7uemckOTntcHtzQWprAo7iIByFDMeqSyZGFeAIUpTgawNmtH
         67V0FaSvhLfj9pCCxNf021r6LSjti4TF+KgANlAKE3dewcK54Tw5v8fZALXLJ1saWRMm
         Fng1BtRNk4fbXPCkP3Xz4FbaIrM8mAMSJKOpH9wjOoLtqb00C9vBj3s0gQVg6ht0EAGf
         MqSQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7hV1P0js4Cy3gq7RIa1nonedwLu5QAaTCB6deWkHCZrmqVqBtbthm054Oa7BTE3sQ04YMqd2+EeHTELODICo/@lists.infradead.org
X-Gm-Message-State: AOJu0YxRyqY/ye3EEUgBQqo5uy5amNWvIp3SqHUd/m2nwtveX/TzoeQV
	G7dkH8YXA7OA4EEQwB+oMb83oH33aH8F0ROWgWMjfgS8tAMtGjkm2Su4WRnNArtyYFVkPVyrCNI
	YWg==
X-Google-Smtp-Source: AGHT+IEZahmzHvSbXgcmOaFfnt77ZN5FH4+ydq37xDaR1EeBlo2SdF0monKofs2zPRa1hAPchxrZ2/XsdQ==
X-Received: from wmfv3.prod.google.com ([2002:a05:600c:15c3:b0:477:561f:772c])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:5252:b0:46f:b42e:e394
 with SMTP id 5b1f17b1804b1-477308b0a6amr150505065e9.41.1762261147550; Tue, 04
 Nov 2025 04:59:07 -0800 (PST)
Date: Tue,  4 Nov 2025 12:58:59 +0000
In-Reply-To: <20251104125906.1919426-1-tabba@google.com>
Mime-Version: 1.0
References: <20251104125906.1919426-1-tabba@google.com>
X-Mailer: git-send-email 2.51.2.997.g839fc31de9-goog
Message-ID: <20251104125906.1919426-2-tabba@google.com>
Subject: [PATCH v1 1/8] KVM: arm64: Route MOPS exceptions to EL2 when guest
 lacks support
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vladimir.murzin@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_045909_969112_F3445B3C 
X-CRM114-Status: GOOD (  13.99  )
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

MOPS exceptions must be routed to the hypervisor (EL2) when the guest
does not support the feature. If the guest does support MOPS, exceptions
should be handled by the guest at EL1.

The existing logic was inverted: exceptions were trapped to EL2 (by
setting HCRX_EL2_MCE2) when the guest supported MOPS, and left to be
handled at EL1 when it did not.

Fix this by moving the setting of HCRX_EL2_MCE2 from the feature-check
block to the 'else' block, ensuring exceptions are only trapped to EL2
when the guest cannot handle them.

Fixes: 84de212d739e ("KVM: arm64: Make FEAT_MOPS UNDEF if not advertised to the guest")
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_emulate.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index c9eab316398e..0f8311263edf 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -684,7 +684,9 @@ static inline void vcpu_set_hcrx(struct kvm_vcpu *vcpu)
 		vcpu->arch.hcrx_el2 = HCRX_EL2_SMPME;
 
 		if (kvm_has_feat(kvm, ID_AA64ISAR2_EL1, MOPS, IMP))
-			vcpu->arch.hcrx_el2 |= (HCRX_EL2_MSCEn | HCRX_EL2_MCE2);
+			vcpu->arch.hcrx_el2 |= HCRX_EL2_MSCEn;
+		else
+			vcpu->arch.hcrx_el2 |= HCRX_EL2_MCE2;
 
 		if (kvm_has_tcr2(kvm))
 			vcpu->arch.hcrx_el2 |= HCRX_EL2_TCR2En;
-- 
2.51.2.997.g839fc31de9-goog


