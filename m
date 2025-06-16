Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF686C71159
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 15:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6HfCH5xCSmXty1+8psQGrMNCTeyB1xRyjYHFsLCwi+g=; b=CTCAA7KDmbv1BEcDqJBwvZmyus
	B3qmsXfzrF91Psp156rn5xLf/3paPV3Fq6+PWTum9I4NLlA9gMkgOS7bDn17EcvS3b2hhCiHnqEX1
	y5CizwiI8xgL5548ppO1ZPx+H8049nfPA+upDV7sHgJErCnXcnexcfMf79lxPqK6m3MRmuGbbchT3
	mpBhIUULC+rQtccau9PuBvkldYZm2nGZSgIi4dGbd1yv5NhRXL6Trt20G7UpfOyxNYp4jAJHLyo3B
	j9PSrX/o8Xv4k56aXDF9Vx+APnc6jyJpsCyH20e7UZNgT98tEf14R3wSPvXTVaL1PJjt+f3PK3Abc
	aw9ZAM+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRBjC-00000004pm3-0wXz;
	Mon, 16 Jun 2025 15:26:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR9fG-00000004VIg-0qXX
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Jun 2025 13:14:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=6HfCH5xCSmXty1+8psQGrMNCTeyB1xRyjYHFsLCwi+g=; b=HSL4hz1egU3YQBjbQuoAl6JDdZ
	aPK0jzjFuXIeDuOgs5OmzOsWJquXtVdhDehi6QjdmM0syyzSbjvgKktOusriuku3TivDT33yQz/0f
	9ecezkQw3IsuAA8WX84JL997JyY5csXKV2boWGUyp2nWKi7opilV/Xm1eNkNkpQltXhtsvajSnOia
	pZ0gYvVf0erxalLDpZw7x1pAOS6nzB8phP0a9TKhJPAjg2TDpHSjykYNkGLEq12eWf+EwPd6chIs9
	SPqBEoap1MlcdjFfkfHUK/Z9KpBpc1/yvjnMytttuxPF3v2JxkqEAxmLWIwuk9J0Td/b1a0AR6O1W
	5tGthxsg==;
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR9fB-00000003aQC-3WSa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 13:14:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1750079640;
	bh=6HfCH5xCSmXty1+8psQGrMNCTeyB1xRyjYHFsLCwi+g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=GVOeV9iRfH4ougILfDCxE3OyCTfrmUJ/K1YnrK4cbBjy1MJ6Zjhl6aD+/CxxNYxql
	 m79+64WKF+HVXv/vfBmcf7+AF3/WbJnXrKsjceCgjpTatdC2xJCqFbsmWYx+IObccM
	 MHPWi7G3Pn4LhNKTT3tiKsVEY8WYRGHaHumbfKLsRuZmogPhSao/kV4U6vaOJOfstQ
	 8U+qND8iR3oW0SK8+kottZZ1Jp9IGZwP2DP3J2cZnrHHv5YrreoRw5hqYtpWTcvvEw
	 HsvYgoSbnQ1RrijY5OIB8GG2+bLxNFkZWOSrqKx4sTD5CViQh0tgAXyLyM6Sg3Tj8j
	 pProyHd+DH+nw==
Received: from [127.0.1.1] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 5248968848;
	Mon, 16 Jun 2025 21:13:59 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Mon, 16 Jun 2025 22:43:40 +0930
Subject: [PATCH v2 03/10] soc: aspeed: lpc-snoop: Ensure model_data is
 valid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-aspeed-lpc-snoop-fixes-v2-3-3cdd59c934d3@codeconstruct.com.au>
References: <20250616-aspeed-lpc-snoop-fixes-v2-0-3cdd59c934d3@codeconstruct.com.au>
In-Reply-To: <20250616-aspeed-lpc-snoop-fixes-v2-0-3cdd59c934d3@codeconstruct.com.au>
To: linux-aspeed@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>, Henry Martin <bsdhenrymartin@gmail.com>, 
 Jean Delvare <jdelvare@suse.de>, 
 Patrick Rudolph <patrick.rudolph@9elements.com>, 
 Andrew Geissler <geissonator@yahoo.com>, 
 Ninad Palsule <ninad@linux.ibm.com>, Patrick Venture <venture@google.com>, 
 Robert Lippert <roblip@gmail.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Andrew Jeffery <andrew@codeconstruct.com.au>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_141414_610068_AE5AB604 
X-CRM114-Status: GOOD (  10.12  )
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

of_device_get_match_data() can return NULL, though shouldn't in current
circumstances. Regardless, initialise model_data closer to use so it's
clear we need to test for validity prior to dereferencing.

Fixes: 2dee584bc9e3 ("drivers/misc: (aspeed-lpc-snoop): Add ast2400 to compat")
Acked-by: Jean Delvare <jdelvare@suse.de>
Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 drivers/soc/aspeed/aspeed-lpc-snoop.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
index fc3a2c41cc10739f5f70ded7ac02baab6468d652..ca7536213e0986f737606a52996ffea620df2a7a 100644
--- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
+++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
@@ -186,10 +186,9 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 				   struct device *dev,
 				   int channel, u16 lpc_port)
 {
-	int rc = 0;
+	const struct aspeed_lpc_snoop_model_data *model_data;
 	u32 hicr5_en, snpwadr_mask, snpwadr_shift, hicrb_en;
-	const struct aspeed_lpc_snoop_model_data *model_data =
-		of_device_get_match_data(dev);
+	int rc = 0;
 
 	if (WARN_ON(lpc_snoop->chan[channel].enabled))
 		return -EBUSY;
@@ -236,9 +235,10 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 	regmap_update_bits(lpc_snoop->regmap, HICR5, hicr5_en, hicr5_en);
 	regmap_update_bits(lpc_snoop->regmap, SNPWADR, snpwadr_mask,
 			   lpc_port << snpwadr_shift);
-	if (model_data->has_hicrb_ensnp)
-		regmap_update_bits(lpc_snoop->regmap, HICRB,
-				hicrb_en, hicrb_en);
+
+	model_data = of_device_get_match_data(dev);
+	if (model_data && model_data->has_hicrb_ensnp)
+		regmap_update_bits(lpc_snoop->regmap, HICRB, hicrb_en, hicrb_en);
 
 	lpc_snoop->chan[channel].enabled = true;
 

-- 
2.39.5


