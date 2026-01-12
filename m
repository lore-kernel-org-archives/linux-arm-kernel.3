Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8614D25032
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 07:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LruWS9bgL9uclP30PRSFfk5G10oz266R8zNDPLNEDn0=; b=ctcFpO49l19ygX
	p5XYcCuNHl1H1IUOAX0Db2fbIxefHF1ht8h+4vCg6nqcQjFYSsSA/i6S8bEMj5Oa8w/vRwiEf28hz
	SZcQBuwVEdGm/BT5R5K1sroH40OfcGFxVydJ5QtSYZaSBVM8jzc0EGeg1gYJGxVD3+iCvzTALa6DU
	n6Chq88Q4IDBZP30JFelXRmRMhxmT+rQXYRcf7mzt7O2PS6kCg88LjtLjUnuShaOku2DFPvzDRNRo
	M2l4trgcUI7GnaEOEuDleCJ/Lfy9leB97UkOa73p+SRNLT/RgRKXjDBYIYMfbUTpenrmSAtuD9M/B
	7FIX0NQABYQtFsiuaLig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCoz-00000004wL8-30A0;
	Mon, 12 Jan 2026 07:58:41 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCow-00000004wIz-3Lec;
	Mon, 12 Jan 2026 07:58:40 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768204714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LruWS9bgL9uclP30PRSFfk5G10oz266R8zNDPLNEDn0=;
	b=X/iPbSr2WhCsbIPCBtPUv11meOSFgbRYg2YRS/fSrizxcY3XqIYVlFfOS1olKjUpBIOOGT
	D9P0TPn5tqU0Q5QXrqdLS5qTvTdsYr084ncxWq1JcwxscCzhjLSIClOnIdmqxiJ99dTd62
	fweD5jQUVfZVe1FdgDWHLkDumCPsB377tR6WR7UVSKos5xorTG2N5vuuoSj92Jl4RVIXqM
	1ltUhePEAqgEr27+at4X6Z35H50AN4w12U+DYaHRMoK3O06JgWM0v9Hys6j7MT5LtbulJ1
	2i4xLZ0HLfkttmXarP/O1/Q2bpr91mYV9YF+daZcd7Pmi1r913qs8nNYcBjmPg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768204714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LruWS9bgL9uclP30PRSFfk5G10oz266R8zNDPLNEDn0=;
	b=Db2EatKbe7CV5vmXClDvjR7hKP4hoeKYxA9rz/BxSXOyuEdlfqjDbbJC+GdSJ3WPrKHgkl
	ZpQtALIs+WDA9hCg==
Subject: [PATCH v2 0/5] uapi: fix remaining kconfig leaks in UAPI headers
Date: Mon, 12 Jan 2026 08:58:28 +0100
Message-Id: <20260112-headers_install-config-leak-v2-0-4d8084444603@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKSpZGkC/33NQQ6CMBCF4auQWTumLSGCK+9hiCntABOblrRIM
 IS7W4lrl/9bfG+DRJEpwbXYINLCiYPPoU4FmFH7gZBtblBCVVKpBkfSlmJ6sE+zdg5N8D0P6Eg
 /sat1o2Rj6640kIUpUs/rod/b3COnOcT3cbbI7/pzS/HXXSQKpL7TlalqcSntzbF/zTF4Xs+Wo
 N33/QPASapZygAAAA==
X-Change-ID: 20251229-headers_install-config-leak-b8a9219d8b3c
To: Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Dinh Nguyen <dinguyen@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768204713; l=1645;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Omi58sNcFPlfpcb80NgNOQYgGVaLrDz0Q3WmxNIaE/A=;
 b=siKiEG63pzaAcjEWKMUseFVtfGbQIsA69DJxTeH82PA2niUYDkywkH6jqlx/B62gz6XRkbhrr
 9LfD15N9UypCngp1M59620AJrGmB60iKRB4fbgEJy0X8yt3I19YCFp8
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_235838_984778_DDE4E3AD 
X-CRM114-Status: UNSURE (   7.16  )
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

A few UAPI headers still contained references to kconfig symbols.
Clean them all up and afterwards remove the now useless exception
machinery in headers_install.sh.

Intended to be routed through the kbuild tree.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Changes in v2:
- Drop ARC_HAS_SWAPE kconfig option, use ARCH_USE_BUILTIN_BSWAP
- Drop PSR_ENDSTATE from the ARM ptrace.h header.
- Drop nios2 uapi asm/swab.h.
- Link to v1: https://lore.kernel.org/r/20251230-headers_install-config-leak-v1-0-efba5c58073d@linutronix.de

---
Thomas Weißschuh (5):
      ARC: Always use SWAPE instructions and enable ARCH_USE_BUILTIN_BSWAP
      ARM: uapi: Drop PSR_ENDSTATE
      nios2: uapi: Remove custom asm/swab.h from UAPI
      x86/uapi: Stop leaking kconfig references to userspace
      scripts: headers_install.sh: Remove config leak ignore machinery

 arch/arc/Kconfig                         |  6 +-
 arch/arc/Makefile                        |  3 +-
 arch/arc/include/uapi/asm/swab.h         | 99 --------------------------------
 arch/arm/include/asm/processor.h         |  3 +-
 arch/arm/include/uapi/asm/ptrace.h       |  9 ---
 arch/arm/kernel/signal.c                 |  3 +-
 arch/nios2/include/{uapi => }/asm/swab.h |  0
 arch/x86/include/uapi/asm/auxvec.h       |  2 +-
 scripts/headers_install.sh               | 30 +---------
 9 files changed, 9 insertions(+), 146 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251229-headers_install-config-leak-b8a9219d8b3c

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


