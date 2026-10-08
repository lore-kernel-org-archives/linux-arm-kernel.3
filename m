Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07BC2CA600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 14:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uftchWlRuyh4XJs7DtMm5u71NGPGal5HIbmR+/mD5mk=; b=0PJIAqsuVVF0hjLz1Qi0nFXg6c
	Zjuu5eFRF5DicFMW//ayXCSf4ITwENbX336jiaTeHR4QMLbBueKDgQ1Thldumqzm9ThR1yRD9aJfD
	5TpcgU+AZYW7aHRvA3niDHNjuzuXNGXMV9x5PZhBHNkaw0EF+Yw5WE3IjvN7GUyofHwVJWQd+cZVt
	KgCqXahaRHLGhZp84N2I2MYuq1Avzlw/3BJgC9oRnMDJfoMAQJsqnQUHgOfdewHefQRn+94NsPYqH
	jhf3a8+WbJVLP4jg1C1GnutVQXdvkz28j/8D4NsL6EFr/TuJLT7IPF3af485eAecImSvI1MBS0BVL
	D4EOa1RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEp6P-00000004X90-2YBM;
	Thu, 08 Oct 2026 14:28:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEp6N-00000004X7v-1j50;
	Thu, 08 Oct 2026 14:28:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CB70843CDE;
	Thu,  8 Oct 2026 14:28:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AA84CC2BCFD;
	Thu,  8 Oct 2026 14:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791469686;
	bh=aob2hi/UbUSMrfIwQ3spIcIL9xjNoG64Kt0jPa/1Hdg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Q+RqM+NbUEJxveSOoTdzCUdYh2kgAkG4Snqm3rLEuZ4ZrPVh6eVjt9BnEC4lUH6vb
	 z5bDMtbcWxoOwDZ7QZO5IPKBW6EwUqvCamLsJPUzirIuTaXFnePUnyg40961abxBhI
	 sEIvf66Sbw/Nv5iG5c92rLB8wANrj9pk4qA6cwE+mqVmm/stlYd3jbI4BiSyY3LT/o
	 Y+nG7txJXvT85iIfB2NxgmnVn9W2mGiksO7ftL2ETE5sJXv3Uo7xveJ7jObGgexZPu
	 Xt9sCRDZzk34v+TUvdsX6M4L/wKKOfizwYrXIt8VXMrwoHpFJthnB25mzFtHBlk3kG
	 PuKd6vZWgovcA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AFC8CA600D;
	Thu,  8 Oct 2026 14:28:06 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Thu, 08 Oct 2026 14:28:00 +0000
Subject: [PATCH v2 2/3] mmc: meson-gx: honour the busy timeout for R1b
 commands
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-meson-gx-busy-timeout-v2-2-8bde1adfb5b4@iav.lv>
References: <20261008-meson-gx-busy-timeout-v2-0-8bde1adfb5b4@iav.lv>
In-Reply-To: <20261008-meson-gx-busy-timeout-v2-0-8bde1adfb5b4@iav.lv>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-mmc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2127; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=9xGrDCPi8rJjeIzvAyq5Lt1wlFmJSZrwiazD8/BoI9g=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFnHV5R0Zt1sTva8kntm1fkyxsgPc/LOLty0zGkma0Z6K
 O/ty3/vdZSyMIhxMciKKbJMOKRxK2PJ1b/+HuYPYOawMoEMYeDiFICJzDFhZLgwbbrvk6kLdXcu
 /GMVEry2SHbzsTcqb/PWMjoVPOTcYOXByHDArvTjzrxV37mmtXS3BJ1tEnh88mxp4Ca5GUtObWO
 zmM4GAA==
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
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
Reply-To: iav@iav.lv
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Igor Velkov <iav@iav.lv>

For a command without data the driver programs a fixed 1024 ms into the
CMD_CFG timeout field, and for R1b the controller waits for the card to
release busy within that time. The core sends erase and cache flush as
R1b with busy timeouts of up to 60 s and 30 s, and the controller gives
up after one second:

  mmc_erase: erase error -110, status 0x0
  mmc1: cache flush error -110

Program the timeout from cmd->busy_timeout, rounded up to a power of
two and kept within 1024..32768 ms, the range the field holds. sdhci
takes its command timeout from cmd->busy_timeout in the same way.

Fixes: 51c5d8447bd7 ("MMC: meson: initial support for GX platforms")
Assisted-by: LLM
Signed-off-by: Igor Velkov <iav@iav.lv>
---
 drivers/mmc/host/meson-gx-mmc.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 06479ba38525..dd7d3d67f029 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -216,6 +216,20 @@ static unsigned int meson_mmc_get_timeout_msecs(struct mmc_data *data)
 	return min_t(unsigned int, timeout, SD_EMMC_CMD_TIMEOUT_MAX);
 }
 
+/* For R1b the controller waits for busy to be released within this timeout. */
+static unsigned int meson_mmc_get_cmd_timeout_msecs(struct mmc_command *cmd)
+{
+	unsigned int timeout = cmd->busy_timeout;
+
+	if (!timeout)
+		return SD_EMMC_CMD_TIMEOUT;
+
+	timeout = roundup_pow_of_two(timeout);
+
+	return clamp_t(unsigned int, timeout, SD_EMMC_CMD_TIMEOUT,
+		       SD_EMMC_CMD_TIMEOUT_MAX);
+}
+
 static struct mmc_command *meson_mmc_get_next_command(struct mmc_command *cmd)
 {
 	if (cmd->opcode == MMC_SET_BLOCK_COUNT && !cmd->error)
@@ -842,7 +856,7 @@ static void meson_mmc_start_cmd(struct mmc_host *mmc, struct mmc_command *cmd)
 		cmd_data = host->bounce_dma_addr & CMD_DATA_MASK;
 	} else {
 		cmd_cfg |= FIELD_PREP(CMD_CFG_TIMEOUT_MASK,
-				      ilog2(SD_EMMC_CMD_TIMEOUT));
+				      ilog2(meson_mmc_get_cmd_timeout_msecs(cmd)));
 	}
 
 	/* Last descriptor */

-- 
2.43.0



