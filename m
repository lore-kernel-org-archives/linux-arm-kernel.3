Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA52CD98D5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 06:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wz1k2GgxstbvUGr74v2KjphysWOu90GWRraqbzm662g=; b=gVfGJThy7C66szwKUBj6/SoTBa
	84mhdD1yq0t6LJaDdtTzdnOq5AWVTjnTU34bWi88N3lTkf01y654+AVu3KsqqZgy0EWSDrROJeoDm
	e8jkHMhfjJ83496Lj9ONXTkmU8nfbfCzE3T9WcXU34Qjuh5Ac4ZT0R/5kyF1P2jNEnTJb9wSEpVqP
	1W0GG+LDA7/E01amtzOEnzx2hIOWMDrwx4mx5hHiVkQhbHBIv7NdQwn9dXCBrK9Yb4UjwVXUJcf9b
	JAcGuaTPNytdMb2YAAIKJADhYEfhAsRUJwhzk9LeuowJm3+nQYyXna7+gFosDg7er2H2fMmIRRYwb
	JJobvALg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXvrc-0000000AQxY-0CET;
	Fri, 12 Jun 2026 06:59:36 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXvrV-0000000AQuS-35W5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 06:59:30 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-68d234118f2so514639a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 23:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781247567; x=1781852367; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wz1k2GgxstbvUGr74v2KjphysWOu90GWRraqbzm662g=;
        b=X0vRhC7VNRnL5ib9yux59p9BwsgIalIBjsI7nAk5cCa5zN5ovtZ8dW/eVLT9V0ZnGQ
         bMQk0cq7J+zBoIhGbJ2Mqnx+IrrNNGM42m8knfzK1OjJOSgU0afug/sqmPtYjO7DzEq/
         8PKzLf6rLgDe5l/GUAG6QESRJOm++qUN02N8R/arXxHDE2HTE6448bmSUI8re/bQiq9b
         xfM+pe4ldSl8ftSe+crkM3Cy8z4l4B2fn1IuAqyV4qPGTgbqIhdgBWepWjVtRasMxa0W
         ViqrtJnQJMRnrfEQrKhYoX2Gy8+vjqvfjVKJUo1wv9YH/aZgXkj1ZlywVZgEn/V7nZh7
         BG2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781247567; x=1781852367;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wz1k2GgxstbvUGr74v2KjphysWOu90GWRraqbzm662g=;
        b=MQUKknUG6s+hXo5kAonjlKzMVPBr9DYT1AwIghHszKQdy1CxT12dfMaVVPT/oldGqp
         3Rhg8fJCwmwlLnybCtVAs2qjPsOawRKs7twb7jvvHm9XiEaI9zQlXa1Maj7710OJOXJj
         DsAueH5edfS7HRE66Bd8E+T2dhOeJkjSL4a6xlFk4B7UjCdffFAR/v2e7rkJ278DDtWi
         MJHxR1lwvVL+eZajfeSJJZ63mF6VOqGS++VdtjBNGBPEFTEhVAuP/DiKnkYSiECvwFW/
         i5t9E0eg0Ndpu+V6rkcfs7NOPE04J9yRwICg/67ONdRKktttEO3QjtG2EL2ih7yGVRhR
         +jqQ==
X-Forwarded-Encrypted: i=1; AFNElJ/jq2ffpJm4f93KCaejy7Vu5voPo/DwT0g5L83kTxUs08rVstdgMD0liWPdu0o4rb1u35bL3+6B+zDUhT7ekQZm@lists.infradead.org
X-Gm-Message-State: AOJu0YxXbeSGTOQXxoYpPJ+I3SN8MeiPkW+x81C+MoAGtv0Ljtz8hvUz
	OhwHYNmy3htxKAKdMXfp8ipSKGuKqZCGvygIw3f+hRDh8XFPotkZve76IYeMM5OJ00bLEyrkKRA
	7zg==
X-Received: from edb8.prod.google.com ([2002:a05:6402:2388:b0:691:ad32:f754])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:3901:b0:68d:abcf:9593
 with SMTP id 4fb4d7f45d1cf-69378a104a3mr557406a12.17.1781247567338; Thu, 11
 Jun 2026 23:59:27 -0700 (PDT)
Date: Fri, 12 Jun 2026 07:59:15 +0100
In-Reply-To: <20260612065925.755562-1-tabba@google.com>
Mime-Version: 1.0
References: <20260612065925.755562-1-tabba@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260612065925.755562-2-tabba@google.com>
Subject: [PATCH v1 01/11] KVM: arm64: Add scoped resource management (guard)
 for hyp_spinlock
From: tabba@google.com
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Fuad Tabba <tabba@google.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Quentin Perret <qperret@google.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Sebastian Ene <sebastianene@google.com>, 
	Per Larsen <perlarsen@google.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Hyunwoo Kim <imv4bel@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_235929_779194_0BAB994E 
X-CRM114-Status: GOOD (  10.07  )
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

The nVHE hypervisor manages hyp_spinlock_t locks by hand across error
paths, where a missed unlock deadlocks the next CPU to take the lock.
Wire hyp_spinlock_t into <linux/cleanup.h> via DEFINE_LOCK_GUARD_1 so
callers can use guard(hyp_spinlock) and scoped_guard(hyp_spinlock),
letting later patches replace the manual lock/unlock pairs.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/include/nvhe/spinlock.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/spinlock.h b/arch/arm64/kvm/hyp/include/nvhe/spinlock.h
index 7c7ea8c55405..63ba826d8e3d 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/spinlock.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/spinlock.h
@@ -13,6 +13,8 @@
 #ifndef __ARM64_KVM_NVHE_SPINLOCK_H__
 #define __ARM64_KVM_NVHE_SPINLOCK_H__
 
+#include <linux/cleanup.h>
+
 #include <asm/alternative.h>
 #include <asm/lse.h>
 #include <asm/rwonce.h>
@@ -98,6 +100,10 @@ static inline void hyp_spin_unlock(hyp_spinlock_t *lock)
 	: "memory");
 }
 
+DEFINE_LOCK_GUARD_1(hyp_spinlock, hyp_spinlock_t,
+		    hyp_spin_lock(_T->lock),
+		    hyp_spin_unlock(_T->lock))
+
 static inline bool hyp_spin_is_locked(hyp_spinlock_t *lock)
 {
 	hyp_spinlock_t lockval = READ_ONCE(*lock);
-- 
2.54.0.1136.gdb2ca164c4-goog


