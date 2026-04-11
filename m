Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37547F45A1F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Apr 2026 05:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2hKpQKRb1doRhCbODxXOkqcma9DZMRnM3wlvxT1Nafs=; b=2tqXQkDUFr6DEZ87snQZbpZJMS
	UYMul5wRYOGsmopeAEPZSHKsFoxejf0nax/GcfmL+eQd42DKE55EfFJXD07jssr4WQSIRZ5j6TuPB
	yZgeHZcoYR06W5KFO5PvEA5aAWJv7ZBJGuJn0kZsVOakfjBRrGhedcAJ2ph8KHVzj2UXC564Uubel
	iuqTR2k4wgIyPqRSZG5KoD++bst9uTdCbUIiefBkiTys/6c9Cdm1sNxzTDDCPMBa75X6VZN9LXWAF
	eaqEeLSx8rToB9cNszBC5i5PIdIbnCZvoHje+c8Fy6NP4SMn1EaYDdyKhMRvYmWh025CKXxcPuScc
	168km6oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBRNk-0000000DBC0-0cbt;
	Sat, 11 Apr 2026 05:59:48 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBRNh-0000000DBBc-0tyW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Apr 2026 05:59:46 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-c70c112cb61so1736324a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 22:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775887184; x=1776491984; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2hKpQKRb1doRhCbODxXOkqcma9DZMRnM3wlvxT1Nafs=;
        b=lwR7pzk5oAt//zTWDKUNxWTpL6vXA35PccBGHwfF/XKV4WXVtE5pkbiZnHBJYzSVQ6
         3B9Nsnru+aqOW1AkqvL3jkkQ3qFzSxzf+IvGbRCtGBNwEBq9il43Wc4tg0iiq9aKUf2P
         YQSh7Dcqt8yznHQy5BrXLsCucnlY5hyb3RswBiggtzzXJX4SH220RTxCRs4W6WQdIfIy
         fOwyY7xXXT0vJv5RXBF30K/fn7k50wNnLRTsoENvGjN8rqC+ReQldEpbnn5WWQXHTSa0
         F7STZlUMOrKxFysCy0vk9eovybFwasEIolB9ezFfyFxDYXo6WFrBFZhJualqseFykrNj
         OwUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775887184; x=1776491984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2hKpQKRb1doRhCbODxXOkqcma9DZMRnM3wlvxT1Nafs=;
        b=T61QJ/6jqZtGtMAuXZG/ld0RpCl7nxD2kW8en/UOwvJPCL35veN4NxzsIA1LHtLHJf
         nMScCrrnduTtlTVJF8eao0wdw0ESwojQ7nmRTSclZX7+/3s/vKOiiDeqHyUlMxoA6mkW
         Nzm9N3QYHdml9pA9osj5Z5GCNCSpK/gMbH1nCsD8eLstg+HuNgDXqHk5imUQ0lBJOMRe
         9U+VSgRMQPPevZ1Dn+0D2qhWpsd+LITLaOz+36pvGqqwKXLNjxtwSxTJwcsjQoLHhPuu
         DTY4J6gp9D6akrAC+lEYalmWq93ofBWIcn3nbCjolE1HR2UrYmwnUp+qjdRW6ii0H7P6
         AFxQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+z071f2sgR3oUxQ65FhF3kxOFgOnDuyshOM+kUGP2wEwklYq2faTJu4+upV++WZ3qJBsj1RxLwzn5krubuk33@lists.infradead.org
X-Gm-Message-State: AOJu0YzeDDuIrqvEUGXpCttl+fqD/gBoW7l/N/V/xQDsFRija+lhTLHj
	qRKfw5b4fedGgXZC7vgBlfG7HVQxhjXOE+uvxp1KPb4cJffejOxnp8qt
X-Gm-Gg: AeBDievwNX48v5qCqWxlYakFAGUwBqR8pTsYmt07XIM9NM6pfzpNtaWWXq8U5S4LftX
	x8XBqNtt3+CyO/jhLKAaE20mJudkujJ06hM3EZ4PfJf24Ji96zUY4iD5w3geH4dkzaM8SA8pP4l
	TSmdyhxwXq9BUpV0RzU59Q+ucm6NJ8kpKx1PuVqyiC2dPB1WOyh+uNF//om2vAyymZ8dxOWZJwp
	G0T/dOYJLagoTYe+ppEKhgQGpkXKRm0oaK/RHJHVK++ojclEpa8y51Ibt0NqRm9Wd353E+ZSXLF
	Beo0BtU0FsEafzi3ZdDo68nSubW6hfy6/tc17r42bYOiXX7ssIWHdvpaEpDwkrvNjwVX+S43134
	iFZzlWHMH7ra1wuTSCu/veBIo8yPK+HFCRET6fiJ7UEkSFngTgYmapS1gzG9L0m/0c3dFbzRn8U
	rl0IL+BBEaaKZ6z0dfjwxFH7YmNH+yWe3thqcUt2EijIjobDtUmUj5FZrzzDwaLhp/kN466M2Sx
	a/vqNiNbH0VImywWA==
X-Received: by 2002:a05:6a20:9155:b0:39f:5671:921 with SMTP id adf61e73a8af0-39fe3c9126bmr7033215637.3.1775887183785;
        Fri, 10 Apr 2026 22:59:43 -0700 (PDT)
Received: from deepanshu-kernel-hacker.. ([2405:201:682f:389d:a7b4:1829:8943:c37a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c30ee3fsm4977702b3a.12.2026.04.10.22.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 22:59:43 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org
Cc: drjones@redhat.com,
	christoffer.dall@arm.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+12b178b7c756664d2518@syzkaller.appspotmail.com
Subject: [PATCH] arm64: KVM: Initialize vGIC before preempt-disabled section in kvm_reset_vcpu()
Date: Sat, 11 Apr 2026 11:29:35 +0530
Message-ID: <20260411055935.21692-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_225945_307313_435B21F4 
X-CRM114-Status: GOOD (  10.28  )
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

kvm_reset_vcpu() calls kvm_timer_vcpu_reset() inside a preempt-disabled
section to avoid races with preempt notifiers that also call vcpu put/load.

However, kvm_timer_vcpu_reset() eventually calls kvm_vgic_inject_irq()
which triggers vgic_lazy_init() if the vGIC has not been initialized yet.
vgic_lazy_init() acquires a mutex and calls vgic_init() which invokes
synchronize_srcu_expedited() -- both of which may sleep. Sleeping inside
a preempt-disabled section is illegal and causes:

  BUG: scheduling while atomic: syz.1.49/3699/0x00000002

Fix this by calling vgic_lazy_init() before preempt_disable(). On the
second call inside kvm_vgic_inject_irq(), vgic_initialized() will return
true and vgic_lazy_init() will return immediately without sleeping.

Fixes: e761a927bc9a ("KVM: arm/arm64: Reset the VCPU without preemption and vcpu state loaded")
Reported-by: syzbot+12b178b7c756664d2518@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=12b178b7c756664d2518
Tested-by: syzbot+12b178b7c756664d2518@syzkaller.appspotmail.com
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 arch/arm64/kvm/reset.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
index b963fd975aac..4ee16b4a37b5 100644
--- a/arch/arm64/kvm/reset.c
+++ b/arch/arm64/kvm/reset.c
@@ -25,6 +25,7 @@
 #include <asm/ptrace.h>
 #include <asm/kvm_arm.h>
 #include <asm/kvm_asm.h>
+#include "vgic/vgic.h"
 #include <asm/kvm_emulate.h>
 #include <asm/kvm_mmu.h>
 #include <asm/kvm_nested.h>
@@ -198,6 +199,14 @@ void kvm_reset_vcpu(struct kvm_vcpu *vcpu)
 	vcpu->arch.reset_state.reset = false;
 	spin_unlock(&vcpu->arch.mp_state_lock);
 
+
+	/*
+	 * Initialize vGIC before entering preempt-disabled section.
+	 * vgic_lazy_init() may sleep via mutex_lock, which is illegal
+	 * inside preempt_disable(). Second call inside kvm_vgic_inject_irq
+	 * will find vGIC already initialized and return immediately.
+	 */
+	vgic_lazy_init(vcpu->kvm);
 	preempt_disable();
 	loaded = (vcpu->cpu != -1);
 	if (loaded)
-- 
2.43.0


