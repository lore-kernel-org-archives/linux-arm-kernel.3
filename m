Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54DBDCA600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 12:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MnmVjZXbloiXD13bi5Te/e9b6sNe1bfKH6W2BzMMJ30=; b=gy4DsEaAJkkCp42eZfuDQ5YwCe
	yREziQ2f/5qla+K052q851+gTex6hJ6S7oVXJcpUSJcDFLpxcT9Yzbf9UqlapctANgh2uezi1TUZq
	rnXSu/rQS4FxaEQxCtP0AtKkMq6v+yiERSeem/VI4ZqkDsYqwh/9dn3iiAtXsN6KcaZWmy11GOIpz
	S1wo4zoq6xg9xeJNrSclrLtuMP7GH07xJOOH0nf6OeZ/SE4vxiqC82pdT48SJUl3lxq/VyAGXVvyZ
	cZ0rTO3W6p465hzPBaEA4JLIa+hS1aSQnwVhsaCe1Jfuqa5pO7LzLjjBRxleVxzG2bKQ0hZAX6aV/
	BbkjO5CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEnXt-00000004OJr-1XUn;
	Thu, 08 Oct 2026 12:48:25 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEnXp-00000004OGE-3J8Q;
	Thu, 08 Oct 2026 12:48:23 +0000
X-QQ-mid: esmtpgz15t1791463629t4e1849e3
X-QQ-Originating-IP: D49zdi3bDNOz75fs7R+qoy9z0CVMFXcIwDBYsnUcMzg=
Received: from localhost.localdomain ( [111.8.45.130])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 08 Oct 2026 20:47:06 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 475378674027703517
EX-QQ-RecipientCnt: 11
From: Hongjian Dai <daihongjian@kylinsec.com.cn>
To: broonie@kernel.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com
Cc: jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	xianwei.zhao@amlogic.com,
	Hongjian Dai <daihongjian@kylinsec.com.cn>
Subject: [PATCH] spi: meson-spicc: fix invalid DMA unmap on mapping failure
Date: Thu,  8 Oct 2026 20:47:04 +0800
Message-ID: <35143466F2F5166F+20261008124704.87708-1-daihongjian@kylinsec.com.cn>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:kylinsec.com.cn:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: M5Uz2rwrqRnRkXxbF8lUn0xOq/KhjrRrws5M6+79FTLRgAKyqfqxr9s2
	HZIHFVXrh7V2GAUsmCnCd6aYU/aCSUPbQXWb00s3RA5OeveQLs27GoJ8UhltSZBZnll2V+1
	rss00IUxQAtlmT1GQK5P9VZU6r5/BtKVW9W3uankcwdlnog1OTANmNsGqpzW6RUJ5daSN3L
	3dcvSsKg8Gg/AtWBS/gvyN3YvXHkXMJ/Lsh7mChADqHOTBu/U6b+MjuDnoyiz135jIYQMXd
	2J39tNmaGVCu0mIEdNcAL+PmLUFcXVevQ6dKzJ1rfsiZgXwvPMDtEYuR023r9YY1QxxYwvr
	WNbkOsvuZO20LgNR9ekgQmt5UJgEtLgH9542XeQIicR7Ske7KGyX20Ckv5AZJSmPVDsgqdO
	1VuUWKgyXihSvulKgQ2VrfhwPpkFrZM2nexJAU3b317vzhZiollB/c47Iebw+7/4Xh0/xSK
	i0rhHquOA+K1I4urTuwSXdaXgJAMttggQkSN2cCk0yn3EPeNsh/c7C3hwNgUg6minvY4w8a
	BNjZv/g4IxqhwTCpbe4ZdrI5Hbhew06lbLKHCQkDTi3I+LZfiQH1FkvXyaynTYYpThWgCTM
	bPcpl0RmePfF+R90v5qs6i3FexbHgaVoYRHUrtxjY66uzAGWNMIiyeB1xNcS33SpOj7Zzgq
	wqFknYJHkvEIDDxFo2vh+FX+u02ZeApMqwvM7PvMyVT2pjNvRMn71DccwP2t7upGARBXF1z
	hm6wtzJXxkhLUpbLtbho6118WY4xm0Yjw8AZyu9Xgu/cs4JeRVcmStzVXQ3kkdUo90MMC4i
	y98u/QeiLo6uKGB5AkQJtCcEKfuxKf5+yaTYJa+D6bn6bt9nXkMt3Lo75ME+SXpPNsObsVj
	tEWByBFBZvAPRtKcWgetXsps4/2IRnsbY1OvfYHkz7NCPNxxebV2v0vkq5WisxMSCgjESzE
	GvYpJEK+ltcygu4GssI4bakZVScqFR5SQHaSKEbk16peEdx5tCsYFiVD81TXQIjPaHU164W
	/WQjLsxP4051mdfSyQjPTDzKwbrCI=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_054822_323208_FDB976DA 
X-CRM114-Status: GOOD (  11.73  )
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

meson_spicc_dma_unmap() decided whether a buffer had to be unmapped by
testing its DMA address for non-zero. On a mapping failure
dma_map_single() returns DMA_MAPPING_ERROR (typically non-zero), so the
error path in meson_spicc_transfer_one() passed that error value to
dma_unmap_single(), unmapping an address which was never mapped. The
same happened for t->rx_dma on TX mapping failure, which is not written
at all.

Initialize both addresses to DMA_MAPPING_ERROR before mapping and use
dma_mapping_error() to decide, so only buffers which were actually
mapped are unmapped.

Fixes: 18197e98353d ("spi: meson-spicc: add DMA support")
Signed-off-by: Hongjian Dai <daihongjian@kylinsec.com.cn>
---
 drivers/spi/spi-meson-spicc.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-meson-spicc.c b/drivers/spi/spi-meson-spicc.c
index fa2d2db2d6e7..b1f8c823d5d0 100644
--- a/drivers/spi/spi-meson-spicc.c
+++ b/drivers/spi/spi-meson-spicc.c
@@ -235,6 +235,13 @@ static int meson_spicc_dma_map(struct meson_spicc_device *spicc,
 {
 	struct device *dev = spicc->host->dev.parent;
 
+	/*
+	 * Mark the DMA addresses as invalid so that meson_spicc_dma_unmap()
+	 * will not try to unmap a buffer which was not (successfully) mapped.
+	 */
+	t->tx_dma = DMA_MAPPING_ERROR;
+	t->rx_dma = DMA_MAPPING_ERROR;
+
 	if (!(t->tx_buf && t->rx_buf))
 		return -EINVAL;
 
@@ -257,9 +264,9 @@ static void meson_spicc_dma_unmap(struct meson_spicc_device *spicc,
 {
 	struct device *dev = spicc->host->dev.parent;
 
-	if (t->tx_dma)
+	if (!dma_mapping_error(dev, t->tx_dma))
 		dma_unmap_single(dev, t->tx_dma, t->len, DMA_TO_DEVICE);
-	if (t->rx_dma)
+	if (!dma_mapping_error(dev, t->rx_dma))
 		dma_unmap_single(dev, t->rx_dma, t->len, DMA_FROM_DEVICE);
 }
 
-- 
2.43.0


