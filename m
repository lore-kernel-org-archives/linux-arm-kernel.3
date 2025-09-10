Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 993E0CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 14:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IAYiLPbtono9otYjbMviyd5F+A/jNHATcLCRt1tFWxk=; b=UadEcV9eD+cc0l
	HYr9MnhAEGu1FtRbJ6/sUw7kECqJ6mKhru3WJdqEXrA9+zZAvK7Lnp4LEWMwGyLGXU9Eb9r2mmAk9
	mN2pmEdffKnLd3TBFGJR9pKcdJQCUAFtQhOLYvdR6ZHY3T6z+gtY62qZuY+cgcmx+Gpb5t5eu+c/n
	DEk7BAJ89HDnKhSSTF6BHAPkTW4azSQ5BzQSjYtjbeSOm7qF9iw/ULXdSbsmpK+RhmYQK2u6STRqh
	/LG3QnZPYmx4dX04DQVIBC4y8Wb3kKQHAgnfc9miZS5ixmdR3/b6YPXRMCUfVV+hoP8K9pYqEjjxI
	8l+eawydtuS5TiA3MX8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwLzm-0000000Emj9-1HiH;
	Wed, 10 Sep 2025 14:40:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwLzk-0000000EmiW-3osN;
	Wed, 10 Sep 2025 14:40:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 531F8601B2;
	Wed, 10 Sep 2025 14:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7385CC4CEEB;
	Wed, 10 Sep 2025 14:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757515224;
	bh=Jzop6ul/4tVOPaZkz1xDLoiVg5p9/77QHGE89X0WNWo=;
	h=From:Subject:Date:To:Cc:From;
	b=okT/Rb2UBU69uiaNuQHWXc/M8BuinSaIVgLUtxPzkxpGur72j5RA6r6WojWWQrfQS
	 S1vaE+cUnsYlznCe6cd45PwnXIujccRbOcJMfZj5ycfSb4Pw5/Rg/jyLuYZBuM6rA+
	 go8L7SyhiRE/d49xVDvIRBjyV9mlV+5Nwf0q+H3AuH59xpL8jsTmfzvTJsq94HbBKp
	 gOEqpf+prZSGgiHvqjl4AcQVaR/aAayCL2uQOP+xH83SI2k93nm95De7V0JYHLTor1
	 mcgDyT6Sp/oELaOkXSnth8opzfs4dGgPSymLaXB/M3uXByioXYoBRrDJ6Jf+lDHdUq
	 riX2q8uzZL+5g==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH mt76 0/5] wifi: mt76: Add NPU offload support to MT7996
 driver
Date: Wed, 10 Sep 2025 16:40:01 +0200
Message-Id: <20250910-mt76-npu-devel-v1-0-dbde4a37b9c0@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMGNwWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDS0MD3dwSczPdvIJS3ZTUstQc3cTEVAuTZPPktBRzYyWgpoKi1LTMCrC
 B0bG1tQAQKPi6YAAAAA==
X-Change-ID: 20250910-mt76-npu-devel-aae84c7cfd73
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
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

Introduce Airoha NPU support to MT7996 driver. NPU is used to enable
traffic forward offloading between the MT76 NIC and the Airoha ethernet one
available on the Airoha EN7581 SoC using Netfilter Flowtable APIs.

---
Lorenzo Bianconi (5):
      wifi: mt76: Move Q_READ/Q_WRITE definitions in dma.h
      wifi: mt76: Add mt76_dev pointer in mt76_queue struct.
      wifi: mt76: Add the capability to set TX token start ID
      wifi: mt76: Introduce the NPU generic layer
      wifi: mt76: mt7996: Add NPU offload support to MT7996 driver

 drivers/net/wireless/mediatek/mt76/Kconfig         |   4 +
 drivers/net/wireless/mediatek/mt76/Makefile        |   1 +
 drivers/net/wireless/mediatek/mt76/dma.c           |  73 ++-
 drivers/net/wireless/mediatek/mt76/dma.h           |  67 +++
 drivers/net/wireless/mediatek/mt76/mac80211.c      |   6 +-
 drivers/net/wireless/mediatek/mt76/mt76.h          | 137 ++++++
 drivers/net/wireless/mediatek/mt76/mt7996/Kconfig  |   7 +
 drivers/net/wireless/mediatek/mt76/mt7996/Makefile |   1 +
 drivers/net/wireless/mediatek/mt76/mt7996/dma.c    |  16 +-
 drivers/net/wireless/mediatek/mt76/mt7996/init.c   |  13 +-
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c    |   4 +
 drivers/net/wireless/mediatek/mt76/mt7996/main.c   |  26 +-
 drivers/net/wireless/mediatek/mt76/mt7996/mmio.c   |  13 +-
 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h |  21 +
 drivers/net/wireless/mediatek/mt76/mt7996/npu.c    | 352 +++++++++++++++
 drivers/net/wireless/mediatek/mt76/mt7996/pci.c    |   3 +
 drivers/net/wireless/mediatek/mt76/npu.c           | 494 +++++++++++++++++++++
 drivers/net/wireless/mediatek/mt76/tx.c            |   6 +-
 include/linux/soc/airoha/airoha_offload.h          |   1 +
 19 files changed, 1187 insertions(+), 58 deletions(-)
---
base-commit: 8620dfbed395fc72f968dfd07f1b50eba352bae6
change-id: 20250910-mt76-npu-devel-aae84c7cfd73

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


