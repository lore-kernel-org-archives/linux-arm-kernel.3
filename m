Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88272C4451B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 14:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=epmNXjS7d94Ny0G3QrInR/+5Mb0BLlrxlvJkC02EnzE=; b=2S445f5zuJmA1q8j0w/lLifLQN
	7KvOOQawMp+dNMzwhtf3msJpoMvOzkAIm27E1WyFNibpp5YtHvYOv1nDdXnqQ7L/ItVOwhPrtPQMI
	wKmq730UpwYOdPkrvE+FGyg+NOHiqGmXR3Lto208zpB7VvExXAGP5OgV/MjB9TM/vstLNo0T4/08G
	aaulYi69+0rNu7/C+F5MHfTSqN/IUseviqLiQp3Asf4I/KRKHktDYyhAK/AG/3MgrXlIeMam4m20r
	NGp1ChunC1w+QLoNjDOKnqDxcMcGXDHCGp1QC1ol4MCGb/xgFb/gAzaHK4EwN4f20o2psj3fwbjnO
	6P+r99Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkjNV-00000002T4Z-2ILS;
	Fri, 17 Jul 2026 14:17:25 +0000
Received: from sender4-op-o11.zoho.com ([136.143.188.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkjNS-00000002T3n-0ZYO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 14:17:23 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1784297826; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CDkMTTxuUuk7SF1KddlgIXqNWa+X+ryUZ6W7ZBjtxo2+tVrR8KCgP9NZPYzos+A7cA7MVkWBHliKgNl1v2IL3m+8NWaAH1CJ0Nm1fSJMP3fMugyZ1HtCUyGuB161uveZoGaRcrkaziS2TMdHTJi4/Cqi8fBjvEDmZ5emCh2GTy8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784297826; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=epmNXjS7d94Ny0G3QrInR/+5Mb0BLlrxlvJkC02EnzE=; 
	b=lxVfX2xUkWcVskpBJpSlIB/adeVtQFT4Q/gi1No48Zvh2n4F2/PtLd905EcLQV0qeSQPzM9Kb1nHAOGn5qKOeGJu4E/VrK2VAI40GaUcieNPecHI9CO8Cqsh77Ga1wMnsUNNhi6y3p+R1dfrF30U6Dbm3Sj861nCoGV5Sq0/X9c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=yoavmoshe.com;
	spf=pass  smtp.mailfrom=linux@yoavmoshe.com;
	dmarc=pass header.from=<linux@yoavmoshe.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784297826;
	s=zoho; d=yoavmoshe.com; i=linux@yoavmoshe.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=epmNXjS7d94Ny0G3QrInR/+5Mb0BLlrxlvJkC02EnzE=;
	b=IovFTTOdduyuOxDCRlNJ6SZVMU99gB64Zo1SoVFAAIsF7eiDSryxPaP9nNl/sjpl
	SUsYKCICECArOdFUQdKF3wUYlI2WO2xKACFSd2KkW+Ysf6eiWwVSQRmTHKN+KEUbhBg
	k9RjqdlDBdQKK7p0oVVV8V40jCbL0UOaFp3cP0JI=
Received: by mx.zohomail.com with SMTPS id 1784297824078494.6809075628678;
	Fri, 17 Jul 2026 07:17:04 -0700 (PDT)
From: Yo'av Moshe <linux@yoavmoshe.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	llvm@lists.linux.dev,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yo'av Moshe <linux@yoavmoshe.com>
Subject: [PATCH] ARM: imx: Fix suspend/resume crash with Clang CFI
Date: Fri, 17 Jul 2026 16:16:48 +0200
Message-ID: <20260717141648.1007059-1-linux@yoavmoshe.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_071722_236650_8582BABD 
X-CRM114-Status: UNSURE (   9.64  )
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

Relocated suspend code in OCRAM lacks compiler-generated CFI type
signatures. When CONFIG_CFI=y is active, the indirect call to
imx6_suspend_in_ocram_fn triggers a strict CFI violation panic.

Annotate imx6q_suspend_finish with __nocfi to bypass CFI checking
for this specific indirect call.

Cc: stable@vger.kernel.org
Signed-off-by: Yo'av Moshe <linux@yoavmoshe.com>
---
Tested on a Kobo Clara HD (i.MX6SLL SoC) running postmarketOS edge. 
Before this patch, suspending the device caused an immediate silent 
hang requiring a hard-reboot. With this patch applied, suspend and 
resume work successfully.

 arch/arm/mach-imx/pm-imx6.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-imx/pm-imx6.c b/arch/arm/mach-imx/pm-imx6.c
index a671ca498..d9b0c1803 100644
--- a/arch/arm/mach-imx/pm-imx6.c
+++ b/arch/arm/mach-imx/pm-imx6.c
@@ -360,7 +360,7 @@ int imx6_set_lpm(enum mxc_cpu_pwr_mode mode)
 	return 0;
 }
 
-static int imx6q_suspend_finish(unsigned long val)
+static int __nocfi imx6q_suspend_finish(unsigned long val)
 {
 	if (!imx6_suspend_in_ocram_fn) {
 		cpu_do_idle();
-- 
2.55.0


