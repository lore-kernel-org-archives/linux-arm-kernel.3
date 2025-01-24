Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D01BC02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 08:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2pmYbnPeKyxt+7NbOVL6/kIIAp9oX3TCI0RQTsRH730=; b=knN7PSS0bxkLKd
	VfeP+lazrtNB9WTTzT2gwhQqZi4KY9i1pBF0D1N0Z8bkh2JbZ34XhNXKK5n+psW+qN08F9a1Hhhpj
	QZc3t3qrPMB6fV/FytrjTvmWrW3Xk6aUGDrPetjIHmbsocZX2+4XxqrYkL8Dr6LlMlITAlTewxRt+
	6ej/auZWQlKf7nlNbhJ0mYhtSVSJpqYhxdF1GoCgGRzyvhU7Eew0YTSa/v0pv9P0G1y4WSCywWBss
	Kb5XebXsA4//WnDe0iF3f2XtPGgcqhbq6DHzE8IPA7qI+qBu+oIjGecy0JQmmTd0dBvhA0DY1F93D
	U+Vgt6BFxYlwkER4eu/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbFVU-0000000EId6-1a5p;
	Fri, 24 Jan 2025 08:57:40 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbFU6-0000000EIOO-0S7p
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 08:56:15 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 77A16A09FF;
	Fri, 24 Jan 2025 09:56:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=2pmYbnPeKyxt+7NbOVL6/kIIAp9oX3TCI0RQTsRH730=; b=
	I2wpu0CYQR3CbV7x/T8QxbdvunrCx/t0jUpMRxMYpyId8G1pMhUNmdxEX83rMcNT
	pOmVn95QyZYXyo2TL12E5CBBTmuzCI4utQ6vYMyPvWinrw3cm/qcFJ8Dve7ncTbk
	tE3RBCH/UbX1PG0Dy+HrfOUpLWdDfHUj+mz6Rvy5CqovsI5+EstokJIeMPk4AxZB
	MC/706/lLvOIotm6HCExFUfSvsZNlv/u4uvP0LNcOHwUfwEHdAWLaFhl8FV80f1n
	f1tuG4uJFPua4e8ZNvIl8O/9z02dE2R9Ir6eX+fz0HhxSK2Jo/5ujwxPMfjZO54S
	HYPRFgp0O/+N0+fHM2cSTNtaNMRFZylvKBRnh9i9cQlcdHvu5WSlYMJfOzBYG5Uc
	QFtKtaIJiZQockkYKNCogeMiAwc1ZI4r8LmfJwbSQ/tXvq3jnkz5aqCoG+pVEHcD
	vy6Epopg1/SE3QTEQjCKbdAYEjviyliCGoB3oy7nK/hicCr0hm1eSCNhe3v4tn9r
	1NNyj6t6dE7cZsVVcqNuyZ3UyN5UFjEZp6EFI/F8cGokMbgiY7xtwERhz6XNxYei
	Lag+JNCYz2nlwDNx81wLR0zyqOCj3kgg6oS0JaTfWovgkmz4Z4Dg3EA1fTZcqSiO
	5iQsfTe3+NOx9o1oDeoFH28XFX7l02ShVkcUgTh9AU8=
From: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
To: 
Subject: [PATCH v2 0/4] Add more devm_ functions to simplify probe path in drivers/spi/atmel-quadspi.c
Date: Fri, 24 Jan 2025 09:52:16 +0100
Message-ID: <20250124085221.766303-4-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1737708961;VERSION=7984;MC=4288689662;ID=70488;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A29ACD94852677063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_005614_603540_3569A260 
X-CRM114-Status: UNSURE (   9.85  )
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
Cc: Len Brown <len.brown@intel.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Alexander Dahl <ada@thorsis.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org, Pavel Machek <pavel@ucw.cz>, Varshini Rajendran <varshini.rajendran@microchip.com>, linux-spi@vger.kernel.org, =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The probe function of the atmel-quadspi driver got quite convoluted,
especially since the addition of SAMA7G5 support, that was forward-ported
from an older vendor kernel. To alleivate this - and similar problems in
the future - an effort was made to migrate as many functions as possible,
to their devm_ managed counterparts. The few functions, which did not yet
have a devm_ variant, are added in patch 1 and 2 of this series. Patch 3
and 4 then use these APIs to simplify and fix the probe() function.

Change in v2: rebased onto Linus' master, which is:
commit bc8198dc7ebc ("Merge tag 'sched_ext-for-6.14' of
 git://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext")

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

-- 
2.48.1



