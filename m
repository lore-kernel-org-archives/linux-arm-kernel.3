Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD4E7F30299
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 03:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=l+pTO17fQOg91UmfjghvNpCstYpEP44DkLaSD/o08/g=; b=e4ULyOmBgPGlvn
	Ne7KfZ7YHD32FQTJmzj71PcKBjXiIuZ0RE0uq+mnshcO/RliKur93VSSflwODze9vu22t/gvO/3Gq
	KZj6f+fJr5RRb8lg3w2JuRQZTIfOG2w8fQYK1Gk0jehzX8vHPvOk6MIF7I3+Lv0HFZ/AsLf4/gW/a
	ZWKAlTAgxs3ckZm8HF6a2WLkU+xUvEi8FO2g9j4XAO06GBy6cTkqfQ74pBfTY0LtXA+w/ISaNb3KL
	Y+H6YLtaoDmBwPMmlc5j9M/iFJlrg+qcA+K5XbEd55XbEtR414K09cKBbG9rv/YZk1M1bK07U1mcX
	qIHPq4UHIseWS7bYWTwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1yCT-00000003F2f-2QPB;
	Mon, 16 Mar 2026 03:01:01 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1yCQ-00000003F1K-1vNo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 03:01:00 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 16 Mar
 2026 11:00:47 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 16 Mar 2026 11:00:47 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: [PATCH v2 0/3] iio: adc: aspeed: Reserve battery sensing channel
 for on-demand use
Date: Mon, 16 Mar 2026 11:00:45 +0800
Message-ID: <20260316-adc-v2-0-21475a217b09@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF1yt2kC/1WMQQ7CIBBFr9LMWgxQpKkr72G6GGCUWdg20BBNw
 93F7ly+n//eDpkSU4Zrt0OiwpmXuYE+deAjzk8SHBqDltrKXvUCgxdmGJ1EJ0eHBO25Jnrw+6j
 cp8aR87akzxEt6rf++0UJJQbUFJyhi7XmhnklChv5ePbLC6Za6xepgHuEmwAAAA==
X-Change-ID: 20260313-adc-479b0ab09bae
To: Jonathan Cameron <jic23@kernel.org>, David Lechner
	<dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy
 Shevchenko" <andy@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>
CC: <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<morris_mao@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773630047; l=1657;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=7n3XWwQkTSTYZWTGs/j2GKQm8DXZDI2s/DZ4MDmppHY=;
 b=xvKCj0NDWh80XBGmiwTSZxyraKDRRfynknLqGlG7iXkL/veXU8GCyWp8kw8rfs9DUjr0S5ccP
 RkU9xMn/VTLCwbEk9pEMJzSI5+c0bkixRI97lp1vxZZVaIddC5Fx+4/
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_200058_656591_6B5D93E5 
X-CRM114-Status: UNSURE (   7.78  )
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

For controllers with battery sensing capability (AST2600/AST2700), the last
channel uses a different circuit design optimized for battery voltage
measurement. This channel should not be enabled by default along with other
channels to avoid potential interference and power efficiency issues.

Changes made:
- Introduce aspeed_adc_get_active_channels() to return the number of
  channels that should be enabled by default
- For battery sensing capable controllers, exclude the last channel
  from the default channel enable mask
- Enable the battery sensing channel only when explicitly accessed
  via read_raw()
- Replace hardcoded channel numbers with ASPEED_ADC_BATTERY_CHANNEL macro
- Add helper functions for cleaner channel management

This ensures optimal power efficiency for normal ADC operations while
maintaining full functionality when battery sensing is needed.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
Changes in v2:
- Split the changes into a series of patches for better clarity and
review
- Link to v1: https://lore.kernel.org/r/20260313-adc-v1-1-7a2edb4e5664@aspeedtech.com

---
Billy Tsai (3):
      iio: adc: Add battery channel definition for ADC
      iio: adc: Enable multiple consecutive channels based on model data
      iio: adc: aspeed: Reserve battery sensing channel for on-demand use

 drivers/iio/adc/aspeed_adc.c | 75 ++++++++++++++++++++++++++++++++++++++------
 1 file changed, 65 insertions(+), 10 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260313-adc-479b0ab09bae

Best regards,
-- 
Billy Tsai <billy_tsai@aspeedtech.com>


