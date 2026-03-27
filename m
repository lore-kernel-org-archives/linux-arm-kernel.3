Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B85310ED64A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 11:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cWi4tsU07W8zdjWvbAUHzl7MmNBwNpbFy2DN6BpKSUQ=; b=RUWiPSnUIMFUeRi0k7lGFSvLif
	wn/YHTCF7wwRk/MaPQs+MRxc3AXCtEU+K3iN8Jm/4hjMjGOyBFaVbGqq2ZjHERVvaXIOKTqdgFv18
	s3pFF2cnVwdug5uJVfi5h30enRRTYNHNTu1bUnuugQdeHU/UYR0MtGWLtDbE50QksB2AETiNbxojV
	WLVZVG6G+KXkRWgfh8FWzRC+Fqpwe0gzbxcvcpu/v0bTuVY5mCXAcY9ok4h6RND9whYPN0/3ATKy4
	SLxsE/gmmZbFU7PfB+VAJtnIUA707R9dOhaTwJ2EYTlt37vj8YqVJs2sJgvuQQSWjfK0Vk6hpHHjv
	LssF5pRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65PI-00000007E8Z-2m8c;
	Fri, 27 Mar 2026 11:31:16 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65PG-00000007E7F-3HIA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 11:31:16 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-43b96365ea8so1961959f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 04:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774611072; x=1775215872; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cWi4tsU07W8zdjWvbAUHzl7MmNBwNpbFy2DN6BpKSUQ=;
        b=f4HJGu+IfdIPoiqGJezZpWDumOxDkVbrcoRvLo47861vBUT3lQ8pVZLHLcUfzn1zCG
         La3lULe/vx5B9MYohtS9L6UsEhjMtdkx04rg7Qm6txLhUbu8iXN2sdDv+9HLiQL1tEGi
         dNJ/JtN+YnhPbhPojkVljiYSU3oYcpjmWQvvAaa5gOUZxR9sV5l+qZjsS2iDJZMiG34W
         B6EaRMUAceFT8WtkEgtFT+OIeaYnlmmtGB6Swm9XmQsrvEcahmRunWcityHVpbRqZYYW
         6t3vV1NihNDoccx6GyCcwgOhQ10Bppcw2QWCsSlFRCboSrfRs5EWIxnJi8qUZ1sgg4Ju
         aIRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774611072; x=1775215872;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cWi4tsU07W8zdjWvbAUHzl7MmNBwNpbFy2DN6BpKSUQ=;
        b=lOoFX88oWCz8m5EG/iytzumpnY5847CSI5Sw0Warr6zhv9PYf/LF4QtFgJQ9Sjpjhz
         pmY3BMjn0ytT0sjwy6P2SrUCPTWIRhJgHsjnxiUcqWRDwACcZde0GnpVlODRoepNHnpt
         Nyqm+IdJeN6tU7ra/8Jc3K9TJrHfCDgk7KHxIW6hTwdkpX0DXYXSAo31Kxvn4qmKvkEw
         q82YqMBdRkKqYPHg9ELTpdtix3o1wT5imCA5Qia9pcyTAkiunzXLhq4STWEW3sGQe7Sn
         1Y+0/FlE7C0GqYEmz2EScEfGuIqrLLrGlxSCJCGK3jp8nBBemmf9qtMUQRibdAAu/6Zr
         LjtQ==
X-Gm-Message-State: AOJu0YzPQTQ88nZ94zOpMzcJr+m+2r0Wj0RnEcZsujli1eToNpOaTZSz
	GZTJnY+hoNuoNyy91K3ui5X8ud2iRLXnyOEYqELDKlVsS2gnAZzTh9qLnuu8SgLJh3YIxv1wkA=
	=
X-Received: from wrvx13.prod.google.com ([2002:a5d:54cd:0:b0:43a:5b:6a87])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:2313:b0:43b:905d:f89f
 with SMTP id ffacd0b85a97d-43b9ea66dccmr3373359f8f.39.1774611071907; Fri, 27
 Mar 2026 04:31:11 -0700 (PDT)
Date: Fri, 27 Mar 2026 12:30:48 +0100
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2230; i=ardb@kernel.org;
 h=from:subject; bh=XeSSbbJ4zYZ7OrRBfI89bxz2saKmw5oGCVUlBedEe7Y=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIfNYVkbKiv4duu7JN5Z7mAaYh728pH0o9uj5Rd9/Wp7Zu
 lmx1e1ARykLgxgXg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZjIlDUMfzjtU/pt9PJXccrv
 3PtJ8cWzTxc+3Nh6/m/g+4h2pk/PDigz/C9S+Wp2et9q3njmjbrXbv1at7hGbpbORrWS2Glfd+x S0eAEAA==
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Message-ID: <20260327113047.4043492-7-ardb+git@google.com>
Subject: [PATCH 0/5] xor/arm: Replace vectorized version with intrinsics
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-raid@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Christoph Hellwig <hch@lst.de>, Russell King <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Eric Biggers <ebiggers@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_043114_853695_70D86B38 
X-CRM114-Status: GOOD (  12.41  )
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

Replace the compiler vectorized XOR implementation for ARM with the
existing NEON intrinsics implementation used by arm64. This is slightly
faster, and allows some minor cleanups of the type hacks in the headers
now that intrinsics are the only C code permitted to use FP/SIMD
instructions.

Performance (QEMU mach-virt VM running on Synquacer [Cortex-A53 @ 1 GHz]

Before:

[    3.519687] xor: measuring software checksum speed
[    3.521725]    neon            :  1660 MB/sec
[    3.524733]    32regs          :  1105 MB/sec
[    3.527751]    8regs           :  1098 MB/sec
[    3.529911]    arm4regs        :  1540 MB/sec

After:

[    3.517654] xor: measuring software checksum speed
[    3.519454]    neon            :  1896 MB/sec
[    3.522499]    32regs          :  1090 MB/sec
[    3.525560]    8regs           :  1083 MB/sec
[    3.527700]    arm4regs        :  1556 MB/sec

This applies onto Christoph's XOR cleanup series.

Cc: Christoph Hellwig <hch@lst.de>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Eric Biggers <ebiggers@kernel.org>

Ard Biesheuvel (5):
  ARM: Add a neon-intrinsics.h header like on arm64
  crypto: aegis128 - Use neon-intrinsics.h on ARM too
  xor/arm: Replace vectorized implementation with arm64's intrinsics
  xor/arm64: Use shared NEON intrinsics implementation from 32-bit ARM
  ARM: Remove hacked-up asm/types.h header

 arch/arm/include/asm/neon-intrinsics.h |  64 +++++++
 arch/arm/include/uapi/asm/types.h      |  41 -----
 crypto/aegis128-neon-inner.c           |   4 +-
 lib/raid/xor/arm/xor-neon.c            | 183 ++++++++++++++++++--
 lib/raid/xor/arm/xor-neon.h            |   7 +
 lib/raid/xor/arm/xor_arch.h            |   7 +-
 lib/raid/xor/arm64/xor-neon.c          | 170 +-----------------
 lib/raid/xor/arm64/xor-neon.h          |   3 +
 lib/raid/xor/arm64/xor_arch.h          |   4 +-
 lib/raid/xor/xor-8regs.c               |   2 -
 10 files changed, 244 insertions(+), 241 deletions(-)
 create mode 100644 arch/arm/include/asm/neon-intrinsics.h
 delete mode 100644 arch/arm/include/uapi/asm/types.h
 create mode 100644 lib/raid/xor/arm/xor-neon.h

-- 
2.53.0.1018.g2bb0e51243-goog


