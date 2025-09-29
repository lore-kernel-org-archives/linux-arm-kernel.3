Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E3CCAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 16:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y+hgyn2E0Ma4hOCRVip31Vm6RHNaCa1ts9SY0eNd/9g=; b=AsumpQ5URQGLMVKs085mKMNBYO
	dtjI41Tj4JNvqIg6HSvNEk2u672BdvfaSqicSBbkuGpNnCVvE5weDaSC1etfMhFP9uil6c0b8eGOE
	3ulKISzAK/4CmRrUBVu67TmFZN5vBJacktU7RREzarlpgxtXjjfn4fu1lcqE62RUjbsdjQRQyEW9g
	b7sGn+hHJJs+x6sJMmu3xpXlzrUdnfQzm5nHkiwg5psd3V/qeNF+plYVXj0inMy+ox7u85r5lpBBY
	Tuntf1L4rFwzCv6fLs4Hla156SghVfn2FI9m90ybjdjOcW/jMGKzwLsZmulVWPGn+0ZytKIHPGJAQ
	XT+liJ0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GgU-00000002yDs-0zOO;
	Mon, 29 Sep 2025 16:25:06 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GgP-00000002yCv-2UH0;
	Mon, 29 Sep 2025 16:25:04 +0000
Received: from DESKTOP-L0HPE2S (unknown [114.245.39.210])
	by APP-01 (Coremail) with SMTP id qwCowAD3UKPXstpoT7XhCA--.29927S2;
	Tue, 30 Sep 2025 00:24:57 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: Jonathan Cameron <jic23@kernel.org>,
	linux-iio@vger.kernel.org
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Abhash Jha <abhashkumarjha123@gmail.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH v2] iio: adc: mt6360: Handle error in cleanup path correctly
Date: Tue, 30 Sep 2025 00:24:53 +0800
Message-ID: <20250929162453.1203-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <20250929025358.2064-1-vulab@iscas.ac.cn>
References: <20250929025358.2064-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAD3UKPXstpoT7XhCA--.29927S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJrWxKryxuFW8ZrW3uF48WFg_yoW8uryfpr
	1YkFyqkFy8KFySka1xt3WUZFWFya17Kw4Fk34kCanFv3s8Ar1IgFyrGa4q934v9rZYyan0
	v3yUuFWUuw18ZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUd-B_UUUUU=
X-Originating-IP: [114.245.39.210]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRAAA2jan9oN4wABsC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_092502_011112_07A5D6DD 
X-CRM114-Status: GOOD (  11.77  )
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

The return value of a regmap_raw_write() and regmap_update_bits()
in the cleanup path was being ignored.

Fix this by checking the return value and warn on error.

Fixes: 1f4877218f7e ("iio: adc: mt6360: Add ADC driver for MT6360")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>

---
Changes in v2:
 - Do not propagate cleanup path errors.
 - Log a warning on failure instead of overwriting the return value, as
   suggested by the maintainer.
 - Also check the return value of regmap_update_bits() for consistency.
---
 drivers/iio/adc/mt6360-adc.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/mt6360-adc.c b/drivers/iio/adc/mt6360-adc.c
index 69b3569c90e5..9ee7247aacbe 100644
--- a/drivers/iio/adc/mt6360-adc.c
+++ b/drivers/iio/adc/mt6360-adc.c
@@ -70,6 +70,7 @@ static int mt6360_adc_read_channel(struct mt6360_adc_data *mad, int channel, int
 	ktime_t predict_end_t, timeout;
 	unsigned int pre_wait_time;
 	int ret;
+	int cleanup_ret;
 
 	mutex_lock(&mad->adc_lock);
 
@@ -130,11 +131,16 @@ static int mt6360_adc_read_channel(struct mt6360_adc_data *mad, int channel, int
 out_adc_conv:
 	/* Only keep ADC enable */
 	adc_enable = cpu_to_be16(MT6360_ADCEN_MASK);
-	regmap_raw_write(mad->regmap, MT6360_REG_PMUADCCFG, &adc_enable, sizeof(adc_enable));
+	cleanup_ret = regmap_raw_write(mad->regmap, MT6360_REG_PMUADCCFG,
+				&adc_enable, sizeof(adc_enable));
+	if (cleanup_ret)
+		dev_warn(mad->dev, "Failed to reset ADC config: %d\n", cleanup_ret);
 	mad->last_off_timestamps[channel] = ktime_get();
 	/* Config prefer channel to NO_PREFER */
-	regmap_update_bits(mad->regmap, MT6360_REG_PMUADCRPT1, MT6360_PREFERCH_MASK,
+	cleanup_ret = regmap_update_bits(mad->regmap, MT6360_REG_PMUADCRPT1, MT6360_PREFERCH_MASK,
 			   MT6360_NO_PREFER << MT6360_PREFERCH_SHFT);
+	if (cleanup_ret)
+		dev_warn(mad->dev, "Failed to reset prefer channel: %d\n", cleanup_ret);
 out_adc_lock:
 	mutex_unlock(&mad->adc_lock);
 
-- 
2.50.1.windows.1


