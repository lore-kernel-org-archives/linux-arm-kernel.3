Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B306EC44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 10:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xTS4qZwy6+D9SfLbDLGhTfbdHwPKFvxPhsFNpRkNsW4=; b=vX+AfZLUHJmGc6
	e7RFziIT2UPbN5T9a+kt8yd0Zjrhms+1/8L72nKD8Hn/dFe3kCaBTpaliDNmXBUl0129TCLjL8X/4
	yXdQmE5uYh6RoYcP5qi28VD1dAt/wgfLU374r4HHuR8092l35LUkxiLg3w9j6HZSpo0LS1xt51DbY
	LAoMD2YzCtPkwYRhsFrjitLes4c8tO4guqCPe7XFnKeKIYSXl/8zR6lgtNXT7dDZK2kPsKwvwW6ko
	tbuFSuXL2rom4SKj728drL/W4JUfebR67e4KHDg1rr8S77Sv80LXa+Kw54Jl8yOZ1cmeWCiJZHwp8
	w4HOGESHL90tOtVFSikw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vis6k-00000006rMH-2lZg;
	Thu, 22 Jan 2026 10:40:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vis6h-00000006rLB-2t3J;
	Thu, 22 Jan 2026 10:40:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7D95640A81;
	Thu, 22 Jan 2026 10:40:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C4D2C19423;
	Thu, 22 Jan 2026 10:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769078405;
	bh=HPK1to5A18w33KTKAfPrc3VJLcOPN/LuGnXNtI40+kU=;
	h=From:Subject:Date:To:Cc:From;
	b=t2MTWGjt1rXCrXNfXVwVI/cq2BIa30GgCX/cBH7/dIx3MYP6pmGkFSjSFO6yDRz9U
	 3geMd6d9RZh7goUDZhjLkzeTdTnsPvesM05mW0mZequan8TG3uK9ZGNs5FbnCu/dRp
	 FY89jSf6lZAm4XlAgdLWPhf76kMYnkQSCO77NcI2CPaf1VNzjvF0ljt2ysJZww26++
	 dAmR98lIfCe32WZX3L5eZk4f2iOjIAq6lkApbnWYYk86NjVqhpebL66NYFSW5yqUwf
	 6dYtxoYexYsItOtYZ3d9EgAZQ7/TizJv273J+MlsknUyPbaKxCckWa0bSYcyfCPlmQ
	 pRYJ/T27EFDaw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH mt76 v2 00/17] wifi: mt76: mt7996: support for MT7996 NPU
 offloading
Date: Thu, 22 Jan 2026 11:39:44 +0100
Message-Id: <20260122-mt76-npu-eagle-offload-v2-0-2374614c0de6@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqEMAxA0atI1hOwQTriVYZZpDbVgLbSjiKId
 7fM8i3+v6BIVikwNBdkObRoihX0amCcOU6C6quBWrKtIcL197YYtx2Fp0UwhbAk9hic8a7rmc0
 oUOMtS9DzP/587/sB46HW12gAAAA=
X-Change-ID: 20260122-mt76-npu-eagle-offload-fb1db48aa1ce
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Kang Yang <kang.yang@airoha.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_024007_768495_81BC5848 
X-CRM114-Status: UNSURE (   7.97  )
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

Introduce support for NPU offloading in MT7996 (7990-Eagle) chipset.

---
Changes in v2:
- Rebase on top of mt76 tree
- Fix NPU reset procedure
- Link to v1: https://lore.kernel.org/linux-wireless/20251204-mt76-npu-eagle-offload-v1-0-7819c52c0893@kernel.org/

---
Lorenzo Bianconi (17):
      wifi: mt76: mt7996: Fix NPU stop procedure
      wifi: mt76: npu: Add missing rx_token_size initialization
      wifi: mt76: always enable RRO queues for non-MT7992 chipset
      wifi: mt76: mt7996: Fix BAND2 tx queues initialization when NPU is enabled
      wifi: mt76: mt7996: Fix wdma_idx for MT7996 device if NPU is enabled
      wifi: mt76: mt7996: Add mt7992_npu_txrx_offload_init routine
      wifi: mt76: mt7996: Rename mt7996_npu_rxd_init() in mt7992_npu_rxd_init()
      wifi: mt76: mt7996: Add NPU support for MT7990 chipset
      wifi: mt76: mt7996: Integrate NPU in RRO session management
      wifi: mt76: mt7996: Integrate MT7990 init configuration for NPU
      wifi: mt76: mt7996: Integrate MT7990 dma configuration for NPU
      wifi: mt76: mt7996: Add __mt7996_npu_hw_init routine
      wifi: mt76: mt7996: Move RRO dma start in a dedicated routine
      wifi: mt76: Do not reset idx for NPU tx queues during reset
      wifi: mt76: mt7996: Do not schedule RRO and TxFree queues during reset for NPU
      wifi: mt76: mt7996: Store DMA mapped buffer addresses in mt7996_npu_hw_init()
      wifi: mt76: Enable NPU support for MT7996 devices

 drivers/net/wireless/mediatek/mt76/dma.c           |  20 +-
 drivers/net/wireless/mediatek/mt76/dma.h           |   4 +-
 drivers/net/wireless/mediatek/mt76/mt76.h          |  20 +
 drivers/net/wireless/mediatek/mt76/mt7996/dma.c    | 204 +++++----
 drivers/net/wireless/mediatek/mt76/mt7996/init.c   |  49 ++-
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c    |  21 +-
 drivers/net/wireless/mediatek/mt76/mt7996/main.c   |   4 +
 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h |  13 +
 drivers/net/wireless/mediatek/mt76/mt7996/npu.c    | 457 +++++++++++++++++----
 drivers/net/wireless/mediatek/mt76/npu.c           |  37 +-
 10 files changed, 640 insertions(+), 189 deletions(-)
---
base-commit: 3bc60b741f6a2d51b6743fd0e5639beaffc39953
change-id: 20260122-mt76-npu-eagle-offload-fb1db48aa1ce

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


