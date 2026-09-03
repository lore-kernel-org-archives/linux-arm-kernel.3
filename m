Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2749C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 07:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5KW4JSiXbH9maSfkULvZaqX7CoVimn1QeXod/ruf3No=; b=N1XembfJcrnXR1
	LEii3rIMbokbih7hfkAYl0EpPT/0tScDQAp8YMWgkGDmwIFt+U2b+Z9cfG9HHdkPFu3PS2MB7FBjr
	xjvVYungaIZzP6qEsB3XpLNtXXuQwoHz6MAwbiTUmHT20B/TUqEpSpqCcfYuQG+kjExfW3ZVG0yS2
	5vXGpePgBQQot6p5OYEIIxk2dGSWqfsmYl+mTUDGy0bz9LnAbVs0Y7zKa40iKXY1zsaBR8MYcCJRL
	1o1tCfiHw7D2jUjCmfShc21OyV3U3rVBMgAf/qPTY0oHAS8K1qEoAtmCSXYlCAxEUqkWlHZxpQ8za
	N4wrMzZcniFKwsT5pXbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x224m-0000000GclJ-1PCb;
	Thu, 03 Sep 2026 07:41:36 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x224i-0000000Gchx-2WO1;
	Thu, 03 Sep 2026 07:41:34 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788421287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5KW4JSiXbH9maSfkULvZaqX7CoVimn1QeXod/ruf3No=;
	b=sP4GAzlfiwyJ8SlAiXB9hhGatHqYn5Vcn3KyodxJkAO1wj/PHMlbdW77kFZude743RnLhd
	B5QZwXUkCLLV6Wvnob5GUovY1H43zZVNWtGF5UOAyDtw0h84ySpzYI64iVVJEIHvicRsJY
	pD1ld4DRhtbdgnX9NNClO75WOFLSWKxzBq3iHywNs/5YkMjYPN/hkHQCvUYgFe8rIWuTxq
	ufYRd2Yn9ZInjWVURzxboS8uymqnHI7MPJc3Ye+zTbYZ7DuMs5zMOjmE9Qpb0t7EMovaQc
	99zQAQl51CjfPmTlBPFogtZ+kwL7ycovS8bv8r+JCiyjj17qoIK0POFSFj9veQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788421287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5KW4JSiXbH9maSfkULvZaqX7CoVimn1QeXod/ruf3No=;
	b=74b6hxEuHiaYbO16J3R8hRN+sLyi/sfMIBBYDtJQpn5U/qxoOZMHYwATNk199oaBFFJwuk
	Q6njN3w1wiL/mPDw==
Subject: [PATCH v2 00/15] exec: Remove AT_VECTOR_SIZE_ARCH from UAPI
Date: Thu, 03 Sep 2026 09:41:15 +0200
Message-Id: <20260903-at-vector-size-arch-v2-0-5bc32a71e3d8@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NQQ6CMBBFr0Jm7ZhpSQi48h6GRSlTmcQU05YGJ
 dzdiluX7yfv/Q0iB+EIl2qDwFmizL6APlVgJ+PvjDIWBk26IUUdmoSZbZoDRnkzmmAnbJic5s6
 5dmigmM/ATtajeusLTxKL8DpOsvquv15N+m8vKyQ0SjmqB6Otaa8P8UsKs5f1PDL0+75/AAd6e
 Um6AAAA
X-Change-ID: 20260109-at-vector-size-arch-6e0f2e9ff8b6
To: Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-sh@vger.kernel.org, linux-alpha@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Andy Chiu <andybnac@gmail.com>, 
 Magnus Lindholm <linmag7@gmail.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788421286; l=3129;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=3s3XptoE1X5UpOSAIz59e0R0lZLIvWXcerejp7RbE+E=;
 b=XVy2EwXriKXi49fdKmjGDzcDgmWqDqa4Nz8coc0Bonz8f2R5uqRepUP5lWAxCUStMn+bsNf9+
 GanZj2c8Z3BAevBQ7Rcfu7kM1Xymj/tUjcr033fxv07isChfPk+ufoG
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_004132_800612_3CFC7358 
X-CRM114-Status: UNSURE (   8.22  )
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

There is nothing userspace can do with this value. In the kernel is
always combined with AT_VECTOR_SIZE_BASE, which is not exposed to
userspace and also changes from time to time.

Move the symbol to kernel-internal headers.

Meant to be applied through the asm-generic or execve tree.
The default recipient list was huge. I trimmed it to only the
architecture lists.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Changes in v2:
- Rebase on v7.3-rc1.
- Pick up tags.
- Link to v1: https://lore.kernel.org/r/20260302-at-vector-size-arch-v1-0-a11f03ba2ca8@linutronix.de

---
Thomas Weißschuh (15):
      MAINTAINERS: exec: Add more auxvec.h variants
      auxvec.h: Move AT_VECTOR_SIZE definitions to linux/auxvec.h
      asm-generic: add an in-kernel auxvec.h header
      ARM: drop custom asm/auxvec.h
      x86: Remove AT_VECTOR_SIZE_ARCH from UAPI
      arm64: Remove AT_VECTOR_SIZE_ARCH from UAPI
      RISC-V: Remove AT_VECTOR_SIZE_ARCH from UAPI
      LoongArch: Remove AT_VECTOR_SIZE_ARCH from UAPI
      s390: Remove AT_VECTOR_SIZE_ARCH from UAPI
      powerpc: Remove AT_VECTOR_SIZE_ARCH from UAPI
      MIPS: Remove AT_VECTOR_SIZE_ARCH from UAPI
      sparc: Remove AT_VECTOR_SIZE_ARCH from UAPI
      sh: Remove AT_VECTOR_SIZE_ARCH from UAPI
      alpha: remove AT_VECTOR_SIZE_ARCH from UAPI
      auxvec.h: Drop fallback AT_VECTOR_SIZE_ARCH

 MAINTAINERS                              |  5 +++++
 arch/alpha/include/asm/auxvec.h          |  7 +++++++
 arch/alpha/include/uapi/asm/auxvec.h     |  8 +++-----
 arch/arm/include/asm/auxvec.h            |  1 -
 arch/arm64/include/asm/auxvec.h          |  7 +++++++
 arch/arm64/include/uapi/asm/auxvec.h     |  6 ++----
 arch/loongarch/include/asm/auxvec.h      | 14 ++++++++++++++
 arch/loongarch/include/uapi/asm/auxvec.h |  8 +++-----
 arch/mips/include/asm/auxvec.h           | 17 +++++++++++++++++
 arch/mips/include/uapi/asm/auxvec.h      |  8 +++-----
 arch/powerpc/include/asm/auxvec.h        |  7 +++++++
 arch/powerpc/include/uapi/asm/auxvec.h   |  6 ++----
 arch/riscv/include/asm/auxvec.h          | 13 +++++++++++++
 arch/riscv/include/uapi/asm/auxvec.h     |  2 --
 arch/s390/include/asm/auxvec.h           |  7 +++++++
 arch/s390/include/uapi/asm/auxvec.h      |  6 ++----
 arch/sh/include/asm/auxvec.h             |  7 +++++++
 arch/sh/include/uapi/asm/auxvec.h        |  8 +++-----
 arch/sparc/include/asm/auxvec.h          |  6 ++++++
 arch/sparc/include/uapi/asm/auxvec.h     |  8 +++-----
 arch/x86/include/asm/auxvec.h            | 12 ++++++++++++
 arch/x86/include/uapi/asm/auxvec.h       | 13 +++----------
 include/asm-generic/Kbuild               |  1 +
 include/asm-generic/auxvec.h             |  7 +++++++
 include/linux/auxvec.h                   |  5 +++++
 include/linux/mm_types.h                 |  6 ------
 26 files changed, 139 insertions(+), 56 deletions(-)
---
base-commit: 2698961599195990117a0fa240118ecf2f8e7453
change-id: 20260109-at-vector-size-arch-6e0f2e9ff8b6

Best regards,
--  
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


