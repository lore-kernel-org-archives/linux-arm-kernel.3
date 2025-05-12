Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F848C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 21:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tI2715D5ESQM7YG5Xe5CldMa08sT1lW76SXSrOmASN4=; b=CFFA3l2lgwAPUwlo1puHnYNk5H
	PlPmYA6ra0yeG8AaZvWMhL7McJsiSTjbiLDpOPQwzrlC3OusjVv7o4j8FaD3tFFs4ZjrPJAe8xU1Z
	GuZvj5fJ1xSFv2SVfrxlLfnRyDp/w69Ly95eCzEvS8Z+16Giu0KGJgkkk3TkhVH4lv8TFIU3F3zIE
	7SSo6+8DnbE7TXmuOcvr6WOu18IRNxfLFEOrxo+Hj8lxMZZU5OZpDFkHaTsRiIaOU7oiGVrzGS7mF
	OH4OZmFTUJfSPw/UsTeXp1y1sNtjmqEDwwYJtB8krNVHsh2n/jEUFkG20Tc3A+s5c3KnjMcrP/TYy
	uIRAfjxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEarU-0000000AkhP-2mp3;
	Mon, 12 May 2025 21:39:00 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEahl-0000000Aig2-1l0o
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 21:28:58 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-326c8ae08e8so29489001fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 14:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747085336; x=1747690136; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tI2715D5ESQM7YG5Xe5CldMa08sT1lW76SXSrOmASN4=;
        b=U64VkB4ReTRoLs/co90Bp7E676ms2GRQlNsDhozVzshOZtKTKQ/Z4hJKI9DhIIBeCZ
         mWowZwGVnaWXzay5CoZV2YQ3YvB7GXR2jpYtJWD/zbcyotG+5H5zWbQ3YykYoNmllYX6
         EVY43cgWFyw4C0MGj7t30nRoEyfF+sAD657iy7ucNxp6PFlYGi+UUCHoI82kdwyDCAnK
         l62IFLdNDLt3yVi1gaFmDFHUgMYpJWD2KFDa7VsRlsV1+2v1k25pLwSL7r6WGqujhZn8
         Oz1fLa0I50oozjD+hrCgFisIOebXg0r86Wmq+FwY/f85fPK2j/1LW2N7NifRPoWd+w41
         Wz8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747085336; x=1747690136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tI2715D5ESQM7YG5Xe5CldMa08sT1lW76SXSrOmASN4=;
        b=iA5UImcKXptUxx4WFbeAWhkFNZSa00WInxeNTEfcWsMv4VmAR8TEp8ja9QTOcTlNa+
         gssuhpcix1b8cjsBMKtdnmk/kflqNkS/5+tdXm3t0ufD1zzkAf3we7JdAl3xfrsFBnca
         GSzUjCA3p7Y7vgMmW6JLKruVWQH2iSDYOEPPzftZkn/EToXg+CMA8/9op9etYuw40uE8
         uiqoFxN9YRNqJCRlduy4RE9ULd/4yXaHiPkwlPhliFC6Q9Yn3vSWug+YGIo+pWiR4oO0
         sI/vLjyswrDvOFJOWwr/pfvjmO9R9EfOCMQYchwiDbx18eGR+UFM4z+2AuBJ4rrt8F+x
         i5xg==
X-Forwarded-Encrypted: i=1; AJvYcCWq8CiecPc0XHEG36aSQwezkW9f3dZt+mhjSVM1/hi4X2Y1jXZWSC407BprTd2ptiXAE48T5gLAL6jHYMkJgpjG@lists.infradead.org
X-Gm-Message-State: AOJu0YxIpe5gV/l7ohFONzMOdEiNmhF5FVaAg/Cx+ChIRIXC+4ZwJ6CE
	kqbC5VXS58nRswqZMNzupRtwlK3TloMRgXqMKZAWMJyFk4MY9sjMxDpR1Q==
X-Gm-Gg: ASbGncuMW2STMOZeadzgtoYTB9gALcas36126Kfn4S8KZq5QOLzGnP/bIayEcsYaLfe
	6nUjHECIQXCwor806OSC2sfnzx6ZSmkjM07GF0BkTD2iN4dEwvXKSSKkaqmBIaRduSQS7s9CEXU
	54ZHktNeCqVXetBdandEK5uHGsCIkns1syG2Ea2lvzevOuyprxqGfS54LVujEVZgqvzdU9nRGdX
	/JZMOHYERAu7r4NQChs22P7Uum4uSc/uGqZHkQKVW2D+ZOOA3SqHuVfw/kTc0pF0gmoozkK/6Yv
	nE0EHEz74C0+oyb9/dN7erkGjdMrwqRSkHcnICzR9ZH6pCuKN327z+W2CEf35OA=
X-Google-Smtp-Source: AGHT+IH3HE0/d7M0M7Nr7RHHQK+hfCkaSqyqw7rjV4ubQ4JySMKEcoPxtQCzZun71KReIj7UcVirvg==
X-Received: by 2002:a17:907:1808:b0:ad2:2e5c:89c5 with SMTP id a640c23a62f3a-ad22e5c94fbmr1137698366b.20.1747085324844;
        Mon, 12 May 2025 14:28:44 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad23a5552a6sm472861466b.30.2025.05.12.14.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 14:28:44 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Liu Ying <victor.liu@nxp.com>,
	Ross Burton <ross.burton@arm.com>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Eric Biggers <ebiggers@google.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v3 00/19] media: i2c: add Maxim GMSL2/3 serializer and deserializer drivers
Date: Tue, 13 May 2025 00:28:09 +0300
Message-ID: <20250512212832.3674722-1-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_142857_462422_7B7130FB 
X-CRM114-Status: GOOD (  27.31  )
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

This series depends on:
https://lore.kernel.org/lkml/20250507121917.2364416-1-demonsingur@gmail.com

The previous version is at:
https://lore.kernel.org/lkml/20250309084814.3114794-1-demonsingur@gmail.com

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

Missing features:
 * The current TPG implementation makes use of the V4L2_CID_TEST_PATTERN
   V4L2 control. With V4L2 streams support added, we would like to hook
   up TPG using the internal pad feature which has not been accepted
   upstream yet. We decided to leave TPG out for the moment and add it
   back after internal pads have been accepted.

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

Cosmin Tanislav (19):
  dt-bindings: media: i2c: max96717: add myself as maintainer
  dt-bindings: media: i2c: max96717: add support for I2C ATR
  dt-bindings: media: i2c: max96717: add support for pinctrl/pinconf
  dt-bindings: media: i2c: max96717: add support for MAX9295A
  dt-bindings: media: i2c: max96717: add support for MAX96793
  dt-bindings: media: i2c: max96712: add myself as maintainer
  dt-bindings: media: i2c: max96712: use pattern properties for ports
  dt-bindings: media: i2c: max96712: add support for I2C ATR
  dt-bindings: media: i2c: max96712: add support for POC supplies
  dt-bindings: media: i2c: max96712: deprecate enable-gpios
  dt-bindings: media: i2c: max96712: add support for MAX96724F/R
  dt-bindings: media: i2c: max96714: add myself as maintainer
  dt-bindings: media: i2c: max96714: add support for MAX96714R
  dt-bindings: media: i2c: add MAX9296A, MAX96716A, MAX96792A
  media: i2c: add Maxim GMSL2/3 serializer and deserializer drivers
  arm64: defconfig: disable deprecated MAX96712 driver
  staging: media: remove MAX96712 driver
  media: i2c: remove MAX96717 driver
  media: i2c: remove MAX96714 driver

 .../bindings/media/i2c/maxim,max9296a.yaml    |  242 ++
 .../bindings/media/i2c/maxim,max96712.yaml    |   80 +-
 .../bindings/media/i2c/maxim,max96714.yaml    |    6 +-
 .../bindings/media/i2c/maxim,max96717.yaml    |  160 +-
 MAINTAINERS                                   |   14 +-
 arch/arm64/configs/defconfig                  |    1 -
 drivers/media/i2c/Kconfig                     |   34 +-
 drivers/media/i2c/Makefile                    |    3 +-
 drivers/media/i2c/max96714.c                  | 1024 -------
 drivers/media/i2c/max96717.c                  | 1103 --------
 drivers/media/i2c/maxim-serdes/Kconfig        |   53 +
 drivers/media/i2c/maxim-serdes/Makefile       |    6 +
 drivers/media/i2c/maxim-serdes/max9296a.c     | 1143 ++++++++
 drivers/media/i2c/maxim-serdes/max96717.c     | 1501 ++++++++++
 drivers/media/i2c/maxim-serdes/max96724.c     |  968 +++++++
 drivers/media/i2c/maxim-serdes/max_des.c      | 2446 +++++++++++++++++
 drivers/media/i2c/maxim-serdes/max_des.h      |  137 +
 drivers/media/i2c/maxim-serdes/max_ser.c      | 1577 +++++++++++
 drivers/media/i2c/maxim-serdes/max_ser.h      |  129 +
 drivers/media/i2c/maxim-serdes/max_serdes.c   |  302 ++
 drivers/media/i2c/maxim-serdes/max_serdes.h   |   89 +
 drivers/staging/media/Kconfig                 |    2 -
 drivers/staging/media/Makefile                |    1 -
 drivers/staging/media/max96712/Kconfig        |   14 -
 drivers/staging/media/max96712/Makefile       |    2 -
 drivers/staging/media/max96712/max96712.c     |  487 ----
 26 files changed, 8829 insertions(+), 2695 deletions(-)
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


