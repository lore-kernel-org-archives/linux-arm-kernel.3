Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB2551098793
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 15:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MdVeokZjbztoTDx0L1beL77+M+R2awklYBvUejvaGn0=; b=k6mFdoGbUMPJ29O0075/vpA4Jz
	XSAyZ1w4NI6VJHQorO7YNvczdTPTFzwFlHJ3ColXeLn0guyIzfUNYkswgefpYAfhLbMcJU8mxDQro
	Ut1gljRMeOkMJ90rkzKBAKd9KBKgYiLKOG0GyNfYHUzWOr9gOav45kYaLsHxvix/wHfCQ0KsLYH2F
	ijTfwUaA0bRTfh9dPzyj231xED6HjMCwqnLuXiRxyTLwr8MNqUIiHp7voc/wkh81e7EYjplLICXI2
	DHoEDmWOkitl9DhsT3fGJCImdYuF+jxPuEcvjMwmQd3Ewu+0oMx+U9jJSZx7CCnczbZ4TFvv+V8tn
	mI2k8U3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3bKU-0000000CyPF-34w5;
	Fri, 20 Mar 2026 15:00:02 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3bKS-0000000CyNW-1Oph
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 15:00:01 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-43b3da235dbso642636f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 07:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774018798; x=1774623598; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MdVeokZjbztoTDx0L1beL77+M+R2awklYBvUejvaGn0=;
        b=gwrjvkToRvVv/44vx7TogYdJwX2t8xa8IaR7vMjEtHzznkKBZDL0Z/I6XhIDEsJ503
         Kdbmg073Q1YyZywipc+kDI3o0Km5HR443koifS4Rpt9bOLlSouLPuPeHNL4FvNeAuivG
         Kd2Gn+BrkTbL3SJWzsMLx6xfqcMOb+J9BcPonQxn/z//ROydxX7lnU+mDV1gl0cxIp94
         eMHmsR74psDvB5tdH0J6ovYTQbvKibg5jxSLh+LWncNOtA60XU8L3oYE5BBGoYnKbq7q
         gcNEW5G4DJL9rRQ0P4WfYnv+rvwGOuF+zvMI7VRT+1uslaI8yPOoVhvulbfJKtWSZDC5
         6k3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774018798; x=1774623598;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MdVeokZjbztoTDx0L1beL77+M+R2awklYBvUejvaGn0=;
        b=RTtIeEm33heGR3nj88gkVUcRdfH0/DqHm7nmba92ARfVpCPVTiUSaR/z9w9Hv7n1pV
         d66cjFkQ2n+u//1j2JBTad6Foo9A2fE16QxBJ18lcedX0GQZMzby/zgAT47FfpoAE8IJ
         L+qdZ8l+6vj6S5biIjiL9k/O5I+g6uGvnJiEClJ65s1Jknr63Q4qtoXzq4Cugg/kzGWk
         /ohEIFN/wvoOHVvckDKvYCUySYEgcnE4QNbxehTiRCr2QD1ujCnXScYQbhpksm1GX47L
         fQRLEVDK6A68w9CTd5HoZKfpSzUeHNNFE9QDBsi522TDDnDVchTn8+A68lv5F2yjrirc
         0b8g==
X-Gm-Message-State: AOJu0YztO8iiYE2tVq6F/iTnUY8CS3+BJ3a/PUyifGBuE56sMRiVGKIn
	HBbLf3infvkivAMeuJk/RVkIE5L+9R+qlQIcX7NbGRMZtrVIhYnNGq4hK0uZ7sbfsCANvf++AA=
	=
X-Received: from wmdd6.prod.google.com ([2002:a05:600c:a206:b0:485:3f38:3dd2])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:c16e:b0:485:9a50:3370
 with SMTP id 5b1f17b1804b1-486fedb9497mr47266945e9.8.1774018797760; Fri, 20
 Mar 2026 07:59:57 -0700 (PDT)
Date: Fri, 20 Mar 2026 15:59:35 +0100
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2793; i=ardb@kernel.org;
 h=from:subject; bh=Kl2s1+jB9ADBOpcUfcC5kqKIeNKk1TvIXb5NWMCOWDY=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIXNvwvVCm4W7k+S+9jxJDjINjj92aRLDxz2bDl3M7b2wp
 s9KPyGoo5SFQYyLQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAEzE5AjDP53LXxQmHHy20vSM
 lOnRvwbnXbXOGrF9D47dVOH2/+g/Ph1Ghk2fVeM2bYvJrH70s8vMJO5+75m5nzYEPL4y4+RbeZF dx3kA
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
Message-ID: <20260320145934.2349881-15-ardb+git@google.com>
Subject: [PATCH v3 00/13] arm64: Unmap linear alias of kernel data/bss
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, will@kernel.org, 
	catalin.marinas@arm.com, mark.rutland@arm.com, 
	Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Liz Prucka <lizprucka@google.com>, 
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_080000_393881_FBC97E7F 
X-CRM114-Status: GOOD (  13.24  )
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

One of the reasons the lack of randomization of the linear map on arm64
is considered problematic is the fact that bootloaders adhering to the
original arm64 boot protocol may place the kernel at the base of DRAM,
and therefore at the base of the non-randomized linear map. This puts a
writable alias of the kernel's data and bss regions at a predictable
location, removing the need for an attacker to guess where KASLR mapped
the kernel.

Let's unmap this linear, writable alias entirely, so that knowing the
location of the linear alias does not give write access to the kernel's
data and bss regions.

Changes since v2:
- Keep bm_pte[] in the region that is remapped r/o or unmapped, as it is
  only manipulated via its kernel alias
- Drop check that prohibits any manipulation of descriptors with the
  CONT bit set
- Add Ryan's ack to a couple of patches
- Rebase onto v7.0-rc4
 
Changes since v1:
- Put zero page patch at the start of the series
- Tweak __map_memblock() API to respect existing table and contiguous
  mappings, so that the logic to map the kernel alias can be simplified
- Stop abusing the MEMBLOCK_NOMAP flag to initially omit the kernel
  linear alias from the linear map
- Some additional cleanup patches
- Use proper API [set_memory_valid()] to (un)map the linear alias of
  data/bss.

Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Liz Prucka <lizprucka@google.com>
Cc: Seth Jenkins <sethjenkins@google.com>
Cc: Kees Cook <kees@kernel.org>
Cc: linux-hardening@vger.kernel.org

Ard Biesheuvel (13):
  arm64: Move the zero page to rodata
  arm64: mm: Preserve existing table mappings when mapping DRAM
  arm64: mm: Preserve non-contiguous descriptors when mapping DRAM
  arm64: mm: Remove bogus stop condition from map_mem() loop
  arm64: mm: Drop redundant pgd_t* argument from map_mem()
  arm64: mm: Permit contiguous descriptors to be rewritten
  arm64: mm: Use hierarchical XN mapping for the fixmap
  arm64: kfence: Avoid NOMAP tricks when mapping the early pool
  arm64: mm: Permit contiguous attribute for preliminary mappings
  arm64: Move fixmap page tables to end of kernel image
  arm64: mm: Don't abuse memblock NOMAP to check for overlaps
  arm64: mm: Map the kernel data/bss read-only in the linear map
  arm64: mm: Unmap kernel data/bss entirely from the linear map

 arch/arm64/include/asm/pgtable.h  |   4 +
 arch/arm64/include/asm/sections.h |   1 +
 arch/arm64/kernel/vmlinux.lds.S   |   6 +
 arch/arm64/mm/fixmap.c            |   8 +-
 arch/arm64/mm/mmu.c               | 138 +++++++++++---------
 5 files changed, 90 insertions(+), 67 deletions(-)


base-commit: f338e77383789c0cae23ca3d48adcc5e9e137e3c
-- 
2.53.0.959.g497ff81fa9-goog


