Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81342C83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 11:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hMDRYxtFeytWVDwOS0hNUOrP+NfQui6PnLWFs8lk2xc=; b=s7lhhAl0Kcl3bOlL37YVXSWUqj
	+y/ul9BWqh9F7ZsHo21jmPDtnY+PbQWDWglc4XTxorcuDAKFQXlFBt1ZL8IIVQMFp4SO0os3w9cOP
	LOFQyHocnzJW96hDqOBePdYd99Ce00fASpYfJRpxYssiHSuAowKTleWHCy5lNrltvDTBl/vsarf/y
	LCAvrO6LoFROLNYmnlJV1fNs1QfnzIC5EpMWNq5enIM7py7MCVXwtMJvY61RsX+JeJBqdWvaooOTi
	sA4M/Soz+tkv+Jk/M7DoBoJS3gIJvp1Zz7KjhDCeyrmYBk6sNOcTOqIAIiYUQRNa/dLixBDSG99D8
	j4ty2s8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYk8Q-00000002IDb-117p;
	Mon, 07 Jul 2025 11:35:46 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYjWI-00000002DBP-0K4S;
	Mon, 07 Jul 2025 10:56:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751885780;
	bh=ET/2n99K59BCvtfpKkwNLwUv6RmwwfRjPpRaSbab+BA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Icih2SeWq4BReVJcuNuRwVJoZqaBPPqiHUoBla1AmjeCP+nUvQrWr0KM/iS0BkS+n
	 a3vqoq0Izy5OGzhNvtzOYIQ0LFfUBhfKIuXPsD/Zm9//XnjOzxifRM/L7n9/ynNSN7
	 uVa8BR5jU2uj5VgmxQlgW2nu7/nBN0WNQYKatYEJKFUgL6V4TEoznJNFICb0DyZDOX
	 wFqdjdmtmEHEI/IqkixJoj/rxvTDSI5bKk2XyqOztLJuhog2KmcEduB47nYf+2Cy31
	 9EqLBmTWo/JbmYDhmZwnrUFble2QZS6+e2nG7v7nzgU9XRKX4Im+9As3IdIHTQk1c0
	 GGXxvBsK8Xu2A==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C064C17E1136;
	Mon,  7 Jul 2025 12:56:19 +0200 (CEST)
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
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
Subject: [PATCH v2 05/10] pmdomain: mediatek: Handle SoCs with inverted SRAM power-down bits
Date: Mon,  7 Jul 2025 12:56:00 +0200
Message-ID: <20250707105605.98248-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707105605.98248-1-angelogioacchino.delregno@collabora.com>
References: <20250707105605.98248-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_035622_265558_CDC2EBAE 
X-CRM114-Status: GOOD (  15.18  )
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

Some SoCs, and even some subsystems in the same SoC, may have the
logic for SRAM power-down inverted, as in, setting the bit means
"power down" and unsetting means "power up": this is because some
hardware subsystems use this as a power-lock indication and some
use this as a power down one (for example, usually, the modem ss
has it inverted!).

In preparation for adding support for power domains with inverted
SRAM_PDN bits, add a new MTK_SCPD_SRAM_PDN_INVERTED flag and check
for it in scpsys_sram_enable() and scpsys_sram_disable().

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/pmdomain/mediatek/mtk-pm-domains.c | 27 ++++++++++++++++------
 drivers/pmdomain/mediatek/mtk-pm-domains.h |  1 +
 2 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
index 9da18238496b..dd7f5f377271 100644
--- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
+++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
@@ -79,16 +79,23 @@ static bool scpsys_domain_is_on(struct scpsys_domain *pd)
 
 static int scpsys_sram_enable(struct scpsys_domain *pd)
 {
-	u32 pdn_ack = pd->data->sram_pdn_ack_bits;
+	u32 expected_ack, pdn_ack = pd->data->sram_pdn_ack_bits;
 	struct scpsys *scpsys = pd->scpsys;
 	unsigned int tmp;
 	int ret;
 
-	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, pd->data->sram_pdn_bits);
+	if (MTK_SCPD_CAPS(pd, MTK_SCPD_SRAM_PDN_INVERTED)) {
+		regmap_set_bits(scpsys->base, pd->data->ctl_offs, pd->data->sram_pdn_bits);
+		expected_ack = pdn_ack;
+	} else {
+		regmap_clear_bits(scpsys->base, pd->data->ctl_offs, pd->data->sram_pdn_bits);
+		expected_ack = 0;
+	}
 
 	/* Either wait until SRAM_PDN_ACK all 1 or 0 */
 	ret = regmap_read_poll_timeout(scpsys->base, pd->data->ctl_offs, tmp,
-				       (tmp & pdn_ack) == 0, MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
+				       (tmp & pdn_ack) == expected_ack,
+				       MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
 	if (ret < 0)
 		return ret;
 
@@ -103,7 +110,7 @@ static int scpsys_sram_enable(struct scpsys_domain *pd)
 
 static int scpsys_sram_disable(struct scpsys_domain *pd)
 {
-	u32 pdn_ack = pd->data->sram_pdn_ack_bits;
+	u32 expected_ack, pdn_ack = pd->data->sram_pdn_ack_bits;
 	struct scpsys *scpsys = pd->scpsys;
 	unsigned int tmp;
 
@@ -113,12 +120,18 @@ static int scpsys_sram_disable(struct scpsys_domain *pd)
 		regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_SRAM_ISOINT_B_BIT);
 	}
 
-	regmap_set_bits(scpsys->base, pd->data->ctl_offs, pd->data->sram_pdn_bits);
+	if (MTK_SCPD_CAPS(pd, MTK_SCPD_SRAM_PDN_INVERTED)) {
+		regmap_clear_bits(scpsys->base, pd->data->ctl_offs, pd->data->sram_pdn_bits);
+		expected_ack = 0;
+	} else {
+		regmap_set_bits(scpsys->base, pd->data->ctl_offs, pd->data->sram_pdn_bits);
+		expected_ack = pdn_ack;
+	}
 
 	/* Either wait until SRAM_PDN_ACK all 1 or 0 */
 	return regmap_read_poll_timeout(scpsys->base, pd->data->ctl_offs, tmp,
-					(tmp & pdn_ack) == pdn_ack, MTK_POLL_DELAY_US,
-					MTK_POLL_TIMEOUT);
+					(tmp & pdn_ack) == expected_ack,
+					MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
 }
 
 static struct regmap *scpsys_bus_protect_get_regmap(struct scpsys_domain *pd,
diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.h b/drivers/pmdomain/mediatek/mtk-pm-domains.h
index 4f2d331a866a..fbbfb23a8739 100644
--- a/drivers/pmdomain/mediatek/mtk-pm-domains.h
+++ b/drivers/pmdomain/mediatek/mtk-pm-domains.h
@@ -13,6 +13,7 @@
 #define MTK_SCPD_EXT_BUCK_ISO		BIT(6)
 #define MTK_SCPD_HAS_INFRA_NAO		BIT(7)
 #define MTK_SCPD_STRICT_BUS_PROTECTION	BIT(8)
+#define MTK_SCPD_SRAM_PDN_INVERTED	BIT(9)
 #define MTK_SCPD_CAPS(_scpd, _x)	((_scpd)->data->caps & (_x))
 
 #define SPM_VDE_PWR_CON			0x0210
-- 
2.49.0


