Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6919DC197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 23:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yqEwWlUZDq0Txag0fXynIFrfcQyzgDnSEpECCqKM8dY=; b=HGuNAgNoexcKu7v+WXJ5o6hvIk
	FNXt9lrHa15nE0hTMN60i/IC6kkK5fbOv8+vo0P1msn+/JeeoKgcUrdSz2c7VwZQHrDapvF/2htkk
	tEHB6M4xqLEQM+pBV8WSvOtfiLA0pCsuo28d06WheE+CXVzzFyZQhg4GL6yXVJyF0w8D9n7UTkv8G
	VvgKh5JGkfMeQLvdPRGnMm3C54BSfet67ebnVzkohlE2fRLcjnnpkoCr2C3bc1Rcg5OJekY43X1IC
	ngIT/Rx93pTlrZUTS5O2ktJdJgG/+4JcRK7n5SSTwTUsIz2Pjx9JYfCiGI3Fq+6oXNcMMIpxcjHmc
	InQ19MCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnnCb-000000099ym-2Vqq;
	Thu, 27 Feb 2025 23:22:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnn81-000000098i0-1g9D
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 23:17:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 61C3E1688;
	Thu, 27 Feb 2025 15:17:32 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 54A253F673;
	Thu, 27 Feb 2025 15:17:15 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/8] pinctrl: sunxi: increase number of GPIO bank regulators
Date: Thu, 27 Feb 2025 23:14:41 +0000
Message-ID: <20250227231447.20161-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250227231447.20161-1-andre.przywara@arm.com>
References: <20250227231447.20161-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_151717_487576_EE0DD0E5 
X-CRM114-Status: GOOD (  12.68  )
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

By design, the Allwinner pinctrl IP always supported up to 11 GPIO banks,
though no SoC ever used more than 9 banks so far.
The Allwinner A523 has pins in all 11 banks, which exceeds the number of
per-bank regulators that we currently support, as this was set to 9.

Increase the size of the array to hold up to 11 regulator structs, to
support pins in bank J and K as well.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index 8e2eca45b57f8..fbbf070a87542 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -155,7 +155,7 @@ struct sunxi_pinctrl {
 	struct gpio_chip		*chip;
 	const struct sunxi_pinctrl_desc	*desc;
 	struct device			*dev;
-	struct sunxi_pinctrl_regulator	regulators[9];
+	struct sunxi_pinctrl_regulator	regulators[11];
 	struct irq_domain		*domain;
 	struct sunxi_pinctrl_function	*functions;
 	unsigned			nfunctions;
-- 
2.46.3


