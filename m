Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9253D1D884
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 08:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4JLvtNHL3Yw4hCvnbdm4Zk9T+QmfqXkt4yQ8ML7QX/U=; b=Tc6Y5ucI4EBvuL
	o0tK2aB9zUTX+fujTHpf9Ps6XmEnrGxcnggCvs3iRt1TyDO6P/W9HZqrWC3nOZtcT0GUu8OvS/Peh
	C0sGwoVXyn830HKpP50rzESh12SiMRSKMQ79dDjj5UDC4NwmvnO9EnjOzTYq5ocup4hLkMTuLOzDW
	oN+xHnRT6hgdDQExmSqpTPOC8vlU8KhR6RaIfF/yMy+wWTikYcd3gt/dlwpDuRCcSMPiqqbKhJK4z
	64evwegt2AH4fmAnSS+sFLCuyFBmfJMYr2I0B3Ljlj5BVFy/Vfc519WoWhLPyYxZIV22R45hdBDfF
	ozMa1ch0ZVwpz4TMX1Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR4Qz-00000007eZy-0Mdt;
	Thu, 04 Dec 2025 08:11:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR4Qu-00000007eZZ-3jKT;
	Thu, 04 Dec 2025 08:11:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 08B6660192;
	Thu,  4 Dec 2025 08:11:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6433CC113D0;
	Thu,  4 Dec 2025 08:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764835883;
	bh=ih0PAVj5mYWpCZmavJUHnu6MojlzaYqb055Ta3igXto=;
	h=From:Subject:Date:To:Cc:From;
	b=fEbEnNW12WVkW5n7hYCQDv9S+uU6YHfC/p3BNvlvwbOHpmady7jHPmWkQEskD98jJ
	 gA1t+ogXrGVACAlkut3CyRQ89zmxgl9rrdFSmCIhzvvVw/CSeAzaOh9vxcZ4w0V89F
	 Sa19Vs1ZSy/YR0wgaXQjxik9FLxmdzGTSLxqTXQUgdyzvmyJRFUOgyb2p8QFmdKVGo
	 McUgwsJV49wPotFicS47tbKfF+VJTNLvYZmOiRXYkqHZOuFXMF37PqTCrerutN206N
	 tNTZ0ktST0bQTG6apfpx8ArPy7J2sxqWb1UPxxddBnTgWNJ5t+hBEXMeHtWTQ7PBBt
	 /cBgmBpKZVf7Q==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH mt76 00/11] mt76: mt7996: preliminary support for MT7996
 NPU offloading
Date: Thu, 04 Dec 2025 09:10:42 +0100
Message-Id: <20251204-mt76-npu-eagle-offload-v1-0-7819c52c0893@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MywqAIBAAfyX23IJJ2uNXooPUWguloRWB9O9Jl
 4E5zCSIFJgi9EWCQDdH9i5LVRYwrcYthDxnBymkqjJwPxuN7riQzLIRems3b2YUQnXW1FLXXQs
 5PgJZfv7xML7vBw7LOTxoAAAA
X-Change-ID: 20251202-mt76-npu-eagle-offload-0059fa426498
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Hui Ma <hui.ma@airoha.com>
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

Introduce preliminary support to enable NPU offloading in MT7996
(7990-Eagle) chipset.

---
Lorenzo Bianconi (11):
      wifi: mt76: mt7996: Fix NPU stop procedure
      wifi: mt76: npu: Add missing rx_token_size initialization
      wifi: mt76: always enable RRO queues for non-MT7992 chipset
      wifi: mt76: mt7996: Fix BAND2 tx queues initialization when NPU is enabled
      wifi: mt76: mt7996: Fix wdma_idx for MT7996 device if NPU is enabled
      wifi: mt76: mt7996: Add mt7992_npu_txrx_offload_init routine
      wifi: mt76: mt7996: Rename mt7996_npu_rxd_init() in mt7992_npu_rxd_init()
      wifi: mt76: mt7996: Add NPU support for MT7996 chipset
      wifi: mt76: mt7996: Integrate NPU in RRO session management
      wifi: mt76: mt7996: Integrate MT7996 init configuration for NPU
      wifi: mt76: mt7996: Integrate MT7996 dma configuration for NPU

 drivers/net/wireless/mediatek/mt76/dma.c           |   9 +-
 drivers/net/wireless/mediatek/mt76/mt76.h          |  10 +
 drivers/net/wireless/mediatek/mt76/mt7996/dma.c    | 132 ++++---
 drivers/net/wireless/mediatek/mt76/mt7996/init.c   |  47 ++-
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c    |   3 +-
 drivers/net/wireless/mediatek/mt76/mt7996/main.c   |   4 +
 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h |   2 +
 drivers/net/wireless/mediatek/mt76/mt7996/npu.c    | 394 +++++++++++++++++----
 drivers/net/wireless/mediatek/mt76/npu.c           |  31 ++
 9 files changed, 503 insertions(+), 129 deletions(-)
---
base-commit: 53d1548612670aa8b5d89745116cc33d9d172863
change-id: 20251202-mt76-npu-eagle-offload-0059fa426498

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


