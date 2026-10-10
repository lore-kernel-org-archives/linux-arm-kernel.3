Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5484CA9EBE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 11:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RPzRZvC6M3eYrQVDkjYe0kKV8YaVNewsubnx0uw/yuw=; b=JNmJh+QP9SyzDwvOgR9dWXAFmt
	dtJevt/drJEAUMSfgypXWCrAlwNZYlLaRE5kxcyfMIYnxMw+K1gf649RIwavZb8nHx3hPEiP3OAnI
	GyqctGacywd+r27au08l57POLxh3RK8qiiVKRiWK0rNGjNAlYSGtJwvh/BES8HaayPcMYSCJ46N8B
	l56paOESr+/Xis8Cup0BuCF+ngRQy0eXvlfK0XtdtTMoA2MQ5HNjeh4akbDW39LWT0EUElzlFuZhe
	PbvmNFflR4TkE2ut6DH0SeWjMZSzyuXMeWRl7cppaX7bcAoHcAMqBfppEN+6WTS3pIlH0qg1KXwje
	K+XMcwMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFVh6-00000007yW2-3WFN;
	Sat, 10 Oct 2026 11:56:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFVgM-00000007xv3-2HWm
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 10 Oct 2026 11:56:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=RPzRZvC6M3eYrQVDkjYe0kKV8YaVNewsubnx0uw/yuw=; b=gKTznfvco5MFEW5DDROrOFWV4b
	+g0iecvkMLx0tOxKTtKDX/ZK0cKgi3MjAVA4LJoQl68a5RQmtNrDrkbzfLT088pj/SAy5p/URdNmG
	PWvbOX8v5/hx4OeNb3qBfrgRSkjtv8D1J1xQMT7pBksQFL3gIo+Ne6I9HcoOYDP88l3FLnx2zcFah
	LEEeO2ZEFhg6te/0uu/PcTOw1+WCSDx9tW69lkTBOdkPi/uRJ2gsRO3P9orkP28t/mYwMBb68MDu3
	d8qyHobaCtOT4f5oDcumsoO8k1t8Z0um97p78e1FTeAgcNLbOBNsnQQAL5pC99jxplWrNYH90uTFi
	EHh8z/Qw==;
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xFVgJ-0000000C4nN-0XLo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 11:56:05 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-48b9d8055dfso442348f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 04:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791633361; x=1792238161; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RPzRZvC6M3eYrQVDkjYe0kKV8YaVNewsubnx0uw/yuw=;
        b=APiJ4HlUnDurYMa+Xl+4ukfux2xwUWrArZTXmSRaYmn441A8Qex7G9T8nJxM7i3OMO
         nyMzeHyBVgzdMwt0HYuwK2ecoAdDaiU0wD8/wlp1HxBd+LqdcUX8tIgudDD5FGV12wfl
         FHxWf/nsLmtNKGu1d4IpMdQZZLhRxWuhbjQ/rymvZzEW9GqBEJpDM0hVpXAvSZeMHVg1
         xcv0JNm+per+OezCXj6TpFEUTW4qiIA5F+wzMLiKscc4giS+ElYrGKT22tNuevSs/XC0
         G0y3bmBpv5ab6XHIQWZmrC10J2xdCoXBjGKQ355m1MQ2QQQMvmmABt+v6QlllWd24wWE
         +5BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791633361; x=1792238161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RPzRZvC6M3eYrQVDkjYe0kKV8YaVNewsubnx0uw/yuw=;
        b=bvB/f8R9XR/bX79/ECfA6hcu6ygb7t9D7C7Rt/Fu1z0VAtAQ6fTR4rT9odoC6y9XuX
         VVX5wYllvY28mH5JhIDI2D4SRLiQf0mfTyuXaU3iYhS+RX9rwJgEghOZCqPPD63O5m0e
         1/8xPqGHasypvKvJvTZDhuw384jNXgMg6veru8pwHwT/Q4DANUQsbqONcrGlt66IPaHv
         BFaxk2x3qPlTUH8a2dm538ZThgRjY5ee/SVx63jt0A4BvF/Ja/AoqDWiQAggns9ZkC2R
         FgV/e/O8343ikxES1w07+P9tO/JTwcvZFwrRbRVf63cRSH/5YRwY4jiBn0OYx9UeLwVy
         Ba9g==
X-Forwarded-Encrypted: i=1; AKwUvByaIPLgLcrBNMkFe2/xUWCbRBsmxlv51+bUMqNksU2qATlbT95YMJtC8lyJUa/vd9fZm2RndeizRxRE9vznjreT@lists.infradead.org
X-Gm-Message-State: AFq9FYJga4b9OGcLx5KU6+fw4mnTp6AKsibYJ2eQ6siqe3FuAqEIgU9B
	EY453BA0rneiU7yv7S0C+RhBrQMpBchKZ+FMrc5+QVKhU0cZWj+cA5WY
X-Gm-Gg: AYBFou2aaAXdIaQnxf3UPL3Lze6HyIZPXAip9kAG18fp0r6S92u4rkurwZtL4FVfAka
	AvS06btMBNXhm3KRZuhg/Gd7HcGDE3PgM9L0kH92NrSPMAOqX1FCRTR9RvnWKqDaWBsFSS9MJKI
	6Smos+DakMbmV+z+5fEP1EdI337qWK09ovCw/x3n64jOQ5YA0BcTImIqk7Bo+Ie/268mxuP61EK
	21kEUjwitT2UE46H2Swd/5IhLaBxUZgJz/LSTMv6YoGHUFbk1Tk7W4n8ufsrxhpYzY1UoT3aPJm
	wZ1Y0rrVI4MsnqgSj6L/TdsvjsHdUxNmdqkB8Z3lBMWvwFFNaKuZ/0gTqzqoOq27hduXzbo/S7Q
	0Eljp/QkmpCZsQpK+A74LNdS6wjhQ23OqZUELVLik3FvhQZDT8gfW+BzQKc7pc/av3hz/wApKb3
	3WKANv14xZXhUMSEk7oLHEMYhuXIV8eB1nwbK32rfM4YP2H40egJcZSg63ex8WBnlEVg==
X-Received: by 2002:a05:6000:4310:b0:48a:f1fb:e165 with SMTP id ffacd0b85a97d-48dbaae39e0mr7896198f8f.21.1791633360918;
        Sat, 10 Oct 2026 04:56:00 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9aca657sm8746340f8f.43.2026.10.10.04.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 04:56:00 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Fabien Parent <fparent@baylibre.com>,
	CK Hu <ck.hu@mediatek.com>,
	chunhui dai <chunhui.dai@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/7] clk: mediatek: mt8167: Map apmixedsys iomem as shared
Date: Sat, 10 Oct 2026 13:54:03 +0200
Message-ID: <20261010115539.9237-4-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261010115539.9237-1-l.scorcia@gmail.com>
References: <20261010115539.9237-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_125603_307014_E65E871E 
X-CRM114-Status: GOOD (  20.46  )
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

The hdmi_phy for mt8167 and the apmixedsys clocks share the same IO
memory region and they both map it using devm_platform_ioremap_resource,
which implies exclusive access. Switch the apmixedsys driver to of_iomap,
like it is done in the mt8173-apmixedsys driver. Also, implement the
remove function while we're at it.

Fixes the following runtime error:
hdmi-phy: error -EBUSY: can't request region for resource
[mem 0x10018300-0x1001831f]

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/clk/mediatek/clk-mt8167-apmixedsys.c | 24 ++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8167-apmixedsys.c b/drivers/clk/mediatek/clk-mt8167-apmixedsys.c
index fb6c21bbeef8..3e8611991de7 100644
--- a/drivers/clk/mediatek/clk-mt8167-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8167-apmixedsys.c
@@ -8,6 +8,7 @@
 #include <dt-bindings/clock/mt8167-clk.h>
 #include <linux/clk.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/platform_device.h>
 
 #include "clk-pll.h"
@@ -97,17 +98,19 @@ static int clk_mt8167_apmixed_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	int ret;
 
-	base = devm_platform_ioremap_resource(pdev, 0);
+	base = of_iomap(node, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
 	clk_data = mtk_devm_alloc_clk_data(dev, MT8167_CLK_APMIXED_NR_CLK);
-	if (!clk_data)
-		return -ENOMEM;
+	if (IS_ERR_OR_NULL(clk_data)) {
+		ret = -ENOMEM;
+		goto unmap_io;
+	}
 
 	ret = mtk_clk_register_plls(dev, plls, ARRAY_SIZE(plls), clk_data);
 	if (ret)
-		return ret;
+		goto unmap_io;
 
 	ret = mtk_clk_register_dividers(dev, adj_divs, ARRAY_SIZE(adj_divs), base,
 					&mt8167_apmixed_clk_lock, clk_data);
@@ -124,10 +127,22 @@ static int clk_mt8167_apmixed_probe(struct platform_device *pdev)
 	mtk_clk_unregister_dividers(adj_divs, ARRAY_SIZE(adj_divs), clk_data);
 unregister_plls:
 	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
+unmap_io:
+	iounmap(base);
 
 	return ret;
 }
 
+static void clk_mt8167_apmixed_remove(struct platform_device *pdev)
+{
+	struct device_node *node = pdev->dev.of_node;
+	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
+
+	of_clk_del_provider(node);
+	mtk_clk_unregister_dividers(adj_divs, ARRAY_SIZE(adj_divs), clk_data);
+	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
+}
+
 static const struct of_device_id of_match_clk_mt8167_apmixed[] = {
 	{ .compatible = "mediatek,mt8167-apmixedsys" },
 	{ /* sentinel */ }
@@ -136,6 +151,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8167_apmixed);
 
 static struct platform_driver clk_mt8167_apmixed_drv = {
 	.probe = clk_mt8167_apmixed_probe,
+	.remove = clk_mt8167_apmixed_remove,
 	.driver = {
 		.name = "clk-mt8167-apmixed",
 		.of_match_table = of_match_clk_mt8167_apmixed,
-- 
2.43.0


