Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93EAFF43834
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 15:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bpyVx0y2ZA9fd3JR1eYLTwu73jiCqSyvYkmxjfujr7o=; b=gWDnT+hunlKy958FWDzEy9d8Sk
	VoNXea4NtvwL3b+Go0FOwWOFq9jdCZwwklzi1Y4Q+DR4T3YawLkHMEo5dibAa+YdEX2wJJ8TycLEu
	iZYEZ20LMvL/BzJelbnocSREje0/J6aaMU60aXy/vCep2xqVenHplLIbLj1F5TxxciWLSls6wjMnO
	7CP5F1nk+DOTMWgz/B6ztC5Ay/XZweg5Yn6I2FtuTJE5xYlt5yLL/yE+kJoLvfTG88nPCCxTVa0tk
	5hlNXIdZMVotJsJ7rfHQXWdhv8D2HrYmKbCq+/Dyblyg0clc0jhuclIcG51UTq3LNwJ5301A6DEb0
	VCGZ7lZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD1lr-00000001HDT-21Yd;
	Wed, 15 Apr 2026 15:03:15 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD1lo-00000001HCI-35fV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 15:03:14 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 074FD26F45;
	Wed, 15 Apr 2026 17:03:07 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IY1vHmCK0xuZ; Wed, 15 Apr 2026 17:03:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1776265386; bh=0D1hlKCJtN9XoByE8IGBqcG2ueuIOxSDK/Q798cCv70=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=K6VYZeSwGmyytHCkWb5E1S3ytfQY+f6HDN04pmYXN0Yh8F7qSrZ4WYz35jvknYDkc
	 ib0Xyzj5uYbICSaKBFsNT1HRNQSlY7hCG2mK+sdfzbH1SccmnFOUgMp5hKCbm7kLJX
	 gH5gbUd1mhEELE+WeUnP0hwyzhHbDQ9Nqoz+AUJPMS5Cvqe82Hus/sq2Gltm3EITpS
	 HfhpdBV6iK+S3UMmJOzrEps34eewSF19IADvAdZqO0tuotnnafRL1Wwvm0p+TlwSUJ
	 aDYDWSmfQoA8BbV0ffFTWzyop6mgfRcPwJYE3bHQAkY8pbJd/jhMeJ/bEHZAR6SpOE
	 53/ctq97jQaQg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Wed, 15 Apr 2026 20:32:08 +0530
Subject: [PATCH v3 1/2] mmc: dw_mmc: implement option for configuring DMA
 threshold
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260415-dwmmc-dma-thr-v3-1-31014d36b6ee@disroot.org>
References: <20260415-dwmmc-dma-thr-v3-0-31014d36b6ee@disroot.org>
In-Reply-To: <20260415-dwmmc-dma-thr-v3-0-31014d36b6ee@disroot.org>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaehoon Chung <jh80.chung@samsung.com>, 
 Shawn Lin <shawn.lin@rock-chips.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_080312_966295_F7F5145C 
X-CRM114-Status: GOOD (  15.76  )
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

Some controllers, such as certain Exynos SDIO ones, are unable to
perform DMA transfers of small amount of bytes properly. Following the
device tree schema, implement the property to define the DMA transfer
threshold (from a hard coded value of 16 bytes) so that lesser number of
bytes can be transferred safely skipping DMA in such controllers. The
value of 16 bytes stays as the default for controllers which do not
define it. This value can be overridden by implementation-specific init
sequences.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/mmc/host/dw_mmc.c | 4 ++--
 drivers/mmc/host/dw_mmc.h | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/dw_mmc.c b/drivers/mmc/host/dw_mmc.c
index 20193ee7b73eb..3b4157f34d11f 100644
--- a/drivers/mmc/host/dw_mmc.c
+++ b/drivers/mmc/host/dw_mmc.c
@@ -40,7 +40,6 @@
 				 SDMMC_INT_RESP_ERR | SDMMC_INT_HLE)
 #define DW_MCI_ERROR_FLAGS	(DW_MCI_DATA_ERROR_FLAGS | \
 				 DW_MCI_CMD_ERROR_FLAGS)
-#define DW_MCI_DMA_THRESHOLD	16
 
 #define DW_MCI_FREQ_MAX	200000000	/* unit: HZ */
 #define DW_MCI_FREQ_MIN	100000		/* unit: HZ */
@@ -821,7 +820,7 @@ static int dw_mci_pre_dma_transfer(struct dw_mci *host,
 	 * non-word-aligned buffers or lengths. Also, we don't bother
 	 * with all the DMA setup overhead for short transfers.
 	 */
-	if (data->blocks * data->blksz < DW_MCI_DMA_THRESHOLD)
+	if (data->blocks * data->blksz < host->dma_threshold)
 		return -EINVAL;
 
 	if (data->blksz & 3)
@@ -3185,6 +3184,7 @@ struct dw_mci *dw_mci_alloc_host(struct device *dev)
 	host = mmc_priv(mmc);
 	host->mmc = mmc;
 	host->dev = dev;
+	host->dma_threshold = 16;
 
 	return host;
 }
diff --git a/drivers/mmc/host/dw_mmc.h b/drivers/mmc/host/dw_mmc.h
index 42e58be74ce09..f29d40158dc59 100644
--- a/drivers/mmc/host/dw_mmc.h
+++ b/drivers/mmc/host/dw_mmc.h
@@ -107,6 +107,7 @@ struct dw_mci_dma_slave {
  * @ciu_clk: Pointer to card interface unit clock instance.
  * @fifo_depth: depth of FIFO.
  * @data_addr_override: override fifo reg offset with this value.
+ * @dma_threshold: data threshold value in bytes to carry out a DMA transfer.
  * @wm_aligned: force fifo watermark equal with data length in PIO mode.
  *	Set as true if alignment is needed.
  * @data_shift: log2 of FIFO item size.
@@ -163,6 +164,7 @@ struct dw_mci {
 	void __iomem		*regs;
 	void __iomem		*fifo_reg;
 	u32			data_addr_override;
+	u32			dma_threshold;
 	bool			wm_aligned;
 
 	struct scatterlist	*sg;

-- 
2.53.0


