Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53933C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 10:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tNFLgO9kfRuOPSKdW9yn0XSFMUHevRdsYw2FI16nNfU=; b=kfBSenyOtrefk+9AkNkoT7z5j7
	fT4gt7RFSBrVEXgCt6QbAMmiIMlNl7nnTTuESQSBtbEezYHmyHpgnbaHOr4BixCyEUeBK9lywkYvs
	VGw2M5QpzVGhwbFktCU1qjkIc4EHJLo+l6dOACK4KWiO7ok4cO3bYbzaVjnnPqy0vra3EPSuoX9h5
	NbKR4as6WEu5Jp5Um2oact64ogD947NWlecPwo876ZAAwaftIZgC7BDUxHJDUSNN3rhjrQgXCoAnQ
	J+N3B6V/0XxbumTYg39YsE69+UhgEWJykdq0XRKLVV+Ii+lh3usTyUUSrqWMnTm8v1eyY06I9TXLj
	AvlqQ8OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOwf6-00000006YLm-44Vp;
	Tue, 10 Jun 2025 10:57:00 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOvne-00000006R03-14zt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 10:01:47 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-607ec30df2bso4089207a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 03:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749549704; x=1750154504; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tNFLgO9kfRuOPSKdW9yn0XSFMUHevRdsYw2FI16nNfU=;
        b=geS2+NNVLXoWbrsY9MFYo3Zm5YJ8PzMZ1ZfBofjkA3CKuiAEXUfhRkN9JZDh687iiR
         tTxcwqtQ+C/I4NeYGj9mm2mcpL31TYHzvK4TjRpUvCdPigEgWUKfsd4yzWDIhqoEOVYG
         MvphDJKHq0nhjUmby0Otm0nv0osJSakpDxTV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749549704; x=1750154504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tNFLgO9kfRuOPSKdW9yn0XSFMUHevRdsYw2FI16nNfU=;
        b=qMOtPL8MS+sZtiOJNTY5Y0y01NnbmM8tF06KUBWgcW5znww91KY0g2nMz93zY4X+u3
         cEGbcb+Efd8U9eA5tcDU03kK5hJ+abHMn8TMi7EIz5Kw96WwE0LWF+w4gA5uBtuR/j0n
         BwpiwRsN7QAaCIkMrDfNBtwR9W15KNv+QeT/kascWwxVX0NubmaPHYbaBwLubu2+fdVe
         vsPIgdUvWXuSVGyIlYWw8rmOAI1rxfenH2HxPyrf03OSXWZvPQHMXabSIYsIjiDMaigx
         IFrCIufU+GI4RnQLxui3StFU0jdplhsWYf72Fs8hAfpqEqfqThJd3ffPZXFVY9ZMbJEM
         iYQA==
X-Forwarded-Encrypted: i=1; AJvYcCWn2LyTvsSNjo/4q9Er49eiVldqznVCItQYtnq1ltSX09bfB0cN5lt1OaMkWn0v3mKCYsddaasjyakvSNQ3kRBh@lists.infradead.org
X-Gm-Message-State: AOJu0YwlCi0VeN2gaOBT8HAafg3mvqMW5I4Bb6+YFvXJaNLHbk8jLHai
	I3G3HUHiQyftFgKWNoFuLjZyB56ZgRsXjXq0AQ0Ga3NvX5DtAkA0BTTlUMGe0sUottk=
X-Gm-Gg: ASbGnctP9CY/aE/mpQaT9azKExbKBWJIegxb+eFq2yAD/gzY5P53Gq30V4dpUPPGqSz
	DNindvi6YLCGnY9o0q9q4eaQMVnr52s6NcKI8D9WMKxaNJ6dnxFgMlXjwUb69y83o4pg8t57Y3g
	wobLeevIHY9wt45RajkyO+GoS3hED8nGqODivYK2hFiucMjFrupKrsMI/70JFxPIqUZB9Mx7Zdp
	Q3actCeMmLayT4iFjj09wVlNVSNWdRohyfRFSt0N6LgsuvUZnuSls5YX/StKAJdl9zm08BcHe62
	kHiyT9fN1wQdFz9iB2bLrRjBj4WNSuFaSnCRgfxh7x8QJXbrrMREOlpenMMXHWvK6TFB0KAtoQ6
	5Y4X1JIw5F7m4hxjysw8JGkmNp4k=
X-Google-Smtp-Source: AGHT+IG57PZ6Xm8M/Dqr4czCnzfYZyTYEAAg9doQ7EidKIaUDhSXFwVRX2wpqWFLIhoaLQHBuY9O5Q==
X-Received: by 2002:a05:6402:26c6:b0:607:5987:5ba1 with SMTP id 4fb4d7f45d1cf-6082d9b3428mr1770004a12.20.1749549704176;
        Tue, 10 Jun 2025 03:01:44 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.179])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6077837ed0bsm5953438a12.36.2025.06.10.03.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 03:01:43 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Matteo Lisi <matteo.lisi@engicam.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Ard Biesheuvel <ardb@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Eric Biggers <ebiggers@google.com>,
	Fabio Estevam <festevam@denx.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Michael Walle <mwalle@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Rob Herring <robh@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	Tim Harvey <tharvey@gateworks.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 00/10] Support Engicam MicroGEA boards
Date: Tue, 10 Jun 2025 12:00:13 +0200
Message-ID: <20250610100139.2476555-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_030146_292022_269FE8C5 
X-CRM114-Status: GOOD (  13.29  )
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

The series adds support for Engicam MicroGEA boards:

- BMM
- RMM
- GTW

based on MicroGEA-MX6UL SoM.

Changes in v3:
- Drop extra blank lines from iomuxc and iomuxc_snvs nodes.
- Rename sgtl5000 node to audio-codec.
- Move the reg property of the audio-codec node right
  after the compatible property.

Changes in v2:
- Change local-mac-address to 00 00 00 00 00 00. The actual value will
  be set by the bootloader. The previous one was assigned to Freescale
  Semiconductor.
- Move iomuxc and iomuxc_snvs nodes to the end of the DTS file.
- Move iomuxc and iomuxc_snvs nodes to the end of the DTS file.
- Drop an extra blank line
- Move iomuxc and iomuxc_snvs nodes to the end of the DTS file.

Dario Binacchi (10):
  dt-bindings: arm: fsl: support Engicam MicroGEA BMM board
  ARM: dts: imx6ul: support Engicam MicroGEA-MX6UL SoM
  ARM: dts: imx6ul: support Engicam MicroGEA BMM board
  ARM: imx_v6_v7_defconfig: cleanup mxs_defconfig
  ARM: imx_v6_v7_defconfig: select CONFIG_INPUT_PWM_BEEPER
  dt-bindings: arm: fsl: support Engicam MicroGEA RMM board
  ARM: dts: imx6ul: support Engicam MicroGEA RMM board
  dt-bindings: arm: fsl: support Engicam MicroGEA GTW board
  ARM: dts: imx6ul: support Engicam MicroGEA GTW board
  ARM: imx_v6_v7_defconfig: select CONFIG_USB_HSIC_USB3503

 .../devicetree/bindings/arm/fsl.yaml          |   9 +
 arch/arm/boot/dts/nxp/imx/Makefile            |   3 +
 .../nxp/imx/imx6ull-engicam-microgea-bmm.dts  | 303 +++++++++++++++
 .../nxp/imx/imx6ull-engicam-microgea-gtw.dts  | 162 ++++++++
 .../nxp/imx/imx6ull-engicam-microgea-rmm.dts  | 360 ++++++++++++++++++
 .../dts/nxp/imx/imx6ull-engicam-microgea.dtsi |  95 +++++
 arch/arm/configs/imx_v6_v7_defconfig          |  27 +-
 7 files changed, 938 insertions(+), 21 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-gtw.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi

-- 
2.43.0

base-commit: f09079bd04a924c72d555cd97942d5f8d7eca98c
branch: imx6ull-engicam-microgea

