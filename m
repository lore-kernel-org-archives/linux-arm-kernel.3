Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A2D4C44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 07:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1UfUXCr53MVmAxCgEvl6p7BqmYW2167OMSThHKBq4o8=; b=pUXUmvRmZlU1nQg/BegF5C+sni
	6Yye2JHk/VCeUOplaDpMaL6kwediQp99n9m70QvQpacY54VN7r+sucIKBV+ilvgLUwAeeIOxTVs78
	E+/AELnPPNyBVohHr5ExdQWn4k8AM+HBlUKmvJTOdbX35HSyIL7nPWFpMr8zkcyZwL9hNU3LkTFGl
	Ljhxw0Xa4SRvRV+yGu6gqeRdo4lEOd79BSZbOH72z8dS1/RDOuPmAx+H8bjc44PV+KrmRqfEqZw5e
	xhMjkksVhGrZty6JRdQznH7dlmUQw3Qfh88dEkcXJc1AsvpEp98dtkCPBvLmgOke+UHSMro6TQfoM
	FKuAWi2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5Ij-00000008hhA-0Q7f;
	Tue, 21 Jul 2026 07:54:05 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5Ig-00000008hg3-31Ga
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 07:54:04 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2cc891373e0so137421345ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 00:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784620442; x=1785225242; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1UfUXCr53MVmAxCgEvl6p7BqmYW2167OMSThHKBq4o8=;
        b=EaXgd6l22vPpa7zpxRAWGGZqAWHQ0vh1jjNxk7xlCvIFGEURXa21u0A2Qm6oIvKzfh
         5wEkXG2IvKzmjZkagkT1ifFTmLgiZbR6lpaqZsP3AwF4CoJMVV94a6OL2564TDk/XKBl
         tlTUXpH8Efr/AHDxhw3jhCu6F4GVaXzIB91Go=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784620442; x=1785225242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1UfUXCr53MVmAxCgEvl6p7BqmYW2167OMSThHKBq4o8=;
        b=nwWRT7PcSa6bq54elIg0ZSnwKLePyILCTvOzIB4Hxu/Nk5iT5L3WCIoDGjdYYid8PI
         LJB/pnWWrNaJKWf6tLCipxXtW3S+LViYG8rr7ajgdOsLJMInuG6pqhP5sxZmXrlrcoPW
         NXroBn0Rr78fKotK+x8/BjHpADDFnOhgRUiSEzAQFBf35EyCQCkEsMfjrv5tGii5M63w
         PvDeEFyXBzGOS5I7ANILwEC3AN67z+XHN67Pxb1xooZJxWQIGiLxPCS71qCrk0qSUiQb
         JyXcRI8BVRurwIZYOEY3/+A6V4MdZ7N/j7jhaZmkCvI5QvogS62y1u/baNedP1uyzO4P
         7tGQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrh3hEchz7zl/dCDR9+H1Aqw6lBhyhrt0filrNpIGuNQ0ncczp0hrEN7AL3u6kEB0YfKFyGmsaJYRtUF2pLUnH/@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4wJmhe3rzs/1vmQMhEv/gtQOQg6WCf3ATJIHN3iv+LDTaVgnc
	T1EtlqVhxXfHUe6VtsXWItvBddYewPTv23Bnmrx4Q0RInOU/ByVmFT98gQbeySgfvA==
X-Gm-Gg: AR+sD12FlJ7XFyjHgYF+92xb4n2I9XunL4QVya4C7+8RlzNbahtfqkkP3UCheqZfP6g
	gOdQzhqAHFQ+Aycc7dZvjuPa85ZDOm+yrweXe4EKhTfN0RqgsajwCua2v0pwT6YNkqIVira7AUU
	0wC+c/4QpTqC1dvwBexcUpj+LA0LBidHtoh5dkxSJ0Q9id0VyUMc3XwRM9s86vvyUdDx7YFkiwx
	sTfhrqZI1V9Qr08NkAjQhBTiZ9c/PMEcDbAcLkdQy6MK4vB0msw08VOkppTr2C7BpXE086bVxGj
	4UCEMbXTBxveLEZN1Tf8JSG+Onjq3/2lk0SBw2Hgpl8FkzCUCPc68S3+oQ4PbghqHBCw+NocNcR
	n2BGgB+JrtJi3QNRdjGDoGsWVYRqfzr2gZ+KiXbuUMI3xNC3ANoAaO2mjkihweSsejJ94fiuwHd
	JYsxJor8pKKonZLQjGpfWoSKe2Ex4Ia8egslY6seQasnAhNbX8jev9RRHkG50=
X-Received: by 2002:a17:903:3c44:b0:2ca:ed41:d331 with SMTP id d9443c01a7336-2cf34a3f5c3mr188180995ad.45.1784620442019;
        Tue, 21 Jul 2026 00:54:02 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448f705sm70724175ad.15.2026.07.21.00.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 00:54:01 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/9] arm64: mediatek: Chromebook trackpad supply fixes
Date: Tue, 21 Jul 2026 15:52:14 +0800
Message-ID: <20260721075226.2347933-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_005402_793385_30DE2D0E 
X-CRM114-Status: GOOD (  25.98  )
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

Hi everyone,

This is v3 of my Chromebook trackpad supply fixes and optimization
series.

Changes since v2:
- Added new regulator "enable and wait" functions that wait until at
  least the given amount of time has passed since the regulator was
  last enabled.
- Converted patches to use the new functions
- New header inclusion cleanup patch for elan_i2c driver

This series fixes the trackpad descriptions on some MediaTek-based
Chromebooks: either the trackpad's supply was set as always-on to
workaround missing delays in the driver, or the delay and supply
are missing from the trackpad's device node.

v1 was just the first patch [1]. It has since grown to cover multiple
drivers and devices.


Patch 1 adds new "enable and wait" functions for single and bulk
regulator enable.

Patch 2 cleans up header inclusion for elan_i2c driver.

Patch 3 adds the correct enable delay after enabling the supply regulator
for the Elan trackpad to initialize. This uses the new "enable and wait"
regulator enable function.

Patch 4 applies the same logic of skipping the power on delay to the
i2c-hid-of driver.

Patch 5 applies the same logic of skipping the power on delay to the
i2c OF component prober library.

Patch 6 adds a delay between when the device node found is enabled and
when regulator_disable() is called. This gives an asynchronously probing
driver some time to increment the enable count of their regulator
reference, thus keeping the device operational and allowing the driver
to skip the initialization delay.

Patch 7 adds the correct delay for probing trackpads for Hana devices
to the ChromeOS OF component prober.

Patch 8 removes the "always-on" setting from the trackpad supply for
Elm / Hana and adds the correct delay to the second source trackpad.
This corrects the hardware description.

Patch 9 adds the supply and power on delay properties to the Synaptics
trackpad on the Spherion device. Combined with previous driver changes
this should cause no actual functional changes or delays.


Please take a look. Patches 3, 4, and 5 have build time dependencies
on patch 1. I suggest placing patch 1 on a separate immutable branch
or tag for the other maintainers to pull in. The three patches all have
different maintainers.

The DT changes must go in after all the driver changes land, especially
patch 3 that adds delays to the Elan trackpad driver. Otherwise the user
could potentially end up with a non-functional trackpad on the device.


Thanks
ChenYu

[1] https://lore.kernel.org/all/20241001093815.2481899-1-wenst@chromium.org/


Chen-Yu Tsai (9):
  regulator: core: Add "enable and wait" functions
  Input: elan_i2c - sort include statements
  Input: elan_i2c - Wait for initialization after enabling regulator
    supply
  HID: i2c-hid-of: skip post-power-on delay if powered on sufficiently
    long
  i2c: of-prober: skip post-power-on delay if powered on sufficiently
    long
  i2c: of-prober: Defer regulator_disable() on successful probe in
    simple helper
  platform/chrome: of_hw_prober: Add delay for hana trackpads
  arm64: dts: mediatek: mt8173-elm-hana: Unmark trackpad supply as
    always-on
  arm64: dts: mediatek: mt8192-asurada-spherion: Add Synaptics
    trackpad's supply

 .../boot/dts/mediatek/mt8173-elm-hana.dtsi    |  8 +--
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  |  1 -
 .../mediatek/mt8192-asurada-spherion-r0.dts   |  2 +
 drivers/hid/i2c-hid/i2c-hid-of.c              |  9 ++--
 drivers/i2c/i2c-core-of-prober.c              | 25 ++++++---
 drivers/input/mouse/elan_i2c_core.c           | 23 ++++----
 .../platform/chrome/chromeos_of_hw_prober.c   |  4 +-
 drivers/regulator/core.c                      | 53 ++++++++++++++-----
 include/linux/regulator/consumer.h            | 21 +++++---
 include/linux/regulator/driver.h              |  2 +
 10 files changed, 96 insertions(+), 52 deletions(-)

-- 
2.55.0.229.g6434b31f56-goog


