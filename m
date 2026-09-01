Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE52CC624CF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 07:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KfyZyO9Nh/74YiXm8QLieiH5kTcxaWjtqwY5nnPQU9w=; b=auR5zxER79xGSkpbU21Abb+8wR
	wRO/YZ72WJiMhCIqHW4JrYOv/xuxZH/y2ck/pyDFK07J6cgtVTbF+hUlmPePRknuJgl7sbv+YO1fn
	ak8EMqnX7mgEvRnDKGozBOts1cyBhyhp3OTfJpvYCmQ1zalqyd2iVbr48ofCgISll4T6pC1ctiDSw
	42Jar29ZGoTMJp3Lm15khNjaH1N8r5hOd8aPwfjbzOXR9xC6uQ+35IeqkogygrQNz89R6Ky3Ad9zD
	mgZuCaeN99YRNWq55P0mML0icoYjsUUgQ19GCqHM7dxt1pe6x0IVFrt904xbpEKtJqFRZ05GvLRyq
	4ry44knw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JFh-0000000B9zo-2Qik;
	Tue, 01 Sep 2026 07:49:53 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JFe-0000000B9z7-3GBT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 07:49:52 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2d94c868ea5so10531875ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 00:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788248990; x=1788853790; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KfyZyO9Nh/74YiXm8QLieiH5kTcxaWjtqwY5nnPQU9w=;
        b=oGqqtxvv9cuYEI2hfCHk4L7fS1iPyvA2cSm8E2EERh8zGPxlyDK1zUC/Dtr2Od/id7
         HT5gkP0Fx7qFnpSm0Z7cpgrv5bKhtHo6b+9hxVHfZVuV6Br5R9Zhu0UyJyuUVccDdkJe
         KnGqMTlQ8wbkqhoXgU8YWZaPt2g3+9zAF4l+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788248990; x=1788853790;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KfyZyO9Nh/74YiXm8QLieiH5kTcxaWjtqwY5nnPQU9w=;
        b=mUix/i0q+D+vp14lW8ARbw35/oEIzNYM20kghI7yG4bHB7CrFnENwTTcEiXA6fU5yR
         61lh3tX3m/gy0VuG/9QHBhO5apCOa1XXHQ1Zh/EI7hFfBOfCp5ZpzNM4oTWir6Ep/N+e
         wigmcEutT9w0EbGcp/JDMwdmDvyg1TP6AfZ+tp+R8kl6ayGx/YBhoQ1bvqH3locnodBf
         1fmrmSGXOCIfDBMX5PnZpiZmOU7n1GpUpIahh7RlTUnm6E0JYiRVN/IWcG5f22l2kmdq
         +WUcAN5NM/AdihXIHJm+v6j52UWvzSkIjvDxa7m9OR3wpE2dGae/w9zUVAw/i4sR0IlW
         c5vA==
X-Forwarded-Encrypted: i=1; AKwUvBwnyCcxum5ok3nkRdJ1len6D3uEdqkOyfNz2g0qIcDzWvByETk3zSXCbNMDNcg8AJE+T6bx9g6i8EWGeUhtzE18@lists.infradead.org
X-Gm-Message-State: AFuF++n4R4sFm2282rHypEF9f5ImzxBrOdYbNZEqWCUATyukUQclJvdF
	ViIj9N0afOFambMBvXmBEEKh4zZXwWdL2aWANEdV8C6SxClfNiFvESbvHS0tqaaY3A==
X-Gm-Gg: AYBFou3Y8vnyoBS4Ps/gz+c4Hc/12dwDtOYSXSaFtn9LFggVVa4Y/V8zr27oXWyPdUj
	uL50I8Qtnyv7682LOI/nGEF5TZSj8hc1cmSi83BSVXO/X68UlJFS4AIBwdlWbbqzyRS9vQp3Rls
	hQRT7WF2jJ5H26bdbvqmJdrQ6hBghInCmSoU8zP7EbQGhrIr982XIgAJKDgGAH54M1pqfWCMXw4
	c8UmlJax0YqPCSNw/ofm/BUoqy+I8aYFCY7TfjBauFYLl6eWKBdK44pXvn22nfXQIGlEe+7irTF
	g4QVBErAHh1ezpGu84k8YkIPZBvV0aP6uTUK6rPvKzhW46xB5uLLKK9ArKbg5E12z9jpUgIn2jH
	QXExrPE96fTe9RYPVjLXJ+Q5B6FtVUCv4n3uTX+eGEAIC15fuApFaa+2ZnSI5iTlcWFyuCSAT/r
	Vr0+Zp2JLk6ZP2TvGXa2O+L6F1MdraCaObGMk0ZA6IfHBvSaFoLsjK2G4pG01TfBmRYRr4QxIj+
	ljxRscGRXyIcS5vmXY8n5wisY4mB93eKr2LEfeBt1hVdg==
X-Received: by 2002:a17:902:fdaf:b0:2d8:d4d0:792b with SMTP id d9443c01a7336-2d8d4d079a6mr348893415ad.15.1788248989697;
        Tue, 01 Sep 2026 00:49:49 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:8cf:6df0:9c4e:f5e1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75988b699sm48142515ad.59.2026.09.01.00.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:49:48 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/8] arm64: mediatek: Chromebook trackpad supply fixes
Date: Tue,  1 Sep 2026 15:49:18 +0800
Message-ID: <20260901074930.764550-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_004950_979155_F52E4D44 
X-CRM114-Status: GOOD (  28.34  )
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

This is v6 of my Chromebook trackpad supply fixes and optimization
series.

Changes since v5:
- Patch 1 (regulator)
  - Correctly assign wait_us to all bulk consumers (Sashiko)
  - Check _regulator_is_enabled() > 0 to check for enabled regulators
    (Sashiko)
  - Lock regulator_dev on final _regulator_is_enabled() check in
    regulator_register() (Sashiko)
  - Make it clear that _regulator_is_enabled_recursive() assumes that
    supplies have been resolved (local AI review)
  - Consider supply's last_on timestamp for regulators that are already
    enabled or have no .is_enabled() ops (local AI review)
- Added noautosel tag for some patches
- Added patch to pass component probe success or not to cleanup callback
  (patch 5)
- Only defer regulator disable if a device was found (patch 6)
- Link to v5:
  https://lore.kernel.org/all/20260825041628.988369-1-wenst@chromium.org/

Changes since v4:
- Made regulator core try to set last_on timestamp for regulators that
  were left on by reset default or firmware, but not enabled in kernel
- Dropped two patches that were merged
- Link to v4:
  https://lore.kernel.org/all/20260811122011.3539250-1-wenst@chromium.org/

Changes since v3:
- Added __private modified to regulator_bulk_data.wait_us field and
  switched to ACCESS_PRIVATE accessor for the field (Andy)
- Moved wait outside regulator lock scope (Sashiko)
- Moved "remaining" value assignment closer to conditional (Andy)
- Fixed variable unit name in regulator_enable_and_wait() prototype
  (Andy, Sashiko)
- Added commit message section showing average delay needed for I2C
  prober (patch 6) (Andy)
- Link to v3:
  https://lore.kernel.org/all/20260721075226.2347933-1-wenst@chromium.org/

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

Patch 2 adds the correct enable delay after enabling the supply regulator
for the Elan trackpad to initialize. This uses the new "enable and wait"
regulator enable function.

Patch 3 applies the same logic of skipping the power on delay to the
i2c-hid-of driver.

Patch 4 applies the same logic of skipping the power on delay to the
i2c OF component prober library.

Patch 5 makes the I2C component prober let the cleanup callback know
whether a component was found and enabled. Needed for the next patch
to only delay calling regulator_disable() if a component was enabled.

Patch 6 adds a delay between when the device node found is enabled and
when regulator_disable() is called. This gives an asynchronously probing
driver some time to increment the enable count of their regulator
reference, thus keeping the device operational and allowing the driver
to skip the initialization delay.

Patch 7 removes the "always-on" setting from the trackpad supply for
Elm / Hana and adds the correct delay to the second source trackpad.
This corrects the hardware description. Should not be backported without
the other driver patches.

Patch 8 adds the supply and power on delay properties to the Synaptics
trackpad on the Spherion device. Combined with previous driver changes
this should cause no actual functional changes or delays.


Please take a look. Patches 2, 3, and 4 have build time dependencies
on patch 1. I suggest placing patch 1 on a separate immutable branch
or tag for the other maintainers to pull in. The three patches all have
different maintainers.

The DT changes must go in after all the driver changes land, especially
patch 2 that adds delays to the Elan trackpad driver. Otherwise the user
could potentially end up with a non-functional trackpad on the device.


Thanks
ChenYu

[1] https://lore.kernel.org/all/20241001093815.2481899-1-wenst@chromium.org/

Chen-Yu Tsai (8):
  regulator: core: Add "enable and wait" functions
  Input: elan_i2c - Wait for initialization after enabling regulator
    supply
  HID: i2c-hid-of: skip post-power-on delay if powered on sufficiently
    long
  i2c: of-prober: skip post-power-on delay if powered on sufficiently
    long
  i2c: of-prober: Let cleanup op know if a device was found
  i2c: of-prober: Defer regulator_disable() on successful probe in
    simple helper
  arm64: dts: mediatek: mt8173-elm-hana: Unmark trackpad supply as
    always-on
  arm64: dts: mediatek: mt8192-asurada-spherion: Add Synaptics
    trackpad's supply

 .../boot/dts/mediatek/mt8173-elm-hana.dtsi    |   8 +-
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  |   1 -
 .../mediatek/mt8192-asurada-spherion-r0.dts   |   2 +
 drivers/hid/i2c-hid/i2c-hid-of.c              |   9 +-
 drivers/i2c/i2c-core-of-prober.c              |  34 +++--
 drivers/input/mouse/elan_i2c_core.c           |   7 +-
 drivers/regulator/core.c                      | 129 ++++++++++++++++--
 include/linux/i2c-of-prober.h                 |   7 +-
 include/linux/regulator/consumer.h            |  21 ++-
 include/linux/regulator/driver.h              |   2 +
 10 files changed, 172 insertions(+), 48 deletions(-)

-- 
2.55.0.897.gb25b4bd76c-goog


