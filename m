Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC486C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 12:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yCrLXsnLx/b2bMi+9G8HMMh37OcPMJMjpgwdLJka8XQ=; b=Rkyb6EFm+F518/vCp1+JBwR/T3
	gsiA9P3ynmEEAtNKAhOU/Kh6Aetaa8IYNB371oYyvgm98yN/z/rVWynzMcsJzWSZU0JZ0omcnylW2
	1JFKr88oA8YAO/Amk/vSMsOANV0TGPGKI4gMsfcH77SxuDyODahiF7bJMvjlOPH6sVBwinccevia/
	MX3etnsjXMLd5hX2MrUYSZkMLW4GQKpeC3IHr//fIpF8n5jfMWUfaas3OajBfWriw9ZnH985yMgxm
	caPNaNhv1N7rnIv8iVVtUJ08aHQsWZPs9oQ7LlBVMVMN0OOYgYSIY1s7n6sS/1Hp/I1xAjua0dzep
	Wapr29ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcxg-00000006vZg-27Jo;
	Fri, 03 Jul 2026 12:25:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcxe-00000006vZE-2OmA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 12:25:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A6A006001A;
	Fri,  3 Jul 2026 12:25:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CBFD1F000E9;
	Fri,  3 Jul 2026 12:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783081536;
	bh=yCrLXsnLx/b2bMi+9G8HMMh37OcPMJMjpgwdLJka8XQ=;
	h=From:Date:Subject:To:Cc;
	b=nyIH+P7ck3fnFVUNe7Gaz9WIiYCAF3iWjigoDnKd1sFIOYEu7h4FEnWsN5ZQBSKmg
	 cVWqG6n3vaVT+tucS1oCyuyFavWTWgSgt1cTnYPvtNvmAfcw7ntdDQbd8u0PAfsP8E
	 Msu6Y4X0Za4zm4ATH5DZtoGzuCLnavqVnV2R+SziNZfjrrKbur1c277HQs/lKK0HoU
	 cFqu9Palj5NQQjvowIVyANf4UXX4IHS8ZOep2DviWFJicCS6JToxzWSYrYvfHgCbGP
	 biRhMDP1cBM+osZvduW7vXx6iCOG/5KbVALwgr04UaSC5fbkPXoZC5WnZCNHDcmeok
	 yPYf5SF+VEF/w==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 03 Jul 2026 14:25:27 +0200
Subject: [PATCH v4] ARM: breakpoint: CFI breakpoints only on demand
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-arm32-cfi-bug-v4-1-c26acb640a8f@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NTQ6CMBCG4auYrq2ZTkuxrryHcUHrAPUHTItEY
 7i7BRdGjS6/ZJ537ixS8BTZanZngXoffdukoeYz5uqiqYj7XdoMATVo1LwIJ4nclZ7bS8UFlNZ
 oyJVxiiVzDlT669TbbJ87XuyeXDdGxovax64Nt+lhL8a7X+1ecMELpXObQQYO7PpAoaHjog0VG
 +M9vngO4pNj4saWBjEzkgC+uPzLZeIkncwJ7RIK9caHYXgAmZpBfDsBAAA=
X-Change-ID: 20260626-arm32-cfi-bug-10fb960749c4
To: Russell King <linux@armlinux.org.uk>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org, 
 slipher <slipher@protonmail.com>, Mark Rutland <mark.rutland@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Will Deacon <will@kernel.org>, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
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

When not instrumenting with CFI, or when a breakpoint is issued in
userspace, we fall through to return 1 from hw_breakpoint_pending()
"unhandled fault" so userspace can make use of this breakpoint.

Tested with LKDTM and this command line:
echo CFI_FORWARD_PROTO > /sys/kernel/debug/provoke-crash/DIRECT
still works as expected.

Fixes: c3f89986fde7 ("ARM: 9391/2: hw_breakpoint: Handle CFI breakpoints")
Reported-by: slipher <slipher@protonmail.com>
Suggested-by: Mark Rutland <mark.rutland@arm.com>
Closes: https://lore.kernel.org/lkml/kJqktbpLphg_Pk5I5SPptgTLjl3E3eq5mN5UzCslyFj7Q1Irp-wDid4mj5eQVd2iZtRGXgeZd8goq195EkXdjyt864YMc8mVb2B9NGH91NQ=@protonmail.com/
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Trying to solve the CFI bug. Let's see of this first
approach is acceptable for the reporter.
---
Changes in v4:
- Dodge the BKPT if we are coming from userspace!
- Would be great if the reporter can test this with and without
  CONFIG_CFI.
- Link to v3: https://patch.msgid.link/20260701-arm32-cfi-bug-v3-1-e3c37e2b80a4@kernel.org

Changes in v3:
- Actually strip the RFC prefix...
- Link to v2: https://patch.msgid.link/20260701-arm32-cfi-bug-v2-1-9bf922593e00@kernel.org

Changes in v2:
- Resending as non-RFC so it can be applied as a band-aid.
- Link to v1: https://patch.msgid.link/20260626-arm32-cfi-bug-v1-1-a467b5050c0b@kernel.org

To: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
To: Russell King <linux@armlinux.org.uk>
To: Kees Cook <kees@kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-perf-users@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 arch/arm/kernel/hw_breakpoint.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/arm/kernel/hw_breakpoint.c b/arch/arm/kernel/hw_breakpoint.c
index cd4b34c96e35..38feb30dfb5f 100644
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
@@ -964,9 +960,14 @@ static int hw_breakpoint_pending(unsigned long addr, unsigned int fsr,
 	case ARM_ENTRY_SYNC_WATCHPOINT:
 		watchpoint_handler(addr, fsr, regs);
 		break;
+#ifdef CONFIG_CFI
 	case ARM_ENTRY_CFI_BREAKPOINT:
-		hw_breakpoint_cfi_handler(regs);
+		if (user_mode(regs))
+			ret = 1; /* Don't handle userspace BKPT */
+		else
+			hw_breakpoint_cfi_handler(regs);
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


