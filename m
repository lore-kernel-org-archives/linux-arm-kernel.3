Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC001C61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 00:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6JPxC6M/8C78oUmZk1MgMr9DeqlObfjqst+28w3sGNI=; b=YlSch2/3UNhWzDO3pMDZ29/s/E
	b8QhHLvNkhpZt5RM+nq2xxyHN/la5m/l/CuRRQZlUotOwzuwpJO/9mZIhxUigViW/3DTifjQCaBO/
	ZgnU+V7VWrMXo83Hwq0iIaVNx7nm2tPyGWi3IoFeZXcQfxexWiojjjKXWvVYbfGvQsKnPwrLnQLgm
	gQZ3CUc06axRN7Ia9cTVvGqjXHUn7LNbkto0x9Kfa8jXiWM0wJvAFUPzRIKqECD8cQc0q9EUkfRP1
	yngE5dPzTRFMbanbzFJfwRmwS4hcJLmbYaeKw5zIHU/Zp3WV8PgzXdkiOjBJWoSN0mghhjgH57vuW
	h2TnyWnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP99h-00000008T3Z-2ysJ;
	Wed, 11 Jun 2025 00:17:25 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP93J-00000008SAB-2gTK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 00:10:50 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-311b6d25163so5171376a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 17:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749600649; x=1750205449; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=6JPxC6M/8C78oUmZk1MgMr9DeqlObfjqst+28w3sGNI=;
        b=GtvNxwstXsRLgfrtRtQ1ajrnybbKV0oXBX5V/IHUANdof2xmaaYTcIsv7qjn5r4q/H
         iSK6po3KJwIZfP8QGF1qw5YWLRme/WSkUO39+jZYB4acXUZtrhf9VSrNJ5hBYDklqZR7
         fDIVg1yMFBqe1lonM8ppahagdgfsC3NPdoXmcZ/WrrBVtIk6Qv6miXS836lZpLlOUyuh
         F46+oSbD8zJ/fq1DM6QtLkNE69n/onR6Bjg+H0S7xaJYjXekEoCjeEU9CD4HoK+sQYpZ
         3yJzyOGRVVagvOcODr9oDuN8DuYgCzMANROTWCDM8ufXX5aGqpZXtevaYNhDNyHZSxL3
         iFig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749600649; x=1750205449;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6JPxC6M/8C78oUmZk1MgMr9DeqlObfjqst+28w3sGNI=;
        b=b2s8lziL3kcjLwf76H2fWUjVta8IO6rjQ4biuman0FKomR5Ft6GKo0iRqEt2iJeO1b
         d30WFS3v+sJXghHCgpzTOZrVLdYIyB0cC8zn+fpMf2+CCyc9+9KoUX8bV1PzR6aPxfK/
         cY2Q0gb/3eOLr3P2zYDHgaw4zQAL99mH3G6KyDw+SXH3Q35PugRAJytrVMJ4CQoBnjZQ
         4ty7pzBJheOkjSBfkDKSYCZZM7ibYxce9SAu7ZJwAXno57HdeivZuG6c1pz2dZNuIAve
         qJtQ5KfIN6OifGcK90iMFro7YLmsSTp3Idv2t8d7uMUPpRSrne87b27Ula3vziFISHqS
         H/zA==
X-Gm-Message-State: AOJu0Yz3DaJ5bOjDvFwVoD/CU7s76MEKanKw7JOEPMZqKJmVIqn2kbRt
	CK74lDVNIotZxY64EfC2ggzKKvfU+1g9POdBVXlqL9onTNPr2k5Opet1EOcdD1zT2VZMM2GHMdn
	KgN/Wzw==
X-Google-Smtp-Source: AGHT+IH8G3icYEi+L3rUhxMgi7kY7xVjk4t0ltvPAXoSgaLu6NXS+iOsy9Z0A/wrYNq1F2Q9c5lqhoRbAbQ=
X-Received: from pjbsm18.prod.google.com ([2002:a17:90b:2e52:b0:311:c7f9:ca1c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:52:b0:311:b0ec:1360
 with SMTP id 98e67ed59e1d1-313b1ff8de6mr923707a91.29.1749600648794; Tue, 10
 Jun 2025 17:10:48 -0700 (PDT)
Date: Tue, 10 Jun 2025 17:10:36 -0700
In-Reply-To: <20250611001042.170501-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250611001042.170501-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc0.642.g800a2b2222-goog
Message-ID: <20250611001042.170501-3-seanjc@google.com>
Subject: [PATCH 2/8] KVM: arm64: Include KVM headers to get forward declarations
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Anish Ghulati <aghulati@google.com>, Colton Lewis <coltonlewis@google.com>, 
	Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_171049_680484_AED5E91E 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
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

Include include/uapi/linux/kvm.h and include/linux/kvm_types.h in ARM's
public arm_arch_timer.h and arm_pmu.h headers to get forward declarations
of things like "struct kvm_vcpu" and "struct kvm_device_attr", which are
referenced but never declared (neither file includes *any* KVM headers).

The missing includes don't currently cause problems because of the order
of includes in parent files, but that order is largely arbitrary and is
subject to change, e.g. a future commit will move the ARM specific headers
to arch/arm64/include/asm and reorder parent includes to maintain
alphabetic ordering.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/kvm/arm_arch_timer.h | 2 ++
 include/kvm/arm_pmu.h        | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/include/kvm/arm_arch_timer.h b/include/kvm/arm_arch_timer.h
index 681cf0c8b9df..22cce6843e9a 100644
--- a/include/kvm/arm_arch_timer.h
+++ b/include/kvm/arm_arch_timer.h
@@ -7,6 +7,8 @@
 #ifndef __ASM_ARM_KVM_ARCH_TIMER_H
 #define __ASM_ARM_KVM_ARCH_TIMER_H
 
+#include <linux/kvm.h>
+#include <linux/kvm_types.h>
 #include <linux/clocksource.h>
 #include <linux/hrtimer.h>
 
diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
index 96754b51b411..baf028d19dfc 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -7,6 +7,8 @@
 #ifndef __ASM_ARM_KVM_PMU_H
 #define __ASM_ARM_KVM_PMU_H
 
+#include <linux/kvm.h>
+#include <linux/kvm_types.h>
 #include <linux/perf_event.h>
 #include <linux/perf/arm_pmuv3.h>
 
-- 
2.50.0.rc0.642.g800a2b2222-goog


