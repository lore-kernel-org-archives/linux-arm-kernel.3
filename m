Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C5510ED67F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 15:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QbkRIDt0qoYiA3XO98bAEG4jglboobxHd9T2H+sRSRo=; b=INrorsH+sVVnb9YCn0qqfa403o
	pu4RGv2WZe2ntR4JmFxL84jN+T+EwAEkxiFqjiLXAn/X4Q4WV96Y1CwawjqKI+eS4MdlXDDnOckbI
	YTvw/Snix5A+M3sLiwe/va59VyUlu/W2iZkVp4fY5kUN4hyy6rcQss+UOQTQTLpeK00ljyafJEX5i
	c+58whDm+mhdT0qLwN1DNl7kPXDatf3RbddVJirsOmDJt4v3FgDnon+qOqrV54tmbMYh2Sd1C7No+
	2Lwxw7SZm+YLHRNhrJfjmn5jE2NG4oc7MtqcVEyqNVmmMUYABkXDpvjysHaoyXn136KyCNhnFxOSB
	X2PaP66w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w68sY-00000007f2a-171j;
	Fri, 27 Mar 2026 15:13:42 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w68sU-00000007f2D-3NGC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 15:13:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=QbkRIDt0qoYiA3
	XO98bAEG4jglboobxHd9T2H+sRSRo=; b=iFk7N04cl8TO6mkuDYPYVsx2O8GzUR
	UzXdbVmAxbwiFbu++SIoVEWvSBJZnYY7bBPK6O6r6niT+pv7IJv5pnNzpBhB6cCp
	v7x398eH4gOGpO+IPsafqbTcI4zPhBQCuEKhJWEvOlVewo45GFxU6moJSISYmp7y
	eF8mo9yIGRGpzLTo+aMXpo///wke5tjj/VNhSDCVFLWnEpsysyqc1j57BMw4WmNK
	Y/iZkz2hvv1LMSpLUOQpUwejlwAPNMer2647xxfHfqynH8J7qB2VnUM5UoZZXUfg
	F42N6wK+8wLO3ChhEworuX8mjVGgYaXN0WAfXqsUzP4ixzcNE+NaW7fg==
Received: (qmail 235509 invoked from network); 27 Mar 2026 16:13:35 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Mar 2026 16:13:35 +0100
X-UD-Smtp-Session: l3s3148p1@Ugjk8QJOXuxUhsJN
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] mailbox: exynos: drop superfluous mbox setting per channel
Date: Fri, 27 Mar 2026 16:12:46 +0100
Message-ID: <20260327151332.5425-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_081340_132181_B6354718 
X-CRM114-Status: GOOD (  10.80  )
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

The core initializes the 'mbox' field exactly like this, so don't
duplicate it in the driver.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Tested-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Changes since v1:
* rebased to 7.0-rc5
* add tags (Thanks, Tudor!) and dropped RFT

 drivers/mailbox/exynos-mailbox.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/mailbox/exynos-mailbox.c b/drivers/mailbox/exynos-mailbox.c
index 5f2d3b81c1db..d2355b128ba4 100644
--- a/drivers/mailbox/exynos-mailbox.c
+++ b/drivers/mailbox/exynos-mailbox.c
@@ -99,7 +99,6 @@ static int exynos_mbox_probe(struct platform_device *pdev)
 	struct mbox_controller *mbox;
 	struct mbox_chan *chans;
 	struct clk *pclk;
-	int i;
 
 	exynos_mbox = devm_kzalloc(dev, sizeof(*exynos_mbox), GFP_KERNEL);
 	if (!exynos_mbox)
@@ -129,9 +128,6 @@ static int exynos_mbox_probe(struct platform_device *pdev)
 	mbox->ops = &exynos_mbox_chan_ops;
 	mbox->of_xlate = exynos_mbox_of_xlate;
 
-	for (i = 0; i < EXYNOS_MBOX_CHAN_COUNT; i++)
-		chans[i].mbox = mbox;
-
 	exynos_mbox->mbox = mbox;
 
 	platform_set_drvdata(pdev, exynos_mbox);
-- 
2.51.0


