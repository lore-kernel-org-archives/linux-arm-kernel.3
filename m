Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FBB6F3ED7B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 08:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2hKpQKRb1doRhCbODxXOkqcma9DZMRnM3wlvxT1Nafs=; b=p/EhcE2l7qNcZaxUH2WQsMvt/w
	P70x/hlWGqTc34qpwvINIB/dJbfm60r3pwXZQHnD6tKzFmsGhvM4CGWqyw+8bzy7z3yhg+WGxz+M9
	DDZJrWf9qFLrq1WXcMYoN58q2cgVgNjE0oCVDt9twGEgS7RbL8cdXIIwTvj8Zz8ZHxEsZTNs3lkua
	lz11/d4z3f7GQZekRIA6hbsayCfYbU4HVc41jyxUw4cZSwti81gbU7ym0aoJlBMLYmGcyBRz9eXrL
	DS/NDvdCA/qbwMEJtTrYjpEvtpKcgMRwEnSWRyozByTBBHsXovUB6nytHnXLW86DqsXm4gPSKPS7p
	h+VlnWxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBpoJ-0000000E8gc-48kU;
	Sun, 12 Apr 2026 08:04:52 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBpoG-0000000E8gF-2qRX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Apr 2026 08:04:49 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-82cd9d0eceaso2453506b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 01:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775981087; x=1776585887; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2hKpQKRb1doRhCbODxXOkqcma9DZMRnM3wlvxT1Nafs=;
        b=bCVo/ju/FS92tASWHClbV3I/jPWSdzL24YhMoPzjErlbYr+zmNmz3dKtUbQNx9sR9Y
         21w8HpfYrbarZqy4rogNSK4SwXtojmsI7IEn4ud6e+8kuYKYcCmRfrE8XxE+yRFNxcwW
         Evn2p08kQJEgtKo6KtSC0xDAFMcmHUlwoc2jVqq3tO2QinFp2+R2iZWy+tmJIFmORvf7
         LctrwEtQTkTlZRM2agBjwcNlogjBWf4wBEm6d/qC7Eyns+RrHHgOE0K2EXUn5ImkyzG/
         yPtIJzXVN8+LUPjBgh0Yw2aXbw40qC7dtGxyozrfo1swcJiAiNBJV+zb4cu40/P4QmnF
         s2jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775981087; x=1776585887;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2hKpQKRb1doRhCbODxXOkqcma9DZMRnM3wlvxT1Nafs=;
        b=hJ3fCCBgh8MzN5tjYf4XwTcmSfrYrSeGE79pDbYwah983cPcMcHickm8alyG0yw3j9
         jlcKxD8ewSE+HzDvvNxz0IEBxjQ4nH0uA/uM4OFxt/b5Ictt0c1A3rPBRdbG82wE0mch
         mzJa0d3+9DBY4syjtxtaAYZG1E2uvf8zPwMqAji01RTVGpSHwZ4n/eD9g2J0Sl2oVEUM
         y0XL3ygQ/Nq6LJUclNpPV1totrlrBQT9w5A6XqibeSpV9UVIXQWmb1mHzMErfImQkyNY
         4W4cOXOP6OGSVmm21NnfBWXRlr0sSiU1slatVlhG8/bUYD+tg2SsgZhWZF3XyJ7lBBdZ
         6dUA==
X-Forwarded-Encrypted: i=1; AJvYcCUvZfEI/6YUt8bO/zVTNoDoqALPrKNzQoP54PcRt+F/Gu4SowVTaN9tpqpo0BVQ96BTmQU7EW9GAMNhL42HSl/M@lists.infradead.org
X-Gm-Message-State: AOJu0YyecG5rH0ft576LAZfyQcC9/pnWFGFQhuXFgxndn+u2JMkEgZJm
	GvFBEkN6f5PWgQluVSW+0mQCFbYRL4wyCzarCnVGR3fxRg1fWvE67B0+
X-Gm-Gg: AeBDietoirD38lI2vP2sLDoAB5OJXUPnRmpg8CqMxt1zqYvXF2ORxn/LNq0oJ3wuB3W
	LtAXUMKL0SDHwHDrmT7+BOCebYzjWgjiKPfqyh8k6rTFy1quZn4CuttITdpzvI9XLqMMcOemNdC
	B3xtdHfh6L0o0RUPN+zRUuDXiLVoNdquz3N+b8MJM/nQO/aiRit1V2H+K1J3bG39ZzPAir+rKKa
	CkbY5b7Xn+ne5IgHGdSDcS8EsofbevHRkr4AKrMpOdxeRwEn9LzjMmxf09bdt+6taGG447NTa/7
	ygdZ6FO6r7KdpexjexH7x4nFgYRn1banocp0fCYcHhlCny9Y0o0vZloUheIgVdYHscicc4m9O3U
	+klgSIiLOdktq3U/NEI6nRLN8LnyxqaQTx7bwFPBT3kj3rlyilQCVf80MgigSmUIFG6O7Q1mtMN
	WE8wI7xObT50+n9fboifl7p3UHv8IKcT6Flld/UD4MzAqGKAuzh5HFqJtgD9U8lp9QmaZ9nvL74
	p+V1g==
X-Received: by 2002:a05:6a00:1f03:b0:82c:9f73:a2f with SMTP id d2e1a72fcca58-82f0c2c8bfbmr10079288b3a.40.1775981087078;
        Sun, 12 Apr 2026 01:04:47 -0700 (PDT)
Received: from deepanshu-kernel-hacker.. ([2405:201:682f:383f:142c:c389:4a2:63cd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c33de57sm7389959b3a.21.2026.04.12.01.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 01:04:46 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+12b178b7c756664d2518@syzkaller.appspotmail.com
Subject: [PATCH] arm64: KVM: Initialize vGIC before preempt-disabled section in kvm_reset_vcpu()
Date: Sun, 12 Apr 2026 13:34:37 +0530
Message-ID: <20260412080437.38782-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_010448_763284_55C7EA8B 
X-CRM114-Status: GOOD (  10.51  )
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


