Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C131093178
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 05:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SvSTDyofL5iioxfNCLKmnhWMhtnqQgsSITgCmDBkZh8=; b=plkq3atVx9tUdZGyWjm4aHwYTM
	ZSSoIRxFRxElpecbPsOSxpMaT/jgSTTnqPbOQ70CqCe7kN5Fq+n+2hGkgLvyUULD2jpIhHyTJE0wU
	X0inz8g74pPfvuKVmIL/GndgW7+UywpKszJmdhlVZO130DMWcWniA8Ga2F56Bi+2hlRqPtXd/46uZ
	ypbX3po0fa3HwJMel6AKfOfSX+kB7eJFxmMcMQgVTiNH3vWalcNoBzV18xMI1iRGdKKw13Uh+kPow
	/IjijYhBx3UQBX0EAz8R8CHTUdNbqrpDNqjo2gI1tDbq5wrt07rsO5Aoo0ySAPEYzAZ+MiTMYZaPH
	PWINafag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ShK-0000000C72g-2TQI;
	Fri, 20 Mar 2026 05:47:02 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ShI-0000000C6zr-0T7a
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 05:47:01 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 20 Mar
 2026 13:46:40 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 20 Mar 2026 13:46:40 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Fri, 20 Mar 2026 13:46:37 +0800
Subject: [PATCH v3 3/4] iio: adc: aspeed: Replace mdelay() with fsleep()
 for ADC stabilization delay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260320-adc-v3-3-bc0eac04ef7c@aspeedtech.com>
References: <20260320-adc-v3-0-bc0eac04ef7c@aspeedtech.com>
In-Reply-To: <20260320-adc-v3-0-bc0eac04ef7c@aspeedtech.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner
	<dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy
 Shevchenko" <andy@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>
CC: <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<morris_mao@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>, "Andy
 Shevchenko" <andriy.shevchenko@linux.intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773985600; l=1623;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=nns6L1IWBrZoZF9du3xsZHyx3aa79UG/Vd6Iwrl6+E4=;
 b=Qc5vqncqRGLGuLM3Fsty10mqFKuRhZ1K7YvVPDSfqOOI7GdSgN9c7iYBIUjuu+r/PXnsiWOSN
 xvgaZ6SBLT/B4iMZs8MNxA6NU+aeBkM4p6HjYbiLcTYDEzWDGEZyaYw
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_224700_162140_9F0A1A72 
X-CRM114-Status: GOOD (  10.80  )
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

The ADC stabilization delays in compensation mode and battery sensing
mode do not require atomic context. Using mdelay() here results in
unnecessary busy waiting.

Replace mdelay(1) with fsleep(1000) to allow the scheduler to run other
tasks while waiting for the ADC to stabilize.

Also fix a minor typo in the comment ("adc" -> "ADC").

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/iio/adc/aspeed_adc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
index 3ff24474f394..a1a6296d3003 100644
--- a/drivers/iio/adc/aspeed_adc.c
+++ b/drivers/iio/adc/aspeed_adc.c
@@ -259,7 +259,7 @@ static int aspeed_adc_compensation(struct iio_dev *indio_dev)
 	 * After enable compensating sensing mode need to wait some time for ADC stable
 	 * Experiment result is 1ms.
 	 */
-	mdelay(1);
+	fsleep(1000);
 
 	for (index = 0; index < 16; index++) {
 		/*
@@ -314,10 +314,10 @@ static int aspeed_adc_read_raw(struct iio_dev *indio_dev,
 				       ASPEED_ADC_BAT_SENSING_ENABLE,
 			       data->base + ASPEED_REG_ENGINE_CONTROL);
 			/*
-			 * After enable battery sensing mode need to wait some time for adc stable
+			 * After enable battery sensing mode need to wait some time for ADC stable
 			 * Experiment result is 1ms.
 			 */
-			mdelay(1);
+			fsleep(1000);
 			*val = readw(data->base + chan->address);
 			*val = (*val * data->battery_mode_gain.mult) /
 			       data->battery_mode_gain.div;

-- 
2.34.1


