Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA4ECC982DF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 13:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cT4KjTlEVnVWRGXoeui+h6lXwGfVb9+9GPpMaARw3xA=; b=SXCvMOdEdheZ+Ul+r2mCTi+cEc
	hgLXLYd91O/Sz/vCBoIOEgB4KZarLxm5VnNM/dMqn9KKZLYAyPKGMv00y+YUBFQna9HcOg3Q5I6bg
	cZuJRiFE+R2i94ajrnXN2Hy/4Om74kFLu9NuBzZCDaxSg2oBjAvXZZnyKEJD6BYWIU53Mf5LUaTCs
	QrAM2aSEpnD2mLwkc/Cbn4sop3hCvNxHKBtZup49jZlxLb5CozHKKG7rjQR8G7SFINh3M4gs7foyl
	cIZ+fQVY1tsBuyDRHTVbUYCTlSpbeGllAY/Wuu29SA3NSjpCglTWzDY4Zhsd0wkCJE1QRVmiFVLDK
	FVWTWOYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YpG-0000000EatW-2lzU;
	Fri, 18 Sep 2026 13:40:26 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Yp7-0000000EamB-06wM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 13:40:18 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccd5cef0so537277a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 06:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789738816; x=1790343616; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cT4KjTlEVnVWRGXoeui+h6lXwGfVb9+9GPpMaARw3xA=;
        b=U37AA1svhxITsyO/gkpMkccf4nTGKZ1v7WV4nflwYrav1YbVGAcPgFgKUMk6bvQyZb
         yxZXnFnbfkK0kN7gQMnuKftm2+EgFc3Dvbx/ddY5W91TtbiUdREToTvvQGdGvN7EJyYe
         j9rqKjKtrnzMBPSWxJk9DHuA0K5t2BIKe+acm5zlWJP6UehT+u/lNWNNTcLx2aD/5KxG
         RHzdvH/DRv1UdLnQYrMmeto6k9n3/RYKMjAfEvMtf1WhK+mhKCFN8YXtOdqY2B504g78
         1AhRN5iNpsvmw4ckmRtlgogGSUCCcMZNFB/kCn4Xv4ccOJsw8EB5nIMiN6ER+TzeXap/
         2Ssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738816; x=1790343616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cT4KjTlEVnVWRGXoeui+h6lXwGfVb9+9GPpMaARw3xA=;
        b=BzTOAtBl/BpHaNtP5b6kC/M2BhCMCmUIgmrUYC0eZn8Xsf7XTHAzeEjSEZFZHh06ym
         2zpaIg/C5Tq4+gKCJ7U+jSMEFW0r6+d83OKqb9/VVm6f0CD3wo7bQjrXydgUb1gynydC
         LU3dkfuh9xe24qmvV2PTHJ41NHCjrncnEUNLAEPFW6V4AFVkL0nq0xi3GmTdyNMnms8t
         0ancHZJNf4lJToAImILqvDZUgRah1mr6sl4MbQAUAtkiQ65JtPpR0t562xHjAKuSOBYu
         Eued8xq4E+7CfQv5XErSJlzZESNNrr+Lco7olWkACg32eGzW1aDWFfQ5wFKFRPvgihzh
         TyFQ==
X-Forwarded-Encrypted: i=1; AKwUvBw1UDDGG+2tDQDlGQaDq6+Nrv+zmOpaCBNJaRGZdFqe0OrSOKLa4OuRs3tvp06ITtqmy9T46ijWUC4EFgyDIrAm@lists.infradead.org
X-Gm-Message-State: AFuF++kkLpqQg3Xms7eUSUw0RDrm05XtB9L/SaLS3uQscY617YmH/CNi
	dHl0yN6xzT6A8P8xkyxuXa9Cfa+xJEWupeM6ZvfXIxeYv0Eyg3tPlF+/
X-Gm-Gg: AYBFou1b4jvtWSFK2ea2Icjltjri1qdzcSv3VGk3vGnbJun2e5pUqeC/MREarZT3Alh
	OSshn48ldBk+ekwK/Day1E7p3wz5wFp8m16Mg+jagPrs2t0SVyDvf7wVAZTOwVmpDu8mlDEF1NE
	pWe9+jx9/tS4IaXRP/3H/Z3RvV259B2Ms/CF35Vcv7M0adlVZJkD8AQZzp4w+Bm2CGyMFI9vFN1
	vq6xURt22ZmIc1fzfHE37XKU1jDMeQwfj7X6GvaDpy1XMvpptZ8L3k2FAQZOtJhe3WzpA8QaOhp
	1u1lD2kPgT077FduurI2titfe0+WhibIGBwHUeJYzwlukrLYtcZMJVxi3l2wKAR8jQnr8Hwaehv
	qH6jS4MtAGSVUS8abOm4qm9G2/mmRZcNGsYKh7xvuSPEJZIei4UbU5mPYJZ7xmjqe0h6HvYW5rV
	f5kZZt2V6SRBu2fNMsEXCMpMpJ7hGs/CHJZoftPxSFoS6+YP5h0Jff5G1jd5fTzeyGG2WSEPpHX
	7HJZqlsS96MxVhNR/w/MerBIN3gaVGWP/8HE5lWJT66NgUKyVXNyAPUuDgJLm4kSXQcGbK3ulSH
	sImxasRV7DB0XA==
X-Received: by 2002:a17:90a:e7c3:b0:39e:261:4e12 with SMTP id 98e67ed59e1d1-39e54eb2281mr5551712a91.23.1789738815772;
        Fri, 18 Sep 2026 06:40:15 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm13253792a91.9.2026.09.18.06.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:40:15 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 07/15] ASoC: mediatek: mt8192: Propagate errors in mt8192_afe_gpio_request()
Date: Fri, 18 Sep 2026 20:39:03 +0700
Message-ID: <20260918133912.133799-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918133912.133799-1-phucduc.bui@gmail.com>
References: <20260918133912.133799-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_064017_119228_95991ED0 
X-CRM114-Status: GOOD (  13.49  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Currently, mt8192_afe_gpio_request() ignores the return values from
mt8192_afe_gpio_select() and other helper functions. If configuring
a GPIO state fails, the function still returns 0, hiding the failure
from callers.

Fix this by capturing and returning the error codes properly.

Fixes: 125ab5d588b0 ("ASoC: mediatek: mt8192: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8192/mt8192-afe-gpio.c | 74 +++++++++++----------
 1 file changed, 40 insertions(+), 34 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c b/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
index b993ca2dbd7c..ed6dfdf2589b 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
@@ -208,98 +208,104 @@ static int mt8192_afe_gpio_adda_ch34_ul(struct device *dev, bool enable)
 int mt8192_afe_gpio_request(struct device *dev, bool enable,
 			    int dai, int uplink)
 {
+	int ret;
+
 	guard(mutex)(&gpio_request_mutex);
 	switch (dai) {
 	case MT8192_DAI_ADDA:
 		if (uplink)
-			mt8192_afe_gpio_adda_ul(dev, enable);
+			ret = mt8192_afe_gpio_adda_ul(dev, enable);
 		else
-			mt8192_afe_gpio_adda_dl(dev, enable);
+			ret = mt8192_afe_gpio_adda_dl(dev, enable);
 		break;
 	case MT8192_DAI_ADDA_CH34:
 		if (uplink)
-			mt8192_afe_gpio_adda_ch34_ul(dev, enable);
+			ret = mt8192_afe_gpio_adda_ch34_ul(dev, enable);
 		else
-			mt8192_afe_gpio_adda_ch34_dl(dev, enable);
+			ret = mt8192_afe_gpio_adda_ch34_dl(dev, enable);
 		break;
 	case MT8192_DAI_I2S_0:
 		if (enable)
-			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S0_ON);
+			ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S0_ON);
 		else
-			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S0_OFF);
+			ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S0_OFF);
 		break;
 	case MT8192_DAI_I2S_1:
 		if (enable)
-			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S1_ON);
+			ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S1_ON);
 		else
-			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S1_OFF);
+			ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S1_OFF);
 		break;
 	case MT8192_DAI_I2S_2:
 		if (enable)
-			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S2_ON);
+			ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S2_ON);
 		else
-			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S2_OFF);
+			ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S2_OFF);
 		break;
 	case MT8192_DAI_I2S_3:
 		if (enable)
-			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S3_ON);
+			ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S3_ON);
 		else
-			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S3_OFF);
+			ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S3_OFF);
 		break;
 	case MT8192_DAI_I2S_5:
 		if (enable)
-			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S5_ON);
+			ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S5_ON);
 		else
-			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S5_OFF);
+			ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S5_OFF);
 		break;
 	case MT8192_DAI_I2S_6:
 		if (enable)
-			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S6_ON);
+			ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S6_ON);
 		else
-			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S6_OFF);
+			ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S6_OFF);
 		break;
 	case MT8192_DAI_I2S_7:
 		if (enable)
-			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S7_ON);
+			ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S7_ON);
 		else
-			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S7_OFF);
+			ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S7_OFF);
 		break;
 	case MT8192_DAI_I2S_8:
 		if (enable)
-			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S8_ON);
+			ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S8_ON);
 		else
-			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S8_OFF);
+			ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S8_OFF);
 		break;
 	case MT8192_DAI_I2S_9:
 		if (enable)
-			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S9_ON);
+			ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S9_ON);
 		else
-			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S9_OFF);
+			ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S9_OFF);
 		break;
 	case MT8192_DAI_TDM:
 		if (enable)
-			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_TDM_ON);
+			ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_TDM_ON);
 		else
-			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_TDM_OFF);
+			ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_TDM_OFF);
 		break;
 	case MT8192_DAI_VOW:
 		if (enable) {
-			mt8192_afe_gpio_select(dev,
-					       MT8192_AFE_GPIO_VOW_CLK_ON);
-			mt8192_afe_gpio_select(dev,
-					       MT8192_AFE_GPIO_VOW_DAT_ON);
+			ret = mt8192_afe_gpio_select(dev,
+						     MT8192_AFE_GPIO_VOW_CLK_ON);
+			if (ret)
+				break;
+			ret = mt8192_afe_gpio_select(dev,
+						     MT8192_AFE_GPIO_VOW_DAT_ON);
 		} else {
-			mt8192_afe_gpio_select(dev,
-					       MT8192_AFE_GPIO_VOW_CLK_OFF);
-			mt8192_afe_gpio_select(dev,
-					       MT8192_AFE_GPIO_VOW_DAT_OFF);
+			ret = mt8192_afe_gpio_select(dev,
+						     MT8192_AFE_GPIO_VOW_CLK_OFF);
+			if (ret)
+				break;
+			ret = mt8192_afe_gpio_select(dev,
+						     MT8192_AFE_GPIO_VOW_DAT_OFF);
 		}
 		break;
 	default:
 		dev_warn(dev, "%s(), invalid dai %d\n", __func__, dai);
-		return -EINVAL;
+		ret = -EINVAL;
 	}
 
-	return 0;
+	return ret;
 }
 EXPORT_SYMBOL(mt8192_afe_gpio_request);
-- 
2.43.0


