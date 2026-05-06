Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5849CCD342F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 01:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wR2Thhm3Jq6hlQLmRsOOuFA0pevOR+HEZ2FYTK0h4IE=; b=z6F2fE0CsIenf8
	/4GGLhEZJVNiuvi5LjJZDjJQ9HromXsStbdJ7bYVFCHsGUJv52eTq+PzSWp6H8PtzwWKSyN/crARk
	qG0H+2QyuIqcd4FyPM+zpOq3KrL64VYYzabJWYIwVN1vl3tdv9V1E7tA8WReUJk/iPYiSKZ2vJB7W
	Q4ocXMbnKOjVlK6L975FFKKHXsHwVPzp2PjaguK4jKE23WY3of/U83nGTdL9tufwYuPkee/wNc9KE
	/XZQcwI/FcoMEcjpNe6sHfavrUiD8Sh/Yty0Hrr34W96GkeeahHCDgb8fUP2kzjWnhcbfCGIWprX+
	11oSPBIo5E1qe0An0zKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKRF6-00000000QgQ-1SZ7;
	Wed, 06 May 2026 01:40:04 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKRF2-00000000QcM-2Xbc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 01:40:02 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-67389cf78b0so11589051a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 18:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778031598; x=1778636398; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wR2Thhm3Jq6hlQLmRsOOuFA0pevOR+HEZ2FYTK0h4IE=;
        b=ZIK9JH7aBTOdriABWT8WwfyGDDxcv4lb28g4cFoUDP+sIUaVjBI4br+c2lAcsMui2o
         7uqZ7qCKcFliUfC5DUha+TdcfrrOf7AzlYBAvIrrG7mWKNB79v9CPg+BFZGNC1eqNisJ
         TF3VAlTzKYJO8iCX1wnC7KrmAvDxE9SmI0dwni1hryLkhHNBMbpYEtWBsE6xfJoUgHq4
         4/KTU9hCtGmQXLTjT46U1tKzu5ERf2oMKNtexEWEVSD3oJPfH2rBUgQrI7vUqNJVIrtS
         dc1us60WFDJXkL9GIKU0tOirIMx5Dgz3xR7dx6nQiucLpFf+bXykSPfyGXG/bv7TFqZO
         I/BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778031598; x=1778636398;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wR2Thhm3Jq6hlQLmRsOOuFA0pevOR+HEZ2FYTK0h4IE=;
        b=rttHaYNkfHyo8oCfpUOLuTAixzD9/4vw9z7d48LBCn5b/RLJzFMUlPxHigPxmDTec+
         i0MRAsYzWQXX/pVi+ucCKaBSc30MPgLAiXjf+Rcv77G/EqRf1cnrQyRm5ODyNIXBac9k
         IuphQwIuKvtUiu6+BxagG76RrGxLWBa+pkvJl3gwXyCa3HbM/G3ysZHNklgEH+PRTBua
         f9wIKFhy5BIgTBTFzNeMJxevoxGFwGl/meU1W2nTJtdnLZpwW83kDFpYmkXV1QboJIUB
         rz1+RPfaNyGnCMG27se3Iay5Rf71tgiXbK9pF576NHi4GAeG6jFbKeyP3h8nApi3hxKi
         KCgQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Uy7oX+9tn15aBlMnnMxI9wsH9LGF4XgZl9ixxFOo5b7kt8WLeyMQZ7ZE+PcNics6FznoEVJREW9L5aaAUF595@lists.infradead.org
X-Gm-Message-State: AOJu0YwTpS5V5QdlNuOLuxZdUMzcZ6cIhEJ1p5kG/IsXdpglx8Z14m9e
	Jv3i3weqV3sxSj+MIYTDPBOssCfIND6a3pnOQIxH/7a72+0niBI9E5rRQ3HRA13l
X-Gm-Gg: AeBDietaKgRCFpInjL7rfYtPCwMeGfRQHZuscxHdspxiWL66HzXPAYGbYfRasBjaRHw
	Xpo92FkbViIoFngWkS5oTS8rqxZDNtMxLwi/9OxMeTG/9v8gUxb2ly3kf0S1PYyuqDBmoohW5E3
	CvDqnG095HjaTd+Lj3j7//LevbwmX5vHgC7iF+Oc8b87BP9FL/qspGuHYQWCJ5K1SR7Roc3tWe4
	z6Hdx5fN6NeDKCRaKW1MQDW53G+8uNmfYO0lAehhl3Z+1PlVSDxga6aQw+8+0cPLtnuDFz19bLX
	bDfknnAM3zP6hQZNU9p0iY9EJek86haGdLi71MsMBVgufHv8Z4vBKDLdueCDZy/uoyvSgycXD0e
	x3SxIud+3JLjGEMjIpG0oqsyleDXaiDf+N/P8gK2gD1x7T91y6oixzuQeaTnudwMaXvoRgPNd1f
	mUi8gSPlAZz2gMnXGY+OjNd7of/WsTmlKOp336Eqeu77BwKHXt6ica4bCvLDPAIF1MaCAAQPyyT
	JqJkK+6sxQlWH/YKgQ+frO2UHX+Bi0a5pYZOZYIB2qC
X-Received: by 2002:a05:6402:2420:b0:672:2995:be37 with SMTP id 4fb4d7f45d1cf-67d63a9e9f4mr429366a12.1.1778031597549;
        Tue, 05 May 2026 18:39:57 -0700 (PDT)
Received: from KURWA.angora-ide.ts.net (mm-195-107-126-178.vitebsk.dynamic.pppoe.byfly.by. [178.126.107.195])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67cd904fe68sm849388a12.0.2026.05.05.18.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 18:39:57 -0700 (PDT)
From: ElXreno <elxreno@gmail.com>
Subject: [PATCH v2 0/2] wifi: mt76: fix TDLS direct-link on MediaTek MT7925
Date: Wed, 06 May 2026 04:39:14 +0300
Message-Id: <20260506-mt7925-tdls-fixes-v2-0-46aa826ba8bb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMKb+mkC/yXM0Q6CMAyF4VchvbZJKSCZr2K4EFa1RtGsk5Ase
 3eGXn45+U8Ck6BicKoSBFnU9D0X8KGC6X6Zb4Lqi4GJj9RRg6/YO+4w+qfhVVcxrH3duL5lckR
 Quk+Q31Cy8/C3fceHTHE/gpw3hQekznUAAAA=
X-Change-ID: 20260503-mt7925-tdls-fixes-1d1397420900
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ming Yen Hsieh <mingyen.hsieh@mediatek.com>, 
 Deren Wu <deren.wu@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 ElXreno <elxreno@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4575; i=elxreno@gmail.com;
 h=from:subject:message-id; bh=XR+QR8Bfz1SKiot7jHliEJvocZwK2smxEIxpKgP5K6U=;
 b=owJ4nJvAy8zAJXa0WDmKX5v/EeNptSSGzF+z3/TIRVV/nXhHZNeznBKJjw5v36sYMax8sqzuw
 ra9l4WsZ8V0lLIwiHExyIopsvCc21ubs6xuyeR6rgyYOaxMIEMYuDgFYCJmPxn+KSXZZR+a2WN1
 7c2RjcIm4pVCSZstn+Zc/f764WkTRp1VSxgZHnfOVE15kHVT/eyfT3nnnr6+59bYFTq7d+/yasF
 Ig+f7GAHIeU2p
X-Developer-Key: i=elxreno@gmail.com; a=openpgp;
 fpr=0CCEBD7D6CA67EA4937F0A68C573235A0F2B0FE2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_184000_700606_2451D45F 
X-CRM114-Status: GOOD (  14.26  )
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

This series fixes two TDLS direct-link issues on the MediaTek mt76
driver, observed reproducibly with Samsung phones and other peers
that auto-initiate TDLS direct links on a shared BSS.

Patch 1 fixes silent loss of TDLS-peer data on mt76 chips with HW
TX encap offload. The HDR_TRANS TLV defaults to ToDS=1 for STATION
vifs, which makes the firmware build A1=BSSID for every WCID under
that vif -- including TDLS-peer WCIDs. Frames bound for a TDLS
peer therefore go on air to the AP, the AP silently discards them
per IEEE 802.11z, and no user data flows over the TDLS direct
link. v2 adds an MT_WCID_FLAG_TDLS_PEER flag (set in sta-add when
sta->tdls is true) and overrides the HDR_TRANS TLV to ToDS=0/
FromDS=0 (3-addr non-DS, per 802.11z) only for those peers. HW
encap stays on for AP and non-TDLS traffic. The override is
applied in three HDR_TRANS helpers:
  - mt76_connac_mcu_wtbl_hdr_trans_tlv() for mt7915/mt7921/mt7922
  - mt7925_mcu_sta_hdr_trans_tlv() for mt7925
  - mt7996_mcu_sta_hdr_trans_tlv() for mt7996
Verified on mt7925e + a Samsung phone over 5 GHz HE 80 MHz:
iperf3 -t 30 transferred 2.90 GBytes at 830 Mbit/s with 0 TCP
retransmits. The other chips are not regression-tested for lack
of hardware; their HDR_TRANS handling mirrors the verified
mt7925 change.

Patch 2 fixes a regression introduced by the MLO refactor in
commit 3878b4333602 ("wifi: mt76: mt7925: update
mt7925_mac_link_sta_[add, assoc, remove] for MLO"): the cleanup
loop in mt7925_mac_sta_remove_links() unconditionally calls
mt7925_mcu_add_bss_info(..., enable=false) for every link of the
station being removed, including TDLS peers on a STATION vif which
share the AP's bss_conf -- wiping the AP-side rate-control context
on every TDLS teardown and collapsing rx bitrate to 6 Mbit/s for
tens of seconds.

v2 design notes:

I tried adding the TDLS-aware firmware-facing peer setup that
v1's commit message identified as missing first -- defining
CONNECTION_TDLS = (STA_TYPE_STA | NETWORK_INFRA | BIT(3)) and
setting it in mt76_connac_mcu_sta_basic_tlv() for sta->tdls peers
hung the MCU on STA_REC_UPDATE within ~5 seconds of iperf3
traffic, requiring a chip reset. The proprietary out-of-tree
mt_wifi driver also defines CONNECTION_TDLS in mt_cmd.h but never
assigns it; TDLS there is implemented purely as an 802.11
action-frame state machine on top of CONNECTION_INFRA_STA, with
no TDLS-specific MCU command, and is gated to Connac1-era chips
only -- no firmware-facing TDLS peer setup to align to. The
HDR_TRANS ToDS override is the simplest per-peer correction that
works.

A note on the methodology behind the misroute observation: my
v1 captures used an RTL8821AU USB monitor which is single-stream
and cannot decode mt7925's 2-stream HE data frames. The
misroute-to-AP pattern only became visible after swapping to a
2x2 Intel AC 7265 in monitor mode on a separate host -- frames
go on air with A1=BSSID to the AP, the AP MAC-ACKs and discards
per 802.11z, which matches the iw counters (tx_packets++ but no
TCP ACKs returning).

v2:
  - patch 1 rewritten per Sean Wang's v1 NACK: per-TDLS-peer
    HDR_TRANS override instead of global SUPPORTS_TX_ENCAP_OFFLOAD
    removal in mt792x_init_wiphy(). Coverage extended to mt7915
    and mt7996.
  - patch 1 dropped Fixes: 5c14a5f944b9 and Cc: stable -- the new
    fix introduces a flag plus three helper overrides; not
    realistic for a clean cherry-pick into older stables.
  - patch 2 unchanged in logic; inline comment trimmed.

v1: https://lore.kernel.org/linux-wireless/20260503-mt7925-tdls-fixes-v1-0-dde847e21081@gmail.com/

Signed-off-by: ElXreno <elxreno@gmail.com>
---
ElXreno (2):
      wifi: mt76: route TDLS-peer frames as 3-addr non-DS in HW encap
      wifi: mt76: mt7925: don't disable AP BSS when removing TDLS peer

 drivers/net/wireless/mediatek/mt76/mt76.h            | 1 +
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 5 +++++
 drivers/net/wireless/mediatek/mt76/mt7915/main.c     | 3 +++
 drivers/net/wireless/mediatek/mt76/mt7921/main.c     | 3 +++
 drivers/net/wireless/mediatek/mt76/mt7925/main.c     | 6 ++++++
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c      | 5 +++++
 drivers/net/wireless/mediatek/mt76/mt7996/main.c     | 3 +++
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c      | 5 +++++
 8 files changed, 31 insertions(+)
---
base-commit: d2ffdadd4aca41d120e25f6a675dd6a4d77ce360
change-id: 20260503-mt7925-tdls-fixes-1d1397420900

Best regards,
--  
ElXreno <elxreno@gmail.com>


