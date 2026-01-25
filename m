Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75158E63C9B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 10:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OCn5uMYPGGZkwfwxwxZLvNPFe3kVoY1QoRlPHQT1F3g=; b=ivV33FhnWZopYE
	17n6E/dj/cpbU01DZdXF4y4Y/7TeCw/NxOlFRe6di82qPPCdfup9SSjTVUVeP0qXPfPZuLB/9LwBQ
	GkIjhqR7SqCRDokNHCEBBRnuQv/PH7KaWJdIPpKCJ53N7Oq9Y2ts2LM1kgP/gZv/8UajMStjZVFaK
	gWD0raST7YUADxz+lAAafOciZqfUzuKfkc5Whde76hArLtjnTFQ/f7PBtiMR5Mj1XFcawaKapz8j7
	DP1/0L77m2i90aGbqL+Ij270Xf/QQMqneMkV43RfIjqhUFW+1U63cUNEXtGYKdrn32uBblhAVKCdH
	81gLApvOfHNfuGeI5Njw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjxix-0000000B5bs-2uDD;
	Sun, 25 Jan 2026 10:52:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjxiv-0000000B5bf-2w20;
	Sun, 25 Jan 2026 10:52:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7B2BC60018;
	Sun, 25 Jan 2026 10:52:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C7EBC4CEF1;
	Sun, 25 Jan 2026 10:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769338323;
	bh=oEMK/NQ1fqobKbWExDVcllQalgHRTxpeSvTj6dSXi0E=;
	h=From:Subject:Date:To:Cc:From;
	b=M916Q+2Wdfv5t0xYMwVvadX/WaHQkxh1wHamU8Fzeelqn7k860bFHT7TcAYEPW4xm
	 hufJ3lQbMOkT7SWwJnTUsTXbg/SoeNXRy5VtF+rxqH3qwlu2e70heg/fIS9Swfhdv3
	 Gwqh7bJtlpTDMDp9ESczJ/t1fzGIp3AJS3e8SWPlN5gVg8FoEkQtMcKxDiP8C8Rd1I
	 2q3nf3z9n8noOwsDiw/5vVm3EGzvVz+y1V0aPT8eiBFlY2Lv2w21YsIpx/xPgHgGc7
	 5UV8gY6XvE9Efn6hbpDbzOll12c5SP9wMYt4GxyiHBEq1SAT4YCvWLK3gNdIs3Jj6S
	 6IA3BEBDdE31A==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH wireless-next v2 0/2] wifi: mac80211: Introduce eMLSR/eMLMR
 parsing support in AP mode.
Date: Sun, 25 Jan 2026 11:51:29 +0100
Message-Id: <20260125-mac80211-emlsr-v2-0-466329d61c88@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/13Myw6CMBCF4Vchs7amHblUV76HYQFlCo1QzNQ0G
 tJ3t5K4cfmf5HwbBGJHAS7FBkzRBbf6HHgowEydH0m4ITegxFoqVGLpjJaolKBlDiyqpimlRmu
 1MZBPDybrXjt4a3NPLjxXfu9+VN/1R+E/FZWQwkoqT31fD+equ96JPc3HlUdoU0oflHglnq0AA
 AA=
X-Change-ID: 20260121-mac80211-emlsr-5774082ff8cc
To: Johannes Berg <johannes@sipsolutions.net>, 
 Ryder Lee <ryder.lee@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, Felix Fietkau <nbd@nbd.name>, 
 Shayne Chen <shayne.chen@mediatek.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 MeiChia Chiu <MeiChia.Chiu@mediatek.com>
X-Mailer: b4 0.14.2
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

Introduce support in AP mode for parsing of the Operating Mode Notification
frame sent by the client to enable/disable MLO eMLSR or eMLMR if supported
by both the AP and the client.
Add drv_set_eml_op_mode mac80211 callback in order to configure underlay
driver with eMLSR info (control and bitmap).
Implement drv_set_eml_op_mode callback for MT7996 driver.

---
Changes in v2:
- Improve sanity check against device EML capabilities
- Squash patch 1/2 and 2/2
- Validate link_bitmap with vif->active_links
- Introduce ieee80211_eml_params struct as containe for EML info to pass
  to the underlay driver.
- Pass padding_delay and transition_delay to the underlay driver.
- Implement drv_set_eml_op_mode callback for MT7996 driver.
- Link to v1: https://lore.kernel.org/r/20260122-mac80211-emlsr-v1-0-f0e43bb6d95a@kernel.org

---
Lorenzo Bianconi (1):
      wifi: mac80211: Add eMLSR/eMLMR action frame parsing support

MeiChia Chiu (1):
      wifi: mt76: mt7996: Add eMLSR support

 .../net/wireless/mediatek/mt76/mt76_connac_mcu.h   |   9 ++
 drivers/net/wireless/mediatek/mt76/mt7996/main.c   |  16 +++
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c    |  54 +++++++++
 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h |   5 +
 include/linux/ieee80211-eht.h                      |  28 +++++
 include/linux/ieee80211.h                          |   6 +
 include/net/mac80211.h                             |  23 ++++
 net/mac80211/driver-ops.h                          |  22 ++++
 net/mac80211/eht.c                                 | 135 +++++++++++++++++++++
 net/mac80211/ieee80211_i.h                         |   2 +
 net/mac80211/iface.c                               |  10 +-
 net/mac80211/rx.c                                  |   8 ++
 net/mac80211/trace.h                               |  32 +++++
 13 files changed, 349 insertions(+), 1 deletion(-)
---
base-commit: 1e1dd9eeaab3908746d1dce5db6b0c29e0d28d6d
change-id: 20260121-mac80211-emlsr-5774082ff8cc

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


