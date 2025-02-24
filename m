Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50934C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 08:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gUzxlfop69b1dDrCQAZ0orgLMQmh6UkeuP2YTL3zP5E=; b=nIqja42LFTnQIR/lndp6EKxk1k
	a3iCbHw2OopH0wV7fukwVByHUKYyO0O9iRs4gHbFF6CfvpwsO/yJhyk7WBAn434mcLvaz4OZrzFxo
	MlmFIf3aXmZsT+8/w2eunFTmSxtykrf4hSEVitUKz4ixB/2bw4glEJBQr0OlhCajkTOwk2bEa8erV
	EyV01r3OaXr0vFTdj24QSgpM48gNDxNlL3NnCqlfjrB+n2WHg89s4VWlBlH7CvBukVQ+nlhminMUa
	fOzVce5d6ifjn3zoDCAfnnTfCvzyF0tchtsn220YjvyEFZharCCUH4YJ4dJ8p/LRhNjigCTXxA/5o
	yAduoi7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmU7U-0000000Cl05-0AeW;
	Mon, 24 Feb 2025 08:47:20 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmTx1-0000000CiTp-32UT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 08:36:33 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 43D0C21180;
	Mon, 24 Feb 2025 08:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1740386190; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gUzxlfop69b1dDrCQAZ0orgLMQmh6UkeuP2YTL3zP5E=;
	b=uwFcHTc/LFTskg1mfIT56B9t7NITPFmDdC9KTKprw4CwVsuJho0g+bL5YgD46jhVz5BTnl
	xouXnK8DEInulO7FpZuIc9mhXlXXNcv8yPD8i6tVPONOL6Mopcq13xYusISC/VQtNMWeRi
	Rhe4NpKgWnNlda14UYl6YC8On1AevNA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1740386190;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gUzxlfop69b1dDrCQAZ0orgLMQmh6UkeuP2YTL3zP5E=;
	b=w4lkTbXwT+2e2RiYx9OrFOWNW5fTGPBTG4PGphGgHcmGvOq8RzyZPKu31c0C8km0zBxYMW
	JtqiSHrACf3O/tCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1740386190; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gUzxlfop69b1dDrCQAZ0orgLMQmh6UkeuP2YTL3zP5E=;
	b=uwFcHTc/LFTskg1mfIT56B9t7NITPFmDdC9KTKprw4CwVsuJho0g+bL5YgD46jhVz5BTnl
	xouXnK8DEInulO7FpZuIc9mhXlXXNcv8yPD8i6tVPONOL6Mopcq13xYusISC/VQtNMWeRi
	Rhe4NpKgWnNlda14UYl6YC8On1AevNA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1740386190;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gUzxlfop69b1dDrCQAZ0orgLMQmh6UkeuP2YTL3zP5E=;
	b=w4lkTbXwT+2e2RiYx9OrFOWNW5fTGPBTG4PGphGgHcmGvOq8RzyZPKu31c0C8km0zBxYMW
	JtqiSHrACf3O/tCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 13C1A13332;
	Mon, 24 Feb 2025 08:36:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id RvcVAo0vvGeJVAAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Mon, 24 Feb 2025 08:36:29 +0000
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
Subject: [PATCH v6 0/7] Add PCIe support for bcm2712
Date: Mon, 24 Feb 2025 10:35:52 +0200
Message-ID: <20250224083559.47645-1-svarbanov@suse.de>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[dt];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linutronix.de,kernel.org,broadcom.com,gmail.com,google.com,linux.com,pengutronix.de,suse.com,raspberrypi.com,suse.de];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_003631_909490_8ED5D026 
X-CRM114-Status: GOOD (  11.28  )
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

Hello, v6 is re-based version of controller/brcmstb branch of pci tree.

v5 could be found at [1].

v5 -> v6 changes include:
 - Fix a build error in 04/11 (Jim).
 - Address a comment from Bjorn about bisect-ability by squash
   07/11 in 06/11 (Bjorn).
 - Move 08/11 right after irqchip patch (Bjorn).

Regards,
~Stan

[1] https://lore.kernel.org/lkml/20250120130119.671119-1-svarbanov@suse.de/

Stanimir Varbanov (7):
  dt-bindings: interrupt-controller: Add BCM2712 MSI-X DT bindings
  dt-bindings: PCI: brcmstb: Update bindings for PCIe on BCM2712
  irqchip: Add Broadcom BCM2712 MSI-X interrupt controller
  PCI: brcmstb: Adding a softdep to MIP MSI-X driver
  PCI: brcmstb: Reuse pcie_cfg_data structure
  PCI: brcmstb: Expand inbound window size up to 64GB
  PCI: brcmstb: Add BCM2712 support

 .../brcm,bcm2712-msix.yaml                    |  60 ++++
 .../bindings/pci/brcm,stb-pcie.yaml           |   6 +-
 drivers/irqchip/Kconfig                       |  16 +
 drivers/irqchip/Makefile                      |   1 +
 drivers/irqchip/irq-bcm2712-mip.c             | 292 ++++++++++++++++++
 drivers/pci/controller/pcie-brcmstb.c         | 144 ++++++---
 6 files changed, 475 insertions(+), 44 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2712-msix.yaml
 create mode 100644 drivers/irqchip/irq-bcm2712-mip.c

-- 
2.47.0


