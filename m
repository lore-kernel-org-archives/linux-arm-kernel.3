Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D84BCCF2E8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 10:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JMdvjLbmygaAxKZ4470P9jf9J5rCOTHbqfSHY5SXp9A=; b=4tZvOru8rOfVj1Pw+UPW2A/igi
	WokvfkEDYlGlybIJu2e0VDCSo1KZ8n8Xslnjf9QtxYxUH8+IJ5ldxejYZfPVW+nKy722zcykf7VoF
	W9zV+8prMvmvbzXHIQTjX7H8jPY0R8k/3V61VyD7q/JyObZ6o1C+HENFSNBlQJiITfjTnydMhARzG
	hbhTm9Hxmz1qKTYrBLogTHyPYEatBeVTGXI0NBX+E/APrMC4291af3zVxXYz4kwcDGB7B7FtEqu3w
	PKL/D6FRiVgTfrfnnVz1/VL3MSXbnt3AtO6yTpPzuJ4TGk5e2CFsWi5m27yINXfjCiR/odWhG+qg1
	jeWsSxNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkP8-000000078vr-40no;
	Mon, 19 Oct 2026 10:15:43 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkP2-000000078n7-3V70;
	Mon, 19 Oct 2026 10:15:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=JM
	dvjLbmygaAxKZ4470P9jf9J5rCOTHbqfSHY5SXp9A=; b=BIY9THpN9z3EpLKmw6
	4URT/x8Kal0nnp8LhuXSCxTBtnN/5V3sL4UiJBDx+a5+ZCA83gqPH5NJOWLa5Suy
	8FqvlrgAH4H2QHR3+1e6wxEnHqpXWncVSXbY4XoMyFpKcOuVlg1BCHws04oUVd/c
	RCQUxVyiHd6O+gtpnrrn5Q5Sc=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3Hxax7dVq4twABQ--.41578S9;
	Mon, 19 Oct 2026 18:15:27 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 07/10] wifi: mt76: mt7915: validate channel MIB response length
Date: Mon, 19 Oct 2026 18:15:02 +0800
Message-Id: <20261019101506.1926943-8-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261019101506.1926943-1-yaojiale02@163.com>
References: <20261019101506.1926943-1-yaojiale02@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3Hxax7dVq4twABQ--.41578S9
X-Coremail-Antispam: 1Uf129KBjvdXoWrtFW8tr4UXFy8ur47Gr18uFg_yoWkArX_ur
	nY9rnxKr18Gw1qkr12k3y293yqy395X3WkZrZ3trW3XwsrAFWfCr9rZwnrGrZF9rn2vF45
	Gr98CayUAa4agjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRiuWl7UUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzR+69GrV7b+MHgAA3j
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_031537_252923_51FE0624 
X-CRM114-Status: UNSURE (   8.36  )
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

The channel survey query reads several MIB entries at a chip-specific
offset without checking that the firmware response reaches those
entries. A truncated response can cause out-of-bounds reads.

Validate the offset and complete MIB array before processing it.

Fixes: 654300281196 ("mt76: mt7915: use mt7915_mcu_get_mib_info() to get survey data")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 05614b99165b..955c0e6c7cb6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -3239,6 +3239,10 @@ int mt7915_mcu_get_chan_mib_info(struct mt7915_phy *phy, bool chan_switch)
 					req, len * sizeof(req[0]), true, &skb);
 	if (ret)
 		return ret;
+	if (skb->len < offs_cc + len * sizeof(*res)) {
+		dev_kfree_skb(skb);
+		return -EINVAL;
+	}
 
 	res = (struct mt7915_mcu_mib *)(skb->data + offs_cc);
 
-- 
2.34.1


