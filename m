Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 954F3109317D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 05:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z4nB0/r5SHjucr91NuXd8v1nM0CvlhwLCD09C5ajWTY=; b=E/TnuZjtMqbKze
	aWHKeiOGlM1WZ7JyuspaEujsPi7LbD/Q1DqgkvLpBtvq9vuOR3T51NYSDAdFrKIvnidlXRlk8tbsg
	wbNvlC4tsfbvNBvJGp94uC7hGEwnpEvKlOMPvE6ieGboCmpXc6lmKhImcug2SsmdT3BImSYolGWnV
	xLU6pMFqqpZQSsXELF1sBgmaKktM4l0KVY822vnhmgMdAComVs0AC96QXqs2/N2uUjWPXEeWC4OD6
	0QuIPDz0ci6F3eOgLDkSeZ/NbThQblPAd0FIsQ/IhC91aFjyjv1nR5bl+1EKVLuKuB6w9cpcwVcRx
	8Vf9/MxBuZPL/iFuJEUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ShF-0000000C70N-2w8m;
	Fri, 20 Mar 2026 05:46:57 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ShC-0000000C6zr-3D8n
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 05:46:56 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 20 Mar
 2026 13:46:40 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 20 Mar 2026 13:46:40 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: [PATCH v3 0/4] iio: adc: aspeed: Reserve battery sensing channel
 for on-demand use
Date: Fri, 20 Mar 2026 13:46:34 +0800
Message-ID: <20260320-adc-v3-0-bc0eac04ef7c@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADrfvGkC/2WOzQ6CMBAGX4X07Jr+0QZPvofxsG1X6UEgLWk0h
 He34EXjcb7sTHZhmVKkzE7NwhKVmOM4VFCHhvkehztBDJWZ5NJwJRRg8KBt5zg63jkkVi+nRLf
 43CuXa+U+5nlMrz1axLb++kWAAIuSgtPUGqPPmCeiMJPvj358sC1S5LdoPqIEDlJo26IUtj7wJ
 67r+ga7Q9mr1AAAAA==
X-Change-ID: 20260313-adc-479b0ab09bae
To: Jonathan Cameron <jic23@kernel.org>, David Lechner
	<dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy
 Shevchenko" <andy@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>
CC: <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<morris_mao@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>, "Andy
 Shevchenko" <andriy.shevchenko@linux.intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773985600; l=2152;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=TuilmV9/QzS9Wjm/LIGeDhedU/2KmdQqlz/9Y9KoZr4=;
 b=LbKiP2Kc8E1Fpt+3uxQU7NuAph6xcpB/odQpch9STV5VWWptSOotZFKoCADnPVt+cJG7cwYLY
 bcsmoyHe63PArOvCX/wlP91mZYrX2/VK/goV5PGSQy6WSgh59UGBuGh
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_224654_838674_567E77F9 
X-CRM114-Status: UNSURE (   9.55  )
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
Changes in v3:
- Simplify channel mask helper as suggested by Andy
- Use FIELD_MODIFY() when updating ADC channel field instead of open-coded OR
- Move unrelated blank line change to the previous patch
- Replace mdelay(1) with fsleep(1000) since the delay is in sleepable context
- Fix comment typo ("adc" -> "ADC")
- Link to v2: https://lore.kernel.org/r/20260316-adc-v2-0-21475a217b09@aspeedtech.com

Changes in v2:
- Split the changes into a series of patches for better clarity and
review
- Link to v1: https://lore.kernel.org/r/20260313-adc-v1-1-7a2edb4e5664@aspeedtech.com

---
Billy Tsai (4):
      iio: adc: Add battery channel definition for ADC
      iio: adc: Enable multiple consecutive channels based on model data
      iio: adc: aspeed: Replace mdelay() with fsleep() for ADC stabilization delay
      iio: adc: aspeed: Reserve battery sensing channel for on-demand use

 drivers/iio/adc/aspeed_adc.c | 68 +++++++++++++++++++++++++++++++++++++-------
 1 file changed, 57 insertions(+), 11 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260313-adc-479b0ab09bae

Best regards,
-- 
Billy Tsai <billy_tsai@aspeedtech.com>


