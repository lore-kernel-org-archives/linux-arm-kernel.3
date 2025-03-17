Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EBF2C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 14:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vW45Eevfr0UBpOE/gxMFRs6QWIzi9YcGFWpOxweiOQ0=; b=y37x9pvVaTOkP0u8w8E1tTpqPi
	AM80epouzHEmlDLm9P++VdSxHShes+mhUA2aWsqvs/Q98cdNUrSbD8uzXFd6PMZeqE5rifsmD1OPZ
	4p4uLV2kFgQS9T42neCB1sj8qQNbLqxd42pi0wjw9DZzgEwKXIxQ/9MnpXWaSJlVBFRyi/p/mrUu8
	IO81l9vYUqXzTc5dttDn0crj/bUJZ17T8bzsW6IG+Gfo30R6rcrp9cVZQCmH2a2Nd7zOuzx2GcZlF
	/8bdEQQ03JH+1Dekmsn1DwyybZtrJLb2fijrOCGeygLmbfzyK2HEmUWeQTYLmEzJM49qIym/2OaEh
	6d3Jh3vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuB8t-00000002rK0-38sE;
	Mon, 17 Mar 2025 14:08:35 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuAug-00000002oeD-1Yo1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 13:53:56 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 7735FA02E3;
	Mon, 17 Mar 2025 14:53:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=vW45Eevfr0UBpOE/gxMFRs6QWIzi9YcGFWpOxweiOQ0=; b=
	Tr2NgHJAnGKpz9P0iyFjnrROvAJyRjVeWKR9vlIQaJKhiPEFUrelC8+I9yzOoiGI
	3Ws2+hWl9K58e4Rg1v0W/PxXLJQ4NxVI6T7iP1ek+TTudAWc1c4pGnmt3ARadCOE
	v9chae1nxG56/rAMnKAGsDiVjgcChUT22/q0vPkH1Pms+zucbNJdmr8pYa8hskzN
	2ha3KNPcn4z8W5WRGrQ0Shg7hA+ZqtcsFCZNi6kEERIjwghckmKubPIe5qkzCONF
	R+ysD4VmglioFko0tF5aRtYqtnyUUC12lq4JON/M4Rvl6fx7+YwOlUSG3A7KsHm4
	x3x7RbXYAo7+BZ/uOB2u2CZPPwemSKGhvYmjBkrbCIOa2xqM9CmS90JcjRSl6Zab
	aEnPdts8ERakkAqylGyHE6NYrXquACPMd8I5KydCDh5GBFA6YfAIiUFiPdmnuRze
	aDnv1KPQFqtywWzrWbNT10/mzAfTwJemyb1+GEYLQi4avksOR/nJnoBdzfBDI3/h
	84qbOMe6Vn0sTV/vSTQcreA2Q1wEL9LtmDN2LfpQj0UtCiih5hSdk+99UTBYju/g
	QURzWniqfeGv3b5YfMgPbIVhymPQULQOhhvQjkkHmkdNEluZ2pLW40Dv76vcOXey
	lkCmzigsGLKv1JEhTln3bmMHKu9cSnYmX+OsfbWSErY=
From: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
To: 
CC: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>, Mark Brown
	<broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>, "Rafael J . Wysocki"
	<rafael@kernel.org>, Len Brown <len.brown@intel.com>, Pavel Machek
	<pavel@ucw.cz>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Nicolas
 Ferre" <nicolas.ferre@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Tudor Ambarus <tudor.ambarus@linaro.org>, Varshini Rajendran
	<varshini.rajendran@microchip.com>, Alexander Dahl <ada@thorsis.com>,
	<linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<dmaengine@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v4 0/2] Add `devm_dma_request_chan()` to simplify probe path in atmel-quadspi.c
Date: Mon, 17 Mar 2025 14:53:36 +0100
Message-ID: <20250317135340.382532-1-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1742219629;VERSION=7985;MC=71617524;ID=155895;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A29ACD948526D7460
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_065354_873493_1A17F13F 
X-CRM114-Status: UNSURE (   8.14  )
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
to their devm_ managed counterparts. Patch 1 adds the new
`devm_dma_request_chan()` function. Patch 2 then uses this APIs to
simplify the probe() function.

Change in v4:
* split PM imbalance fix [1] and DMA cleanup [this series]

This series is to be applied after the PM imbalance fix [1].

[1]
https://lore.kernel.org/linux-kernel/20250317093445.361821-1-csokas.bence@prolan.hu/

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

Bence Csókás (2):
  dma: Add devm_dma_request_chan()
  spi: atmel-quadspi: Use `devm_dma_request_chan()`

 drivers/dma/dmaengine.c     | 30 +++++++++++++++++++++++++
 drivers/spi/atmel-quadspi.c | 44 ++++++++++---------------------------
 include/linux/dmaengine.h   |  7 ++++++
 3 files changed, 48 insertions(+), 33 deletions(-)

-- 
2.48.1



