Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D87CFC44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 10:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gYS/s/mJZg8kSoqaAjGR8OuLsVnIuH8FyrGiHLOoMBw=; b=jsGbaiJr3RzR9CVqRU7mxcE0jV
	NnmkoIOaaJSSGfIWOy723hXvKpkwPs6lGIJgT+b19Clg+cCpSM4hH5BqfiT1RYD+EnnrI900ccZtZ
	Vdq/tXWmA2rgqMXpDoWlDr/Ptgv7LMggJugyagL7Sm30yPAC8vBOT0oZXoEkO1xsKzerQAvZNDEVF
	EV092YiIspSzXy7fFcp+V4zoUd4XN+8CuNhSzGpcePlR/QtlVSzkTa5rQRRnXKT0AjxEyVh66QZTN
	fUp+/uBxEdFMR61pWX+bnVKnAWKnHFMlryYaqjWfKEJ228WcW6f8vQB6rs9TxDjLE7FebqehdmZax
	O+t/4ugw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vis7L-00000006s0b-37yB;
	Thu, 22 Jan 2026 10:40:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vis7C-00000006rlk-0pAl;
	Thu, 22 Jan 2026 10:40:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=gYS/s/mJZg8kSoqaAjGR8OuLsVnIuH8FyrGiHLOoMBw=; b=DhHuolW5DalPcns3iudxRaNdBm
	jdVF67dud9am4QOsbd2wiZDgxr/4aM40/p32td6qGC/znCC4BaN2RQsQbgNrAaLqqPSUxjjtYAa+W
	4o0PDBEe+/bergKvRRI85L78KEVvwS1jkSMenm7uBRrvWeOFzgDQbJclJ2HUFBJl622gPRv79aAF6
	ElQP6nMMz3aUlZPeLQKNEAVRwMk+Eb3tR3N/eo1W5DKUofpx7wLkCnp/O3LgGBekZH1aDONEaE2vE
	VlwrLn9dbSB8US5kq+StoNExlmMVa5sJeuqaCedt2LNja8Nk6BBurlq+Q1sXL0fPx0txBpxn2ut9P
	OtcwVifA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vis76-00000000AM8-3BWD;
	Thu, 22 Jan 2026 10:40:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B9E0408AC;
	Thu, 22 Jan 2026 10:40:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC8EAC19423;
	Thu, 22 Jan 2026 10:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769078431;
	bh=9Uszu60UHgFL+GPzuEEZEdDB9HFrySR5BS0wkxLs63g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AtxOgxEf13UvH5JO17FbWc4vboV1YAnbMGV1p4lqLeU9KIGrTBdrYduBJiAwvg75P
	 qDwcbhQmECD2UXFbwllOzoTOR4TWkC3t3MewRHbXKaD+VHBIOQuWzQwtE15eNGab7H
	 dnG2UewapwjZKyzuBqBN4ObnMRiCbaGnenfufuBAHO9w1HHo587lbZR9ez/C+9lELM
	 yPQqYjTxwe2b7RlaLzjpX7KW/APHfj2asRZV6doJcJVPDiCd/XB+yRgi8bbwrTg91A
	 ywtAZu776/WDUysP5Res1L/+krEuWu+pKkb/g2AZLpWBVRE7x+3G2wRGQD23zT6qQ6
	 G6JMvRavpiDoA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 22 Jan 2026 11:39:54 +0100
Subject: [PATCH mt76 v2 10/17] wifi: mt76: mt7996: Integrate MT7990 init
 configuration for NPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-mt76-npu-eagle-offload-v2-10-2374614c0de6@kernel.org>
References: <20260122-mt76-npu-eagle-offload-v2-0-2374614c0de6@kernel.org>
In-Reply-To: <20260122-mt76-npu-eagle-offload-v2-0-2374614c0de6@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Kang Yang <kang.yang@airoha.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_104034_256936_EF73E2D8 
X-CRM114-Status: GOOD (  10.95  )
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

Add NPU integration in MT7996 init codebase for MT7990 chipset.
This is a preliminary patch to enable NPU offload for MT7996 (Eagle)
chipset.

Tested-by: Kang Yang <kang.yang@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/init.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
index 03c1ccb49ef02ebe9c2ae91db836593e680ee2c0..526a2cb298fd7f9dc8d0fcdd8de0e4071c07338f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -592,7 +592,7 @@ static void mt7996_mac_init_basic_rates(struct mt7996_dev *dev)
 void mt7996_mac_init(struct mt7996_dev *dev)
 {
 #define HIF_TXD_V2_1	0x21
-	int i;
+	int i, rx_path_type;
 
 	mt76_clear(dev, MT_MDP_DCR2, MT_MDP_DCR2_RX_TRANS_SHORT);
 
@@ -606,11 +606,16 @@ void mt7996_mac_init(struct mt7996_dev *dev)
 	}
 
 	/* rro module init */
-	if (dev->hif2)
+	if (dev->hif2) {
+		if (mt76_npu_device_active(&dev->mt76))
+			rx_path_type = is_mt7996(&dev->mt76) ? 6 : 8;
+		else
+			rx_path_type = is_mt7996(&dev->mt76) ? 2 : 7;
 		mt7996_mcu_set_rro(dev, UNI_RRO_SET_PLATFORM_TYPE,
-				   is_mt7996(&dev->mt76) ? 2 : 7);
-	else
+				   rx_path_type);
+	} else {
 		mt7996_mcu_set_rro(dev, UNI_RRO_SET_PLATFORM_TYPE, 0);
+	}
 
 	if (mt7996_has_hwrro(dev)) {
 		u16 timeout;

-- 
2.52.0


