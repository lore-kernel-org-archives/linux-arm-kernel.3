Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CD5D0C608
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 13:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ixXM31StPOmPL6wWzhyGTi6JqH2PwF3ZEziNbzNzSWI=; b=mkRerTHrxJV90ykjclXXY3OUon
	1hS9mPdfJU5gv1YZpzATShPl3IKmgKYl5PW7Q+DlGJWkbkFxHOns9Lk4GQhZWYINIZBvStCVp25in
	2xNtizEUmihu4796HBJbWxF/Icem/Jwg3hBw2O1v2Ga4QX4Poa09BWX6DA03oxRSO5PUYGVCPAhaS
	gDpZnU8u14woQ/e1ckshMJpjaB2GeJb8qGHbaIkJiFFU1+fXmq/14KF2ny953P5TA05A/v/bSr81a
	x2ErzOIwxHjMsYeOTx/MWQW7qqNbndWT3q7cRSCz0dYo2iN9pB96F5w0O2iMUm/hUqbJ/U6UafSZn
	3GXoUybg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4JwO-00000003kS9-0SHp;
	Fri, 25 Oct 2024 13:01:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4JhC-00000003hvy-29DW;
	Fri, 25 Oct 2024 12:45:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ixXM31StPOmPL6wWzhyGTi6JqH2PwF3ZEziNbzNzSWI=; b=IKyKu92d4lUJ7nUmonje2IV/RU
	K2vGIDz3JojuFuJzSozX++HVZCejMp+Q8pWiHTUGvM28Z4n6r1ZbTML/ZyWm57p8trYWe7BlxiclL
	SUDrQiXT0e+j5CG2IQ8liyxXdUZKelX6QEWB++Sil474n4Iu2Ja9mM3zB5gmqEI9YEuuui1UXnVmR
	rCoTgc1DiHtXab3G7K0gFZIwo9H9pDoAGGzC+6l73V0KbHdb7PUwtaI/YukqtMlNP880C3j70RWz6
	zkBA8x5ZY0lVKAp2RHAV5SXkHWosS4rpJWFXVBLvaP7rGcny/LoPTxTkCRRv3LwfW9rNuDX/m2Z0W
	BCDO3NmA==;
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Jh9-00000008uPJ-2vzO;
	Fri, 25 Oct 2024 12:45:37 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6DD9021D74;
	Fri, 25 Oct 2024 12:45:34 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5A04E136F5;
	Fri, 25 Oct 2024 12:45:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6MGSE+2SG2fzOAAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Fri, 25 Oct 2024 12:45:33 +0000
From: Stanimir Varbanov <svarbanov@suse.de>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jim Quinlan <jim2101024@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	kw@linux.com,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andrea della Porta <andrea.porta@suse.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>
Subject: [PATCH v4 06/10] PCI: brcmstb: Enable external MSI-X if available
Date: Fri, 25 Oct 2024 15:45:11 +0300
Message-ID: <20241025124515.14066-7-svarbanov@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241025124515.14066-1-svarbanov@suse.de>
References: <20241025124515.14066-1-svarbanov@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[];
	TAGGED_RCPT(0.00)[dt];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU]
X-Rspamd-Queue-Id: 6DD9021D74
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_134535_921549_902BD2D3 
X-CRM114-Status: GOOD (  13.80  )
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

On RPi5 there is an external MIP MSI-X interrupt controller
which can handle up to 64 interrupts.

Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
---
v3 -> v4:
 - no changes.

 drivers/pci/controller/pcie-brcmstb.c | 63 +++++++++++++++++++++++++--
 1 file changed, 59 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index c01462b07eea..af01a7915c94 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -1318,6 +1318,52 @@ static int brcm_pcie_start_link(struct brcm_pcie *pcie)
 	return 0;
 }
 
+static int brcm_pcie_enable_external_msix(struct brcm_pcie *pcie,
+					  struct device_node *msi_np)
+{
+	struct inbound_win inbound_wins[PCIE_BRCM_MAX_INBOUND_WINS];
+	u64 msi_pci_addr, msi_phys_addr;
+	struct resource r;
+	int mip_bar, ret;
+	u32 val, reg;
+
+	ret = of_property_read_reg(msi_np, 1, &msi_pci_addr, NULL);
+	if (ret)
+		return ret;
+
+	ret = of_address_to_resource(msi_np, 0, &r);
+	if (ret)
+		return ret;
+
+	msi_phys_addr = r.start;
+
+	/* Find free inbound window for MIP access */
+	mip_bar = brcm_pcie_get_inbound_wins(pcie, inbound_wins);
+	if (mip_bar < 0)
+		return mip_bar;
+
+	mip_bar += 1;
+	reg = brcm_bar_reg_offset(mip_bar);
+
+	val = lower_32_bits(msi_pci_addr);
+	val |= brcm_pcie_encode_ibar_size(SZ_4K);
+	writel(val, pcie->base + reg);
+
+	val = upper_32_bits(msi_pci_addr);
+	writel(val, pcie->base + reg + 4);
+
+	reg = brcm_ubus_reg_offset(mip_bar);
+
+	val = lower_32_bits(msi_phys_addr);
+	val |= PCIE_MISC_UBUS_BAR1_CONFIG_REMAP_ACCESS_EN_MASK;
+	writel(val, pcie->base + reg);
+
+	val = upper_32_bits(msi_phys_addr);
+	writel(val, pcie->base + reg + 4);
+
+	return 0;
+}
+
 static const char * const supplies[] = {
 	"vpcie3v3",
 	"vpcie3v3aux",
@@ -1879,11 +1925,20 @@ static int brcm_pcie_probe(struct platform_device *pdev)
 		goto fail;
 	}
 
-	msi_np = of_parse_phandle(pcie->np, "msi-parent", 0);
-	if (pci_msi_enabled() && msi_np == pcie->np) {
-		ret = brcm_pcie_enable_msi(pcie);
+	if (pci_msi_enabled()) {
+		msi_np = of_parse_phandle(pcie->np, "msi-parent", 0);
+		const char *str;
+
+		if (msi_np == pcie->np) {
+			str = "internal MSI";
+			ret = brcm_pcie_enable_msi(pcie);
+		} else {
+			str = "external MSI-X";
+			ret = brcm_pcie_enable_external_msix(pcie, msi_np);
+		}
+
 		if (ret) {
-			dev_err(pcie->dev, "probe of internal MSI failed");
+			dev_err(pcie->dev, "enable of %s failed\n", str);
 			goto fail;
 		}
 	}
-- 
2.43.0


