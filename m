Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE4B4C54FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 09:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XsIekLTQYOTU5oGFqFz5mX5TId09g7g67kA7mFXyrjk=; b=tM/JYgKqipFlfOSI7jiqH0Ty0J
	xzegSGRNYH/sJUAJC2qiTM8GAjDYCLujJ6oNZSdSMlNg3kuJDS7yBOl3vS0AM+u0YPCbxB4CixqrC
	mjQ4uW0J7qNKWOwKDecoAUJ3jhwE8a5fkBK0uQvqC/1Tj1EKqUO9Y62CvM3Bw6A36W7nZsWKB03dR
	cvzX0IImE8xlW0lOgVCvyCxq6OVcQDd3HJR4dzwe7ijJUKvRPHBQd9DmMqUpvx32d8/FJEoBXdCrf
	jakh6Gal8LcBVVtt/gZ+w7IWcH/vO1LyN7uJ0CoUnvqaTlGIOaL/yamHLCsFLU4KIXwPN87O4sX8m
	PqhgFXFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNRM-0000000A5Bd-49NC;
	Thu, 30 Jul 2026 09:52:36 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNPA-0000000A3bh-0xwQ;
	Thu, 30 Jul 2026 09:50:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785405018;
	bh=2tLiOkJgoK17kjFVllpXeaYfjsuvsvIVa1gJnJOhDho=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=M7TSXSLK2kJSmbFCOAbReJWFA2CXLLCZRRIqZkXvE3GRAa/ifZA+uiIy479vIscyp
	 8rODKSeRvbzT72/S8DJmK0hDBI941vjYlduroh6XK5tUTNG75KYApS65MkZ+W3nYo8
	 XRmsqKD6kv8P6lgRdph5he4JpGSIw21FSV9jxgkOHyjO91JAFghgrP6/gv0P23Z2SC
	 uFl1N+FhRc2Pm9xP/WsM33pZUfuwJD/mqfaZGZFFlkWqoUi1Zv6DswaUcBBikPJ0sE
	 X7bELe5fGcufmmt0A7nH81FpauDr1nqolx56+9edxfrZKGawG7pGGgd/trvCeY1ffd
	 VDxpmCtHfA7wA==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BC53917E0955;
	Thu, 30 Jul 2026 11:50:16 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 30 Jul 2026 11:49:11 +0200
Subject: [PATCH v10 15/26] scsi: ufs: mediatek: Rework _ufs_mtk_clk_scale
 error paths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-mt8196-ufs-v10-15-bc5ecef202dc@collabora.com>
References: <20260730-mt8196-ufs-v10-0-bc5ecef202dc@collabora.com>
In-Reply-To: <20260730-mt8196-ufs-v10-0-bc5ecef202dc@collabora.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Peter Wang <peter.wang@mediatek.com>, 
 Chaotian Jing <chaotian.jing@mediatek.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@sandisk.com>, Bart Van Assche <bvanassche@acm.org>, 
 Stanley Jhu <chu.stanley@gmail.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: kernel@collabora.com, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-scsi@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785404993; l=3592;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=iS9c3CwJFX+FGETfJac3WVHOS/o1KOTEYp5R3/GgFb4=;
 b=tcxoKAonrNKrIOEzI2ilMZN02pKGY8sPWhz9RS3JR5rIW2Ssw/rvzNFsBzeMluJZyct5TMTXJ
 YzHtQo2JUP9AUm7K6KKCqOy4s8zbwV8RIsaLHrS3RSCs+ttK8j5gB2C
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_025021_011051_2A2454F6 
X-CRM114-Status: GOOD (  13.54  )
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

From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Errors should be printed at the correct log level. Additionally, it
looks like some "goto out"'s were omitted in the scale up case, which
looks like a mistake, as the scale down branch of the code does use
them.

Rework the error messages to make them nicer and at the correct
verbosity, and add the missing gotos.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Peter Wang <peter.wang@mediatek.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/ufs/host/ufs-mediatek.c | 41 +++++++++++++++++++----------------------
 1 file changed, 19 insertions(+), 22 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index b4867c9c2743..cc4b5f4c4a07 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -1971,16 +1971,16 @@ static void _ufs_mtk_clk_scale(struct ufs_hba *hba, bool scale_up)
 
 	ret = clk_prepare_enable(clki->clk);
 	if (ret) {
-		dev_info(hba->dev,
-			 "clk_prepare_enable() fail, ret: %d\n", ret);
+		dev_err(hba->dev, "%s: Failed to enable clock: %pe\n", __func__, ERR_PTR(ret));
 		return;
 	}
 
 	if (clk_fde_scale) {
 		ret = clk_prepare_enable(fde_clki->clk);
 		if (ret) {
-			dev_info(hba->dev,
-				 "fde clk_prepare_enable() fail, ret: %d\n", ret);
+			dev_err(hba->dev, "%s: Failed to enable FDE clock: %pe\n",
+				__func__, ERR_PTR(ret));
+			clk_disable_unprepare(clki->clk);
 			return;
 		}
 	}
@@ -1989,51 +1989,48 @@ static void _ufs_mtk_clk_scale(struct ufs_hba *hba, bool scale_up)
 		if (clk_bind_vcore) {
 			ret = regulator_set_voltage(reg, volt, INT_MAX);
 			if (ret) {
-				dev_info(hba->dev,
-					"Failed to set vcore to %d\n", volt);
+				dev_err(hba->dev, "Failed to set vcore to %d\n", volt);
 				goto out;
 			}
 		}
 
 		ret = clk_set_parent(clki->clk, mclk->ufs_sel_max_clki->clk);
 		if (ret) {
-			dev_info(hba->dev, "Failed to set clk mux, ret = %d\n",
-				ret);
+			dev_err(hba->dev, "%s: Failed to set clock mux: %pe\n",
+				__func__, ERR_PTR(ret));
+			goto out;
 		}
 
 		if (clk_fde_scale) {
-			ret = clk_set_parent(fde_clki->clk,
-				mclk->ufs_fde_max_clki->clk);
+			ret = clk_set_parent(fde_clki->clk, mclk->ufs_fde_max_clki->clk);
 			if (ret) {
-				dev_info(hba->dev,
-					"Failed to set fde clk mux, ret = %d\n",
-					ret);
+				dev_err(hba->dev, "%s: Failed to set fde clock mux: %pe\n",
+					__func__, ERR_PTR(ret));
+				goto out;
 			}
 		}
 	} else {
 		if (clk_fde_scale) {
-			ret = clk_set_parent(fde_clki->clk,
-				mclk->ufs_fde_min_clki->clk);
+			ret = clk_set_parent(fde_clki->clk, mclk->ufs_fde_min_clki->clk);
 			if (ret) {
-				dev_info(hba->dev,
-					"Failed to set fde clk mux, ret = %d\n",
-					ret);
+				dev_err(hba->dev, "%s: Failed to set fde clock mux: %pe\n",
+					__func__, ERR_PTR(ret));
 				goto out;
 			}
 		}
 
 		ret = clk_set_parent(clki->clk, mclk->ufs_sel_min_clki->clk);
 		if (ret) {
-			dev_info(hba->dev, "Failed to set clk mux, ret = %d\n",
-				ret);
+			dev_err(hba->dev, "%s: Failed to set clock mux: %pe\n",
+				__func__, ERR_PTR(ret));
 			goto out;
 		}
 
 		if (clk_bind_vcore) {
 			ret = regulator_set_voltage(reg, 0, INT_MAX);
 			if (ret) {
-				dev_info(hba->dev,
-					"failed to set vcore to MIN\n");
+				dev_err(hba->dev, "%s: Failed to set vcore to minimum: %pe\n",
+					__func__, ERR_PTR(ret));
 			}
 		}
 	}

-- 
2.55.0


