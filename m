Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 830C7C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 22:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MWhZ/sQSvs6nNVlGpTMyytO1fKmGOTNdCOI5T/Vvo1k=; b=4qV6HfiVyn1drSZh3QZyYYgqS6
	DMOxC8F6MCCR+y7m+h5Sd+iD34jRixA6yWXKAbfCLnNXx45gIsHqhFnD+zmT+L8QizigUN5op6euw
	jqg9pnU6CYdby4Xt6TdulrDj0XJsaN+Ign8KxkXjZiHFTD8I9PS+tf+IKVjbCMOaIpyWTV+Hjmbpz
	g2qig5LA169VlTba++YQ7KYMQQclChAYiaJKmQVMXfFM8U4kH4NMxG1HP5Q0M7O5kkmIzEytosV+0
	wUd7kvzsQOwZ5zHPzx5PLTuvq55ffR0Tc7O5PJyB7wM3aIo/T4KRMU1EEIXjKOP+PSOC53fqgWVQm
	kXn2Rr7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Llw-00000008fab-1yhG;
	Tue, 22 Apr 2025 22:07:20 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Lk3-00000008fCx-2YZe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 22:05:25 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53MM5D4Q1337965
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 17:05:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745359513;
	bh=MWhZ/sQSvs6nNVlGpTMyytO1fKmGOTNdCOI5T/Vvo1k=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=aMfNUYKqmrdMw5NCL45/O1/KLQwkGXoIDmzlyrdEW6BvobzL3b7P40s+aTxkfM90M
	 fROZ1j/ke77zVOSaIr6qxt18Asg1csm1EUq3Z0LOS6coPifF+E7cCK00XnpYo8tnQU
	 Y7OE67I3UnpMFsXGnNzbZ15Lb/GYKbP/BHrEWVMU=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53MM5D8R016929
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Apr 2025 17:05:13 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 22
 Apr 2025 17:05:12 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 22 Apr 2025 17:05:12 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53MM5Cre012605;
	Tue, 22 Apr 2025 17:05:12 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Ulf Hansson <ulf.hansson@linaro.org>,
        Nishanth
 Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Josua Mayer <josua@solid-run.com>, <linux-mmc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Francesco Dolcini <francesco@dolcini.it>,
        Hiago De Franco
	<hiagofranco@gmail.com>, Moteen Shah <m-shah@ti.com>,
        <stable@vger.kernel.org>
Subject: [PATCH RESEND v3 2/3] mmc: sdhci_am654: Add sdhci_am654_start_signal_voltage_switch
Date: Tue, 22 Apr 2025 17:05:11 -0500
Message-ID: <20250422220512.297396-3-jm@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422220512.297396-1-jm@ti.com>
References: <20250422220512.297396-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_150523_837295_EF31D84D 
X-CRM114-Status: GOOD (  18.52  )
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

The sdhci_start_signal_voltage_switch function sets
V1P8_SIGNAL_ENA by default after switching to 1v8 signaling.
V1P8_SIGNAL_ENA has a timing component where it determines
whether to launch cmd/data on neg edge (half cycle timing)
or pos edge (full cycle timing) of clock. V1P8_SIGNAL_ENA also
has a voltage switch component where if there exists an internal
LDO, for SD this bit is used to switch from 3.3V to 1.8V IO
signal voltage.

The sequence is to switch to 1.8 IO voltage, set V1P8_SIGNAL_ENA,
change bus width, then update HIGH_SPEED_ENA & UHS_MODE_SELECT.
During bus width change is when eMMC failures are seen with
Kingston eMMC and various types SD cards across Sitara K3 SoCs.

So, add a quirk to suppress V1P8_SIGNAL_ENA and do not enable by
default for eMMC since it is anyways optional for this interface
and parse DT property: ti,fails-without-test-cd to apply the quirk
for SD cards.

Signed-off-by: Judith Mendez <jm@ti.com>
Suggested-by: Hiago De Franco <hiago.franco@toradex.com>
Fixes: ac5a41b472b4 ("Revert "mmc: sdhci_am654: Add sdhci_am654_start_signal_voltage_switch"")
Fixes: 941a7abd4666 ("mmc: sdhci_am654: Add sdhci_am654_start_signal_voltage_switch")
Cc: stable@vger.kernel.org
---
 drivers/mmc/host/sdhci_am654.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/mmc/host/sdhci_am654.c b/drivers/mmc/host/sdhci_am654.c
index f75c31815ab0..d4cafc7af97d 100644
--- a/drivers/mmc/host/sdhci_am654.c
+++ b/drivers/mmc/host/sdhci_am654.c
@@ -87,6 +87,7 @@
 #define CLOCK_TOO_SLOW_HZ	50000000
 #define SDHCI_AM654_AUTOSUSPEND_DELAY	-1
 #define RETRY_TUNING_MAX	10
+#define BUS_WIDTH_8		8
 
 /* Command Queue Host Controller Interface Base address */
 #define SDHCI_AM654_CQE_BASE_ADDR 0x200
@@ -155,6 +156,7 @@ struct sdhci_am654_data {
 	u32 tuning_loop;
 
 #define SDHCI_AM654_QUIRK_FORCE_CDTEST BIT(0)
+#define SDHCI_AM654_QUIRK_SUPPRESS_V1P8_ENA BIT(1)
 };
 
 struct window {
@@ -356,6 +358,29 @@ static void sdhci_j721e_4bit_set_clock(struct sdhci_host *host,
 	sdhci_set_clock(host, clock);
 }
 
+static int sdhci_am654_start_signal_voltage_switch(struct mmc_host *mmc, struct mmc_ios *ios)
+{
+	struct sdhci_host *host = mmc_priv(mmc);
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct sdhci_am654_data *sdhci_am654 = sdhci_pltfm_priv(pltfm_host);
+	int ret;
+
+	if ((sdhci_am654->quirks & SDHCI_AM654_QUIRK_SUPPRESS_V1P8_ENA) &&
+	    ios->signal_voltage == MMC_SIGNAL_VOLTAGE_180) {
+		if (!IS_ERR(mmc->supply.vqmmc)) {
+			ret = mmc_regulator_set_vqmmc(mmc, ios);
+			if (ret < 0) {
+				pr_err("%s: Switching to 1.8V signalling voltage failed,\n",
+				       mmc_hostname(mmc));
+				return -EIO;
+			}
+		}
+		return 0;
+	}
+
+	return sdhci_start_signal_voltage_switch(mmc, ios);
+}
+
 static u8 sdhci_am654_write_power_on(struct sdhci_host *host, u8 val, int reg)
 {
 	writeb(val, host->ioaddr + reg);
@@ -802,6 +827,7 @@ static int sdhci_am654_get_of_property(struct platform_device *pdev,
 {
 	struct device *dev = &pdev->dev;
 	int drv_strength;
+	u32 bus_width;
 	int ret;
 
 	if (sdhci_am654->flags & DLL_PRESENT) {
@@ -844,6 +870,11 @@ static int sdhci_am654_get_of_property(struct platform_device *pdev,
 	if (device_property_read_bool(dev, "ti,fails-without-test-cd"))
 		sdhci_am654->quirks |= SDHCI_AM654_QUIRK_FORCE_CDTEST;
 
+	/* Suppress V1P8_SIGNAL_ENA */
+	device_property_read_u32(dev, "bus-width", &bus_width);
+	if (bus_width == BUS_WIDTH_8 || device_property_read_bool(dev, "ti,suppress-v1p8-ena"))
+		sdhci_am654->quirks |= SDHCI_AM654_QUIRK_SUPPRESS_V1P8_ENA;
+
 	sdhci_get_of_property(pdev);
 
 	return 0;
@@ -940,6 +971,7 @@ static int sdhci_am654_probe(struct platform_device *pdev)
 		goto err_pltfm_free;
 	}
 
+	host->mmc_host_ops.start_signal_voltage_switch = sdhci_am654_start_signal_voltage_switch;
 	host->mmc_host_ops.execute_tuning = sdhci_am654_execute_tuning;
 
 	pm_runtime_get_noresume(dev);
-- 
2.49.0


