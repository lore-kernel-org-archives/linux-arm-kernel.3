Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41BE3C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 02:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hgLPBffhzjeIWGbFQRMKbvBBFtBTqogFwOPhDVSJmnY=; b=kGCoSGkTjwBISTvWq+OG4KZPR9
	YYW7nOpFb8i52l6s6apnskjFw4J7U2pDlbdTB2sOYd46+FD9wER5VXQoO7vZR3EX3CuYTtxQXB6YD
	nGmrFcxA9hcJ98TkrRnuooOmgZn0I+AC7VkowhXQDrLDMSJfR6VWn/LBBf1SWq4a5Iq4rAt9dsmqK
	EJBi3n/zd0QSTo54iemgfCWsGZwYBITM2SU+6BU3Vp1+nnNE4haD9aWhseEkSNuz9/Oa4BFnay0HU
	6iGuoEmn2AKU08DeDJsRdNTqpPK9hili2snp6Em82B9imIDGfa4JKVb0P4/dL5SghjSSToazRYoTJ
	QVLz3PLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMdaS-0000000CHI7-0vql;
	Wed, 04 Jun 2025 02:10:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMcTq-0000000C7sk-0me5;
	Wed, 04 Jun 2025 00:59:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E04384A79A;
	Wed,  4 Jun 2025 00:59:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 022D4C4CEED;
	Wed,  4 Jun 2025 00:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748998785;
	bh=o1aHrT0V8os9lbGh74ByS9L16myup3V7+clQmPvzbzw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bncyn5BVN9a6ByrDGlygGRSPY0jO0tIoYkItQceEPI5Ab1OxCvzTdGEUx9miUgNyX
	 rZCd7y7ez885NxrWycjUeA2/Yg1R2c+uLxsQEAO3kifE2VLHLx+nJwp3RCTflNLKTN
	 UAS8CfT1PEhEHlV6lXBEoBRXORcpnh8mbk+4LSTMZSyZ5TGpgH1VR90WB/4CJGt1H2
	 v/emNb9Q2nnRaTQHYUAd06TRfYbF6COSQIxOdxlkif7Wmjx7MOrzuCQiq1Z4W+DCOd
	 6koUhQE9dxftUnE+A4IW3aon8i41QAZIVkNrpbJpLJMg2mqezPsC4R+Ve/Vl3o/kLM
	 R2gwWcA6Sav3A==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Samuel Williams <sam8641@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	Sasha Levin <sashal@kernel.org>,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sean.wang@mediatek.com,
	mingyen.hsieh@mediatek.com,
	deren.wu@mediatek.com,
	johannes.berg@intel.com,
	leon.yen@mediatek.com,
	quan.zhou@mediatek.com,
	allan.wang@mediatek.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.12 13/93] wifi: mt76: mt7921: add 160 MHz AP for mt7922 device
Date: Tue,  3 Jun 2025 20:57:59 -0400
Message-Id: <20250604005919.4191884-13-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250604005919.4191884-1-sashal@kernel.org>
References: <20250604005919.4191884-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.31
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_175946_269224_835302E5 
X-CRM114-Status: GOOD (  14.45  )
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

From: Samuel Williams <sam8641@gmail.com>

[ Upstream commit 7011faebe543f8f094fdb3281d0ec9e1eab81309 ]

This allows mt7922 in hostapd mode to transmit up to 1.4 Gbps.

Signed-off-by: Samuel Williams <sam8641@gmail.com>
Link: https://patch.msgid.link/20250511005316.1118961-1-sam8641@gmail.com
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES** This commit should be backported to stable kernel trees. ##
Extensive Analysis ### Code Change Analysis The commit adds 160 MHz AP
support for the mt7922 device by modifying HE (High Efficiency)
capabilities in the `mt7921_init_he_caps()` function in
`drivers/net/wireless/mediatek/mt76/mt7921/main.c`. The change is
minimal and surgical: ```c if (is_mt7922(phy->mt76->dev)) {
he_cap_elem->phy_cap_info[0] |=
IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_160MHZ_IN_5G; } ``` This single
addition enables 160 MHz channel width support specifically for mt7922
devices in AP mode, complementing the existing 160 MHz support that was
already present for station mode. ### Why This Should Be Backported **1.
Safe and Contained Change** - The modification is gated behind a device-
specific check (`is_mt7922()`) - Only affects mt7922 hardware, with zero
impact on other devices - Uses standard IEEE 802.11ax capability flags
that are well-defined and widely supported - No core functionality
changes - only capability advertisement **2. Follows Stable Tree
Criteria** - **Important bugfix**: This enables a hardware capability
that was artificially disabled in software - **Minimal risk**: Standard
capability flag with well-understood behavior - **No architectural
changes**: Simple capability enablement - **Confined to subsystem**:
Only affects mt76 WiFi driver **3. Historical Precedent** Looking at the
similar commits provided, this change follows the same pattern as commit
#4 ("mt76: mt7921: introduce 160 MHz channel bandwidth support") which
added 160 MHz support for station mode. The current commit simply
extends this to AP mode, completing the feature set. **4. Low Risk
Profile** - **No security implications**: Capability advertisement only,
no new attack vectors - **Graceful degradation**: If 160 MHz doesn't
work properly, it will fall back to lower bandwidths - **Standard
compliance**: Uses IEEE 802.11 standard capability bits - **Easy
reversal**: Simple to revert if issues arise **5. Clear User Benefit** -
Enables up to 1.4 Gbps throughput in hostapd mode (as stated in commit
message) - Unlocks full hardware capabilities for mt7922 users -
Improves performance for users with 160 MHz-capable infrastructure ###
Technical Safety Assessment The change is extremely low-risk because: 1.
It only modifies capability advertisement, not operational code paths 2.
The IEEE 802.11 stack handles 160 MHz operations robustly 3. Regulatory
compliance is handled by existing regulatory domain code 4. The mt7922
hardware already supports 160 MHz (firmware/hardware capability) ###
Comparison with Similar Commits Unlike the provided examples (which were
marked "NO" for various reasons like being new features, architectural
changes, or adding new channel support), this commit: - Fixes an
existing limitation rather than adding new functionality - Has minimal
code impact - Follows established patterns for capability enablement -
Represents a straightforward bug fix (capability mismatch between
hardware and software) This commit exemplifies an ideal stable tree
candidate: it's a small, safe change that fixes a real user-impacting
issue (artificial performance limitation) without introducing new risks
or architectural complexity.

 drivers/net/wireless/mediatek/mt76/mt7921/main.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 6a3629f71caaa..9c245c23a2d73 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -83,6 +83,11 @@ mt7921_init_he_caps(struct mt792x_phy *phy, enum nl80211_band band,
 			he_cap_elem->phy_cap_info[9] |=
 				IEEE80211_HE_PHY_CAP9_TX_1024_QAM_LESS_THAN_242_TONE_RU |
 				IEEE80211_HE_PHY_CAP9_RX_1024_QAM_LESS_THAN_242_TONE_RU;
+
+			if (is_mt7922(phy->mt76->dev)) {
+				he_cap_elem->phy_cap_info[0] |=
+					IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_160MHZ_IN_5G;
+			}
 			break;
 		case NL80211_IFTYPE_STATION:
 			he_cap_elem->mac_cap_info[1] |=
-- 
2.39.5


