Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99FF8E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 23:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=53XDtA867xd9JOVC6cDsgqiASKw81mcRiOr1i5b2wTA=; b=MFmDUPzgAW0gXJuKX9b4ozKBM8
	dmMb8cfdN2bXZkQrdssEdFkK829Jrrllvr6kkSQTOLMzrErCZWy/PhsIkIFT0VanDSXulEYJ9O7wK
	15YLO+J/HtiS2GNeBpw8Z1kSTiHBwCPPu8xJNLlLdNX/d5457ykweMNpBUjg7hKWcLvCVrGt7gswW
	nUN5U2CaSKJ2/IZdQ09tL1Wmr8idLOTepbGAVxBwqNES4lHgTGZqa6NGA/oHs8/KROAbsUrJdb5lN
	299s1gQuTuMS02ojS00YymRBkwHTu+tqeY312Y29Ho6qKM1Dc4lvANpXmGdoBwJc9r8mBFCEsAhF4
	kzpdAeIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQx2H-0000000Gck1-1CRX;
	Thu, 26 Dec 2024 23:12:57 +0000
Received: from out-187.mta1.migadu.com ([95.215.58.187])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQx15-0000000GceK-0Pzo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Dec 2024 23:11:44 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1735254694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=53XDtA867xd9JOVC6cDsgqiASKw81mcRiOr1i5b2wTA=;
	b=f7rTtqa+AqYRs0hNAMfoel3FJlEcahbOfQyQz6n6PmhiVKc4LCfr4/GdZbn0AIk/VvzM4B
	Ruoc1zMwWXEAe56gG5BBrmsDwc6HR4NUXcbbNb5MudsASWnAgqIi3TKdSOOGuZz5nn5cYs
	xXIT16LHnv4uRyvBMgT98qaBDYbhyAk=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Russell King <linux@armlinux.org.uk>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: orion/gpio: Use str_hi_lo() and str_lo_hi() helpers
Date: Fri, 27 Dec 2024 00:10:52 +0100
Message-ID: <20241226231052.566363-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_151143_516906_EE16F29F 
X-CRM114-Status: UNSURE (   7.73  )
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

Remove hard-coded strings by using the str_hi_lo() and str_lo_hi()
helper functions.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/arm/plat-orion/gpio.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/plat-orion/gpio.c b/arch/arm/plat-orion/gpio.c
index 595e9cb33c1d..31cc42345b82 100644
--- a/arch/arm/plat-orion/gpio.c
+++ b/arch/arm/plat-orion/gpio.c
@@ -466,14 +466,14 @@ static void orion_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 
 		if (is_out) {
 			seq_printf(s, " out %s %s\n",
-				   out & msk ? "hi" : "lo",
+				   str_hi_lo(out & msk),
 				   blink & msk ? "(blink )" : "");
 			continue;
 		}
 
 		seq_printf(s, " in  %s (act %s) - IRQ",
-			   (data_in ^ in_pol) & msk  ? "hi" : "lo",
-			   in_pol & msk ? "lo" : "hi");
+			   str_hi_lo((data_in ^ in_pol) & msk),
+			   str_lo_hi(in_pol & msk));
 		if (!((edg_msk | lvl_msk) & msk)) {
 			seq_puts(s, " disabled\n");
 			continue;
-- 
2.47.1


