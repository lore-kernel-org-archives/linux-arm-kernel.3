Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB8FAE67808
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 19:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G68ZaVveeAPDy61zCvgR6ZvWngMfCpzqwzzHizbuydU=; b=1syVpEjWmRaS2a2ut8GZPGxTwM
	QJQrMkWgqK0N0AJ/8BZPbdiO1pVUbJGIN9VRWc7QqEW6M5+cjXZwwGmhSzOUH0Wb3sk8fDsVD9ygA
	Z44aEdpa6hciZZoauzC8f5n5iCHd8pHzeDQrmHtFZQqajiWPLlae240tZERovgctnXR+bhxOPSwHw
	yFhFaDou8tpc7wIiNJY4rzwXAUltVKaMtULufGwVx9VaxbfVid8yveuGzW8GoS6/L7RGMnzdixM/F
	p0ZAMkBKD7YVZNdQmuNNkk/7rgH4dj8QfKoZfWtfy8nHaYMgWsAE4tCp8d9oBD/MaJGvkj0ueOCpg
	RSbl1cag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7KEN-0000000AJPb-1ktQ;
	Sat, 02 Nov 2024 19:56:19 +0000
Received: from a.peacevolution.org ([206.189.193.133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7KCf-0000000AJ5Y-3pfq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 19:54:35 +0000
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
	by a.peacevolution.org (Postfix) with ESMTPA id AC5EF4C845;
	Sat,  2 Nov 2024 19:54:26 +0000 (UTC)
From: Aren Moynihan <aren@peacevolution.org>
To: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Aren Moynihan <aren@peacevolution.org>,
	Kaustabh Chakraborty <kauschluss@disroot.org>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>,
	Ondrej Jirman <megi@xff.cz>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Dragan Simic <dsimic@manjaro.org>,
	phone-devel@vger.kernel.org
Subject: [PATCH v4 0/6] iio: light: stk3310: support powering off during suspend
Date: Sat,  2 Nov 2024 15:50:33 -0400
Message-ID: <20241102195037.3013934-3-aren@peacevolution.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: auth=pass smtp.auth=aren@peacevolution.org smtp.mailfrom=aren@peacevolution.org
X-Spamd-Bar: ++++
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=peacevolution.org;
	s=dkim; t=1730577268;
	h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding;
	bh=G68ZaVveeAPDy61zCvgR6ZvWngMfCpzqwzzHizbuydU=;
	b=Tzc7jf7/YcxSmOknbQHGUntcT+2BmHXa6PKRE5Wi0BLJKcBuya7pa2msevfer6Ii9LupZQ
	8ZRP4N3ShUjjF1/anXp3sGNM7Vs/RAFgIZLYNz/cj46M2bbucjlHbDYwslM0zJVkscVh+X
	7C3j+jd96ZG7dEYMS3rRQqPYmiSs+oI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_125434_052483_DBDF3CC8 
X-CRM114-Status: GOOD (  10.97  )
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

In the Pine64 PinePhone, the stk3310 chip is powered by a regulator that is
disabled at system boot and can be shut off during suspend. To ensure that
the chip properly initializes, both after boot and suspend, we need to
manage this regulator.

Additionally if the chip is shut off in suspend, we need to make sure that
it gets reinitialized with the same parameters after resume.

Major changes in v4:
 - replace mutex_init with devm_mutex_init
 - code style cleanup

Major changes in v3:
 - Use bulk regulators instead of two individual ones
 - Replace stk3310_remove with devm callbacks

Major changes in v2:
 - Add handling of the IR LED. I was hesitant to include this as it is the
   same as pull-up regulator for the i2c bus on the hardware I have, so I
   can't test it well. I think leaving it out is more likely to cause
   issues than including it.
 - Convert stk3310 to use dev_err_probe for errors.
 - Always enable / disable regulators and rely on dummy devices if they're
   not specified.
 - more listed in individual patches

Aren Moynihan (5):
  dt-bindings: iio: light: stk33xx: add vdd and leda regulators
  iio: light: stk3310: handle all remove logic with devm callbacks
  iio: light: stk3310: Implement vdd and leda supplies
  iio: light: stk3310: use dev_err_probe where possible
  iio: light: stk3310: log error if reading the chip id fails

Ondrej Jirman (1):
  arm64: dts: allwinner: pinephone: Add power supplies to stk3311

 .../bindings/iio/light/stk33xx.yaml           |   4 +
 .../dts/allwinner/sun50i-a64-pinephone.dtsi   |   2 +
 drivers/iio/light/stk3310.c                   | 162 ++++++++++++------
 3 files changed, 120 insertions(+), 48 deletions(-)

-- 
2.47.0


