Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34022C5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 12:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/h0XzmwWRXUqJNSMv5UtY0V0xlijWuRLVo42IsC8mD4=; b=3MzcAZvUVzTTC0epMZ2nPDlPYk
	8sTd1waSyM/RkXWb/sB7IiX/WhYJu3RG2l8mZYyKEi1FDf2ye1kB9mnrr2+p8q0zsu89EMJD1BSp8
	HeOelHC1urBpDIoH5tZwxibLO/yVTrahYw7ylWmWe3KPSaht0DAFGFSMpAG3dmrS6SFUKvDE2zWzl
	48H1e/svoMxrZtOkzfqGFEglIY9wwWMHH8HpFGRWbs67kGcrGiBuYMmTnAZgOXWlsN3opV9Fc/dAf
	HqmTG0MGkDl4iicH7L0JbTUDeRBa3NLNW9xuFXXLmAPUQZr3eyzaVKfswUL65MWDsWuj6w/fm4zf8
	0UBMC5sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxOLy-0000000DId6-2PKd;
	Fri, 21 Aug 2026 12:28:10 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxOLv-0000000DIca-3V2U
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 12:28:08 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-6a0a4a28cbdso1829195a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 05:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315285; x=1787920085; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/h0XzmwWRXUqJNSMv5UtY0V0xlijWuRLVo42IsC8mD4=;
        b=s9F5rqbhHIQeeqW4MKfZoIWmzjo+DtNCMk4yIKnQXSdgBs+SnxkYTZ2drUbW81/r4s
         +ectmqumnKgFF1s044WRub4pROLVFGhz+20Ri0IKEl4WmHx8fwIayM6ATh8ffuBgC1eE
         jxpQuduOZgdlej8/Uoqo1m1HNnK+zoymqOItHWLIsD7DrwrpRKLMi9HMjDyo1syDrp6o
         TukR2cVcvlr3GRp9lWkqtP195ubvU4zvTUYrlEVtIOB4TTREOcSkG57k1iLuQcXt3Pz0
         2TQlFP1Oz15OL76scml9nX2s9+90WfXHgIgRJ1lqU6nzNqiAOjnioSPL8abQTv3tnmyD
         KpRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315285; x=1787920085;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/h0XzmwWRXUqJNSMv5UtY0V0xlijWuRLVo42IsC8mD4=;
        b=s9nNaszTvWQNLwdO9E1GK8sanYg2xJHFyzVwby5HWXOZDVj4oqOvPQI/wtmE/emlDU
         ECnBnjNjook169PlPu9qXcNRIw0EPqfnRp7R1BtkJIXC0D86LAWbC+BTodIbwwa7Omg1
         2BdzpFfo6pMQNDfrrn6V9p08IPeAxAj/QCTheYasnJgCFLlB23FS8/Ujc1SJPW2ASpWU
         tQ6EoKojvEa/nw6G0u3Z4lnN1bABcnS+Ii8xGNTS3GPN4ksFLsrlWH24Tf4OxP8c5VZH
         cPGCLod1Qehgi8LxGMetp1tGvAU7AuPoM6+/4/QtQWX+RenV5+pqjUkeybcXcwWc6k9q
         GXtg==
X-Forwarded-Encrypted: i=1; AHgh+RriFqf7pdse5g+DO/efzPbgrbbuxRa0omdFdwEczkYyqERkCVUmUpFp57HuNwMcAsEwPfKR/A2qTOdqhf73l43Z@lists.infradead.org
X-Gm-Message-State: AFuF++mn/ICTot7P6MzIDQujDOsy+EbhVlXV8AP9Sb0sev8opUf/9NGt
	DBt9T0tO7sr4PupuCuaOaJZKuFSM/B1T22JQRy3j2qrbv8YtekLE/8Qc
X-Gm-Gg: AR+sD11fAxFC/6qG+m6I5cuASrLQARSuTrY86QjHpWv/gwp/4xctMDk66FFGsvKanCN
	g7LIHqrtybPB4ANkGmn6HxKObA0G5Uo7Ld9muTVqgKvj0zEtNePFNN+W2R0yi0t19gPYqXTBQxw
	3ort6j4HQoTe/fFdUo843WmpGjDGxWpbROT2Kl9VGUd8l+qbqJxheivDImy/2fY42Yw19xJzEso
	rgewweZhbLIFgAfmbBkkLF/qAdMNflPDQG7H/uphBWlvr5CV3M766elhXORRhybDrlAlQud5fI5
	eF7wbV15PdnMUd03wKZPdRgLQ74cU8nW3eqXwlWkNOyGqjWuPU0W3qmebPW1ouYs7JhlK3ZJsf2
	8PiZ0mTWoSfKJo9hCnEZdQgCvRply95P9gW0OpBAdqGHTtT9TzLgvWacN1EysksxXg80R5Ujmtb
	03MJXGLZwIrHaSo+gA8ILMVvxlhLHHn+Kb/8xliZ4Wf+3lxCJ9JnejGhYHSgBHekn/VPlLzrfWy
	qh7U1+3gLo5SG8Qb5BBiaWwqzmnO+YQKNgQWT5z0AKdj7hb7mJJ7j75xQ==
X-Received: by 2002:a05:6402:380f:b0:6a3:9e00:8ed2 with SMTP id 4fb4d7f45d1cf-6a42f27795amr6967378a12.16.1787315285116;
        Fri, 21 Aug 2026 05:28:05 -0700 (PDT)
Received: from GLaDOS.station (mob-5-90-140-38.net.vodafone.it. [5.90.140.38])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3feec9c9dsm6608874a12.4.2026.08.21.05.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:28:04 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	alexander.h@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Marek Vasut <marex@nabladev.com>
Subject: [PATCH v1 0/3] Add support for Variscite VAR-SOM-MX7 and MX7CustomBoard
Date: Fri, 21 Aug 2026 14:27:49 +0200
Message-ID: <cover.1787314780.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_052807_893088_1B627C72 
X-CRM114-Status: GOOD (  12.91  )
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

This patch series adds support for the Variscite VAR-SOM-MX7 system on
module and the MX7CustomBoard carrier board.

The series includes:

- DT bindings for the supported VAR-SOM-MX7 board configurations
- VAR-SOM-MX7 device tree support, including V1 and V2 hardware revisions
- MX7CustomBoard carrier board support
- eMMC and NAND storage variants
- optional WM8731 audio codec support

The implementation follows the standard SOM + carrier board pattern,
where the common SOM dtsi contains the on-module peripherals and
hardware revision differences, while the MX7CustomBoard dtsi contains
the carrier-specific interfaces.

The final board device trees combine the supported VAR-SOM-MX7
configurations with the MX7CustomBoard carrier board.

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite VAR-SOM-MX7 boards
  ARM: dts: imx7d: add Variscite VAR-SOM-MX7 support
  ARM: dts: imx7d: add Variscite MX7CustomBoard support

 .../devicetree/bindings/arm/fsl.yaml          |  17 +
 arch/arm/boot/dts/nxp/imx/Makefile            |   6 +
 .../imx/imx7d-var-som-emmc-mx7customboard.dts |  22 +
 ...x7d-var-som-emmc-wm8731-mx7customboard.dts |  23 +
 .../boot/dts/nxp/imx/imx7d-var-som-emmc.dtsi  |  99 +++
 .../nxp/imx/imx7d-var-som-mx7customboard.dtsi | 378 +++++++++++
 .../imx/imx7d-var-som-nand-mx7customboard.dts |  22 +
 ...x7d-var-som-nand-wm8731-mx7customboard.dts |  23 +
 .../boot/dts/nxp/imx/imx7d-var-som-nand.dtsi  |  73 ++
 .../imx7d-var-som-v2-emmc-mx7customboard.dts  |  23 +
 .../imx7d-var-som-v2-nand-mx7customboard.dts  |  23 +
 .../boot/dts/nxp/imx/imx7d-var-som-v2.dtsi    |  64 ++
 .../dts/nxp/imx/imx7d-var-som-wm8731.dtsi     |  65 ++
 arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi  | 633 ++++++++++++++++++
 14 files changed, 1471 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-wm8731-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-mx7customboard.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand-wm8731-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-emmc-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-nand-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8731.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi


base-commit: 9400c5b6aa357be2379c98ae86a207bc21dc7a48
-- 
2.47.3


