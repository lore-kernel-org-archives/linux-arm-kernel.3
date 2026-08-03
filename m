Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60811C55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 14:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yBdhWQzJRHYryE9WZhMb9eq0tPTuw8+xNI5NcLDCCxE=; b=CuTjqXuoiBeifHntIwqtI97J4H
	xowaNSrpmZJwHqPZRj/lL+msJGCMdJx/tW6cpeQYLIXhtKIQo7nUYI5g1fEWR5aQnefrD0tq1ngJy
	UeBWTi9wd9ZFhqMtZ6P7QWNcejyT8COufFLHfAJese7TBpsoL3NiKW4t88CUMUK5ASGDCQ9JMCVxW
	kSCPutr8s9FykUBELxnx/+t0dyWRBSU8WsQiHgn16LWCFiCsFH04kGGX84F5abJ9HaaEuEpZqqTv9
	qdTSlLXn3wBezYgNVbY8i+sqkVmMskNebwbd1UszS7jZf93EMo58xQVGjnh1pcgvyO9r5ZnbNrKCo
	J1DSuPmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtVX-0000000HLnw-2sG4;
	Mon, 03 Aug 2026 14:19:11 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtVT-0000000HLh2-43r1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 14:19:10 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-381b831d535so3845954a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 07:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766747; x=1786371547; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yBdhWQzJRHYryE9WZhMb9eq0tPTuw8+xNI5NcLDCCxE=;
        b=Obm+HmXCctnNPdmzNOEdXpXa13wV92o1mAH5yHJCN4lrIvF/pwLIDcs14YX9jM1FhJ
         wsotLPSiY23vtNwWeuPrXe1RPK73A2ygKdMwRI8s6nLQT1djU5CYeRCkbTTjjlyCgMOF
         Y+kr7sGAOfSe8JePqTmDGv8xnBVHPDp809KFBOlV9MGuOwOd+bKM2QxLfNFsUz5XYRb2
         DNqmZpViZWlFfTxe20jZtKCLMQ9/F0Gsj79tOI74lLkg2ZJtzFIMico39AXC4XdDggEz
         OWbqHZ0ddycZnYN6QZcaWmwZKhA9ucDos8WmMJByc6rKwpoGj3Fh2IhiVJ2ErCrlmZ/a
         gbeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766747; x=1786371547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yBdhWQzJRHYryE9WZhMb9eq0tPTuw8+xNI5NcLDCCxE=;
        b=YiLGWleOjY5CaMwH0vCHvNaSSM6QYhQexKQfDqCyxs4oqqvQoZG/37lgPTO5YyFh0q
         sVUIk0NITBOv0EH0JI55mmcA4KHJc0V4VZIn8WU6z734cWBAX8d9f2gduqaeNUZaI+pR
         Ywq5rvTWwyQrakG2lz975GfmC8sxW4u9EL3uvi9rcCV84Bj++I2fLlS1PQczQcsFNOr+
         J5GnANmaAWvdr/57iZfVwtWkWIIcrBY+q2dxav5dfdHE+xqDbvORgxhV/p8hW3CYSjFE
         dUs+WyQx6lNHdcgYEajW29mryJnwiEp8ngHAkZ0C30ZUuA7pvIWruso+aOn3xMYaIKG/
         8M3w==
X-Forwarded-Encrypted: i=1; AHgh+Rq6PUWh4P/AscvajG+esfX0vZqqoS+8BuRYe3ipsH3qCg4H/a40fJnZpSSgddwLoisbqolTeH4jWU+vJllJYXX1@lists.infradead.org
X-Gm-Message-State: AOJu0YwYNc/PIj0/ak2kDFVfKYI1cZ2XzJn+jhVQBBDgsec6drCtJGqY
	9jYosMFRbxYZFV4B8ubsd5Gp8f6uZwUlNOb/oq8cSkLZY7H4vJY1sLS+rloRW7iD
X-Gm-Gg: AR+sD11TSGe4He8WQhmaF/+Nt5jUylTEfGfFiuksVvBwwqPm9tSuYKgn6dF5AqjqRXU
	cdVzlcBbTL5iVQ/D3sje810u1N+iGrZ5vw/85Sx/xrasDbBzB5ekbjTE7ssVVeS80HkARoipvK6
	EdRLUJcMiS2CeCqSQkW1Q0LNt0L7+Re47LTjAnJMEiWQWpaActc4u4dRtAMczxX0RpHB8jJVV0m
	xTj3IE51pNu20TekjPqhSRbRlvegy3QNhrXdRrbpe9gSbDhl6v/HXuhKyfHpCzYI5PuCSU0eQwf
	C9HnXH8+7Oj3oMZ8cW1YzaKRjLy30Ij1XFLXhsczermNW6GEGCTJZbcVm715d7/bPGrurCP6yn3
	CPl5vA9g8mukq8zXz+WzKUrnaQQ6BzzYCE9AHr24Tx44iNf+6qlN58ldljyRAp3ahp3ZCd8MJCT
	nrmJLJYeLMeDbzRdF2yJV/eb7IxK7XBUpNs0tLaQzefpapHg9sEr0vaMosVI3MLz+xymscQJBi2
	BHImxyIA67GTX9iAyrp
X-Received: by 2002:a17:90b:2ecf:b0:38f:e6cf:4d6a with SMTP id 98e67ed59e1d1-38fe6cf4e03mr949891a91.41.1785766747241;
        Mon, 03 Aug 2026 07:19:07 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:19:06 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Kees Cook <kees@kernel.org>,
	Miles Chen <miles.chen@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Sam Shih <sam.shih@mediatek.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	netdev@vger.kernel.org (open list:PTP HARDWARE CLOCK SUPPORT:Keyword:(?:\b|_)ptp(?:\b|_)),
	stable@vger.kernel.org
Subject: [PATCH 22/32] clk: mediatek: mt7988-apmixed: Switch to common probe/remove helpers
Date: Mon,  3 Aug 2026 23:16:49 +0900
Message-ID: <20260803141659.559129-23-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803141659.559129-1-akkun11.open@gmail.com>
References: <20260803141659.559129-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_071908_028240_7E101729 
X-CRM114-Status: GOOD (  14.99  )
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

The MT7988 apmixed driver can use the MediaTek clock framework common
initialization sequence. Reduce boilerplate code by creating
struct mtk_clk_desc and using the mtk_clk_simple_probe/remove helpers.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt7988-apmixed.c | 39 ++++++-----------------
 1 file changed, 9 insertions(+), 30 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt7988-apmixed.c b/drivers/clk/mediatek/clk-mt7988-apmixed.c
index 24f4e7b87a31..f7bb00e7d17a 100644
--- a/drivers/clk/mediatek/clk-mt7988-apmixed.c
+++ b/drivers/clk/mediatek/clk-mt7988-apmixed.c
@@ -71,47 +71,26 @@ static const struct mtk_pll_data plls[] = {
 	    0, 0x0318, 0, 0x0314),
 };
 
+static const struct mtk_clk_desc apmixed_desc = {
+	.plls = plls,
+	.num_plls = ARRAY_SIZE(plls),
+};
+
 static const struct of_device_id of_match_clk_mt7988_apmixed[] = {
-	{ .compatible = "mediatek,mt7988-apmixedsys" },
+	{ .compatible = "mediatek,mt7988-apmixedsys", .data = &apmixed_desc },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt7988_apmixed);
 
-static int clk_mt7988_apmixed_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	int r;
-
-	clk_data = mtk_alloc_clk_data(ARRAY_SIZE(plls));
-	if (!clk_data)
-		return -ENOMEM;
-
-	r = mtk_clk_register_plls(&pdev->dev, plls, ARRAY_SIZE(plls), clk_data);
-	if (r)
-		goto free_apmixed_data;
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r)
-		goto unregister_plls;
-
-	return r;
-
-unregister_plls:
-	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
-free_apmixed_data:
-	mtk_free_clk_data(clk_data);
-	return r;
-}
-
 static struct platform_driver clk_mt7988_apmixed_drv = {
-	.probe = clk_mt7988_apmixed_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt7988-apmixed",
 		.of_match_table = of_match_clk_mt7988_apmixed,
 	},
 };
-builtin_platform_driver(clk_mt7988_apmixed_drv);
+module_platform_driver(clk_mt7988_apmixed_drv);
 
 MODULE_DESCRIPTION("MediaTek MT7988 apmixedsys clocks driver");
 MODULE_LICENSE("GPL");
-- 
2.55.0


