Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0894CC624D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 05:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dEPYMs3oUZAAKTHc6QxaYvJkApkADKiVPKec4AR+Oag=; b=iTtDBICxX5v6JJcgIIOJ3GC+Uy
	H81gzW3fx3ng22Ryxu25Xc/BGsmRtqPlxcWHOBs+jg25ypjiriDc5wX/aDj2McGNiqaEapjJy/N4v
	mR8tolVOdLCDgsVDIuz/roTaIWk2CcCkokSCNtZ0OSa+QEM5j/bL9o4oRGBP7fe+Qg7uMXEU4Jf2N
	Kcq9E45Asl+lZaMZxZ9oUFyfI9pW9QRxXoSPa2xpf8mEeT/Ah2wOqytP2te2wY4a5dctdwxabsVAK
	5zwg0NZJPJWmuLm7M5uIxJK4dXikEpqMyvCZwFyt+ZMBYjaUAxxN0Rdcb2whWDdbkOteV4WswV0Yv
	7uSuTNgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zkc-0000000GN9D-118p;
	Thu, 03 Sep 2026 05:12:38 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zka-0000000GN5S-02ys
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 05:12:37 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-38e58034d05so1658610a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 22:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788412355; x=1789017155; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dEPYMs3oUZAAKTHc6QxaYvJkApkADKiVPKec4AR+Oag=;
        b=D9PdX+ECuxvOaJ5tK0BWQ3u9j+B951txc2iGJT7lEhDlJ2VstdZnwvlkH6XqtXiLO8
         /YMhYoj8lFz+3Q6WR+wO0/fUqxt1D6Qoa7EBevvcQw2w2JmcjxeXNY3TDK07apVc8x1c
         sVjvR6iinq/3U5Fc2mYPatPqMRSvp0ztoDnXtRZyKTFn5vDbr73MUId9T/nWkCDUwGXD
         yEJS9BwAqBMkQX1BlgZGsgHrw8cGcOX1UU/K8KP1fCPt/QcjlTmOGdjZ8cApAe2ffqHM
         LS/z7Ujzy7YbSuxImMKMmDhu5KPVNSGSl1QasY0SWw0jCEp1A3EfdHeyJGjYkcl+kr3H
         cv+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788412355; x=1789017155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dEPYMs3oUZAAKTHc6QxaYvJkApkADKiVPKec4AR+Oag=;
        b=RIno8xaR5qzWT8jnCtHqdnp4BL4/dq1nFnrJ27BVRLKw63v6W0BeDVPXCqMfx52HhP
         vB5MBgAiEjB/385V/afI9BJitqUOsW07Fewb/zG+NKUZhuNlsdCNHf8arIHfRAAt+ENj
         4tREivzAGiohZ4vg2z6TGKxbXXbXP+R62JKy7mIZZf2HXNt1qC3EDaSWBu20WeOZNeeg
         sRj6RjhYdmeW52KynmpDHQ9hc3q9i+zOvicUv0ACiPAhCkr8LPrE+eJuzK36w22J5wZs
         YOKb7cclE+5zU0p5t8waoBHnxb0xb3OCMBqHJ0V6+sg73IA5WYL4RI07XKIREs3KXz24
         13Kg==
X-Forwarded-Encrypted: i=1; AKwUvBx7KqaXUWcwhsOfGIeZgMI+jB//Zu8zZ2b5cekxsW6NcGstY1ayo7vnUDByicvwMjQQlVlRUM1btcldGmg0f9c9@lists.infradead.org
X-Gm-Message-State: AFuF++nc88ue60AhMWvZlCOhVTWLDuiNvqdPIkdmPA4IGrw1qPZrKt5q
	OZKU2JgC2m6SuZTRlYCqJJsG8GvGR4+L3NCYv6K1Vw4ysIqLYTDG82Vp
X-Gm-Gg: AYBFou0j1H3lXk7k3Gbt9e+4ZotyTznJUp9rDmiexDndTxdwhHHOgiiLXsWs+m+Y9Ny
	CecqnfpSvHdHH/DBWbZdOsALVJLYLPsgc3Ghl4lCmyplTDPTfuwyWfikZGzvdmo0abY9n21CUWX
	1N0sGufBOKIw1PshEqTZFo/g0y+EM+/68Oud0b25VP7/392G+ApRZD5xVn9cONe304jvAgL3905
	8gkemQlfDxn4PWxmLhrehc30Ko0lvydxIqTRFRqjuLxCxbZb4qi9zdeuRu4CCwmpkhp17NMdBWh
	x6kYOqvZVD9OEc7JVchPW6W18y/2G5xgUbu06rjr3t90IehLU1KFCDoApMTSKtmJ8UeZAE6vGqV
	3u8vftVRddCUpVZmicHecJBZ4K/HwlNaAFa8BoecGqcfidhut37s+U7APF4weeZjz69u139J1rD
	JkZb1oT5v9P/bTkBiyuBfGC5fvnTr62OYCkJWKkDtum4I2n/Nla668CPO85xyyUIx+4+RNOTPjz
	41j+ZTjkR2JGVFCskEir9CvDYWioO5oSvxVK/DcvuuGO6keNShz8efH5Svz8dAk9krSpWPMIgxD
	06s+
X-Received: by 2002:a17:90b:4c05:b0:398:d93a:b343 with SMTP id 98e67ed59e1d1-39aedebf901mr14551384a91.3.1788412355201;
        Wed, 02 Sep 2026 22:12:35 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b0875ce14sm3218092a91.13.2026.09.02.22.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 22:12:34 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 6/8] ASoC: mediatek: mt8186: Fix gpio rollback on adda dl/ul partial failure
Date: Thu,  3 Sep 2026 12:11:48 +0700
Message-ID: <20260903051150.178057-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903051150.178057-1-phucduc.bui@gmail.com>
References: <20260903051150.178057-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_221236_233040_2AE04D07 
X-CRM114-Status: GOOD (  11.13  )
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

If the second mt8186_afe_gpio_select() call in adda_dl()/adda_ul() fails,
the first one's state is left applied, leaving CLK/DAT in an inconsistent
state. Roll back the first select on failure.

Also fix a copy-pasted "CLK ON" debug message that should say "CLK OFF"
in the _dl disable path.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-gpio.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c b/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
index aced8e7e920c..1cff2a63ef37 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
@@ -143,6 +143,7 @@ static int mt8186_afe_gpio_adda_dl(struct device *dev, bool enable)
 		ret = mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_DAT_MOSI_ON);
 		if (ret) {
 			dev_dbg(dev, "%s(), MOSI DAT ON select fail!\n", __func__);
+			mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_CLK_MOSI_OFF);
 			return ret;
 		}
 	} else {
@@ -154,7 +155,8 @@ static int mt8186_afe_gpio_adda_dl(struct device *dev, bool enable)
 
 		ret = mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_CLK_MOSI_OFF);
 		if (ret) {
-			dev_dbg(dev, "%s(), MOSI CLK ON select fail!\n", __func__);
+			dev_dbg(dev, "%s(), MOSI CLK OFF select fail!\n", __func__);
+			mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_DAT_MOSI_ON);
 			return ret;
 		}
 	}
@@ -176,6 +178,7 @@ static int mt8186_afe_gpio_adda_ul(struct device *dev, bool enable)
 		ret = mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_DAT_MISO_ON);
 		if (ret) {
 			dev_dbg(dev, "%s(), MISO DAT ON select fail!\n", __func__);
+			mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_CLK_MISO_OFF);
 			return ret;
 		}
 	} else {
@@ -188,6 +191,7 @@ static int mt8186_afe_gpio_adda_ul(struct device *dev, bool enable)
 		ret = mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_CLK_MISO_OFF);
 		if (ret) {
 			dev_dbg(dev, "%s(), MISO CLK OFF select fail!\n", __func__);
+			mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_DAT_MISO_ON);
 			return ret;
 		}
 	}
-- 
2.43.0


