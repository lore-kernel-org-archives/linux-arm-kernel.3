Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A89AC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 07:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c7EOKObQSsV2ktESpqo3x4qyvhvJ2Cl23v55sLlGGks=; b=TDYWyw9qruPlMOmWzQHl2aqPKU
	lleoO/0ZDMwMyuTVrn+qnQV9G+IBDwVlpWw1XoFLXxZbTmWL0gADnswsfNL47o4Bag9H+ghrr4BJ3
	m85qZUldSMlxZZWYLuIaBu9A77Fd3NCXYVtsdh/WvFrwifw2n9vGFSP1xRXERpQGbYxGos7r9ji4C
	+3n5xUGVVuL8kDbFACN/3PLsBEGli2mN8oFmO6hRo0+vsJDx81WjpGjAWweKgKiBnoaORYYxpWrH4
	P7BBbTmyBvdiTt5MwRkriEA9UFJ95bkZhwm1on4SadavRg1dc+oC2bQ3Hh0oZUs/RRduSLnRGiOq0
	/J8j7oSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumh5-00000002DUA-45T7;
	Fri, 14 Aug 2026 07:51:12 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumh0-00000002DTU-1XaQ;
	Fri, 14 Aug 2026 07:51:09 +0000
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowAD3y+_nyH5qYF+eBQ--.22171S2;
	Fri, 14 Aug 2026 15:51:03 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH v2] soc: mediatek: mtk-svs: remove the debugfs tree on teardown
Date: Fri, 14 Aug 2026 15:51:03 +0800
Message-ID: <20260814075103.10392-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAD3y+_nyH5qYF+eBQ--.22171S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXF4fZry3XF1fXr4xuFykZrb_yoW5Xw1xpa
	nYk3WrKry8Jr17GFWfAa17X3WfurZ7W3y7uryxW3s7Z3sxAr1rXr97tFWYqrZaqFykGa47
	ZF18tryUCa15KFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkC14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfUe0PSUU
	UUU
X-Originating-IP: [111.196.241.250]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_005106_775549_9C350222 
X-CRM114-Status: GOOD (  12.00  )
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

svs_create_debug_cmds() publishes a debugfs tree whose private data
points at devm-managed platform and bank state. Partial creation failure
and device teardown currently leave entries referring to state that is
about to be released.

Remove the complete tree on partial failure and register a devm action
after successful creation. The debugfs full-proxy lifetime rules keep
active file operations synchronized with removal, and the devm action
runs before the managed SVS state is freed.

Fixes: 13f1bbcfb582 ("soc: mediatek: SVS: add debug commands")
Assisted-by: Codex:gpt-5
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
Changes since v1: https://lore.kernel.org/all/20260616151406.92529-1-pengpeng@iscas.ac.cn/
- remove the complete debugfs tree after partial creation failure
- register devm teardown for successful probes
- recheck open-file lifetime against the debugfs full proxy

The debugfs and devm lifetimes were reviewed statically; bind/unbind was
not exercised on MediaTek hardware.

 drivers/soc/mediatek/mtk-svs.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index 99edecb204f2..7ebc680627c9 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -172,6 +172,11 @@ static DEFINE_SPINLOCK(svs_lock);
 	}
 
 #define svs_dentry_data(name)	{__stringify(name), &svs_##name##_debug_fops}
+
+static void svs_remove_debug_cmds(void *data)
+{
+	debugfs_remove(data);
+}
 #endif
 
 /**
@@ -887,7 +892,7 @@ static int svs_create_debug_cmds(struct svs_platform *svsp)
 		if (IS_ERR(file_entry)) {
 			dev_err(svsp->dev, "cannot create %s/%s: %ld\n",
 				d, svs_entries[i].name, PTR_ERR(file_entry));
-			return PTR_ERR(file_entry);
+			goto err_remove_debugfs;
 		}
 	}
 
@@ -901,7 +906,8 @@ static int svs_create_debug_cmds(struct svs_platform *svsp)
 		if (IS_ERR(svsb_dir)) {
 			dev_err(svsp->dev, "cannot create %s/%s: %ld\n",
 				d, svsb->name, PTR_ERR(svsb_dir));
-			return PTR_ERR(svsb_dir);
+			file_entry = svsb_dir;
+			goto err_remove_debugfs;
 		}
 
 		for (i = 0; i < ARRAY_SIZE(svsb_entries); i++) {
@@ -912,12 +918,17 @@ static int svs_create_debug_cmds(struct svs_platform *svsp)
 				dev_err(svsp->dev, "no %s/%s/%s?: %ld\n",
 					d, svsb->name, svsb_entries[i].name,
 					PTR_ERR(file_entry));
-				return PTR_ERR(file_entry);
+				goto err_remove_debugfs;
 			}
 		}
 	}
 
-	return 0;
+	return devm_add_action_or_reset(svsp->dev, svs_remove_debug_cmds,
+					svs_dir);
+
+err_remove_debugfs:
+	debugfs_remove(svs_dir);
+	return PTR_ERR(file_entry);
 }
 #endif /* CONFIG_DEBUG_FS */
 
-- 
2.50.1 (Apple Git-155)


