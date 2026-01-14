Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E94D31A1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 07:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mXOoPefyW4YJoJDaug/A7xf5w8lSV44uaqzA/Tcxgcw=; b=0/VSS+ptGcss0+
	XpvdzNLfHDc3blyiAAWa3ortZIqybflh0f/MdtMDzAd/VvFMbwwK7tfMHOTdSl0Fztzd2+bc9quuo
	MshFqy+10Ds9Gz/x1nkgQIKmOKHYTMdJL8z0VdXUnJPNY2QhQDSTqcItJWBmV4VcYrh/Msrf8ZR2a
	lPGYvgjfzlJd5OvFTngtfI59z3Rj62oP5hdf6jU++WP+clQbGh4dVmWKX/dmd0Qu41aalIP7HKGg+
	Iha5uGhUVQh4SykOMxpK2crxoD7pUnRovtiNVgYVuu3WmdyZKcfJyWWYLuyvjL+JpB2c6lC4Lqmow
	T7TPaxUGm+g/zdoOSsuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfvIq-00000008CDk-1Rnr;
	Wed, 14 Jan 2026 07:28:28 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfvIn-00000008CBP-27cH;
	Wed, 14 Jan 2026 07:28:26 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768375701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mXOoPefyW4YJoJDaug/A7xf5w8lSV44uaqzA/Tcxgcw=;
	b=WPAE4nVN356pmJs2KHN1PTaTncE6vb8ROHVeBoRXn/B2cXoNErp09wKpaFt+MuTU6Zp1DC
	qjYT5wtDe3ycc5/wVQ4HzzOvcyQP3dxvGQB+2w0nNMJxAKU1y9bGgCh/TQ2EjIYBC2ACOA
	7fDelQ2KoW2FJCD3w3ULleViyqRQsllNTGm7pucnlLpN1ctETXeM4fv5QO4DZDKDOXhJef
	CKhG82j5Bv0Wje9hIyScox5qfJXze/knv+wmF+/L+e/pX5kPcuxSp34KFi2UXlinCBvTr4
	cM1X3GdmYYHJbnOC+jzod3zwFULfVMvqdsxhpMwA6+SSOdkronVqb69FpkNn5w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768375701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mXOoPefyW4YJoJDaug/A7xf5w8lSV44uaqzA/Tcxgcw=;
	b=hQyPK7F/cdd3hb3Xe4yGcEZmoYY4bMQY04jZRtPZs8lAoVAh7UEtH5zw01v1e3NTOQkZM/
	F2YT58m4xCWCcKCQ==
Subject: [PATCH v3 0/5] uapi: fix remaining kconfig leaks in UAPI headers
Date: Wed, 14 Jan 2026 08:28:12 +0100
Message-Id: <20260114-headers_install-config-leak-v3-0-c14cde735a79@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIxFZ2kC/33NTQ6CMBCG4auQrq3pD2Bx5T2MMYUOMLEppsUGQ
 7i7hejGBbN7Z/F8MwngEQI5ZzPxEDHg4FLIQ0aaXrsOKJrURDBRcCEq2oM24MMdXRi1tbQZXIs
 dtaAftFa6ErwyqpYNScLTQ4vTpl9vqXsM4+Df21jk6/frSrbrRk4ZhbbWRVModpLmYtG9Rj84n
 I4GyGpH8fNKxrnY90TycqOYytOVTP57y7J8AKAD47kaAQAA
X-Change-ID: 20251229-headers_install-config-leak-b8a9219d8b3c
To: Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Dinh Nguyen <dinguyen@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768375700; l=1833;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=O3gy1aejCT+Re+qAfKDxCmkgzvWYuY4jLw++qa5054M=;
 b=EDQmfJkXOCC6sUNJXISeegObpPcU0uJNUnCPIg4H5uBC6WqbN3ayHFAqduV0YSKTgMR/8vIZB
 ZbTbsTiYK4dCFfS+WUIHqX1knRF+WbVZH/DBwuh96qIsfIUoCvFC2eT
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_232825_687777_96259B28 
X-CRM114-Status: UNSURE (   7.12  )
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
Changes in v3:
- Replace ARCH_USE_BUILTIN_BSWAP with manual 'swape' inline asm.
- Link to v2: https://lore.kernel.org/r/20260112-headers_install-config-leak-v2-0-4d8084444603@linutronix.de

Changes in v2:
- Drop ARC_HAS_SWAPE kconfig option, use ARCH_USE_BUILTIN_BSWAP
- Drop PSR_ENDSTATE from the ARM ptrace.h header.
- Drop nios2 uapi asm/swab.h.
- Link to v1: https://lore.kernel.org/r/20251230-headers_install-config-leak-v1-0-efba5c58073d@linutronix.de

---
Thomas Weißschuh (5):
      ARC: Always use SWAPE instructions for __arch_swab32()
      ARM: uapi: Drop PSR_ENDSTATE
      nios2: uapi: Remove custom asm/swab.h from UAPI
      x86/uapi: Stop leaking kconfig references to userspace
      scripts: headers_install.sh: Remove config leak ignore machinery

 arch/arc/Kconfig                         |  5 ---
 arch/arc/Makefile                        |  3 +-
 arch/arc/include/uapi/asm/swab.h         | 63 --------------------------------
 arch/arm/include/asm/processor.h         |  3 +-
 arch/arm/include/uapi/asm/ptrace.h       |  9 -----
 arch/arm/kernel/signal.c                 |  3 +-
 arch/nios2/include/{uapi => }/asm/swab.h |  0
 arch/x86/include/uapi/asm/auxvec.h       |  2 +-
 scripts/headers_install.sh               | 30 +--------------
 9 files changed, 8 insertions(+), 110 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251229-headers_install-config-leak-b8a9219d8b3c

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


