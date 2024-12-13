Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C93EE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 14:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wy9OiI+7szsDjno2sdPj55bgsp0gdMIN+aJDlIWoX/c=; b=lrmfvFNc/aedsTNYdy7ifPOxDh
	RAuHAHwiL3Q2SIBsseH6kEb3fhh+NFUFKfZN0oHe6JwyALyQM2dBpqz1HkAkELS3SuiYaI5bkoBkM
	fCFw2ulPQEVYkX3Gd9SjrmvGtSShHjM+hN1V7dGIP/yIBTqRUY9UgpkLiC4A4ii8CtP+/hGVjfJ4U
	iE/GVWeQbHWFZ431KvY2LEWmeYMbxCrSfQSHCnRmD5SFrr5tMd37O8HharWV7Uw93ILfm7GoLUWaV
	B+xiVtApnAAU9eJCNZczL8yLH2e5CT1sXvZXfYXUHInOZ35bwHrUIe14nFjVay/gZiPMbaVh9aXsq
	EjeJ4DnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM6MH-00000003xdU-1zVB;
	Fri, 13 Dec 2024 14:09:33 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM6LA-00000003xEM-3zAF;
	Fri, 13 Dec 2024 14:08:27 +0000
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 28A19120009;
	Fri, 13 Dec 2024 17:08:12 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 28A19120009
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1734098892;
	bh=Wy9OiI+7szsDjno2sdPj55bgsp0gdMIN+aJDlIWoX/c=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=vorydM9+kbkjM9zvZEnjyN7QAJQcob0pm0Bt7hcyJgyr/gfGNYfe5nDOo1r+xHuLB
	 qS6vYLU1+M50Dgrf9HhdEs0kRQD7DpNRVzhz6pN9eUdHvyuUI9Xl3y2akHkT4D3HGJ
	 BKzkOZuwZ/u74xAl+MZLcH012l7b6mOdI+5t4AcVpNl1swDw3+k6nOvALBKF7YPA0K
	 S3ynK/L3LjjDStAKBjEOg+0RdkKuA4LhMkOpoSuG1LF+KW5ZvPopJJqw98irxvbt+Q
	 wGhjZnW+zfgEQyTPg2+0wSW+bR1nwWFdJpn+CVvf+gCpNXpHHEDst5uu87UPrfruIJ
	 pxO0RLkhZn1fg==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri, 13 Dec 2024 17:08:11 +0300 (MSK)
From: Alexey Romanov <avromanov@salutedevices.com>
To: <neil.armstrong@linaro.org>, <clabbe@baylibre.com>,
	<herbert@gondor.apana.org.au>, <davem@davemloft.net>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <vadim.fedorenko@linux.dev>
CC: <linux-crypto@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <kernel@salutedevices.com>, "Alexey
 Romanov" <avromanov@salutedevices.com>
Subject: [PATCH v11 04/22] crypto: amlogic - Add MMIO helpers
Date: Fri, 13 Dec 2024 17:07:37 +0300
Message-ID: <20241213140755.1298323-5-avromanov@salutedevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241213140755.1298323-1-avromanov@salutedevices.com>
References: <20241213140755.1298323-1-avromanov@salutedevices.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.28.130.77]
X-ClientProxiedBy: p-i-exch-a-m1.sberdevices.ru (172.24.196.116) To
 p-i-exch-a-m1.sberdevices.ru (172.24.196.116)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 189823 [Dec 13 2024]
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiSpam-Envelope-From: avromanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 47 0.3.47 57010b355d009055a5b6c34e0385c69b21a4e07f, {Tracking_from_domain_doesnt_match_to}, smtp.sberdevices.ru:7.1.1,5.0.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/12/13 12:33:00 #26873825
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_060825_680261_90A23CB6 
X-CRM114-Status: GOOD (  14.31  )
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

Add MMIO access helpers: meson_dma_start() and meson_dma_ready().

Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c |  2 +-
 drivers/crypto/amlogic/amlogic-gxl-core.c   | 24 ++++++++++++++++-----
 drivers/crypto/amlogic/amlogic-gxl.h        |  2 ++
 3 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index 7eff3ae7356f..1fe916b0a138 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -225,7 +225,7 @@ static int meson_cipher(struct skcipher_request *areq)
 
 	reinit_completion(&mc->chanlist[flow].complete);
 	mc->chanlist[flow].status = 0;
-	writel(mc->chanlist[flow].t_phy | 2, mc->base + ((mc->pdata->descs_reg + flow) << 2));
+	meson_dma_start(mc, flow);
 	wait_for_completion_interruptible_timeout(&mc->chanlist[flow].complete,
 						  msecs_to_jiffies(500));
 	if (mc->chanlist[flow].status == 0) {
diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 90b539401b71..e617dddf5e2b 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -22,18 +22,32 @@
 
 #include "amlogic-gxl.h"
 
+void meson_dma_start(struct meson_dev *mc, int flow)
+{
+	u32 offset = (mc->pdata->descs_reg + flow) << 2;
+
+	writel(mc->chanlist[flow].t_phy | 2, mc->base + offset);
+}
+
+static bool meson_dma_ready(struct meson_dev *mc, int flow)
+{
+	u32 offset = (mc->pdata->status_reg + flow) << 2;
+	u32 data = readl(mc->base + offset);
+
+	if (data)
+		writel_relaxed(0xF, mc->base + offset);
+
+	return data;
+}
+
 static irqreturn_t meson_irq_handler(int irq, void *data)
 {
 	struct meson_dev *mc = (struct meson_dev *)data;
 	int flow;
-	u32 p;
 
 	for (flow = 0; flow < mc->flow_cnt; flow++) {
 		if (mc->chanlist[flow].irq == irq) {
-			p = readl(mc->base + ((mc->pdata->status_reg + flow) << 2));
-			if (p) {
-				writel_relaxed(0xF, mc->base +
-					      ((mc->pdata->status_reg + flow) << 2));
+			if (meson_dma_ready(mc, flow)) {
 				mc->chanlist[flow].status = 1;
 				complete(&mc->chanlist[flow].complete);
 				return IRQ_HANDLED;
diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
index e0bc5c39bf2c..0ccf6542995f 100644
--- a/drivers/crypto/amlogic/amlogic-gxl.h
+++ b/drivers/crypto/amlogic/amlogic-gxl.h
@@ -161,6 +161,8 @@ struct meson_alg_template {
 #endif
 };
 
+void meson_dma_start(struct meson_dev *mc, int flow);
+
 int meson_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
 		     unsigned int keylen);
 int meson_cipher_init(struct crypto_tfm *tfm);
-- 
2.34.1


