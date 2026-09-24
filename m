Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B490BC98314
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 13:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vQW8S4/0nq/AUT2KXMkhDrRHQ+sSLWd9EBh9wzVJFG8=; b=J2Pmz06d/r5DZxqPzoYG/n30kb
	8WWwH/JCL7NIcUUuIClSoUqhzejGTSs/XGxmqw/OP87W8SlokNho4s3zKJMN4KUysJWIq1wb2cIOL
	Dvh6cphRhjVQeeILvFfNfyI7XE7jKqE6lCqRWA2nQSeApz/yj6t5OyOxCaAYzNqv8j6mocCde3vdv
	PQepH+VPvTeYJ3FjBI5VCFjR5A1IaXz4gGkOyTZwI9vmnGhZAS92Gq4trWLy4fl3SPt8cr98R6KwZ
	4BgSCn6FMk5ugTOHolb9ZpD5LxHrcYEn9zUQhQ35HWSHZItJye3P8NvXqruOJ/b5OTu1AGxmHDTeW
	IsCv7rdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jN6-0000000B43n-0j4s;
	Thu, 24 Sep 2026 13:20:20 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jMt-0000000B3wO-3XgY;
	Thu, 24 Sep 2026 13:20:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=vQ
	W8S4/0nq/AUT2KXMkhDrRHQ+sSLWd9EBh9wzVJFG8=; b=BddsRQ/UiLWP+PRlyL
	BDidsUeLDDJvws1xa65WHPW0QI4UHUajHffdeNfePGsLHAlLAvVz0LovxiYzuz9d
	QnURc9i3rA2FK8yyBl4wy4phnH25wA3BrzAuH2j5YBBggbfp0qJwFqLqo//Akp1k
	s6CsqiDxbQQt5COTTAgOLAvkU=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3d5ROI7Vqq0FrAg--.32720S6;
	Thu, 24 Sep 2026 21:19:41 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	Javier Tia <floss@jetm.me>,
	Leon Yen <leon.yen@mediatek.com>,
	Eason Lai <Eason.Lai@mediatek.com>,
	Marek Vasut <marex@nabladev.com>,
	Ville Nummela <ville.nummela@kempower.com>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
	Nelson Yu <nelson.yu@mediatek.com>,
	Rong Yan <rong.yan@mediatek.com>,
	Quan Zhou <quan.zhou@mediatek.com>,
	Prameela Rani Garnepudi <prameela.j04cs@gmail.com>,
	Kalle Valo <kvalo@kernel.org>,
	Amitkumar Karwar <amit.karwar@redpinesignals.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Jiale Yao <yaojiale02@163.com>,
	stable@vger.kernel.org
Subject: [PATCH 4/4] wifi: mm81x: unwind add_interface failure
Date: Thu, 24 Sep 2026 21:19:04 +0800
Message-Id: <20260924131908.950229-5-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260924131908.950229-1-yaojiale02@163.com>
References: <20260924131908.950229-1-yaojiale02@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3d5ROI7Vqq0FrAg--.32720S6
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kr47trWfAr1kAFyxCr4DJwb_yoW8tr1kpr
	4kWrZ8KrZ8JrWrGa18Ca10vFyrXw4xGFW3CFy8Gwn5uF1qvr1fGFy5Aws0yFnYkFyfG3W2
	yrW0krn8W3ZxG37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piCeHPUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC8A3rJmq1I21MFwAA36
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_062008_320288_7F5B64CA 
X-CRM114-Status: GOOD (  11.68  )
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

mac80211 does not call remove_interface() after add_interface() fails, so
the driver must undo any state it published before returning an error.

mm81x_mac_ops_add_interface() publishes the vif through the RCU-protected
vif table and initializes AP beacon handling before querying firmware
capabilities.  If that query fails, the published pointer remains after
mac80211 frees the vif.  Interrupt processing can then retrieve and
dereference the stale vif.

Finish AP beacon handling, clear the RCU slot, and ask the firmware to
remove the interface when the capabilities query fails.  Preserve the
original query error if firmware cleanup also fails.

Commit 2fb6480c52f6 ("wifi: mt76: mt7915: unwind state on add_interface
failure") fixed the same failure-unwind pattern in another wireless driver.

Fixes: b1906cea00b0 ("wifi: mm81x: add mm81x Wi-Fi HaLow driver")
Cc: stable@vger.kernel.org
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/net/wireless/morsemicro/mm81x/mac.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/morsemicro/mm81x/mac.c b/drivers/net/wireless/morsemicro/mm81x/mac.c
index 0fa80b1488aa..1edad7eace61 100644
--- a/drivers/net/wireless/morsemicro/mm81x/mac.c
+++ b/drivers/net/wireless/morsemicro/mm81x/mac.c
@@ -2169,7 +2169,7 @@ static int mm81x_mac_restart(struct mm81x *mors)
 static int mm81x_mac_ops_add_interface(struct ieee80211_hw *hw,
 				       struct ieee80211_vif *vif)
 {
-	int ret = 0;
+	int cleanup_ret, ret = 0;
 	struct mm81x *mors = hw->priv;
 	struct mm81x_vif *mors_vif = (struct mm81x_vif *)vif->drv_priv;
 
@@ -2221,6 +2221,13 @@ static int mm81x_mac_ops_add_interface(struct ieee80211_hw *hw,
 		dev_err(mors->dev,
 			"mm81x_cmd_get_capabilities failed for vif %d",
 			mors_vif->id);
+		if (vif->type == NL80211_IFTYPE_AP)
+			mm81x_mac_beacon_finish(mors_vif);
+		RCU_INIT_POINTER(mors->vifs[mors_vif->id], NULL);
+		cleanup_ret = mm81x_cmd_rm_if(mors, mors_vif->id);
+		if (cleanup_ret)
+			dev_err(mors->dev, "mm81x_cmd_rm_if failed %d",
+				cleanup_ret);
 		return ret;
 	}
 
-- 
2.34.1


