Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 227BDCAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 15:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vWPSosL3l4DiR3rhKak9QT0ZD3yvZOjNbuLiamQDIXM=; b=A4V7dnVmKdyavH
	CHK0fhhZsYSIpg/AsCFreKtEwelHyvbqwRgAusV9MRL9HFxNIunSxGTTjQpcgb8elUduxPsii7j2O
	rYUbqMKin8EZ6+1L16YuDPlEJgw5iPYW06bHl5FFNRJX12PRmFsJ8loI16A0MDEi0+TcLG+Jfg+gC
	TAlb8wBgj9TaGEIhf4G0HWNLyy0dgkCLHNCb4Ed+9DWZMVYHzrHcMisdOxsLKVu8o3quIn+erDjpx
	5Eq4sXg8lOdFy6vbY0jQgs5on5Rl690QTsybdrfmamLmPauNo2IrGTONO2DVYb8+jo29zKsESBt1w
	R2jNhXF6rAHLPxpVJCuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1RVn-00000001Jog-3dOO;
	Wed, 24 Sep 2025 15:34:31 +0000
Received: from mail.simonwunderlich.de ([2a01:4f8:c17:e8c0::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1RVe-00000001Jcj-39vG;
	Wed, 24 Sep 2025 15:34:24 +0000
Received: from sven-desktop.home.narfation.org (p200300c597296Be00000000000000c00.dip0.t-ipconnect.de [IPv6:2003:c5:9729:6be0::c00])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.simonwunderlich.de (Postfix) with ESMTPSA id 5B413FA12C;
	Wed, 24 Sep 2025 17:34:16 +0200 (CEST)
From: "Sven Eckelmann (Plasma Cloud)" <se@simonwunderlich.de>
Subject: [PATCH 0/3] wifi: mt76: mt7915: Beamforming backoff limit table
Date: Wed, 24 Sep 2025 17:33:08 +0200
Message-Id: <20250924-backoff-table-support-v1-0-20e50fbc59de@simonwunderlich.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADQP1GgC/0XMTW7CMBCG4atEXnckjxPbmVylYuGfSWsVcLBDi
 hRxd9wiwfKd0ffsonJJXMXU7aLwlmrK5xb40Ynw7c5fDCm2FkoqLQkteBd+8jzD6vyRoV6XJZc
 ViBSOo+q1NVG07VJ4Trd/9/Pw7MKXa+PX5/GtT93LbhNY8i8XOKZTWivowNJ6ot6MOG34J3tXG
 UI+tf/U+d5ErQ1KhdqRNcpYJBtjIBxIqjDQYKWOVhzu9weSlabg6wAAAA==
X-Change-ID: 20250917-backoff-table-support-99218823576d
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org, 
 "Sven Eckelmann (Plasma Cloud)" <se@simonwunderlich.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3052; i=se@simonwunderlich.de;
 h=from:subject:message-id; bh=HPCdnJqlxl6M69qaxiFPhdy4hQEQTelm8MdgW3vvcig=;
 b=owGbwMvMwCXmy1+ufVnk62nG02pJDBlX+BNiF5SkX15/deLjyH3dPIxpucda0iwUp77/ePGjU
 nfMFCm3jlIWBjEuBlkxRZY9V/LPb2Z/K/952sejMHNYmUCGMHBxCsBEbnsx/FMOPMIWvknq/BLH
 eZP+ZtdmmwQWrbxqF7TsYMirqtmLEmYzMuw7+ztjo9HjOXMdCyMTvCyVv0tceXmk/feZTd8nMdY
 wTWQFAA==
X-Developer-Key: i=se@simonwunderlich.de; a=openpgp;
 fpr=522D7163831C73A635D12FE5EC371482956781AF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_083422_974736_15028A32 
X-CRM114-Status: GOOD (  13.34  )
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

It was noticed that Mediatek's MT7915 does not only require calibration of
the normal rates (configured via DT) but also some backoff values for
beamforming. The proprietary driver loads this from some file in the
firmware folder. But for the the upstream driver, it is necessary to get
them from the same place as the normal limits - in this case from the
devicetree.

They released the support for this [1,2] in their own SDK but
without any kind of documentation. And it was (to my knowledge) never
forwarded to upstream. But since also (in my case) OpenWrt needs correct
calibration for this WiFi chip, we should get this upstreamed.

I try to my best to provide some sensible information about the patch and
the DT entries. If anyone else has more information about it (to improve
the descriptions), please feel free to comment and provide some
enhanced/corrected version.

The patch from Shayne Chen was only rebased and modified to perform byte
reads from the DT [3]. Besides this, only a commit message was added,
MTK_DEBUG parts were dropped and some checkpatch problems were fixed.

Regards,
	Sven

[1] https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/+/f0d2527deb4f91592b6486a5c98ea3f584f76a61
[2] https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/+/737340322ab22b138fd200e020d61ffdbe3e36a9/autobuild/autobuild_5.4_mac80211_release/package/kernel/mt76/patches/1022-wifi-mt76-mt7915-add-bf-backoff-limit-table-support.patch
[3] https://lore.kernel.org/r/20250917-fix-power-limits-v1-1-616e859a9881@simonwunderlich.de

Signed-off-by: Sven Eckelmann (Plasma Cloud) <se@simonwunderlich.de>
---
Shayne Chen (1):
      wifi: mt76: mt7915: add bf backoff limit table support

Sven Eckelmann (Plasma Cloud) (2):
      dt-bindings: net: wireless: mt76: Document power-limits country property
      dt-bindings: net: wireless: mt76: introduce backoff limit properties

 .../bindings/net/wireless/mediatek,mt76.yaml       |  65 ++++++++
 drivers/net/wireless/mediatek/mt76/debugfs.c       |   4 +-
 drivers/net/wireless/mediatek/mt76/eeprom.c        |  38 ++++-
 drivers/net/wireless/mediatek/mt76/mt76.h          |   8 +
 .../net/wireless/mediatek/mt76/mt7915/debugfs.c    |  74 ++++++++-
 drivers/net/wireless/mediatek/mt76/mt7915/init.c   |   7 +
 drivers/net/wireless/mediatek/mt76/mt7915/main.c   |   2 +-
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c    | 182 ++++++++++++++++-----
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.h    |   6 +
 drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h |   9 +-
 .../net/wireless/mediatek/mt76/mt7915/testmode.c   |   2 +-
 11 files changed, 342 insertions(+), 55 deletions(-)
---
base-commit: b36d55610215a976267197ddc914902c494705d7
change-id: 20250917-backoff-table-support-99218823576d
prerequisite-change-id: 20250917-fix-power-limits-5ce07b993681:v1
prerequisite-patch-id: 964626eea847052cefc907ef0f01286a080fdc3c

Best regards,
-- 
Sven Eckelmann (Plasma Cloud) <se@simonwunderlich.de>


