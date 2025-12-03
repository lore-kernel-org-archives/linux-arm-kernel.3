Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 213E4D15DAC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 15:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XUeXsVrvtHb9OKgUIzZYTp1SDhn/Xuk/VDyLgcDgNTU=; b=U0ku3gXUHeun2QNAg8ZpdZ2/To
	UQo+b5EFJhA382lrrk1pt9t3mN/ryfNv34h9PygUS1VlXEKuUF35z4zR+u2yGqR85UWog4RqtUO1y
	hPNcECvVRJjeRJJdn0ZIzivvSh5j6sPGsoTT76efUREh326uTdSueh0qN+83JiNxL5BkdL9Mjknsv
	psq0sfUCDGfMzpYzcjAZEOski36P1w/nQJukwFHlj2EpcB6ClvL/fTXFr3VClR9KBiBpAEx8+HbF9
	BOjxNkE2RJhhNXst3139cAUL9/Cw3FPyZZvpWu24+czavaSUqn273CmZxoNojA6m8rwtFjN4Y70uq
	0mLlq5pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQpAz-00000006jTH-1fLe;
	Wed, 03 Dec 2025 15:53:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQpAo-00000006jAS-1LYS
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 03 Dec 2025 15:53:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=XUeXsVrvtHb9OKgUIzZYTp1SDhn/Xuk/VDyLgcDgNTU=; b=fVaGPZr3FM2/Ie3yslLC89pJUq
	erkUi2dz2UoBo1mnfxEaCIPhmrB2PYqjG0KNY/VVbC5VIXwjikXK2zXtpNpe57FJfmh1Bp70EfRYE
	UwPnw6kYj+uuOl5q1Ytm617Poh7uNWre7UKXGNwYOgNiQYePfz9I/hiCco4Lc0/KFZPB/xfLh/rtb
	MK2zD1AxSey7bXlU4oNkzsU2YrQhEUAlyj+4F3qf7HC7AeW+dmP6NebhkcS+cgmW2wz2gSC8mQcZM
	zvIjBmF41ZsO3mUKewrgVDFD7UuvUEiUZ8sPUhDGctyw+IsDZ9kkTY4joPmYNAK4nhQDm2UFimsgC
	bmiP4t1w==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQoJB-00000002TB8-0QjW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 14:58:25 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1vQpAe-0007dW-SI; Wed, 03 Dec 2025 16:53:36 +0100
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Wed, 03 Dec 2025 16:52:42 +0100
Subject: [PATCH v2 20/22] media: rockchip: rga: disable multi-core support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251203-spu-rga3-v2-20-989a67947f71@pengutronix.de>
References: <20251203-spu-rga3-v2-0-989a67947f71@pengutronix.de>
In-Reply-To: <20251203-spu-rga3-v2-0-989a67947f71@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_145821_309358_20F0BAC0 
X-CRM114-Status: GOOD (  12.59  )
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

Disable multi-core support in preparation of the RGA3 addition. The
RK3588 SoC features two equal RGA3 cores. This allows scheduling of the
work between both cores, which is not yet implemented. Until it is
implemented avoid exposing both cores as independent video devices to
prevent an ABI breakage when multi-core support is added.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 3958e71b8987d..65686228b7300 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -660,6 +660,30 @@ static int rga_parse_dt(struct rockchip_rga *rga)
 	return 0;
 }
 
+static int rga_disable_multicore(struct device *dev)
+{
+	const char *compatible;
+	struct device_node *node;
+	int ret;
+
+	/* Intentionally ignores the fallback strings */
+	ret = of_property_read_string(dev->of_node, "compatible", &compatible);
+	if (ret)
+		return ret;
+
+	/* first compatible node found from the root node is considered the main core */
+	node = of_find_compatible_node(NULL, NULL, compatible);
+	if (!node)
+		return -EINVAL; /* broken DT? */
+
+	if (dev->of_node != node) {
+		dev_info(dev, "missing multi-core support, ignoring this instance\n");
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
 static int rga_probe(struct platform_device *pdev)
 {
 	struct rockchip_rga *rga;
@@ -670,6 +694,10 @@ static int rga_probe(struct platform_device *pdev)
 	if (!pdev->dev.of_node)
 		return -ENODEV;
 
+	ret = rga_disable_multicore(&pdev->dev);
+	if (ret)
+		return ret;
+
 	rga = devm_kzalloc(&pdev->dev, sizeof(*rga), GFP_KERNEL);
 	if (!rga)
 		return -ENOMEM;

-- 
2.52.0


