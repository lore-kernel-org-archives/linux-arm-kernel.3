Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C700AC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 14:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Aa6PymtR7NUVrtMVXuQE/HZse2v/CyudqgsMsKAlIyQ=; b=EyEV65sRBNWx82eVg58qYqvHSm
	G2SDQ7tSozhrMMCVhOcaVevZybaRg62+ui6k+hOIC6Jj9lS9PWj8M/Qm8nm0p5dEDWYnYyJ9y5cFK
	XU7OCdAySZQDnyW7hhM2Y31vJigmSNBSiQ4IIbDteJB4YqRSoSKTdWOs/p3ay4X7XLsThhl86ZMIz
	+AgY1sYLrddBBfLhx541yB1FaMChGLXmN6TGwfOO8A36G/9WWeQsxI5/HB0K3pkRKiQPrr4LjNkGG
	kQ/k6WeyNyxlPYHspf8+DwjozJOE7o82N94UgejTYnirzZBaWynrFZuUaKsYI2TDY63c13/RPwLaj
	/8qQwMkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1treOB-00000002yZZ-3mCv;
	Mon, 10 Mar 2025 14:45:55 +0000
Received: from baptiste.telenet-ops.be ([2a02:1800:120:4::f00:13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trcvu-00000002kL5-3vve
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 13:12:41 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:777d:24a3:a680:631e])
	by baptiste.telenet-ops.be with cmsmtp
	id P1CP2E0064XipzN011CPiH; Mon, 10 Mar 2025 14:12:25 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1trcvI-0000000DSFS-1IAc;
	Mon, 10 Mar 2025 14:12:23 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1trcve-0000000HCUx-3PbE;
	Mon, 10 Mar 2025 14:12:22 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Nicolas Pitre <nico@fluxnic.net>,
	Simon Horman <horms+renesas@verge.net.au>,
	Kees Cook <kees@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: shmobile: smp: Enforce shmobile_smp_* alignment
Date: Mon, 10 Mar 2025 14:12:20 +0100
Message-ID: <c499234d559a0d95ad9472883e46077311051cd8.1741612208.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_061239_110110_06399BE7 
X-CRM114-Status: UNSURE (   9.42  )
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

When the addresses of the shmobile_smp_mpidr, shmobile_smp_fn, and
shmobile_smp_arg variables are not multiples of 4 bytes, secondary CPU
bring-up fails:

    smp: Bringing up secondary CPUs ...
    CPU1: failed to come online
    CPU2: failed to come online
    CPU3: failed to come online
    smp: Brought up 1 node, 1 CPU

Fix this by adding the missing alignment directive.

Fixes: 4e960f52fce16a3b ("ARM: shmobile: Move shmobile_smp_{mpidr, fn, arg}[] from .text to .bss")
Closes: https://lore.kernel.org/r/CAMuHMdU=QR-JLgEHKWpsr6SbaZRc-Hz9r91JfpP8c3n2G-OjqA@mail.gmail.com
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-fixes-for-v6.14.
---
 arch/arm/mach-shmobile/headsmp.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-shmobile/headsmp.S b/arch/arm/mach-shmobile/headsmp.S
index a956b489b6ea12ca..2bc7e73a8582d2b3 100644
--- a/arch/arm/mach-shmobile/headsmp.S
+++ b/arch/arm/mach-shmobile/headsmp.S
@@ -136,6 +136,7 @@ ENDPROC(shmobile_smp_sleep)
 	.long	shmobile_smp_arg - 1b
 
 	.bss
+	.align	2
 	.globl	shmobile_smp_mpidr
 shmobile_smp_mpidr:
 	.space	NR_CPUS * 4
-- 
2.43.0


