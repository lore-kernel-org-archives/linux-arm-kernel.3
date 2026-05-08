Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 440DFCD342F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 07:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7cZ2P5cyV3rPpurIQy3cwBNF5oX09IcQWDaNqqQpbaA=; b=jvWTNqZnGJM49uP2j4CEA1M/Lo
	ev+LFsszYQyQFu/m1/XD9ZBnH+rbNFLX3BodXPaB9ZTMmBFb1yeHTjVtlfRxmrVBoh9hefF0EcRUH
	0fzmlO8zOa+34tY4NWI9aPOk/B3fkTMPDpVzFFcHqTacphNQzrDg4lls7ZBe2WVrX4/qfoc8vy+vp
	2JLxEXLxwyQjSOV2s+6jaRJVGZAfvZqnhLK8LBbNUgYmi77kqiYpiuQ8xnS4VTtKcBVCOkbM8azgT
	UIlRY+2MT4+e9VD9vt3S59gzOWpJMVfYtorGEbIL9QZTTgRSPCftRvn+uI6uzd2rIhMYxbYXdco74
	Zmwg2FTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLFlP-00000005rOl-1WxY;
	Fri, 08 May 2026 07:36:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLFlF-00000005rJ8-2H0f
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 08 May 2026 07:36:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=7cZ2P5cyV3rPpurIQy3cwBNF5oX09IcQWDaNqqQpbaA=; b=hEnzX7jutOUdojhIMfTH92ypwX
	RxVNJWH7hy5RGW8S6l1iSz8ddFN0c/FUKwzXizD56wTeeHTgGwQUBKvUTi6GwziOO9qZrnuqRg5Wm
	GHqMyHwhNrLYtKCluZS51EV8t6vy4ou4cwXpdPwofOlahqP4v8XubFsDMYLK9G0Ns7ieYYZoE9MRA
	icKACalVAP8SMHs2tebRz2vhu33TAnbs9fjFZMIWhc9PZNN8ORqUwxkBMrEvzXB5kphSHRNkTXx5n
	DiRSFrbZK+XVGEVKelB8hmiQfoRq1YPWyIetaXo9lMRnT72oy+7SCQOR/ED9YxXgl0z+gN2lR5u7y
	3pUeBPqA==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLFkw-00000005bB3-0aOk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 07:36:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778225778; x=1809761778;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=4m9UwlMVsJgfdfVuYRQ5q8r0FAqsC574/KEoStxXQnU=;
  b=FeGxgN/+Wnio9b0JXMF0jv1CCpSo6lNUFQxGdjgh4YJqtwn0eg/CBw4N
   Yq0vpuq+yBU8dR5D2RqxVGIoPKVuF/Gt5+ldkfje1gaWZGKk5c3Lp2tbj
   1LyNVNLytxsEpCHervjU7f6FiwwetSra8kYl27VwkwWZKBb1NJyA/zC8T
   mvNJw0GZQpmQyCLZod/eoMtPxyWmLO+Chg44gDxVK/anIkLijY44j0KRc
   6qFbJh4TzylaDvzMdjTFGZXsfcMTCMd9RYqHtcNNYkbVW+9lV5xnnH8ZL
   3rrP9kC1Sd+rd+qOC4KUfGmpN4PWVoMF2tuMGA39AwDlfvo8xxTW6VwGj
   g==;
X-CSE-ConnectionGUID: uhwErX3+SCqStqzLcwsNXw==
X-CSE-MsgGUID: nKGG/0jpQK+dDfbo4MhguQ==
X-IronPort-AV: E=Sophos;i="6.23,223,1770620400"; 
   d="scan'208";a="56432169"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 00:36:12 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Fri, 8 May 2026 00:36:12 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 8 May 2026 00:36:08 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Fri, 8 May 2026 09:35:32 +0200
Subject: [PATCH net-next v4 08/13] net: lan966x: add shutdown callback to
 stop FDMA on reboot
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260508-lan966x-pci-fdma-v4-8-14e0c89d8d63@microchip.com>
References: <20260508-lan966x-pci-fdma-v4-0-14e0c89d8d63@microchip.com>
In-Reply-To: <20260508-lan966x-pci-fdma-v4-0-14e0c89d8d63@microchip.com>
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
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<bpf@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_083629_213834_28F9287C 
X-CRM114-Status: GOOD (  16.74  )
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

When lan966x is used as a PCIe endpoint, the FDMA engine runs on the
card and survives a host reboot. Without a shutdown callback, channels
stay active and interrupt sources stay armed across the reset, causing
the shared PCIe INTx to assert before the driver has re-probed.

Add a shutdown callback, shared by the platform and PCI paths, that
masks FDMA interrupts (FDMA_INTR_ENA and FDMA_INTR_DB_ENA) and disables
the RX and TX channels.

FDMA_INTR_ENA persists on the card across a warm reboot, so also
restore the full enable in lan966x_fdma_rx_start() to re-arm interrupts
after a previous shutdown(). rx_start() runs after both the RX and TX
rings are allocated, so the same single-site re-arm works for both the
platform and PCIe backends.

Tested-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c |  4 ++++
 drivers/net/ethernet/microchip/lan966x/lan966x_main.c | 18 ++++++++++++++++++
 drivers/net/ethernet/microchip/lan966x/lan966x_regs.h | 15 +++++++++++++++
 3 files changed, 37 insertions(+)

diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
index 9bb40383aa56..493aef5ba8d1 100644
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
index b3701953b090..271c023900db 100644
--- a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
+++ b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
@@ -1311,9 +1311,27 @@ static void lan966x_remove(struct platform_device *pdev)
 	debugfs_remove_recursive(lan966x->debugfs_root);
 }
 
+static void lan966x_shutdown(struct platform_device *pdev)
+{
+	struct lan966x *lan966x = platform_get_drvdata(pdev);
+
+	if (!lan966x->fdma)
+		return;
+
+	lan966x_fdma_rx_disable(&lan966x->rx);
+	lan966x_fdma_tx_disable(&lan966x->tx);
+
+	napi_synchronize(&lan966x->napi);
+	napi_disable(&lan966x->napi);
+
+	lan_wr(0, lan966x, FDMA_INTR_ENA);
+	lan_wr(0, lan966x, FDMA_INTR_DB_ENA);
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


