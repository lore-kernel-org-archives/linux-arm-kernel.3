Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE98C79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 08:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qBxNGRr7V0cZXnwM00gER/wx3P+kfpLfgDvX2l6pq3g=; b=c/DOPBKrhIbgFB
	IFa19q3N9wqoXGranb9I1tpZc9FMTPDlIdZKvP+BD8hWmGe/OPktC2GCKod2NjJ42To1BT8vTug/W
	a/tGJFoFeHtv2Ra9PzvqQxG1hEB3XCaojlBBNgXhM8iJYqSsuO2aGIgVSIjr0LVGpSQ3GIR4mYWtP
	e6L6v5uZIL0EMGmot6RR2BizVOp8fsdC8eZGulKcIrfwLQQSH2eBE1kd8bwjvlAqox8i/ixctTSJL
	XRqTOGNY3yIOhy5oZa9btVLvitvVVyV4ADB3fAlqhERSLTRx8/HnU1zTL40UiPNG00gQgH3lPHBFi
	0eCIOnobQQvaB5GgasdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E1h-0000000BACy-0FLa;
	Wed, 09 Sep 2026 08:51:29 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E1d-0000000BAAZ-2yji;
	Wed, 09 Sep 2026 08:51:27 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788943880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qBxNGRr7V0cZXnwM00gER/wx3P+kfpLfgDvX2l6pq3g=;
	b=k9vEQJ8wTctywsO8hI1YZ6um9M/lNjs1S0m1fgpc08NdgIYbZov0Zkofq1AxPdfblwLPa7
	4KmfcHeu6b2Yr+01ivvZ6xjUcjoYm3eAQ5TgjEPS7CKlSdWg/JDCIFLH8782o31SLgz6gd
	OtPuQq0Sjy9sgdW0sWOoMBh3I8RgTIUi6zxLRszOk905I462f6xWyvSyMqAO006ybGNQdu
	SGKHJOBw038XIG0FBCvj4tz2gBcwNTvJjmEFGFYE/BwAJM7xynzmQllAr8cj2jRLAhO1yH
	cjh8vmeAx20BKowGWdN/9sqWAOfZypcjYsZemxfmare/Lp1o32YdrpkitPZpLA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788943880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qBxNGRr7V0cZXnwM00gER/wx3P+kfpLfgDvX2l6pq3g=;
	b=1FCn8GUQNiHI5qLn1sTrlANzuUZEkf5xuKf+VYLZdOJYxtaWZpt+V7r7Urvulh09pavhRF
	dsm/084ewNnqYqDw==
Subject: [PATCH 00/15] vdso: Clean up the vsyscall.h headers
Date: Wed, 09 Sep 2026 10:51:13 +0200
Message-Id: <20260909-vdso-asm-generic-vsyscall-h-v1-0-63ae856cc659@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBswIamuEi1ExxooCwekkO6et
 HyL/wsIJSaBqSmQKLPwGSu6tgG32bgSsq8GrbRRQ6cxeznRyoErxZo6zPKIs/uOG6pgTKB+tL5
 3UA9XosD3f5+X9/0APF61mm0AAAA=
X-Change-ID: 20260812-vdso-asm-generic-vsyscall-h-0f66fe59ad5c
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
 sparclinux@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788943875; l=3678;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=7BLVTFBp0ZEd00ydpjlDQmwAhB/KSP4xZMVY9pc9HOs=;
 b=uTe2i40O4/xeVZQd1jNjZ2OlErGJqBh1xMapRWODGY5Dal9y4CKYI8NBfBpyMTHddnVSWXGD4
 N0TrnT9R60lBMxCVhZtCvdvXAnyBBfInKOtzLXA0tNQZs9VfRNj5zYY
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_015125_982068_C2A7BFA8 
X-CRM114-Status: UNSURE (   8.16  )
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

The vsyscall.h headers are a mess. Some of that was necessary back when
some architectures where not using the generic vDSO infrastructure.
Now that this is not necessary anymore, the headers can be cleaned up
and many of the can be deleted altogether.

The recipient list is trimmed to only the vDSO maintainers and the
architecture lists.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Thomas Weißschuh (15):
      vdso: Move the kernel-side time update helpers to a new header
      vdso/gettimeofday: Define fallback __arch_get_vdso_u_time_data() in gettimeofday.c
      vdso/getrandom: Define fallback __arch_get_vdso_u_rng_data() in getrandom.c
      vdso/vsyscall: Define fallback time synchronization functions in vsyscall.c
      vdso: Delete asm-generic/vdso/vsyscall.h
      x86/vdso: Move vDSO page definitions to asm/vdso.h
      sparc/vdso: Move __VDSO_PAGES to asm/vdso.h
      s390/vdso: Delete asm/vdso/vsyscall.h inclusions
      sparc/vdso: Delete asm/vdso/vsyscall.h inclusion
      x86/vdso: Delete asm/vdso/vsyscall.h inclusions
      arm64/vdso: Delete asm/vdso/vsyscall.h inclusions
      riscv/hwprobe: Include vdso/datapage.h
      vdso: Remove unnecessary vdso/vsyscall.h includes
      vdso: Add asm-generic/vdso/vsyscall.h
      vdso: Remove __ASSEMBLER__ guards from vsyscall.h

 MAINTAINERS                                  |  2 +-
 arch/arm/include/asm/vdso/vsyscall.h         |  7 ------
 arch/arm/kernel/vdso.c                       |  1 -
 arch/arm64/include/asm/vdso/getrandom.h      |  1 -
 arch/arm64/include/asm/vdso/vsyscall.h       |  7 ------
 arch/arm64/kernel/vdso.c                     |  1 -
 arch/arm64/kernel/vdso/vdso.lds.S            |  1 -
 arch/loongarch/include/asm/vdso/vsyscall.h   | 14 -----------
 arch/loongarch/kernel/vdso.c                 |  1 -
 arch/mips/include/asm/vdso/vsyscall.h        | 16 -------------
 arch/mips/kernel/vdso.c                      |  1 -
 arch/powerpc/include/asm/vdso/vsyscall.h     | 14 -----------
 arch/riscv/include/asm/vdso/vsyscall.h       | 14 -----------
 arch/riscv/kernel/sys_hwprobe.c              |  2 +-
 arch/riscv/kernel/vdso.c                     |  1 -
 arch/s390/include/asm/vdso/getrandom.h       |  1 -
 arch/s390/include/asm/vdso/vsyscall.h        | 16 -------------
 arch/s390/kernel/time.c                      |  6 ++---
 arch/s390/kernel/vdso.c                      |  1 -
 arch/s390/kernel/vdso/vdso.lds.S             |  1 -
 arch/sparc/include/asm/vdso.h                |  6 +++++
 arch/sparc/include/asm/vdso/vsyscall.h       | 10 --------
 arch/sparc/vdso/vdso-layout.lds.S            |  2 +-
 arch/sparc/vdso/vma.c                        |  1 -
 arch/x86/entry/vdso/common/vdso-layout.lds.S |  1 -
 arch/x86/entry/vdso/vma.c                    |  1 -
 arch/x86/include/asm/vdso.h                  |  7 ++++++
 arch/x86/include/asm/vdso/vsyscall.h         | 22 -----------------
 include/asm-generic/Kbuild                   |  1 +
 include/asm-generic/vdso/vsyscall.h          | 35 ----------------------------
 include/linux/vdso_time.h                    |  8 +++++++
 include/vdso/vsyscall.h                      |  7 ------
 kernel/time/vsyscall.c                       | 25 +++++++++++++++-----
 lib/vdso/getrandom.c                         |  8 +++++--
 lib/vdso/gettimeofday.c                      | 10 +++++---
 35 files changed, 60 insertions(+), 192 deletions(-)
---
base-commit: 1c2a9f9d89050cd9f2b2280060a9442338a1e6fe
change-id: 20260812-vdso-asm-generic-vsyscall-h-0f66fe59ad5c

Best regards,
--  
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


