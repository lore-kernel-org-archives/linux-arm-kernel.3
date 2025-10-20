Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55155CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 11:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sbIeGWFTYyfsk1cZ4GSr/dZ9OnIwY7Q2HU34N1odmLk=; b=QwwFK1iJ5Q1aVcDuML5fm4UVYR
	fqcnlXH1K0Enw7X6vVssLcST5Aqzeh1R6ydPvF0iLGC9BrYQFnGU8Z6tZmEUnQk2Ny4TLrX2o/O4K
	TN/sIEuxoFLvQ8yuqvY0pTX2fYVxhz7CQfnxEdMS1wh9YGE7CISWfJe2IpGvxFkitdDVaPaOG3Ynr
	RZTizt8JzxtEL1G9vdrMq3uYO46nPnR9dDUnNZq1KZBSs81nNxPDk/90C7+nsTQg/jT1SkxG1XD8F
	tXrZrBo2G0V8mqZljTMZVU3RzZ7AAekZFAqQ0Oi9mk58lB0wa0OpM61N96c+hc5aEcAp4987UqZmR
	dNwOhHwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAnns-0000000D16V-14aN;
	Mon, 20 Oct 2025 11:11:52 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAnnk-0000000D0xn-35dN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 11:11:46 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-47106fc51faso50107935e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 04:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760958703; x=1761563503; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sbIeGWFTYyfsk1cZ4GSr/dZ9OnIwY7Q2HU34N1odmLk=;
        b=br8VLo7GZJCKQ1KHzfO7ezEMOKk4/UXrpDIUSSrtj+8gdJ/dLghEIDgG9EAg1dMeMi
         5vU/wkWKRvXe0JGKQ1Y3popRK1QBQkWS9x02EDZVol8G7MdZ0ty1zviz5pHZO3YAwS2I
         p78GvgSxeQOzE8kzh2E725zH/Qm7SQYcQHLmtrjZlaxZqxgV2KxMUENBy1OQLt7fC0Ew
         iGv0bXtWT0wGfHaLYvWIGo4bChYTOpJiyHpgz9nMSVARKTJkmL+ZSfSVLvz48Hh80YfE
         pRXafGk3cOnGOnJWqlKhOBcRwb2Gi3VRISJTzFtrYhM+O2NGDIpYqXb8EybR/TkqMuiG
         cGNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760958703; x=1761563503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sbIeGWFTYyfsk1cZ4GSr/dZ9OnIwY7Q2HU34N1odmLk=;
        b=RT6soq2F9HOgI22aoDP3e7PRS01uFE24fmfLmC6S8U7corVl8K+cY6daRBkRtA7IrN
         EOPAeSfW21P9Ztq6Hqa4Sn5zTE8SPbu/YNUEYyyfRM8KpFPKhp1PVvoiAgEz58dhMESJ
         Qf3RCXpvVn/C9yiK8POp7MYpM1xleve9Y0OzcEF3Cz6MbVNX8/QnRNwDwQVekKic6qQV
         F8Q9pwNwJ1VQpyRGIncUNQxqJBUl6Pwj2jyY/4j0yDk6Q2QBTs8Ix9yDUWHkWOuMrqYD
         lG9peJq8SvEQkUWMnBPiGU3zzdnYW+rjLJ0UZcDrKyZTeMwHb4mp0o/76vfmJwX5IfZV
         FSMg==
X-Forwarded-Encrypted: i=1; AJvYcCUdFA636PzBKiwA8ZKSeOO3MtMSxPmqUA0T/SFb/Pw93OlCGBZYgNz91T6Y63U8qqp1dCFTzh/iyIvC3KHb4ZN+@lists.infradead.org
X-Gm-Message-State: AOJu0Yxd3Zq9EHSBVkb6oU/fgTZLS3ZY0biy8Dv3Gn1qseoJ+O/ykgd4
	j0XUdgPDgKDoLId8AVm1gBri8kuP13zMtMSYfmt9qkN9oG/ByOhAO3kh
X-Gm-Gg: ASbGncuYVzUTlzFpEcjo7khOcE3Tqu91cic8CIa5CmL4XG7w3pZrhQ6Wnq2OTzqj5kD
	ZpBxDVkJ4hd0xFZ84ccwWSi+dPf6PGZYrNM/RxDYIY9pIKDXvoqXchjNnwItAiTK8D/lp+mU1xo
	4FfEdypkismUi9HdNQJi16lbYcX8AjJaMu9dzzfkgqkHCCl5W7rzs+kvQOagejXYf1+pA4gaG9j
	phKR4057EFRPVJXtJ1XzWfX2GSsuzdA2uN1wykGPAgZmOizfGHwl97rNUZw7b5vyyySNgU+lqt/
	8xwon+hfqvyqJs4/EyiFPetxUEhCCN+AWM3j5lr9wXRdxRj/bW5QmNQoobNGtbDppT3b6g0nUmm
	UaJ5olEtsG70k4mdKCwCrh0VBOMVdywRnRs0lb5HpKd971vJAtWkjd13y+krfLaJ+Vy0DufgOqA
	s5GqrCOU1sA8kBXJhMlxeV892A03qzxKblfK+gqHgoZ6s=
X-Google-Smtp-Source: AGHT+IFlMvcsghCbEtYlJFP5IolC9pAMY6FOui1RTLbJZ1uhCFPw3pViibwIRY6AzcnOgeG33heQFg==
X-Received: by 2002:a05:600c:3b8d:b0:46d:27b7:e7e5 with SMTP id 5b1f17b1804b1-47117917572mr114423345e9.32.1760958702709;
        Mon, 20 Oct 2025 04:11:42 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-92-177.ip49.fastwebnet.it. [93.34.92.177])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4283e7804f4sm12692219f8f.10.2025.10.20.04.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 04:11:42 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	upstream@airoha.com
Subject: [PATCH v6 3/5] PCI: mediatek: Convert bool to single quirks entry and bitmap
Date: Mon, 20 Oct 2025 13:11:07 +0200
Message-ID: <20251020111121.31779-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251020111121.31779-1-ansuelsmth@gmail.com>
References: <20251020111121.31779-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_041144_828166_07B281BE 
X-CRM114-Status: GOOD (  19.97  )
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

To clean Mediatek SoC PCIe struct, convert all the bool to a bitmap and
use a single quirks to reference all the values. This permits cleaner
addition of new quirk without having to define a new bool in the struct.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/pci/controller/pcie-mediatek.c | 33 ++++++++++++++++----------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index 24cc30a2ab6c..cbffa3156da1 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -142,24 +142,32 @@
 
 struct mtk_pcie_port;
 
+/**
+ * enum mtk_pcie_quirks - MTK PCIe quirks
+ * @MTK_PCIE_FIX_CLASS_ID: host's class ID needed to be fixed
+ * @MTK_PCIE_FIX_DEVICE_ID: host's device ID needed to be fixed
+ * @MTK_PCIE_NO_MSI: Bridge has no MSI support, and relies on an external block
+ */
+enum mtk_pcie_quirks {
+	MTK_PCIE_FIX_CLASS_ID = BIT(0),
+	MTK_PCIE_FIX_DEVICE_ID = BIT(1),
+	MTK_PCIE_NO_MSI = BIT(2),
+};
+
 /**
  * struct mtk_pcie_soc - differentiate between host generations
- * @need_fix_class_id: whether this host's class ID needed to be fixed or not
- * @need_fix_device_id: whether this host's device ID needed to be fixed or not
- * @no_msi: Bridge has no MSI support, and relies on an external block
  * @device_id: device ID which this host need to be fixed
  * @ops: pointer to configuration access functions
  * @startup: pointer to controller setting functions
  * @setup_irq: pointer to initialize IRQ functions
+ * @quirks: PCIe device quirks.
  */
 struct mtk_pcie_soc {
-	bool need_fix_class_id;
-	bool need_fix_device_id;
-	bool no_msi;
 	unsigned int device_id;
 	struct pci_ops *ops;
 	int (*startup)(struct mtk_pcie_port *port);
 	int (*setup_irq)(struct mtk_pcie_port *port, struct device_node *node);
+	enum mtk_pcie_quirks quirks;
 };
 
 /**
@@ -703,7 +711,7 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
 	writel(val, port->base + PCIE_RST_CTRL);
 
 	/* Set up vendor ID and class code */
-	if (soc->need_fix_class_id) {
+	if (soc->quirks & MTK_PCIE_FIX_CLASS_ID) {
 		val = PCI_VENDOR_ID_MEDIATEK;
 		writew(val, port->base + PCIE_CONF_VEND_ID);
 
@@ -711,7 +719,7 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
 		writew(val, port->base + PCIE_CONF_CLASS_ID);
 	}
 
-	if (soc->need_fix_device_id)
+	if (soc->quirks & MTK_PCIE_FIX_DEVICE_ID)
 		writew(soc->device_id, port->base + PCIE_CONF_DEVICE_ID);
 
 	/* 100ms timeout value should be enough for Gen1/2 training */
@@ -1099,7 +1107,7 @@ static int mtk_pcie_probe(struct platform_device *pdev)
 
 	host->ops = pcie->soc->ops;
 	host->sysdata = pcie;
-	host->msi_domain = pcie->soc->no_msi;
+	host->msi_domain = !!(pcie->soc->quirks & MTK_PCIE_NO_MSI);
 
 	err = pci_host_probe(host);
 	if (err)
@@ -1187,9 +1195,9 @@ static const struct dev_pm_ops mtk_pcie_pm_ops = {
 };
 
 static const struct mtk_pcie_soc mtk_pcie_soc_v1 = {
-	.no_msi = true,
 	.ops = &mtk_pcie_ops,
 	.startup = mtk_pcie_startup_port,
+	.quirks = MTK_PCIE_NO_MSI,
 };
 
 static const struct mtk_pcie_soc mtk_pcie_soc_mt2712 = {
@@ -1199,19 +1207,18 @@ static const struct mtk_pcie_soc mtk_pcie_soc_mt2712 = {
 };
 
 static const struct mtk_pcie_soc mtk_pcie_soc_mt7622 = {
-	.need_fix_class_id = true,
 	.ops = &mtk_pcie_ops_v2,
 	.startup = mtk_pcie_startup_port_v2,
 	.setup_irq = mtk_pcie_setup_irq,
+	.quirks = MTK_PCIE_FIX_CLASS_ID,
 };
 
 static const struct mtk_pcie_soc mtk_pcie_soc_mt7629 = {
-	.need_fix_class_id = true,
-	.need_fix_device_id = true,
 	.device_id = PCI_DEVICE_ID_MEDIATEK_7629,
 	.ops = &mtk_pcie_ops_v2,
 	.startup = mtk_pcie_startup_port_v2,
 	.setup_irq = mtk_pcie_setup_irq,
+	.quirks = MTK_PCIE_FIX_CLASS_ID | MTK_PCIE_FIX_DEVICE_ID,
 };
 
 static const struct of_device_id mtk_pcie_ids[] = {
-- 
2.51.0


