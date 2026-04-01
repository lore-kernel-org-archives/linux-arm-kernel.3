Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3771ED35162
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 10:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vE0nZ70+TvEitK1omkNigwlp7kb9dZrac89hYfLgeI4=; b=AjIvPix+bHeyEt
	dRky7a1X6dT5WMWrWtOTo2MhMqKJkzkcjRpfTy0+H5Wm2D2Hzp/G6AxvIrMsfPT2rMavybnJclUeQ
	9cCVcGtmtIFFq0ZGzCJseX2etSUGTOG5l1Zws4/KIYkDyxdsJyR4K0DCsDBTCDGmANcEwAr3E+UJ0
	ZVqbU2xi5lJlZZpvo/P4s/e58Ujb/OpkLtbXNIH1xdUFE6NAokV16h1RMOMjFPA05vtplf3Vx3AEp
	8rYN5AVir8YtOg03th++9tZyRFUNURar2WYZurysSRQGsADFZepfDmzOKrHxU/f3HzIPt0UcY8nXn
	9LzsYQikJkPiSOmDsf9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7tFz-0000000EZkx-0KBi;
	Wed, 01 Apr 2026 10:57:07 +0000
Received: from fsn-vps-1.bereza.email ([162.55.44.2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7tFu-0000000EZfr-2gl2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 10:57:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bereza.email; s=mail;
	t=1775041020; bh=nGbJMc1SpopSWDrpbU5L/1qQ3V8loe6NC9n1u7UtYqQ=;
	h=From:Subject:Date:To:Cc:From;
	b=CKWmFr4I7JiMChW8VHJ8G9FCq32dAXo4dBaKsG3gpsEqRn2pY8f2xnH8aOLKf10V0
	 wVjqP5Yc+dfdiYJHANjUVrIuJMI8iZgSzvq3jsA1KG7UviGk8Nnz4A8Pje3nFJMosP
	 aVsxkwCnecl5rCnDQSleGqlGhqUqRRR3h2lEZuxsp43dqa2iXimje3vBLmpr8X5kHp
	 1UZOeM7//4lVkoozqkj1GvAeAqODXd7cs0Zt7y2VDVoFK/BCwZoMwDqPYCudERZvHM
	 1MtF8W/5g82whwwJV5ENR+dO62x0eOSU2x0VEVa47RpLvJDBaDrovL+J+IxwxxjBKA
	 S8IOtroz5qoRA==
Received: from [127.0.1.1] (pd95bbad8.dip0.t-ipconnect.de [217.91.186.216])
	by fsn-vps-1.bereza.email (Postfix) with ESMTPSA id B95EC5DF94;
	Wed,  1 Apr 2026 12:56:59 +0200 (CEST)
From: Alex Bereza <alex@bereza.email>
Subject: [PATCH v3 0/2] Fix CPU stall in xilinx_dma_poll_timeout caused by
 passing delay_us=0
Date: Wed, 01 Apr 2026 12:56:31 +0200
Message-Id: <20260401-fix-atomic-poll-timeout-regression-v3-0-85508f0aedde@bereza.email>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OywrCMBREf0Wy9kqa9KGu/A9xkbQ39krbSBKDW
 vrvNooIrrocmDlnRubREXq2X43MYSRPdpiDXK9Y3arhjEDNnJngouRScjB0BxVsTzVcbddBoB7
 tLYDDs0Of5pCbHKVWRpqmYjPo6nBevSXH0yf7m75gHRI5NVrywbrH+0XMUu8rzJYIYwYZFLrSz
 a5EVSt+0OjwqTbYK+pYckbxo+Z8GVUAh3KrRFmgrCpu/qjTNL0AlEIB9D8BAAA=
X-Change-ID: 20260330-fix-atomic-poll-timeout-regression-4f4e3baf3fd7
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Michal Simek <michal.simek@amd.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 Tony Lindgren <tony@atomide.com>, 
 Kedareswara rao Appana <appana.durga.rao@xilinx.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Alex Bereza <alex@bereza.email>
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_035702_932303_DBA3F2AE 
X-CRM114-Status: UNSURE (   7.41  )
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

Signed-off-by: Alex Bereza <alex@bereza.email>
---
Changes in v3:
- patch 1/2:
  - Fix commit message: remove blank line between tags
- patch 2/2: nothing
- Link to v2: https://patch.msgid.link/20260401-fix-atomic-poll-timeout-regression-v2-0-68a265e3770f@bereza.email

Changes in v2:
- Fixed the Fixes: tags as suggested by Geert Uytterhoeven
  <geert+renesas@glider.be> - thanks!
- Split the renaming of XILINX_DMA_LOOP_COUNT into separate commit
- Link to v1: https://patch.msgid.link/20260331-fix-atomic-poll-timeout-regression-v1-1-5b7bd96eaca0@bereza.email

---
Alex Bereza (2):
      dmaengine: xilinx_dma: Fix CPU stall in xilinx_dma_poll_timeout
      dmaengine: xilinx_dma: Rename XILINX_DMA_LOOP_COUNT

 drivers/dma/xilinx/xilinx_dma.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)
---
base-commit: b7560798466a07d9c3fb011698e92c335ab28baf
change-id: 20260330-fix-atomic-poll-timeout-regression-4f4e3baf3fd7

Best regards,
--  
Alex Bereza <alex@bereza.email>


