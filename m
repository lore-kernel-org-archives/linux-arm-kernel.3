Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A339FD3770
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 16:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jiEHsHfMpWlRl7bljrHmdd+gJcFtALSCg3Y7Z7VxAHw=; b=ZI4XNGEOgyMTEw4+LSvAATBODF
	fSRCzTj+P6xROuMr3lJV/pELGZ9KbUe1CCAP5uFzEbOBAgoEfrVrN8Lx4sOGadFK/i+UsvO/5RmHw
	hY/A/cehjKIuo8pdwmA+Kp/ZgEURJd9vW86mM5fa7irwrWgMkvR+mVFdhuqKDRqQuBHERr6UJOuc5
	YrqXBPDWenGySBnowAQpyVonRmlQjTZxOTvVltefd+Jg4/5cxFNCb3JtuI2PgoFHb1LzBoATxreLr
	Fs0aXOqyEsQ07fqu1Suo/U49l5aLmmHSb5SERbr86949rUCPxr+7VEcx3qY2HnjBe+uyj2go0W2tg
	OMbvd7ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHWf-00000004TXH-00GK;
	Wed, 25 Feb 2026 16:14:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHWd-00000004TWf-2DaT;
	Wed, 25 Feb 2026 16:14:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D443B600AE;
	Wed, 25 Feb 2026 16:14:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38738C19421;
	Wed, 25 Feb 2026 16:14:07 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: Will Deacon <will@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-mm@kvack.org
Subject: [PATCH v2 0/5] mm: arch/shstk: Common shadow stack mapping helper and VM_NOHUGEPAGE
Date: Wed, 25 Feb 2026 16:13:57 +0000
Message-ID: <20260225161404.3157851-1-catalin.marinas@arm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This is v2 of the series extracting the common shadow stack mmap into a
separate helper for arm64, riscv and x86. Thanks for the review.

Andrew, if you are happy with this, I think taking the patches through
the mm tree makes most sense.

Minor changes since v1:

- Removed #ifdef from the helper function declaration
- Used two tabs for the alignment of multi-line function arguments
- Added "There is no functional change" to the arch patches log
- Collected ack/review/test tags

v1:

https://lore.kernel.org/r/20260224175800.2500729-1-catalin.marinas@arm.com

Catalin Marinas (5):
  mm: Introduce vm_mmap_shadow_stack() as a helper for VM_SHADOW_STACK
    mappings
  arm64: gcs: Use the new common vm_mmap_shadow_stack() helper
  riscv: shstk: Use the new common vm_mmap_shadow_stack() helper
  x86: shstk: Use the new common vm_mmap_shadow_stack() helper
  mm: Do not map the shadow stack as THP

 arch/arm64/mm/gcs.c         | 14 +-------------
 arch/riscv/kernel/usercfi.c | 12 +-----------
 arch/x86/kernel/shstk.c     | 12 ++----------
 include/linux/mm.h          |  2 ++
 mm/util.c                   | 29 +++++++++++++++++++++++++++++
 5 files changed, 35 insertions(+), 34 deletions(-)


