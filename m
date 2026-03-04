Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B6E2EFCE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 18:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GnLN33Ifloh+UfyT9Xr8GDknKJnwUYvHC0fyQTp1f3s=; b=DBMlo0MCTqGsl47asqsnMyg7PP
	Zrwebx0Yt+SEbvjRXhwprJF1eIXxF4r4dAuVePW4993BiTLGlI4SdHmAJUF/WPtpByiQRIU0SQiqD
	awgGCUK8WUBDxMuHF+xMce9S0F8joCFcJeD28CzEhwpjmbcqqqTPcYmYAKm3LsQNq76B9Zo+XD4cY
	Aa6pwxhswoB3+R8Ih+apKimhL39uU6+Su740NYV+dn+CBWxcc2+1XNzUFch1GLBKuo+fTa5HawsF0
	spUJsJMiexLmkmqbq7C16UUrTNFICVgfdqPd32/DrEvk4mH8dH+2weXeKrNBOZv1nU5+uBwE9LZJU
	S3zjFfrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqhK-00000000JSh-24OV;
	Wed, 04 Mar 2026 18:11:50 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqhH-00000000JRN-3vR6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 18:11:49 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-827307b12dfso3851131b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 10:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772647907; x=1773252707; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GnLN33Ifloh+UfyT9Xr8GDknKJnwUYvHC0fyQTp1f3s=;
        b=hSnOr2QGHmgVih7vJGcg/SnAGpYY0Djzcm+2an2gWDlZlwA0rJ/5Zk9kgeIyXtsWzk
         jjN6zfxaoYk4UdVseDV73s1uZrvzbsrnhJeZFSHzoylEcQ95JaEuatWjfo4JkrBiKi/f
         riNx429fcZolZN1gpdt9sNtcaJZNlhMLoPl/agW/SrGQ5AWXDRVRdccwSwfX5zS6FyoM
         I4i7C4GwE/gL1kduQ+Ei4bafAl0AbpAgAWSsOyReS7/nJfEflnevtNQzbn448/Fw9T4n
         huygqV+PrOLQWBpxyC15/zp9hRERd6jkNMBDsRFQbhA+4gXf2fXPrZChbhxkVhjnG78K
         MC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772647907; x=1773252707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GnLN33Ifloh+UfyT9Xr8GDknKJnwUYvHC0fyQTp1f3s=;
        b=CDGaGAQ4HnN5BYVCQ8UBK7gW/wKC4zXh8GvcJnXHGR7NqaCHLzbBvb9enXaD06GS7K
         /P+373sPX5hC41STey5qWrqCEXQ6PLZnkqmXzwUlZlH6imPqg9yRZWQs3b60Q+ElsEpW
         RhqoLFvaRAN3H24HsEZvWNEXH0EpqFOGetq+nUXRW3/myOBshTBj12+fLltysOCXKLIz
         3Kn07KtsqnVzb82WiITCT/t7DLcxwsXas8SG26UituhhT6x8NuvowiaEfhoGAok46vwT
         GqhtVztG/53xp4zhOHUWKrEk3HdKjgYaKzQy11vgBu0MkjSVoUiJ53BwHcK8B8TZPdWa
         Ifmw==
X-Forwarded-Encrypted: i=1; AJvYcCXVkUVSjNZKXg7rdlyuEFT0M/7M1rja5ntCNRQTkDr92FXVYyftIF+RE6/jksQ5SSyvsEtB+Yq1pFbcdp2revyI@lists.infradead.org
X-Gm-Message-State: AOJu0YyDRUFfEh16mfNpiHmiuAt1I0tjBnJ11wtvQTCvOPp9j8rwdNQ5
	WdqCAkWSrHMUZuEjLw1xWbw80R99Y3YwxhNZbHGC7uPz93BEtSeFr2w9
X-Gm-Gg: ATEYQzy2DX7aquC7Dr7s90Vxvt+jEqZsxFqyjK1X7Fmi7PKzVYt3FV/mS5cThqgjJ8O
	j9QT5KoQ2ViKFKTIvsfhfg7sYId4ibJXo6d45T7oOgmYpNucCrp5uNs+ykVsR122v7mFkJtszdT
	5doCk3JvwAmYFk9D7jdF59W6mvJo4VLNmCq4Gd8wphz0DJptkr4VsEINzG9vUrQ/hkEhSojfeif
	U3XD0rEg81/nmJi5Nej0HotYgs9z/cbGYaC9LXgpX3dt/4gCNBgtGvENtExL7L+g44ge84hzjS3
	5edIzt7Xqo5wNfnC2VgkGvvM07kyJw8PUtVm8rWDu3jZ1sQe9V8ZAlBIxuX3VwXUtaEu5sGDu0k
	Si/Ma05DU68ATUoj+Vu+p+NQlWj0iSPicWjnAHSTA7nN7HEyn3J4xKgqvp7wwO40/kj0tEozcBi
	8nA/ZJ2GsDQubUbHHteGVm9IfpWBlZ0i2fFZaCTDPyibHTu+vLFbMOK4oSdoJV/klOLg3yPYJXW
	Xakgmc=
X-Received: by 2002:a05:6a00:4215:b0:81e:b93a:ab09 with SMTP id d2e1a72fcca58-8295d845021mr5335049b3a.1.1772647906891;
        Wed, 04 Mar 2026 10:11:46 -0800 (PST)
Received: from buffalo-ssd.taila54753.ts.net (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829713825efsm2503835b3a.51.2026.03.04.10.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 10:11:44 -0800 (PST)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH 3/3] clk: mediatek: mt7622-infracfg: Switch to common probe/remove helpers
Date: Thu,  5 Mar 2026 03:10:24 +0900
Message-ID: <20260304181024.738391-4-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260304181024.738391-1-akkun11.open@gmail.com>
References: <20260304181024.738391-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_101147_990891_C3525B92 
X-CRM114-Status: GOOD (  15.91  )
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

The MT7622 infracfg driver can use the MediaTek clock framework's common
initialization sequence. Reduce the boilerplate code by creating
struct mtk_clk_desc and using the mtk_clk_simple_probe/remove helpers.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt7622-infracfg.c | 70 ++++------------------
 1 file changed, 11 insertions(+), 59 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt7622-infracfg.c b/drivers/clk/mediatek/clk-mt7622-infracfg.c
index cfdf3b07c3e0..2e463d1481d0 100644
--- a/drivers/clk/mediatek/clk-mt7622-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt7622-infracfg.c
@@ -9,7 +9,6 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 
-#include "clk-cpumux.h"
 #include "clk-gate.h"
 #include "clk-mtk.h"
 #include "reset.h"
@@ -51,74 +50,27 @@ static const struct mtk_clk_rst_desc clk_rst_desc = {
 	.rst_bank_nr = ARRAY_SIZE(infrasys_rst_ofs),
 };
 
+static const struct mtk_clk_desc infra_desc = {
+	.clks = infra_clks,
+	.num_clks = ARRAY_SIZE(infra_clks),
+	.cpumuxes = cpu_muxes,
+	.num_cpumuxes = ARRAY_SIZE(cpu_muxes),
+	.rst_desc = &clk_rst_desc,
+};
+
 static const struct of_device_id of_match_clk_mt7622_infracfg[] = {
-	{ .compatible = "mediatek,mt7622-infracfg" },
+	{ .compatible = "mediatek,mt7622-infracfg", .data = &infra_desc },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt7622_infracfg);
 
-static int clk_mt7622_infracfg_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	void __iomem *base;
-	int ret;
-
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	clk_data = mtk_alloc_clk_data(CLK_INFRA_NR_CLK);
-	if (!clk_data)
-		return -ENOMEM;
-
-	ret = mtk_register_reset_controller_with_dev(&pdev->dev, &clk_rst_desc);
-	if (ret)
-		goto free_clk_data;
-
-	ret = mtk_clk_register_gates(&pdev->dev, node, infra_clks,
-				     ARRAY_SIZE(infra_clks), clk_data);
-	if (ret)
-		goto free_clk_data;
-
-	ret = mtk_clk_register_cpumuxes(&pdev->dev, node, cpu_muxes,
-					ARRAY_SIZE(cpu_muxes), clk_data);
-	if (ret)
-		goto unregister_gates;
-
-	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (ret)
-		goto unregister_cpumuxes;
-
-	return 0;
-
-unregister_cpumuxes:
-	mtk_clk_unregister_cpumuxes(cpu_muxes, ARRAY_SIZE(cpu_muxes), clk_data);
-unregister_gates:
-	mtk_clk_unregister_gates(infra_clks, ARRAY_SIZE(infra_clks), clk_data);
-free_clk_data:
-	mtk_free_clk_data(clk_data);
-	return ret;
-}
-
-static void clk_mt7622_infracfg_remove(struct platform_device *pdev)
-{
-	struct device_node *node = pdev->dev.of_node;
-	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
-
-	of_clk_del_provider(node);
-	mtk_clk_unregister_cpumuxes(cpu_muxes, ARRAY_SIZE(cpu_muxes), clk_data);
-	mtk_clk_unregister_gates(infra_clks, ARRAY_SIZE(infra_clks), clk_data);
-	mtk_free_clk_data(clk_data);
-}
-
 static struct platform_driver clk_mt7622_infracfg_drv = {
 	.driver = {
 		.name = "clk-mt7622-infracfg",
 		.of_match_table = of_match_clk_mt7622_infracfg,
 	},
-	.probe = clk_mt7622_infracfg_probe,
-	.remove = clk_mt7622_infracfg_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 };
 module_platform_driver(clk_mt7622_infracfg_drv);
 
-- 
2.52.0


