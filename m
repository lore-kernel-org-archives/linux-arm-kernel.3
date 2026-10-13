Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA76CC6B19
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 15:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eNskGVCiRsgKaHbOLvQq8UPjRNKhURtaGmxGS4VhhxA=; b=u+z2nigaaWsYSNbPpcAfBgL1uY
	YPFCFXdjttvn1k2d5fmRLwq6utZr5UuDN34l5pTUk0xiCpZUVw/0f5Vby5mq/Qb+eAx7Qu3Zc0VmO
	GaWMtfkTSlKpvffuiI1NvyR0qkRpm6kJtvzPzN+xC2XCR/GrkTXph3laDI+LqsGbD5WJLgp1mjWup
	kHs1BEKNbqprrIw3+L4Oj0ulHNL9fJpRf48e6eCq4c35r4y1QMbzL1o9n2q3fLZ6HWGrZvFtNlrMh
	7VUEgMe+TN0oFM/u8TSOjw/MrFFEb2Vslrb3NQ1blDedwbFpYNC8URBTupUU/a/8PPCVDfdMt/i+J
	ngurh1Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeJ2-0000000DI82-28Jk;
	Tue, 13 Oct 2026 15:20:44 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeIY-0000000DHo0-2UBX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 15:20:16 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-cd60c5da24cso1142619a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 08:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904814; x=1792509614; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eNskGVCiRsgKaHbOLvQq8UPjRNKhURtaGmxGS4VhhxA=;
        b=s6VtJYVrMhBn1ITpn/RiHZ6vIyhC3GcS7gN44m1Z0GEo6D1D6QTLDE8e2SHQ8HKeOu
         DpD4vAZaxwo76Jku47pjdR8cp7+n4mLGl7L8uPmUfB7dAawusdhuAhP9wy/9bgr89JuA
         hEgfu2Wno9DkdEUuBOkXc/oMq4zd5VfFXjpgpWNmQNsj07kzzmNi7P6qHE4jETi3YwJq
         0/VDNCRObMpEQAB7oLzA+5oKWK/RyW7p2FlsST7DacKVrIabDAxjpQeuc1KBCIE99Z9h
         ERqb9dDaK+YXHXvlZhj2vd2ajipeewMwE1QmF5W6bZM+2wFioIK/A+k5QiDM3uZh6/VJ
         1Nqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904814; x=1792509614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eNskGVCiRsgKaHbOLvQq8UPjRNKhURtaGmxGS4VhhxA=;
        b=wMsTwLu9Q/4/k/+6I++OlWZ30u6OUdX4+uqhU3bZzqjOHafoCIA1ZgtEd4c8HVi6O2
         VY79WpOIZ1BYHfhh+JtnnS7F1LPGvu8j7VvNHYqJCYXaky3GzxMWF5Q6hKAO6EbvFjCh
         XbfA/WX0S/AaQGAdtyqjLADpKu390Hy5s2uoGSMpzsGZQakzLgApJ2FWu507VWv0+p7k
         vOoWyGT0UthfFsXlujGN7owasPjySgC2DmvzhuKE69WiMS9v5u16dRAS4kNC2sale7p4
         M+AxpP+sGQTYDkVy0VOBu/9aN6404TTTkKar7K/Jm0VV03F/DvyXVShpi+59Kuuwj8nB
         ShGw==
X-Forwarded-Encrypted: i=1; AKwUvBy3QAZ6GR1RBfRJSygIOJxCXcJAthBl7tnR4YKBjGNSa26ENnK5Xy5tOjQvRMEowHWskn4MPOHSaF3VVyIZLLf2@lists.infradead.org
X-Gm-Message-State: AFq9FYJyivLN3Fak6cXjRA5EX2L5T1dl2EUdiM8NZRvgb6ot9mSlznaT
	IN28apikUgF5iUNMhzPSXCgyxsBkvMTqZAXtzYNbTn0X1KZTM39dkc4Q
X-Gm-Gg: AYBFou3E+MJpUns+yJUL+GZnhSFc0r64Owv8OvtyvJBpBJ4erUXPgyWLgioo9Sb3pEm
	s27lWn/vY0ap1Be3S960E1+4c1zTklY0wtjKONd5XUHDpbPJrUZbWxZRKlQR/i1mjF+Mleh2tIE
	l4yzV5v+nMAvpwFxXE4icwJPfiWQl49/7ZxRAlp2bB3HytqpzORTwZDzDHaUVOJc2/6adjNmd4z
	M19jHkMS/Tf6n54emQgfyNhviHwLO5fI1AYxyEBoZeQH9J2bLVTD+8IY/qWE3pySsPWfRZzTIU3
	Bv5xs00wuh/JPZHDB1jWr+Urjm16urFn/s+8rIlMmN5e+E7uuYRpUJ5lMm1lBT2TiIAcW59oM4o
	9MQvT5pz+DDbUGiS0YEc8Kw4IuakhTkj5GPwIbXfooB2T+EshYQg47kALQhqSn25At7FvVp1Z24
	4WL5VyGjm7f0qzjwGOdn4W6sFa3+xVz909zgyYr/h+6RHhuiJ/bhSUeK2H1B7g4upHsswL/59S4
	auz5nxoHAJSvq29VC7CfHoaAUK6
X-Received: by 2002:a05:6a20:549d:b0:3df:f4a5:dca7 with SMTP id adf61e73a8af0-3e16bd88afdmr13497701637.16.1791904813806;
        Tue, 13 Oct 2026 08:20:13 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:20:13 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Miles Chen <miles.chen@mediatek.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH v2 23/35] clk: mediatek: mt7981-apmixed: Switch to common probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:22 +0900
Message-ID: <20261013151734.3177690-24-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_082014_751061_D47D1378 
X-CRM114-Status: GOOD (  18.47  )
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

The MT7981 apmixedsys driver used a custom probe to register PLLs but
had no remove callback. With PLL registration and unregistration
handled by the common helpers,
the driver can use mtk_clk_simple_probe() and mtk_clk_simple_remove().

Switch to module_platform_driver() and change the Kconfig
setting to "tristate" to support module builds and ensure
that registered clocks are unregistered on module removal.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Changes in v2:
- Improvement of commit messages
---
 drivers/clk/mediatek/Kconfig              |  2 +-
 drivers/clk/mediatek/clk-mt7981-apmixed.c | 37 ++++++-----------------
 2 files changed, 10 insertions(+), 29 deletions(-)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index be522c43fa42..54ecf2692607 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -427,7 +427,7 @@ config COMMON_CLK_MT7629_HIFSYS
 	  to PCI-E and USB.
 
 config COMMON_CLK_MT7981
-	bool "Clock driver for MediaTek MT7981"
+	tristate "Clock driver for MediaTek MT7981"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
 	select COMMON_CLK_MEDIATEK
 	default ARCH_MEDIATEK
diff --git a/drivers/clk/mediatek/clk-mt7981-apmixed.c b/drivers/clk/mediatek/clk-mt7981-apmixed.c
index 851d0bc7840a..810395aff253 100644
--- a/drivers/clk/mediatek/clk-mt7981-apmixed.c
+++ b/drivers/clk/mediatek/clk-mt7981-apmixed.c
@@ -59,45 +59,26 @@ static const struct mtk_pll_data plls[] = {
 	    0x0278, 4, 0, 0x027C, 0),
 };
 
+static const struct mtk_clk_desc apmixed_desc = {
+	.plls = plls,
+	.num_plls = ARRAY_SIZE(plls),
+};
+
 static const struct of_device_id of_match_clk_mt7981_apmixed[] = {
-	{ .compatible = "mediatek,mt7981-apmixedsys", },
+	{ .compatible = "mediatek,mt7981-apmixedsys", .data = &apmixed_desc },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt7981_apmixed);
 
-static int clk_mt7981_apmixed_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	int r;
-
-	clk_data = mtk_alloc_clk_data(ARRAY_SIZE(plls));
-	if (!clk_data)
-		return -ENOMEM;
-
-	mtk_clk_register_plls(&pdev->dev, plls, ARRAY_SIZE(plls), clk_data);
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r) {
-		pr_err("%s(): could not register clock provider: %d\n",
-		       __func__, r);
-		goto free_apmixed_data;
-	}
-	return r;
-
-free_apmixed_data:
-	mtk_free_clk_data(clk_data);
-	return r;
-}
-
 static struct platform_driver clk_mt7981_apmixed_drv = {
-	.probe = clk_mt7981_apmixed_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt7981-apmixed",
 		.of_match_table = of_match_clk_mt7981_apmixed,
 	},
 };
-builtin_platform_driver(clk_mt7981_apmixed_drv);
+module_platform_driver(clk_mt7981_apmixed_drv);
 
 MODULE_DESCRIPTION("MediaTek MT7981 apmixedsys clocks driver");
 MODULE_LICENSE("GPL");
-- 
2.56.0


