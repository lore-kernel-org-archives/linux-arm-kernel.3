Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA13AC197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zfsAht4E7mXjlsRjegWqYc6K4YI5T3ZqXnNwWtJZn4k=; b=Mb4Qz2TFQHY3iQDBEI+/gs5/8g
	ly3g07fGa0u4gYivQq9YwVwj6/YWjrOzGFduzCEMNERr6j8KLQ8xc1eDuyM7SxGpOgpvDcq8YUEao
	5WAp3HMZFSMlaomcxv1w+Nf3i+OBLgicp6Kn3c8Tbo3TX7lr/d6Ax+z6Zkx8szA8izODmOjA6R1xs
	H9RqvskspS0rwmoDYO8p9kn8ezrFbnvgOTZSWixJWRrU9J8a9/P/NmSU/1UvOTSMIbVivvq1YuJF0
	Nhrwgv6XRlcGbenssYKEwdN/97Np+qfk9We7smzTim0r+eieA3VHBtvdgvwJvyKpDsONJNAPf7+wL
	GaL4NXPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjiP-00000008WBO-3pym;
	Thu, 27 Feb 2025 19:38:37 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tngC4-00000007xuh-3IUz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 15:53:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1740671580; x=1772207580;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cs/3UhGF4fHyP6gFY/pk9+aT8HWZ7VhIPV6i5KbAQ7U=;
  b=jaz9LGVtRfdZhqk5231xGJsBB4M+L2pgrjaDn04aNCKEUuFcbFWZMA4Q
   69G/2tgRksIOkkHOIBN+zhZr84FcD3rY/Ioz2jljrH69USL1Mp//OHuE5
   hjzXI4wXFvkQKrq+dEnxHVVTV40tVTtA07rrZY6QswlKdQV0LDpVxl5hG
   Pptg8yDTaJHJMFbu/5OeATQyoNKPYgU+sY5QdjTD5MnFYFTjPH0h17TgN
   zSj6zegLzHOdiQ9nqOFqGP/8L/ICXzXRwX+bWxcrTP+ETPiYxuyL9Pq0+
   DPgt8rv2IE8hLhzWsb+udLp55DnvFUlSQp/zo8fXd+fWHQPCjDL+b6PGB
   A==;
X-CSE-ConnectionGUID: xBkIAngZQVSwQhIMCQbtUA==
X-CSE-MsgGUID: n0AU5v85Rkye32TACpG/aA==
X-IronPort-AV: E=Sophos;i="6.13,320,1732604400"; 
   d="scan'208";a="38638170"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Feb 2025 08:52:56 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 27 Feb 2025 08:52:45 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 27 Feb 2025 08:52:45 -0700
From: <Ryan.Wanner@microchip.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <claudiu.beznea@tuxon.dev>, <sre@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<p.zabel@pengutronix.de>
CC: <linux@armlinux.org.uk>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-rtc@vger.kernel.org>, Li Bin
	<bin.li@microchip.com>, Ryan Wanner <Ryan.Wanner@microchip.com>, "Durai
 Manickam KR" <durai.manickamkr@microchip.com>, Andrei Simion
	<andrei.simion@microchip.com>
Subject: [PATCH v3 09/21] ARM: at91: pm: fix at91_suspend_finish for ZQ calibration
Date: Thu, 27 Feb 2025 08:51:56 -0700
Message-ID: <28b33f9bcd0ca60ceba032969fe054d38f2b9577.1740671156.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740671156.git.Ryan.Wanner@microchip.com>
References: <cover.1740671156.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_075300_893181_39BBF629 
X-CRM114-Status: GOOD (  15.03  )
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

From: Li Bin <bin.li@microchip.com>

For sama7g5 and sama7d65 backup mode, we encountered a "ZQ calibrate error"
during recalibrating the impedance in BootStrap.
We found that the impedance value saved in at91_suspend_finish() before
the DDR entered self-refresh mode did not match the resistor values. The
ZDATA field in the DDR3PHY_ZQ0CR0 register uses a modified gray code to
select the different impedance setting.
But these gray code are incorrect, a workaournd from design team fixed the
bug in the calibration logic. The ZDATA contains four independent impedance
elements, but the algorithm combined the four elements into one. The elements
were fixed using properly shifted offsets.

Signed-off-by: Li Bin <bin.li@microchip.com>
[nicolas.ferre@microchip.com: fix indentation and combine 2 patches]
Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
Tested-by: Ryan Wanner <Ryan.Wanner@microchip.com>
Tested-by: Durai Manickam KR <durai.manickamkr@microchip.com>
Tested-by: Andrei Simion <andrei.simion@microchip.com>
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 arch/arm/mach-at91/pm.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/arch/arm/mach-at91/pm.c b/arch/arm/mach-at91/pm.c
index 05a1547642b6..6c3e6aa22606 100644
--- a/arch/arm/mach-at91/pm.c
+++ b/arch/arm/mach-at91/pm.c
@@ -545,11 +545,12 @@ extern u32 at91_pm_suspend_in_sram_sz;
 
 static int at91_suspend_finish(unsigned long val)
 {
-	unsigned char modified_gray_code[] = {
-		0x00, 0x01, 0x02, 0x03, 0x06, 0x07, 0x04, 0x05, 0x0c, 0x0d,
-		0x0e, 0x0f, 0x0a, 0x0b, 0x08, 0x09, 0x18, 0x19, 0x1a, 0x1b,
-		0x1e, 0x1f, 0x1c, 0x1d, 0x14, 0x15, 0x16, 0x17, 0x12, 0x13,
-		0x10, 0x11,
+	/* SYNOPSYS workaround to fix a bug in the calibration logic */
+	unsigned char modified_fix_code[] = {
+		0x00, 0x01, 0x01, 0x06, 0x07, 0x0c, 0x06, 0x07, 0x0b, 0x18,
+		0x0a, 0x0b, 0x0c, 0x0d, 0x0d, 0x0a, 0x13, 0x13, 0x12, 0x13,
+		0x14, 0x15, 0x15, 0x12, 0x18, 0x19, 0x19, 0x1e, 0x1f, 0x14,
+		0x1e, 0x1f,
 	};
 	unsigned int tmp, index;
 	int i;
@@ -560,25 +561,25 @@ static int at91_suspend_finish(unsigned long val)
 		 * restore the ZQ0SR0 with the value saved here. But the
 		 * calibration is buggy and restoring some values from ZQ0SR0
 		 * is forbidden and risky thus we need to provide processed
-		 * values for these (modified gray code values).
+		 * values for these.
 		 */
 		tmp = readl(soc_pm.data.ramc_phy + DDR3PHY_ZQ0SR0);
 
 		/* Store pull-down output impedance select. */
 		index = (tmp >> DDR3PHY_ZQ0SR0_PDO_OFF) & 0x1f;
-		soc_pm.bu->ddr_phy_calibration[0] = modified_gray_code[index];
+		soc_pm.bu->ddr_phy_calibration[0] = modified_fix_code[index] << DDR3PHY_ZQ0SR0_PDO_OFF;
 
 		/* Store pull-up output impedance select. */
 		index = (tmp >> DDR3PHY_ZQ0SR0_PUO_OFF) & 0x1f;
-		soc_pm.bu->ddr_phy_calibration[0] |= modified_gray_code[index];
+		soc_pm.bu->ddr_phy_calibration[0] |= modified_fix_code[index] << DDR3PHY_ZQ0SR0_PUO_OFF;
 
 		/* Store pull-down on-die termination impedance select. */
 		index = (tmp >> DDR3PHY_ZQ0SR0_PDODT_OFF) & 0x1f;
-		soc_pm.bu->ddr_phy_calibration[0] |= modified_gray_code[index];
+		soc_pm.bu->ddr_phy_calibration[0] |= modified_fix_code[index] << DDR3PHY_ZQ0SR0_PDODT_OFF;
 
 		/* Store pull-up on-die termination impedance select. */
 		index = (tmp >> DDR3PHY_ZQ0SRO_PUODT_OFF) & 0x1f;
-		soc_pm.bu->ddr_phy_calibration[0] |= modified_gray_code[index];
+		soc_pm.bu->ddr_phy_calibration[0] |= modified_fix_code[index] << DDR3PHY_ZQ0SRO_PUODT_OFF;
 
 		/*
 		 * The 1st 8 words of memory might get corrupted in the process
-- 
2.43.0


