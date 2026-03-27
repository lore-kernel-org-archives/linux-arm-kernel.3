Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E78FB10F2865
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 22:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kb6DDrTZkLFlPcOcfSK1Dh+lEI2bDad+XQjBQaC29nA=; b=nAr7Bk4UsdhHQ01ifQ8n6KJ4e7
	l+iEw8iE9PhUL9gp/Mfwpb4f5lbO0VgpFJlm+7zsAFPWOpTYeAPGTcNAHhtkrZOoPdJhB7sJxvoiC
	8C0bKN6BILskJCyoQUSuIdtY1TCE9TSfDTRMSe6fq6XkuA0exVwom4c+aLH2ztw2CbNL3U5fVyCZS
	g8z+mjltPmd54SpHd/Vde8luW2GbcSMpayskRVC371OlxKS2uBfNMzcL+rqCc9RU2pq4wxVJC4NPR
	1m76hlcacuJfDK0dGVIoAsSVkLTtO1GVmi94rrs2vh1v2eEY+5/DWQ2gtkk/RXlLVrY7UAhclapz+
	KNAC+Ncg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6FZD-00000008HXx-3yzX;
	Fri, 27 Mar 2026 22:22:11 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6FZB-00000008HXc-1aw2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 22:22:10 +0000
Received: by linux.microsoft.com (Postfix, from userid 1223)
	id BD5CB20B6F01; Fri, 27 Mar 2026 15:22:07 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com BD5CB20B6F01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1774650127;
	bh=kb6DDrTZkLFlPcOcfSK1Dh+lEI2bDad+XQjBQaC29nA=;
	h=From:To:Cc:Subject:Date:From;
	b=Si6FK0B7qG7DbagYwne5jGHL0/9sC5uOYcShPMW0MIoUjcFzG6s83M9TllyFAEsyy
	 RhRrXQSzS9imLLYrb5oPRW0TqneBv3307IuW5bYwfQU4MyWGDzetOMyIhPIbrqeWwc
	 ieO1rpfywn8ml2lARdMmXJBPlm8qjzA0N/oPJl+M=
From: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
To: rjui@broadcom.com
Cc: sbranden@broadcom.com,
	linux-arm-kernel@lists.infradead.org,
	meaganlloyd@linux.microsoft.com,
	tgopinath@linux.microsoft.com,
	adrian.hunter@intel.com,
	linux-mmc@vger.kernel.org
Subject: [RFC PATCH] mmc: host: sdhci-iproc: implement the .hw_reset callback
Date: Fri, 27 Mar 2026 15:21:49 -0700
Message-ID: <20260327222150.2108111-1-meaganlloyd@linux.microsoft.com>
X-Mailer: git-send-email 2.43.7
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_152209_471243_B122E43E 
X-CRM114-Status: UNSURE (   9.35  )
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

Implement the .hw_reset callback so that the eMMC can be reset as needed
given cap-mmc-hw-reset is set in the devicetree and the functionality is
enabled on the eMMC.

Signed-off-by: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
---

SDHCI_POWER_CONTROL[4] (SD Host Controller Standard) has been repurposed
on my Broadcomm processor to be eMMC hardware reset
(SDIO*_eMMCSDXC_CTRL[12], HRESET).

Can you confirm this repurposed bit is consistent across the Broadcomm
iProc processors and thus the .hw_reset callback can be uniformly
applied in this driver?

---
 drivers/mmc/host/sdhci-iproc.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/mmc/host/sdhci-iproc.c b/drivers/mmc/host/sdhci-iproc.c
index 35ef5c5f51467..9018ed7fe2e66 100644
--- a/drivers/mmc/host/sdhci-iproc.c
+++ b/drivers/mmc/host/sdhci-iproc.c
@@ -181,12 +181,26 @@ static unsigned int sdhci_iproc_bcm2711_get_min_clock(struct sdhci_host *host)
 	return 200000;
 }
 
+static void sdhci_iproc_hw_reset(struct sdhci_host *host)
+{
+	u8 val = sdhci_readb(host, SDHCI_POWER_CONTROL);
+
+	/* Trigger reset and hold for at least 1us (eMMC spec requirement) */
+	sdhci_writeb(host, val | BIT(4), SDHCI_POWER_CONTROL);
+	usleep_range(2, 10);
+
+	/* Release from reset and wait for at least 200us (eMMC spec requirement) */
+	sdhci_writeb(host, val & ~BIT(4), SDHCI_POWER_CONTROL);
+	usleep_range(250, 300);
+}
+
 static const struct sdhci_ops sdhci_iproc_ops = {
 	.set_clock = sdhci_set_clock,
 	.get_max_clock = sdhci_iproc_get_max_clock,
 	.set_bus_width = sdhci_set_bus_width,
 	.reset = sdhci_reset,
 	.set_uhs_signaling = sdhci_set_uhs_signaling,
+	.hw_reset = sdhci_iproc_hw_reset,
 };
 
 static const struct sdhci_ops sdhci_iproc_32only_ops = {
@@ -201,6 +215,7 @@ static const struct sdhci_ops sdhci_iproc_32only_ops = {
 	.set_bus_width = sdhci_set_bus_width,
 	.reset = sdhci_reset,
 	.set_uhs_signaling = sdhci_set_uhs_signaling,
+	.hw_reset = sdhci_iproc_hw_reset,
 };
 
 static const struct sdhci_pltfm_data sdhci_iproc_cygnus_pltfm_data = {
@@ -283,6 +298,7 @@ static const struct sdhci_ops sdhci_iproc_bcm2711_ops = {
 	.set_bus_width = sdhci_set_bus_width,
 	.reset = sdhci_reset,
 	.set_uhs_signaling = sdhci_set_uhs_signaling,
+	.hw_reset = sdhci_iproc_hw_reset,
 };
 
 static const struct sdhci_pltfm_data sdhci_bcm2711_pltfm_data = {
-- 
2.49.0


