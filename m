Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55816C02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 17:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CpHtADWgXcC5f/xSKBlH96Muxz2w2hu/GITHwyhpecU=; b=L3FdO3Czc2vTsB
	uI8dWB3boomnTXLdW0PrglFgxqq5kY2qutAGjaXHwfTA5sT7NeqoCEzDRPX1OlpbN0zH3X+E5Zgm6
	GLMeJA18PXJtVyb8Z0FITKIBXkUKP87WXQcRpnepR7BZ05N9mIUTjMck/r0r40bN9wunn4hWznQTs
	Rn+0qhPRkrzh5/KVAOEhVN+lw7WA00fNWZc414B7mvDsD2CmkpCo7d1UOC80jPGBdZAWc8jM5Sj4S
	F0H1pf+XYlPblr9hdfPdJTAd6SS85WtiFz+nSgaSRldyOzwZT0iPQlgOYaf/LliSDI0eat3IQMTwk
	OrgnvuRIcsjDKJZEm+og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYpkB-00000000tRD-3KmQ;
	Fri, 17 Jan 2025 17:02:51 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYpb5-00000000rVA-1xJg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 16:53:29 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 34E18A02FA;
	Fri, 17 Jan 2025 17:53:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=CpHtADWgXcC5f/xSKBlH
	96Muxz2w2hu/GITHwyhpecU=; b=a0MXx/10c4fcRGDH7klzyvH5+buqCcfLe/t7
	XwBcop+ncavEvEGjyxLOKREqf2UKfvJxbGXjgpbzWRiqCV+Mg6Di73z7zb9B/kDL
	DepvkhBBtF+yUoBXng7JVJoXQDf+TRKG9py7Y6NiyTWXHnnblQpnXAjzcFxjpBSr
	7gk+JCLwgIEChRrT17xIEcDM/xw6rvSo4yVPRfPfXm2IW4CIgCLK5rsFBTFYFISz
	/dmVHRAWra+9+tFPqaZ6CI6018hYG6F/k9sNE2v+b44oC42ewscbkh4GY6JkFt8/
	cFIrlEY5GvPTFYAmeCN6aoMhITF+L96U1q7Of+C3pEYiYSSclwkPlvTqNp26BeIl
	m5tX3VWhsAXsee/ZwYeS5BgICFv3udJjaH+5QcYQlpxvSLzfj0zMxILCBiy++nja
	sngfbMQKDI1RBFM32bFo1i+KjWSugWsTKmuWiDotepw0mar+Ms8BWGzPi5Qh/OVS
	WVsuPqc8D6R1h4tfR5r17+OqzQyzb2fVj+U/vE8ehBuuuDorzE1652O2LZHeAU0G
	GhsSq53IOrNXhWW5i8y50WxyymXqCksEpRNRHjzQEf2oKISBYCCqq07WNaev77gl
	n3/FZIM0nqhtpu2GcrnlNukRHqryy8o8XBjmM92pGesDycBUQfSx0kL+KzSKR8f/
	vSkZXpY=
From: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
To: <dmaengine@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-pm@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Tudor Ambarus
	<tudor.ambarus@linaro.org>, Mark Brown <broonie@kernel.org>, "Varshini
 Rajendran" <varshini.rajendran@microchip.com>,
	=?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
Subject: [PATCH 0/4] Add more devm_ functions to simplify probe path in drivers/spi/atmel-quadspi.c
Date: Fri, 17 Jan 2025 17:52:24 +0100
Message-ID: <20250117165224.1233255-2-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250115160244.1102881-1-csokas.bence@prolan.hu>
References: 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1737132793;VERSION=7983;MC=2736459822;ID=315655;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D9485264726B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_085327_965690_B4735EFE 
X-CRM114-Status: UNSURE (   8.64  )
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
Cc: Len Brown <len.brown@intel.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Alexander Dahl <ada@thorsis.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Vinod Koul <vkoul@kernel.org>, Pavel Machek <pavel@ucw.cz>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The probe function of the atmel-quadspi
driver got quite convoluted, especially
since the addition of SAMA7G5 support,
that was forward-ported from an older
vendor kernel. To alleivate this - and
similar problems in the future - an
effort was made to migrate as many
functions as possible, to their devm_
managed counterparts. The few functions,
which did not yet have a devm_ variant,
are added in patch 1 and 2 of this series.
Patch 3 and 4 then use these APIs to
simplify and fix the probe() function.

Bence Csókás (4):
      dma: Add devm_dma_request_chan()
      pm: runtime: Add new devm functions
      spi: atmel-quadspi: Use `devm_dma_request_chan()`
      spi: atmel-quadspi: Fix unbalanced pm_runtime by using devm_ API

 drivers/base/power/runtime.c | 36 ++++++++++++++++++++++++++++++++++++
 drivers/dma/dmaengine.c      | 30 ++++++++++++++++++++++++++++++
 drivers/spi/atmel-quadspi.c  | 62 ++++++++++++++++----------------------------------------------
 include/linux/dmaengine.h    |  7 +++++++
 include/linux/pm_runtime.h   |  4 ++++
 5 files changed, 93 insertions(+), 46 deletions(-)

-- 
2.48.1



