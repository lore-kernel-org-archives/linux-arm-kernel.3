Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E92C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 13:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=e/ek90dEq0KZTbEKpW5UfQ3WuiBkE3l1wGRzOsJ1oRM=; b=S/z/D1e1eJj9tB
	WgQId19HEhu3k0pObVMQeisfdjSlI5UIcrnTUb/P94G8q2Yg7A0lcRt/kG/wKhsJ5MWy4MqHhxsO3
	Cnm8cwL6O0cD5Tq4RuGyO8DYPHutodWk3e+Cn5UkZCHgTQzHE565nuOMoSvdiwv3AnJ0XKC03NZeZ
	YPI9/ZVlkHf5lDFULWdt6reTR2QyQSsV176/tlIj/+vXxTVBHiK7f341tbJFRSCEvMVKfuunIalvh
	+Dy0JSNAUfDp8MjF0Gc9oeE+9FkoTS5td4UZxsaRXYRdNEoAHRJQJz1CtQt9sC17LdTDDtA6i+Sds
	VulKZduBn1sObQwX10zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXgCM-0000000ETuI-0a0Z;
	Fri, 04 Jul 2025 13:11:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXg9R-0000000ETHa-2Wbx;
	Fri, 04 Jul 2025 13:08:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 754C05C634C;
	Fri,  4 Jul 2025 13:08:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1E9BC4CEE3;
	Fri,  4 Jul 2025 13:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751634504;
	bh=rwGfwl3S3wpFQNg2aerUj0nTT3rck9I4bSEbo7X2vVs=;
	h=From:Subject:Date:To:Cc:From;
	b=MTX1TZp8TpXwdII2TqdUEKGpeKsqpt7DFXDOxQk0/KHTV5ez1pvZRgnlderHW5j4p
	 7DEQj6Myxs9ZD31lk7RuniDQmmWoPpyhzhjKxDodxdd1zQePJBTrmdWjKuZd2uJGy9
	 DC1m4bNyzKW+4W96Ti8ookVPzvkgtQBddFltMq9uN3sChJvoQr7CM33UxaA0Qs0mVn
	 85VHpxSQH0mj5wzrHMbZ4xsLcBxqcGQK5tzItYDXbv/9rEWget5fgf1g9lsZ8ryxa6
	 LOHViadmk4Xktrtl2CjjB9brt9MyjO5hVj8ALORIZ6fWJN77eT6TYEw/cSNnIkCBVK
	 I9A+yreWtC21w==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH mt76 0/9] wifi: mt76: mt7996: Various MLO fixes
Date: Fri, 04 Jul 2025 15:08:04 +0200
Message-Id: <20250704-mt7996-mlo-fixes-v1-0-356456c73f43@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADTSZ2gC/x3LTQqAIBBA4avErBswsdSuEi3SphroD40IpLsnL
 T8eL0GkwBShLRIEujnysWdUZQF+GfaZkMdskELWQguF26WtbXBbD5z4oYjkjZLOe2OFg7ydgf6
 Qr65/3w//ApAxYgAAAA==
X-Change-ID: 20250704-mt7996-mlo-fixes-ec842bcc890b
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bo Jiao <Bo.Jiao@mediatek.com>, Peter Chiu <chui-hao.chiu@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_060825_686419_95DB5B6E 
X-CRM114-Status: UNSURE (   7.12  )
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

Multiple MLO fixes for MT7996 driver in the mixed MLO/non-MLO scenario.

---
Felix Fietkau (1):
      wifi: mt76: fix vif link allocation

Lorenzo Bianconi (8):
      wifi: mt76: mt7996: Fix secondary link lookup in mt7996_mcu_sta_mld_setup_tlv()
      wifi: mt76: mt7996: Rely on for_each_sta_active_link() in mt7996_mcu_sta_mld_setup_tlv()
      wifi: mt76: mt7996: Do not set wcid.sta to 1 in mt7996_mac_sta_event()
      wifi: mt76: mt7996: Fix mlink lookup in mt7996_tx_prepare_skb
      wifi: mt76: mt7996: Fix possible OOB access in mt7996_tx()
      wifi: mt76: mt7996: Fix valid_links bitmask in mt7996_mac_sta_{add,remove}
      wifi: mt76: mt7996: Add MLO support to mt7996_tx_check_aggr()
      wifi: mt76: mt7996: Move num_sta accounting in mt7996_mac_sta_{add,remove}_links

 drivers/net/wireless/mediatek/mt76/channel.c     |  4 +-
 drivers/net/wireless/mediatek/mt76/mt76.h        |  5 +-
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c  | 48 +++++++-------
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 80 ++++++++++++++----------
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c  | 17 +++--
 5 files changed, 83 insertions(+), 71 deletions(-)
---
base-commit: b3a431fe2e399b2e0cc5f43f7e9d63d63d3710ee
change-id: 20250704-mt7996-mlo-fixes-ec842bcc890b

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


