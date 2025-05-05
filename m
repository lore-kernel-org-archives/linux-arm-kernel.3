Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 282D0C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 18:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R/6cNWBETRGF/BzVYwj3W2JbTh79XOgcLvtKJ6KLVXg=; b=bxJOT2TIN8K1Wkvfz1ZDhxt8z3
	1h64RBPsJL+7h6qUY3dJmIa+NSuvUssUyedwGD0PCBAd5b/8O2zwkab4y4eaK95Gc1yYZ3XsNaICz
	/nrcom+18nrHy77ZiYy6Uc5u9toGVKnYBHahsnaEbKbrHYQzUpGQQXFCojTUBvSXjUTRzVquYtyLy
	IR6fAysbl+byhZvfyAa2NbTKjR23aQCySh1nSre4vRMnSEoTu9WlzFf2C/+Gwv9+u/nP3d6Loo1Mn
	FHAo/G6mUsMqDVITDIiEVON3mnLWJ27/1JEOJrxHu41QCR9LnRg3XaYNqsIlVsDMx/MaVrFKxh0QY
	BYDaZLVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC0wu-00000008LLb-0435;
	Mon, 05 May 2025 18:53:56 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC0sq-00000008Keg-2GGg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 18:49:46 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 8C8FFA075A;
	Mon,  5 May 2025 20:49:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=R/6cNWBETRGF/BzVYwj3W2JbTh79XOgcLvtKJ6KLVXg=; b=
	BObpQanzbwc2zx5Bu3udvjAbucVfX4D/BXajPDzK3MyuHoeKcV1xgftTvPwlcMRB
	MPndqU2RX12hVVuCKclMxGeYzm5kKS0c42zJ/SBUrkMGAvEwegqPeR6Q2QX5PRL/
	Z02zXsysnmiSuTQxkBlvVpWjK2/oOUf8vRteUH9cyF2F+4hqcA+aLc1/+dnYbVRm
	Sx2D6zaiitgFZyuGJ5uaQ65MyAXVK/NnPmS0FY9+TzB1UMqoeOPrttxAh2P6fvJB
	anFMv3xqWp87WgS2hD98LaEOpfh7t/BrqrE1rogd4qjgsY/WMRXPhryHLA3Cy8+F
	Qe9Wayzh1bLCqFDgaX0VTa0uUno1zZ/yhV0WJ6zrLMjqYgkyv19uI1W8v+fOPAmU
	5o/Ev1QDu5Rilik81hRxL6bBsWrlXU7mLNqIXNTXqB0EaawFTkXOT4kWzbANZ98W
	5TJ/jS0B4xHZKrwZG35fa+g8IExUYOuSZ7DFpKnZxbducb00D3HGUKMQ7q3FanKn
	+rONFBMoGRBERKlOt50zFn9g5/weDnon5z+mXUkBlHHPvWytXmqzJ+se4C38uowL
	75t9mQguYsVxtdSEgr+EGqdxjKWfEwqebXlcGpewkUiedyCQlHgLQ4C0f/YKDFjT
	KqeuZaPCZFgHujwRxQfaO2XRP/M2pwUFOymTbTYAKiM=
From: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
To: <dmaengine@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>, Vinod Koul
	<vkoul@kernel.org>, Mark Brown <broonie@kernel.org>, Nicolas Ferre
	<nicolas.ferre@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	"Rafael J . Wysocki" <rafael@kernel.org>, Tudor Ambarus
	<tudor.ambarus@linaro.org>
Subject: [PATCH v5 0/2] Add `devm_dma_request_chan()` to simplify probe path in atmel-quadspi.c
Date: Mon, 5 May 2025 20:49:32 +0200
Message-ID: <20250505184936.312274-1-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1746470978;VERSION=7990;MC=3789806188;ID=217951;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94853667166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_114945_038898_1C48F56C 
X-CRM114-Status: UNSURE (   6.54  )
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

The probe function of the atmel-quadspi driver got quite convoluted,
especially since the addition of SAMA7G5 support, that was forward-ported
from an older vendor kernel. To alleivate this - and similar problems in
the future - an effort was made to migrate as many functions as possible,
to their devm_ managed counterparts. Patch 1/2 adds the new
`devm_dma_request_chan()` function. Patch 2/2 then uses this APIs to
simplify the probe() function.

Change in v4:
* split PM imbalance fix [1] and DMA cleanup [this series]

Patch 2/2 is to be applied after the PM imbalance fix [1]. Patch 1/2 can
(and should) be applied immediately, to a for-6.16 branch.

[1]
https://lore.kernel.org/lkml/20250327195928.680771-2-csokas.bence@prolan.hu/

Links to previous versions:
pre-series:
https://lore.kernel.org/linux-kernel/20241222141427.819222-1-csokas.bence@prolan.hu/
https://lore.kernel.org/linux-kernel/20250114222851.1023194-1-csokas.bence@prolan.hu/
v1:
https://lore.kernel.org/linux-kernel/20250115160244.1102881-1-csokas.bence@prolan.hu/
v2:
https://lore.kernel.org/linux-kernel/20250124085221.766303-8-csokas.bence@prolan.hu/
v3:
https://lore.kernel.org/linux-kernel/20250207124802.165408-1-csokas.bence@prolan.hu/
v4:
https://lore.kernel.org/lkml/20250317135340.382532-1-csokas.bence@prolan.hu/

Bence Csókás (2):
  dma: Add devm_dma_request_chan()
  spi: atmel-quadspi: Use `devm_dma_request_chan()`

 drivers/dma/dmaengine.c     | 30 +++++++++++++++++++++++++
 drivers/spi/atmel-quadspi.c | 44 ++++++++++---------------------------
 include/linux/dmaengine.h   |  7 ++++++
 3 files changed, 48 insertions(+), 33 deletions(-)


base-commit: 70cb3b9a371fe9ff4f50cd7889763abd4ab621dc
base-tree: https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm
prerequisite-patch-id: e698614397eaaf4da550babe05eea26b7ebbfe39
-- 
2.49.0



