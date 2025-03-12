Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3863C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 11:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=B7rpOVJ7hBinkm31RzxTATCF0JcnY3Cq56Ko9btt0iw=; b=WE/3GgztXumIhb
	q96+N+AXU0UqXE+KfOIY8cTsDwVanoxd/bYvsza3pt+gc9s94BHp0VmOVsj8h0nXD0WG0f+yNBTEF
	3XVj7l4UmcWH3l02IEqtU8jYBJHZxkTBfy51Wy6jfrW38HR0bisemNNcOe8cmJMaUFD+EVQAAoJA+
	BwTzWh4rGwsjOhgxeWi2HeNQ09VwJw9VAx0ZlK1lEZ3kguqvIcfMSKoMIDGgkmsgStnFuTJCPmpXD
	jPp1knGugV6HtGiaZayWOE3w5n+GllD0i9g27TsH7HBqB/70TqEUAx25km7li1CVjUmjWYz2D3Vur
	jmY/Fl5y3rbuAQgfXh/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsKCh-00000008FBJ-0ntC;
	Wed, 12 Mar 2025 11:24:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsK2D-00000008Dto-07ao;
	Wed, 12 Mar 2025 11:14:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 323295C4C4C;
	Wed, 12 Mar 2025 11:11:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5908DC4CEE3;
	Wed, 12 Mar 2025 11:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741778039;
	bh=1i42LEYWnooCgw6RTcX9X+IbQM3F7trqbsr3RzKCLjE=;
	h=From:Subject:Date:To:Cc:From;
	b=cnWHDUP4v/uF+NZlL9BC+3QQ6HT5AC7/0lBqlsgpqGqgGHZ7kAOA+M5ELEMZfx5U2
	 gXWnAtqKLv8Ltj+NFK8Pdl/v4aYtEJ4krcjOXdO89SFrUEq23fXnWJBAew6NC/VQ7q
	 Hs3/XpBQb/9tbNDC/9FJx5COi8foD0SYie8YEFJ3fnje2KJg0BQXDwrxU5SF26m+5I
	 0pU8qdbO3xBiHUIFgp/s4988RZt+rYXNY+qSuBi9kbFIXvlh7LvrI0s3hOJReEtySh
	 HWmsBsaL+yHnvtxPrlRaz+ZkgR/Oxy9ejgNMetTIcG/jlPcwcXetEX31XQprEwSLlQ
	 PsipGkCD9Qf3A==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH 00/21] wifi: mt76: mt7996: second preliminary work to
 support MLO
Date: Wed, 12 Mar 2025 12:13:44 +0100
Message-Id: <20250312-b4-mt7996-mlo-p2-v1-0-015b3d6fd928@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGhs0WcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDY0Mj3SQT3dwSc0tLM93cnHzdAiPdlBSL1LRUkyQzSzMTJaC2gqLUtMw
 KsJHRsbW1ABpjO01iAAAA
X-Change-ID: 20250312-b4-mt7996-mlo-p2-dd8efe4b6964
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Bo Jiao <Bo.Jiao@mediatek.com>, 
 Peter Chiu <chui-hao.chiu@mediatek.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_041401_181896_89B2E855 
X-CRM114-Status: UNSURE (   5.26  )
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

This series is the second preliminary work needed to support MLO in
MT7996 driver.

---
Lorenzo Bianconi (9):
      wifi: mt76: mt7996: Add mt7996_sta_link to mt7996_mcu_add_bss_info signature
      wifi: mt76: mt7996: rework mt7996_sta_hw_queue_read to support MLO
      wifi: mt76: mt7996: rework mt7996_mac_sta_rc_work to support MLO
      wifi: mt76: mt7996: rework mt7996_mac_sta_poll to support MLO
      wifi: mt76: mt7996: rework mt7996_update_mu_group to support MLO
      wifi: mt76: mt7996: rework mt7996_net_fill_forward_path to support MLO
      wifi: mt76: mt7996: set vif default link_id adding/removing vif links
      wifi: mt76: mt7996: rework mt7996_ampdu_action to support MLO
      wifi: mt76: mt7996: Update mt7996_tx to MLO support

Shayne Chen (12):
      wifi: mt76: mt7996: Update mt7996_mcu_add_rate_ctrl to MLO
      wifi: mt76: mt7996: Add mt7996_mcu_sta_mld_setup_tlv() and mt7996_mcu_sta_eht_mld_tlv()
      wifi: mt76: mt7996: Add mt7996_mcu_teardown_mld_sta rouine
      wifi: mt76: mt7996: rework mt7996_mac_write_txwi() for MLO support
      wifi: mt76: mt7996: Rely on wcid_to_sta in mt7996_mac_add_txs_skb()
      wifi: mt76: mt7996: rework mt7996_rx_get_wcid to support MLO
      wifi: mt76: mt7996: rework mt7996_sta_set_4addr and mt7996_sta_set_decap_offload to support MLO
      wifi: mt76: mt7996: rework mt7996_set_hw_key to support MLO
      wifi: mt76: mt7996: remove mt7996_mac_enable_rtscts()
      wifi: mt76: mt7996: rework mt7996_mcu_add_obss_spr to support MLO
      wifi: mt76: mt7996: rework mt7996_mcu_beacon_inband_discov to support MLO
      wifi: mt76: mt7996: rework set/get_tsf callabcks to support MLO

 .../net/wireless/mediatek/mt76/mt7996/debugfs.c    |  54 ++-
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c    | 163 +++++--
 drivers/net/wireless/mediatek/mt76/mt7996/main.c   | 493 ++++++++++++++-------
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c    | 321 +++++++++-----
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.h    |  32 ++
 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h |  43 +-
 6 files changed, 754 insertions(+), 352 deletions(-)
---
base-commit: 61cf5540d86945a531dd939e90e72a4b134d7cb8
change-id: 20250312-b4-mt7996-mlo-p2-dd8efe4b6964

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


