Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C57C369A8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 11:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vuIom+FPWid16xa2Zd6WG2DHLqsqs5q3lkN6U8Dg2PI=; b=fZz9q0M0b9o5hZeWz1fZu6MBaC
	caDQ+nJc4umW8nPx7F4HHcSWh+ZWcdMbQXnHZQcfVR0r/XXvdGo7EshfTxc5QvNq6IVW42x/I7Lew
	b/8w4td6b/k5HUkQB18K8MCKOxd1SOv1rEJCS6DSMkWqwAmHXOb796Fy/MbKh94COJdauoQkms8rW
	lz+Guuw1Ky5ZxT9pn6EcSotIpAiNq71elMnNPj3Ve0RC7gDWS+I6vNjb2WDn9c9JF8xIjc85TBiZa
	6oK0EOzvsRijTnq1E7+ncagpd6TqZ8K00DXwg7v5wVJQft5G9pB45mg58GLuTHb8TS/vGSU60U7dn
	APGTnjUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2qWv-0000000AOj6-0c8F;
	Thu, 10 Apr 2025 11:57:13 +0000
Received: from unicorn.mansr.com ([2001:8b0:ca0d:1::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2qTV-0000000AO75-11yL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 11:53:42 +0000
Received: from raven.mansr.com (raven.mansr.com [IPv6:2001:8b0:ca0d:1::3])
	by unicorn.mansr.com (Postfix) with ESMTPS id D4E3C15360;
	Thu, 10 Apr 2025 12:53:34 +0100 (BST)
Received: by raven.mansr.com (Postfix, from userid 51770)
	id C35A421A3DC; Thu, 10 Apr 2025 12:53:34 +0100 (BST)
From: Mans Rullgard <mans@mansr.com>
To: Mark Brown <broonie@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pan Nan <pannan@allwinnertech.com>,
	Maxime Ripard <mripard@kernel.org>,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] spi: sun4i: add support for GPIO chip select lines
Date: Thu, 10 Apr 2025 12:53:03 +0100
Message-ID: <20250410115303.5150-1-mans@mansr.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_045341_419364_6BF145C8 
X-CRM114-Status: GOOD (  10.02  )
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

Set use_gpio_descriptors to true so that GPIOs can be used for chip
select in accordance with the DT binding.

Signed-off-by: Mans Rullgard <mans@mansr.com>
---
 drivers/spi/spi-sun4i.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi-sun4i.c b/drivers/spi/spi-sun4i.c
index 2ee6755b43f5..6645d218bcf3 100644
--- a/drivers/spi/spi-sun4i.c
+++ b/drivers/spi/spi-sun4i.c
@@ -462,6 +462,7 @@ static int sun4i_spi_probe(struct platform_device *pdev)
 	sspi->host = host;
 	host->max_speed_hz = 100 * 1000 * 1000;
 	host->min_speed_hz = 3 * 1000;
+	host->use_gpio_descriptors = true;
 	host->set_cs = sun4i_spi_set_cs;
 	host->transfer_one = sun4i_spi_transfer_one;
 	host->num_chipselect = 4;
-- 
2.49.0


