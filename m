Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29201C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 15:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BJxMlHb0ytPOGAga5OsWNiDGKWG4gakuVpcbrGV5E/8=; b=RASDoibumipsSl+IwtHlFAuAwC
	oVrKIVa5dG34TlOpZ8Y9Ly8vzZ0MmWKLA+ar7SwN49NhVuF9Oarq7tPGLeK2Yspz4thrcn3LMOF0U
	K0EFseTzdOsWlXmLUXPS3jLeBAVGyxuSpDdhCj1cyTEPD/xQp5u7djMY7h07h+YKstmYU/0N3SV2w
	vAO+NiL507p9JTAFg4lMbDbRmCz48urjICKKTVApxepk1uAFo5T6UeCepy4s/wnP89Tmd1t5dNWhT
	AdFcSM/Nbital3EPPZZ0ID6okohtDvKKpPDKmXOE0rdDjDBPVnaFIb0CatHZwcTvaHYFtZfW22ZeU
	BosfGu6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucn5g-0000000Cxev-3elL;
	Fri, 18 Jul 2025 15:33:40 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucmxW-0000000Cvl9-0g5e
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 15:25:15 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3a57ae5cb17so1134223f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 08:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752852312; x=1753457112; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BJxMlHb0ytPOGAga5OsWNiDGKWG4gakuVpcbrGV5E/8=;
        b=fsR1UAjZE+brERCv5BPFbq2CScxk9teZbHzVazHgoP24oDW7BY9paE0iA8Dho0GhMI
         WFQ6PIsDq7dqE1nq00xsjfRkg6wGzCwsJcS4mK074+ruArh6xgEM00TrlJZRw5QCdEiw
         qSAkpIm3dCfPj4BPv7hSx63OXpDAwwGVkKwP9Fnjo4SgDlsxNI3EjaSLLyUfudFWf3zF
         f2+dvJEcKALxTwUqXuS1Ip8Kg/YAW8Ia6zkqjz3oas6glqWNSK/8lnxbWWuTBoaT2tgG
         qCWJUK9jSr/8xtLILsW4Vb3vT6082FIbnohU9lyxw83ZbzqU3woc8nBqmZicwnZvyrQv
         /Ujw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852312; x=1753457112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BJxMlHb0ytPOGAga5OsWNiDGKWG4gakuVpcbrGV5E/8=;
        b=rKsE1UaIMMWF2i4zhSAdukWEhMcR6RKDMB+6WwNHQ8D0lm77aXIaWlyvydfE9dNO3o
         xg77jv6Qtn3YhL/7vlrT8HlecKrM5IYo2QMGLAlWkodSXioAYysFUlSjnCacMkBxFs/V
         EkPB1tt9LJbn1S9eEw0Hb716/7Xn0IPvuaIpOSdrjRaOVrGuqZzJjfndOpFcH4SgQS+0
         rGjVisLHLIxRckR0Ot2XMYVUib9vBJBcXql3G0jEmkelTX9E1OnNzHNtYWui60RrNbCd
         ZlSxMH13B3/q87PKbIlqULqry3P5M54e+VZrLRlumzkcUgkWmeS0hXckJLyjM86YHHHY
         3INQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1MwWyKsoK39beD8bSr+pXd3WCKta06AQlu5OSEV98pJO99ym3n1ShSOBhslGvGPX8C4RnUygN/Bzx9fQmGFYO@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2m6Bqf7GUi03azotCqdWNAaChVAbUsju2QdXLsQfdvYM5vIFb
	qx/4JR5NAZzqAP6MhxTU/Em422N0vdlbSgFq9zSridkVfeCavteZ3roJHRy5+w==
X-Gm-Gg: ASbGnctDn9XnLKDNjZaq6FQpI5KJuXugxmNzSOKEbAYTY7AdG1HHb1w1qxT5EEroYK6
	wGHMILsizXDnifNqCZXuQB1fqvMCrHp7rIcMdVbqI2+GPHmgW7pB+LoGxMteD/uXB4T4oa4zWOL
	c9uDSjjdwism7DmSSqtvZsnd+GW8ot9LiJ/6SamWQ5VE5fKWfh6cxpqS3MEFyrjLiij6kOwUH5t
	2K/3boLauSJoNwx7zZZSbvAZWMpoXFMtr9d5Tg+8NURxjGEPHx8jU+GRjhD3Hds/XQh/UISWraS
	2spbw65XvGI35IDGG/e+Rzu9S+4rTRuXAZEtIehCc6r+j7ZXdVXXkRq1QoEucMW/3tX+RMNzjwF
	h1TQcqdebDi4FhGSyEhRmO20Uv4r487r6a2YvOS3itFHWWg==
X-Google-Smtp-Source: AGHT+IGzW9SjebHQzHtYme5508QORx0+TbbV8n3ohEzv5FmUaGnyJ/J2WwWQI0A5ABkz/Z+peGp/kA==
X-Received: by 2002:adf:e193:0:b0:3a3:7987:945f with SMTP id ffacd0b85a97d-3b60e5242a1mr10156741f8f.57.1752852311782;
        Fri, 18 Jul 2025 08:25:11 -0700 (PDT)
Received: from demon-pc.localdomain ([86.121.79.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca4893fsm2195780f8f.52.2025.07.18.08.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:25:11 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v7 00/24] media: i2c: add Maxim GMSL2/3 serializer and deserializer drivers
Date: Fri, 18 Jul 2025 18:24:36 +0300
Message-ID: <20250718152500.2656391-1-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_082514_215223_CFAFB084 
X-CRM114-Status: GOOD (  27.24  )
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
https://lore.kernel.org/lkml/20250716193111.942217-1-demonsingur@gmail.com

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

V7:
 * dt-bindings: max9296a: use full max96717 compatible
 * max9296a: make max96714_rlms_reg_sequence static
 * explicitly include linux/bitfield.h
 * explicitly depend on I2C and PINCTRL
 * sort media_entity_operations
 * add has_pad_interdep to media_entity_operations

V6:
 * max9296a: put rlms sequence in max9296a_chip_info
 * max_des: reflow stream id a comment
 * max_ser: remove exported symbols not used in other modules
 * max_ser: init mode to a supported value
 * add default routing
 * MAX_SERDES_GMSL_3 -> MAX_SERDES_GMSL_3_12GBPS
 * guard reg_read/write with CONFIG_VIDEO_ADV_DEBUG
 * put exported symbols in MAXIM_SERDES namespace

V5:
 * dt-bindings: max96717: restrict RCLKOUT to pins 2 & 4
 * dt-bindings: max96717: remove confusing rclksel pinconf property
 * dt-bindings: max96717: remove maxim,gmsl-tx/rx pinconf property
 * dt-bindings: max96717: remove gmsl prefix from maxim,gmsl-tx-id/rx-id
 * dt-bindings: max96717: remove minimum: 0
 * dt-bindings: max96717: better document slew-rate
 * dt-bindings: max96717: better document maxim,jitter-compensation
 * dt-bindings: max96717: better document maxim,tx-id/rx-id

 * max_serdes: add default TPG values
 * max_serdes: remove MAX_MIPI_FMT macro
 * max_serdes: EXPORT_SYMBOL -> EXPORT_SYMBOL_GPL
 * max_serdes: remove EXPORT_SYMBOL_GPL from symbols not used in other
   modules
 * max_serdes: rename symbols/macros/types to have max_serdes prefix
 * max_serdes: slim down TPG functions

 * max_des: fix may be used uninitialized errors
 * max_des: fix misplaced TPG validation
 * max_des: fix setting pipe PHY in tunnel mode for chips that support
   both set_pipe_phy() and set_pipe_tunnel_phy()
 * max_des: move doubled_bpp/sink_bpps variables to usage place
 * max_des: do not dynamically control PHY enable, letting lanes be in
   LP-11 when not streaming
 * max_des: refactor get/set_pipe_stream_id() logic
 * max_des: remove explicit ret = 0

 * max_ser: make VC remaps not pipe-specific, allocate dynamically

 * max9296a: add missing 1080p30 TPG entry
 * max9296a: move BIT() left shift into macro
 * max9296a: move BIT() ternary into macro
 * max9296a: reuse max_des_ops for chip-specific ops\
 * max9296a: document and compress RLMS register writes

 * max96717: restrict RCLKOUT to pins 2 & 4 because of hardware
   capabilities
 * max96717: add support for XTAL/1, XTAL/2, XTAL/4 clocks
 * max96717: set RX_EN/TX_EN automatically
 * max96717: reorder custom pinconf flags
 * max96717: drop OF dependency

 * drop of_match_ptr
 * re-do some indentation
 * implement TPG pattern control
 * remove pr_info() usage
 * inline lane polarity val = 0
 * inline returns
 * rewrite some Kconfig docs
 * split up patches for easier review

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

Cosmin Tanislav (23):
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
  media: i2c: add Maxim GMSL2/3 serializer and deserializer framework
  media: i2c: add Maxim GMSL2/3 serializer framework
  media: i2c: add Maxim GMSL2/3 deserializer framework
  media: i2c: maxim-serdes: add MAX96717 driver
  media: i2c: maxim-serdes: add MAX96724 driver
  media: i2c: maxim-serdes: add MAX9296A driver
  arm64: defconfig: disable deprecated MAX96712 driver
  staging: media: remove MAX96712 driver
  media: i2c: remove MAX96717 driver
  media: i2c: remove MAX96714 driver

Sakari Ailus (1):
  media: mc: Add INTERNAL pad flag

 .../bindings/media/i2c/maxim,max9296a.yaml    |  242 ++
 .../bindings/media/i2c/maxim,max96712.yaml    |   70 +-
 .../bindings/media/i2c/maxim,max96714.yaml    |    6 +-
 .../bindings/media/i2c/maxim,max96717.yaml    |  155 +-
 .../media/mediactl/media-types.rst            |    8 +
 MAINTAINERS                                   |   13 +-
 arch/arm64/configs/defconfig                  |    1 -
 drivers/media/i2c/Kconfig                     |   34 +-
 drivers/media/i2c/Makefile                    |    3 +-
 drivers/media/i2c/max96714.c                  | 1017 ------
 drivers/media/i2c/max96717.c                  | 1102 ------
 drivers/media/i2c/maxim-serdes/Kconfig        |   60 +
 drivers/media/i2c/maxim-serdes/Makefile       |    6 +
 drivers/media/i2c/maxim-serdes/max9296a.c     | 1345 +++++++
 drivers/media/i2c/maxim-serdes/max96717.c     | 1689 +++++++++
 drivers/media/i2c/maxim-serdes/max96724.c     | 1184 ++++++
 drivers/media/i2c/maxim-serdes/max_des.c      | 3181 +++++++++++++++++
 drivers/media/i2c/maxim-serdes/max_des.h      |  153 +
 drivers/media/i2c/maxim-serdes/max_ser.c      | 2131 +++++++++++
 drivers/media/i2c/maxim-serdes/max_ser.h      |  147 +
 drivers/media/i2c/maxim-serdes/max_serdes.c   |  413 +++
 drivers/media/i2c/maxim-serdes/max_serdes.h   |  183 +
 drivers/media/mc/mc-entity.c                  |   10 +-
 drivers/staging/media/Kconfig                 |    2 -
 drivers/staging/media/Makefile                |    1 -
 drivers/staging/media/max96712/Kconfig        |   14 -
 drivers/staging/media/max96712/Makefile       |    2 -
 drivers/staging/media/max96712/max96712.c     |  487 ---
 include/uapi/linux/media.h                    |    1 +
 29 files changed, 10973 insertions(+), 2687 deletions(-)
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
2.50.1


