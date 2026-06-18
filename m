Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE24CD98F3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 12:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+61K/aG7Smoy1LWrJDyBkJHQEfHByS53+hZfj5eCGYc=; b=xXHgACLzaM93WDrlBieuylp5gs
	CFyb+uaToh0YdzI/Ca2Ky1ndNdjfqZQuzMrfUDfn3lwR9JLhY8VEGyP7fBpYFw7gE58nXJTw4YEMW
	w4xzdqmHC3Qx0Txzg03QkwRdSIH7OMOpEPqI5GtbmTfXyCj/9kESr47p9/dWnZtem04IhAXdAoJGE
	CGUo6mga3dmRZbhZ4yyBicXP+QjPFepNjIbjbLa9hfRoNvy2XrvderhlkHpzPAi5H1AWm14SPro+C
	/48A9nOX+uccZ6zv7brXXSKSEdzLzulLs3u3hjQ8uTWQ4afTjzhcC9AXxwxQRN9kyD2Yu/kXpzBkI
	FDVgjFyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waBgB-00000001FCO-0kzO;
	Thu, 18 Jun 2026 12:17:07 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waBg0-00000001F1H-0T7u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 12:16:57 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-490addd42bbso4960985e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 05:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781785013; x=1782389813; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+61K/aG7Smoy1LWrJDyBkJHQEfHByS53+hZfj5eCGYc=;
        b=fR1R1onPiB9cuOhyXdoaFEEkMur28LFOM0cd/u4SMWVLOJ0mzMDb+1WSFWKWh2TseV
         60BNnFMbECISH6BIlzE9JFqEixxJBYYKmQW5lplvsqCocTZUT4EgocxYOy2biuAoNgkU
         ywh++8AlK+/LJQTAsEcT2sGYreuyDamY+ckThcnfRkhFWt3ixPvV9SgVuvQ7hKg55su3
         08estsOUA41baPXgPwo+/0vNAP8quh6RsCmfn1ShzpevD/akVJniIAwFjO4AMsdihhiI
         t7MtznEQ3y8bbwhsVAG642J6BjryWb1ndzU+gwZJI0y68a+vO9SUmKFAJvy3501r2v1o
         vtlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781785013; x=1782389813;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+61K/aG7Smoy1LWrJDyBkJHQEfHByS53+hZfj5eCGYc=;
        b=K737CsfXZwn1zJFnmTAlXv9kPGMXB/xg3D70eFYAumddzJmy8hK8L28ndFKdxt1mym
         1EMu4Uh8aVzhnzJUcy7XZyuzGBggP8Wg0nd0a1bN+R1GVUCs8TW6AX5C3vbKv2fART0i
         yBo8J9R1c6bGU/xV9DR/GEOtkuedhk4WZqd9n2nBziff0+GeG7m+CJyf3ZSxiQlW7OZ4
         56M3+WthW79+79Z3KB8aO3qT3sgaLUwNlcz9TCpGCXD23MwO3dzmGNBZmkiE7vfhJDd0
         Tf8pKmVZgYjoxjEbm/oOZU3sHHBKAfWoHO3aEfvnwermp0IQsg5zHKshvNnGH98+NCMB
         U5vQ==
X-Forwarded-Encrypted: i=1; AFNElJ8GVooomi6fIDraITJuK1Pwfi1mPM/+pt5yCW/MZEzObm118ojlPtCOLVYl9y5pv2FDG8cqffHmSA+X20DwNoyO@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/u1q9q+/wSXQy6lRWYuJClDZYlSzbCamQvTJGY+zWGt7+qt3U
	sxhmgPnVLENdy1oZISgxydhnOgU6LwXkCDRHqHfD7WRLt30y1+GcuVSU1Bwwo3NTLnQkrZdaiVq
	RlA==
X-Received: from wmdd27.prod.google.com ([2002:a05:600c:a21b:b0:488:9c2a:aec4])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4f84:b0:48f:d1b8:9ab1
 with SMTP id 5b1f17b1804b1-492381f0ed0mr55115875e9.9.1781785012931; Thu, 18
 Jun 2026 05:16:52 -0700 (PDT)
Date: Thu, 18 Jun 2026 13:16:43 +0100
In-Reply-To: <20260618121643.4105064-1-tabba@google.com>
Mime-Version: 1.0
References: <20260618121643.4105064-1-tabba@google.com>
X-Mailer: git-send-email 2.54.0.1189.g8c84645362-goog
Message-ID: <20260618121643.4105064-8-tabba@google.com>
Subject: [PATCH v2 7/7] KVM: arm64: Set IL in fake ESR for pKVM memory sharing exit
From: Fuad Tabba <tabba@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Sascha Bischoff <Sascha.Bischoff@arm.com>, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_051656_168136_D4C63507 
X-CRM114-Status: GOOD (  12.11  )
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

__pkvm_memshare_page_req() constructs a fake DABT ESR_EL2 to exit to
the host without setting IL. The ESR has ISV=0, so IL must be 1 per the
architecture. The host does not read IL on this path, but the
constructed syndrome should still be architecturally valid.

Set ESR_ELx_IL.

Fixes: 03313efed5e2 ("KVM: arm64: Implement the MEM_SHARE hypercall for protected VMs")
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/pkvm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index eb1c10120f9f..c982a3a04c37 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -1054,7 +1054,8 @@ static u64 __pkvm_memshare_page_req(struct kvm_vcpu *vcpu, u64 ipa)
 
 	/* Fake up a data abort (level 3 translation fault on write) */
 	vcpu->arch.fault.esr_el2 = (ESR_ELx_EC_DABT_LOW << ESR_ELx_EC_SHIFT) |
-				   ESR_ELx_WNR | ESR_ELx_FSC_FAULT |
+				   ESR_ELx_IL | ESR_ELx_WNR |
+				   ESR_ELx_FSC_FAULT |
 				   FIELD_PREP(ESR_ELx_FSC_LEVEL, 3);
 
 	/* Shuffle the IPA around into the HPFAR */
-- 
2.54.0.1189.g8c84645362-goog


