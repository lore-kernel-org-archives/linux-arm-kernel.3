Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B33CD98E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 15:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k4sF5WpVzdEyVtuQeIw9MyeysNuky4T6E+XmpN9EmF8=; b=wUMb2bGxB+BvXhAqSMoI29l1jw
	Xs9SZYl0U2oLeLMf6AUf47dW1oj1IKCJ4DiT1d5nikR57+vXNyRJTQn0k4tz3TghPljm17rMMc0Hh
	ZU0dWp0JfuuHoDp/QqOQFRCX5ku3W2r448ev08b/zaFRpbT3Y5Rgdka1HduB6OeUFDcYDLR7V7uI9
	fomc53c5bZMSpxERDOpTp4C3rA8QGPcCmUbuUg1JiEjk2k4GCyoSCSdgqWsvneayZ2Chf2iUsH5Lz
	W/hxDYbS2rMQz/9waa3BkD3eSOUI/V4mt2m9/Fw7Rzsed5OnY+U1g8/8gJ/3QVRjqOqvIpUCWg2RS
	zUdCK64g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZVUa-0000000FzNK-28hX;
	Tue, 16 Jun 2026 15:14:20 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZVUX-0000000FzMO-2SLU;
	Tue, 16 Jun 2026 15:14:19 +0000
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowAAHINdAaDFqIxPxFA--.13533S2;
	Tue, 16 Jun 2026 23:14:09 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH] soc: mediatek: mtk-svs: clean up debugfs entries
Date: Tue, 16 Jun 2026 23:14:06 +0800
Message-ID: <20260616151406.92529-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowAAHINdAaDFqIxPxFA--.13533S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kr4UCFW7Ar1rAr18JFW5ZFb_yoW8uw48pa
	nYk3WrKry8Jr13GFWfAa1UX3Z3u3yIg3y7Ga47Wwn7Z3sxAr4rXr97JFWYvrWSqFykGay7
	XF10kryUC3W5trJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkG14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1l
	IxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUxcTPUUU
	UU=
X-Originating-IP: [111.196.245.140]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_081418_255228_E928518B 
X-CRM114-Status: GOOD (  10.37  )
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

svs_create_debug_cmds() publishes debugfs files whose private data points
at the SVS platform and bank state, but neither partial debugfs creation
failures nor device teardown remove the tree before that state is
released.

Remove the debugfs tree on partial creation failures and register a devm
action so successful probes remove the tree before devm-managed SVS state
is freed.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/soc/mediatek/mtk-svs.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index 99edecb204f2..2caab6a89698 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -172,6 +172,11 @@ static DEFINE_SPINLOCK(svs_lock);
 	}
 
 #define svs_dentry_data(name)	{__stringify(name), &svs_##name##_debug_fops}
+
+static void svs_remove_debug_cmds(void *data)
+{
+	debugfs_remove_recursive(data);
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
+	debugfs_remove_recursive(svs_dir);
+	return PTR_ERR(file_entry);
 }
 #endif /* CONFIG_DEBUG_FS */
 
-- 
2.43.0


