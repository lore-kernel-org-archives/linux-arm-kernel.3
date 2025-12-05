Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE80D2F7FE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 14:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fRDjY7Tx8sT8mrGzktxiajkLxjrELVxs+5ntdInWsWI=; b=KKB9d89hTDIHqILRk1I5VYjzQn
	kIDCTF9t6wr2OiKy7hn3uFaM05fADrbAqmtws81oye5t730Z22VLG8Xr/NgOgg2VY4R52fEnDysk6
	VieKW39IPooYIR7/QVKVw9k0DjB0Xdz+ZdRjbj2TSLE2cZmH9mYXBRAVzqZ/Up/ektGuA2siX3iOV
	9I0YmM8kApjemsDL/0i3hqw7ZjOhJkXB5nhcggVzV7eEVZRxfHku9yaXyK0jEANlc/Ho/bP8kIbDj
	uxcFc9Uyb4qtFS//CcbucGGmWNd5UOAc2ffG1KEiW+JHTetHXwTn52XlpeuUJaZRcGM2oJ4giedjj
	VnPhvcmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRWi3-00000009Zuh-3d0L;
	Fri, 05 Dec 2025 14:22:59 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRWhz-00000009ZrZ-0SEA;
	Fri, 05 Dec 2025 14:22:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764944572;
	bh=IOwQM3PEyoGk9c+YMqTQPC9Ut+gviCgxV81ozkF0ZiE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kw6/jWMtvdFR8GgKDF6dqeFAdLZy1ayqifYxDoFC6DjRUscZFWIW67AqjNmc8WLKq
	 Xg2Fmv+uhB3vBEzVmK8oOHE0UR6XKWda0fUGJ7i85AfVk8q2ao6ayjpW2BqO3UEhJD
	 3EJ24nY9MBe/XpqAz688d37M9B71nzsm7lJu5TIZy6HBOTHc+t7NRkamqH0g0mKbWV
	 8QrLrlqL5MxvdJoKvvkd01FwewMwGejS+8dZfY9NeS+f1EJE7hqOj9apeNXWFBIU7a
	 t/ZEF+7FY87IoGbkmKm/Yiyr4rVLhAZvap89zQgAyS0ZGleqUoCpZaI+zQmOX6nVuK
	 3cuzOjaA5FUuw==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7C98417E126B;
	Fri,  5 Dec 2025 15:22:51 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 05 Dec 2025 15:22:27 +0100
Subject: [PATCH 2/2] drm/mediatek: mtk_hdmi_ddc_v2: Fix multi-byte writes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-mtk-hdmi-ddc-v2-fixes-v1-2-260dd0d320f4@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764944570; l=3878;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=IOwQM3PEyoGk9c+YMqTQPC9Ut+gviCgxV81ozkF0ZiE=;
 b=ZHXJGgrjt5YRp7XxbPnmM+GfhkFFN8m9c+Eyr+pVK3MkP7ZDb6KBS5H+DVoblJUtWVYnRoYpV
 CrfSLQ1vBEqBluyd9Jq0wM8r7ttHzspDcIsVi2zqnnns9smNrsJd86l
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_062255_313018_A8871357 
X-CRM114-Status: GOOD (  16.23  )
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

Currently, the mtk_hdmi_ddc_v2 driver sends a i2c message by calling
the mtk_ddc_wr_one function for each byte of the payload to setup
SI2C_CTRL and DDC_CTRL registers, and perform a sequential write
transfer of one byte at a time to the target device. This leads to
incorrect transfers as the target address (at least) is also sent each
time.

So, rename mtk_ddc_wr_one function to mtk_ddcm_write_hdmi to match the
read function name (mtk_ddcm_read_hdmi) and modify its behaviour to
send all payload data in a single sequential write transfer by filling
the transfer fifo first then starting the transfer with a size equal to
the payload size and not one anymore.

Fixes: 8d0f79886273 ("drm/mediatek: Introduce HDMI/DDC v2 for MT8195/MT8188")
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c | 48 ++++++++++++++----------------
 1 file changed, 23 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c
index 6ae7cbba8cb6dacf46c2f7ab74a2d7446d698b69..d937219fdb7ee0ed6a4ac25e950f69f90ff431a3 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c
@@ -66,11 +66,19 @@ static int mtk_ddc_check_and_rise_low_bus(struct mtk_hdmi_ddc *ddc)
 	return 0;
 }
 
-static int mtk_ddc_wr_one(struct mtk_hdmi_ddc *ddc, u16 addr_id,
-			  u16 offset_id, u8 *wr_data)
+static int mtk_ddcm_write_hdmi(struct mtk_hdmi_ddc *ddc, u16 addr_id,
+			       u16 offset_id, u16 data_cnt, u8 *wr_data)
 {
 	u32 val;
-	int ret;
+	int ret, i;
+
+	/* Don't allow transfer with a size over than the transfer fifo size
+	 * (16 byte)
+	 */
+	if (data_cnt > 16) {
+		dev_err(ddc->dev, "Invalid DDCM write request\n");
+		return -EINVAL;
+	}
 
 	/* If down, rise bus for write operation */
 	mtk_ddc_check_and_rise_low_bus(ddc);
@@ -78,16 +86,21 @@ static int mtk_ddc_wr_one(struct mtk_hdmi_ddc *ddc, u16 addr_id,
 	regmap_update_bits(ddc->regs, HPD_DDC_CTRL, HPD_DDC_DELAY_CNT,
 			   FIELD_PREP(HPD_DDC_DELAY_CNT, DDC2_DLY_CNT));
 
+	/* In case there is no payload data, just do a single write for the
+	 * address only
+	 */
 	if (wr_data) {
-		regmap_write(ddc->regs, SI2C_CTRL,
-			     FIELD_PREP(SI2C_ADDR, SI2C_ADDR_READ) |
-			     FIELD_PREP(SI2C_WDATA, *wr_data) |
-			     SI2C_WR);
+		/* Fill transfer fifo with payload data */
+		for (i = 0; i < data_cnt; i++) {
+			regmap_write(ddc->regs, SI2C_CTRL,
+				     FIELD_PREP(SI2C_ADDR, SI2C_ADDR_READ) |
+				     FIELD_PREP(SI2C_WDATA, wr_data[i]) |
+				     SI2C_WR);
+		}
 	}
-
 	regmap_write(ddc->regs, DDC_CTRL,
 		     FIELD_PREP(DDC_CTRL_CMD, DDC_CMD_SEQ_WRITE) |
-		     FIELD_PREP(DDC_CTRL_DIN_CNT, wr_data == NULL ? 0 : 1) |
+		     FIELD_PREP(DDC_CTRL_DIN_CNT, wr_data == NULL ? 0 : data_cnt) |
 		     FIELD_PREP(DDC_CTRL_OFFSET, offset_id) |
 		     FIELD_PREP(DDC_CTRL_ADDR, addr_id));
 	usleep_range(1000, 1250);
@@ -260,24 +273,9 @@ static int mtk_hdmi_fg_ddc_data_read(struct mtk_hdmi_ddc *ddc, u16 b_dev,
 static int mtk_hdmi_ddc_fg_data_write(struct mtk_hdmi_ddc *ddc, u16 b_dev,
 				      u8 data_addr, u16 data_cnt, u8 *pr_data)
 {
-	int i, ret;
-
 	regmap_set_bits(ddc->regs, HDCP2X_POL_CTRL, HDCP2X_DIS_POLL_EN);
-	/*
-	 * In case there is no payload data, just do a single write for the
-	 * address only
-	 */
-	if (data_cnt == 0)
-		return mtk_ddc_wr_one(ddc, b_dev, data_addr, NULL);
-
-	i = 0;
-	do {
-		ret = mtk_ddc_wr_one(ddc, b_dev, data_addr + i, pr_data + i);
-		if (ret)
-			return ret;
-	} while (++i < data_cnt);
 
-	return 0;
+	return mtk_ddcm_write_hdmi(ddc, b_dev, data_addr, data_cnt, pr_data);
 }
 
 static int mtk_hdmi_ddc_v2_xfer(struct i2c_adapter *adapter, struct i2c_msg *msgs, int num)

-- 
2.52.0


