Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF57C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 18:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cnph4Pjkh7NDe/vO7CvtB8Q7vW3zaR6uOeHtknwGb3Q=; b=bBI+sDrA/Iiu0kMxTP+FdEn+Vj
	oGjPU+TJPnPIo4zr2Sw6lTc8yZ8HQiBvZvzbKD3V7BWwQze8JqhJujrBtlybK7gnO8kopy2bRfw5o
	Cfwtls9QPWnjbPFEEP7+kCvBjyaFS+jCuyJThF5hYIsc5EUkNWliMv1vec/roJ2w9uLX1kdl7Dh9m
	ZecQopgWJ1kkb7E0WrQtR3bs0E9sFWoADU10NX0ZA8Ol8sHPvEarSRn0F1WI1Z3Ov62En+bf332ij
	kWgff7wiI9VFqy8qMCp5fuPyLZaQqIC9y+2Qu1HdEIdmj+AS3rOdyrFOYJ3by44h93ypZhrtgb43+
	QSXSHAcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqz1y-0000000H0ch-1SU5;
	Sat, 08 Mar 2025 18:36:14 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqz0K-0000000H058-0Qrg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 18:34:33 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-abec8b750ebso483174866b.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Mar 2025 10:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458869; x=1742063669; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cnph4Pjkh7NDe/vO7CvtB8Q7vW3zaR6uOeHtknwGb3Q=;
        b=PnMSbZu2Xw0oKKP/u8FBAz7moK59L9geMfEO6FvmAAMlUla7DPuEsDnjo66mhtzb3j
         GFA7cGTwkZjQy96giEK7dBqCjb8dPcokoujrv6iB/oOOz3fFS9yU7Jbb6gEEommcIhDP
         zpVVmlPD4poCJbRF5pBni9Q1quZAehsP2+XXslWWJUh6xEzkbT7V9fWnP1yeqm3jighy
         l2SBebpg46o7gLkRpTjB0i3Zlp50a8fgEX/scD7L0hr2GQhN5BNntLHsITDxC/Ds0ab5
         ZgsufeC67fV4bOjwHNMJNByipNeOYUmVIzR0+yOTUyX91qpVvUOU+o7AlXQF6AGVmslx
         vqzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458869; x=1742063669;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cnph4Pjkh7NDe/vO7CvtB8Q7vW3zaR6uOeHtknwGb3Q=;
        b=D1zv6pmxBPZAratgjChYjeyumyFQbpnNBZKO5H7CpM4MAh40IZZjRDNSBZkIp1fgyu
         wXnwB7/uDnIQBGWlfyes8VFL2L3YTzrMU8djXwICeksEdUZdGvpGS2AhUjnThruXTmxK
         vlr6KZotaoCWszzAixMttKE52RbBMW2MWAPsSoULlBXQJ2d5P7Md0a3FRnflRXqGvvIE
         LykNh3EbwoXo09nBcJ07GcSvkKxqCuATxd2L5uuI3Mneqsg7lzrUx6hYnBOQPNWojenj
         x9+NnjuaS/ADkt6WJ3Zd/41NnF1cgjZiV4otAhZRjjZwvfRVQwVCwCY8XqgonlZECyTH
         e4xg==
X-Forwarded-Encrypted: i=1; AJvYcCUYVNYJli7ISxISGwPe1Q8G0eurVnuw8CHKEgBy4NYMeri2wzTylmpfa0E9sYj1hYFpkASIO9YxXIqfbKPHNRwA@lists.infradead.org
X-Gm-Message-State: AOJu0YyM0WchrRBMbfPa2qL2zRLMrQd8fryMBzq5/GwFNrRDAqYlIT+E
	ctWVHYjcaXJCYRS6aYES1NG9oCflwX6gVW0mWvREPsrGwhj4ROkE
X-Gm-Gg: ASbGnctpzcatYm23wYmVoiOyVUfGoIwaJu0Uf3xUYNzjzbNpbmFM/S0thxXtE/LfVJ+
	0xZg3lJjItEVVU3GOi7ZPTspsPNw/AzmvR04Dqr9q2d4HK5If4+o4sd2ObP6nADiKKJ0dXwEYky
	DpNEcuBzEDUf4PxMcTzenPQZwpVX0UTVynHhdkhtcVs9+2XbNucBJ04uzvUUqm+9Ovycnz7U29u
	6OcaXVl1+ZUXt0YBv5mnwjRE+Gv44GuMBe5Bx47MnAJFwjJwanyDS3FmbTOPUTf9gW8HLOJUzCP
	V33TD1kD0+NyzYsHsna4i+v5NaT1SzVkQL3ZChWChUjh87JVXoR+ZkmwVQ==
X-Google-Smtp-Source: AGHT+IFlQa0WMb2+wSlKNfDHlapXAeQqbXw15a3LXATAfKzeJE3GltkLPgSDOpIdBu646StR1yvVuA==
X-Received: by 2002:a17:906:dc8e:b0:abf:6ec7:65e9 with SMTP id a640c23a62f3a-ac252f8f556mr813756566b.43.1741458868737;
        Sat, 08 Mar 2025 10:34:28 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:34:28 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Eric Biggers <ebiggers@google.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Ross Burton <ross.burton@arm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [RFC PATCH 00/24] media: i2c: add Maxim GMSL2/3 serializer and deserializer drivers
Date: Sat,  8 Mar 2025 20:33:29 +0200
Message-ID: <20250308183410.3013996-1-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_103432_145870_47C5ED69 
X-CRM114-Status: GOOD (  29.24  )
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

This series depends on these two series:
 * https://lore.kernel.org/lkml/20250306-fpc202-v9-0-2779af6780f6@bootlin.com
 * https://lore.kernel.org/lkml/20250228151730.1874916-1-demonsingur@gmail.com

The following deserializers are supported:
 * MAX96712 (already exists in staging)
 * MAX96714 (already exists)
 * MAX96716 (GMSL2)
 * MAX96724 (part of existing MAX96712 driver)
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

 * I2C MUX where supported by the hardware for deserializers, otherwise
   I2C ATR translation - some deserializers cannot do muxing since I2C
   communication channel masking is not available per-link, and the only
   other way to select links is to turn them off, causing link resets.
   For such cases, I2C ATR is used to change the address of
   the serializers at probe time.

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

Cosmin Tanislav (24):
  dt-bindings: media: i2c: max96717: add myself as maintainer
  dt-bindings: media: i2c: max96717: reflow text
  dt-bindings: media: i2c: max96717: add support for I2C ATR
  dt-bindings: media: i2c: max96717: add support for pinctrl/pinconf
  dt-bindings: media: i2c: max96717: add support for MAX9295A
  dt-bindings: media: i2c: max96717: add support for MAX96793
  dt-bindings: media: i2c: max96714: add myself as maintainer
  dt-bindings: media: i2c: max96714: reflow text
  dt-bindings: media: i2c: max96714: make i2c-gate conditional on
    compatible
  dt-bindings: media: i2c: max96714: make ports conditional on
    compatible
  dt-bindings: media: i2c: max96714: make supply conditional on
    compatible
  dt-bindings: media: i2c: max96714: add support for MAX9296A
  dt-bindings: media: i2c: max96714: add support for MAX96716A
  dt-bindings: media: i2c: max96714: add support for MAX96792A
  dt-bindings: media: i2c: max96712: add myself as maintainer
  dt-bindings: media: i2c: max96712: use pattern properties for input
    ports
  dt-bindings: media: i2c: max96712: increase number of output ports
  dt-bindings: media: i2c: max96712: add support for I2C MUX
  dt-bindings: media: i2c: max96712: add support for POC supplies
  media: i2c: add Maxim GMSL2/3 serializer and deserializer drivers
  arm64: defconfig: disable deprecated MAX96712 driver
  staging: media: remove MAX96712 driver
  media: i2c: remove MAX96717 driver
  media: i2c: remove MAX96714 driver

 .../bindings/media/i2c/maxim,max96712.yaml    |   49 +-
 .../bindings/media/i2c/maxim,max96714.yaml    |  245 +-
 .../media/i2c/maxim,max96717-pinctrl.yaml     |   71 +
 .../bindings/media/i2c/maxim,max96717.yaml    |   75 +-
 MAINTAINERS                                   |   13 +-
 arch/arm64/configs/defconfig                  |    1 -
 drivers/media/i2c/Kconfig                     |   34 +-
 drivers/media/i2c/Makefile                    |    3 +-
 drivers/media/i2c/max96714.c                  | 1024 --------
 drivers/media/i2c/max96717.c                  | 1103 --------
 drivers/media/i2c/maxim-serdes/Kconfig        |   53 +
 drivers/media/i2c/maxim-serdes/Makefile       |    6 +
 drivers/media/i2c/maxim-serdes/max9296a.c     | 1146 ++++++++
 drivers/media/i2c/maxim-serdes/max96717.c     | 1500 +++++++++++
 drivers/media/i2c/maxim-serdes/max96724.c     |  905 +++++++
 drivers/media/i2c/maxim-serdes/max_des.c      | 2321 +++++++++++++++++
 drivers/media/i2c/maxim-serdes/max_des.h      |  135 +
 drivers/media/i2c/maxim-serdes/max_ser.c      | 1584 +++++++++++
 drivers/media/i2c/maxim-serdes/max_ser.h      |  132 +
 drivers/media/i2c/maxim-serdes/max_serdes.c   |  302 +++
 drivers/media/i2c/maxim-serdes/max_serdes.h   |   88 +
 drivers/staging/media/Kconfig                 |    2 -
 drivers/staging/media/Makefile                |    1 -
 drivers/staging/media/max96712/Kconfig        |   14 -
 drivers/staging/media/max96712/Makefile       |    2 -
 drivers/staging/media/max96712/max96712.c     |  487 ----
 26 files changed, 8523 insertions(+), 2773 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max96717-pinctrl.yaml
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
2.48.1


