Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 112D8C982D2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 04:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O2vctS1HDPIT/X25n9pLYfCPg6VUQlM6OzxcQLhiTME=; b=sdFHJKwAXk1RrU7+jGkR9S9Qbz
	vaqApATl0ci+TftSKXpHtjrxI5+OzfGbo4zAE5MCNi5cEAVBsLSRuV57/asAN8+G04FyklESiuK3W
	+ZgQd+8OPVd1PTpa30+vMy6qC+PZkqzt5hvyW1PXl2jeObxYW5eNnJenN131VK2rFd1X20NQAfUcM
	BZqmtN8PD1QVcHuoXtd3hfmWFPf4OgxU3dxqYVd4exDdSs6mWKYyJB+wvuy6FZy0emlM/NPATLIEN
	P4GFfynj8QmkuA26PDtU2UTA33SXxG0GqXlXEscpMsvoHeDhPOYF0LHMTEyPvkFpTMtjN9R3QJAaj
	67dSOzXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Qfp-0000000DU1m-2kQ6;
	Fri, 18 Sep 2026 04:58:09 +0000
Received: from mail-oo2-x01.google.com ([2607:f8b0:4864:31::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Qfk-0000000DTzI-22zC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 04:58:05 +0000
Received: by mail-oo2-x01.google.com with SMTP id 006d021491bc7-6bc93a7858fso38557eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 21:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789707483; x=1790312283; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O2vctS1HDPIT/X25n9pLYfCPg6VUQlM6OzxcQLhiTME=;
        b=Pe6Vi4bLZpLiYhs1wDqS5tmRDgrcn1YPtCeLTIsEx24D+LeP5RiWMqpsX9oD3OOX99
         hX6MZCXAIsGrUW+i5bxCzpxsyjZYGxw8sqKm7GPkh8P/b4M/8z6hsrZRkw9xZjhv+Ubu
         pHK/p2lTbSGUcgsL0FjAQSwlczwOSf5p+lpM11eFYT9auLZIUkU91NXCcLpFBECjfNHr
         dB6u8Ru+mhCE1HTyYbolnqY4riAA2GiagtPSRg7G8pMz2Z1CkxNz5gk+VhwQLx/Fh2fL
         aFQOtLcaGo4TiYfdWMUNovLek7mygMt0UpVzzk9qXetfPFQVMWWMqlMMzzvbSP5yoife
         7ZdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789707483; x=1790312283;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O2vctS1HDPIT/X25n9pLYfCPg6VUQlM6OzxcQLhiTME=;
        b=pi/XlnSPdnVKnys4zVKvzB0HOLRkTcBgx+d3CkE23h2Um/mEgLUVVE3jaoOya1ovfq
         jsoPICzKvllYOpwCfMjK32tkF0BtfoFN15/2wovuPPwzweaMrLz+zGJ309jTYgZ9WmyR
         zrYtDFE7dhP4Kf9ocuskvLPw1oY+p7cjfwmgyVpLhZ9XNWvya/Rmv98pj1hV8VsBXxEA
         O4l977PIVwSk9LJCtffUaD072PliRq8tZtSrjHdJbkUngUE+cG+TMnatJBbLTyplnd5y
         L2pi00uHBXxUVOAnsksRF9CrgUpBXYhWnY786RgygF4dyL8E3xRjxmPT36bZG23H5z8b
         BmbQ==
X-Forwarded-Encrypted: i=1; AKwUvBw7xHMyHw4FepzlNA5yc1QkWry9ekMQLrZhCUUtt+Z1M9jBrXsxxdeGSGNVJU6cZOBSGt6H0/Qpvfe9R0kkA2Zs@lists.infradead.org
X-Gm-Message-State: AFuF++kPYe1QlWMZk+f8gmFX+Cr8Be735rkEs7Qqsk6Bcq4ZsQ/J5ydw
	SlcOa3Vdt5acbvvEubH+18lLuriA3MIwJ9lhGPRQDnFj4jDqYeiDYk2c
X-Gm-Gg: AYBFou0VnrHsC1YR84CtMpasrPadmRxns6WVIzp9r8IK4FH0wXeV2FTA9SSX9H+/Zy3
	4xX2BWehaTOEZh7gF4P4u0dl1N8IxqPQeMXM/jZP2fvziorxRHlWvJqYq1uNb8OPxBJcinr1kec
	g/Amk8RnpTyuzTgkzR23Oz0A3dsa3HSujPwOJX+JCUSne+1q5umq+XqHs2PoIlk6AcnwSrpzTBw
	BxF0SGhPUsmdTw6OZfEIz8rNZF71YiENB/T9YPjPiBCDqEuNbHCyvABLNpnIWRa7Swwl65JxJdx
	Snbb5mhaYd4b/flYqyUDuVOp5XySh6KTrUo135mQGCw3C7kGw/onat0UyPCPJeIU7YUrWUMU2jG
	D6WxSGo680Ti/ymBNDf6zG8Msq6AuO9H2d+uNBjUrze9Wd05KEbd9Ihd9YEWrQXEjmh81nGKkYM
	9RqATi5Lt5oPlE8Dlf5Ks8tpfUkstk0U/rm7PKuA5eyPxD+qKaIZP9L5pFCiYZTJoE+w==
X-Received: by 2002:a05:6820:198e:b0:6ba:1356:2038 with SMTP id 006d021491bc7-6ca9dc81d82mr1247500eaf.65.1789707483400;
        Thu, 17 Sep 2026 21:58:03 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-48739da0d0dsm256318fac.12.2026.09.17.21.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 21:58:02 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Thu, 17 Sep 2026 23:57:47 -0500
Subject: [PATCH 2/2] rtc: mt6397: expose the spare bytes of the alarm
 registers as nvmem
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-rbrue-suez-upstreaming-mt6397-rtc-nvmem-v1-2-558b8f95cfbc@gmail.com>
References: <20260917-rbrue-suez-upstreaming-mt6397-rtc-nvmem-v1-0-558b8f95cfbc@gmail.com>
In-Reply-To: <20260917-rbrue-suez-upstreaming-mt6397-rtc-nvmem-v1-0-558b8f95cfbc@gmail.com>
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Eddie Huang <eddie.huang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rtc@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789707469; l=5079;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=1ZbFpDNmPpKPUw8gavi59S7TugQ/2BR2pAG4PVbmBvQ=;
 b=kj88aZa+h4fhuHQwM8Bk8GTy18OwBUHg5C5G/Eakbrvp92M6E9GMdVV5SYpbTN1UoeBxPc9GB
 pvRQ/rrqw2PDudl5VHFcBTBuqsjCkWZg2xKtUjEWDMv3azffj7wA3JR
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_215804_553541_92654A5F 
X-CRM114-Status: GOOD (  24.74  )
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

Each alarm field lives in the low bits of its register and the driver
masks its writes accordingly, so the high byte of four of them is storage
the RTC never touches. MediaTek names these RTC_NEW_SPARE0 to
RTC_NEW_SPARE3 and gives the first to a fuel gauge, which is how its PMIC
battery drivers carry a state of charge over a reboot.

Offer all four as a battery-backed nvmem provider, so that a consumer does
not have to reach into this block behind the driver's back. Doing it here
is what makes it safe: a write lands under the same lock the alarm paths
take, so it can neither be lost inside mtk_rtc_set_alarm()'s
read-modify-write nor fire the write trigger in the middle of one.

The nvmem core does not range check a cell against the provider size, so
the callbacks check the offset themselves.

Tested on an MT6397; MediaTek's spare map for mt6323 matches, and the
alarm field masks are common to every compatible this driver binds.

Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/rtc/rtc-mt6397.c       | 91 +++++++++++++++++++++++++++++++++++++++++-
 include/linux/mfd/mt6397/rtc.h |  7 ++++
 2 files changed, 97 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index 3d857681f760..d6e156516aa6 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -4,6 +4,8 @@
 * Author: Tianping.Fang <tianping.fang@mediatek.com>
 */
 
+#include <linux/array_size.h>
+#include <linux/bitfield.h>
 #include <linux/err.h>
 #include <linux/interrupt.h>
 #include <linux/mfd/mt6397/core.h>
@@ -243,10 +245,91 @@ static const struct rtc_class_ops mtk_rtc_ops = {
 	.set_alarm  = mtk_rtc_set_alarm,
 };
 
+/*
+ * The spare byte of each of these registers, in the order a board addresses
+ * them as RTC_NEW_SPARE0 to RTC_NEW_SPARE3.
+ */
+static const u32 mtk_rtc_spare_reg[] = {
+	RTC_AL_HOU, RTC_AL_DOM, RTC_AL_DOW, RTC_AL_MTH,
+};
+
+static int mtk_rtc_nvram_read(void *priv, unsigned int offset, void *val,
+			      size_t bytes)
+{
+	struct mt6397_rtc *rtc = priv;
+	u8 *buf = val;
+	u32 data;
+	int ret = 0;
+
+	if (offset >= ARRAY_SIZE(mtk_rtc_spare_reg) ||
+	    bytes > ARRAY_SIZE(mtk_rtc_spare_reg) - offset)
+		return -EINVAL;
+
+	mutex_lock(&rtc->lock);
+
+	while (bytes--) {
+		ret = regmap_read(rtc->regmap,
+				  rtc->addr_base + mtk_rtc_spare_reg[offset++],
+				  &data);
+		if (ret)
+			break;
+
+		*buf++ = FIELD_GET(RTC_SPARE_MASK, data);
+	}
+
+	mutex_unlock(&rtc->lock);
+
+	return ret;
+}
+
+static int mtk_rtc_nvram_write(void *priv, unsigned int offset, void *val,
+			       size_t bytes)
+{
+	struct mt6397_rtc *rtc = priv;
+	u8 *buf = val;
+	int ret = 0;
+
+	if (offset >= ARRAY_SIZE(mtk_rtc_spare_reg) ||
+	    bytes > ARRAY_SIZE(mtk_rtc_spare_reg) - offset)
+		return -EINVAL;
+
+	mutex_lock(&rtc->lock);
+
+	while (bytes--) {
+		ret = regmap_update_bits(rtc->regmap,
+					 rtc->addr_base + mtk_rtc_spare_reg[offset++],
+					 RTC_SPARE_MASK,
+					 FIELD_PREP(RTC_SPARE_MASK, *buf++));
+		if (ret)
+			goto out;
+	}
+
+	/*
+	 * None of it reaches the always-on domain until the write trigger,
+	 * which commits every pending alarm register at once -- so this runs
+	 * under the same lock the alarm paths take, rather than landing in
+	 * the middle of one of them.
+	 */
+	ret = mtk_rtc_write_trigger(rtc);
+out:
+	mutex_unlock(&rtc->lock);
+
+	return ret;
+}
+
 static int mtk_rtc_probe(struct platform_device *pdev)
 {
 	struct resource *res;
 	struct mt6397_chip *mt6397_chip = dev_get_drvdata(pdev->dev.parent);
+	struct nvmem_config nvmem_cfg = {
+		.name = "mt6397_rtc_spare",
+		.word_size = 1,
+		.stride = 1,
+		.size = ARRAY_SIZE(mtk_rtc_spare_reg),
+		.type = NVMEM_TYPE_BATTERY_BACKED,
+		.reg_read = mtk_rtc_nvram_read,
+		.reg_write = mtk_rtc_nvram_write,
+	};
 	struct mt6397_rtc *rtc;
 	int ret;
 
@@ -293,7 +376,13 @@ static int mtk_rtc_probe(struct platform_device *pdev)
 	rtc->rtc_dev->start_secs = mktime64(1968, 1, 2, 0, 0, 0);
 	rtc->rtc_dev->set_start_time = true;
 
-	return devm_rtc_register_device(rtc->rtc_dev);
+	ret = devm_rtc_register_device(rtc->rtc_dev);
+	if (ret)
+		return ret;
+
+	nvmem_cfg.priv = rtc;
+
+	return devm_rtc_nvmem_register(rtc->rtc_dev, &nvmem_cfg);
 }
 
 #ifdef CONFIG_PM_SLEEP
diff --git a/include/linux/mfd/mt6397/rtc.h b/include/linux/mfd/mt6397/rtc.h
index 27883af44f87..f4da579ec638 100644
--- a/include/linux/mfd/mt6397/rtc.h
+++ b/include/linux/mfd/mt6397/rtc.h
@@ -49,6 +49,13 @@
 
 #define RTC_AL_SEC             0x0018
 
+/* The high byte of four of the alarms is spare, always-on storage */
+#define RTC_AL_HOU             0x001c
+#define RTC_AL_DOM             0x001e
+#define RTC_AL_DOW             0x0020
+#define RTC_AL_MTH             0x0022
+#define RTC_SPARE_MASK         GENMASK(15, 8)
+
 #define RTC_AL_SEC_MASK        0x003f
 #define RTC_AL_MIN_MASK        0x003f
 #define RTC_AL_HOU_MASK        0x001f

-- 
2.55.0


