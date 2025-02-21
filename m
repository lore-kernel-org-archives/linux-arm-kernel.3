Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 428FFC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 11:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zI2NaFXtCNAAcLn9axAPJOBAp9dC8kW+ekIv6/0Lejc=; b=omLaIUZRBIyeCwiIKWRItkQKB5
	T6xY8rI7RjYmtd53cSA+WIebsFWl/o9fQEIEChXs6OojPAHefqIIZRnzJ5mnGUJPPfeqb9MLRVNrV
	FKFZn1FUUv+JLb2/QoU5j7GYmo3QIu/FkuQVP1/QQNwOc8Y6pfeYCWX0ivLei5LXZK1/ongBTMfxB
	ov1nZKs54P0h8wzSDct2CeUAixFlSLHieRIfCDiUjhM5eVw1hI7o6mMVvqT7EnWEaOSiOY5EmmvJI
	gMZO+bLuJbo2+2EJyREzWyLgvEsbUF5oTNIamVTU1Y5qZAQzpsZYm6IkUhtMN+PZ6irbpx+jUabXd
	RN/NVU9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlQz8-00000005Ihz-30MN;
	Fri, 21 Feb 2025 11:14:22 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlQpH-00000005Gte-1u3E;
	Fri, 21 Feb 2025 11:04:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740135849;
	bh=RCnNhgw75I/wEW2JWpngXCKAxqIVcEwXxTd7/ahkD3Q=;
	h=From:Date:Subject:To:Cc:From;
	b=DZhea9b4fkr8gbhixEfwqn6OlEv6qNZu0rW2pu+Kqx+ThaqfXU0cmkDBJrAfFkqVb
	 aHb0AstOTFgzh5g/Ch+DiO9m7Ils+0F2qIIEz4pUyaAsKlMHTH2DP3mVKBty5tiLAU
	 151ZbRyu4AhIddUjcaB2smqtU/i3Ve3X/P+wflspqQA5ZbpGZJN92lOoLr21Itzo+c
	 W5WhkqGvnoBAQKXtWnlLPfSjZD79Wulcty0dUuwM+l28qEPNmBm87CchGV3ZBfCDrA
	 8Z4A93cVUY9p44vkArcOR/HSCbgPjVBFDk7DlDloGmgcAfS9SRbzMzUl2utClmNf2r
	 cE+g11KjuyyXw==
Received: from yukiji.home (lfbn-tou-1-1147-231.w90-76.abo.wanadoo.fr [90.76.208.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DB6E017E02BE;
	Fri, 21 Feb 2025 12:04:08 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 21 Feb 2025 12:04:02 +0100
Subject: [PATCH] soc: mediatek: mtk-socinfo: Avoid using machine attribute
 in SoC detection log
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-mtk-socinfo-fix-print-v1-1-20500f30ef66@collabora.com>
X-B4-Tracking: v=1; b=H4sIAKFduGcC/zWNwQrCMBBEfyXs2YWYUJD+ivTQxI0ukk1NohRK/
 93F4vHNMG82aFSZGoxmg0ofblxE4XwyEB+z3An5pgzOusE6ZzH3J7YSWVLBxCsulaUjXXzywdN
 gQwDdLpW0/Hmv08GVXm/V9yOEMDfCWHLmPhqhteP/AqZ9/wIYnOWumAAAAA==
X-Change-ID: 20250220-mtk-socinfo-fix-print-e83f3b3e50bb
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Fei Shao <fshao@chromium.org>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740135848; l=1637;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=RCnNhgw75I/wEW2JWpngXCKAxqIVcEwXxTd7/ahkD3Q=;
 b=RekhF+VTRj/NNwFMjsJNiXVDNcX0IETBIKOwOKIFzwREB2y/iLivfFzlt/glLTGYP7+5tgcGH
 E3wiP8tO2XEBeM21mk/eX31XadTZyDtkw8hNyGXGVJ9ttDoTT0PG8YZ
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_030411_652835_795E16C0 
X-CRM114-Status: GOOD (  11.95  )
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

The recently introduced SoC attribute info rework avoided modifying the
machine attribut but still used it in the log message on successful SoC
matching. It leads to print a confusing log about a board-related info
(read from devicetree) and not about the matched SoC:
```
mtk-socinfo mtk-socinfo.0.auto: MediaTek MediaTek Genio-510 EVK SoC
  detected
```

So, fix the dev_info format to display SoC family and name attribute
instead.
```
mtk-socinfo mtk-socinfo.0.auto: MediaTek Genio 510 (MT8370) SoC detected.
```

Fixes: da77c2d3d06c ("soc: mediatek: mtk-socinfo: Restructure SoC attribute information")
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/soc/mediatek/mtk-socinfo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-socinfo.c b/drivers/soc/mediatek/mtk-socinfo.c
index a15d8f854cefa90883377b47bbc16a7072ee21cd..ac7bb0cbff2df5e1c4033646cd3b644e67ee7f69 100644
--- a/drivers/soc/mediatek/mtk-socinfo.c
+++ b/drivers/soc/mediatek/mtk-socinfo.c
@@ -87,7 +87,7 @@ static int mtk_socinfo_create_socinfo_node(struct mtk_socinfo *mtk_socinfop)
 	if (IS_ERR(mtk_socinfop->soc_dev))
 		return PTR_ERR(mtk_socinfop->soc_dev);
 
-	dev_info(mtk_socinfop->dev, "%s %s SoC detected.\n", soc_manufacturer, attrs->machine);
+	dev_info(mtk_socinfop->dev, "%s (%s) SoC detected.\n", attrs->family, attrs->soc_id);
 	return 0;
 }
 

---
base-commit: 964b0ceed00032fa0fa841fd61e5f315880a2d36
change-id: 20250220-mtk-socinfo-fix-print-e83f3b3e50bb

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


