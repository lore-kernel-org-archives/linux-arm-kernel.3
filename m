Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44679CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 08:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HEGrORQHGXJFl2qWk65ziV2uRA5wa5u19+AJsOtUjD0=; b=rtPjHvcsD5ufCD
	eP8Y0n3WWh9o4lR7kjCLAeex4QwPDeZTMVwybq78ch8Rwt4PbkUksiuOxhZxu60CpSSEpzxbn6Tad
	RhI/2EJhSn6r9QeLK1YZz+O1h7Etj8ajTy3y0znnADwv0CHsSqx81lOGL6/a5gnfuBGpvqY9ax63B
	CMeFRtA+RkJS5r+SBrJijjgDwbWVuqUlCthCcZNYeHSh2rSIUa8XqrHMcuURCkIX+GX4G9bkI+cHh
	T5BUm45SulBsmD8O2Y2mM5/u5HC9Yv59ZeDdy7BIgLWVHUWsq7htQOkKEuabDA4Hcykq3I2+v8HXo
	XIWtTtvIUymqQjuaYqDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v62nI-00000001Up6-0G2O;
	Tue, 07 Oct 2025 08:11:36 +0000
Received: from mail.simonwunderlich.de ([23.88.38.48])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v62nF-00000001Unn-2ZJH;
	Tue, 07 Oct 2025 08:11:35 +0000
Received: from sven-desktop.home.narfation.org (p200300C597021Ae00000000000000c00.dip0.t-ipconnect.de [IPv6:2003:c5:9702:1ae0::c00])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.simonwunderlich.de (Postfix) with ESMTPSA id 458EEFA12C;
	Tue,  7 Oct 2025 10:11:31 +0200 (CEST)
From: "Sven Eckelmann (Plasma Cloud)" <se@simonwunderlich.de>
Subject: [PATCH mt76 v3 0/3] wifi: mt76: mt7915: Beamforming backoff limit
 table
Date: Tue, 07 Oct 2025 10:11:13 +0200
Message-Id: <20251007-backoff-table-support-v3-0-fd6e2684988f@simonwunderlich.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACHL5GgC/3WPwW7DIBBEf8XiXCrAZjE+9T+qHgysa9TYOICdV
 pH/vdSpoh6a4+xo3sxeScLoMZGuupKIm08+zEXUTxWxYz+/I/WuaCKYkExzRU1vP8Iw0NybE9K
 0LkuImWoteNuKWipwpGSXiIP/PLivZMoKyNvtGvG8lpL8a907uureUIJ0CReM9OQnnxOVFpkyW
 tfQ8m4TP3zTJ6Q2TMXvKlODkxI4E1z2WoEAxbVyzmreaCZsoxvFpFPHhtGnHOLX8fDGjxG3ZtE
 8+G3jlFHBULLBWKkdviQ/hfmyzg7jydvx2eGBLtP+4OARThQcB1crAdCAbf7F7fv+DbcBB26cA
 QAA
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
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3496; i=se@simonwunderlich.de;
 h=from:subject:message-id; bh=D7WzneyyiTFiOknwaG8a1/dFFbUemyH6aw259znERf8=;
 b=owGbwMvMwCXmy1+ufVnk62nG02pJDBlPTutsvfbt/LMYJ6meS+eFHhr8264x4/hiSz1mn/U3P
 O2fHjl2u6OUhUGMi0FWTJFlz5X885vZ38p/nvbxKMwcViaQIQxcnAIwER93Rob5Pb4Hck1/89r6
 cjwMbZz/Z3bOwssyz89Z1DlMjm4yNz7IyHDstRgPw/KN/TxbXQM9V5idfT+l0umLwq7Zkcr8jb/
 vSPEAAA==
X-Developer-Key: i=se@simonwunderlich.de; a=openpgp;
 fpr=522D7163831C73A635D12FE5EC371482956781AF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_011133_913000_78FF7DA9 
X-CRM114-Status: GOOD (  13.65  )
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
Changes in v3:
- Add pattern for country property, Thanks Rob Herring
- Add Robs' Reviewed-by to "introduce backoff limit properties" dt-schema patch
- Link to v2: https://lore.kernel.org/r/20250926-backoff-table-support-v2-0-16d3726646c4@simonwunderlich.de

Changes in v2:
- add [PATCH mt76] as requested by Zhi-Jun You
- Link to v1: https://lore.kernel.org/r/20250924-backoff-table-support-v1-0-20e50fbc59de@simonwunderlich.de

---
Shayne Chen (1):
      wifi: mt76: mt7915: add bf backoff limit table support

Sven Eckelmann (Plasma Cloud) (2):
      dt-bindings: net: wireless: mt76: Document power-limits country property
      dt-bindings: net: wireless: mt76: introduce backoff limit properties

 .../bindings/net/wireless/mediatek,mt76.yaml       |  66 ++++++++
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
 11 files changed, 343 insertions(+), 55 deletions(-)
---
base-commit: b36d55610215a976267197ddc914902c494705d7
change-id: 20250917-backoff-table-support-99218823576d
prerequisite-change-id: 20250917-fix-power-limits-5ce07b993681:v2
prerequisite-patch-id: 964626eea847052cefc907ef0f01286a080fdc3c

Best regards,
-- 
Sven Eckelmann (Plasma Cloud) <se@simonwunderlich.de>


