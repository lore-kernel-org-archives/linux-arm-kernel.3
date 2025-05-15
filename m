Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6959CC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 08:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=exUKHrABOcVDanDKzFLqgX6s1Ct1jDnN0Cf/z03HyVU=; b=r9tnpwJhh214uOfmDhHBf1qA9a
	g3F2DNSARBvrw5WRVPu76NNwS/i/BW8JyicsM7lELLyrhtICyIei6ZSaFltcmck0we2lnZuwDHnzg
	4aWC0DInzAZHbgR/85VJ8Qaay4+/dfIbXq14HK5iHFysN1uaDk9T79IDFQg4tu6wZmgKYHoYviWtM
	oUFcC2ypRJwjvLPSfQxCV1E4rGA7XUYvo5K/jvufPGm/aj8p1rBnC8H6cUxykjKGRiR3a9JOXcVza
	683GffcUJPCfwimOr1663HuCIrxxUiKkrK6FxMe0NfSLp3Qgqvig07Caq84LAjrymXBsAg0aG5eX8
	GL8BCj/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFUDM-0000000025Z-42vd;
	Thu, 15 May 2025 08:45:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFU0R-0000000HZHn-49Bl
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 15 May 2025 08:31:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=exUKHrABOcVDanDKzFLqgX6s1Ct1jDnN0Cf/z03HyVU=; b=CiNM8YYRYv3OqDcys8ymv/rJm8
	J6C+Ajt0NkS/BwXCgP80y217w1O19AV6P75rF5L25cr08SRGtNdrSxFjnUZzsvzkTSXlMaPHItJRL
	An9+71rKXlUD0cDPVhM5DUNuSZWkUsi3oX/6UFWDA5m8+q/WiLCNgwFtzeSj4CN/JbFZgakccwyPm
	IjkGxi0zDavwI5cITUJHfzbUJbdhvVQzqYBfAUFgBvpN8wF/6tqukJjedyWM3uy12Nt0wiUgp84/X
	/iKqMos6gFXsLjvO3WVKGK7VPQToKPoUYGtnFIB3+FrbKEhWx8vgEWHPDFji0zJdqDwa4MRjvdz+V
	vGoMZU5A==;
Received: from fw2.prolan.hu ([193.68.50.107])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uFU0N-0000000HO38-07ed
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 08:31:54 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id CC316A03AE;
	Thu, 15 May 2025 10:31:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=exUKHrABOcVDanDKzFLqgX6s1Ct1jDnN0Cf/z03HyVU=; b=
	O09nBLGsZL25o5Sdw9J7W0ZTbsXqYSxiZ1vduzlrtVKJdYj3YxyT6oP6n7LEY1ky
	PPRweJ2s1nPsudebivaroOmlMPDL3RrZO1KD/YU4mfilYRSNpIMhN2+OWCi/ZSSI
	JyYIz4pZaE/ebet0tsJEKKjtAtBRlGssiEEH9bvCE/87clbxlHLr8HmHGV9mzOdS
	Twznl8n5y7xqR20ogZn7n6gGEDOAobduJapuzjRFJe2dj1G234baibUUoVvjva1W
	o6ov/ydahEA9TG1yDHCfquwhCMHJgqj6+3ILRjtxuIymdsu+C0QtJ6ys5OmBbxnL
	Y5uOxAaPbcdlDoQbQq0Vzhs0MXIPPdlswc3O8uAmJe58R6+iyHWoITGUHs1IVXoI
	39tPA9TBQfNzZu4vK9fYJxd2PkvkGN3Zaz4DLpKY203JE/LxPTLKlHE5f2lRfU3c
	G0cqawzVtxsVJDhlKY+HLroby5KAJxBcjtCC7kMnxAIF5pMbLbOCksHf5sLwVm9I
	aV73unJFVdy7lc3+c1am/7oiICxtOzWd8cPI9wO6yXCvEWW+ZU2jnja4uOxZUIIB
	JED/gNTrqtF8Jp0uNIr6sUtp4VRo4V5b4NEjzrmfDw9gowFanxGaYTIGPIE2mIhl
	Y4e7x6rxCqQfMAjjNstKE52nA8tyGCMvQ2z1j9uAPtU=
From: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
To: <dmaengine@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>, Vinod Koul
	<vkoul@kernel.org>, Mark Brown <broonie@kernel.org>, Nicolas Ferre
	<nicolas.ferre@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	"Rafael J. Wysocki" <rafael@kernel.org>, Tudor Ambarus
	<tudor.ambarus@linaro.org>
Subject: [PATCH v6 0/2] Add `devm_dma_request_chan()` to simplify probe path in atmel-quadspi.c
Date: Thu, 15 May 2025 10:31:28 +0200
Message-ID: <20250515083132.255410-1-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1747297897;VERSION=7990;MC=2712727080;ID=2670053222;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A29BB64155D617062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_093151_307467_1F004E2C 
X-CRM114-Status: UNSURE (   7.70  )
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
* split PM imbalance fix (now merged) and DMA cleanup (this series)
Change in v6:
* rebase to spi/for-next, see note below:

There is currently no difference in drivers/dma/dmaengine.c between it and
dma/next [1], therefore PATCH 1/2 should be safe for Vinod to apply. But
this way PATCH 2/2 is trivial to apply. I didn't want to pull the whole
linux-next tree, but if any ofyou run into problems, let me know, and I'll
rebase the series on it instead.

[1]
commit 3c018bf5a0ee ("dmaengine: idxd: Remove unused pointer and macro")

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
v5:
https://lore.kernel.org/lkml/20250505184936.312274-1-csokas.bence@prolan.hu

Bence Csókás (2):
  dma: Add devm_dma_request_chan()
  spi: atmel-quadspi: Use `devm_dma_request_chan()`

 drivers/dma/dmaengine.c     | 30 +++++++++++++++++++++++
 drivers/spi/atmel-quadspi.c | 48 ++++++++++---------------------------
 include/linux/dmaengine.h   |  7 ++++++
 3 files changed, 50 insertions(+), 35 deletions(-)


base-commit: 6155cbfffd294bb267f053ec596ced41bcdb0986
-- 
2.43.0



