Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7136D0C84D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 11:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AESahKqBggsGIK0qXdPh5aUWgMOR2EsyLBeuvnt03vI=; b=gAM8Ax03OCAviy0XJquxgQ6Chf
	NW463WCH0vn8bKs34bOHSt5mAC8kYJX5PgSvQwvF3Dubt5qvhnMBKow6pMkQ6VSxDYwZhVzRqtbx9
	/gPsKXBa2uGtomymDAamOAXDou+MBjTF5q9h4OPHVghC0dEfsyQ2UFsg4NP4gwtz+YeIRFyzSlj7b
	+Mo7MnP02GwW1ne1Zf2kExv3SD+Odn+D7pHEXd9Sx5IkIwM44l/a7d2G3axcSchWh0S/7XeGip5ta
	pxit6JLtXqUDnexPoN5MKhZl1fYNEf8qhQRT/66LuEWYAo0Maoa2yvBwVsJEf+Ku+eydyUQ9ixOw4
	PSUBrCeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfc8g-00000006xRY-1JDM;
	Tue, 13 Jan 2026 11:00:42 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfc8J-00000006x5P-2sOs;
	Tue, 13 Jan 2026 11:00:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768302016;
	bh=mFVa0fwuvFYnyoWskioZV1v6ax8u0bRsK+JjDpsGtog=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qx4d8zXt2CNE/G5w1TuSw0X6NDGNnHsTY7toxj7UvqRrTiIyojaJHCYHxliM2r+m6
	 hoRU/79a9urlPS2dd4OIvPXzjZwbgpkYwNvXC+pHDQDJ1Yy5nreIlT6crgl+/E+Xu0
	 8XWF1LZHzKGfVaTVEVljtsFmObanmhMLJPOJnyXBqbWqAbqDaKvFByMHqRW0bPScIa
	 h4zx8S5N87Wye5IdD9EBxUCLxd3cT0kBjSQ/Nio1f9TI4TbGYev6UqJLi1ew6xrZWC
	 OGYCtpefgFCehLrFUfZDEPbhEIbWIpZVN6cVf/mVAv7St4hwzbOkgNvGqLq1cm2i7O
	 A8663bGa4vzVw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5717517E1525;
	Tue, 13 Jan 2026 12:00:16 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ulf.hansson@linaro.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 3/5] pmdomain: mediatek: scpsys: Add MT7622 Audio power domain to legacy driver
Date: Tue, 13 Jan 2026 12:00:10 +0100
Message-ID: <20260113110012.36984-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113110012.36984-1-angelogioacchino.delregno@collabora.com>
References: <20260113110012.36984-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_030025_493229_5E4B42AE 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
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

Add the Audio power domain of the MT7622 SoC to the legacy
mtk-scpsys driver (as this legacy SoC is supported only there).

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/pmdomain/mediatek/mtk-scpsys.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/pmdomain/mediatek/mtk-scpsys.c b/drivers/pmdomain/mediatek/mtk-scpsys.c
index 1a80c1537a43..efc8f276ffce 100644
--- a/drivers/pmdomain/mediatek/mtk-scpsys.c
+++ b/drivers/pmdomain/mediatek/mtk-scpsys.c
@@ -867,6 +867,16 @@ static const struct scp_domain_data scp_domain_data_mt7622[] = {
 		.bus_prot_mask = MT7622_TOP_AXI_PROT_EN_WB,
 		.caps = MTK_SCPD_ACTIVE_WAKEUP | MTK_SCPD_FWAIT_SRAM,
 	},
+	[MT7622_POWER_DOMAIN_AUDIO] = {
+		.name = "audsys",
+		.sta_mask = PWR_STATUS_AUDIO,
+		.ctl_offs = SPM_AUDIO_PWR_CON,
+		.sram_pdn_bits = GENMASK(11, 8),
+		.sram_pdn_ack_bits = GENMASK(15, 12),
+		.clk_id = {CLK_NONE},
+		.bus_prot_mask = MT7622_TOP_AXI_PROT_EN_HIF1,
+		.caps = MTK_SCPD_ACTIVE_WAKEUP,
+	},
 };
 
 /*
-- 
2.52.0


