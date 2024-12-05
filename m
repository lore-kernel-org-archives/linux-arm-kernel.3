Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83237E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 15:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BwJubUT8Tdc7oClPWEPhghjrfw8jIX6vzdGr4YCz4uQ=; b=0lH5k2fj70JCjAddj48nWqb2np
	eJbfw3Eqj+5muWye/GrxGtU6li8jpCzBbHTgMcUyv5Bh6kFu/YIlq6D9V7uuU7DrSrLuhmF22kLfH
	R+2lRr13wv2JC6l/U8ebXhjMmWxeblgICXXB5GfwLMgCaKATVlaFRr3vRZLlQtJWjVie94b+51ZgU
	SXLWePX5aVVHYfaWI016jxa0DMZKYUlF3Z/JRBVxHp9IhsAvfZlhAJ8PBcVkpu8RIb+aLfhBD2729
	lQgw3cvp3SoqMBHn6el79PS2Dk6RRIVFnovFjpkDwT7gOmrCbTWUc8nLvQ8qTU9jcE2lD0GkeR5dv
	MKMbUwtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJDOy-0000000GRwa-154o;
	Thu, 05 Dec 2024 15:04:24 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJDNw-0000000GRg4-1wbJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 15:03:21 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-434a467e970so8672975e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 07:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733410998; x=1734015798; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BwJubUT8Tdc7oClPWEPhghjrfw8jIX6vzdGr4YCz4uQ=;
        b=DK3PY9zeZ7IOUT7YGSSQ4zAZ/DlTW+AzydFfTpbJMQXLLwt6BggEb/ALQvV1FloKDc
         2t3YpKkE1K92YEBAN/fjz83NHLGIMvBlTzDJiemW1S+8N7dkq0a6fY+oTx1rRQDZplst
         d7xCHClcT5+TALYnStxuw9xztvCqFt2zL+5nOQPHZQvdXL4Ce8GD1RZSlz3dqbvCOhjq
         Ze+uiF6WEZVs8RtEnDsJBPUecKedNczwN0GHdiioOBFZV94m9KpPcADRhtFtCv9y7kOF
         ntvVef5aaIR/2Bzgiemu7STFgVzHTrZ+8+Maz7MVsHNXhK25f0E6SVA38O6UVtCOu7S6
         nfRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733410998; x=1734015798;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BwJubUT8Tdc7oClPWEPhghjrfw8jIX6vzdGr4YCz4uQ=;
        b=W0qPUfCpb+20piRP7MMtwv6Cj5MfmWX5kaFMzWDoAePYXKOa/PJS69dWo7zFEy7mlu
         XjQ0LHmv/efMg6njtG6KUJnRhHHAvpkL6ITuCWZ59/XFplLrPxS4pmeEo0Lc/87+00Gf
         XiThJEFtfYFvHohVWyAwdrOVdG/gWBKHyV7emR2D7ujXesuDWWJzSiLFuqHp6ozvlhS8
         am4cqNlWuKDf/YcQvLc4njvB410DKdwm4q1e4qbdBMRYRlSUPWnO687AP6xo/A+gsU/7
         bRhRCT01Hmij0PhXtM5n1Zx0tjqLHvwaYu748WbC153tbxOEfUy0KUciZVDr9OT8M5Uj
         cFrA==
X-Gm-Message-State: AOJu0Yxr2I1HlTJQRAODqgdsrJRHcbZQNTRiERz+WRG2kWgToZ26vfko
	tJXf5BDpwCBaGN0C9rK/xNCnZin7PENfC5tbbdf67xWRXzAkYzILFI0h6RwhXHMF8WJfAXdQDwE
	HVVowTrA8nzsH9Kn50fqzU8qpG+2fCSvKX/an3ASxVVW1gqjLcrrI2D67S4WSl3siGGla8Y5slG
	3UcVH7NeuM1QURmlrsarya2lUz+g2Ip9CMM0p6zBlN
X-Google-Smtp-Source: AGHT+IGioVJCoK8zYYqTywuPhQi+8Z7KdiKyqo2KQn5SY2N3fSHvvtqHDwjOOZi2i4b0vvNS4g5Z3uNA
X-Received: from wmaw15.prod.google.com ([2002:a05:600c:6d4f:b0:434:a158:2c03])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3151:b0:434:9936:c828
 with SMTP id 5b1f17b1804b1-434d09b64e4mr97941255e9.12.1733410997284; Thu, 05
 Dec 2024 07:03:17 -0800 (PST)
Date: Thu,  5 Dec 2024 16:02:30 +0100
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2744; i=ardb@kernel.org;
 h=from:subject; bh=mRRjZP9KtZpr0axKuxzKvK9RQGNYQZdHxwWtIVX9O9g=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIT3wQFt27UZV6ejOY/n/qh7kyFwzN7runGb/7++ucI8DR
 xKclFI6SlkYxDgYZMUUWQRm/3238/REqVrnWbIwc1iZQIYwcHEKwES+f2Nk2HLcccoTi9fqjpdS
 9VUlpu3Ly6855nl+OoNuy5sqw2/McowMBx++35G/o+9JM0+o1TWRFfeu3hBr/fjj5fLmkvdLJ9/ fxgQA
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241205150229.3510177-8-ardb+git@google.com>
Subject: [PATCH v2 0/6] arm64: Clean up and simplify PA space size handling
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Kees Cook <keescook@chromium.org>, 
	Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_070320_499743_16CE1A3C 
X-CRM114-Status: GOOD (  14.63  )
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
 arch/arm64/include/asm/sparsemem.h     |  4 ++-
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
 19 files changed, 63 insertions(+), 117 deletions(-)

-- 
2.47.0.338.g60cca15819-goog


