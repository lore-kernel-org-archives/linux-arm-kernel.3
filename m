Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC43CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 13:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=INVeGEZOFmKs0Tl9WJDgUcfquzKy7GBBrgR06GMQiFE=; b=QQI6124zA1aKwIDz2uIZJr5QAv
	AORcWuGHHYoUH5Cc75JDtBhRppLP99FSaVEvhanTQ93AumeecZR7l4QFw1aHYTSRqVYt1GvsTamG4
	NkBqRGvCBV7TXn6QcbHBrvf8TBJ3LvdIKxy68QyjCNFU5MReQsh5wnjXxihVL2HRJC1aDlL2mTOJp
	9SCGqSf5v3xL1bfGOqK8hlo04Yp+J6R22WDnBT0W2JN3+4wq7Uiw0htlAQZehYshpkyn9KBEhuQP2
	r0IXpHH7d1l1Bk8TVay6IpYsRyRvbJ5fhatiyMf5/EXr6A2gQqiMbqEuSH3Lu3iOaqM+Ly4Bl22PX
	1BCatZJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM3na-0000000AoWc-0LT7;
	Sun, 10 May 2026 13:02:22 +0000
Received: from s106b.cyber-folks.pl ([195.78.66.88])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM3nW-0000000AoUw-1XCv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 13:02:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=INVeGEZOFmKs0Tl9WJDgUcfquzKy7GBBrgR06GMQiFE=; b=I/TX8n6KBHc4FG4306tGjJdHS9
	CnyzQv59+wEDbOO+zYkBOidoGTBe2phjBSU8qZaD33yvABQz5zyge7dfy9XaMgWBZww11H7uLXl89
	eI2+ibopTJWbZiVP4qMNe1E3OXuEfDVk+H+n+W9h/gxSDHKVKUSSHMORhwSQtd1v8cdinPJ9aawuZ
	dviaGHrklpkCCXeoANMVb8I7MbcAiGhukOLXAhKE95jw9RTeTjCZwGUGeXSyazaENl8uz1k2fmKMQ
	oCetwHr8ge1MuLYlPeMwCqMzforkcKeGwIHphe9ug8HrmN98TqWDbMfurSk5Vt6EuqmEj29QqWYBO
	YphXMWSA==;
Received: from user-188-33-36-99.play-internet.pl ([188.33.36.99] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1wM3nT-0000000DUl7-2bMM;
	Sun, 10 May 2026 15:02:15 +0200
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Date: Sun, 10 May 2026 14:57:23 +0200
Subject: [PATCH 2/3] iio: adc: sun20i-gpadc: add A523 gpadc support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260510-sunxi-a523-gpadc-v1-2-4f6b0f4000fb@mmpsystems.pl>
References: <20260510-sunxi-a523-gpadc-v1-0-4f6b0f4000fb@mmpsystems.pl>
In-Reply-To: <20260510-sunxi-a523-gpadc-v1-0-4f6b0f4000fb@mmpsystems.pl>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778417853; l=1275;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=8W/e7Tc7AKga7S1oho/nSvDoTgXmWjUgZtFOjdd9w5I=;
 b=a69kXrDPJ999nB3ARMTjh8GE016krvQqW2Av1dPHiwU8ZyZn+x+JZfw83Yjut8j6vI6mxUfzu
 JqghI7ZFH3pDpq7BxNAimCXUeflNWcs8+hh+x+B+41Z/OhzrSEHuSxm
X-Developer-Key: i=michal.piekos@mmpsystems.pl; a=ed25519;
 pk=Aixyx03If7ZDamiKKN0lsa+0mtA+WjIuIf2ZQVYNBqg=
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_060218_571070_F37870DD 
X-CRM114-Status: GOOD (  11.31  )
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
 drivers/iio/adc/sun20i-gpadc-iio.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/adc/sun20i-gpadc-iio.c b/drivers/iio/adc/sun20i-gpadc-iio.c
index 861c14da75ad..dd4c7e6e3d76 100644
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
 
@@ -205,9 +205,9 @@ static int sun20i_gpadc_probe(struct platform_device *pdev)
 	if (IS_ERR(info->regs))
 		return PTR_ERR(info->regs);
 
-	clk = devm_clk_get_enabled(dev, NULL);
-	if (IS_ERR(clk))
-		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable bus clock\n");
+	ret = devm_clk_bulk_get_all_enabled(dev, &clks);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to enable clocks\n");
 
 	rst = devm_reset_control_get_exclusive(dev, NULL);
 	if (IS_ERR(rst))

-- 
2.43.0


