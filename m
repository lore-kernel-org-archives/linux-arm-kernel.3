Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4303FC02182
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 22:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Xos+iPEOgtcwGXoWIUpdh6SUPLxn4fe3D3r1m6hKDLA=; b=jT9XKiVPGC4s7pJ4E0QRIKxAA5
	T3par7RkdiFeZDWoni81gahhvVMuhgr1O7vNcneRooxAx4tof2uPwdpGnmTFboIrMYEWXIC4MecjW
	wu6OtqTzVK6eJS7bfgO6h4IHzThmbXDe9sqzz0etlT0RK8I+PmOLj6/t3ri+HZ2wkyplP5yPgdHdi
	/1SJX9RWhdwKZyJpilFwKSa0ytRV36BAdi6FtqsKsOCC7Iv8FBgtk59KjCTziCAPjpVNrHx+C+z4F
	VBDH0qy0/lf5gGyeBftGpCAgoODTVV1RCApiOQkoRJxETzimr1UF0AVXjwHv2bLQwCWdfqU1W25/M
	geOT7oNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tajG5-0000000BL0d-3cXz;
	Wed, 22 Jan 2025 22:31:37 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tajEm-0000000BKp5-3a0Z;
	Wed, 22 Jan 2025 22:30:18 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BE07B2115D;
	Wed, 22 Jan 2025 22:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737585014; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Xos+iPEOgtcwGXoWIUpdh6SUPLxn4fe3D3r1m6hKDLA=;
	b=UUeGjhWnH4XaVdiJil15fMp8lJI/WXEKHhlX5mh6xNkzXQ8i53ecu0TJFdceRIxuZeijNX
	bvvrUyJusnMfZ380gcYFzBVzc0bzi4ZTlgOiscV+1qWtVUjghPYeKBjkMw6ec7tq0EvFbg
	4c/L5vqr+HXDuz0uxumk7pwPMWAMU1M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737585014;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Xos+iPEOgtcwGXoWIUpdh6SUPLxn4fe3D3r1m6hKDLA=;
	b=mOt5QrSVEop+Dh/j7X8hyrVUGOLOmQ06CyKv1tG/UuqaA5VX8hgwnW97RaulQVnq4BbL2R
	QAzcA0mYz7BY6EBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=UUeGjhWn;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=mOt5QrSV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737585014; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Xos+iPEOgtcwGXoWIUpdh6SUPLxn4fe3D3r1m6hKDLA=;
	b=UUeGjhWnH4XaVdiJil15fMp8lJI/WXEKHhlX5mh6xNkzXQ8i53ecu0TJFdceRIxuZeijNX
	bvvrUyJusnMfZ380gcYFzBVzc0bzi4ZTlgOiscV+1qWtVUjghPYeKBjkMw6ec7tq0EvFbg
	4c/L5vqr+HXDuz0uxumk7pwPMWAMU1M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737585014;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Xos+iPEOgtcwGXoWIUpdh6SUPLxn4fe3D3r1m6hKDLA=;
	b=mOt5QrSVEop+Dh/j7X8hyrVUGOLOmQ06CyKv1tG/UuqaA5VX8hgwnW97RaulQVnq4BbL2R
	QAzcA0mYz7BY6EBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 49146136A1;
	Wed, 22 Jan 2025 22:30:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id JohxDnVxkWeRRAAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Wed, 22 Jan 2025 22:30:13 +0000
From: Stanimir Varbanov <svarbanov@suse.de>
To: linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jim Quinlan <jim2101024@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	kw@linux.com,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Stanimir Varbanov <svarbanov@suse.de>,
	stable@vger.kernel.org
Subject: [PATCH v2] PCI: brcmstb: Fix for missing of_node_put
Date: Thu, 23 Jan 2025 00:29:55 +0200
Message-ID: <20250122222955.1752778-1-svarbanov@suse.de>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: BE07B2115D
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_CC(0.00)[broadcom.com,gmail.com,kernel.org,linux.com,linaro.org,google.com,suse.de,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_143017_191401_FB603E83 
X-CRM114-Status: GOOD (  13.12  )
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

A call to of_parse_phandle() is incrementing the refcount, of_node_put
must be called when done the work on it. Add missing of_node_put() after
the check for msi_np == np and MSI initialization.

Cc: stable@vger.kernel.org # v5.10+
Fixes: 40ca1bf580ef ("PCI: brcmstb: Add MSI support")
Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
---
v1 -> v2:
 - Use of_node_put instead of cleanups (Florian).
 - Sent the patch separately from PCIe 2712 series (Florian).

 drivers/pci/controller/pcie-brcmstb.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index 744fe1a4cf9c..d171ee61eab3 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -1844,7 +1844,7 @@ static struct pci_ops brcm7425_pcie_ops = {
 
 static int brcm_pcie_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node, *msi_np;
+	struct device_node *np = pdev->dev.of_node;
 	struct pci_host_bridge *bridge;
 	const struct pcie_cfg_data *data;
 	struct brcm_pcie *pcie;
@@ -1944,9 +1944,14 @@ static int brcm_pcie_probe(struct platform_device *pdev)
 		goto fail;
 	}
 
-	msi_np = of_parse_phandle(pcie->np, "msi-parent", 0);
-	if (pci_msi_enabled() && msi_np == pcie->np) {
-		ret = brcm_pcie_enable_msi(pcie);
+	if (pci_msi_enabled()) {
+		struct device_node *msi_np = of_parse_phandle(pcie->np, "msi-parent", 0);
+
+		if (msi_np == pcie->np)
+			ret = brcm_pcie_enable_msi(pcie);
+
+		of_node_put(msi_np);
+
 		if (ret) {
 			dev_err(pcie->dev, "probe of internal MSI failed");
 			goto fail;
-- 
2.47.0


