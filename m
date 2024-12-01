Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B393BD4977B
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Dec 2024 17:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rchwEG8OXdVUFDvOBxqjyl0K00WGKeVLIMzEYmldbsw=; b=PVMeHyZPlJhG70cWUkdk8TB8eZ
	lNeF+cm/XXagvUqrORdvjEiY+hQ6s46pZ/stqltfsS07a88AkuPqg7GtQFWgkR55lxpxkhParoZ5N
	y0oEbcAQ650bkfKrdqXXCQMHg/ZM3V5NNgukzlnfPzCM9KwRzBdGGVfIOskgV2neSgc6c/RO6QjGa
	ERFCTeORfMAEtN2k7vD6OyLad1lvRo6G9o10m9g62nbxs2V+pSHJIeVlPlAVl/mUFLXrY/2N0OJQy
	9C2v41Tlaj9PJNmshtPJDMT+eYWUX0a8ronQyYsGAddum+EjZCV33kFAZxZINhP4+NV0tbpxhswM0
	LfGsAmuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHo3S-000000048lK-0DQT;
	Sun, 01 Dec 2024 17:48:22 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHo2R-000000048QY-1qOH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Dec 2024 17:47:20 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-aa549d9dffdso564916666b.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Dec 2024 09:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733075236; x=1733680036; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rchwEG8OXdVUFDvOBxqjyl0K00WGKeVLIMzEYmldbsw=;
        b=DFRys+k7z29iD2V80LXen0crgAM2j22/B08BNUx9EfIRsxli8Lc2U4Ciyo+ohlGVqo
         +xBjCS6ujaLxsh92MZSYxaYbRaaoq1J2IKmsVGicbSInpKIcrwwGr4a5GpUB2KckidtJ
         qsP7LDIxgbw7u2J0YjgWjskeYeiFtrfUG7ASw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733075236; x=1733680036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rchwEG8OXdVUFDvOBxqjyl0K00WGKeVLIMzEYmldbsw=;
        b=BGeS1pA/ZqEvf6FQQTYaiPCKSRkKKNjDajTlWrOxGc4BtTjuo2eRkYVnA3FuSAjMQw
         Jk0tzBjCJZ4VsK0kws1WMJHLgcnxVn6ws4YCfpdVA2lBGfyVA0RvNapbKiPpxnX4/mI/
         J2L/81vN3/id3p4MM92dhguyJixKTCyB5WmhGMY98wEJWxvDx5+7Ztcg2BZCcYm1nicG
         hn0qqmi8KzA/jQ1KbXccA8UR21SrI5mvC4Pq//MPo3RMczJYW+haTZWKKR/8Pi7gnfdX
         WjWfBev3F3ocaWsn7LDbx+zaYnyL96FWzvvfau96LDygEKjJopjMqwW3yAyAULGWdME8
         5fuw==
X-Forwarded-Encrypted: i=1; AJvYcCXOPf29wPsMIhGmsNrqFT6l1vClmhGpnw0eIdcg5WqO9y5yt1PSEKA7K+ZUooFWxTGQ7EQevlAHoZu07Ebn7YUg@lists.infradead.org
X-Gm-Message-State: AOJu0YwOaLeO0d9PhRigScXZ1ni4ru6kgIQrBvNxk3rYoZ55nSirpimq
	w199Ab5aOraHC8VDn8apAJhj4vaGW/10ctc/8AcxJ2ZmgQ8GtOcHGbEjFlcof3U=
X-Gm-Gg: ASbGncvArLeh/m8WIoKIOTTXtuJNJOO+Lgwn5GUF8ecCjthvclYJxkf7EhTsp9D5k2U
	UnDyU9wo8WoAsOCXZhkEuFGQ2vOS/D7ZJcfeKjb33fJi6MQYebdvKkrBWftcyRCVXNpjX8OeBhD
	81fq15w7DUBA9OEdLxG0siftLm+z/WLUGqGpeHa9Deg57EzTWpgRKrH2LCzkkorusjXxfV8CxQk
	T8p/HrRV+NzwWXpkVhFORJZzacqgdM+iJLBaZWonEY5YADOsx/wIe2JB+be8/W5VFA6ObpgyG3O
	Z9y1htZnYUskqBTAhAR66dR80hzeiXa6j9wCne6D+t48knovTWi+qZrgZ8SyzUNl2aVC86qruuw
	nRZz3xP5CFIlshbXp
X-Google-Smtp-Source: AGHT+IHOVUCcxf0ALDonprqfVqUEbAzV53v0SZ4mU7f60wTN66QJ2QUiGKJxXNAkQ6tdMuSLScJWrA==
X-Received: by 2002:a17:907:7742:b0:aa5:152a:d0a5 with SMTP id a640c23a62f3a-aa580f2c2ecmr1673821766b.18.1733075236544;
        Sun, 01 Dec 2024 09:47:16 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-54-94-193.retail.telecomitalia.it. [82.54.94.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa59990a78esm415220066b.163.2024.12.01.09.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 09:47:16 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v4 00/18] Support spread spectrum clocking for i.MX8N PLLs
Date: Sun,  1 Dec 2024 18:46:00 +0100
Message-ID: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_094719_536207_E6DDC1C2 
X-CRM114-Status: GOOD (  12.70  )
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

The series adds support for spread spectrum clocking for i.MX8MN
PLLs (audio, video and DRAM). It has been tested for the video PLL on
a board using i.MX8MN.
The patches added in version 4, such as the dt-bindings and the driver
for anatop, were inspired by the extensive email exchange from version 3:
https://lore.kernel.org/imx/20241106090549.3684963-1-dario.binacchi@amarulasolutions.com/

The series added spectrum spread support for the imx8mn platform only,
but in case it was merged, confirming that the directives and suggestions
made by the maintainers were correctly understood and implemented, I will
extend this support to the imx8mm and imx8mp platforms as well.

(no changes since v1)

Dario Binacchi (18):
  clk: imx8mm: rename video_pll1 to video_pll
  clk: imx8mp: rename video_pll1 to video_pll
  dt-bindings: clock: imx8m-anatop: define clocks/clock-names
  arm64: dts: imx8mm: add anatop clocks
  arm64: dts: imx8mn: add anatop clocks
  arm64: dts: imx8mp: add anatop clocks
  arm64: dts: imx8mq: add anatop clocks
  dt-bindings: clock: imx8mm: add binding definitions for anatop
  dt-bindings: clock: imx8mn: add binding definitions for anatop
  dt-bindings: clock: imx8mp: add binding definitions for anatop
  clk: imx: add hw API imx8m_anatop_get_clk_hw
  clk: imx: add support for i.MX8MN anatop clock driver
  dt-bindings: clock: imx8m-clock: support spread spectrum clocking
  arm64: dts: imx8mm: add PLLs to clock controller module (ccm)
  arm64: dts: imx8mn: add PLLs to clock controller module (ccm)
  arm64: dts: imx8mp: add PLLs to clock controller module (ccm)
  clk: imx: pll14xx: support spread spectrum clock generation
  clk: imx8mn: support spread spectrum clock generation

 .../bindings/clock/fsl,imx8m-anatop.yaml      |  53 +++-
 .../bindings/clock/imx8m-clock.yaml           |  77 ++++-
 arch/arm64/boot/dts/freescale/imx8mm.dtsi     |  11 +-
 arch/arm64/boot/dts/freescale/imx8mn.dtsi     |  11 +-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  11 +-
 arch/arm64/boot/dts/freescale/imx8mq.dtsi     |   2 +
 drivers/clk/imx/Makefile                      |   2 +-
 drivers/clk/imx/clk-imx8mm.c                  | 102 +++----
 drivers/clk/imx/clk-imx8mn-anatop.c           | 281 ++++++++++++++++++
 drivers/clk/imx/clk-imx8mn.c                  | 188 ++++++------
 drivers/clk/imx/clk-imx8mp.c                  | 118 ++++----
 drivers/clk/imx/clk-pll14xx.c                 | 127 ++++++++
 drivers/clk/imx/clk.c                         |  26 ++
 drivers/clk/imx/clk.h                         |  22 ++
 include/dt-bindings/clock/imx8mm-clock.h      |  78 ++++-
 include/dt-bindings/clock/imx8mn-clock.h      |  67 +++++
 include/dt-bindings/clock/imx8mp-clock.h      |  79 ++++-
 17 files changed, 1022 insertions(+), 233 deletions(-)
 create mode 100644 drivers/clk/imx/clk-imx8mn-anatop.c

-- 
2.43.0


