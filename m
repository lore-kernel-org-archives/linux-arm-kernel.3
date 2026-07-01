Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC36C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 07:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Dn93ANJFEv/oMU4vPa0WSiqap/D6BCcqx1zjNYHWMYU=; b=ezyy57ieXmvrJyndpI/w+L5bui
	nVszDIWJvihvf4cygGhglvzwF+1s7lO2k88mfLfey1sEchmY3hhgy0dBkjozpDrxFsFU52ghIjv18
	KR2LvX2a3edQZhd+Fi04CbywNS55eFeWtPatLS0rcQ0zWnBsVxpfTcwVo3hal7dXmYrslUaE6qzvX
	zjoYcPWmQfGyxIfNUDV1OB5+gAhXZZL8KCcAzow0ArJ4jwBj5XnLKMUqX6NSlIa1EO2AWM9P/BRrb
	85KGGLIiviLm9MKkgOeb1WLdqn1RSxOMo+IjxVZB6idvBU8m21kuDxnM0cK/uQt9nRUXEWUCOvf/t
	fpJzkuTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wep73-00000000sJD-1Btp;
	Wed, 01 Jul 2026 07:12:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wep71-00000000sJ0-3Znz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 07:12:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DD0986001D;
	Wed,  1 Jul 2026 07:11:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9ABD1F000E9;
	Wed,  1 Jul 2026 07:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782889918;
	bh=Dn93ANJFEv/oMU4vPa0WSiqap/D6BCcqx1zjNYHWMYU=;
	h=From:Date:Subject:To:Cc;
	b=Q8Mp1NXNkHGscfTsybc+ruifepYthS6ipdFqKejsqkeAw8k/ESgjhdye8dhCf8zBo
	 mthCgeOMvojdVQ4tMkjUjiBBX5ttEE+wyPtlFCwIvrbRt7x3AyAy0ujVt6GhoUKnzA
	 tZ3V1n3yxDc3qtUXaZBEWc6cYkcGR0zZfFK3rvAsHXfsucFJxJPD45RTXG/sKBTvd3
	 tSbTmguny0R1aPf3hC3mrhWbX2y6CyNnhF8ICa4AoOrVZFbRSXFpZtgkcx7u4mP537
	 oWEmFX9kj89K+AKQZcj7qDqwX/n/KxeLi73jDYkE/p2J0BR3WS/AJcuyVZi9YhbYmV
	 rhhpwssyhuE0Q==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 01 Jul 2026 09:11:54 +0200
Subject: [PATCH v2] RFC: ARM: breakpoint: CFI breakpoints only on demand
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-arm32-cfi-bug-v2-1-9bf922593e00@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNSw6CQBAFr2J6bZueEYbgynsYFszYQPsB0wNEQ
 7i7gGuXldSrN0FkFY5w2k2gPEqUrl3A7ncQmrKtGeW6MFiyjpx1WOrzaDFUgn6o0VDlc0dZkoc
 Els1LuZL31rsUP46Dv3Ho18hqNBL7Tj/b4WhW7197NGiwTFzmU0opkD/fWVt+HDqtoZjn+QtSp
 Lh4vQAAAA==
X-Change-ID: 20260626-arm32-cfi-bug-10fb960749c4
To: Russell King <linux@armlinux.org.uk>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, slipher <slipher@protonmail.com>, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.15.2
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

This removes the stub hw_breakpoint_cfi_handler() from ARM, making
it not steal breakpoint type 0x03 (ARM_ENTRY_CFI_BREAKPOINT) unless
CFI is actively used in the kernel.

When not instrumenting with CFI, we fall through to return 1 from
hw_breakpoint_pending() "unhandled fault" so userspace can make use
of this breakpoint.

This of course does not work if userspace want to use CFI and custom
breakpoints at the same time, and CONFIG_CFI does exist as something
users might want to select for their kernel. If this is not good
acceptable we need to think about other ways for CFI to interfer, such
as not using BKPT at all (rather something like BUG()) and back out
the offending patch until the compiler behaviour has changed.

Fixes: c3f89986fde7 ("ARM: 9391/2: hw_breakpoint: Handle CFI breakpoints")
Reported-by: slipher <slipher@protonmail.com>
Closes: https://lore.kernel.org/lkml/kJqktbpLphg_Pk5I5SPptgTLjl3E3eq5mN5UzCslyFj7Q1Irp-wDid4mj5eQVd2iZtRGXgeZd8goq195EkXdjyt864YMc8mVb2B9NGH91NQ=@protonmail.com/
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Trying to solve the CFI bug. Let's see of this first
approach is acceptable for the reporter.
---
Changes in v2:
- Resending as non-RFC so it can be applied as a band-aid.
- Link to v1: https://patch.msgid.link/20260626-arm32-cfi-bug-v1-1-a467b5050c0b@kernel.org
---
 arch/arm/kernel/hw_breakpoint.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm/kernel/hw_breakpoint.c b/arch/arm/kernel/hw_breakpoint.c
index cd4b34c96e35..007023db6a5d 100644
--- a/arch/arm/kernel/hw_breakpoint.c
+++ b/arch/arm/kernel/hw_breakpoint.c
@@ -929,10 +929,6 @@ static void hw_breakpoint_cfi_handler(struct pt_regs *regs)
 		break;
 	}
 }
-#else
-static void hw_breakpoint_cfi_handler(struct pt_regs *regs)
-{
-}
 #endif
 
 /*
@@ -964,9 +960,11 @@ static int hw_breakpoint_pending(unsigned long addr, unsigned int fsr,
 	case ARM_ENTRY_SYNC_WATCHPOINT:
 		watchpoint_handler(addr, fsr, regs);
 		break;
+#ifdef CONFIG_CFI
 	case ARM_ENTRY_CFI_BREAKPOINT:
 		hw_breakpoint_cfi_handler(regs);
 		break;
+#endif
 	default:
 		ret = 1; /* Unhandled fault. */
 	}

---
base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
change-id: 20260626-arm32-cfi-bug-10fb960749c4

Best regards,
--  
Linus Walleij <linusw@kernel.org>


