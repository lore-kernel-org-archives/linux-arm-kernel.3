Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E780CA6012
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 14:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=blKvYnb2vlvDWvMm5czD3pNv9fY5GVsbQnns2GSzHbI=; b=cQIYs4qUzcx902QW/SdhzkTgnN
	Z9jRvaXfxF/GjP2vfU8/kfeMs9Dsqz26NEge0IZFwN4qLKCd2VNEG9E1K8+D/NUD3/V/rRvwmcJd3
	UNiFvHCPbZO4ruUJGnQjvveL8P14F9eOUV92rYUF2uzwzJ5nI3g6BB9TLTHk637aJM1UIYisWXtJ4
	IJL4t6S0zrCukgCA15PDH8vvAHW++2h/qHZIW/aeUCADS0ytLDiUzdXDi61pGLvOqYUoEaKxIFjHK
	n+pb0OYhBXEK07Eft7G+FNHRQm0dsPSMGMj8OvM2dYQADS651C4NeveaJ4q9PyzVQWoOXWAtPoDSD
	rDGz1Q/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEp6P-00000004X8g-29SB;
	Thu, 08 Oct 2026 14:28:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEp6N-00000004X7u-1j5c;
	Thu, 08 Oct 2026 14:28:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C661542E23;
	Thu,  8 Oct 2026 14:28:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A589CC2BCF5;
	Thu,  8 Oct 2026 14:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791469686;
	bh=DrHdRsl5OaG1ReiVzaV8FBPEMya2B3gIklm4dNe/3Z4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NETPE0MApWoqCn+Q3CzxnqbYZPHrMMUf75jrYbe9uPFuhTfPtBA6kPqlhy5oLHwCr
	 uW/PuMvk7RtFit0J5mDa/vsvor57YmHBP/paoQWc5i5ocmv6EiZctOmTHuMA7HGzVF
	 tgAfZq4wlADX8K7U0MvPZOKKKyZlrcrFZh8HRLwPu483TArNMJu+VjaTJdpNR6Pw7y
	 M5XS2GVr+ylc1Q1EGGZJSeaSre/hsJbVPMmSXUpKMxEFIfzhP3h5z8Mfw1Svlbpq0r
	 90Qs+iuJ6Zr+9kBdoc6edVHrirA8gjxuM9YEm1P97J/iVzcxTN0R8LniqeHae8bJhb
	 Hsc2/hhMplubQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89AEBCA6007;
	Thu,  8 Oct 2026 14:28:06 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Thu, 08 Oct 2026 14:28:01 +0000
Subject: [PATCH v2 3/3] mmc: meson-gx: report the longest busy wait the
 controller can do
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-meson-gx-busy-timeout-v2-3-8bde1adfb5b4@iav.lv>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1174; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=/StF9gcFvUuHJEY80/0V9uXgKqu0N64QncOwWv4fwhE=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFnHV5Rka+6/LFU2qb5wV95ljQstz215ZwU9XcN1LyHr+
 5Wvc6ZwdZSyMIhxMciKKbJMOKRxK2PJ1b/+HuYPYOawMoEMYeDiFICJ/L/KyLD7w3sjpjj1NrGJ
 2cYFixzX27tfWvJx9w0fx5QWcaaEbcsZGToyxSam6TZkTKyb7m390egMc98e7f/bKq1q8pbkfU3
 YyQAA
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

The driver does not set max_busy_timeout, so the core takes the host
for one that can wait for busy indefinitely and sends erase and cache
flush as R1b with busy timeouts of up to 60 s and 30 s. The CMD_CFG
timeout field holds at most 32768 ms, so the controller times out first.

Report 32768 ms as max_busy_timeout. The core then sizes discards to
fit and, for a longer wait, sends R1 and polls for busy itself.

Fixes: 51c5d8447bd7 ("MMC: meson: initial support for GX platforms")
Assisted-by: LLM
Signed-off-by: Igor Velkov <iav@iav.lv>
---
 drivers/mmc/host/meson-gx-mmc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index dd7d3d67f029..8de3eb65ccb0 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -1183,6 +1183,9 @@ static int meson_mmc_probe(struct platform_device *pdev)
 
 	mmc->caps |= MMC_CAP_CMD23;
 
+	/* The longest busy wait the CMD_CFG timeout field can hold. */
+	mmc->max_busy_timeout = SD_EMMC_CMD_TIMEOUT_MAX;
+
 	if (mmc->caps & MMC_CAP_SDIO_IRQ)
 		mmc->caps2 |= MMC_CAP2_SDIO_IRQ_NOTHREAD;
 

-- 
2.43.0



