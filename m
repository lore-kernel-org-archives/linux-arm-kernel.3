Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 190EEC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 13:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ilx8e+rSH9u6ZnDUv38L7O/GoBWQdLqlZUaHwlvmxkY=; b=ir+iJRKix4EHWvWXAnsVPQqJZy
	UkbnpVSRrpFJGlkJ0e/azZ8mGSskYNhXIgzqwI/fjmLvXi+HFEcIccGRudxjmm8TPo9PH3CcSgdIU
	nWFoafgOXmFDBk+OjwLJC7Bt8LrdWlfdxBXolqiHWvweN/D2u9dp2SjePAB5Wuj5LcaN98DGEPdGe
	zFpxF1M8+G8x6v6446ylcyvZ8IYwlH+zEsiu4z9iqLgOMwyTFAFxsIUOzUR2UFqEzG2X0SmTkadwC
	m8MV54ThkSmq+v4Z0f9papKnf3sTb+iiSH/hsu1sS9UPIk0cRi/FFGmMEeSZ41nO7+jkzx2MzrBzU
	pVHK4g6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90EZ-00000005Qyc-23dU;
	Tue, 22 Sep 2026 13:08:31 +0000
Received: from mail-wr1-x446.google.com ([2a00:1450:4864:20::446])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90EX-00000005QxM-0DSg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 13:08:30 +0000
Received: by mail-wr1-x446.google.com with SMTP id ffacd0b85a97d-4870af30a85so640298f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 06:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790082506; x=1790687306; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ilx8e+rSH9u6ZnDUv38L7O/GoBWQdLqlZUaHwlvmxkY=;
        b=UnVy0EPc5O7yryK+ZiLSnT0OSB9fOAJHd7nc83taGmoaqsmJTnr/+1UCPQmmDxuges
         o5G2cdT31h7u1KQ3HIbO92gmDaFer8GlP5U7F5obAEmW+XlrXrqHu/OXzr/6Xq+tgo6j
         8opVSwtRwnHSfyEZY+up2PGt4OOQFguRN6A/NHNL5PgPl8jHS8FC8bFHsz6f50ZxZcMT
         B9PdaVBqQLN5T3utj0fz6eByEnhIOSwz25849LE87K8TnTirw2xjamCXMEvo6CxgxuK6
         qI26b/avpMPSPdSHolS3YL5/tqbOnBP8oYnpLUUMc0BQuJYWmLMxd+glGrluakxBkrp4
         2g+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790082506; x=1790687306;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ilx8e+rSH9u6ZnDUv38L7O/GoBWQdLqlZUaHwlvmxkY=;
        b=vX/D+bZQtZEi62W9AijpJYkBxkDuDfg8EG7e9o68tCAb5YjrtMvDxlta5rBD9PwK+2
         ajLkZjx7QU6TMybRipnY7wk+XT9mBob3oExtb2PsKhWElr2cbV/qSig8WN1sa/yzhT8l
         wVBSbxPXi32bvkhRh/JXTwnPA6vFsnf0w6AbzlQNHBMXaBRaYCGwOwA1sd73bxTEJu/D
         Zpk+tQTB9P4YVB4ew5NnrhiGi5aBEHgdBmj0O3IvQaavtnnCbValTU1nvuk3y+zKH7d3
         5nPwXktktLZNf5xBk8U7b0eENSGYFckMV//bU5pWjBoRpfGNWGTKNQ+nZhCvOeIbGJa5
         iS+Q==
X-Forwarded-Encrypted: i=1; AKwUvByOZTG5rbz7IZjzcB5CU3hNpN+SEjsaXWa97NgkP987/w/0PqIFjAitEI+gbARJ5Fsar1pVmN3+013r6+MKMvJu@lists.infradead.org
X-Gm-Message-State: AFuF++l5a5z5wsTub33VRNxD9KbaLK4OoF5bu/qYBFDLuCS6IBFabsbD
	oOuApOQ6FU+rZ5oLAuqwlZZe80tKhTWMhq/rJXpMtuB+XiMxKbi6roo+SvLS7L2eH+021Rm/WW5
	XnHZmxz4HHiEga7LDs2rgzA==
X-Received: from wrwu1.prod.google.com ([2002:a5d:6ac1:0:b0:488:3cea:199f])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:420d:b0:484:361a:1c7b with SMTP id ffacd0b85a97d-48860f8a582mr4928028f8f.7.1790082505714;
 Tue, 22 Sep 2026 06:08:25 -0700 (PDT)
Date: Tue, 22 Sep 2026 14:08:15 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922130821.1666713-1-vdonnefort@google.com>
Subject: [PATCH v1 0/6] Fix guest_memfd and protected VMs on systems with
 pages larger than 4K
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_060829_095664_B745AE2D 
X-CRM114-Status: UNSURE (   8.09  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This series allows booting protected VMs and guest_memfd-back VMs on
systems with a page size larger than 4K.

Currently, the fault handling assumes 4K alignment, as HPFAR_EL2
provides the IPA minus the bottom 12 bits regardless of the system page
size. This leads to mapping failures on 16K and 64K systems.

This series addresses the alignment mismatch by relying on struct
kvm_s2_fault_vma_info in both gmem_abort() and pkvm_mem_abort() to
retrieve correctly page-aligned addresses.

This series bundles the following previously discussed fixes:

 1. https://lore.kernel.org/all/20260915091606.2111217-1-vdonnefort@google.com
 2. https://lore.kernel.org/all/20260915084438.2076072-1-vdonnefort@google.com

Fuad Tabba (2):
  KVM: arm64: Move gmem_abort()
  KVM: arm64: Use kvm_s2_fault_vma_info in gmem_abort()

Vincent Donnefort (4):
  KVM: arm64: Fix MMFR0 TGRAN advertisement for pVMs
  KVM: arm64: Pass kvm_s2_fault_desc to
    fault_supports_stage2_huge_mapping()
  KVM: arm64: Move pkvm_mem_abort()
  KVM: arm64: Use kvm_s2_fault_vma_info in pkvm_mem_abort()

 arch/arm64/kvm/hyp/nvhe/sys_regs.c |   3 +
 arch/arm64/kvm/mmu.c               | 357 +++++++++++++++--------------
 arch/arm64/kvm/pkvm.c              |   3 +
 3 files changed, 186 insertions(+), 177 deletions(-)


base-commit: 93f51579e7df248780214094418f205253383cc5
-- 
2.55.0.1082.g2b9226bbc0-goog


