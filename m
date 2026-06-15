Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5728CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 17:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ktoQ097mTWDtSnEGRbrmbkUtEyP+n9X+6dQfQpSj2Uc=; b=s8tdXu54D1gSbkO9TLZcTdC3NE
	k5UyQPEhgssr8kK9fVDL2U4ZYeLKZw1pzIJgpq0f9XKpaDzAM7Y3VlstDRDOX9cONAzumjI4sEHZ+
	uIFbCtjwayzZb3Qoq8f6xF/EmeIYeOEWF0Nv0fMy91EDgNYuhc3hqr6kbuUfVcGSLN7BbjyySX1du
	8ibpu19G3yp8QJn7HHICYf2mHw0KJySa0yS0wXfVZFpTbwle7snu+M/Zf40NbwOoO9LsOvhKU9wbp
	5FsS6j0r7SEG9fNM6YqME/kOlgIXM8FSaI0YSaUs+49lDZB0ZluFzwe2vkH2wfTm+b0wWMRQ4u3zD
	Ddem3pYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZBPv-0000000EgTP-2E3U;
	Mon, 15 Jun 2026 17:48:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZBPt-0000000EgT8-3QN9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 17:48:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E3CCA6008A;
	Mon, 15 Jun 2026 17:48:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D8331F000E9;
	Mon, 15 Jun 2026 17:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781545688;
	bh=ktoQ097mTWDtSnEGRbrmbkUtEyP+n9X+6dQfQpSj2Uc=;
	h=Date:From:To:Cc:Subject;
	b=f91BvxTWW4vbP4wROAwq0ubKzzRPfgcUf1eIuUoIBtiafesnv0Fs3SHQvjr/83yZi
	 5meui5L5dvBxmtuia4DBAqneoGYhfyWleyEC+/vz939Tg3BtjEFr9DHRQF0etp7FA+
	 g81Hucy32zYNnc1brS9KXiBtpmNaupnTQMKy5MB02cANyykr0br+n3SwLwMrASSzQV
	 d/0ExFglsuisWzYfwkuVStfKxzg19mkQsoQKaLtT+J0Hu5aKHBw4qJp6shGh3HhJ5K
	 w6JjsuRs5Z1Gl9WWZIDOHl3dO9t21j2JAwxpFjdsQ4b5cp9wYeDPZr4XzRbPfXEOFo
	 9RGeXvFUwY4Ng==
Date: Mon, 15 Jun 2026 10:48:07 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Christoph Hellwig <hch@lst.de>
Subject: [GIT PULL] CRC updates for 7.2
Message-ID: <20260615174807.GA1831@quark>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

The following changes since commit e7ae89a0c97ce2b68b0983cd01eda67cf373517d:

  Linux 7.1-rc5 (2026-05-24 13:48:06 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git tags/crc-for-linus

for you to fetch changes up to cbe44c389ae80362e72696ac08f7c55a83f2a050:

  crypto: aegis128 - Use neon-intrinsics.h on ARM too (2026-05-28 13:14:25 -0700)

----------------------------------------------------------------

Accelerate CRC64-NVME for 32-bit ARM by refactoring the arm64 NEON
intrinsics implementation to be shared by 32-bit and 64-bit.

Also apply a similar cleanup to the 32-bit ARM NEON implementation of
xor_gen(), where it now reuses code from the 64-bit implementation.

----------------------------------------------------------------
Ard Biesheuvel (6):
      ARM: Add a neon-intrinsics.h header like on arm64
      xor/arm: Replace vectorized implementation with arm64's intrinsics
      xor/arm64: Use shared NEON intrinsics implementation from 32-bit ARM
      lib/crc: Turn NEON intrinsics crc64 implementation into common code
      lib/crc: arm: Enable arm64's NEON intrinsics implementation of crc64
      crypto: aegis128 - Use neon-intrinsics.h on ARM too

 Documentation/arch/arm/kernel_mode_neon.rst        |   4 +-
 arch/arm/include/asm/neon-intrinsics.h             |  60 +++++++++
 crypto/Makefile                                    |  10 +-
 crypto/aegis128-neon-inner.c                       |   4 +-
 lib/crc/Kconfig                                    |   1 +
 lib/crc/Makefile                                   |   9 +-
 lib/crc/arm/crc64-neon.h                           |  34 +++++
 lib/crc/arm/crc64.h                                |  36 +++++
 lib/crc/arm64/crc64-neon.h                         |  21 +++
 lib/crc/arm64/crc64.h                              |   4 +-
 lib/crc/{arm64/crc64-neon-inner.c => crc64-neon.c} |  26 +---
 lib/raid/xor/Makefile                              |  13 +-
 lib/raid/xor/arm/xor-neon.c                        |  26 ----
 lib/raid/xor/arm/xor-neon.h                        |   7 +
 lib/raid/xor/arm/xor_arch.h                        |   7 +-
 lib/raid/xor/arm64/xor-eor3.c                      | 146 +++++++++++++++++++++
 lib/raid/xor/xor-8regs.c                           |   2 -
 lib/raid/xor/{arm64 => }/xor-neon.c                | 143 +-------------------
 18 files changed, 338 insertions(+), 215 deletions(-)
 create mode 100644 arch/arm/include/asm/neon-intrinsics.h
 create mode 100644 lib/crc/arm/crc64-neon.h
 create mode 100644 lib/crc/arm/crc64.h
 create mode 100644 lib/crc/arm64/crc64-neon.h
 rename lib/crc/{arm64/crc64-neon-inner.c => crc64-neon.c} (62%)
 delete mode 100644 lib/raid/xor/arm/xor-neon.c
 create mode 100644 lib/raid/xor/arm/xor-neon.h
 create mode 100644 lib/raid/xor/arm64/xor-eor3.c
 rename lib/raid/xor/{arm64 => }/xor-neon.c (56%)

