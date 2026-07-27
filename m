Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D4FBC53219
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 12:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KMmXB3Hz2HVQkjI02T1LhdZYeO7c9DM5ga0yqzGQqk8=; b=nZpWPhY/YCmVPKuCfPyMCC2bt6
	uFdGIk4MxzNgKWHdUD5NO+j+77aF91ZE9xsc4KiDx+rCEujlCZw3Ey4XfCw+8OXdOMWHynIx71cVO
	vZX2xnp/0qPhgrfih2mTL/vO2wpiEHvhFlcOv5MncrlR8lPQZLgOd3sRcFPFM75NZe9uVfEPFgFgH
	WjJ7VPwskqjE5G2ixsCq0TWqmAOgeuTvD5pThkq22YsEc/srVmydDYJvOj5MpdbZc/jW3ZMrLobs0
	reqdmDNOm+ednXv4a1KgMkb+smhcD5a320FQ1hKQ88MzsLJuJOpdoDCFTllX9CBwN/Mbkk1Z/Ssqc
	J81ZLDVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKRa-00000002gfB-1JqO;
	Mon, 27 Jul 2026 12:28:30 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKRS-00000002gaF-28QW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 12:28:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1785155302; x=1816691302;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Av6eeg2ekqj+HOs2zrQPFQA1RnGOcXg/+B9uTPlD7J8=;
  b=ufm+zAK5Je6u0C2BJQVbZwDwhlADW2PeJ6NpjY0NAJMFC//0ufs620vA
   O4vC5eJbaAulN70bmYNeEOasHlKy3cmlqLSwKSyF/GwfQNQcWHJDI7+S3
   4+6VTriw6AUZ7YOLUx3H2YuIu5Y0g/brw5AiBwc5PKrATCu4ivPEk2dic
   pJWJYrllafBNIpugvz6Vobu8P2I+k37KYBlK6ACAQA2BJh2fw3swvA2bE
   jbM+S8Np2v3oN/kUcqScflXEr9BjP0ypjMOsC4krkVmq7/o8okHUC40GW
   zhmi0q03kFmhKdPFKSz1fhUQdcJFkx2Daz3gLYJesOTVGDKiwkmV0w/V2
   A==;
X-CSE-ConnectionGUID: u1lwqlS2TZaRZCDD2h+pYg==
X-CSE-MsgGUID: 0erGazzNR/a50LU+sSnktA==
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="60344933"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 05:28:19 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.43; Mon, 27 Jul 2026 05:28:16 -0700
Received: from che-ll-i67070.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 27 Jul 2026 05:28:07 -0700
From: Varshini Rajendran <varshini.rajendran@microchip.com>
To: <ehristev@kernel.org>, <jic23@kernel.org>, <dlechner@baylibre.com>,
	<nuno.sa@analog.com>, <andy@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<srini@kernel.org>, <marcelo.schmitt@analog.com>, <radu.sabau@analog.com>,
	<Jonathan.Santos@analog.com>, <jorge.marques@analog.com>,
	<joshua.crofts1@gmail.com>, <jishnu.prakash@oss.qualcomm.com>,
	<antoniu.miclaus@analog.com>, <varshini.rajendran@microchip.com>,
	<mazziesaccount@gmail.com>, <linux-iio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v4 09/16] nvmem: microchip-otpc: nvmem: add emulation mode and OTP access validation
Date: Mon, 27 Jul 2026 17:56:26 +0530
Message-ID: <20260727122633.117435-10-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260727122633.117435-1-varshini.rajendran@microchip.com>
References: <20260727122633.117435-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_052822_619293_11569988 
X-CRM114-Status: GOOD (  13.46  )
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

Add validation of OTP memory accessibility and emulation mode status
during probe.

When the boot packet is not configured, emulation mode allows access to
the other packets. When both are not available an informational message
is logged to help with debugging.

Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
---
 drivers/nvmem/microchip-otpc.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/microchip-otpc.c b/drivers/nvmem/microchip-otpc.c
index a17f82afdc37..6b0184423463 100644
--- a/drivers/nvmem/microchip-otpc.c
+++ b/drivers/nvmem/microchip-otpc.c
@@ -18,6 +18,7 @@
 #define MCHP_OTPC_CR_READ		BIT(6)
 #define MCHP_OTPC_MR			(0x4)
 #define MCHP_OTPC_MR_ADDR		GENMASK(31, 16)
+#define MCHP_OTPC_MR_EMUL		BIT(7)
 #define MCHP_OTPC_AR			(0x8)
 #define MCHP_OTPC_SR			(0xc)
 #define MCHP_OTPC_SR_READ		BIT(6)
@@ -343,7 +344,8 @@ static int mchp_otpc_probe(struct platform_device *pdev)
 {
 	struct nvmem_device *nvmem;
 	struct mchp_otpc *otpc;
-	u32 size;
+	bool emul_enable;
+	u32 size, mr_val;
 	int ret;
 
 	otpc = devm_kzalloc(&pdev->dev, sizeof(*otpc), GFP_KERNEL);
@@ -355,10 +357,22 @@ static int mchp_otpc_probe(struct platform_device *pdev)
 		return PTR_ERR(otpc->base);
 
 	otpc->dev = &pdev->dev;
+
+	mr_val = readl_relaxed(otpc->base + MCHP_OTPC_MR);
+	emul_enable = mr_val & MCHP_OTPC_MR_EMUL;
+	if (emul_enable)
+		dev_info(otpc->dev, "Emulation mode enabled\n");
+
 	ret = mchp_otpc_init_packets_list(otpc, &size);
 	if (ret)
 		return ret;
 
+	if (!size) {
+		dev_warn(otpc->dev, "Cannot access OTP memory\n");
+		if (!emul_enable)
+			dev_info(otpc->dev, "Boot packet not programmed and emulation mode disabled\n");
+	}
+
 	mchp_nvmem_config.dev = otpc->dev;
 	mchp_nvmem_config.add_legacy_fixed_of_cells = true;
 	mchp_nvmem_config.size = size;
-- 
2.34.1


