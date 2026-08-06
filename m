Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8684DC561E6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 08:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KMmXB3Hz2HVQkjI02T1LhdZYeO7c9DM5ga0yqzGQqk8=; b=tPKoLQImVnfNwV3OTuUtx75CSo
	6tK2GvKTUHoSzqf/4I4HGuvU6v8J/TI9+sZBZfF9ddq7L0PFqA0Vpx2XDf0Oy8b6x5WecyuyYgw1S
	+vpeQXaJDBMCm4V7raqS8suwR/YKl9GLHRqYUlduD+ga+t/6eoAD61ZH/fDiCZNwx0bRspyEtWBSi
	bfr/Jcc/Pxf7tU9pIvMYHI/73q3bPFHxGiE9ebygfiduB4qqd2dHHFzHpyfIrLbZz3QYXYoJDIMam
	7xmUI8lhzYqlb9nh8cGS/b4chxCETAuFgk+X902W4/wsr0auRwEWa8DnhfPP3F2K9qGEo97qgRuSw
	8F48aNGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrtm7-00000005I6U-0iKs;
	Thu, 06 Aug 2026 08:48:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrtm4-00000005I4q-0zG1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 08:48:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1786006104; x=1817542104;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Av6eeg2ekqj+HOs2zrQPFQA1RnGOcXg/+B9uTPlD7J8=;
  b=yk28ZaYuELxWDDVmzkdYml8yg/pN9rjRtrYyMyb5sj7OWoWXTVmsUFZZ
   8v2BKZcOnf78GpMWp9OnDIE/HddEJiUEjt+M+inkso4K8n+/7h3FugQxe
   1borcNBSIMb94meF8uys8Yr1RMuvaqfUQqQIFSU+VR79y/h5118apQcUI
   HURrKRVCuQDkZFRAjcOgo3TJiv8SqV08axlypIXfZEJ8nDT4T+S4JYTSS
   h0s0mlEDBJGe28lJjF5hDoiwAS1cQ+sDFmD0hEzB9N3hYtb4x6JEbyLe1
   z1RDv2dgtrvQQWabPBNReMycgOtMTTRv2NJ7SM/RVtp8j8lfEM4OmAzql
   g==;
X-CSE-ConnectionGUID: yzc83y/kShyu5EyMOZukiw==
X-CSE-MsgGUID: JFqw/C8BSrGRhFMPXS0v5w==
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="60854115"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 01:48:23 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.45; Thu, 6 Aug 2026 01:48:22 -0700
Received: from che-ll-i67070.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 6 Aug 2026 01:48:14 -0700
From: Varshini Rajendran <varshini.rajendran@microchip.com>
To: <ehristev@kernel.org>, <jic23@kernel.org>, <dlechner@baylibre.com>,
	<nuno.sa@analog.com>, <andy@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<srini@kernel.org>, <marcelo.schmitt@analog.com>, <radu.sabau@analog.com>,
	<joshua.crofts1@gmail.com>, <jorge.marques@analog.com>,
	<Jonathan.Santos@analog.com>, <jishnu.prakash@oss.qualcomm.com>,
	<antoniu.miclaus@analog.com>, <duje@dujemihanovic.xyz>,
	<mazziesaccount@gmail.com>, <varshini.rajendran@microchip.com>,
	<linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 10/17] nvmem: microchip-otpc: nvmem: add emulation mode and OTP access validation
Date: Thu, 6 Aug 2026 13:10:17 +0530
Message-ID: <20260806074024.531259-11-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260806074024.531259-1-varshini.rajendran@microchip.com>
References: <20260806074024.531259-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_014824_328905_FA9BEA71 
X-CRM114-Status: GOOD (  13.11  )
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


