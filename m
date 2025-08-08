Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D8FFC87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 10:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TfMyfStXTbd+N10MsAaVykExXm5NalE2wWQRd54kmMw=; b=YqjjUnirUyivrLjpadUYQ7ExNN
	cSnAzEc0p9j8kKydqiOMYdLxN7+YQINX0Zh0SmtYaC/iXDH8e5AUkYK1qF3rimLBZlxGy2fDIeeCd
	IO+ArQ2ozh2wJkpCR6CLJN1wkZfMJV19QLbCc6J9YI6Cotf3hcACj3pgr564rr0WdnYg54GzDmTFh
	vtsHNno3dCu+vMmilGvKtN/FOAxxI5/WKc4t/u/ipRHtG8nG/iUC1fSByzT1VaN+eBqi3Sf5h0b4O
	8F04y3lYpoIv8W8f2i3bEs6Lq4ir4A84FijPSkHBzjJotUEpTt2eyGyF9N+s8FIDI2Ej+qnLpe39X
	vpneLXpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukKSh-00000002Zt3-0fL9;
	Fri, 08 Aug 2025 10:36:35 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukK6L-00000002XB7-1iUP;
	Fri, 08 Aug 2025 10:13:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754648006;
	bh=8DVZ94uzcqoNX+9EdxOkXfy9Z7a63Lc/mZv8MzFgZ6g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=P8RapCG2/r8UQvhCXvIa1Imk5Dsgg/FG8F1eXWLO0GaUlLd6Jt0X7eSSna9uNmpST
	 cFOgWPyrwiecPf3iYNn6MRbNKRkJNvnKyzcyhIzrbNrP1xP+1t/cfSRKIfLYGrufF2
	 acqAAZscDgsoljB/pUguRH73L/vYmh/Hrs7L4xDaUnvi6L9uYq/Ii37VCXQVtqlV45
	 LIBbhWAM4wVN2EzRzWGmbxdb85AgkSsTbgz/tQtjXoZ49CjzmnumfKftZATIDk48DV
	 R1dzun12O9B0u7DyEZ0KkrzTwjAfeAK2Jv4LmyGJ11frrDRQdcXpNXx+lXrKgrLUfJ
	 lRgXaL5I9d4hQ==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 50D0217E1298;
	Fri,  8 Aug 2025 12:13:26 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 08 Aug 2025 12:12:15 +0200
Subject: [PATCH v10 05/10] drm/mediatek: mtk_hdmi_common: Make CEC support
 optional
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-mediatek-drm-hdmi-v2-v10-5-21ea82eec1f6@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754648002; l=2372;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=rXYgOuvY4xVEkhoV1yELheebNy9aj44v5phMhyfwfOk=;
 b=tAqo5e9EJRvOYDGl6xb1rbTZQ9T2ZgVBxc0PRLIydgM8xA1wMP6BNy9P8bMedMmQm2NQjNldM
 qoygPQNpPCaCNzPmMKFOT0P5KGrgHyxg4wOdveoj3gNQplmEYFIIrdB
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_031329_654492_E77F35ED 
X-CRM114-Status: GOOD (  15.42  )
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

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

In preparation for adding a new driver for HDMIv2, for which CEC
is not strictly required, change the of_get_compatible_child()
failure error to -ENOTSUPP to be able to differentiate between
error conditions in mtk_hdmi_dt_parse_pdata().

In that case, if -ENOTSUPP is returned, this driver will print
an informative message saying that CEC support is unavailable,
as the devicetree node for that was not found, but after that,
function mtk_hdmi_dt_parse_pdata() will not return error to
the caller.

This will not change functionality of the mtk_hdmi (v1) driver
as that is still checking whether CEC is present and, if not,
will fail probing with an error saying that CEC is required
by HDMIv1.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
index f28e63716d7c2e2c6bdf5b28d24789bc926d2beb..989479fdfe40952762a1b63797bf602b520dcac5 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
@@ -253,12 +253,11 @@ static int mtk_hdmi_get_cec_dev(struct mtk_hdmi *hdmi, struct device *dev, struc
 	/* The CEC module handles HDMI hotplug detection */
 	cec_np = of_get_compatible_child(np->parent, "mediatek,mt8173-cec");
 	if (!cec_np)
-		return dev_err_probe(dev, -EINVAL, "Failed to find CEC node\n");
+		return dev_err_probe(dev, -ENOTSUPP, "Failed to find CEC node\n");
 
 	cec_pdev = of_find_device_by_node(cec_np);
 	if (!cec_pdev) {
-		dev_err(hdmi->dev, "Waiting for CEC device %pOF\n",
-			cec_np);
+		dev_err(hdmi->dev, "Waiting for CEC device %pOF\n", cec_np);
 		of_node_put(cec_np);
 		return -EPROBE_DEFER;
 	}
@@ -319,7 +318,9 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi, struct platform_device
 		return dev_err_probe(dev, -EINVAL, "Failed to get ddc i2c adapter by node\n");
 
 	ret = mtk_hdmi_get_cec_dev(hdmi, dev, np);
-	if (ret)
+	if (ret == -ENOTSUPP)
+		dev_info(dev, "CEC support unavailable: node not found\n");
+	else if (ret)
 		return ret;
 
 	return 0;

-- 
2.50.1


