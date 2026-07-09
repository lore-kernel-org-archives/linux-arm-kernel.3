Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76AD4C44503
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 08:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V0BDPOx5/TOCEfhnUdGgadc+xzKGAGVOIkKWWlMHjtk=; b=aC/zJmU7VigC38ZGX3JzubfdJx
	ZGoxsT7qtky6q/Zj3qoSqn18h1baeN6hbezS4bVkWCH5giTKJ6SoN2EZRup7VEPbwdPO4H3sg+pBo
	RqLQrCA3XxlXQ3Da66CYcHmGWi8KCRqundocCIX9YZ7e7N4o43mwRoxMZLeBrGPrTX1vaTx9b5W5y
	QKNBi1lo/TqKO418nJO5hZwT7nG52QNQkUIMEv8N+RMlx6NkVRv5pRTU7AuYB+cBwaYaQImCzfH7C
	zo8m4IjbbylODCyq5UdWZTmw+05GIEnPXlAlopQPPysdlfkMxcZ48quzoJOM5P7jIpfs8GWONTn8T
	5PA3U29w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkPF-00000001U2a-0rEJ;
	Thu, 09 Jul 2026 08:46:53 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkPA-00000001Ttn-2WQo;
	Thu, 09 Jul 2026 08:46:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783586804;
	bh=qzkG82fCo2yCvES8L+QvDNPl1CSrAGsEROUCjOB7JQA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QGdBVPxufFk462JAQ3czVGczYRbRWJoJcyK9oeyrd7tQZehU2lWJzExKr1kq6xcY3
	 UWJSfNNWG89PQCWrZaVvDEN0ZwcIpfhNF96wFuDQO2aDBZcura4cK4gyGrDBwx3R8S
	 VOuWu4TB2riIZ2vCG0hwKpnQDdzdzUpHffydrdJHV4qjOnoK8IVuBGHFT9PfZtAzg3
	 EqeBIgimodbuRSKZuEUIQKhgzPvROpesd07wLUVYH/iiX1FlrFOgUfhjzI+2Gy8+Im
	 JESRQ5J8RmRA/XOl22mYpYlz5YzA/l2m5HM/ODSz8yrRAxVQ9tYbs276YSWHf/qROV
	 7AfqpbThMxlHg==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B0F1017E0E04;
	Thu, 09 Jul 2026 10:46:43 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: ulfh@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	nfraprado@collabora.com,
	irving-ch.lin@mediatek.com,
	macpaul.lin@mediatek.com,
	aford173@gmail.com,
	mbrugger@suse.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	justin.yeh@mediatek.com,
	kernel@collabora.com
Subject: [PATCH v3 5/5] pmdomain: mediatek: Add support for MT8196 HFRP DirectCTL domains
Date: Thu,  9 Jul 2026 10:46:35 +0200
Message-ID: <20260709084635.24912-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260709084635.24912-1-angelogioacchino.delregno@collabora.com>
References: <20260709084635.24912-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_014649_104409_9F1F5749 
X-CRM114-Status: GOOD (  12.20  )
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

Add support for the power domains provided by the HFRPSYS Power
Controller of the MT8196 SoC.
Those control power to the eDP and DP Transmitter IPs.

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/pmdomain/mediatek/mt8196-pm-domains.h | 27 +++++++++++++++++++
 drivers/pmdomain/mediatek/mtk-pm-domains.c    |  6 ++++-
 2 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/mediatek/mt8196-pm-domains.h b/drivers/pmdomain/mediatek/mt8196-pm-domains.h
index 2e4b28720659..d704c9fa9337 100644
--- a/drivers/pmdomain/mediatek/mt8196-pm-domains.h
+++ b/drivers/pmdomain/mediatek/mt8196-pm-domains.h
@@ -602,6 +602,27 @@ static const struct scpsys_hwv_domain_data hfrpsys_hwv_domain_data_mt8196[] = {
 	},
 };
 
+static const struct scpsys_domain_data hfrpsys_domain_data_mt8196[] = {
+	[MT8196_POWER_DOMAIN_EDPTX] = {
+		.name = "edp-tx",
+		.sta_mask = MT8196_PWR_ACK,
+		.sta2nd_mask = MT8196_PWR_ACK_2ND,
+		.ctl_offs = 0x74,
+		.pwr_sta_offs = 0x74,
+		.pwr_sta2nd_offs = 0x74,
+		.caps = MTK_SCPD_SIMPLE_PWRSEQ,
+	},
+	[MT8196_POWER_DOMAIN_DPTX] = {
+		.name = "dp-tx",
+		.sta_mask = MT8196_PWR_ACK,
+		.sta2nd_mask = MT8196_PWR_ACK_2ND,
+		.ctl_offs = 0x78,
+		.pwr_sta_offs = 0x78,
+		.pwr_sta2nd_offs = 0x78,
+		.caps = MTK_SCPD_SIMPLE_PWRSEQ,
+	},
+};
+
 static const struct scpsys_soc_data mt8196_scpsys_data = {
 	.domains_data = scpsys_domain_data_mt8196,
 	.num_domains = ARRAY_SIZE(scpsys_domain_data_mt8196),
@@ -616,6 +637,12 @@ static const struct scpsys_soc_data mt8196_scpsys_hwv_data = {
 	.type = SCPSYS_MTCMOS_TYPE_HW_VOTER,
 };
 
+static const struct scpsys_soc_data mt8196_hfrpsys_data = {
+	.domains_data = hfrpsys_domain_data_mt8196,
+	.num_domains = ARRAY_SIZE(hfrpsys_domain_data_mt8196),
+	.type = SCPSYS_MTCMOS_TYPE_DIRECT_CTL,
+};
+
 static const struct scpsys_soc_data mt8196_hfrpsys_hwv_data = {
 	.hwv_domains_data = hfrpsys_hwv_domain_data_mt8196,
 	.num_hwv_domains = ARRAY_SIZE(hfrpsys_hwv_domain_data_mt8196),
diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
index 632c5dcdceda..8309a4b46afb 100644
--- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
+++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
@@ -1071,7 +1071,7 @@ static void scpsys_remove_one_domain(struct scpsys_domain *pd)
 		if (scpsys_hwv_domain_is_enable_done(pd))
 			scpsys_hwv_power_off_internal(pd);
 	} else {
-		if (scpsys_domain_is_on(pd))
+		if (scpsys_domain_is_on(pd) || MTK_SCPD_CAPS(pd, MTK_SCPD_SIMPLE_PWRSEQ))
 			scpsys_power_off_internal(pd);
 	}
 
@@ -1288,6 +1288,10 @@ static const struct of_device_id scpsys_of_match[] = {
 		.compatible = "mediatek,mt8196-power-controller",
 		.data = &mt8196_scpsys_data,
 	},
+	{
+		.compatible = "mediatek,mt8196-hfrp-power-controller",
+		.data = &mt8196_hfrpsys_data,
+	},
 	{
 		.compatible = "mediatek,mt8196-hwv-hfrp-power-controller",
 		.data = &mt8196_hfrpsys_hwv_data,
-- 
2.54.0


