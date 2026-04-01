Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D12EED35166
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 09:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6Ld+y+XLbpuiWprTiTwpXmhz3lb+Q8MVviYej/iAuqE=; b=dFb1BSgzHKIqPk
	Pb45hANT6SczU1lJqFdzrHXNGtZjf7mNdz0cY2wgS7aqQDilayRiovhiM6gKqpdaloIomIgwK/Wvl
	iE+E4Y8S7e275tB3wypUS3KbniWP8b/Mqp1U7lETkwQ1dGZadBe2wGCMkmIGkSXllHvvSVouWaObp
	7Ggt1Cx1ftDwOD3ZqTz+tC4Tz843peBzk8JpflkzjnYBepyDGb0zRaheHzS8FEuMRo4uX3E2vItTI
	EeP/M5MQR3QYdfcQu8eD2V805g/x0KmRuV5qHdU/a1s/9+M2YRdeFiZEYMK2M0wkhlmdc7rXImtD5
	aHjftYA7bdMYLAoK5yxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7sL6-0000000ESva-0N70;
	Wed, 01 Apr 2026 09:58:20 +0000
Received: from fsn-vps-1.bereza.email ([162.55.44.2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7sL2-0000000ESuC-418M
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 09:58:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bereza.email; s=mail;
	t=1775037494; bh=e7ROf8amYwTkT3CIywtA4AlkVDHaTkBNyidI2+epKIo=;
	h=From:Subject:Date:To:Cc:From;
	b=Ttsr53R2YagO3NF5Pu2ZltojRkZ6chm9IP4tDKZ9+ZD8vjhFEqgAolid+Tmhszea6
	 AvnyJtYjR7wSVRTc7bU+s4Dkk+L91/izQaiNYGTwUyhemlS8cIOgdIp74JwezBaSpO
	 3IizqFCbXERM5tXfpYxYFqWejadDloWDBj1aoWd/ChEGJbe7BMFps9rpdYpxPYLTWT
	 LhjYCVY81qr09gWAKK5nR+WAkCFh19Dnm993VHIpuH6UUF4iEsw2nZDlcGby0DzRgN
	 Vu7wiN4V/bIs/GHu/wDLaD4Cqffpu5mxk0P/Trf3LxsP6u6pc1PqFxEiflEgFiHMIY
	 RLhYlP7XCeh3w==
Received: from [127.0.1.1] (pd95bbad8.dip0.t-ipconnect.de [217.91.186.216])
	by fsn-vps-1.bereza.email (Postfix) with ESMTPSA id D04235DF94;
	Wed,  1 Apr 2026 11:58:13 +0200 (CEST)
From: Alex Bereza <alex@bereza.email>
Subject: [PATCH v2 0/2] Fix CPU stall in xilinx_dma_poll_timeout caused by
 passing delay_us=0
Date: Wed, 01 Apr 2026 11:57:46 +0200
Message-Id: <20260401-fix-atomic-poll-timeout-regression-v2-0-68a265e3770f@bereza.email>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OQQ6CMBREr0K69ptCEaIr72FYtOUXvgFL2kJUw
 t1tMe5dvmRm3qzMoyP07JKtzOFCnuwjQnHImO7lo0OgNjIreFFxITgYeoIMdiQNkx0GCDSinQM
 47Bz6VIfSlCiUNMK0NYtDk8PY2iW35st+VnfUIS2nRE8+WPfaXyx5yv2E+T/CJYccTqpW7blCq
 SW/KnT4lkccJQ2s2bbtA+f1KkHpAAAA
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
X-CRM114-CacheID: sfid-20260401_025817_220318_39FA2605 
X-CRM114-Status: UNSURE (   7.00  )
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


