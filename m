Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B4FC7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 10:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nb8kcE8Vj7pHO8AvIl8n8fa9esDGC6u2N5gjLDQTFag=; b=C4IDnTLLBW9/I8dH31WLFvqAuh
	ugjoWb/AndyXaFDVX6n+roz5+cPnoV8GqY/24vhxCZEp3rVVwy5OqsrcMvFllA52N+5LMidepO+yR
	1/mdO/50x+mcyLjjcu6vA1h2yV0rf+txAgL3nVYI0F/GwqiSTKa4YJSCT0BWYQ7gsP5AqimdeKhIR
	AnTAKYGs/xPi+QDSsLnO1YrASJ4tvDVYqky/0Cg3IEDCSaOTEX1aDQja3yLQBBbCJcMmfN4fXqCQ7
	huvNuPJFq22SPhw1cv51VKVGuYgxeA0noUjgl3Q848E1MtilDld9JN+91v3ncXml88R54wttSQ8iG
	wcn72bmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRpig-00000009ifj-0btz;
	Wed, 18 Jun 2025 10:08:38 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRpZr-00000009gHx-1GlC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 09:59:32 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-607ea238c37so14133361a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 02:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750240769; x=1750845569; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nb8kcE8Vj7pHO8AvIl8n8fa9esDGC6u2N5gjLDQTFag=;
        b=UJVkuscFJh6f2d2Lk2RwCQ+nceuApNfsiHbdewcpTC1RL7iWPH9hO+Jq1fcZTD6cH+
         9mWZ1gFNNZwmx838JHi25tnsFLaOeByzL/FW8kczng09MueScOUliWhV+cHL5YXr/cjj
         k9OGg2gje+xvam9h9eLJC68r+rkyftsvZuM0mmXGT9FZx/YkS19f2XW9dWteRb/lYVbN
         SoRYtbye6jwCMP15PaIy3vBMbleycc1N8I/j1GPUCpSXKRFZ6wx6iAezOX4x0NDbNYto
         SDNALMGhPc/W6ePbVOwWIb0ynX/nLaA0LdlMpIQ+4BUNCE5hs6QsCZzBQyhrjL1VbcCU
         gNDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750240769; x=1750845569;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nb8kcE8Vj7pHO8AvIl8n8fa9esDGC6u2N5gjLDQTFag=;
        b=j72aF1iyyYbZvR0KkgoZ3usF5gFkjTqpZZ9VjSr4svqY84h2n+Wx9p+IZzvKEhdRMi
         vJA6nvDFdkG16QYapabuXJ4xrUysdSfAywyEDxmkMPMjqMicovDIWGKZ/6VvfyBUwUPk
         lDGS/uF3NK9s/saM7Mhl+ddIABa3ohh8P1StfbUQBZ94jSFnBJTzB6D3FDejUQFLl6HE
         oQfRPdv+BUbST64B6GUSgCyOdMfVQ5izoLu3GKix2WO+RY98tU5+NnI/3I1/qPGWPmPk
         hpFIL6kFht3bTVBdjrPGcV2uQXARM3tAYhMYu8Ce7Do6kg4WWrBMCXkdiNoizT8xuPDZ
         pobg==
X-Forwarded-Encrypted: i=1; AJvYcCXM5RlBwx1XYeSALhu+FQbwGzyqodtqCDf46zh/5g8RETQxal3+g55xX9cSYjC/Xtvk9rnwniAsrlHAvDD5mOb0@lists.infradead.org
X-Gm-Message-State: AOJu0YyeJNQbDB37MSuXFY0k+95y4DYfZI7aG0RWPnVnZ2i5r1zCTAt9
	ML8p2+tUKKpOx4qcp0bQULdBpfOg3Hm8Pjyki+xzFFZ9igtZauP0reQL
X-Gm-Gg: ASbGncuJNA5LxDnb9dbtE82M/NmIJBU2jM61oEJ77/IIZxEL/A5wug95u3uqFo4ijoU
	LxvQTzBu7DVCqEN5j1WwzlHqW3S7WkWzn7h0wo5EhE7kzvgVI9VBrIDeaR9+i18w4Pz9putyiuA
	j9YvHNIU4L6YNbMwApzwL4qBa4iL2sDfvRGsQVIvRolMFJyy6gYnWgoKTWc992+3hgmX7HDXpyQ
	FBkT0FfJ0PPEdA7do2SG6UlDwJ3OI2bd2VGxN7HloDJwWqJ7zYWx/ah6wwBu5InmWZ4HRfhiVF5
	4Nrx//mHRsWpaH1QAH0BNHZjkWpGsD+cVdTj4A70TbdTXlvLlWg4XdzTU5FJdjiZaYL2nOtRIQY
	=
X-Google-Smtp-Source: AGHT+IHI0+XDA8Gi5KOVg0qd6P6d4IGRmPoZztS7Ni3ftJtU4X+e7N5hqKY38i8kTJsON2ZOblp4Bg==
X-Received: by 2002:a50:d507:0:b0:608:f973:1bd8 with SMTP id 4fb4d7f45d1cf-608f9731fc3mr9377973a12.34.1750240769014;
        Wed, 18 Jun 2025 02:59:29 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a93b03sm9384691a12.54.2025.06.18.02.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:59:28 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org (open list:MAXIM GMSL2 SERIALIZERS AND DESERIALIZERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM:Keyword:(devm_)?gpio_(request|free|direction|get|set)),
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v4 00/19] media: i2c: add Maxim GMSL2/3 serializer and deserializer drivers
Date: Wed, 18 Jun 2025 12:58:36 +0300
Message-ID: <20250618095858.2145209-1-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_025931_349253_D64591F7 
X-CRM114-Status: GOOD (  27.13  )
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

This series adds new drivers for multiple Maxim GMSL2 and GMSL3 devices,
replacing the few GMSL2 drivers already in upstream, and introducing a
common framework that can be used to implement such GMSL chips, which
avoids code duplication while also adding support for previously
unsupported features.

While the normally acceptable and polite way would be to extend the
current mainline drivers, the choice was made here to add a totally new
set of drivers. The current drivers support only a small subset of the
possible features, and only a few devices, so the end result after
extending them would in any case be essentially fully rewritten, new
drivers.

This series depends on support for internal pads, for which a patch has
been added.

The previous version is at:
https://lore.kernel.org/lkml/20250512212832.3674722-1-demonsingur@gmail.com

The following deserializers are supported:
 * MAX96712 (already exists in staging)
 * MAX96714 (already exists)
 * MAX96714F (already exists)
 * MAX96714R (GMSL2)
 * MAX96716 (GMSL2)
 * MAX96724 (already exists as part of existing MAX96712 driver)
 * MAX96724F (GMSL2)
 * MAX96724R (GMSL2)
 * MAX9296A (GMSL2)
 * MAX96792A (GMSL3)

The following serializers are supported:
 * MAX96717 (already exists)
 * MAX9295A (GMSL2)
 * MAX96793 (GMSL3)

Known backward compatibility breakages:
 * No default routing. Default routing has been intentionally ommitted
   as the devices support quite complex routing and it would be
   unfeasible to provide sane defaults for multi-link deserialziers.
   It is expected that userspace programs would set appropritate
   routing.

The following list enumerates new features that are supported by the
common framework and their respective chip-specific drivers:
 * Full Streams API support. Most deserializers have support for more
   than one link, and more than one PHY. Streams support allows
   configuration of routing between these links and PHYs.

 * .get_frame_desc() support. Both the serializers and deserializers
   implement this to query and provide frame descriptor data. This is
   used in features explained in-depth below.

 * .get_mbus_config() support. The deserializers implement this to allow
   upstream devices to query the link frequency of its pads.

 * Address translation with I2C ATR for the serializers.

 * I2C ATR translation - some deserializers cannot do muxing since I2C
   communication channel masking is not available per-link, and the only
   other way to select links is to turn them off, causing link resets.
   For such cases, I2C ATR is used to change the address of the
   serializers at probe time.

 * Automatic GMSL link version negotiation between GMSL3, GMSL2 6Gbps, GMSL2
   3Gbps.

 * Automatic stream id selection for deserializers which need serializers to
   stream on unique stream ids.

 * Automatic VC remapping on the deserializers. VCs are picked so that
   if they were unique on the sink pad, they will end up as unique on
   the source pad they are routed to too, prioritizing using the same
   VC ID as the sink pad, to facilitate the possibility of using tunnel
   mode.

 * Automatic pixel mode / tunnel mode selection. Tunnel mode is used
   when VC IDs do not need to be changed and all hardware supports
   tunnel mode, otherwise, pixel mode is used. The serializers are
   automatically switched between the two by using a private API.

 * Automatic double mode selection. In pixel mode, double mode can be
   used to pack two pixels into a single data unit, optimizing bandwidth
   usage. The serializers are automatically set up to support the double
   modes determined by the deserializers using a private API.

 * Automatic data padding. In pixel mode, if the data being transferred
   uses two different BPPs, data needs to be padded. The serializers
   automatically set this up depending on the configured double mode
   settings and incoming data types.

 * Logging. Both the deserializers and serializers implement the V4L2
   .log_status() ops to allow debugging of the internal state and
   important chip status registers.

 * PHY modes. Deserializer chips commonly have more than a single PHY.
   The firmware ports are parsed to determine the modes in which to
   configure the PHYs (2x4, 4x2, 1x4+2x2, 2x2+1x4, and variations using
   fewer lanes).

 * Serializer pinctrl. Serializers implement pinctrl to allow setting
   configs which would otherwise be inaccessible through GPIO: TX/RX via
   GMSL link, pull-up & pull-down (with strength), open-drain &
   push-pull, slew rate, RCLK pin selection.

 * TPG with selectable formats, resolutions and framerates for both
   serializers and deserializers.

The drivers have been tested on the following hardware combinations, but
further testing is welcome to ensure no / minimal breakage:
 * Raspberry Pi 5 + MAX9296A + 2xMAX96717 + 2xIMX219
 * Raspberry Pi 5 + MAX96714 + 1xMAX96717 + 1xIMX219
 * Raspberry Pi 5 + MAX96716A + 2xMAX96717 + 2xIMX219
 * Raspberry Pi 5 + MAX96712 + 4xMAX96717 + 4xIMX219
 * Raspberry Pi 5 + MAX96724 + 4xMAX96717 + 4xIMX219
 * Raspberry Pi 5 + MAX96792A + 1xMAX96793 + 1xMAX96717 + 2xIMX219
 * Raspberry Pi 5 + MAX96792A + 2xMAX96717 + 2xIMX219
 * Renesas V4H + MAX96712 + 2xMAX96717 + 2xIMX219

Analog Devices is taking responsibility for the maintenance of these
drivers and common framework, and plans to add support for new
broad-market chips on top of them.

Special thanks go to Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
for testing the drivers, helping debug and coming up with ideas /
implementations for various features.

V4:
 * max_des: fix infinite version loop
 * max_des: fix pipe link id when there are more pipes than links
 * max_des: implement setting pipe link
 * max_des: do not pass routing to phy update
 * max_des: move GMSL version strings to max_serdes
 * max_des: split finding existing VC remap from adding a new one
 * max_des: add tracking for in-use pipes
 * max_des: skip unused pipes when finding / setting pixel/tunnel mode
 * max_des: simplify remap code
 * max_des: split set_pipe_phy() into set_pipe_tunnel_phy()

 * max_ser: clean up i2c_xlates printing
 * max_ser: fix changing serializer address
 * max_ser: move non-continuous mode check into max96717 driver

 * max96724: use regmap_set_bits for STREAM_SEL_ALL
 * max96724: match surrounding indent for MAX96724_PHY1_ALT_CLOCK
 * max96724: fix setting invalid PHY to 1 when PHY 0 is in 4-lane mode
 * max96724: remove support for setting pipe phy from max96712
 * max96724: fix setting double mode on pipes 4-7
 * max96724: drop powerdown gpios

 * max96717: use gpio_chip's set_rv

 * max9296a: switch versions to unsigned int
 * max9296a: remove parantheses from MAX9296A_MIPI_PHY18/20
 * max9296a: fix printing of PHY packet counts
 * max9296a: fix phy_hw_ids size

 * remove usage of cammel case in defines
 * move field_get/prep to max_serdes.h
 * rework stream id setup
 * rework tunnel/pixel mode finding
 * rework bpps retrieval
 * pass whole subdev state around
 * add helper for retrieving a route's hw components / frame desc
 * update pipe enable based on active routes
 * add support for tunnel-only chips and VC remaps in tunnel mode
 * simplify max_get_streams_masks()
 * add support for TPG

V3:
 * dt-bindings: drop reflow text patches

 * dt-bindings: max96717: move pinctrl configuration into main file
 * dt-bindings: max96717: allow a single level of pins configuration
 * dt-bindings: max96717: use regex for matching pins nodes
 * dt-bindings: max96717: drop extra allOf in pinctrl configuration
 * dt-bindings: max96717: fix i2c-atr channel name regex
 * dt-bindings: max96717: limit pinctrl functions to gpio / rclkout
 * dt-bindings: max96717: limit pins for gpio / rclkout
 * dt-bindings: max96717: add description for bias-pull-up/down
 * dt-bindings: max96717: require pins and function properties
 * dt-bindings: max96717: turn single compatible strings into an enum

 * dt-bindings: max9296a: include indices in port descriptions
 * dt-bindings: max9296a: remove property-less schema from input ports
 * dt-bindings: max9296a: use ATR for MAX96716A too, removing MUX entirely

 * dt-bindings: max96712: include indices in port descriptions
 * dt-bindings: max96712: deprecate enable-gpios in favor of powerdown-gpios
 * dt-bindings: max96712: switch from MUX to ATR

 * dt-bindings: max96714: add support for MAX96714R

 * max_des: fix POC NULL check
 * max_des: remove index var in POC enable
 * max_des: fix writing empty remaps
 * max_des: skip mode setting in tunnel mode
 * max_des: remove a duplicate source->sd NULL check
 * max_des: set pipe tunnel mode even for disabled links

 * max_ser: apply TX ID changes irrespective of serializer ID

 * max9296a: fix typo in BACKTOP22
 * max9296a: make register macros more consistent
 * max9296a: switch MAX96716 from MUX to ATR
 * max9296a: deduplicate max9296a_phy_id() logic
 * max9296a: use proper PHY id in remaps
 * max9296a: fix DPLL reset clear
 * max9296a: limit MAX96714F to GMSL2 3Gbps
 * max9296a: add support for MAX96714R
 * max9296a: do not write GMSL3 link select registers in GMSL2 devices
 * max9296a: use field_prep when setting RX_RATE
 * max9296a: simplify setting SEL_STREAM for MAX96714
 * max9296a: max96716_set_pipe_phy -> max96716a_set_pipe_phy
 * max9296a: fix off-by-one in lane polarity when using
   polarity_on_physical_lanes

 * max96724: fix typo in BACKTOP22
 * max96724: switch from MUX to ATR
 * max96724: add support for powerdown GPIO
 * max96724: remove support for tunneling from MAX96712
 * max96724: only set tunnel-related bits when in tunnel mode
 * max96724: add support for MAX96724F/R
 * max96724: oneshot reset links after link selection

 * remove GMSL2 version defaults, set all supported versions explicitly
 * reorder GMSL versions to start from 0
 * add support for GMSL2 3Gbps
 * support GMSL version finding for devices using MUX / GATE
 * add support for deserializers which don't have individual control
   of each link's GMSL version
 * add support for deserializers that need unique stream ids across all
   serializers
 * select_link_version -> set_link_version
 * select_resets_link -> use_atr

V2:
 * add missing compatible for MAX96717F
 * fix embarrassing dt-bindings mistakes
 * move MAX9296A/MAX96716/MAX96792A to a separate file as they have two
   links / PHYs, and adding those conditionally seems impossible

Cosmin Tanislav (18):
  dt-bindings: media: i2c: max96717: add myself as maintainer
  dt-bindings: media: i2c: max96717: add support for I2C ATR
  dt-bindings: media: i2c: max96717: add support for pinctrl/pinconf
  dt-bindings: media: i2c: max96717: add support for MAX9295A
  dt-bindings: media: i2c: max96717: add support for MAX96793
  dt-bindings: media: i2c: max96712: add myself as maintainer
  dt-bindings: media: i2c: max96712: use pattern properties for ports
  dt-bindings: media: i2c: max96712: add support for I2C ATR
  dt-bindings: media: i2c: max96712: add support for POC supplies
  dt-bindings: media: i2c: max96712: add support for MAX96724F/R
  dt-bindings: media: i2c: max96714: add myself as maintainer
  dt-bindings: media: i2c: max96714: add support for MAX96714R
  dt-bindings: media: i2c: add MAX9296A, MAX96716A, MAX96792A
  media: i2c: add Maxim GMSL2/3 serializer and deserializer drivers
  arm64: defconfig: disable deprecated MAX96712 driver
  staging: media: remove MAX96712 driver
  media: i2c: remove MAX96717 driver
  media: i2c: remove MAX96714 driver

Sakari Ailus (1):
  media: mc: Add INTERNAL pad flag

 .../bindings/media/i2c/maxim,max9296a.yaml    |  242 ++
 .../bindings/media/i2c/maxim,max96712.yaml    |   70 +-
 .../bindings/media/i2c/maxim,max96714.yaml    |    6 +-
 .../bindings/media/i2c/maxim,max96717.yaml    |  160 +-
 .../media/mediactl/media-types.rst            |    8 +
 MAINTAINERS                                   |   13 +-
 arch/arm64/configs/defconfig                  |    1 -
 drivers/media/i2c/Kconfig                     |   34 +-
 drivers/media/i2c/Makefile                    |    3 +-
 drivers/media/i2c/max96714.c                  | 1024 ------
 drivers/media/i2c/max96717.c                  | 1103 ------
 drivers/media/i2c/maxim-serdes/Kconfig        |   53 +
 drivers/media/i2c/maxim-serdes/Makefile       |    6 +
 drivers/media/i2c/maxim-serdes/max9296a.c     | 1338 +++++++
 drivers/media/i2c/maxim-serdes/max96717.c     | 1647 +++++++++
 drivers/media/i2c/maxim-serdes/max96724.c     | 1155 ++++++
 drivers/media/i2c/maxim-serdes/max_des.c      | 3108 +++++++++++++++++
 drivers/media/i2c/maxim-serdes/max_des.h      |  152 +
 drivers/media/i2c/maxim-serdes/max_ser.c      | 2032 +++++++++++
 drivers/media/i2c/maxim-serdes/max_ser.h      |  144 +
 drivers/media/i2c/maxim-serdes/max_serdes.c   |  415 +++
 drivers/media/i2c/maxim-serdes/max_serdes.h   |  166 +
 drivers/media/mc/mc-entity.c                  |   10 +-
 drivers/staging/media/Kconfig                 |    2 -
 drivers/staging/media/Makefile                |    1 -
 drivers/staging/media/max96712/Kconfig        |   14 -
 drivers/staging/media/max96712/Makefile       |    2 -
 drivers/staging/media/max96712/max96712.c     |  487 ---
 include/uapi/linux/media.h                    |    1 +
 29 files changed, 10702 insertions(+), 2695 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml
 delete mode 100644 drivers/media/i2c/max96714.c
 delete mode 100644 drivers/media/i2c/max96717.c
 create mode 100644 drivers/media/i2c/maxim-serdes/Kconfig
 create mode 100644 drivers/media/i2c/maxim-serdes/Makefile
 create mode 100644 drivers/media/i2c/maxim-serdes/max9296a.c
 create mode 100644 drivers/media/i2c/maxim-serdes/max96717.c
 create mode 100644 drivers/media/i2c/maxim-serdes/max96724.c
 create mode 100644 drivers/media/i2c/maxim-serdes/max_des.c
 create mode 100644 drivers/media/i2c/maxim-serdes/max_des.h
 create mode 100644 drivers/media/i2c/maxim-serdes/max_ser.c
 create mode 100644 drivers/media/i2c/maxim-serdes/max_ser.h
 create mode 100644 drivers/media/i2c/maxim-serdes/max_serdes.c
 create mode 100644 drivers/media/i2c/maxim-serdes/max_serdes.h
 delete mode 100644 drivers/staging/media/max96712/Kconfig
 delete mode 100644 drivers/staging/media/max96712/Makefile
 delete mode 100644 drivers/staging/media/max96712/max96712.c

-- 
2.49.0


