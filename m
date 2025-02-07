Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D7F9C0219C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 12:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BCu/ryqDczot25TDMnKcJhaUWntHdW2uO8lsXLpQ4VQ=; b=duBDxGUUabeMMa
	EXc1Eieg38r6FzTSEWWymI9BmbiRSJf0wNOEtqvtcL0vDAqbFJcUfLEp5RsrBg16/w4B6Sn2Qg5W8
	sQL+2o0fVjt/B80jqr4ECpE+B4aiOjalX08f7KPE3rnugS45gZyCCfeDXW6y7WrBTrMnR3kNW3jHR
	oxf8+kry+2DglCBHXGs5U1bLN9AoYrvgetwBKa2y1KNlPpukAYnAuaBen6UOGAqCATOMOfFH+hsCv
	oaU7WFK50vg9xq+Z7xH9zhbDCLvgsNomFGs58ulZ5m5z/b2tHb0zCtWGMsXWQ2Y6piZxPivY2bWN8
	P43IXGa3pc6SrbXSLsYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgNna-00000009ZML-285p;
	Fri, 07 Feb 2025 12:49:34 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgNmB-00000009YtE-1ABu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 12:48:08 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 9D100A037B;
	Fri,  7 Feb 2025 13:48:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=BCu/ryqDczot25TDMnKcJhaUWntHdW2uO8lsXLpQ4VQ=; b=
	BytzGPT360C98IhBFxeTx3NOwsyn+LLjSv0HyYRHltnx/CHg6fMAUgNUP0g/vhjs
	HJxPAeodhFy0B9L8D+VPCYnu98rFe4cKHSX/pojtKyvogse4DqFFAbg51iZ2Jup5
	uIxAv+GAjZemdhK5q5MI/MPNV7WbWu1fyaoPYgvY6svrrFaBp0nRadftitN00V5D
	pzR5HEXN65zo1P+kvq0W5U7nf6H8KYekVzRcB8DAYKyDC0q9SdChzmib9RP2W9EF
	Hjq/LD2nIqLG5a4Q0+oThW6llaY4XNGwZvFLuVeonmW/LKGf3ztbwQF86bU1w2ED
	wmdGDqj9mMFWbvbAVzr77z75vqzYYAbFqPy9iAvdB+GCvSPsPU+wtvC6yGdtLwJI
	y8BkaR6EFSwIqjbZSUsmqlDSH9EIyqGuWDOp6+jRRvddW/TY0Z/ncsWqzfX0Ckry
	QSAQ7jIvcO96yTxLPoTddO2EAZcNQIKRvcCbUSYLvoKz/+2KphB+qP3TyvMh4fmT
	26DbUX/oORlbm50fgAzvDeZ3Yd7CIqen5uEGq3CfegZacs6yVTjjLMfVScpOAcus
	TE6BU59rVCQ1HTxjXJxUthHBY7RTKe92xlAAO6xfmM9Tqgb6iRBkXfljpFvsXwTM
	8axDWRciHBAbucV/68S2oTKfum+ucJ5A8Nd7pygzZYk=
From: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
To: 
Subject: [PATCH for-6.14 v3 0/4] Add more devm_ functions to simplify probe path in drivers/spi/atmel-quadspi.c
Date: Fri, 7 Feb 2025 13:47:55 +0100
Message-ID: <20250207124802.165408-1-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1738932485;VERSION=7985;MC=412144077;ID=401531;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A29ACD94852617560
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_044807_470088_F6DB4C8B 
X-CRM114-Status: UNSURE (   9.53  )
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
Cc: Len Brown <len.brown@intel.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, linux-kernel@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>, Alexander Dahl <ada@thorsis.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org, Pavel Machek <pavel@ucw.cz>, Varshini Rajendran <varshini.rajendran@microchip.com>, linux-spi@vger.kernel.org, =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The probe function of the atmel-quadspi driver got quite convoluted,
especially since the addition of SAMA7G5 support, that was forward-ported
from an older vendor kernel. To alleivate this - and similar problems in
the future - an effort was made to migrate as many functions as possible,
to their devm_ managed counterparts. The few functions, which did not yet
have a devm_ variant, are added in patch 1 and 2 of this series. Patch 3
and 4 then use these APIs to simplify and fix the probe() function.

Patch 4 in particular, fixes a bug present in 6.14-rc1, where the PM get()
and put() calls were imbalanced.

Links to previous versions:
pre-series:
https://lore.kernel.org/linux-kernel/20241222141427.819222-1-csokas.bence@prolan.hu/
https://lore.kernel.org/linux-kernel/20250114222851.1023194-1-csokas.bence@prolan.hu/
v1:
https://lore.kernel.org/linux-kernel/20250115160244.1102881-1-csokas.bence@prolan.hu/
v2:
https://lore.kernel.org/linux-kernel/20250124085221.766303-8-csokas.bence@prolan.hu/

Bence Csókás (4):
  dma: Add devm_dma_request_chan()
  pm: runtime: Add new devm functions
  spi: atmel-quadspi: Use `devm_dma_request_chan()`
  spi: atmel-quadspi: Fix unbalanced pm_runtime by using devm_ API

 drivers/base/power/runtime.c | 36 +++++++++++++++++++++
 drivers/dma/dmaengine.c      | 30 +++++++++++++++++
 drivers/spi/atmel-quadspi.c  | 62 ++++++++++--------------------------
 include/linux/dmaengine.h    |  7 ++++
 include/linux/pm_runtime.h   |  4 +++
 5 files changed, 93 insertions(+), 46 deletions(-)


base-commit: bb066fe812d6fb3a9d01c073d9f1e2fd5a63403b
-- 
2.48.1



