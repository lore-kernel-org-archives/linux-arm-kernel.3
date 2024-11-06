Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F10FBD44D41
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 10:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Nn3uDnF9qvSC3G/L+i9nVURzf3de2BZ+v2gUv1fPvoc=; b=TbTlgiamI+VXXT7uckVHF71v/8
	3dXE5uKiKm8LuqbyjRu/HZhx0mVBOU17vVgd8IDy8AR1jwoCTWun9zbA5aT9ZNYmCA2t1u5Srfq9O
	7PahpwKIlGI2tbB+xECkzfeFMceFOfPdnmt7jHrrrDTPQrg8AfRx3uXsyvEjORPZsdLMi1TK7jhB7
	bq2W4Ef4iJNwDkjDY3uGAn1jYr2a98ryV+q00ckEjVW8xHZks3EANmqkbZ5CnTuUHo9yi0vCnzeL/
	3QXrY9Q1KT8+qR445zSuyBgU4dcYavXOe0Pv6+vyVneSmI/2YHLI6G+RZoQ/iJbKkgTccsBqk6RpP
	munaLSwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8ctM-00000002fbE-38F4;
	Wed, 06 Nov 2024 10:04:00 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8cQQ-00000002YRT-3GBP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 09:34:09 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-71e5a62031aso5264218b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 01:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730885646; x=1731490446; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nn3uDnF9qvSC3G/L+i9nVURzf3de2BZ+v2gUv1fPvoc=;
        b=Y84pIqblaOroKuoaqB9dpzA0whqyYxYMgIL6jcxhm9jTyzk0ZjG6kcPTKU/CHin0qj
         DMqafy+DYufxRahOVSR5vptKWwjLha2VBpDQ6CCo33cCU8aHEENDjqE29bdpItu/niND
         VOdN9qFXVzTQUXzEkzSLtCagK8mrs6lR+Qodw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730885646; x=1731490446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nn3uDnF9qvSC3G/L+i9nVURzf3de2BZ+v2gUv1fPvoc=;
        b=DpNcZCHhZM0SdA+U/OExLtqpzZK9rPOnIGM6enhXwPkn1pgrANIHtvKn8TwoTKagpA
         NvsKB5G+Wv6AeBogFgV5OiRRfid3xz2r9/yp8GN9AtGVY1uQVKQvGsJtNE03nsU3nYli
         Uvvi+WwQgN290wiqe1m8eEjkYoOPb/tuDuHsn3cRrthzPdbf8LOUk9j04BTy65fnojnB
         bpZPcN4dRdoMuNZuOMPS2maQCEWgmgSIp7nGg022dLPH91Zm/gDmednz9bFTr8pIDW4B
         Q4NnNEy9RvO60JilE4Lsr30l2N2lQ8fil2x0KgrkAUZBLsyaRbcgA5SAIXI/NnraoIVn
         xlvg==
X-Forwarded-Encrypted: i=1; AJvYcCVq2M0iGz050MT99rkObJFIJc5ZIcNFz1NtmOGgrCJiLHHQvluxuPcKgDFwBlLfqwkPX0+o0TVAAk/t9x5Qer6E@lists.infradead.org
X-Gm-Message-State: AOJu0YxECNXsA3815WbfjLkbUccGLkl1T/xb787GfA+rTGXVjtzMMzGV
	NlSZqadVPI7wTuZdkWgQR1+EEXnD1UyfUTN9m/Q71zLKXWC8tYU+vCGbHFOQqg==
X-Google-Smtp-Source: AGHT+IGtq9GuDutpNt3MbGfMWT53SZGqUSabiGOYCIExtyVcMAfdUCNTwUojXT5rsKQhwGB/2LIiPg==
X-Received: by 2002:a05:6a21:3397:b0:1db:e536:158e with SMTP id adf61e73a8af0-1dbe53622ebmr11562956637.22.1730885645624;
        Wed, 06 Nov 2024 01:34:05 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:93fe:1d68:b50:3213])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057062b8sm91478665ad.63.2024.11.06.01.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 01:34:05 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	Andrey Skvortsov <andrej.skvortzov@gmail.com>
Subject: [PATCH v11 0/7] platform/chrome: Introduce DT hardware prober
Date: Wed,  6 Nov 2024 17:33:27 +0800
Message-ID: <20241106093335.1582205-1-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.199.ga7371fff76-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_013406_926150_5928656A 
X-CRM114-Status: GOOD (  33.86  )
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

This is v11 of my "of: Introduce hardware prober driver" series.
v11 adds a missing include of linux/types.h for the |bool| type,
as reported by Andrey.

To Wolfram:
Everything is fully reviewed and ready to be merged. There is also
no need to wait for the end of the merge window if you also merge
in the immutable regulator tag [1]. Not sure if you want to also
take the last DT patch though. If that's the case you would likely
still have to wait for the end of the merge window.

Changes since v10:
- Added include of linux/types.h for type |bool| in i2c-of-prober.h

The older changelog entries have been moved to the bottom of the cover
letter.

For the I2C component (touchscreens and trackpads) case from the
original series, the hardware prober driver finds the particular
class of device in the device tree, gets its parent I2C adapter,
and tries to initiate a simple I2C read for each device under that
I2C bus. When it finds one that responds, it considers that one
present, marks it as "okay", and returns, letting the driver core
actually probe the device.

This works fine in most cases since these components are connected
via a ribbon cable and always have the same resources. The prober
will also grab these resources and enable them.

The other case, selecting a display panel to use based on the SKU ID
from the firmware, hit a bit of an issue with fixing the OF graph.
It has been left out since v3.

Patch 1 adds of_changeset_update_prop_string(), as requested by Rob.

Patch 2 adds for_each_child_of_node_with_prefix(), as suggested by Andy.

Patch 3 implements probing the I2C bus for presence of components as
a hookable helper function in the I2C core.

Patch 4 implements regulator supply support as a set of simple helpers
for the I2C component prober.

Patch 5 implements GPIO support for the I2C component prober simple
helpers.

Patch 6 adds a ChromeOS specific DT hardware prober. This initial
version targets the Hana Chromebooks, probing its I2C trackpads and
touchscreens.

Patch 7 modifies the Hana device tree and marks the touchscreens
and trackpads as "fail-needs-probe", ready for the driver to probe.


The regulator parts were merged separately with an immutable tag [1]. Rob
already gave his Reviewed-by for the OF bits, and I assume he is OK with
them going through a different branch. So I believe it is fine for
Wolfram to take all the patch except the last one through the I2C tree.
The last DTS patch can be merged through the MediaTek tree once the
driver bits land.


Thanks
ChenYu


[1] https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git/tag/?h=regulator-of-get-optional

Changes since v9:
- Picked up review-bys
- Added inclusion of stddef.h for NULL
- Added "noautosel" stable tag to the device tree patch

Changes since v8:
- Link to v8:
  https://lore.kernel.org/all/20241008073430.3992087-1-wenst@chromium.org/
- Patch "i2c: core: Remove extra space in Makefile" was merged and
  dropped from this version
- Patch 3 "i2c: Introduce OF component probe function"
  - Added missing include of <linux/kconfig.h> to i2c-of-prober.h
  - Expanded description of i2c_of_probe_ops::enable to mention that
    returning -EPROBE_DEFER is valid (Doug)
  - Reworded descrption of i2c_of_probe_ops::cleanup_early to avoid
    confusion with i2c_of_probe_ops::enable (Doug)
  - Reworked i2c_of_probe_get_i2c_node() to return NULL on failure,
    matching most functions that return |struct device_node *|.
- Patch 4 "i2c: of-prober: Add simple helpers for regulator support"
  - Picked up Doug's reviewed-by
- Patch 5 "i2c: of-prober: Add GPIO support to simple helpers"
  - Moved |struct gpio_desc| forward declaration before |struct regulator|
    (Andy)
  - Dropped GPIO descriptor validity check from
    i2c_of_probe_simple_disable_gpio(); GPIO functions check it (Andy)
  - Dropped comment from i2c_of_probe_simple_disable_gpio() (Doug)
  - Reworded comment in i2c_of_probe_simple_cleanup() (Doug)
  - Picked up Doug's reviewed-by
- Patch 6 "platform/chrome: Introduce device tree hardware prober"
  - Added trailing commas on last field in struct variable declarations
    (Andy)
  - Added macros wrapping chromeos_i2c_probe_dumb_* and
    chromeos_i2c_probe_simple_*_cfg variable declarations (Andy)
  - Split up hw_prober_platforms into one field per line (Andy)
  - Picked up Doug's reviewed-by
- Patch 7 "arm64: dts: mediatek: mt8173-elm-hana: Mark touchscreens and
	   trackpads as fail"

Changes since v7:
- Link to v7:
  https://lore.kernel.org/all/20240911072751.365361-1-wenst@chromium.org/
- Patch 2 "of: base: Add for_each_child_of_node_with_prefix()"
  - Collected Rob's Reviewed-by
- Patch 3 "i2c: core: Remove extra space in Makefile"
  - Collected Andi's Reviewed-by
- Patch 4 "i2c: Introduce OF component probe function"
  - Dropped log level of "enabling component" to debug
  - Dropped file name from header file
  - Reverted to __free() cleanup for i2c bus node
  - Corrected "failed-needs-probe" to "fail-needs-probe" in commit message
  - Fixed incorrectly positioned period ('.') in commit message
  - Expanded description of i2c_of_probe_component()
  - Expanded comment explaining check for "available" devices to note that
    if such a device is found then the i2c probe function becomes a no-op
  - Simplified check for "available" devices for-each loop
  - Expanded description of @free_resources_early callback to explicitly
    state that it is not called if no working components are found
  - Dropped !cfg check
  - Replaced "fail" with "fail-needs-probe" in i2c_of_probe_component()
    kernel doc
  - Combined callbacks (.get_resources with .enable; .cleanup with
    .free_resources_late); .free_resources_early renamed to .cleanup_early
- Patch 5 "i2c: of-prober: Add simple helpers for regulator support"
  - Reworded comment in i2c_of_probe_simple_get_supply() as suggested
    (Andy)
  - Dropped mention of time unit in struct i2c_of_probe_simple_opts
    kernel doc (Andy)
  - Added mention of common GPIO line usages ("enable" or "reset") in I2C
    OF component prober kernel doc (Doug)
  - Added check for non-zero delay before msleep() (Doug)
  - Combined callback helpers (.get_resources with .enable; .cleanup with
    .free_resources_late)
- Patch 6 "i2c: of-prober: Add GPIO support to simple helpers"
  - Dropped mention of time unit in struct i2c_of_probe_simple_opts
    kernel doc (Andy)
  - Added check for non-zero delay before msleep() (Doug)
  - Simplified GPIO name check and reverse conditional branches (Andy)
  - Added description about the supported power sequence
  - Switched GPIO usage to logical levels (Doug)
    - Changed some variable names and comments to fit
  - Added description of power sequence to struct i2c_of_probe_simple_opts
    (Doug)
  - Added comment saying i2c_of_probe_simple_put_gpiod() might be no-op
    (Doug)
  - Combined callbacks (.get_resources with .enable; .cleanup with
    .free_resources_late); renamed i2c_of_probe_simple_free_res_early() to
    i2c_of_probe_simple_cleanup_early()
- Patch 7 "platform/chrome: Introduce device tree hardware prober"
  - Corrected Makefile item order
  - Replaced "failed-needs-probe" with "fail-needs-probe" in commit message
  - Added include of "linux/of.h" for of_machine_is_compatible()
  - Switched to simple probe helpers for trackpads on Hana
- Patch 8 "arm64: dts: mediatek: mt8173-elm-hana: Mark touchscreens and
	   trackpads as fail"
  - Mark touchscreen@40 as "fail-needs-probe" as well

Changes since v6:
- Link to v6:
  https://lore.kernel.org/all/20240904090016.2841572-1-wenst@chromium.org/
- Dropped patch "gpiolib: Add gpio_property_name_length()"
  No longer needed
- Dropped patch "regulator: Move OF-specific regulator lookup code to of_regulator.c"
  Already merged
- Patch 2 "of: base: Add for_each_child_of_node_with_prefix()"
  - Changed helper name to "for_each_child_of_node_with_prefix()"
- Patch 4 "regulator: Add of_regulator_get_optional() for pure DT regulator lookup"
  - Was "regulator: Do pure DT regulator lookup in of_regulator_bulk_get_all()"
  - Changed reference [1] to Link: tag
  - Rebased on top of commit 401d078eaf2e ("regulator: of: Refactor
    of_get_*regulator() to decrease indentation")
  - Exported of_regulator_get_optional()
  - Changed commit message to focus on "of_regulator_get_optional()"
  - Dropped change to of_regulator_bulk_get_all()
- Patch 5 "i2c: core: Remove extra space in Makefile"
  - Collected Andy's Reviewed-by
- Patch 6 "i2c: Introduce OF component probe function"
  - Correctly replaced for_each_child_of_node_scoped() with
    for_each_child_of_node_with_prefix()
  - Added namespace for exported symbols
  - Made the probe function a framework with hooks
  - Split out a new header file
  - Added MAINTAINERS entry
  - Reworded kernel-doc
  - Dropped usage of __free from i2c_of_probe_component() since error
    path cleanup is needed anyway
- Patch 7 "i2c: of-prober: Add simple helpers for regulator support"
  - Moved change of of_get_next_child_scoped() to
    of_get_next_child_with_prefix() to previous patch
  - Restructured into helpers for the I2C OF component prober
  - Reduced to only handle one regulator
  - Commit message updated
- Patch 8 "i2c: of-prober: Add GPIO support to simple helpers"
  - Restructured into helpers for the I2C OF component prober
  - Reduced to only handle one GPIO
  - Set GPIO to input on (failure) cleanup
  - Updated commit message
- Patch 9 "platform/chrome: Introduce device tree hardware prober"
  - Adapted to new I2C OF prober interface
  - Collected Acked-by tag

Changes since v5:
- Link to v5:
  https://lore.kernel.org/all/20240822092006.3134096-1-wenst@chromium.org/
- Patch 1 "of: dynamic: Add of_changeset_update_prop_string"
  - Collected Rob's reviewed-by
- Patch 2 "of: base: Add for_each_child_of_node_with_prefix_scoped()"
  - New patch
- Patch 3 "regulator: Move OF-specific regulator lookup code to of_regulator.c"
  - Fix kerneldoc format of of_regulator_dev_lookup()
  - Fix stub compile error for !CONFIG_OF in drivers/regulator/internal.h
- Patch 4 "regulator: Split up _regulator_get()"
  - Fixed kerneldoc "Return" section format for _regulator_get_common()
  - Slightly reworded return value description
- Patch 5 "regulator: Do pure DT regulator lookup in of_regulator_bulk_get_all()"
  - Used "dev_of_node(dev)" instead of "dev->of_node"
  - Replaced "dev_printk" with "dev_printk()" in kerneldoc mentions
  - Fixed kerneldoc "Return" section format for of_regulator_get_optional()
  - Fix @np parameter name in of_regulator_dev_lookup() kerneldoc
- Patch 6 "gpiolib: Add gpio_property_name_length()"
  - Changed function name to "gpio_get_property_name_length()"
  - Changed argument name to "propname"
  - Clarified return value for "*-<GPIO suffix>" case
  - Reworked according to Andy's suggestion
  - Added stub function
- Patch 7 "i2c: core: Remove extra space in Makefile"
  - New patch
- Patch 8 "i2c: Introduce OF component probe function"
  - Fixed indent in Makefile
  - Split regulator and GPIO TODO items
  - Reversed final conditional in i2c_of_probe_enable_node()
- Patch 9 "i2c: of-prober: Add regulator support"
  - Split of_regulator_bulk_get_all() return value check and explain
    "ret == 0" case
  - Switched to of_get_next_child_with_prefix_scoped() where applicable
  - Used krealloc_array() instead of directly calculating size
  - copy whole regulator array in one memcpy() call
  - Drop "0" from struct zeroing initializer
  - Split out regulator helper from i2c_of_probe_enable_res() to keep
    code cleaner when combined with the next patch
  - Added options for customizing power sequencing delay
  - Rename i2c_of_probe_get_regulator() to i2c_of_probe_get_regulators()
  - Add i2c_of_probe_free_regulator() helper
- Patch 10 "i2c: of-prober: Add GPIO support"
  - Renamed "con" to "propname" in i2c_of_probe_get_gpiod()
  - Copy string first and check return value of strscpy() for overflow in
    i2c_of_probe_get_gpiod()
  - Add parenthesis around "enable" and "reset" GPIO names in comments
  - Split resource count debug message into two separate lines
  - Split out GPIO helper from i2c_of_probe_enable_res() to keep code
    cleaner following the previous patch
  - Adopted options for customizing power sequencing delay following
    previous patch
- Patch 11 "platform/chrome: Introduce device tree hardware prober"
  - Adapt to new i2c_of_probe_component() parameters
- Patch 12 "arm64: dts: mediatek: mt8173-elm-hana: Mark touchscreens and
	    trackpads as fail"
  - None

See v5 cover letter for previous change logs.

Chen-Yu Tsai (7):
  of: dynamic: Add of_changeset_update_prop_string
  of: base: Add for_each_child_of_node_with_prefix()
  i2c: Introduce OF component probe function
  i2c: of-prober: Add simple helpers for regulator support
  i2c: of-prober: Add GPIO support to simple helpers
  platform/chrome: Introduce device tree hardware prober
  arm64: dts: mediatek: mt8173-elm-hana: Mark touchscreens and trackpads
    as fail

 MAINTAINERS                                   |   8 +
 .../boot/dts/mediatek/mt8173-elm-hana.dtsi    |  14 +
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  |   4 +-
 drivers/i2c/Makefile                          |   1 +
 drivers/i2c/i2c-core-of-prober.c              | 415 ++++++++++++++++++
 drivers/of/base.c                             |  35 ++
 drivers/of/dynamic.c                          |  44 ++
 drivers/platform/chrome/Kconfig               |  11 +
 drivers/platform/chrome/Makefile              |   1 +
 .../platform/chrome/chromeos_of_hw_prober.c   | 154 +++++++
 include/linux/i2c-of-prober.h                 | 140 ++++++
 include/linux/of.h                            |  13 +
 12 files changed, 838 insertions(+), 2 deletions(-)
 create mode 100644 drivers/i2c/i2c-core-of-prober.c
 create mode 100644 drivers/platform/chrome/chromeos_of_hw_prober.c
 create mode 100644 include/linux/i2c-of-prober.h

-- 
2.47.0.199.ga7371fff76-goog


