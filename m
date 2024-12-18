Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E3BE77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 19:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UN033o2GHiX5GHpTGB6kvm1rK9tee5Gj8O9vUBu1qws=; b=ZK6fQBB2NgkqCe8FTjn05ST1bg
	AqT+eKOW+DW9y4uY3lBqVrVX/doTEwHbhDNr0YtYXZyHuks5HUnj6JwgIJ4UxFjOpe6IDZPwuXavF
	43IUIS3v4FzFmet4QXw5vSA0XbX4YdMrcSsUfKjuuCJB+C+zS/b4lyobcP9jU0ETH26S8AHxYvmxk
	/1mIYwdITpPRoBZ6yMFPPwRK0WTdiChWnllYPqrD+YZW6R0vahFi5KiQwruJDJIzHk5Ce38N919PE
	lM3Cjkroq61g8YI9SPDWBoDadr8MHVC3gItcT7+9kwAwE1Ltvo4NEgETRDfp59H+53nizDLwi4+J1
	CDQ0rcug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO03T-0000000HaGt-31wW;
	Wed, 18 Dec 2024 19:49:59 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNzv6-0000000HYLT-05hx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 19:41:21 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-5d3eceb9fe8so4327843a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 11:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734550878; x=1735155678; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UN033o2GHiX5GHpTGB6kvm1rK9tee5Gj8O9vUBu1qws=;
        b=mHG3OyJZvdYmNNMgQ49DXz4fccCc6BL3kMq1qm70gF7QFcqrC0gWMXAbgfbM6/S8mO
         MdpXGbujiPXrJtJgvuVZY+XOcKAKzFPo5TF51+a1IGlDT4xdtKONK9wAkWU2uBhwGnH4
         eQiOLKh5C83YZocrCNIfWZozzq6j+k1yNaVKUqlLWpml+t+8f3bcoZi2b9Q0S68qGNtk
         qvcnI0erzim3mh3qUk3NX4wqKxRyi9KUSUEKEz0vo4a9mToQ6LdJaE+0B/ZVYFVu3olw
         8nbZY2GZ3ckgf4KFsPHlsNxRtqnyv5Eda0YcrYdT2RGP8yxGyz3I2qDvnzSQh4HxUTdP
         +7fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734550878; x=1735155678;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UN033o2GHiX5GHpTGB6kvm1rK9tee5Gj8O9vUBu1qws=;
        b=onhfJXxcnDYw9CMmsOdd+/aNnkRL6vE5o7ZW/Ux/tWnliVhUOCQ316oCJFV15b3Cm2
         kQd7J/C4o9DtG2/KTN6H1IsG/31D6Wg8Z13DzO+LmtN8EpihNeBkV7owrrb1kvvJVjQM
         XddmcCthiFFUej5ujApw1ar4jHUZjPbzDuIEcoIzF00ZG9vLkfhB9FE/8jJAYynijTjJ
         y0UAOGHG7GzQbuA5hq5M+qr+CIKLCL4s9tZoGKeZhWU25bHWcM/yFaILzpW4FryPggIE
         wFTzqGC+hyFlVq/2AWqe3OQJxiZD77m90sZQR6oWmdSKnkG+31DAiFmruYdWlss4yWhm
         vSyw==
X-Forwarded-Encrypted: i=1; AJvYcCXQ7/5FKDVTVltWYQSihqKURRHIB+5AOlzdE9qtdjl67Mw90RHH3W3EGpPsvMed4MUO97bVUlbb5s9KbXnw/Hgt@lists.infradead.org
X-Gm-Message-State: AOJu0YxeQotPJvtmc7UxOtiK0n80oOsgHO5Rto7e/Y2t3NEpfVeM+D5H
	XegRjjyEclCAc1ygsqkmuo1XTib/YgtYQ/OFeBy4bVAX2NSfHo7etj67Y+CP3s9uBWr1FFJNK80
	IJvlJag==
X-Google-Smtp-Source: AGHT+IE3wkDG9vtefB7L3ndH+glOdLt6SFA31qjCSbwI5pguq8Sr2lwBLtJq9tsEv+9Luyc+4JoZCl07Dm6S
X-Received: from edbes27.prod.google.com ([2002:a05:6402:381b:b0:5d3:ef04:4872])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:34cb:b0:5d0:e826:f0da
 with SMTP id 4fb4d7f45d1cf-5d7ee3b4ce0mr3687509a12.16.1734550877975; Wed, 18
 Dec 2024 11:41:17 -0800 (PST)
Date: Wed, 18 Dec 2024 19:40:48 +0000
In-Reply-To: <20241218194059.3670226-1-qperret@google.com>
Mime-Version: 1.0
References: <20241218194059.3670226-1-qperret@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241218194059.3670226-8-qperret@google.com>
Subject: [PATCH v4 07/18] KVM: arm64: Make kvm_pgtable_stage2_init() a static
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
X-CRM114-CacheID: sfid-20241218_114120_056291_F76C82F4 
X-CRM114-Status: GOOD (  10.10  )
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

Tested-by: Fuad Tabba <tabba@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
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
2.47.1.613.gc27f4b7a9f-goog


