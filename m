Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53464CAC5AA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 11:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5cCSC9rKfBN7NsnVJ+bJTLTBAgS76WdOQVLEAxH/L7w=; b=J9tQFvSckWiWRMkKdQihmijhFk
	Jm7zqZM9uuqLIkx8zjlnCC1PQ8g7XvnRSjIWwGiPU7KJ17L+V7LZ6bzdXAA39HT0y6MNBLGOh0t8l
	yzM7c1M1KGK0YKHtbXzKe7fYUinHGxDzBtfjQnvncK1hqznnze6VFODiOY9FrIE4fbMi7ghoiq9En
	tCi8Wvajk/lRAm/prLNvJBLSX1IsG9Q5ZYHJC1A6gy9cZnib50gKkDif9G6xleB8iF4hVjDMxCQPc
	xDBi23S7j4d9jOzQwFRQ3VnQgKpspiROAeOddomF3FUDwKvsH20jMPw0LViS6ubBQsNQd8UwgUiYR
	8NDk57nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Hrh-00000007LVZ-1il0;
	Sun, 21 Sep 2025 11:04:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0HrX-00000007LPw-2tx3;
	Sun, 21 Sep 2025 11:04:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5F25960054;
	Sun, 21 Sep 2025 11:04:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0582CC4CEE7;
	Sun, 21 Sep 2025 11:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758452649;
	bh=zfFGum9b0/BleKUZeCTKfLnLOBtKdYp2e9/Jc3IpdTQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=cBxtlNSj9/iDkZtPyO7LpMwcoOHRtvNZukkGVFWUw8U6mbcpDlZdkfbTZN4i/dLjJ
	 YTyfYBx3JVvVcEE++n0oQUF++0ud6sWCGcLcyNRNHwirmjZh9+r0MME6UbUcurJkb/
	 E7TxEkisbqgyQqO9ihC4I+4Cqm9gUwyDCVy3rhi6ECkKkADqk6yBElPXS0WWfUlD+5
	 xJ2TsON32V9qPpWMkZSUSCd2KY8qXKAkFktcp4lENj5MIqu2uHtG42MW1pHYX2tSvR
	 s9xvvRKM2GHP6to/lXX676O54bmyhRivhTcQhfo/OqiDb13yN+N4xg8lFl8StwjTY6
	 wVS00FwxsB7oA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5498CAC59A;
	Sun, 21 Sep 2025 11:04:08 +0000 (UTC)
From: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
Subject: [PATCH 0/3] Rewrite MediaTek UART APDMA driver to support more
 than 33 bits
Date: Sun, 21 Sep 2025 14:03:39 +0300
Message-Id: <20250921-uart-apdma-v1-0-107543c7102c@proton.me>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIvbz2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDSyND3dLEohLdxIKU3ERdy8RUc7NUE6M0I0NjJaCGgqLUtMwKsGHRsbW
 1ABs0505cAAAA
X-Change-ID: 20250921-uart-apdma-9ae76e42f213
To: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Long Cheng <long.cheng@mediatek.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Max Shevchenko <wctrl@proton.me>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758452646; l=1014;
 i=wctrl@proton.me; s=20250603; h=from:subject:message-id;
 bh=zfFGum9b0/BleKUZeCTKfLnLOBtKdYp2e9/Jc3IpdTQ=;
 b=Quibm1DVcGl0mSoso1wZuKD1LG4vQ1WaKLN47ZGF1Ghf4HYVz2LEe84dbtvy0i9yXo49BuSCK
 r48rMZ4pJgKAXvMo/b1LwQAGKfFUn70yV3rHmeoxZI6PX4WuBaNbKmU
X-Developer-Key: i=wctrl@proton.me; a=ed25519;
 pk=JXUx3mL/OrnRvbK57HXgugBjEBKq4QgDKJqp7BALm74=
X-Endpoint-Received: by B4 Relay for wctrl@proton.me/20250603 with
 auth_id=421
X-Original-From: Max Shevchenko <wctrl@proton.me>
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
Reply-To: wctrl@proton.me
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This patch series aims to support more than 33 bits for the MediaTek
APDMA driver, since newer SoCs like MT6795, MT6779 or MT6985 have higher
values for the DMA bitmask.

The reference SoCs for bitmask values were taken from the downstream
kernel (6.6) for the MT6991 SoC. 

Signed-off-by: Max Shevchenko <wctrl@proton.me>
---
Max Shevchenko (3):
      dt-bindings: dma: mediatek,uart-dma: drop mediatek,dma-33bits property
      dmaengine: mediatek: mtk-uart-apdma: support more than 33 bits for DMA bitmask
      arm64: dts: mediatek: mt6795: drop mediatek,dma-33bits property

 .../devicetree/bindings/dma/mediatek,uart-dma.yaml | 11 ++---
 arch/arm64/boot/dts/mediatek/mt6795.dtsi           |  4 +-
 drivers/dma/mediatek/mtk-uart-apdma.c              | 47 ++++++++++++++++------
 3 files changed, 39 insertions(+), 23 deletions(-)
---
base-commit: f83ec76bf285bea5727f478a68b894f5543ca76e
change-id: 20250921-uart-apdma-9ae76e42f213

Best regards,
-- 
Max Shevchenko <wctrl@proton.me>



