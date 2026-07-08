Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E12CC44503
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 22:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VXjaTRbhjgdEqS1UyFYRJTvGMmWZaq4i6pqgK3sf76s=; b=AkZmH8M90IT8M/UTy31KV0T+Tt
	+XgXOvIeJOxEckCQ1nMjsA6iYb8bri9T5blnvqp8VKUBmJr5oN/U4qnkDUJuSY3E7aFnUQek7F/mt
	fj6JIoG6A0sXrgn2329GvPj/8pb61JqQMUN03dQ2O11LszgCspEi3mqfHEVBq4iNYtlrM+dtqScAw
	II33O7sDujlkabm/REH1LHZWhmMz1k8cFhedQhB8P934Mhp3WUv6p4jpp6pSxz7NZN2aSkOsaVDlR
	k6WUoQ+LEM45HWURzTXAEUx+NpOyG0RLnGyXp25HO8rGJNTQOW+5cG7u/fN4YBQfX55VCT5I7K/xv
	fmaUx2fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whb7k-00000000YcW-1tIJ;
	Wed, 08 Jul 2026 22:52:12 +0000
Received: from mail-oo1-xc49.google.com ([2607:f8b0:4864:20::c49])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whb7i-00000000YbI-0MXH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 22:52:11 +0000
Received: by mail-oo1-xc49.google.com with SMTP id 006d021491bc7-6a18e349abfso440685eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 15:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783551128; x=1784155928; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VXjaTRbhjgdEqS1UyFYRJTvGMmWZaq4i6pqgK3sf76s=;
        b=viMIsumcuxZzr/8xcbxU/p4sdF4HFQil5ooIcqUA0C/Z+luPJfNnPDZvm2be5/NZcC
         Spi09iOIq4jmIaQ/c+O1cqUicrk5DwjLRkhZ1Q56dY0tCEixjJKD+rTAlw08kkgDVibj
         +Tq9TeMZpMSKAZv7sJrqJX7KQvqbYaMc/J6/MEuDMxYTP71f+KW30sFopJxkbqlZc+LU
         rfjmY0/cl0vxMSCdxHc5mjRaIz0//EekkJZt4eivMy4iTfSGkZgG08EqD+b0qEv7ld5r
         zxdhlvvlGO8v3iIZpXWMM+NIkReJHCm9NwKKkIi4d13QRGIWdfkFPyBwU0bG9EPq9ZNv
         44Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783551128; x=1784155928;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VXjaTRbhjgdEqS1UyFYRJTvGMmWZaq4i6pqgK3sf76s=;
        b=CqcQUESXHTlyavTN7vCLa3y7DyYAGo+dynnJ2cNGxcMvlINxGA6Gf7/243suZaT72G
         VfPrxZ7b8QpGLH3fsgjYWdtGTs5adqN1biBQY8UEJl9u54XhtXYHwgnnaTKIx+bqjBDM
         7dd8TBg61ncUEJfQK0LSRDiF+lBThTRp6n3Um1p/M7xSjdmTX3O7LKtZ863huwg0hJAL
         sOM8PJxjHRoM6Wn/ix4lC0sKUc1EKKQ/3+1itUtZhgxvvdAlw++Z9SmmBVxrTSDYZSKo
         9TRxKVVTj+fH7JIy4v6b8NIjNUMMlYrwTqGnbpUGkNbvTr26pGtH3e6SxrzecjXFTUx4
         0XHQ==
X-Forwarded-Encrypted: i=1; AFNElJ8/a6ELmLezXy9uKL6Pm/BrzCv6hSh+tzKC2BKYl6ne7sV/oDCjEHsIOFsiTZtxosE6gHqkFXO7mlHnvZdBLUBq@lists.infradead.org
X-Gm-Message-State: AOJu0YxrsUcw47rMZhQMbDxtt570B14uQ9DU+NAy8GhcmYqPhG/g6Bnc
	LtzeAhGTgrbH6mUxlt4zGXo/CYYjSxSDMha8rmX+Sz0BodMKFE4Uvf7xzkuq6bG4SyOEG/pKfYb
	KL5LNpWC7ExCl+lJ7ZWeFsRPDNA==
X-Received: from ilsl6.prod.google.com ([2002:a05:6e02:5c6:b0:502:20e8:e7ce])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:2209:b0:6a3:7d5a:1ae0 with SMTP id 006d021491bc7-6a37d9d6e0amr220936eaf.29.1783551127438;
 Wed, 08 Jul 2026 15:52:07 -0700 (PDT)
Date: Wed,  8 Jul 2026 22:51:18 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260708225124.4130846-1-coltonlewis@google.com>
Subject: [PATCH 6.6 v2 0/6] arm64: KVM: Backport VHE-only boot fixes
From: Colton Lewis <coltonlewis@google.com>
To: stable@vger.kernel.org
Cc: oliver.upton@linux.dev, sashal@kernel.org, gregkh@linuxfoundation.org, 
	mizhang@google.com, catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	james.morse@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, ahmed.genidi@arm.com, leo.yan@arm.com, 
	miguel.luis@oracle.com, dbrazdil@google.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_155210_151020_BE5CC4CD 
X-CRM114-Status: GOOD (  10.66  )
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

Architectural updates retroactively made FEAT_E2H0 optional, meaning
hardware can implement FEAT_VHE without FEAT_E2H0. On such CPUs,
HCR_EL2.E2H can reset to an unknown state and must be initialized early
so later code can reliably detect whether E2H mode is active.

Without these fixes, booting 6.6.y as a guest under KVM nested
virtualization will hang at boot.

This series targets 6.6.y specifically because these patches are all
present in 6.12.y and applying these patches to 6.1.y and presumably
older kernels has more conflicts and results in other issues booting
as a guest under nested virtualization. More work is needed to enable
that.

Changes in v2:
- Updated commit messages to reference correct upstream SHA1s.
- Preserved inline EL2 state initialization in Patch 4 to avoid
  unrelated code churn.
- Added upstream commit 3855a7b91d42 ("KVM: arm64: Initialize SCTLR_EL1 in
  __kvm_hyp_init_cpu()") as Patch 5.
- Verified boot and KVM initialization across all KVM execution modes
  (nVHE, hVHE/nested, VHE, and protected).

v1:
https://lore.kernel.org/kvmarm/20260701204342.2654385-1-coltonlewis@google.com/

Ahmed Genidi (1):
  KVM: arm64: Initialize SCTLR_EL1 in __kvm_hyp_init_cpu()

Marc Zyngier (4):
  arm64: sysreg: Add layout for ID_AA64MMFR4_EL1
  arm64: Treat HCR_EL2.E2H as RES1 when ID_AA64MMFR4_EL1.E2H0 is
    negative
  arm64: Fix early handling of FEAT_E2H0 not being implemented
  arm64: Revamp HCR_EL2.E2H RES1 detection

Mark Rutland (1):
  KVM: arm64: Initialize HCR_EL2.E2H early

 arch/arm64/include/asm/el2_setup.h   | 56 ++++++++++++++++++++++++++--
 arch/arm64/kernel/head.S             | 20 ++++------
 arch/arm64/kvm/hyp/nvhe/hyp-init.S   |  3 +-
 arch/arm64/kvm/hyp/nvhe/psci-relay.c |  3 ++
 arch/arm64/tools/sysreg              | 37 ++++++++++++++++++
 5 files changed, 101 insertions(+), 18 deletions(-)


base-commit: da47cbc254661aa66d61ef061485a7080305c4be
--
2.55.0.795.g602f6c329a-goog

