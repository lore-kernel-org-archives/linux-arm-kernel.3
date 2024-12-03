Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD973E69E9F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 10:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RoLTpcw2i/ARiDDfP5KR0JIwlxbCPGGxl8N0KcEuWeM=; b=QB2cLvBlAUgXGMz3NbysIzNP9H
	LPbwYIuVIyI7x9F7S7nxx+FZFr5ErT8T6foUfBmilgltrmh/M0QrkOlAE6YvGaS4QeUje4XJ2p7RG
	CExmnTVaWvN1PwMjMY+xZXahwrZJUu81rkLRYzA1/t9pkX8ZW3lXNJ1TsyfGh77LpsLge8mQyL+wt
	swqAqbvXwjpQnEPgcx1su6DTI6JlVe1qIa2q1HfERyNyZ3iXKSGlPMzWNBirRXMUJXPnAsVB4W8eZ
	3UNmmcCc9957nhnP58JqL4NaLmJoe+U494DoIH0NcZJjcFBGv+wu5e8Lsof1np2GkEykRxFuMN5Wp
	/MATYucw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQPa-000000097pi-2SHJ;
	Tue, 03 Dec 2024 10:45:46 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQHy-000000095cl-0o6H
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 10:37:55 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-5d0bde5e90fso3722283a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 02:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733222272; x=1733827072; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RoLTpcw2i/ARiDDfP5KR0JIwlxbCPGGxl8N0KcEuWeM=;
        b=vp2fDDrnIr1C2BUMfkWZVzzaJiAE/+BXrtWhvjpwVsOcEdaZrvHlH09Yd3Shkwf4OW
         dIgJ93Yjgzq+DGNZSZVW8tysVTCmq7NDDcGQsAqlGgZVCqqUK+DevR5PGjREs9Wt2VOK
         5QjJWLaxbLh+4ENzJyzhnPAwpdJh+0ktQBxVcdXJIejgVZHkw8PHftES0yYz6o+KNyin
         +0WTpUWa+k4ux7bgkd/tMf0zMiASfJK57xTWR0OfCPXuvZspB6U7OBvACfZhnE+/izB8
         2T2VQN2IZxh9MT4vhKptks2F3IDnTQCH6juXUbShkzwrZzECOuPAO/GXzBM/XZ4/iPe+
         DJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733222272; x=1733827072;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RoLTpcw2i/ARiDDfP5KR0JIwlxbCPGGxl8N0KcEuWeM=;
        b=BMuxtLKPegraiNYYw9qcP4/2oCO6imOjDFOkM/apNQs1n6fjbMhOFPx8V/feAkIfFr
         42gFo4CzaVrXQOsO66G+nfuaslKhCootrKR8c0tubhbm1Dd4ZrFVo1bLnV6wMjLkgNEh
         53LZgozDJpW3YV9wWMelYKc4ENIEqGTAoQgSbz7YZvFzlKmi3IGvIGNUQRaA0eECm8H6
         rLWZGBfvbILmDuo+CWyuNh150BhuKuIVXs/EOMXrIWC+3AH6yP0APCmxukkH02zWdc+f
         v7nFa2e5ZLix8kEAruXXUy02KFQL8kvexpl3AH3YdQCYXvOuNPpH/Lz0Q6oUchyNwJer
         jHHA==
X-Forwarded-Encrypted: i=1; AJvYcCVWIR5i0nHAjSRcnZ1G699EaVZyWxE5l7E2k4iDbxQTD3HFgYOUndfdkXuRXrW5PIPOL13vQRDH+LJPyENtrQwQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwZqMHENr1eTAA2idrlZ7lYnRVhGs2XmRV6H9iYZ95EkIlrusXx
	Islprmtj8bXIyPxUwznLJjWecWVdyUeS8rQWiXho1mcil5OunOKC7mp/czl/xL+/PeIo5cl8+k6
	6D21IUw==
X-Google-Smtp-Source: AGHT+IGydksz2oitkkS+PzunE3Xo1LLjOTwrM0JRUgGZOInmX86+vMlVFPZJqRfsJ77VjfmAauob+8D8Wh13
X-Received: from edtw23.prod.google.com ([2002:aa7:cb57:0:b0:5cb:ee45:27d6])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:27c9:b0:5cf:924f:9968
 with SMTP id 4fb4d7f45d1cf-5d10cb4f7c1mr2156507a12.2.1733222272258; Tue, 03
 Dec 2024 02:37:52 -0800 (PST)
Date: Tue,  3 Dec 2024 10:37:24 +0000
In-Reply-To: <20241203103735.2267589-1-qperret@google.com>
Mime-Version: 1.0
References: <20241203103735.2267589-1-qperret@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241203103735.2267589-8-qperret@google.com>
Subject: [PATCH v2 07/18] KVM: arm64: Make kvm_pgtable_stage2_init() a static
 inline function
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Fuad Tabba <tabba@google.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Sebastian Ene <sebastianene@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_023754_230714_B64DCEE9 
X-CRM114-Status: GOOD (  10.52  )
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

Turn kvm_pgtable_stage2_init() into a static inline function instead of
a macro. This will allow the usage of typeof() on it later on.

Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/include/asm/kvm_pgtable.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index c2f4149283ef..04418b5e3004 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -526,8 +526,11 @@ int __kvm_pgtable_stage2_init(struct kvm_pgtable *pgt, struct kvm_s2_mmu *mmu,
 			      enum kvm_pgtable_stage2_flags flags,
 			      kvm_pgtable_force_pte_cb_t force_pte_cb);
 
-#define kvm_pgtable_stage2_init(pgt, mmu, mm_ops) \
-	__kvm_pgtable_stage2_init(pgt, mmu, mm_ops, 0, NULL)
+static inline int kvm_pgtable_stage2_init(struct kvm_pgtable *pgt, struct kvm_s2_mmu *mmu,
+					  struct kvm_pgtable_mm_ops *mm_ops)
+{
+	return __kvm_pgtable_stage2_init(pgt, mmu, mm_ops, 0, NULL);
+}
 
 /**
  * kvm_pgtable_stage2_destroy() - Destroy an unused guest stage-2 page-table.
-- 
2.47.0.338.g60cca15819-goog


