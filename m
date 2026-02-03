Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD75AE87849
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 16:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kKvnpjGXBkcD+ZLlwRtix5hempbJ/yQXes2bZ7PnlIg=; b=WJRXVG0RLJO7Q0euv8KWn84igh
	duaJ707AOVin9dLm6efMajuHBQIzq9EF54T+F/gc9pbPNefT8TfJ6XOU8EYg2rv7aai2JDQHryOMA
	9f+ejFhpZX8rb2N3dgrBvqG0HvAZKfgINFGbF/3Ndbk45Mi6dluckU1xIOY6zYAWb1pN2KKjMKi+F
	F/BdcdjRzKCiq5Rfog9OtfY4FvDaCuy/pIxufyZPbaLA+Pe5tIrg/nWiatzKovqmaOu05AlAaPGlr
	bBINtabX37vLOjUs9FxWaainfJCh8Jg2U0yj5gCFmfF79+bwk6oFyYrCHQI2k1RJIr/aQIjx7rhgp
	zBQ9IxfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJXz-00000006xtZ-3pFq;
	Tue, 03 Feb 2026 16:46:39 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJXx-00000006xsC-22AI;
	Tue, 03 Feb 2026 16:46:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770137194;
	bh=Iq2VyvqCDRD+eOJzowyqd7ph1sHZmTOb8jsOzunp67A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Dvtt/hvmF9m49AHUiZkUYVyzzLE59Ff2jp98hHXz9CEk4Rp61HWm77xGc4xDqdF/g
	 dyRtyZLK94tDmqvSETqYecxv4LVcETAZ/sS6NFFTEV8ux1ZyPQ2aTwYJNXIDB2Acrf
	 /vgXSeg0fppNzkdoodywIgEixdiZm55FRr+6mGb8poYm3DaxXhvYNOX7CZaMMRV+u+
	 tWtbU6WfmG3S/mmPYrK4AhnyWy6aJpAHfABQoiRaw3KdVXyVwMYtAccJ4+yR5ktZKm
	 g8l+jexw3Jne4ZmmzSSFtwfTFou1I/zPZ6CYR82kL4SYaeo5lgCqWr1Cp+zM05/Ps1
	 KO9rTEUyKAnCg==
Received: from jupiter.universe (dyndsl-091-248-189-143.ewe-ip-backbone.de [91.248.189.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6719217E1274;
	Tue,  3 Feb 2026 17:46:34 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 12E3B480023; Tue, 03 Feb 2026 17:46:34 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 03 Feb 2026 17:46:23 +0100
Subject: [PATCH v2 01/10] ASoC: rockchip: spdif: Use
 device_get_match_data()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-rockchip-spdif-cleanup-and-bsp-sync-v2-1-4412016cf577@collabora.com>
References: <20260203-rockchip-spdif-cleanup-and-bsp-sync-v2-0-4412016cf577@collabora.com>
In-Reply-To: <20260203-rockchip-spdif-cleanup-and-bsp-sync-v2-0-4412016cf577@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Alexey Charkov <alchark@gmail.com>, 
 Sjoerd Simons <sjoerd.simons@collabora.com>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1245;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=Iq2VyvqCDRD+eOJzowyqd7ph1sHZmTOb8jsOzunp67A=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGmCJmkgSHXAkdrHlb1P37EIIWW44+I3S9jvP
 d0/OBDiR1M8s4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpgiZpAAoJENju1/PI
 O/qao6AP/1K50SluzsdZygiemzGEhjxlWtrQkO8NJXlFk5U2t5XWLPuG8X5KSoaBDWoCuKG5Uex
 e1x+rwPUnNIVxCBgriDfHXLWWktwyZcgLl43wqYetkJNq/2IqM3+nmH/XiSMBqIeeIdGMic2ebo
 8gT9W+56G0Rfp7/Nia01EqRr5Xg49aKBz+TperIdpifNCWHCQ2RQVDBb73caBAsMuj/odJl2hw+
 fp7UND6lgpKY3Iqtl2/EA7bpOVUdheZF4oSDRqUo93Hv03sSlDDJP0G1l1qBQatwH5IK1FiOsNz
 UqpG5/NsnhwERuvqgCftxS1dvsgB07w0fm0zkFfsA8F19f12VdURShyDfvspq5R2z0fJYwV36As
 hO1rEF5ouImtjdu1kJ9aPi+ndH3SA4Q9VriQOLO7OQdkZqCBvTkfz85Bv9YiMvihJ5l4gTgQ9m4
 TlnU58yg8Rjwo8Yoq2SqxZatFo0VPpDf4qB8a+YVEWxI/F5YZ4ZZtQu5egBGY/c7dZvokuTRTS/
 gCbaUipT6MlWRT8psloUo/9gWiedGtFmIslFcb0S8zpO/mOm21FOsZq1zYEaFyGp82j8wU11glX
 yYJk38FCub9HxirPmyOCqT7bCw2zhN+dV/COSSu+84kuIh8Bt2JtUZ9YJqy7o8A6a+ZgLgB/Hil
 1DqKqK1Dt/vqmxWe8gT8qsA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_084637_705130_6FABB279 
X-CRM114-Status: GOOD (  14.57  )
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

Use device_get_match_data(), so that the probe routine does not
directly reference the of_match_table. This allows moving the
table at the end of the file where most recent drivers have it.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 sound/soc/rockchip/rockchip_spdif.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_spdif.c b/sound/soc/rockchip/rockchip_spdif.c
index d365168934dc..23f14274a6e0 100644
--- a/sound/soc/rockchip/rockchip_spdif.c
+++ b/sound/soc/rockchip/rockchip_spdif.c
@@ -283,14 +283,14 @@ static const struct regmap_config rk_spdif_regmap_config = {
 static int rk_spdif_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
+	enum rk_spdif_type spdif_type;
 	struct rk_spdif_dev *spdif;
-	const struct of_device_id *match;
 	struct resource *res;
 	void __iomem *regs;
 	int ret;
 
-	match = of_match_node(rk_spdif_match, np);
-	if (match->data == (void *)RK_SPDIF_RK3288) {
+	spdif_type = (uintptr_t) device_get_match_data(&pdev->dev);
+	if (spdif_type == RK_SPDIF_RK3288) {
 		struct regmap *grf;
 
 		grf = syscon_regmap_lookup_by_phandle(np, "rockchip,grf");

-- 
2.51.0


