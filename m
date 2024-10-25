Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46065D0C607
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 12:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rclpcy2NkA/OAPsZkEcyTD0lijx7zaXfQCNiyX9YvLk=; b=M13yyGh4pLCr3tW08wY7sGoitl
	2XfvtM9iNgaU8j2XIh77AxjyLv9nxNXtJ9Ji+oD1nApO6J4tkToNnbcODcVUKxwY6jdZKAow3HE7G
	7LKVnsIX0gsPnb5t127+gXnnbYS5ug0tVS9h0ary08iEhgtwzggJcCdDWFc8gtjibwTeRFPDMFz5o
	HrJJ64GjYjdh4Hw1ACvjSlih6/Ew9fitik4mSY0ISMeQHfHsc9YWYd1fulVhFJhnbg/ByDroZkoJc
	7YnbX+AUuOaBxgq+d3jMbWKySI8Us4dc6HqJw6SIx8n9AeoA7BwwddXUE05YNza/iHPSeF84yXISc
	RUj8ZbIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Jff-00000003hkA-39Nr;
	Fri, 25 Oct 2024 12:44:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4JdD-00000003h7n-0XMM;
	Fri, 25 Oct 2024 12:41:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=rclpcy2NkA/OAPsZkEcyTD0lijx7zaXfQCNiyX9YvLk=; b=ZHGZUDNq2vBJ5AFmoEuvLrJqyx
	mRoWAahLeFIB4M8jhE+grMPibDhuExSp3vTMWG0DGru9YuEvEmXYqcE29L29LUdMwv5qkdMuzePd5
	wvMCbcqgTg9hLpAi7/PvvfyPIPTHfrwFxaVWKTxlwvNiawbnrjxuwTnb2Y2wlYuVaZHMvLg3XnVrR
	22HgEutR7a9N72JC2gkUL7BEOINcWCHfHPXurhOmP3IyQqBrugLdm5x5yPxw/yOuBoofKdrlfc+lQ
	td11TNRfIPTu5BZczS2G3ZOgTKRiMofB8wesQJuI3TF2wlH/h34ef+r3Hrz49qiX5jnCw95XQ6ko+
	uPnT22rg==;
Received: from smtp-out1.suse.de ([195.135.223.130])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Jd9-00000008uGm-3QM4;
	Fri, 25 Oct 2024 12:41:29 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A7AA621D54;
	Fri, 25 Oct 2024 12:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1729860084; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=rclpcy2NkA/OAPsZkEcyTD0lijx7zaXfQCNiyX9YvLk=;
	b=Va5fLxLoIQ9kHfOwL6E6qZAFYf0z6kMVgr+Gz6aTzhaYHYFZALxxDIj+AGasdFTP7ViI0Q
	+rAgOLiHWwJ14MYsN5V2BKjizA11B+cZqJionnREPI+xhpsjQMHXiLll94QTPWwKpVCLxz
	bO+U6CQKBSoNAar88PYWFtE2lMppd+o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1729860084;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=rclpcy2NkA/OAPsZkEcyTD0lijx7zaXfQCNiyX9YvLk=;
	b=E9hy1WmtvIwYddJsvLQryMC2Q7OFAfe3yVLAN70Nu1f5pejFcFS+Wznwy1I7UL+DV40B5G
	IottddhXDDNrG+Cw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1729860084; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=rclpcy2NkA/OAPsZkEcyTD0lijx7zaXfQCNiyX9YvLk=;
	b=Va5fLxLoIQ9kHfOwL6E6qZAFYf0z6kMVgr+Gz6aTzhaYHYFZALxxDIj+AGasdFTP7ViI0Q
	+rAgOLiHWwJ14MYsN5V2BKjizA11B+cZqJionnREPI+xhpsjQMHXiLll94QTPWwKpVCLxz
	bO+U6CQKBSoNAar88PYWFtE2lMppd+o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1729860084;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=rclpcy2NkA/OAPsZkEcyTD0lijx7zaXfQCNiyX9YvLk=;
	b=E9hy1WmtvIwYddJsvLQryMC2Q7OFAfe3yVLAN70Nu1f5pejFcFS+Wznwy1I7UL+DV40B5G
	IottddhXDDNrG+Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A7A34136F5;
	Fri, 25 Oct 2024 12:41:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Pul7JvORG2ePNwAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Fri, 25 Oct 2024 12:41:23 +0000
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
Subject: [PATCH v4 00/10] Add PCIe support for bcm2712
Date: Fri, 25 Oct 2024 15:41:21 +0300
Message-ID: <20241025124121.12500-1-svarbanov@suse.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linutronix.de,kernel.org,broadcom.com,gmail.com,google.com,linux.com,pengutronix.de,suse.com,raspberrypi.com,suse.de];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_134128_043166_837604C6 
X-CRM114-Status: GOOD (  12.22  )
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

Here is v4 of the series which aims to add support for PCIe on bcm2712 SoC
used by RPi5. Previous v3 can be found at [1].

v3 -> v4 changes include:
 - Addressed comments on the interrupt-controller driver (Thomas)
 - Moved "Reuse config structure" patch earlier in the series (Bjorn)
 - Merged "Avoid turn off of bridge reset" into "Add bcm2712 support" (Bjorn)
 - Fixed DTB warnings on broadcom/bcm2712-rpi-5-b.dtb 

For more detailed info check patches.

Comments are welcome!
~Stan

[1] https://patchwork.kernel.org/project/linux-pci/list/?series=898891

Stanimir Varbanov (10):
  dt-bindings: interrupt-controller: Add bcm2712 MSI-X DT bindings
  dt-bindings: PCI: brcmstb: Update bindings for PCIe on bcm2712
  irqchip: Add Broadcom bcm2712 MSI-X interrupt controller
  PCI: brcmstb: Reuse config structure
  PCI: brcmstb: Expand inbound window size up to 64GB
  PCI: brcmstb: Enable external MSI-X if available
  PCI: brcmstb: Add bcm2712 support
  PCI: brcmstb: Adjust PHY PLL setup to use a 54MHz input refclk
  arm64: dts: broadcom: bcm2712: Add PCIe DT nodes
  arm64: dts: broadcom: bcm2712-rpi-5-b: Enable PCIe DT nodes

 .../brcm,bcm2712-msix.yaml                    |  60 ++++
 .../bindings/pci/brcm,stb-pcie.yaml           |  21 ++
 .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     |   8 +
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi     | 162 +++++++++
 drivers/irqchip/Kconfig                       |  16 +
 drivers/irqchip/Makefile                      |   1 +
 drivers/irqchip/irq-bcm2712-mip.c             | 310 ++++++++++++++++++
 drivers/pci/controller/pcie-brcmstb.c         | 204 +++++++++---
 8 files changed, 735 insertions(+), 47 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2712-msix.yaml
 create mode 100644 drivers/irqchip/irq-bcm2712-mip.c

-- 
2.43.0


