Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E5DECA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 16:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uFziv+Xoqi8s1O750PzRShk/r5lOsnFwo6no1Ndpf4A=; b=ybwKtqq3m13KubcY9Cee/oTWYP
	4I+EOnN5g72c9Z7OOj88gmyNRfcx671qBOIWehKqmhCSHLjgMOi2lfxsm2H0I8oHH/12N1wQGTA6x
	lx1lGX/UKqMD8nyu30ucpXfTJBjYtKZrgzlG5EjwfxPsmIKOX6m6mT9DHuCAg4aFfLxkmUYHkTtNZ
	XBRO3y+VTxeyL17rmkNP4P6C7Zkt76mM+qrN4QkAASagPcqgqTqASj+M7iKYVgR/frb04TuJkvDWF
	G0YBkfc9jjgfe6oXsqSog2N0WDP8GnzDARHuxeh+qjndYXedRq7GV2EtMRS+ltXS+Gb/RaXIIL11f
	N2XhROlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7kI-0000000HUra-05ET;
	Thu, 21 Aug 2025 16:02:34 +0000
Received: from mta-65-226.siemens.flowmailer.net ([185.136.65.226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up3yt-0000000Gq38-0Gsk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 12:01:25 +0000
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20250821120115376a3d937aea324c94
        for <linux-arm-kernel@lists.infradead.org>;
        Thu, 21 Aug 2025 14:01:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=uFziv+Xoqi8s1O750PzRShk/r5lOsnFwo6no1Ndpf4A=;
 b=FANoF1CSNcNhr0AzulgktsCv51sdgu0zyLNmYj8uo+YgW5H+jcFgTEBccktzoVBc0cXQqz
 WZxAe1J/kqCmDXahSLd0oi//0StCM16PlOty2c9HNjqo71J6+dTuX1xgCG/1Aj6pakw2thA/
 RYHKTD3gGvm0zZ0d+dngae0QJm40XFUVUER0jtG41a7XMMuvBLMqwHF6mhG8SaWMpdKggF7/
 soaC1OgPgeedpFJghTnbrTLjH2Xyny5SZAZoVdbmJpwBucU1OejrhxmRA386vL2ywecXGz5+
 /NkOrAmXc/He6Bki0O2CQJj6dtLU7aCGNdD0WrAOBgIKIRO5b8Z2w9ow==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: Boris Brezillon <bbrezillon@kernel.org>,
	linux-mtd@lists.infradead.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Balamanikandan.Gunasundar@microchip.com,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] mtd: nand: raw: atmel: Respect tAR, tCLR in read setup timing
Date: Thu, 21 Aug 2025 14:00:57 +0200
Message-ID: <20250821120106.346869-1-alexander.sverdlin@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_050123_611254_C9653196 
X-CRM114-Status: GOOD (  12.03  )
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

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Having setup time 0 violates tAR, tCLR of some chips, for instance
TOSHIBA TC58NVG2S3ETAI0 cannot be detected successfully (first ID byte
being read duplicated, i.e. 98 98 dc 90 15 76 14 03 instead of
98 dc 90 15 76 ...).

Atmel Application Notes postulated 1 cycle NRD_SETUP without explanation
[1], but it looks more appropriate to just calculate setup time properly.

[1] Link: https://ww1.microchip.com/downloads/aemDocuments/documents/MPU32/ApplicationNotes/ApplicationNotes/doc6255.pdf
Cc: stable@vger.kernel.org
Fixes: f9ce2eddf176 ("mtd: nand: atmel: Add ->setup_data_interface() hooks")
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
v2:
- Cc'ed stable
- reformatted atmel_smc_cs_conf_set_setup() call
- rebased onto mtd/fixes

 drivers/mtd/nand/raw/atmel/nand-controller.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index dedcca87defc7..ad0eff385e123 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -1377,14 +1377,24 @@ static int atmel_smc_nand_prepare_smcconf(struct atmel_nand *nand,
 	if (ret)
 		return ret;
 
+	/*
+	 * Read setup timing depends on the operation done on the NAND:
+	 *
+	 * NRD_SETUP = max(tAR, tCLR)
+	 */
+	timeps = max(conf->timings.sdr.tAR_min, conf->timings.sdr.tCLR_min);
+	ncycles = DIV_ROUND_UP(timeps, mckperiodps);
+	totalcycles += ncycles;
+	ret = atmel_smc_cs_conf_set_setup(smcconf, ATMEL_SMC_NRD_SHIFT, ncycles);
+	if (ret)
+		return ret;
+
 	/*
 	 * The read cycle timing is directly matching tRC, but is also
 	 * dependent on the setup and hold timings we calculated earlier,
 	 * which gives:
 	 *
-	 * NRD_CYCLE = max(tRC, NRD_PULSE + NRD_HOLD)
-	 *
-	 * NRD_SETUP is always 0.
+	 * NRD_CYCLE = max(tRC, NRD_SETUP + NRD_PULSE + NRD_HOLD)
 	 */
 	ncycles = DIV_ROUND_UP(conf->timings.sdr.tRC_min, mckperiodps);
 	ncycles = max(totalcycles, ncycles);
-- 
2.50.1


