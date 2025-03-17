Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0AF8C35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 09:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p9rtY7T/5FbeYUgyuooDTwafPSFIqhxRRsMfKKK+iYw=; b=TLN5pMxQcJD/ZphYPo6VhbCXzI
	3uRFGau0uKXomUHh1bel1aDrntrf5aFlkVUOtd8pB+2e8BfVhc0Piz2tH8Sm5lQWHLnA/zi3duu2r
	FwMTl5NNtWwHVZlg3IFj0WcOIs1gPvywRpH2ykx6qVSL2DT0bw5f9j6Vc3x8g8JLMDX5BJlXugOlL
	6M8iIYYxzFhKI0RC3JqdfENRfgLm2bqy2lRTWZoU3t1S681XzRQepSP+cs9YKGEqzxoKQHyCQjlym
	hmBM5Owbk5j7A1I7Ymadp3f4k5kShfIBznwrzNae2+xu/zoqBCFH6uqsaipg2ok8CfBzZg+giXiqp
	ToRoWBoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu6wk-00000001yBA-2HIL;
	Mon, 17 Mar 2025 09:39:46 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu6sE-00000001wsh-2yHC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 09:35:08 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id BAC59A00A7;
	Mon, 17 Mar 2025 10:34:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=p9rtY7T/5FbeYUgyuooDTwafPSFIqhxRRsMfKKK+iYw=; b=
	bw9ir2Fgh04fFvfDrRsG7V1d95pF74h6qNEDoYJvvUhIVj99j7eWFaAUiNQTYUn2
	TSeUCYPG1V318DVjhhCs2vzT70EUn01MRMkb0LSMZ5qfI56gO0HVSaRHSEA1N/2p
	kC40GHgH1kfHEWAzeU0UcrBlDfHfHrpdvf/NciXIJ3U1YCbpvV6qkwL+nh1c6D+C
	tV1DmVcQiWRdszrRdWOLUW/ZVZciRK0CiRfADjPQgmUNaPfVQhfKA3oC1DvslC2N
	5oLC+lnuU0Kli/L5j8C4V0/hUvv1yaLE+owB47EFQuovJbnxF9wDGJG4S2MSMotI
	6psW0h7uHQPrzLmDCfv7nVnYRzHdKGEDxudEbGbGFSpRmzgCbNMJt192TWPktU3S
	Svcof1dY24eRp2ayWY4VmwBb/Fe9V0LV0Nn4csKdbYWdnzcTCHf9NnW50AR/VEBw
	it+jogzWEeBaHPC4ux0t9JPcKe5LAJEQJexPPSxTwMKdQt8eYV9RdXWmzYoVA349
	FJyru63cqowMr0lkGOXGMbo4hQ6aBtgJxq8xfu04VGO4KI4/LbeFI8ea51nMl0/h
	ByXFj4X+6vKRbpayaGspew6NrkV54xQkpyfLvjRH+382PteCnpeGIjbWTF7KmxR8
	umeoVeC8rLQq1tfWnCNztLlWtAnhP/gwEakE0XbPdQg=
From: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
To: <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	=?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>, "Varshini
 Rajendran" <varshini.rajendran@microchip.com>, Tudor Ambarus
	<tudor.ambarus@linaro.org>, Mark Brown <broonie@kernel.org>,
	<linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <len.brown@intel.com>,
	Pavel Machek <pavel@ucw.cz>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>, Alexander Dahl <ada@thorsis.com>,
	"Nicolas Ferre" <nicolas.ferre@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [PATCH v5 0/2] Add more devm_ functions to fix PM imbalance in spi/atmel-quadspi.c
Date: Mon, 17 Mar 2025 10:34:41 +0100
Message-ID: <20250317093445.361821-1-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1742204094;VERSION=7986;MC=881707077;ID=162298;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D948526D7462
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_023507_217868_F00860AD 
X-CRM114-Status: UNSURE (   9.10  )
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

The probe() function of the atmel-quadspi driver got quite convoluted,
especially since the addition of SAMA7G5 support, that was forward-ported
from an older vendor kernel. During the port, a bug was introduced, where
the PM get() and put() calls were imbalanced. To alleivate this - and
similar problems in the future - an effort was made to migrate as many
functions as possible, to their devm_ managed counterparts. The few
functions, which did not yet have a devm_ variant, are added in patch 1 of
this series. Patch 2 then uses these APIs to fix the probe() function.

Change in v4:
* the DMA cleanup was split out and will be submitted separately for 6.15

Change in v5:
* rebased to linux-pm/linux-next, will now target 6.15

Links to previous versions:
pre-series:
https://lore.kernel.org/linux-kernel/20250114222851.1023194-1-csokas.bence@prolan.hu/
v1:
https://lore.kernel.org/linux-kernel/20250115160244.1102881-1-csokas.bence@prolan.hu/
v2:
https://lore.kernel.org/linux-kernel/20250124085221.766303-8-csokas.bence@prolan.hu/
v3:
https://lore.kernel.org/linux-kernel/20250207124802.165408-1-csokas.bence@prolan.hu/
v4:
https://lore.kernel.org/linux-kernel/20250210111008.248929-1-csokas.bence@prolan.hu/

Bence Csókás (2):
  pm: runtime: Add new devm functions
  spi: atmel-quadspi: Fix unbalanced pm_runtime by using devm_ API

 drivers/base/power/runtime.c | 36 ++++++++++++++++++++++++++++++++++++
 drivers/spi/atmel-quadspi.c  | 18 +++++-------------
 include/linux/pm_runtime.h   |  4 ++++
 3 files changed, 45 insertions(+), 13 deletions(-)

-- 
2.48.1



