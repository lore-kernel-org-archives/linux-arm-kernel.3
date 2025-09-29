Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81360CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 02:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4KXlujy/0bS3FW5YncZMqJxqeCytqdoi7ZpzmWYOsaY=; b=k46Dd9i9cnuz3anenKFa+q464e
	5DpBqRqp6CH9O4zlBqqmxmU/ZkO59RG4LHOs5zOT+eO1FbynNfWATmV7pKGYKCUzp3ap9kSEv4xA2
	XAq57cmk+7MwcckLUl1b0Z2okTH6NGQBlgcVr1sQwczdoNusTQJal0BhPGCrHWxDidaLTkfZSp0Xd
	dsEyrzUjrXiZ9jAQZIZD5xDhYweXPqo8buWFHOVV2/WaKUjwTe9+P2vIvQ5TwOnyaL3FhfNyu92Rc
	KGTbaAggc2IYhELnK5/fLqs+MQKCdhtVa20bFHMKrE8xSS+yvTOnncJRE5BBk25psXWeVj3TOSFsL
	XZL6FbzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v341o-00000001ATq-30Xa;
	Mon, 29 Sep 2025 02:54:16 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v341l-00000001AT6-3EcQ;
	Mon, 29 Sep 2025 02:54:15 +0000
Received: from DESKTOP-L0HPE2S (unknown [124.16.141.245])
	by APP-05 (Coremail) with SMTP id zQCowABX+RLN9NloTWOKCA--.65172S2;
	Mon, 29 Sep 2025 10:54:06 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: David Lechner <dlechner@baylibre.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH] iio: adc: mt6360: Handle error in cleanup path correctly
Date: Mon, 29 Sep 2025 10:53:58 +0800
Message-ID: <20250929025358.2064-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowABX+RLN9NloTWOKCA--.65172S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uF4kJw1DGr4ktryrJw13Jwb_yoW8Xw43pr
	4jkFyDJFy09FyfCF4xta1UZFWFya17Gryjy34DC3ZrZ3s8Ar12gF1rJFyqva4vvrZIyan0
	vrWUCrWUuw1UZF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBY14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
	WxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
	Yx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
	WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7Cj
	xVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r4UMxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
	0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbKhF3UUUUU==
X-Originating-IP: [124.16.141.245]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwwAA2jZ4FFQ9QAAst
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_195414_173922_69E54737 
X-CRM114-Status: GOOD (  10.27  )
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

The return value of a regmap_raw_write() in the cleanup path was
being ignored.

Fix this by checking the return value and propagating the error.

Fixes: 1f4877218f7e ("iio: adc: mt6360: Add ADC driver for MT6360")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/iio/adc/mt6360-adc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/mt6360-adc.c b/drivers/iio/adc/mt6360-adc.c
index 69b3569c90e5..97c4af8a93fc 100644
--- a/drivers/iio/adc/mt6360-adc.c
+++ b/drivers/iio/adc/mt6360-adc.c
@@ -70,6 +70,7 @@ static int mt6360_adc_read_channel(struct mt6360_adc_data *mad, int channel, int
 	ktime_t predict_end_t, timeout;
 	unsigned int pre_wait_time;
 	int ret;
+	int cleanup_ret;
 
 	mutex_lock(&mad->adc_lock);
 
@@ -130,11 +131,15 @@ static int mt6360_adc_read_channel(struct mt6360_adc_data *mad, int channel, int
 out_adc_conv:
 	/* Only keep ADC enable */
 	adc_enable = cpu_to_be16(MT6360_ADCEN_MASK);
-	regmap_raw_write(mad->regmap, MT6360_REG_PMUADCCFG, &adc_enable, sizeof(adc_enable));
+	cleanup_ret = regmap_raw_write(mad->regmap, MT6360_REG_PMUADCCFG,
+				&adc_enable, sizeof(adc_enable));
+	if (ret >= 0)
+		ret = cleanup_ret;
 	mad->last_off_timestamps[channel] = ktime_get();
 	/* Config prefer channel to NO_PREFER */
 	regmap_update_bits(mad->regmap, MT6360_REG_PMUADCRPT1, MT6360_PREFERCH_MASK,
 			   MT6360_NO_PREFER << MT6360_PREFERCH_SHFT);
+
 out_adc_lock:
 	mutex_unlock(&mad->adc_lock);
 
-- 
2.50.1.windows.1


