Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D797C3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 23:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q8JgsH6BTHTn/ZygXA9qmPcaePIL3f2iLQAej7jfwXM=; b=jQcs+wE3sxwiqElNkw4cOU3LU6
	J01xrJ76mApsOUWV40qYBQQehSfrt8iaS4HbGYbkwSbrUJ9bn32LZKIX6y7JFUR7OHSX8F2GYdCJt
	i4G7M/5tAEq+cAY8EON9Pn7g4Mmm7IIqoyaWi5vDivphvt+DuX/DVyJKg/E++euZOZPGX361KO0Hx
	0GBQgu/KxDNbkRJgN1w9BAWdg4pCWd8gCmOcPPKaGU6L9RWV3R8pNdDi4IFv9pGpQFwCovh6Msech
	k+2HwwUe/66h9LjLvc/4sQD8LMqBNJT5NheSlG6wofR4WKs4ASq6U7km/Evv8ewqwhgB9+amRqWBc
	O+5yljoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC5Go-000000094O3-14bX;
	Mon, 05 May 2025 23:30:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4G0-00000008kno-0UdF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 22:25:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 66FDC5C5A2D;
	Mon,  5 May 2025 22:23:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F311EC4CEED;
	Mon,  5 May 2025 22:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746483951;
	bh=hcwdfhhGaHajzSEOCx6SVqIs1/onTusH1hNuhmcLL/8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MhtKieVYM6HVaVWeVklfntalNoWO64H2nl+Ke7a+ZBgWOCpTyMD526Xr8E5UsjHNz
	 apAlGSQ+EzsRoiCznsrn9KS72Nv66gkK2ULgjEk6kGZbOERMzsVjB8LLLFFdZRDvvV
	 3B6jSogcnbBYEzcYG+yYBUJMa8BrHLhve1fzuD4C6dPFczmHVrWGD8OJ+2PKpPwlTW
	 HlF4mgw1SqSDUwBYlKhpJbes5lOQkNAccgfdteQLEofXrj3hecfCHhKshDAFLkml8t
	 E0hwM6z+aSbpiqu5VnAC/x85P9c0imW3KHUoHlFITzBRK/zfmLrThdHa8LSZWDK8tG
	 +zAOiyV/ycMZg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Li Bin <bin.li@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Ryan Wanner <Ryan.Wanner@microchip.com>,
	Durai Manickam KR <durai.manickamkr@microchip.com>,
	Andrei Simion <andrei.simion@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Sasha Levin <sashal@kernel.org>,
	linux@armlinux.org.uk,
	alexandre.belloni@bootlin.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.14 286/642] ARM: at91: pm: fix at91_suspend_finish for ZQ calibration
Date: Mon,  5 May 2025 18:08:22 -0400
Message-Id: <20250505221419.2672473-286-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_152552_247553_A70F808C 
X-CRM114-Status: GOOD (  15.14  )
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

[ Upstream commit bc4722c3598d0e2c2dbf9609a3d3198993093e2b ]

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
Link: https://lore.kernel.org/r/28b33f9bcd0ca60ceba032969fe054d38f2b9577.1740671156.git.Ryan.Wanner@microchip.com
Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/mach-at91/pm.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/arch/arm/mach-at91/pm.c b/arch/arm/mach-at91/pm.c
index 05a1547642b60..6c3e6aa22606f 100644
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
2.39.5


