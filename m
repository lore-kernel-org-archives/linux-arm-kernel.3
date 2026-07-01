Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2146C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 10:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OEdz+rLxqF1S83O2UZrN8DXpt6GP29carIftf0rRt7Y=; b=SeDxaRsAYZY4jL8vfiLabWmO0p
	vnOeMqR3T5lPtjtiz9MQdfvtcc74dFtblSN8zJ5AL3xpndAzVY80nQ8YmZ/5udq1ec+68HU78Eop7
	z1s/rmByMpfCwawVF+trseJjjDl16D2EkQQj5OKm4CAfzRy2htm+z+bhJ4vkOGFBL79ER+FxrkJ3F
	m43DGtZZzNT3pC1ASXGsraHx7RjPLqvb5hKko9Yj8SOsmBX6J98SP8uN9MBGMrw7t8l1zYW69kU6W
	5dxlU8PWu2wsengu3m81u8A1DDF5nrMifH24sHezWmb9pFrozHmnJjZu2h3fDN1I1dAYlzWrDfFKm
	O84ZmzBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesOc-00000001L2M-18cT;
	Wed, 01 Jul 2026 10:42:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesOa-00000001L1U-3w8Z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 10:42:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2565D60138;
	Wed,  1 Jul 2026 10:42:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9651D1F000E9;
	Wed,  1 Jul 2026 10:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782902539;
	bh=OEdz+rLxqF1S83O2UZrN8DXpt6GP29carIftf0rRt7Y=;
	h=From:Date:Subject:To:Cc;
	b=BGoo7WJyNkrgqzu6VOUXDckvrTCsW3w7mIqXj+Vh32lPGMYRsf9pS17ZIBagv+YT/
	 Uuv25d3xrED5FDGBK1y6Ov329R20HrKzZaNcXxNgel1hKKKEMxB/JS6j5sWgidvGqP
	 aCc5JlThWrnOU6mPdwldnrm5wvgm+1ULbavTh1MK9MDRFhvhK9U9edCDI555yNOC/S
	 J6T8CF/3n4Yr1Ckpd/kBDPO2ccqYlmhnOaOexUHOX04hiNzwgFH2WjqE825pr1xCQW
	 3SdjGAEm9x4ax+LOvUTin8CtCK1pPsZz5Aymjx7eFA7FTqM5pmBZa7iMNSLkZvq0My
	 Pt95PS+09enCA==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 01 Jul 2026 12:42:09 +0200
Subject: [PATCH v3] ARM: breakpoint: CFI breakpoints only on demand
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-arm32-cfi-bug-v3-1-e3c37e2b80a4@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNyw6CMBBFf4V0bc10gJK68j+MC1oHqA8wLTQaw
 r/b4sJo4vIk95w7M0/Okme7bGaOgvV26CPkm4yZru5b4vYUmSGgBImS1+6WIzeN5XpquYBGKwl
 VoUzBonN31NjH2jsc3+wnfSYzpkhadNaPg3uuh0Gk3b92EFzwupCVLqEEA3p/IdfTdTu4lqV4w
 I9egfjVMepKNwqxVDkBfOnLsrwAJCryIPwAAAA=
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
Changes in v3:
- Actually strip the RFC prefix...
- Link to v2: https://patch.msgid.link/20260701-arm32-cfi-bug-v2-1-9bf922593e00@kernel.org

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


