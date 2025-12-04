Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14347D1F9A1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 09:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n9pQTcr9XDWaDD9c1jLgmI7vVoQ2f01n0HkHYkWnDno=; b=PuMzxi6zN2BSFrsz1Ldgfl7l4B
	gugkG99ISuiIc6x7CKS6EfQul/gtpTmfUVir3VpPxKc+91GM1SS2zndOOVFAvgMA7hrGl6tWnxkvY
	M3KIrcBPP0U/UAmHj/+LugJGE3GfJ/VSwbfbFCpP9U13GQPDybTIbx9MckNSJa/imcd5dcp+kYhc+
	+hUNKGAxVzkuNaRzH7rTQlo2LRcN2WB23Aljniy1GQspbVzMImD0p4HMss5PB/SX5lDrcRszjcxB+
	TGu8udvORgcUWBh2VzGOvBNlLYH/scc1h7pvlKI8QEWWpkIoMZLSN/4bjGd41Yh99rbAuD5gYwMiC
	qKm3arbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR62F-00000007nu7-0J0w;
	Thu, 04 Dec 2025 09:54:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR62D-00000007ntk-0Koi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 09:54:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E91A342B26;
	Thu,  4 Dec 2025 09:53:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6022C4CEFB;
	Thu,  4 Dec 2025 09:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764842039;
	bh=GS/k0U4iAQ8wizfHFCeeqa07LgcPPHjcnZCXp5vD9ko=;
	h=From:To:Cc:Subject:Date:From;
	b=uRw/dW+v1MhAkgEtfmyA8lY7GaZXdTi+hRyTFFKAyHVQCHeALTl/LVpFr8eBEsU+Q
	 3REnaJ3dmHeg32IU/l0tiaC9lF0oe34CndIVG1I2X3HUoRQ8IC8xf7O2qRH6/vPj6P
	 ZcvxjjaVeTlZH7Y2pQne8xEy2UlFNBgN458dpL+xMK9MxHceNnB9ZpimAuc2us2AMg
	 hiqdDB1gimpkgDF5UsjlsO2/U9g5CVHKdnKaoDcDUZVO9nfdUXg/vbuqWmmV/qX8Vl
	 d5w4yaYlza0BcOX0xGjpLWXKr/MXu7aTyPXLldca4ygmHf8oy0XXJnDFx+XsLvza9g
	 vxVLgYNiiA/KQ==
From: Arnd Bergmann <arnd@kernel.org>
To: soc@lists.linux.dev,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: omap1: avoid symbol clashes in fiq handler
Date: Thu,  4 Dec 2025 10:53:47 +0100
Message-Id: <20251204095355.1032786-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_015401_182098_6846DADF 
X-CRM114-Status: GOOD (  11.50  )
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

From: Arnd Bergmann <arnd@arndb.de>

The ams-delta-fiq-handler.S file has a number of symbols with fairly
generic names, including one named 'exit' that causes a compiler warning
in some configuration options:

vmlinux.o: error: exit() function name creates ambiguity with -ffunction-sections

Change all these symbols to use a .L prefix to make them local to
the fiq handler.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-omap1/ams-delta-fiq-handler.S | 38 ++++++++++-----------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/arch/arm/mach-omap1/ams-delta-fiq-handler.S b/arch/arm/mach-omap1/ams-delta-fiq-handler.S
index 35c2f9574dbd..5cf6fcca602c 100644
--- a/arch/arm/mach-omap1/ams-delta-fiq-handler.S
+++ b/arch/arm/mach-omap1/ams-delta-fiq-handler.S
@@ -97,7 +97,7 @@ ENTRY(qwerty_fiqin_start)
 
 	ldr r13, [r12, #IRQ_ITR_REG_OFFSET]	@ fetch interrupts status
 	bics r13, r13, r11			@ clear masked - any left?
-	beq exit				@ none - spurious FIQ? exit
+	beq .Lexit				@ none - spurious FIQ? exit
 
 	ldr r10, [r12, #IRQ_SIR_FIQ_REG_OFFSET]	@ get requested interrupt number
 
@@ -105,25 +105,25 @@ ENTRY(qwerty_fiqin_start)
 	str r8, [r12, #IRQ_CONTROL_REG_OFFSET]
 
 	cmp r10, #(INT_GPIO_BANK1 - NR_IRQS_LEGACY)	@ is it GPIO interrupt?
-	beq gpio				@ yes - process it
+	beq .Lgpio				@ yes - process it
 
 	mov r8, #1
 	orr r8, r11, r8, lsl r10		@ mask spurious interrupt
 	str r8, [r12, #IRQ_MIR_REG_OFFSET]
-exit:
+.Lexit:
 	subs	pc, lr, #4			@ return from FIQ
 	@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
 
 
 	@@@@@@@@@@@@@@@@@@@@@@@@@@@
-gpio:	@ GPIO bank interrupt handler
+.Lgpio:	@ GPIO bank interrupt handler
 	ldr r12, omap1510_gpio_base		@ set base pointer to GPIO bank
 
 	ldr r11, [r12, #OMAP1510_GPIO_INT_MASK]	@ fetch GPIO interrupts mask
-restart:
+.Lrestart:
 	ldr r13, [r12, #OMAP1510_GPIO_INT_STATUS]	@ fetch status bits
 	bics r13, r13, r11			@ clear masked - any left?
-	beq exit				@ no - spurious interrupt? exit
+	beq .Lexit				@ no - spurious interrupt? exit
 
 	orr r11, r11, r13			@ mask all requested interrupts
 	str r11, [r12, #OMAP1510_GPIO_INT_MASK]
@@ -131,7 +131,7 @@ restart:
 	str r13, [r12, #OMAP1510_GPIO_INT_STATUS] @ ack all requested interrupts
 
 	ands r10, r13, #KEYBRD_CLK_MASK		@ extract keyboard status - set?
-	beq hksw				@ no - try next source
+	beq .Lhksw				@ no - try next source
 
 
 	@@@@@@@@@@@@@@@@@@@@@@
@@ -145,10 +145,10 @@ restart:
 
 	ldr r10, [r9, #BUF_STATE]		@ fetch kbd interface state
 	cmp r10, #0				@ are we expecting start bit?
-	bne data				@ no - go to data processing
+	bne .Ldata				@ no - go to data processing
 
 	ands r8, r8, #KEYBRD_DATA_MASK		@ check start bit - detected?
-	beq hksw				@ no - try next source
+	beq .Lhksw				@ no - try next source
 
 	@ r8 contains KEYBRD_DATA_MASK, use it
 	str r8, [r9, #BUF_STATE]		@ enter data processing state
@@ -162,9 +162,9 @@ restart:
 	mvn r11, #KEYBRD_CLK_MASK		@ prepare all except kbd mask
 	str r11, [r12, #OMAP1510_GPIO_INT_MASK]	@ store into the mask register
 
-	b restart				@ restart
+	b .Lrestart				@ restart
 
-data:	ldr r10, [r9, #BUF_MASK]		@ fetch current input bit mask
+.Ldata:	ldr r10, [r9, #BUF_MASK]		@ fetch current input bit mask
 
 	@ r8 still contains GPIO input bits
 	ands r8, r8, #KEYBRD_DATA_MASK		@ is keyboard data line low?
@@ -175,7 +175,7 @@ data:	ldr r10, [r9, #BUF_MASK]		@ fetch current input bit mask
 	mov r10, r10, lsl #1			@ shift mask left
 	bics r10, r10, #0x800			@ have we got all the bits?
 	strne r10, [r9, #BUF_MASK]		@ not yet - store the mask
-	bne restart				@ and restart
+	bne .Lrestart				@ and restart
 
 	@ r10 already contains 0, reuse it
 	str r10, [r9, #BUF_STATE]		@ reset state to start
@@ -189,7 +189,7 @@ data:	ldr r10, [r9, #BUF_MASK]		@ fetch current input bit mask
 	ldr r10, [r9, #BUF_KEYS_CNT]		@ get saved keystrokes count
 	ldr r8, [r9, #BUF_BUF_LEN]		@ get buffer size
 	cmp r10, r8				@ is buffer full?
-	beq hksw				@ yes - key lost, next source
+	beq .Lhksw				@ yes - key lost, next source
 
 	add r10, r10, #1			@ incremet keystrokes counter
 	str r10, [r9, #BUF_KEYS_CNT]
@@ -213,9 +213,9 @@ data:	ldr r10, [r9, #BUF_MASK]		@ fetch current input bit mask
 	@@@@@@@@@@@@@@@@@@@@@@@@
 
 
-hksw:	@Is hook switch interrupt requested?
+.Lhksw:	@Is hook switch interrupt requested?
 	tst r13, #HOOK_SWITCH_MASK 		@ is hook switch status bit set?
-	beq mdm					@ no - try next source
+	beq .Lmdm				@ no - try next source
 
 
 	@@@@@@@@@@@@@@@@@@@@@@@@
@@ -230,9 +230,9 @@ hksw:	@Is hook switch interrupt requested?
 	@@@@@@@@@@@@@@@@@@@@@@@@
 
 
-mdm:	@Is it a modem interrupt?
+.Lmdm:	@Is it a modem interrupt?
 	tst r13, #MODEM_IRQ_MASK 		@ is modem status bit set?
-	beq irq					@ no - check for next interrupt
+	beq .Lirq				@ no - check for next interrupt
 
 
 	@@@@@@@@@@@@@@@@@@@@@@@@
@@ -245,13 +245,13 @@ mdm:	@Is it a modem interrupt?
 	@@@@@@@@@@@@@@@@@@@@@@@@
 
 
-irq:	@ Place deferred_fiq interrupt request
+.Lirq:	@ Place deferred_fiq interrupt request
 	ldr r12, deferred_fiq_ih_base		@ set pointer to IRQ handler
 	mov r10, #DEFERRED_FIQ_MASK		@ set deferred_fiq bit
 	str r10, [r12, #IRQ_ISR_REG_OFFSET] 	@ place it in the ISR register
 
 	ldr r12, omap1510_gpio_base		@ set pointer back to GPIO bank
-	b restart				@ check for next GPIO interrupt
+	b .Lrestart				@ check for next GPIO interrupt
 	@@@@@@@@@@@@@@@@@@@@@@@@@@@
 
 
-- 
2.39.5


