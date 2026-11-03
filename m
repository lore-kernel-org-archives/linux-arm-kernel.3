Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55D5606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 21:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=V9qczU9G;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bQ8Q9hrR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kZJOzDauoYNsrCoO2C6W6zBNYUEYiaq0/P1CBtElekI=; b=V9qczU9GgLW5L+
	fk3/OFgPk62EadBtd299D7ik8ZRsqQdcSIow9Ym1s559sHU7SufEH3woHdiOimAnlLbrTx4Ksgr9W
	e8gTtl61Rc/bpoEGjsmA+2F2nLzbZIRhmVJoTluJf6TTOJAkA5BIXksTMe1lhl5Mrd/vspLIjsTNn
	DBmOLOmieWYOAvjwu229X27LxdsXyoD+rPqdljMXk5FHYN0NK+wVsI0KimSUXIujlx4tXYohv2g2b
	8bs9GEXGqJgtA7HdsHwVdzYFSCbSHoatnn2D7LegqMW5afgZ61SM9wOsKvnIfXJ5QULGV9b4Ge93Z
	MAmqLXiIfMGpK8YDjFGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOM5E-00000003hNW-2Byh;
	Tue, 03 Nov 2026 21:30:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOM5D-00000003hMu-27ju
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 21:30:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 93C496022B;
	Tue,  3 Nov 2026 21:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77FC81F0093A;
	Tue,  3 Nov 2026 21:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793741418;
	bh=kZJOzDauoYNsrCoO2C6W6zBNYUEYiaq0/P1CBtElekI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bQ8Q9hrRaX2ZAyUrBkbdXkItU0fTwhigtPiEd0fl3vtgaLJIHDV1VWPDO2EDF5dc+
	 qraDrCHe0JNj7ciU/cFBPoD5DecNQNvAFypvugugEcN51bbsbZLW7U71aFoilT4B6O
	 KjZNjeLByf/Ag3dgbyQqv55nPkRPfaf1wXew/qa6lR+7qAKbbr/QJl0g+wNDdvRa9S
	 PvsgJ9bjTc99hnkvc8BNwxdpBaNvihY35sUAR8dcVvixUT00hoRnKZseExGjVAPcG0
	 LgyWTuhyzFCKyLLedu33lEJNjV5H5poU5Dg31qfVd35cwC3Pq3ZiYnETuHRXBWTdjV
	 X/tYsE8cO+U5w==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 01/10] pinctrl: sunxi: Fix out-of-bounds irq_bank index when first bank has no IRQs
Date: Tue,  3 Nov 2026 21:29:06 +0000
Message-ID: <20261103213002.1673560-2-lee@kernel.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261103213002.1673560-1-lee@kernel.org>
References: <20261103213002.1673560-1-lee@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In prepare_function_table(), irq_bank and last_bank are initialised to 0
and last_bank is updated on every bank regardless of whether it supports
interrupts.  On SoCs where bank 0 (PA) has no pins or does not support
interrupts (such as Allwinner A523 and A733), the first IRQ-capable bank
has bank > 0, which causes irq_bank to be incremented to 1 instead of
starting at 0.  As a result, the final IRQ bank receives irq_bank equal
to desc->irq_banks and writes out-of-bounds past pctl->irq_array during
sunxi_pinctrl_build_state().

Initialise irq_bank and last_bank to -1 and only update last_bank when
processing an IRQ-capable bank so that irq_bank always starts at 0 and
increments sequentially across IRQ-capable banks.

Fixes: f5e2cd34b12f ("pinctrl: sunxi: allow reading mux values from DT")
Closes: https://sashiko.dev/#/bug/linux-9c4dd832-02d4-4096-9e91-a03c1d4d85b3
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
index 8bcd566593ae..79ca1a7c4837 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
@@ -208,8 +208,8 @@ static int prepare_function_table(struct device *dev, struct device_node *pnode,
 	 * Assign the function's memory and fill in GPIOs, IRQ and a sentinel.
 	 * The extra functions will be filled in later.
 	 */
-	irq_bank = 0;
-	last_bank = 0;
+	irq_bank = -1;
+	last_bank = -1;
 	for (i = 0; i < npins; i++) {
 		struct sunxi_desc_pin *pin = &pins[i];
 		int bank = (pin->pin.number - pin_base) / PINS_PER_BANK;
@@ -222,17 +222,16 @@ static int prepare_function_table(struct device *dev, struct device_node *pnode,
 		func[1].muxval = 1;
 
 		if (irq_mux) {
-			if (bank > last_bank)
+			if (bank > last_bank) {
 				irq_bank++;
+				last_bank = bank;
+			}
 			func[lastfunc].muxval = irq_mux;
 			func[lastfunc].irqbank = irq_bank;
 			func[lastfunc].irqnum = pin->pin.number % PINS_PER_BANK;
 			func[lastfunc].name = "irq";
 		}
 
-		if (bank > last_bank)
-			last_bank = bank;
-
 		pin->functions = func;
 
 		/* Skip over the other needed functions and the sentinel. */
-- 
2.56.0.385.gac671c819a-goog


