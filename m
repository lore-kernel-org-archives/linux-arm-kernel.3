Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2D3C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 10:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TbJ1tbrVzaq9Eu0evFfvKDOWxuNNrI779QMTpMN0PYI=; b=vix6Or9efbtmWoWPAkVPEyP4p1
	4dIr0eJfMrTLx7XSVXx33br2Bq0sTTixas2/wlPWImN/RjEjyKvISA3j/81yecauDfBBhF7altvrf
	Powe/ipXG1crfl3kGDOKbKTH52DLxKtG3LKi/PK0iyIhCmn+Q72O0OaTZ83HCenFoBayf4K3vJPLD
	cDosj+UuGM3t21MGBRvy+a95syqcwNjBYQcxUt1CUcqRt9YGCGXUsCtstCiYBbAul4CxpUpmO+zZw
	QG+w+2z9TwdkedQ6kNgMyug+itWRHFmgh6cZQatOc5wwc6PiN+n4OLSPgKPFs62LIB+8PfC7lXh1a
	O4C4uniw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOZao-00000003svM-100w;
	Mon, 09 Jun 2025 10:19:02 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOZYb-00000003sRC-161d
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 10:16:46 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-ad89c32a7b5so663043466b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Jun 2025 03:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749464203; x=1750069003; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TbJ1tbrVzaq9Eu0evFfvKDOWxuNNrI779QMTpMN0PYI=;
        b=O09N3Ut8GHHEpr+nn5TsuX17eIY4fWpxFeQfrzv72HibvHTh6zzDf5ChLSVinLCNQ2
         tOlGVmrHeI3xoaQ6OE1XKVxSkuRCJEBbmTCe/ehGAx+bSDitCKf9Qat2VKePyvR3vtWq
         kFHoZg+s1D2S/tdpizvywEcxLUPFJ4Dz7BMm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749464203; x=1750069003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TbJ1tbrVzaq9Eu0evFfvKDOWxuNNrI779QMTpMN0PYI=;
        b=TGmk9sY3tY1a3/cPeeHTPkaCQ896+LfKz6pc+tHfxmvoN+OUNXaonipnJkUUv+PdtQ
         FZb44e4MiFXs9e85uEXAWlK0KTysaBB8g21j3LYsx6uTofOp+IllnL1ltvCNFZJpBmxT
         x5+GV4G3CPThDnj6BXhfi51K9wUUudTqAlEfWECQtaqfPd4PtlJyu+AYlyFe98sw2xgs
         ccYF9yLLIzHuE/VSYzJBDBjZj4mhWscQcuvhFFfcrWQ/qij+/fMVOTVB4tliv4/gZIsq
         XDwGYpuJqjqw/Tx2l+7mqDfJNg7lsAG76pMYzZC+lknY3H1ZHlFKySm0jdOzfJWmzXEJ
         pd7g==
X-Forwarded-Encrypted: i=1; AJvYcCUvzOOX+fILJWsUtnZ+JoCNAPJWSPyb6yRzyiD9UqEmjsh7RzGVPoYBxC+KrOblbAnYOaqe+8ylS3mqtokQVUtY@lists.infradead.org
X-Gm-Message-State: AOJu0Yxnqhh4tEEf3FDOrwIp8UjZaQP+zbwe7T9N3/bDtFuAIMfIw7KB
	gGE2TzMuxVERmpUIgSujs+NNbeDH87WFMUXCWhha8xDzVAFit6+Cne0YHccoccqLjaE=
X-Gm-Gg: ASbGncvRRYmp/ajW/7pU1uH7s1wepFapWmgrWnolbf+5sl1EvWd/8mZsKG5WwH0JSLs
	PPJe31OQ7PetyZBwBoZDrt6OngEs2HEg2O7y4pxe/8GOCxJdC5hevEEXdhxJ5nycvI3JQPEklia
	G8sEWDrXRxmSayDRGPEIFizToWE8KLM+fm1ZAmrV0cHbYETHZmdw/Nn97vTVwSEDvUDtMNh3KOp
	SQQDE+1VCGZGmaFSIGE6X5sJR0qhWS9lTC1ImRsTNFSfRNUiq7MV9BzvNVnUcnWzn4ZUPGuxOOB
	8Jf78TqzbJB0aSvqXujTDafq5LbXCgr7CqWdEf6JI4OqE3Vkf98tFQP+NJfzcC7uUVGvz5P4aXD
	5uw68wWdGGLY8ME6cFAIeAriIjCySmneM10r4oEO+
X-Google-Smtp-Source: AGHT+IENu+cN1K/Tck/lkp6DHf9W71FZqSXJAShei9q/DyrSApC2JOSHLAClYdMgr/5JU1IPWNRyUg==
X-Received: by 2002:a17:907:940a:b0:ad1:81c5:5ec9 with SMTP id a640c23a62f3a-ade1a9c9e50mr1280776066b.4.1749464203323;
        Mon, 09 Jun 2025 03:16:43 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.40.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1db55c7esm529257066b.49.2025.06.09.03.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 03:16:42 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Matteo Lisi <matteo.lisi@engicam.com>,
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
Subject: [PATCH v2 00/10] Support Engicam MicroGEA boards
Date: Mon,  9 Jun 2025 12:15:33 +0200
Message-ID: <20250609101637.2322809-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_031645_314592_F7B469C1 
X-CRM114-Status: GOOD (  12.84  )
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

Changes in v2:
- Change local-mac-address to 00 00 00 00 00 00. The actual value will
  be set by the bootloader. The previous one was assigned to Freescale
  Semiconductor.
- Move iomuxc and iomuxc_snvs nodes to the end of the DTS files.
- Drop an extra blank line from the DTS file.

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
 .../nxp/imx/imx6ull-engicam-microgea-bmm.dts  | 305 +++++++++++++++
 .../nxp/imx/imx6ull-engicam-microgea-gtw.dts  | 163 ++++++++
 .../nxp/imx/imx6ull-engicam-microgea-rmm.dts  | 362 ++++++++++++++++++
 .../dts/nxp/imx/imx6ull-engicam-microgea.dtsi |  96 +++++
 arch/arm/configs/imx_v6_v7_defconfig          |  27 +-
 7 files changed, 944 insertions(+), 21 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-gtw.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi

-- 
2.43.0

base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
branch: imx6ull-engicam-microgea

