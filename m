Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A901CD37B6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 05:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AyyMPtOl9wP1fMDaeO+c2BR6cLsA+AOebpc5PnOHZCg=; b=m1zn4xG1Zo9vXS6xHy+0Oy5C4B
	lQ5LmA+2IMjML2cRrkxdc/CTbPoHIc9e8Twh+yw064yhCksczS/DUnFnuuw/zDP+dggPSoh9AAmla
	4VfUADBWEVq6lqh1vMx3BBMSkErYLin8nzXW8mwqxiZzamVs6hlNdXKJZSDDxc3EIToo3uV+3LzKp
	1Whhit2rXSAOtmnyk8ddYhDI3jrRGGX7plMwB+iojuOmpfquyR+PcbgWyEcDTp8amY3CGokBBy0SO
	O2cmAk4YdcyDiiBKVqE0wjGl1ZNi4/uYP6If6PTA+WVxxDbcpkGl3thcdRAG9WwVoiNtTiYNNC6WR
	6eSZrZnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN1iJ-00000001H4i-3lFD;
	Wed, 13 May 2026 05:00:55 +0000
Received: from s106b.cyber-folks.pl ([195.78.66.88])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN1iD-00000001H1x-1aQF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 05:00:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=AyyMPtOl9wP1fMDaeO+c2BR6cLsA+AOebpc5PnOHZCg=; b=RY1eRyoqg4Dh7MoMTripUeubfu
	CjYcbXK8Br0OzeBE8cj4nFlg2G3PCFY1sdNBhtX7JLTiVfboFHlSjUX37ckPrtaWf+6XAXCcJNkBO
	BBiWbWCf16FpppES1CX0ROZOXpRdzRjQMkdTN9+GrQ8Btg1nzXFYc80LowtuCttwPnQJSNVD4gOCi
	GSHuSymhjmOAOhaUbAGwz4UNlRUfJR2l6KeaxMAxpx9MRny9pxzXYDj9ZTb4AZrDZFzuvsdDxG0Ec
	+6+mYLWL4+AZnV+Oew1S2kkaHOOu1sb3q/3m6WYUX0e5rJhVAkwEci2Rl6WQP3er/g+BzDiZ7peWI
	Mk6pPY1A==;
Received: from [91.102.182.218] (helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1wN1iA-0000000EbXi-35LL;
	Wed, 13 May 2026 07:00:46 +0200
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Date: Wed, 13 May 2026 06:59:43 +0200
Subject: [PATCH v2 2/3] iio: adc: sun20i-gpadc: add A523 gpadc support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-sunxi-a523-gpadc-v2-2-d5efde151dac@mmpsystems.pl>
References: <20260513-sunxi-a523-gpadc-v2-0-d5efde151dac@mmpsystems.pl>
In-Reply-To: <20260513-sunxi-a523-gpadc-v2-0-d5efde151dac@mmpsystems.pl>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778648397; l=1618;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=I8HMsZirgXX885nuJJP7JQN223GiZKMXE/BN5ZNXDh0=;
 b=9R/92n4OO7rz0UOg1KOojjxsQ2ixBGVbfkuPW7Agy7qsR5pS/ZHeTurTPQj4ZBpnEIsCSNCw/
 bfrCRcMH9Z9BVQcIIjvB/FZe9zMtH/Oz45RFgKuEGbks/H4kdnS62EH
X-Developer-Key: i=michal.piekos@mmpsystems.pl; a=ed25519;
 pk=Aixyx03If7ZDamiKKN0lsa+0mtA+WjIuIf2ZQVYNBqg=
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_220049_585607_66B7F3E6 
X-CRM114-Status: GOOD (  12.29  )
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
 drivers/iio/adc/sun20i-gpadc-iio.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/adc/sun20i-gpadc-iio.c b/drivers/iio/adc/sun20i-gpadc-iio.c
index 861c14da75ad..3f1f07b3a385 100644
--- a/drivers/iio/adc/sun20i-gpadc-iio.c
+++ b/drivers/iio/adc/sun20i-gpadc-iio.c
@@ -180,7 +180,7 @@ static int sun20i_gpadc_probe(struct platform_device *pdev)
 	struct iio_dev *indio_dev;
 	struct sun20i_gpadc_iio *info;
 	struct reset_control *rst;
-	struct clk *clk;
+	struct clk_bulk_data *clks;
 	int irq;
 	int ret;
 
@@ -205,9 +205,11 @@ static int sun20i_gpadc_probe(struct platform_device *pdev)
 	if (IS_ERR(info->regs))
 		return PTR_ERR(info->regs);
 
-	clk = devm_clk_get_enabled(dev, NULL);
-	if (IS_ERR(clk))
-		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable bus clock\n");
+	ret = devm_clk_bulk_get_all_enabled(dev, &clks);
+	if (ret <= 0)
+		return dev_err_probe(
+			dev, ret,
+			"failed to enable clocks or no clocks defined\n");
 
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


