Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BCB3D32D61
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 14:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OUVCDvE1nmdwmp6+qgF8f04MuJ24YZ9tLZ5oyewDfXo=; b=cOL241uwcxtifZzaIRaj3sMIJv
	tCfhYqAe7VESG132Da7rVfjOMiYnZrSAO7ALaCEbuKwl0mvQS21cDKIyaDsorfg586jwU1+fzjw/z
	hfAy7n6kSqvyfLbp2Ka57BmWqStLIBwPbA/CzjTr7sESlIZLWSluAuORJB0wAyajsHym88nZ+96xj
	/ST39DydwecKk4DypSTpEGE5mkkK51BDToGKzIfW2Vyik9WL63urztLRfiTnGFfyH/CQXXDp3vhJq
	eRAWSMGAf5O5kGYd4V1p9T3uYXHoKProwaZXxPN1dVXnjFz9Q4lp+e/dO5sthuXuINuDE7M2nHoJs
	s4qmnXIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRWi2-00000009Ztk-1F6I;
	Fri, 05 Dec 2025 14:22:58 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRWhz-00000009Zrd-0SAc;
	Fri, 05 Dec 2025 14:22:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764944571;
	bh=pMwPFJMTtIP4dtXu2+MjCXusZPpj26s41YMtdPqsIt4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EW8jcJsl8AuIKgt2RnlWlpw5uHAJm4116T5wJU3U1sotbOySHa012kPNTE6ZPugbv
	 lfc2GLM23lNhhY8bFIPsZmnbHujBAK8bxIc1rMaXdibjUmcJ3zvWi1Ai6mT+Tcvqc/
	 NucXXe1iAgLdvm/hZziItXZA0/QCBpZq7zXZoMwmwIDdkX16UkA4w+q5Y9HbxQFRyg
	 KBuooa6EYQsl6Et9fh7eEiZAg16Fgw9UL9gsXS3C0Tv4Eo93EU+J6BAgHTV3fVtM3n
	 OKD+79Yby0ab4mrqst3a83TFDurxhWEOJeNcyx5v9B7yaT/5uHKU0JBfeRQJ8pSCyQ
	 t94vMxilcSqEg==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C3E5517E1149;
	Fri,  5 Dec 2025 15:22:50 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 05 Dec 2025 15:22:26 +0100
Subject: [PATCH 1/2] drm/mediatek: mtk_hdmi_ddc_v2: Add transfer abort on
 timeout cases
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-mtk-hdmi-ddc-v2-fixes-v1-1-260dd0d320f4@collabora.com>
References: <20251205-mtk-hdmi-ddc-v2-fixes-v1-0-260dd0d320f4@collabora.com>
In-Reply-To: <20251205-mtk-hdmi-ddc-v2-fixes-v1-0-260dd0d320f4@collabora.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 CK Hu <ck.hu@mediatek.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764944570; l=1808;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=pMwPFJMTtIP4dtXu2+MjCXusZPpj26s41YMtdPqsIt4=;
 b=IjONvCPU1h33wadF1IH3+uR6UHWidUH2F80MCy1EokeaQlxCEKOuMrbZFVVpXy3voIsmgiWJY
 GjFZaRMC5owAXNkD5kAGFZL6Iz2rL06MN+OO/YUROptJlgeIhhc20N5
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_062255_306053_D3DDB56D 
X-CRM114-Status: GOOD (  11.58  )
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

During a read or write transfer, the mtk_hdmi_ddc_v2 driver polls the
DDC_I2C_IN_PROG bit of HPD_DDC_STATUS register to check if the transfer
completes but do no particular action if a timeout is reached. It could
lead the next transfer attempts to fail because the faulty transfer was
not aborted. So, add in both low level read and write functions a abort
action by writing the DDC_CTRL register with the ABORT_XFER command
value.

Fixes: 8d0f79886273 ("drm/mediatek: Introduce HDMI/DDC v2 for MT8195/MT8188")
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c
index b844e2c10f28060baef64bd36c5464758b08e162..6ae7cbba8cb6dacf46c2f7ab74a2d7446d698b69 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c
@@ -96,6 +96,11 @@ static int mtk_ddc_wr_one(struct mtk_hdmi_ddc *ddc, u16 addr_id,
 				       !(val & DDC_I2C_IN_PROG), 500, 1000);
 	if (ret) {
 		dev_err(ddc->dev, "DDC I2C write timeout\n");
+
+		/* Abort transfer if it is still in progress */
+		regmap_update_bits(ddc->regs, DDC_CTRL, DDC_CTRL_CMD,
+				   FIELD_PREP(DDC_CTRL_CMD, DDC_CMD_ABORT_XFER));
+
 		return ret;
 	}
 
@@ -179,6 +184,11 @@ static int mtk_ddcm_read_hdmi(struct mtk_hdmi_ddc *ddc, u16 uc_dev,
 					       500 * (temp_length + 5));
 		if (ret) {
 			dev_err(ddc->dev, "Timeout waiting for DDC I2C\n");
+
+			/* Abort transfer if it is still in progress */
+			regmap_update_bits(ddc->regs, DDC_CTRL, DDC_CTRL_CMD,
+					   FIELD_PREP(DDC_CTRL_CMD, DDC_CMD_ABORT_XFER));
+
 			return ret;
 		}
 

-- 
2.52.0


