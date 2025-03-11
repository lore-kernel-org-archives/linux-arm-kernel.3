Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE05C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 17:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ttIgMNTb4dG5byDUKz4gre67W79KuvKjJZCdEXHRqEE=; b=CYuPF/vzky7Gzj
	ZgGvJp5TjBGftou8egqM0nXaCGzFcVXeGW0b/7tZcql99GROWgiw6aPPxOeVEoXvv5uVnPBkMBiaa
	4Mivgg8ynpiSKP3+pFxrPq2NLTsV8pRiFE/dHQQ8B7fw4D9lQqHDkf5gjBHli4KkaGlCwD8gBa24J
	87NG5CTQ7E9dQqu6+9Vb3jRg8TvCx+N/Rib5Tl8qZ81GImNaScNDYR/YzEp533wXz3aj4YUFo5gjM
	zm5gW/1yVZHiHR4gvqIrFCyJGl3hlQf5thgQRmZ4d7ck/57HW2dfR7Z2iX2b0ERmGgr0MrhT+XnQf
	ikSWCXXeH01QURgKPRKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts3gy-00000006VSg-0Ycd;
	Tue, 11 Mar 2025 17:47:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts3fJ-00000006V92-0FqQ;
	Tue, 11 Mar 2025 17:45:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8B24A5C65F9;
	Tue, 11 Mar 2025 17:42:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AF06C4CEEC;
	Tue, 11 Mar 2025 17:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741715116;
	bh=HsotVx6KpH1JEpP3CAmCRSuWKsczS3BnfeLb6xjVxBY=;
	h=From:Subject:Date:To:Cc:From;
	b=G5kssCRwzyB4/FViiPUYdFPYz46vIbGGPS1cA0pcwICqWGv1D7qAVe3/J8okR2QYi
	 8RvdI6AmRI4tPCk2FCsmFCKQcWon2c6+hLrnOo0Hr+GAzt/EbU5FrIiAH3q4UGKPsg
	 asXrvoLsr8RqLyQGdMs7HEjx+1RjWaE4A0gsyDlRt4K9+upUhkp3of22lhCmnkwKta
	 wPFuo3MQeD7jYDEp11gnF64mxeTmE2v4UgB12e9a75d9CX/15b0bzQu8W+k5lQAxUF
	 MNI5fzvw8bkhgTwJfrBPW3MOAn9PfTygbyFWFCI3SBUZwHTFOlOInxuYwWvpO+QGOm
	 6AHzdy/ng9w2g==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH v2 00/13] wifi: mt76: mt7996: Preliminary work to support
 MLO
Date: Tue, 11 Mar 2025 18:44:59 +0100
Message-Id: <20250311-mt7996-mlo-v2-0-31df6972519b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJt20GcC/23MSw6CMBSF4a2QO7amDyqWkfswDApeoBFac0saD
 enerYwd/ic53w4RyWGEttqBMLnogi8hTxUMs/UTMvcoDZJLzaXkbN0aYy5sXQIzGs2IiluDHMr
 hRTi694Hdu9Kzi1ugz2En8Vv/MkkwzlQ91LbvVSP09fZE8ricA03Q5Zy/xCM45qUAAAA=
X-Change-ID: 20250220-mt7996-mlo-95e9fe30a9e0
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Kalle Valo <kvalo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, 
 Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Bo Jiao <Bo.Jiao@mediatek.com>, 
 Peter Chiu <chui-hao.chiu@mediatek.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_104517_215307_F51C3E6F 
X-CRM114-Status: UNSURE (   8.52  )
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

This series is the first preliminary work needed to support MLO in
MT7996 driver.

---
Changes in v2:
- Rebase on top of mt76 master branch
- get rid of mt76_sta_common_init utility routine and introduce
  mt7996_sta_state routine
- Link to v1: https://lore.kernel.org/r/20250220-mt7996-mlo-v1-0-34c4abb37158@kernel.org

---
Lorenzo Bianconi (9):
      wifi: mt76: mt7996: Add chage_vif_links stub
      wifi: mt76: mt7996: Introduce mt7996_sta_link container
      wifi: mt76: mt7996: Add mt7996_sta_link struct in mt7996_vif_link
      wifi: mt76: mt7996: Add vif_cfg_changed callback
      wifi: mt76: mt7996: Add link_info_changed callback
      wifi: mt76: mt7996: Add mt7996_sta_state routine
      wifi: mt76: mt7996: Rely on mt7996_sta_link in sta_add/sta_remove callbacks
      wifi: mt76: mt7996: Support MLO in mt7996_mac_sta_event()
      wifi: mt76: mt7996: Rely on mt7996_vif_link and mt7996_sta_link in mt7996_mac_twt_teardown_flow signature

Shayne Chen (4):
      wifi: mt76: mt7996: Add mt7996_mac_sta_change_links callback
      wifi: mt76: Check link_conf pointer in mt76_connac_mcu_sta_basic_tlv()
      wifi: mt76: mt7996: Update mt7996_mcu_add_sta to MLO support
      wifi: mt76: mt7996: Rely on mt7996_vif_link in mt7996_mcu_twt_agrt_update signature

 drivers/net/wireless/mediatek/mt76/mac80211.c      |   5 +-
 drivers/net/wireless/mediatek/mt76/mt76.h          |   2 +
 .../net/wireless/mediatek/mt76/mt76_connac_mcu.c   |   2 +-
 .../net/wireless/mediatek/mt76/mt7996/debugfs.c    |  12 +-
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c    | 125 +++--
 drivers/net/wireless/mediatek/mt76/mt7996/main.c   | 527 ++++++++++++++++-----
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c    | 335 +++++++------
 drivers/net/wireless/mediatek/mt76/mt7996/mmio.c   |   3 -
 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h |  36 +-
 9 files changed, 689 insertions(+), 358 deletions(-)
---
base-commit: 33584256a5f38ffb9e8829d08302a3021f2a8475
change-id: 20250220-mt7996-mlo-95e9fe30a9e0

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


