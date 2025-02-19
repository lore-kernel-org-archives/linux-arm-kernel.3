Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E41C021AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 03:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Kl7u8bFLHAjtaElzFILg5UyTJziKGgGFb4LO1YSKTug=; b=PQln2XJdXh192nr1eDzZOMgfPc
	+PQku5GfZZINC0rMiDWdHGbRMfaFpK8EeOXnMbmr+c313/czlqQjvp5FO5jRCdxzSjkSoXaeJAt4Z
	Rc7eP48O03V6SAGJwzGqyyYQpENNBdh6Ljks5de+iH8ecDPGgJ6WDH/K3hMsIDXsrTFc5X9V6w4zz
	vPatqzkMyYupQpoGrljcGpuCygqUXDJ1SlIydUAxPJxSjZxkUdpJOXWoYuzsf7P/zhGW5+VCcq0Jx
	ahultBIK5BtEqt5z9RX92zJC0CtFVvu66TfgLJb3qIkvfMXVNCSQfPpRus4UQb/LMYJgBsjLZ+oy9
	NNRw2XNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkav1-0000000AlYb-0hGW;
	Wed, 19 Feb 2025 03:38:39 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkatW-0000000AlPd-2n1r;
	Wed, 19 Feb 2025 03:37:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=Kl7u8
	bFLHAjtaElzFILg5UyTJziKGgGFb4LO1YSKTug=; b=BzC9sW61lpYTYF70UeYs9
	3pgGYPYcyNd+RXZb8SFZXSlWn62tp14ZoF4276oyxRjo2W+I+4D9lztbuUmIfwPb
	RvskGq2T5hB18evYkfulaO0P0ep5Xmu23lqP8Dg8NlVatDlPCAn3CeawzhBYOwZ7
	qP1ZyhP2IssKpgsKsjmobA=
Received: from icess-ProLiant-DL380-Gen10.. (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wCH0CvPUbVnWpNgNA--.30420S4;
	Wed, 19 Feb 2025 11:36:49 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	johannes@sipsolutions.net,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Haoxiang Li <haoxiang_li2024@163.com>,
	stable@vger.kernel.org
Subject: [PATCH] wifi: mt76: Add check for devm_kstrdup()
Date: Wed, 19 Feb 2025 11:36:45 +0800
Message-Id: <20250219033645.2594753-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCH0CvPUbVnWpNgNA--.30420S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7Wr4DCr48uF45Cw18ZFyUGFg_yoWDGrc_uF
	s7Zrn3Xry7Gr1Ykr4jyFsIv34Yk3y8JF1kZrySqrySqrZIgrWkGr9xZrn5XrWDuwnxZr9r
	ua1DJ3WrZ39IvjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRNtxhDUUUUU==
X-Originating-IP: [183.174.60.14]
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/1tbiqAv4bme1R0DC6QABsK
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_193707_064403_0EEAA594 
X-CRM114-Status: UNSURE (   9.18  )
X-CRM114-Notice: Please train this message.
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

Add check for the return value of devm_kstrdup() in
mt76_get_of_data_from_mtd() to catch potential exception.

Fixes: e7a6a044f9b9 ("mt76: testmode: move mtd part to mt76_dev")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 drivers/net/wireless/mediatek/mt76/eeprom.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/net/wireless/mediatek/mt76/eeprom.c
index 0bc66cc19acd..443517d06c9f 100644
--- a/drivers/net/wireless/mediatek/mt76/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
@@ -95,6 +95,10 @@ int mt76_get_of_data_from_mtd(struct mt76_dev *dev, void *eep, int offset, int l
 
 #ifdef CONFIG_NL80211_TESTMODE
 	dev->test_mtd.name = devm_kstrdup(dev->dev, part, GFP_KERNEL);
+	if (!dev->test_mtd.name) {
+		ret = -ENOMEM;
+		goto out_put_node;
+	}
 	dev->test_mtd.offset = offset;
 #endif
 
-- 
2.25.1


