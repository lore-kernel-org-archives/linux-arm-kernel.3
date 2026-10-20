Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00304606A337
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 02:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Npd7JzSy;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=WpQT42JF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lONQ58hOPHjFuw/A/dJum6aO3jorcmydyDZYCpMwFoY=; b=Npd7JzSyjUZasBOzOfwVmwNoxG
	YPhulm+yv9mnNRrlBxDoVTvlHl+WTe1dPHrobiOV59/HcEbQMp7oErr5kEoBo8hyOcSE1cSpjyr7n
	4xVmF43EDvN8Lx7lxB/omQrVFdH9q1fH2dx1h47786vNNikN/zdlgbKN+e1c44VkZnn6SaWJ8491a
	h3z06cjXKkzJdVhqE0s2in9CP/yrLBemXKfFbvijwKYI/+UEBopSEO7VyC6DiBFaNbJoCSjI0+VuW
	G0IDdloDs3akcOazFAfPAASNtDa9fNmVy2zMQ2meiw9ZuJ09bS02OvzSqbU9qgXeA7RzDAHu6yXmT
	UmFOrFkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIzsP-00000008iKp-1xNQ;
	Tue, 20 Oct 2026 02:46:57 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIzrf-00000008hk9-03xo;
	Tue, 20 Oct 2026 02:46:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=lO
	NQ58hOPHjFuw/A/dJum6aO3jorcmydyDZYCpMwFoY=; b=WpQT42JFDdP0Q0WVwu
	X8rGGex3p875ozA4YialWoWK9MEyBB6WFkuR+/sAQRpVkXoow2RvxRCbCuVNXgXm
	697qOzAsPhEAcmI2Tn0EM6kQk8MLucZzk4xkXO828kM1WfZBmt6GVJu7R/7FA6cB
	ixub0cz+2aiCc2ehd7fI6MbXM=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD3H9HZ1dZq2OtmBQ--.60682S12;
	Tue, 20 Oct 2026 10:46:00 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Allan Wang <allan.wang@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 10/11] wifi: mt76: mt7925: validate radio status response
Date: Tue, 20 Oct 2026 10:45:42 +0800
Message-Id: <20261020024544.3101738-11-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020024544.3101738-1-yaojiale02@163.com>
References: <20261020024544.3101738-1-yaojiale02@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3H9HZ1dZq2OtmBQ--.60682S12
X-Coremail-Antispam: 1Uf129KBjvdXoWrtr15Jw45uF17KrW8Ar4fZrb_yoWkCFbE9r
	1v9r97Jr18Gw1DKr42kr47GFWqk3yv9a4rurWrtrWrX3y7JrW7urs7ZrnxWr929392vFs8
	Crs8JFyxuw13WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8gJ55UUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzggAOmrW1eiMbgAA3f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_194611_833470_5BB87891 
X-CRM114-Status: UNSURE (   8.93  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.8 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The radio status query removes an outer TLV header and reads the status
event without checking the response length. A truncated firmware
response can cause an out-of-bounds read.

Require both the outer TLV header and complete status event before
pulling the skb.

Fixes: e54b870212c0 ("wifi: mt76: mt7925: add rfkill_poll for hardware rfkill")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index f37d2a8eafe6..0baef78148d1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -4140,6 +4140,10 @@ int mt7925_mcu_wf_rf_pin_ctrl(struct mt792x_phy *phy)
 					&req, sizeof(req), true, &skb);
 	if (ret)
 		return ret;
+	if (skb->len < sizeof(struct tlv) + sizeof(*status)) {
+		dev_kfree_skb(skb);
+		return -EINVAL;
+	}
 
 	skb_pull(skb, sizeof(struct tlv));
 	status = (struct mt7925_radio_status_event *)skb->data;
-- 
2.34.1


