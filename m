Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 339D3C982DC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 11:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fbHqLNxNeVJemtklkCwwjRo363CHUi3B8GMFRKzQ3jI=; b=wxCZtgKVrouLiUZdwmikmZhIb+
	oNpH7d7knNARJW/g9Q/SosMMY5/Ge+MmM3JW6ARzxS0QiT3dE+/Wf3eFR/rVa7A32IeL066JwNEDA
	SRskEpaJhMVVLe6M20pNyaR9LOZGyX9QnDl4CfIG5IpLAXc0B+Szx2W9/US+gIrYbOGz89Vk5gff6
	F8CGJdzY/TaeXkZgJOQvppDs6ZU4OsAq/dQf0Q3tUrKun0UBmdbXM9wjEc3OmYVhSQj6Kg8k7JltF
	TdXFOaQ2yq1mVbAN6K60qmyOaIBwZa2d1Cka4v5Oy6WbjhMpdZECowHtimEQWKQcgteXxa9bGnzvx
	yxCg0EHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Wrp-0000000EEuL-2bmO;
	Fri, 18 Sep 2026 11:34:57 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Wrg-0000000EEpn-2am4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 11:34:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1789731288; x=1821267288;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=I+RMCp6el7em+a5tIhA0J/RX8bcnUi2aMV6+mV4DCp8=;
  b=o+VErBJV3VOrWAEWF44pH/g3TfukGEhoQSrjwRtaUVNIuMR1tDz9jPIg
   aFx5YWa9ddvD2UBAjSYv3qPn8TM2ezA2ONvKZkvN1bOLoJmlMWSWt69DS
   Mhw7z060VIXkiJT4B5tRTHkgoxDeZpGMesvvsFMn77VUbMGpM/4t8lvTd
   QoA+7tqJ8FT+m6AMAksXL8w3bBHvWcn0xjXHxqOCJnbQbV5IESPr9HNv9
   vLlFf+aWMBiHaTKO4gtPwJr7SLVPj42VYHbjrX2xxN1k9ZVRTNTAZFD6h
   g7gxoeQulPlc7gUQgIr8ob0f4he7y0qFl6KaCv0X/3LDLpN25M0x4OpEe
   Q==;
X-CSE-ConnectionGUID: FzjkXaHlTH+SGLvAfS4nvA==
X-CSE-MsgGUID: vF2FsFq8SrGdhFAN5i7Xeg==
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="62878001"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Sep 2026 04:34:47 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 18 Sep 2026 04:34:47 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 18 Sep 2026 04:34:43 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Fri, 18 Sep 2026 13:34:01 +0200
Subject: [PATCH net-next v7 09/14] net: lan966x: add shutdown callback to
 stop the FDMA on reboot
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260918-lan966x-pci-fdma-v7-9-0ecc179c8a2c@microchip.com>
References: <20260918-lan966x-pci-fdma-v7-0-0ecc179c8a2c@microchip.com>
In-Reply-To: <20260918-lan966x-pci-fdma-v7-0-0ecc179c8a2c@microchip.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Horatiu Vultur
	<horatiu.vultur@microchip.com>, Steen Hegelund
	<steen.hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>, "Alexei
 Starovoitov" <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
	"Jesper Dangaard Brouer" <hawk@kernel.org>, John Fastabend
	<john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, Herve
 Codina <herve.codina@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Mohsin Bashir
	<mohsin.bashr@gmail.com>
CC: Richard Cochran <richardcochran@gmail.com>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_043448_818774_3DE0EF89 
X-CRM114-Status: GOOD (  22.77  )
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

As a PCIe endpoint, lan966x is not reset by a host reboot: its FDMA
channels and interrupt sources stay armed, and the OIC ORs every
source into the shared PCIe INTx, asserted before the driver has
re-probed. A still-active channel also keeps write access to host
memory the next kernel will reuse.

Add a shutdown callback that:
- frees the ana, xtr and FDMA irqs, masking and unmapping them at
  the OIC (disable_irq() would leave both set - the OIC has no
  irq_disable())
- masks the analyzer source, armed unconditionally by lan966x_init()
  and re-armed by the MAC table's age timer
- stops and detaches the netdevs, draining in-flight xmit and
  clearing netif_device_present() so ndo_open/ndo_change_mtu cannot
  re-enter the FDMA against a disabled NAPI
- disables both FDMA channels and masks their interrupts
- unmaps the outbound ATU windows, leaving none armed

NAPI is skipped when fdma_ndev is unset (a probed switch with no
usable port never adds one), and XDP attach cannot re-enter either,
since lan966x_xdp_setup() returns early on PCIe before touching the
FDMA.

Only the PCIe instantiation needs this - the SoC one resets with the
chip - so the callback returns early on a platform device; the check
is at runtime since .shutdown belongs to the driver, and a
PCIe-enabled kernel binds both.

FDMA_INTR_ENA persists across a warm reboot, so also restore the
full enable in lan966x_fdma_rx_start(), run after both rings are
allocated, re-arming both backends from one site.

Tested-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 .../net/ethernet/microchip/lan966x/lan966x_fdma.c  |  4 ++
 .../net/ethernet/microchip/lan966x/lan966x_main.c  | 56 ++++++++++++++++++++++
 .../net/ethernet/microchip/lan966x/lan966x_regs.h  | 15 ++++++
 3 files changed, 75 insertions(+)

diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
index 2695bc41e52a..6fb2482eeb17 100644
--- a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
+++ b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
@@ -146,6 +146,10 @@ void lan966x_fdma_rx_start(struct lan966x_rx *rx)
 	struct fdma *fdma = &rx->fdma;
 	u32 mask;
 
+	lan_wr(FDMA_INTR_ENA_INTR_PORT_ENA_SET(GENMASK(1, 0)) |
+	       FDMA_INTR_ENA_INTR_CH_ENA_SET(GENMASK(7, 0)),
+	       lan966x, FDMA_INTR_ENA);
+
 	lan_wr(FDMA_CH_CFG_CH_DCB_DB_CNT_SET(fdma->n_dbs) |
 	       FDMA_CH_CFG_CH_INTR_DB_EOF_ONLY_SET(1) |
 	       FDMA_CH_CFG_CH_INJ_PORT_SET(0) |
diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
index 11094a381ec2..2c1e2bc12024 100644
--- a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
+++ b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
@@ -1324,9 +1324,65 @@ static void lan966x_remove(struct platform_device *pdev)
 	debugfs_remove_recursive(lan966x->debugfs_root);
 }
 
+static void lan966x_shutdown(struct platform_device *pdev)
+{
+	struct lan966x *lan966x = platform_get_drvdata(pdev);
+
+	/* As a PCIe endpoint the switch is not reset by the host reboot, so it
+	 * has to be quiesced here:
+	 *
+	 *   Free the irqs and mask the sources: no source can assert INTx.
+	 *   Disable NAPI: the teardown must not race a poll.
+	 *   Stop and detach the netdevs: drains xmit, closes ndo_open and MTU.
+	 *   Stop the FDMA channels: waits for the engine to go idle.
+	 *   Unmap the ATU windows: revokes the engine's access to host memory.
+	 */
+	if (!lan966x_is_pci(lan966x))
+		return;
+
+	if (lan966x->xtr_irq > 0)
+		devm_free_irq(lan966x->dev, lan966x->xtr_irq, lan966x);
+	if (lan966x->ana_irq > 0)
+		devm_free_irq(lan966x->dev, lan966x->ana_irq, lan966x);
+	if (lan966x->fdma_irq > 0)
+		devm_free_irq(lan966x->dev, lan966x->fdma_irq, lan966x);
+
+	lan_wr(0, lan966x, ANA_ANAINTR);
+
+	if (!lan966x->fdma)
+		return;
+
+	rtnl_lock();
+
+	if (lan966x->fdma_ndev)
+		napi_disable(&lan966x->napi);
+
+	for (int p = 0; p < lan966x->num_phys_ports; p++) {
+		if (!lan966x->ports[p] || !lan966x->ports[p]->dev)
+			continue;
+
+		netif_tx_disable(lan966x->ports[p]->dev);
+		netif_device_detach(lan966x->ports[p]->dev);
+	}
+
+	lan966x_fdma_rx_disable(&lan966x->rx);
+	lan966x_fdma_tx_disable(&lan966x->tx);
+
+	lan_wr(0, lan966x, FDMA_INTR_ENA);
+	lan_wr(0, lan966x, FDMA_INTR_DB_ENA);
+
+#if IS_ENABLED(CONFIG_MCHP_LAN966X_PCI)
+	fdma_pci_atu_region_unmap(lan966x->rx.fdma.atu_region);
+	fdma_pci_atu_region_unmap(lan966x->tx.fdma.atu_region);
+#endif
+
+	rtnl_unlock();
+}
+
 static struct platform_driver lan966x_driver = {
 	.probe = lan966x_probe,
 	.remove = lan966x_remove,
+	.shutdown = lan966x_shutdown,
 	.driver = {
 		.name = "lan966x-switch",
 		.of_match_table = lan966x_match,
diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_regs.h b/drivers/net/ethernet/microchip/lan966x/lan966x_regs.h
index 4b553927d2e0..aba0d36ae6b5 100644
--- a/drivers/net/ethernet/microchip/lan966x/lan966x_regs.h
+++ b/drivers/net/ethernet/microchip/lan966x/lan966x_regs.h
@@ -1039,6 +1039,21 @@ enum lan966x_target {
 /*      FDMA:FDMA:FDMA_INTR_ERR */
 #define FDMA_INTR_ERR             __REG(TARGET_FDMA, 0, 1, 8, 0, 1, 428, 400, 0, 1, 4)
 
+/*      FDMA:FDMA:FDMA_INTR_ENA */
+#define FDMA_INTR_ENA             __REG(TARGET_FDMA, 0, 1, 8, 0, 1, 428, 404, 0, 1, 4)
+
+#define FDMA_INTR_ENA_INTR_PORT_ENA              GENMASK(9, 8)
+#define FDMA_INTR_ENA_INTR_PORT_ENA_SET(x)\
+	FIELD_PREP(FDMA_INTR_ENA_INTR_PORT_ENA, x)
+#define FDMA_INTR_ENA_INTR_PORT_ENA_GET(x)\
+	FIELD_GET(FDMA_INTR_ENA_INTR_PORT_ENA, x)
+
+#define FDMA_INTR_ENA_INTR_CH_ENA                GENMASK(7, 0)
+#define FDMA_INTR_ENA_INTR_CH_ENA_SET(x)\
+	FIELD_PREP(FDMA_INTR_ENA_INTR_CH_ENA, x)
+#define FDMA_INTR_ENA_INTR_CH_ENA_GET(x)\
+	FIELD_GET(FDMA_INTR_ENA_INTR_CH_ENA, x)
+
 /*      FDMA:FDMA:FDMA_ERRORS */
 #define FDMA_ERRORS               __REG(TARGET_FDMA, 0, 1, 8, 0, 1, 428, 412, 0, 1, 4)
 

-- 
2.34.1


