Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6814CDE00E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 12:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8P/TDVoY9rLolsMoac+hbxM6rYfibWe7vkJCayuCM5Y=; b=dbq0JybQE0iJXytrrjwgBnsDyh
	2b0dOhxhpP9qpqalvCK4UgSXFQ7W3mOb8UY4nr1s1gFztimMB7oJHYZJ8G7zy8mlkOqyi5Mq4ky1p
	7iq0bwXBKcvVojAJS+QcSGovN0tmHQ3CviaywgnhywnnZG8rwvQ/VJ02nuZzTHqxoONd4ynVyTAxO
	0aKUTsW9VuSPpa8hTcZ/ziAvYxmLPRljo76BuEBNht9P1ci4qapUo8wg/eb4+iiipCpKu6fmT2rtA
	vEiowfbWxUOIS1XNj0TYeg8rCC9Ox1nbS9T7ZZy7GWd+5JytKHAF4IrI2KAPSgbBRDqZincSSODhE
	oAgKdKJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd5yo-0000000BKdb-3vi2;
	Fri, 26 Jun 2026 12:48:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd5yn-0000000BKdF-3aow
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 12:48:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9C6534427E;
	Fri, 26 Jun 2026 12:48:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C2181F000E9;
	Fri, 26 Jun 2026 12:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782478101;
	bh=8P/TDVoY9rLolsMoac+hbxM6rYfibWe7vkJCayuCM5Y=;
	h=From:Date:Subject:To:Cc;
	b=COwRB3bHX7JbzfEIqHNm5i6LDtPiGuuXL2YxJ7np25HxrHbhL+zI8lar7sEOIb9sU
	 mdzb6UR6tlfMQbGbzS/SRWiJWiX1wXKzqM4fDj+UNRcoECO/KxAcdiyXKAk+d3mlca
	 aVWG0euHCIcCjL+EtZNVXTEsco3861e7yI+YA9loqGf6MABg3MeHGFm/Ab1Q8GEmEl
	 TmOxc/F7En4/KVpRoqF3FFfyMPsEqLzc+GUEFpCTJVRiyGNFpq7TArX8eul9+K9dKx
	 9kAC2dV8R1qWc2qcOfa7e+Yj4zMRnY1dKT0gd1h6kKR1c5fskNa/NxLhsQvKUxr8xy
	 jN17KC/2ipyYQ==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 26 Jun 2026 14:48:15 +0200
Subject: [PATCH] RFC: ARM: breakpoint: CFI breakpoints only on demand
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-arm32-cfi-bug-v1-1-a467b5050c0b@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ5AMBBA4avIrE1SJRWuIhZaU0biJ62KRNxds
 fwW713gyTF5qJMLHB3seV0isjQBM3bLQMh9NEghlVBSYefmXKKxjDoMmAmrKyXKojIFxGZzZPn
 8fk372wc9kdnfCdz3A7MJL+pxAAAA
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


