Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC9DC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 20:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f7uS8kE1rBVNDaMywwJf3hvzLjVeRyWreUsKgRZVmCs=; b=WM40Z6yH2p8mK9AUaHUFjD+XYI
	EO/eRQa8kGcOFw2o5UHBJ1ViMCGL/gWuRlfxWKXVLIdg7aqO75Y2mGsQrn1f0u7xocp/c8ugmcB3Y
	Obuw6IiKG4NfOT/ocbjsoehWwXOx4U96kIZKxzWiidWQzOX0irUbAke1U5/6vZPRvOSi/131mn1ij
	XB6kGwqOWQcSNVDGqiNhMNfR+bGXz9Vwdknq2P6w4b0Ll6tNivZJOakSwv37g8D5xfMq7/Gk+Q8W9
	HEnzburTHWvLD0N5svn6cxkNAn4yXExGexPcw1VXIWXHjVaFH6Ehd9V/aPV0twhgWmJ859KNV+i06
	Em+Neq/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk7eR-00000001WYh-15Fi;
	Thu, 07 Aug 2025 20:55:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk7bt-00000001WKy-3vNi;
	Thu, 07 Aug 2025 20:53:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A973445AD1;
	Thu,  7 Aug 2025 20:53:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB75BC4CEEB;
	Thu,  7 Aug 2025 20:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754599991;
	bh=eEXKk+I5tcJfGdMDXMtI2opCtm6L4e5pQiFvbhVEGIg=;
	h=From:To:Cc:Subject:Date:From;
	b=YD1KCJDAp/afwmcAIXaDAe+TcWH+rKH/N+MWNtUKeAkI8XBwfq8FgWIbqX4f4ExGR
	 G2sn1c7exZ1BQVApQGsRD46319pTu4w8uxdw4W+MUbYiPCYPsST7rkHS2b943o/Eqy
	 VQW7p4aQBQUT/SvMG5rThh7dpBvC0FOHsSjD4sR9xgy3DssE0CBpwWkYmypatyHbI6
	 Ed5ojaPLOZ9UK5sIB8aME66LydmX6tUf/6/tCV/9NmPTgZcgg3ocfmSdhLpHdHIPFH
	 L3vC1T5CXyGoBtf8Bvhacpo0+2IoyJcDbYMc9UlExO3JAdPDJaa5Kkb9SkgHXrrl7O
	 lQLmhLehB4otg==
From: Arnd Bergmann <arnd@kernel.org>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	Bo Jiao <Bo.Jiao@mediatek.com>,
	Howard Hsu <howard-yh.hsu@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH] mt76: avoid uninitialized skb data
Date: Thu,  7 Aug 2025 22:52:57 +0200
Message-Id: <20250807205305.88394-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_135314_013314_89A7CF93 
X-CRM114-Status: GOOD (  10.94  )
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

From: Arnd Bergmann <arnd@arndb.de>

Two functions in the mt7996 driver cause a clang-21 build warning because
the pass uninitialized data into skb_put_data:

drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:1894:21: error: variable 'hdr' is uninitialized when passed as a const pointer argument here [-Werror,-Wuninitialized-const-pointer]
 1894 |         skb_put_data(skb, &hdr, sizeof(hdr));
      |                            ^~~
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:3386:21: error: variable 'hdr' is uninitialized when passed as a const pointer argument here [-Werror,-Wuninitialized-const-pointer]
 3386 |         skb_put_data(skb, &hdr, sizeof(hdr));
      |                            ^~~

Remove the otherwise unused variables and instead use skb_put_zero() instead
to fill the header with zeroes.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 3593fd40c51b..6a00df3c5343 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -1880,18 +1880,17 @@ int mt7996_mcu_set_fixed_rate_ctrl(struct mt7996_dev *dev,
 				   void *data, u16 version)
 {
 	struct ra_fixed_rate *req;
-	struct uni_header hdr;
 	struct sk_buff *skb;
 	struct tlv *tlv;
 	int len;
 
-	len = sizeof(hdr) + sizeof(*req);
+	len = sizeof(struct uni_header) + sizeof(*req);
 
 	skb = mt76_mcu_msg_alloc(&dev->mt76, NULL, len);
 	if (!skb)
 		return -ENOMEM;
 
-	skb_put_data(skb, &hdr, sizeof(hdr));
+	skb_put_zero(skb, sizeof(struct uni_header));
 
 	tlv = mt7996_mcu_add_uni_tlv(skb, UNI_RA_FIXED_RATE, sizeof(*req));
 	req = (struct ra_fixed_rate *)tlv;
@@ -3370,20 +3369,17 @@ void mt7996_mcu_exit(struct mt7996_dev *dev)
 
 int mt7996_mcu_set_hdr_trans(struct mt7996_dev *dev, bool hdr_trans)
 {
-	struct {
-		u8 __rsv[4];
-	} __packed hdr;
 	struct hdr_trans_blacklist *req_blacklist;
 	struct hdr_trans_en *req_en;
 	struct sk_buff *skb;
 	struct tlv *tlv;
-	int len = MT7996_HDR_TRANS_MAX_SIZE + sizeof(hdr);
+	int len = MT7996_HDR_TRANS_MAX_SIZE + 4;
 
 	skb = mt76_mcu_msg_alloc(&dev->mt76, NULL, len);
 	if (!skb)
 		return -ENOMEM;
 
-	skb_put_data(skb, &hdr, sizeof(hdr));
+	skb_put_zero(skb, 4);
 
 	tlv = mt7996_mcu_add_uni_tlv(skb, UNI_HDR_TRANS_EN, sizeof(*req_en));
 	req_en = (struct hdr_trans_en *)tlv;
-- 
2.39.5


