Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B1BD0C608
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 13:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Asyrs79reDImQyOzbVRw7HVB5RRZuAAIIzsrop58QWE=; b=ifVcR7eV0cij6frgZs6EFM7ZCn
	H+Wuhi0a/f7u+i1gsbVrf5FP15OD/Euqm4vGEWqNDDrtBUQxHXfi1tN0Dc++/LLAHhIUKTFOjicG6
	6zG369d4+d0mPBTL6NXN0lMf6YAgUHVaH3Q7mJBY1SvdXI3mPpEUZ4zJpSAjQZiRLfUUr1GebbYq/
	HXMWxLu7ENNXU/huR6aoUhu3nod4kmSY8zyuo2DE8cobMRpLP09/OSUgWbimTxFgeFc2lEqkcbG4J
	21uGF97J2IDr464pZmtTfPKZFJ5Oy2Lg8mzH/MLjHnZ0r9rDGT+KaXMV3okK1duBzmISxFJkzmOOJ
	ykgQw7FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Jyz-00000003kih-053H;
	Fri, 25 Oct 2024 13:04:01 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4JhB-00000003hv1-04lF;
	Fri, 25 Oct 2024 12:45:41 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 911CD1FE16;
	Fri, 25 Oct 2024 12:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1729860335; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Asyrs79reDImQyOzbVRw7HVB5RRZuAAIIzsrop58QWE=;
	b=kWjJiNl1knw4BzVcDUgzsWbZCahyr/DeYk4rdLtkjEKNcBkWQa8bb0ssG07wIKT12T8mKk
	hfS6yaYpy1xgfiZOQsWFy0+5sao/JKybpepCNm96W96YgMKfAFEzW1LmUaP/Ho2Gew3Stj
	8foBXxKU9EzsG40ApbnGNIWezqTTXhU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1729860335;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Asyrs79reDImQyOzbVRw7HVB5RRZuAAIIzsrop58QWE=;
	b=q9qIxlQc6E94azrWokO3eBcp7oK8P5WRy9MfojL2I3OyhPC9lYViF34Oe/FnvH3gr9BDXH
	BdaqR4/li2ZFbWCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1729860335; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Asyrs79reDImQyOzbVRw7HVB5RRZuAAIIzsrop58QWE=;
	b=kWjJiNl1knw4BzVcDUgzsWbZCahyr/DeYk4rdLtkjEKNcBkWQa8bb0ssG07wIKT12T8mKk
	hfS6yaYpy1xgfiZOQsWFy0+5sao/JKybpepCNm96W96YgMKfAFEzW1LmUaP/Ho2Gew3Stj
	8foBXxKU9EzsG40ApbnGNIWezqTTXhU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1729860335;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Asyrs79reDImQyOzbVRw7HVB5RRZuAAIIzsrop58QWE=;
	b=q9qIxlQc6E94azrWokO3eBcp7oK8P5WRy9MfojL2I3OyhPC9lYViF34Oe/FnvH3gr9BDXH
	BdaqR4/li2ZFbWCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7E867136F5;
	Fri, 25 Oct 2024 12:45:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cPeAHO6SG2fzOAAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Fri, 25 Oct 2024 12:45:34 +0000
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
Subject: [PATCH v4 07/10] PCI: brcmstb: Add bcm2712 support
Date: Fri, 25 Oct 2024 15:45:12 +0300
Message-ID: <20241025124515.14066-8-svarbanov@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241025124515.14066-1-svarbanov@suse.de>
References: <20241025124515.14066-1-svarbanov@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-5.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_CC(0.00)[linutronix.de,kernel.org,broadcom.com,gmail.com,google.com,linux.com,pengutronix.de,suse.com,raspberrypi.com,suse.de];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_RATELIMIT(0.00)[to_ip_from(RL7mwea5a3cdyragbzqhrtit3y)];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_054537_361995_3A5BF048 
X-CRM114-Status: GOOD (  17.39  )
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

Add bare minimum amount of changes in order to support PCIe RC hardware
IP found on RPi5. The PCIe controller on bcm2712 is based on bcm7712 and
as such it inherits register offsets, perst, bridge_reset ops and inbound
windows count.
Although, the implementation for bcm2712 needs a workaround related to the
control of the bridge_reset where turning off of the root port must not
shutdown the bridge_reset and this must be avoided. To implement this
workaround a quirks field is introduced in pcie_cfg_data struct.

Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
v3 -> v4:
 - Merged "PCI: brcmstb: Avoid turn off of bridge reset" from v3 here
   in this patch (Bjorn)

 drivers/pci/controller/pcie-brcmstb.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index af01a7915c94..d970a76aa9ef 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -234,10 +234,20 @@ struct inbound_win {
 	u64 cpu_addr;
 };
 
+/*
+ * The RESCAL block is tied to PCIe controller #1, regardless of the number of
+ * controllers, and turning off PCIe controller #1 prevents access to the RESCAL
+ * register blocks, therefore no other controller can access this register
+ * space, and depending upon the bus fabric we may get a timeout (UBUS/GISB),
+ * or a hang (AXI).
+ */
+#define CFG_QUIRK_AVOID_BRIDGE_SHUTDOWN		BIT(0)
+
 struct pcie_cfg_data {
 	const int *offsets;
 	const enum pcie_soc_base soc_base;
 	const bool has_phy;
+	const u32 quirks;
 	u8 num_inbound_wins;
 	int (*perst_set)(struct brcm_pcie *pcie, u32 val);
 	int (*bridge_sw_init_set)(struct brcm_pcie *pcie, u32 val);
@@ -1534,8 +1544,9 @@ static int brcm_pcie_turn_off(struct brcm_pcie *pcie)
 	u32p_replace_bits(&tmp, 1, PCIE_MISC_HARD_PCIE_HARD_DEBUG_SERDES_IDDQ_MASK);
 	writel(tmp, base + HARD_DEBUG(pcie));
 
-	/* Shutdown PCIe bridge */
-	ret = pcie->bridge_sw_init_set(pcie, 1);
+	if (!(pcie->cfg->quirks & CFG_QUIRK_AVOID_BRIDGE_SHUTDOWN))
+		/* Shutdown PCIe bridge */
+		ret = pcie->cfg->bridge_sw_init_set(pcie, 1);
 
 	return ret;
 }
@@ -1745,6 +1756,15 @@ static const struct pcie_cfg_data bcm2711_cfg = {
 	.num_inbound_wins = 3,
 };
 
+static const struct pcie_cfg_data bcm2712_cfg = {
+	.offsets	= pcie_offsets_bcm7712,
+	.soc_base	= BCM7712,
+	.perst_set	= brcm_pcie_perst_set_7278,
+	.bridge_sw_init_set = brcm_pcie_bridge_sw_init_set_generic,
+	.quirks		= CFG_QUIRK_AVOID_BRIDGE_SHUTDOWN,
+	.num_inbound_wins = 10,
+};
+
 static const struct pcie_cfg_data bcm4908_cfg = {
 	.offsets	= pcie_offsets,
 	.soc_base	= BCM4908,
@@ -1796,6 +1816,7 @@ static const struct pcie_cfg_data bcm7712_cfg = {
 
 static const struct of_device_id brcm_pcie_match[] = {
 	{ .compatible = "brcm,bcm2711-pcie", .data = &bcm2711_cfg },
+	{ .compatible = "brcm,bcm2712-pcie", .data = &bcm2712_cfg },
 	{ .compatible = "brcm,bcm4908-pcie", .data = &bcm4908_cfg },
 	{ .compatible = "brcm,bcm7211-pcie", .data = &generic_cfg },
 	{ .compatible = "brcm,bcm7216-pcie", .data = &bcm7216_cfg },
-- 
2.43.0


