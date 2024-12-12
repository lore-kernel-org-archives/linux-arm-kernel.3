Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C835E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 08:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eZxIxb08AFzTWoKrgKOX13TiM2yGibM60AZ71EJbzeU=; b=RtNbSueVXTQ6cOgZbBQfTcUIF/
	lMQag8Aku8AsJa1tHBad9GEeGEJO7XNwYCLrd6oI5POp62TCJG4D3zRj3QFKms3akZ3aCc9QG5OIO
	0B503YFDbqLhGDUK064ivkp3kolV/uuIyQHd3EZYVGvx1RjMP5GOpzGC5EjV8kwDqG24aoCUjxxWy
	VcRJTceApLm7MEZaySXv5Y6PYZIfu1iwIRotHaH0qJqIFuCL9/1G3Cd4wE4GAJ8IoiZHPRb6QAgqn
	fZ+PJePdtEmL/UqJSnbS3bdN2BpafL7igAFg7eylgwzY2qj1PUKkHz33osUOZhNLYAd6qZDN8mE/f
	Lt3Lb+kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLeRE-0000000HHKP-1cjw;
	Thu, 12 Dec 2024 08:20:48 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLePT-0000000HGhY-1UYa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 08:19:00 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-434fb9646efso2899135e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 00:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733991537; x=1734596337; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eZxIxb08AFzTWoKrgKOX13TiM2yGibM60AZ71EJbzeU=;
        b=mZDILrjAxG67TDb0+x4Sf9qa/aVl8Zla3xWcjGiA/mNv4ZVaiDTPahcvcYgX/CAVvN
         kZd13ENBEJnWtIlIlZHyhmdImLbJy/wIN8wEA2oIOdBe3Oc/VN5qjcr+GV6LqFMsdHUm
         VEy+6/JRuERMegJtBgYAW7xy6+HWDh5gwtoFDUEJvSsE+8uoPWAdDqm/es6wFd9yZGHn
         c3Elo3ZwXrWwkxCCD/dh6M4J6Vawv/1wZPVhNck8MA+a1Pm8uN4HdwhNwJVYaZjn1mO2
         Md/IwZbU1RA2yIly8GlkT6vnVtvUe5VQe+w/ca4u0uvJoifWx+28Xwi21cb7ujoZ9Z2s
         Q/cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733991537; x=1734596337;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eZxIxb08AFzTWoKrgKOX13TiM2yGibM60AZ71EJbzeU=;
        b=NaCOzy9TRH+BsEs1BGPwqC4NXqcLj8HHIAk9xPb55f/zK6IphSNfqT7FV3OcnGM+TS
         dda141gOnt0T8ToviHcXozmS8bX1JUmgiVDA/MeCTcFvD/wJa4cNLvOL+lsVjmyAGcoC
         EAaTMNbIOrsnKa/GuLEXHtruus3/iB0pgHR7nV929NCM8jzo/4mkHsdie/r7bjO584Tk
         nIf5P3bIlymgP0RudLsGvfDFV0JR/Y7vkqsyCAKqSd+eSe85AhJGCFT1cTcpxv7VMv0f
         C5dzLDT9Cl7ETl5XqHaHAVHszLqht+48Qba45GiZDPrP6cCouJPnUX4NVDoKKhniJ7hz
         s5Zg==
X-Gm-Message-State: AOJu0Yx+AL2vcxcJSFT0JeQWj02cuzPeH96DGA1NdiX+qkGxpA8TdD4g
	zFAYQH8OXhvrppq2p6i+XYrZjLa7BGsKUzW45kLgkriTBYKhxKpgL/aw81Zu7GJ5/5DSd6yEaP8
	M5vtzVFlqdctl/PR4CwX/hR3dLg8wPLrpEA4BwRQPBwRNcK8pFi/7OzW6MERS8Ceh7ZE79WLT8k
	dOZp0jUZFComCUSqT4VDk09WBsvqS8B4GWJ4/DOcP8
X-Google-Smtp-Source: AGHT+IF2vmDSiNp6YQveUxSHd4dHnzmu0hMH4N0O/nDHLokka+n8/j7E8uKPq55GrDTrh9brZQc0gsZM
X-Received: from wmqd1.prod.google.com ([2002:a05:600c:34c1:b0:434:f350:9fc])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1c16:b0:434:a386:6cf
 with SMTP id 5b1f17b1804b1-4361c344b7emr48469835e9.2.1733991537221; Thu, 12
 Dec 2024 00:18:57 -0800 (PST)
Date: Thu, 12 Dec 2024 09:18:42 +0100
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2901; i=ardb@kernel.org;
 h=from:subject; bh=eoER92ARiF/hRhV403UkEurD5/0joQIOstiB5pr57tY=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIT1qTtKkmgc2N9Idr01x/DpX6Nrn5+87Ns2feNV4bsvuK
 dX7Tu4711HKwiDGwSArpsgiMPvvu52nJ0rVOs+ShZnDygQyhIGLUwAmkhPL8N8xe0NlmojhwkKJ
 AHsjt5scUmE7Hty+pfNo+VduF1k3V35GhsdmCjFvvaRmtLBkyae1y/w0X8lppZoh8Cbt4XK+v2U VLAA=
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241212081841.2168124-8-ardb+git@google.com>
Subject: [PATCH v3 0/6] arm64: Clean up and simplify PA space size handling
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Kees Cook <keescook@chromium.org>, 
	Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_001859_393432_8B1EDA52 
X-CRM114-Status: GOOD (  15.75  )
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

From: Ard Biesheuvel <ardb@kernel.org>

This series addresses a number of buglets related to how we handle the
size of the physical address space when building LPA2 capable kernels:

- reject 52-bit physical addressess in the mapping routines when LPA2 is
  configured but not available at runtime
- ensure that TCR.IPS is not set to 52-bits if LPA2 is not supported
- ensure that TCR_EL2.PS and DS match the host, regardless of whether
  LPA2 is available at stage 2
- don't rely on kvm_get_parange() and invalid physical addresses as
  control flags in the pKVM page donation APIs

Finally, the configurable 48-bit physical address space limit is dropped
entirely, as it doesn't buy us a lot now that all the PARange and {I}PS
handling is done at runtime.

Changes since v2:
- add a definition of MAX_POSSIBLE_PHYSMEM_BITS to fix a build error in
  zsmalloc (#1)
- rename 'owner_update' to 'annotation' (#4)

Changes since v1:
- rebase onto v6.13-rc1
- add Anshuman's ack to patch #1
- incorporate Anshuman's feedback on patches #1 and #2
- tweak owner_update logic in patch #4

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Quentin Perret <qperret@google.com>

Ard Biesheuvel (6):
  arm64/mm: Reduce PA space to 48 bits when LPA2 is not enabled
  arm64/mm: Override PARange for !LPA2 and use it consistently
  arm64/kvm: Configure HYP TCR.PS/DS based on host stage1
  arm64/kvm: Avoid invalid physical addresses to signal owner updates
  arm64: Kconfig: force ARM64_PAN=y when enabling TTBR0 sw PAN
  arm64/mm: Drop configurable 48-bit physical address space limit

 arch/arm64/Kconfig                     | 37 ++------------------
 arch/arm64/include/asm/assembler.h     | 14 +++-----
 arch/arm64/include/asm/cpufeature.h    |  3 +-
 arch/arm64/include/asm/kvm_pgtable.h   |  3 +-
 arch/arm64/include/asm/pgtable-hwdef.h | 12 +------
 arch/arm64/include/asm/pgtable-prot.h  |  7 ++++
 arch/arm64/include/asm/pgtable.h       | 11 +-----
 arch/arm64/include/asm/sparsemem.h     |  5 ++-
 arch/arm64/include/asm/sysreg.h        |  6 ----
 arch/arm64/kernel/cpufeature.c         |  2 +-
 arch/arm64/kernel/pi/idreg-override.c  |  9 +++++
 arch/arm64/kernel/pi/map_kernel.c      |  6 ++++
 arch/arm64/kvm/arm.c                   |  8 ++---
 arch/arm64/kvm/hyp/pgtable.c           | 33 ++++++-----------
 arch/arm64/mm/init.c                   |  7 +++-
 arch/arm64/mm/pgd.c                    |  9 ++---
 arch/arm64/mm/proc.S                   |  2 --
 scripts/gdb/linux/constants.py.in      |  1 -
 tools/arch/arm64/include/asm/sysreg.h  |  6 ----
 19 files changed, 64 insertions(+), 117 deletions(-)

-- 
2.47.1.613.gc27f4b7a9f-goog


