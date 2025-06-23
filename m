Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBCC8C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 15:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B2cOOlQvdb2LkhBGmnIPQDNXwWt9m3UVq9V8gda9Ofo=; b=tx95HmFBB8nCmyTKqoRpcXQSId
	IYGogKBUUo03f5rP7pDmptp3VG3lH7HGvj/tGdaKywa2Q/xXdZqCT26NNfRw86z/J5mm+SGV28gAP
	y4U4xxyt7ixEdGGs7SwcqDMyEXVxagIM1wVEBSXP3p45rzyW+sDARHzPbkwqSe4ESUXQVi1VlmHdA
	n5Dbzalspa/OfIP7nRXaDhN38b/7T751Y9t5/nlcl6RdgTf7rlcZXRQc0Sg3oyX86GNpbXTCzPvxP
	MUDZDeXVsUhxCmPbVRR7LR2PtLyQosxPy6PWrBo+nb+G0J9mj1xvXgzPoTBFwOO1BRjF4QFyb0vPt
	e0bB+3xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTix1-00000003CWF-28fx;
	Mon, 23 Jun 2025 15:19:15 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfsL-00000002bHw-0Fyh;
	Mon, 23 Jun 2025 12:02:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750680131;
	bh=PHnrPrLPZrEAkmVxB1XCxlvMbcWS8VMEtIIdU8TdwDY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dqaQ63OeW15GeUeHSetEPOuh7EAifyIRSD0MTjW7pg/eDc8AE2aaquyumN4RJnJSa
	 GKzcyRaEP8VfS9kEjBdyOxeGG/5dxupZ5F8OWeWhzFWBgYDgBPIRn/wTwD5AC69eQc
	 K95hnZuIF/v8c8dYlkyqTGk3/yDw08W1KVgALUzYT24x71lalb1LakIUEYMZqNBM+y
	 huOZO3mJsC23Q0HTeUCa53+G6XnDKZtx6hbFNsBRqdaV7CoyUyNalVOKQn1jUPBAFx
	 y9NlzBI5rNkIBN8kobU76Qd6EDFDXHyvQTjsFRNbE/fX0bqfurSk/EcexpGjl4EPGK
	 QMAnuCygfliAA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E04AD17E3659;
	Mon, 23 Jun 2025 14:02:10 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ulf.hansson@linaro.org,
	y.oudjana@protonmail.com,
	fshao@chromium.org,
	wenst@chromium.org,
	lihongbo22@huawei.com,
	mandyjh.liu@mediatek.com,
	mbrugger@suse.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v1 13/13] pmdomain: mediatek: Add support for MT8196 HFRPSYS power domains
Date: Mon, 23 Jun 2025 14:01:54 +0200
Message-ID: <20250623120154.109429-14-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623120154.109429-1-angelogioacchino.delregno@collabora.com>
References: <20250623120154.109429-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_050213_249229_C6A06CD1 
X-CRM114-Status: GOOD (  11.10  )
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

Add support for the HFRPSYS Multimedia power domains found in the
MediaTek MT8196 Chromebook SoC.
Those power domains are all managed by the Hardware Voter MCU.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/pmdomain/mediatek/mt8196-pm-domains.h | 239 ++++++++++++++++++
 drivers/pmdomain/mediatek/mtk-pm-domains.c    |   4 +
 2 files changed, 243 insertions(+)

diff --git a/drivers/pmdomain/mediatek/mt8196-pm-domains.h b/drivers/pmdomain/mediatek/mt8196-pm-domains.h
index ce8d594c46f8..2e4b28720659 100644
--- a/drivers/pmdomain/mediatek/mt8196-pm-domains.h
+++ b/drivers/pmdomain/mediatek/mt8196-pm-domains.h
@@ -369,6 +369,239 @@ static const struct scpsys_hwv_domain_data scpsys_hwv_domain_data_mt8196[] = {
 	},
 };
 
+static const struct scpsys_hwv_domain_data hfrpsys_hwv_domain_data_mt8196[] = {
+	[MT8196_POWER_DOMAIN_VDE0] = {
+		.name = "vde0",
+		.set = 0x0218,
+		.clr = 0x021C,
+		.done = 0x141C,
+		.en = 0x1410,
+		.set_sta = 0x146C,
+		.clr_sta = 0x1470,
+		.setclr_bit = 7,
+	},
+	[MT8196_POWER_DOMAIN_VDE1] = {
+		.name = "vde1",
+		.set = 0x0218,
+		.clr = 0x021C,
+		.done = 0x141C,
+		.en = 0x1410,
+		.set_sta = 0x146C,
+		.clr_sta = 0x1470,
+		.setclr_bit = 8,
+	},
+	[MT8196_POWER_DOMAIN_VDE_VCORE0] = {
+		.name = "vde-vcore0",
+		.set = 0x0218,
+		.clr = 0x021C,
+		.done = 0x141C,
+		.en = 0x1410,
+		.set_sta = 0x146C,
+		.clr_sta = 0x1470,
+		.setclr_bit = 9,
+	},
+	[MT8196_POWER_DOMAIN_VEN0] = {
+		.name = "ven0",
+		.set = 0x0218,
+		.clr = 0x021C,
+		.done = 0x141C,
+		.en = 0x1410,
+		.set_sta = 0x146C,
+		.clr_sta = 0x1470,
+		.setclr_bit = 10,
+	},
+	[MT8196_POWER_DOMAIN_VEN1] = {
+		.name = "ven1",
+		.set = 0x0218,
+		.clr = 0x021C,
+		.done = 0x141C,
+		.en = 0x1410,
+		.set_sta = 0x146C,
+		.clr_sta = 0x1470,
+		.setclr_bit = 11,
+	},
+	[MT8196_POWER_DOMAIN_VEN2] = {
+		.name = "ven2",
+		.set = 0x0218,
+		.clr = 0x021C,
+		.done = 0x141C,
+		.en = 0x1410,
+		.set_sta = 0x146C,
+		.clr_sta = 0x1470,
+		.setclr_bit = 12,
+	},
+	[MT8196_POWER_DOMAIN_DISP_VCORE] = {
+		.name = "disp-vcore",
+		.set = 0x0218,
+		.clr = 0x021C,
+		.done = 0x141C,
+		.en = 0x1410,
+		.set_sta = 0x146C,
+		.clr_sta = 0x1470,
+		.setclr_bit = 24,
+	},
+	[MT8196_POWER_DOMAIN_DIS0_DORMANT] = {
+		.name = "dis0-dormant",
+		.set = 0x0218,
+		.clr = 0x021C,
+		.done = 0x141C,
+		.en = 0x1410,
+		.set_sta = 0x146C,
+		.clr_sta = 0x1470,
+		.setclr_bit = 25,
+	},
+	[MT8196_POWER_DOMAIN_DIS1_DORMANT] = {
+		.name = "dis1-dormant",
+		.set = 0x0218,
+		.clr = 0x021C,
+		.done = 0x141C,
+		.en = 0x1410,
+		.set_sta = 0x146C,
+		.clr_sta = 0x1470,
+		.setclr_bit = 26,
+	},
+	[MT8196_POWER_DOMAIN_OVL0_DORMANT] = {
+		.name = "ovl0-dormant",
+		.set = 0x0218,
+		.clr = 0x021C,
+		.done = 0x141C,
+		.en = 0x1410,
+		.set_sta = 0x146C,
+		.clr_sta = 0x1470,
+		.setclr_bit = 27,
+	},
+	[MT8196_POWER_DOMAIN_OVL1_DORMANT] = {
+		.name = "ovl1-dormant",
+		.set = 0x0218,
+		.clr = 0x021C,
+		.done = 0x141C,
+		.en = 0x1410,
+		.set_sta = 0x146C,
+		.clr_sta = 0x1470,
+		.setclr_bit = 28,
+	},
+	[MT8196_POWER_DOMAIN_DISP_EDPTX_DORMANT] = {
+		.name = "disp-edptx-dormant",
+		.set = 0x0218,
+		.clr = 0x021C,
+		.done = 0x141C,
+		.en = 0x1410,
+		.set_sta = 0x146C,
+		.clr_sta = 0x1470,
+		.setclr_bit = 29,
+	},
+	[MT8196_POWER_DOMAIN_DISP_DPTX_DORMANT] = {
+		.name = "disp-dptx-dormant",
+		.set = 0x0218,
+		.clr = 0x021C,
+		.done = 0x141C,
+		.en = 0x1410,
+		.set_sta = 0x146C,
+		.clr_sta = 0x1470,
+		.setclr_bit = 30,
+	},
+	[MT8196_POWER_DOMAIN_MML0_SHUTDOWN] = {
+		.name = "mml0-shutdown",
+		.set = 0x0218,
+		.clr = 0x021C,
+		.done = 0x141C,
+		.en = 0x1410,
+		.set_sta = 0x146C,
+		.clr_sta = 0x1470,
+		.setclr_bit = 31,
+	},
+	[MT8196_POWER_DOMAIN_MML1_SHUTDOWN] = {
+		.name = "mml1-shutdown",
+		.set = 0x0220,
+		.clr = 0x0224,
+		.done = 0x142C,
+		.en = 0x1420,
+		.set_sta = 0x1474,
+		.clr_sta = 0x1478,
+		.setclr_bit = 0,
+	},
+	[MT8196_POWER_DOMAIN_MM_INFRA0] = {
+		.name = "mm-infra0",
+		.set = 0x0220,
+		.clr = 0x0224,
+		.done = 0x142C,
+		.en = 0x1420,
+		.set_sta = 0x1474,
+		.clr_sta = 0x1478,
+		.setclr_bit = 1,
+	},
+	[MT8196_POWER_DOMAIN_MM_INFRA1] = {
+		.name = "mm-infra1",
+		.set = 0x0220,
+		.clr = 0x0224,
+		.done = 0x142C,
+		.en = 0x1420,
+		.set_sta = 0x1474,
+		.clr_sta = 0x1478,
+		.setclr_bit = 2,
+	},
+	[MT8196_POWER_DOMAIN_MM_INFRA_AO] = {
+		.name = "mm-infra-ao",
+		.set = 0x0220,
+		.clr = 0x0224,
+		.done = 0x142C,
+		.en = 0x1420,
+		.set_sta = 0x1474,
+		.clr_sta = 0x1478,
+		.setclr_bit = 3,
+	},
+	[MT8196_POWER_DOMAIN_CSI_BS_RX] = {
+		.name = "csi-bs-rx",
+		.set = 0x0220,
+		.clr = 0x0224,
+		.done = 0x142C,
+		.en = 0x1420,
+		.set_sta = 0x1474,
+		.clr_sta = 0x1478,
+		.setclr_bit = 5,
+	},
+	[MT8196_POWER_DOMAIN_CSI_LS_RX] = {
+		.name = "csi-ls-rx",
+		.set = 0x0220,
+		.clr = 0x0224,
+		.done = 0x142C,
+		.en = 0x1420,
+		.set_sta = 0x1474,
+		.clr_sta = 0x1478,
+		.setclr_bit = 6,
+	},
+	[MT8196_POWER_DOMAIN_DSI_PHY0] = {
+		.name = "dsi-phy0",
+		.set = 0x0220,
+		.clr = 0x0224,
+		.done = 0x142C,
+		.en = 0x1420,
+		.set_sta = 0x1474,
+		.clr_sta = 0x1478,
+		.setclr_bit = 7,
+	},
+	[MT8196_POWER_DOMAIN_DSI_PHY1] = {
+		.name = "dsi-phy1",
+		.set = 0x0220,
+		.clr = 0x0224,
+		.done = 0x142C,
+		.en = 0x1420,
+		.set_sta = 0x1474,
+		.clr_sta = 0x1478,
+		.setclr_bit = 8,
+	},
+	[MT8196_POWER_DOMAIN_DSI_PHY2] = {
+		.name = "dsi-phy2",
+		.set = 0x0220,
+		.clr = 0x0224,
+		.done = 0x142C,
+		.en = 0x1420,
+		.set_sta = 0x1474,
+		.clr_sta = 0x1478,
+		.setclr_bit = 9,
+	},
+};
+
 static const struct scpsys_soc_data mt8196_scpsys_data = {
 	.domains_data = scpsys_domain_data_mt8196,
 	.num_domains = ARRAY_SIZE(scpsys_domain_data_mt8196),
@@ -383,4 +616,10 @@ static const struct scpsys_soc_data mt8196_scpsys_hwv_data = {
 	.type = SCPSYS_MTCMOS_TYPE_HW_VOTER,
 };
 
+static const struct scpsys_soc_data mt8196_hfrpsys_hwv_data = {
+	.hwv_domains_data = hfrpsys_hwv_domain_data_mt8196,
+	.num_hwv_domains = ARRAY_SIZE(hfrpsys_hwv_domain_data_mt8196),
+	.type = SCPSYS_MTCMOS_TYPE_HW_VOTER,
+};
+
 #endif /* __SOC_MEDIATEK_MT8196_PM_DOMAINS_H */
diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
index bff78775baf7..6b807fc6ee72 100644
--- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
+++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
@@ -1158,6 +1158,10 @@ static const struct of_device_id scpsys_of_match[] = {
 		.compatible = "mediatek,mt8196-power-controller",
 		.data = &mt8196_scpsys_data,
 	},
+	{
+		.compatible = "mediatek,mt8196-hwv-hfrp-power-controller",
+		.data = &mt8196_hfrpsys_hwv_data,
+	},
 	{
 		.compatible = "mediatek,mt8196-hwv-scp-power-controller",
 		.data = &mt8196_scpsys_hwv_data,
-- 
2.49.0


