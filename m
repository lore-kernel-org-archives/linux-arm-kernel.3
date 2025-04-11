Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C48E7C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 01:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kl9cNe70ebuqUBsGg3wclmdapJ/BbYZ4gItW6jHIc7A=; b=epSxuUOExVUH6y0igNQs5fl6tV
	URbVYvFOmmFOWpSy/zCK9JUnTmrdbQkIP3fFXStuMDSxzkOj0WYxTTqC+LY56tS+r7huaNvED+Fxg
	Yi8LyLN4/VpVPwPq0Vy22Xqtgb4ZyDxq6Ezj7+LCtPfnZSk2gCQVp3F+6AwvuOG6tre9ndO9UHz8h
	AxqSdHyb+l/zhr9MzeyeA/A51PcQgMyAPRzJ192bISBBsbz31aJ+0RgSOH7rXXKj1LyHm46PuUo58
	OtnJr+R/P7+eIGSKKnEd6JTwl7wsmpoWtoOtS0WigqC5bVQEOAM5dZ9x6UNg67C2VIxDlydPIToNu
	FoEhGJFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u32vH-0000000CCyW-25Ag;
	Fri, 11 Apr 2025 01:11:11 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u32tR-0000000CCR0-00oA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 01:09:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1744333749;
	bh=Kl9cNe70ebuqUBsGg3wclmdapJ/BbYZ4gItW6jHIc7A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KXybtiEpVaRs6sAGdOtnmP9rQxsNzrAWJmdNkLK8ew7d8QxZs4QbeawJkPJVvlGYE
	 kqYN+QPIEr2LOIxkxWgr2NjAowCKjUwCHvNbLmMSyLR7qUkPolYIgpnpWyUpupKQsJ
	 wxAzji6m4w24QEKZHRAbdORveQcLoi+OWJVPb4BDSrxBYVfHp2JrTWXny7XinCq+Tu
	 Vcz/WVUl33+nQkgXC1Ji/Zpx2O+G9Fw1dMcujg6GCyxCOXGLc+cChI2/R6Zi+0025x
	 9OnfmrhQZ2TQTXGqaW6izUHRwuev4+qYKqQQe8ekXqSEjAY3YwmSfMBrtXgZwPtOjP
	 wq48PWVT/MeMw==
Received: from [127.0.1.1] (unknown [180.150.112.225])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 4EECF7D712;
	Fri, 11 Apr 2025 09:09:09 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Fri, 11 Apr 2025 10:38:33 +0930
Subject: [PATCH 3/7] soc: aspeed: lpc-snoop: Ensure model_data is valid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250411-aspeed-lpc-snoop-fixes-v1-3-64f522e3ad6f@codeconstruct.com.au>
References: <20250411-aspeed-lpc-snoop-fixes-v1-0-64f522e3ad6f@codeconstruct.com.au>
In-Reply-To: <20250411-aspeed-lpc-snoop-fixes-v1-0-64f522e3ad6f@codeconstruct.com.au>
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
X-CRM114-CacheID: sfid-20250410_180917_255464_4FB79AF0 
X-CRM114-Status: GOOD (  10.09  )
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
Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 drivers/soc/aspeed/aspeed-lpc-snoop.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
index e9d9a8e60a6f062c0b53c9c02e5d73768453998d..28f034b8a3b7226efe20cbe30a7da0c2b49fbd96 100644
--- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
+++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
@@ -186,10 +186,10 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 				   struct device *dev,
 				   int channel, u16 lpc_port)
 {
-	int rc = 0;
+	const struct aspeed_lpc_snoop_model_data *model_data;
 	u32 hicr5_en, snpwadr_mask, snpwadr_shift, hicrb_en;
-	const struct aspeed_lpc_snoop_model_data *model_data =
-		of_device_get_match_data(dev);
+	int rc = 0;
+
 
 	if (lpc_snoop->chan[channel].enabled)
 		return -EBUSY;
@@ -236,9 +236,10 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
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


