Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8FD4C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 10:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0BO/J1XjmARbJ42QF9ZK6vnZZxx8kVHY8SthKE3rvGM=; b=OweRyAsMZwqDaP3MCgMHDfhUP2
	dkeF7xSpRw+ZCUTnFpgMvIX9eAYK6FRV7SGYmWSIyVDRATA6lG1oMkcfeecswW1Xhj3faaNEsiOTm
	e7kPAp0OCPXBl3DzcNhT1EB1eO00eZOVTgQkBCpoDGoXiKylrboQVA+5nuUlexPAuuhQ52o2+CQma
	OOT/HZYqQH1vLC78Gq3PKTICYyjHsURuKO0OI8cEdDljs9wwh7xQPjeQjqzCr64RrdRZXv43kheSg
	Bwwr5NpqILVxqiA4tIUJ8clm3eaUdIC9+UYwxWuW9ynDe2GmS+SqKHAVg6/jqWeCro4xfxDrBfJjU
	1w0ODVTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukKGS-00000002YdJ-1URR;
	Fri, 08 Aug 2025 10:23:56 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukK6I-00000002X9f-1Prf;
	Fri, 08 Aug 2025 10:13:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754648004;
	bh=nf5h1lNpleNGuRl1UxQ6idA0pn7vVFi/xWcII3JgkvM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XuYDVq6/PUBXKvt3WdNPtCfXSv4tMht8of1SsoVik+9NJ5S/vHMf6l7gb1q18868I
	 9DhUPo0FRvCGigq/EQPqzEdB1QQ4pld6GSpz1XVoV1kp6412nvsWxNnzuU8FKo0oMq
	 mzDav6+6WyCEJuLMjFgF558IGVtUGILBTHiRVB/FtdZgeroFEfGTp5tTpvoL2Yh9Nd
	 T8m4FqgLYFst8hOUioJkq2PYxvVxXyERyujf3X6Rm1Bmpe3b5OTTXq6wqKgGGwLDyY
	 a241oSry5VW8i7wfae1/Z33+vas8Gl7xj/2W39w1AIa/SPL5Jrkzvtyq1Mu9jCPHtv
	 +IltMkW0+h4Sw==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7282A17E0109;
	Fri,  8 Aug 2025 12:13:23 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 08 Aug 2025 12:12:11 +0200
Subject: [PATCH v10 01/10] drm/mediatek: mtk_hdmi: Drop redundant clock
 retrieval in mtk_hdmi_get_cec_dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-mediatek-drm-hdmi-v2-v10-1-21ea82eec1f6@collabora.com>
References: <20250808-mediatek-drm-hdmi-v2-v10-0-21ea82eec1f6@collabora.com>
In-Reply-To: <20250808-mediatek-drm-hdmi-v2-v10-0-21ea82eec1f6@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754648002; l=1400;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=nf5h1lNpleNGuRl1UxQ6idA0pn7vVFi/xWcII3JgkvM=;
 b=edtZnff7qnJqLIBEeReiUZ3kiy09NLgimvwuBq5wQ79sQzHm3ZXeENMSPSenFakreoHXYmvKo
 gd72/k1VvXQAN8FvRYOSVpLWs49UZE54EPel+NIRSxQpKV9o2jz+NHW
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_031326_566297_6188D76E 
X-CRM114-Status: GOOD (  10.40  )
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

In mtk_hdmi driver, when the CEC device parsing logic was moved from
mtk_hdmi_dt_parse_pdata function to the new mtk_hdmi_get_cec_dev sub
function, the call to mtk_hdmi_get_all_clk was kept in both functions,
whereas it was only called once in the original mtk_hdmi_dt_parse_pdata
code and does not need to be called a second time.
So, remove this call from mtk_hdmi_get_cec_dev to keep the same sequence
as previously.

Fixes: 7485be967f7f ("drm/mediatek: mtk_hdmi: Move CEC device parsing in new function")
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 845fd8aa43c3c91659808d9e6bb78758d1f9b857..0ac4e755bdf8aace766feffa57712a8fbf4ff791 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1349,11 +1349,6 @@ static int mtk_hdmi_get_cec_dev(struct mtk_hdmi *hdmi, struct device *dev, struc
 {
 	struct platform_device *cec_pdev;
 	struct device_node *cec_np;
-	int ret;
-
-	ret = mtk_hdmi_get_all_clk(hdmi, np);
-	if (ret)
-		return dev_err_probe(dev, ret, "Failed to get clocks\n");
 
 	/* The CEC module handles HDMI hotplug detection */
 	cec_np = of_get_compatible_child(np->parent, "mediatek,mt8173-cec");

-- 
2.50.1


