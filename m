Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A17CC02181
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 13:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sMuASHgpa8xlLCWpcGu3D5FxO0uCIpRpMtTeVpDuzaU=; b=09ua76AauatFtLu10MDno7zZ7N
	O0azc1xtrmu2NbYfnaije46eJ23kLT3mSMTLq2h0XPtFGq2cxcI+cfGxHT8fiY1dAqLcluI42+wyI
	rQhGc8G/0hfgQcWU/1TVQU7WNTn/Ph/qXJhk0poB2UEulk/0haQvD6XVo6Moi97T9T5Un1yXeCsO2
	DKZ/YKAjHprhiCVTbN2YFG/SrQhgmK+eH+FqV7Z7bGmBDlJEZnU5S77cuAqYttYYjao8188ooUWcO
	/iWgErVgwZhq3lAv6aD/4j+4bcJBIv1MRHg/CzdvrvwlMkqE8lshccM+SlTdxGRuq9Zl7hCtJ2+co
	ppQ5dGxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZrcL-00000005de4-42QL;
	Mon, 20 Jan 2025 13:15:01 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZrPf-00000005bAh-3gli;
	Mon, 20 Jan 2025 13:01:57 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 769C71F7B8;
	Mon, 20 Jan 2025 13:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737378114; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sMuASHgpa8xlLCWpcGu3D5FxO0uCIpRpMtTeVpDuzaU=;
	b=r8slo6MBReEKeRECYCX41llP2LPCBAFZh6gEpi9ZdA+ITFEXQUgjKAbvKG69Za3lIZ1mKh
	bu/64xDeNym0OKbfbL2gaN9erykjSofV7gBOgdalESsB7BA3tEbBnifw9gZgAEYevh/o2e
	gkbkkCyJOjuUkKgUweU6YpXAdY7CoZY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737378114;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sMuASHgpa8xlLCWpcGu3D5FxO0uCIpRpMtTeVpDuzaU=;
	b=RJNbFmPJ0+AY6R0Zb4j9DtKQlZEZrZ+FhETFHabXXh3shH/iEhvX/ac9O0CT9XUYiuzl5E
	ue995al4MEa35NCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=r8slo6MB;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=RJNbFmPJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737378114; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sMuASHgpa8xlLCWpcGu3D5FxO0uCIpRpMtTeVpDuzaU=;
	b=r8slo6MBReEKeRECYCX41llP2LPCBAFZh6gEpi9ZdA+ITFEXQUgjKAbvKG69Za3lIZ1mKh
	bu/64xDeNym0OKbfbL2gaN9erykjSofV7gBOgdalESsB7BA3tEbBnifw9gZgAEYevh/o2e
	gkbkkCyJOjuUkKgUweU6YpXAdY7CoZY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737378114;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sMuASHgpa8xlLCWpcGu3D5FxO0uCIpRpMtTeVpDuzaU=;
	b=RJNbFmPJ0+AY6R0Zb4j9DtKQlZEZrZ+FhETFHabXXh3shH/iEhvX/ac9O0CT9XUYiuzl5E
	ue995al4MEa35NCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7344E139D2;
	Mon, 20 Jan 2025 13:01:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qETRGUFJjmc4XQAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Mon, 20 Jan 2025 13:01:53 +0000
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
	Stanimir Varbanov <svarbanov@suse.de>,
	stable@vger.kernel.org
Subject: [PATCH v5 -next 09/11] PCI: brcmstb: Fix for missing of_node_put
Date: Mon, 20 Jan 2025 15:01:17 +0200
Message-ID: <20250120130119.671119-10-svarbanov@suse.de>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250120130119.671119-1-svarbanov@suse.de>
References: <20250120130119.671119-1-svarbanov@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 769C71F7B8
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[23];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[linutronix.de,kernel.org,broadcom.com,gmail.com,google.com,linux.com,pengutronix.de,suse.com,raspberrypi.com,suse.de,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email];
	TAGGED_RCPT(0.00)[dt];
	R_RATELIMIT(0.00)[to_ip_from(RLw7mkaud87zuqqztkur5718rm)];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_050156_059353_E3E81FE1 
X-CRM114-Status: GOOD (  13.35  )
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

A call to of_parse_phandle() increments refcount, of_node_put must be
called when done the work on it. Fix missing of_node_put() on the
msi_np device node by using scope based of_node_put() cleanups.

Cc: stable@vger.kernel.org # v5.10+
Fixes: 40ca1bf580ef ("PCI: brcmstb: Add MSI support")
Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
---
v4 -> v5:
 - New patch in the series.

 drivers/pci/controller/pcie-brcmstb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index 744fe1a4cf9c..546056f7f0d3 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -1844,7 +1844,8 @@ static struct pci_ops brcm7425_pcie_ops = {
 
 static int brcm_pcie_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node, *msi_np;
+	struct device_node *msi_np __free(device_node) = NULL;
+	struct device_node *np = pdev->dev.of_node;
 	struct pci_host_bridge *bridge;
 	const struct pcie_cfg_data *data;
 	struct brcm_pcie *pcie;
-- 
2.47.0


