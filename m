Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 882D2C02181
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 13:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SyTzT5pv3y66+h4CWiY6o2neUIUBscg8lb1Kk7WLuaE=; b=FxyOqMOcfzYDL5PUblA2PG5nG4
	lkE8nTGsHgXNFa1nCQhEOGWI8UxCFUseOgGsUt5y76nPFyAkO+WHHoqIPq1Gzob06oI5+AeJfz1nN
	H5TS2s6QlwxAAbCrJgdqFQB8jLCTZaW7ALkfmwa18Er8CSh04+Kl/sPgbTfaItMp8JcfBNqiTmBAu
	EcU6Q881Ms4w5j7nw+gdPBuMuHZ/wYe9BtADsbVakx1wYoc8E1WcRBuOHAvw14wly2yljgeZYltyJ
	TZCIJw7S5McoPd0+obqbDxpTcjGJiazjTp53b/0+5ZnMsm3C++fJbMC9u4W5fVuAo9yiciN/mw6kr
	7fPcnMvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZrS7-00000005bin-0oPB;
	Mon, 20 Jan 2025 13:04:27 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZrPZ-00000005b7J-2uMK;
	Mon, 20 Jan 2025 13:01:51 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 116CA2115D;
	Mon, 20 Jan 2025 13:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737378105; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=SyTzT5pv3y66+h4CWiY6o2neUIUBscg8lb1Kk7WLuaE=;
	b=XniOJ6O20qc73fK/fA688yxzfq35OK9WxDy8jQAa1m/Mil7ctcWB2eWRNvcBj9jGkerRsK
	HIEvonn59SGyeWHVqLtstPCrEVDwAG//088SrVHFb7tkFiRZ2dhhxSdZ1B2IVRId2dOs5H
	UTBEW8YYJ0WPSB5ujtsZ9JagLx1uFYE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737378105;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=SyTzT5pv3y66+h4CWiY6o2neUIUBscg8lb1Kk7WLuaE=;
	b=xu7SzZEO7WkgfTqbpBW8aBsVNnN3yuMYey3EkW3NE2myW2AQKyNdGMQ3bvtNVCDT1oyJ4u
	90p3m62ieOEseyCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=XniOJ6O2;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=xu7SzZEO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737378105; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=SyTzT5pv3y66+h4CWiY6o2neUIUBscg8lb1Kk7WLuaE=;
	b=XniOJ6O20qc73fK/fA688yxzfq35OK9WxDy8jQAa1m/Mil7ctcWB2eWRNvcBj9jGkerRsK
	HIEvonn59SGyeWHVqLtstPCrEVDwAG//088SrVHFb7tkFiRZ2dhhxSdZ1B2IVRId2dOs5H
	UTBEW8YYJ0WPSB5ujtsZ9JagLx1uFYE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737378105;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=SyTzT5pv3y66+h4CWiY6o2neUIUBscg8lb1Kk7WLuaE=;
	b=xu7SzZEO7WkgfTqbpBW8aBsVNnN3yuMYey3EkW3NE2myW2AQKyNdGMQ3bvtNVCDT1oyJ4u
	90p3m62ieOEseyCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 143801393E;
	Mon, 20 Jan 2025 13:01:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WZSOAjhJjmc4XQAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Mon, 20 Jan 2025 13:01:44 +0000
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
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>
Subject: [PATCH v5 -next 00/11] Add PCIe support for bcm2712
Date: Mon, 20 Jan 2025 15:01:08 +0200
Message-ID: <20250120130119.671119-1-svarbanov@suse.de>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 116CA2115D
X-Spamd-Result: default: False [-1.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[linutronix.de,kernel.org,broadcom.com,gmail.com,google.com,linux.com,pengutronix.de,suse.com,raspberrypi.com,suse.de];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_050149_878067_ECB5A474 
X-CRM114-Status: GOOD (  14.29  )
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

Here is v5 of the series which aims to add support for PCIe on bcm2712 SoC
used by RPi5. Previous v4 can be found at [1].

Based the series on linux-next because of vc4 gpu node in bcm2712.dtsi.

v4 -> v5 changes include:
 - Addressed comments to interrupt-controller driver. (Thomas)
 - Fixed DTB warnings  broadcom/bcm2712-rpi-5-b.dtb.
 - New patch in the series to fix missing of_node_put.
 - New patch to make a softdep to a MIP MSI-X driver.
 - Dropped the patch which adds MSI-X support in pcie-brcmstb driver,
   and instead use DT dma-ranges to pass the needed information. (Jim)

For more detailed info check patches.

Comments are welcome!
~Stan

[1] https://patchwork.kernel.org/project/linux-pci/cover/20241025124515.14066-1-svarbanov@suse.de/

Stanimir Varbanov (11):
  dt-bindings: interrupt-controller: Add bcm2712 MSI-X DT bindings
  dt-bindings: PCI: brcmstb: Update bindings for PCIe on bcm2712
  irqchip: Add Broadcom bcm2712 MSI-X interrupt controller
  PCI: brcmstb: Reuse config structure
  PCI: brcmstb: Expand inbound window size up to 64GB
  PCI: brcmstb: Add bcm2712 support
  PCI: brcmstb: Adjust PHY PLL setup to use a 54MHz input refclk
  PCI: brcmstb: Adding a softdep to MIP MSI-X driver
  PCI: brcmstb: Fix for missing of_node_put
  arm64: dts: broadcom: bcm2712: Add PCIe DT nodes
  arm64: dts: broadcom: bcm2712-rpi-5-b: Enable PCIe DT nodes

 .../brcm,bcm2712-msix.yaml                    |  60 ++++
 .../bindings/pci/brcm,stb-pcie.yaml           |   6 +-
 .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     |   8 +
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi     | 147 +++++++++
 drivers/irqchip/Kconfig                       |  16 +
 drivers/irqchip/Makefile                      |   1 +
 drivers/irqchip/irq-bcm2712-mip.c             | 292 ++++++++++++++++++
 drivers/pci/controller/pcie-brcmstb.c         | 147 ++++++---
 8 files changed, 632 insertions(+), 45 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2712-msix.yaml
 create mode 100644 drivers/irqchip/irq-bcm2712-mip.c

-- 
2.47.0


