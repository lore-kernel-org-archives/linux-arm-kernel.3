Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6FBECD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 May 2026 05:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=blOC+9GmrnWG7CFQB7EzYgUnvF3WIzCMlYztxn2jcGY=; b=jf+TEC3a1xrOJhlvY4QzdlZ41A
	p3QHUpbFS2LJrx5Ke4qyCFXxgETQX5aavYHryCerbEKI5p41uH/7MkMhYFxoXOGxgAU0cnTNB55gX
	5lEO0HFHtifzuxuheRKWgCW59eukbZCl69uj7XNIkCr1SoQT1u6Bc3YdBRdc+ODHy0VyoQBQJknvf
	s8wkf+iQ7T4uOgOvqrgg2LKWjtvpJTWucACj/LZydQcXmgGFcwjrAU3EhdkVdkrrSWgFTjbA1WwbJ
	zq2V1a2OHAI2uBuJT4atP7rku3tPqyuyubDIefNNVdh4IhiVct+ytwx99ruwvK+DPVlZojXQNmDqS
	NBBtPCnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO7gF-0000000ABEh-3eK5;
	Sat, 16 May 2026 05:35:19 +0000
Received: from s106b.cyber-folks.pl ([195.78.66.88])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO7g8-0000000ABCN-2JnX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 May 2026 05:35:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=blOC+9GmrnWG7CFQB7EzYgUnvF3WIzCMlYztxn2jcGY=; b=vlv4aCyJ7sEQL7yIA+Gp8/H1HR
	HL9cwXW0wkMkcS59YEgPipo52rxkEccXxBNGM2PLXu+mcWOVwGMtQHrQnMASJE44D4vPQ7pSzrW4R
	W9f6HkPBe8txvX2ixjyKeapO77iF/YjKvDDp9daS05DOLDNbW3zSmDjV57r0c0tW1UqCr8PM509js
	JXOR7559rxhrvSBB9s4Y5OdpyyCo7oPcoFLBTTzs+rE9RT4Zi/0Etgo+c2+zjHMA60yG8yaQt7c5+
	LaLsSxEi23lymkWD2we5tMpzdwiN9C3lz3JBJmENnedSW1LOdnCzMVX8wZF+55QOL3OcIRNsCVLMc
	LWyTPtLA==;
Received: from [91.102.182.218] (helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.3)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1wO7g4-0000000GeLc-3o1Z;
	Sat, 16 May 2026 07:35:08 +0200
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Date: Sat, 16 May 2026 07:34:15 +0200
Subject: [PATCH v3 2/3] iio: adc: sun20i-gpadc: add A523 gpadc support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260516-sunxi-a523-gpadc-v3-2-a3a04cff2620@mmpsystems.pl>
References: <20260516-sunxi-a523-gpadc-v3-0-a3a04cff2620@mmpsystems.pl>
In-Reply-To: <20260516-sunxi-a523-gpadc-v3-0-a3a04cff2620@mmpsystems.pl>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Maksim Kiselev <bigunclemax@gmail.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Michal Piekos <michal.piekos@mmpsystems.pl>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778909655; l=1815;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=1Ywoj2EChrJkdIEVIClwgbqPkSpkodGiY8WCoxjST1Y=;
 b=fHu1kIpSQz5NOHUcuTQyr3ZHoZwMqVqYAJV12YvtSVwZh3SbwGo3xim22zw1ZdFQ7OVN65+oZ
 w7vY3Ltv3aVD8j7hVj/S/TanLH2DcaAChPgAb9/tw9flsmeRxbux0y8
X-Developer-Key: i=michal.piekos@mmpsystems.pl; a=ed25519;
 pk=Aixyx03If7ZDamiKKN0lsa+0mtA+WjIuIf2ZQVYNBqg=
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_223512_768209_5358E835 
X-CRM114-Status: GOOD (  14.10  )
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

A523 differs from existing sun20i-gpadc-iio by having two clocks; bus
clock and module clock.

Change driver to enable all clocks.

Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
---
 drivers/iio/adc/sun20i-gpadc-iio.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/sun20i-gpadc-iio.c b/drivers/iio/adc/sun20i-gpadc-iio.c
index 861c14da75ad..f5fd2240b808 100644
--- a/drivers/iio/adc/sun20i-gpadc-iio.c
+++ b/drivers/iio/adc/sun20i-gpadc-iio.c
@@ -177,10 +177,10 @@ static int sun20i_gpadc_alloc_channels(struct iio_dev *indio_dev,
 static int sun20i_gpadc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct iio_dev *indio_dev;
 	struct sun20i_gpadc_iio *info;
+	struct clk_bulk_data *clks;
 	struct reset_control *rst;
-	struct clk *clk;
+	struct iio_dev *indio_dev;
 	int irq;
 	int ret;
 
@@ -205,9 +205,11 @@ static int sun20i_gpadc_probe(struct platform_device *pdev)
 	if (IS_ERR(info->regs))
 		return PTR_ERR(info->regs);
 
-	clk = devm_clk_get_enabled(dev, NULL);
-	if (IS_ERR(clk))
-		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable bus clock\n");
+	ret = devm_clk_bulk_get_all_enabled(dev, &clks);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to enable clocks\n");
+	if (ret == 0)
+		return dev_err_probe(dev, -ENODEV, "needs at least one clocks\n");
 
 	rst = devm_reset_control_get_exclusive(dev, NULL);
 	if (IS_ERR(rst))
@@ -243,6 +245,7 @@ static int sun20i_gpadc_probe(struct platform_device *pdev)
 
 static const struct of_device_id sun20i_gpadc_of_id[] = {
 	{ .compatible = "allwinner,sun20i-d1-gpadc" },
+	{ .compatible = "allwinner,sun55i-a523-gpadc" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sun20i_gpadc_of_id);

-- 
2.43.0


