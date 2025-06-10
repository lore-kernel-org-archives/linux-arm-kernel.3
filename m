Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B7D9C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 19:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rDynENx9ibTpBe8p9EgALnsApzixLUrLDUFYT9ocKVA=; b=oJtDH3gtUrfKb55EPBg5O/f2d5
	OQnrqQ4uVv3F26glemKeg1tlyZpI/0uDOt0ujvslut1FjrvYj/z0+WDDWqCJyleViPrn596RkYc3f
	VWDbGGpET3weBSym2yJxoaIP6yn1xJvqJoplPg/UbLv4yhIdnAb4UR5vM9feP3Rfm/N4cxaXGx7kw
	wsfpJJ7LqdYmMQOQLkScryelTjnVz+Btifbp9mkHFtzofyljiy87KIAR3S6b9TBQ+aSwE0YZRB1YO
	GxF2IPscy2mh0hw5iy6a9l37VHINKeIqtzypHILFbCsMaNhjq+50w5YEp7BEHtFenmm6IENkST6bC
	LVPD9MUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP4hs-00000007vTA-0buV;
	Tue, 10 Jun 2025 19:32:24 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP1QU-00000007Ozs-3LTb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 16:02:16 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3a3798794d3so4861733f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 09:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749571333; x=1750176133; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rDynENx9ibTpBe8p9EgALnsApzixLUrLDUFYT9ocKVA=;
        b=ZcFlhWnJck6QTM5PKFEEaHgQn64z7S1EJimpQxbIBETqp5kaLAu3ZpQlcB3DL8i/Bb
         qXPP5ML2K5EulZQs4xiGo/QcQAuUi0pGn1Oos+32Q75muuFe999auQC0KTDFdS4Pgz9R
         TyYwKAXidfBr0AhrbGZacNx0XKdoGbWvb2j/4iF2M0aBDXMVNVp5WFG0atH9k8WYnhd7
         du8n4hErdhQJYSsFzN5J3f/3jBtTqN5EEiFRSAG2jb2R39nZCUfstVKUUyHDC2eFWIOY
         WX3FS/+hrTYeuV5agP7d9qPQzlbAgM8v5rYwFTaBLTd96k1h+Psm0mPKRwgZhFes240x
         Huxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571333; x=1750176133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rDynENx9ibTpBe8p9EgALnsApzixLUrLDUFYT9ocKVA=;
        b=o9mrzjpKSt2uqUg6Sb5A0CWlESRwFU1fp0gZq6Aa9waLnWXVzJ0hHAK3KloUSRO326
         c3g+YMhDIP603+vDGe6Vtmh3HM5a0B8uWPajokKID9kS+GQPjWl4ylpq1oBNcxZZB3Yj
         600SCK+7kdIG/V3o+YAFOO+ABYti494nnJaozhwXfDacUyZvs/Yk9BGM99kjLezsqr3M
         n5ESaGMugR/Ltkrf7TMJ/1pQUFBTwxZunfdJTJMpEYXM7EzCDDpder1PhKt53K6zdv1l
         RCi6oNbUhmTOlWa0y5n04hRj64ljhWdy79PuEEmcKN5gR/k+L57ORdX10doQZaPTpje5
         b7tw==
X-Forwarded-Encrypted: i=1; AJvYcCW+607lu6tqTH6AN0b3Gs0x+tP0wzeQkU1TdgkAlgbA3cVmz2PJU64y4z+uuqSEC0NfhgaBzrmqloPNPN1cyYyV@lists.infradead.org
X-Gm-Message-State: AOJu0YwV6XmQlQSPmIsNNIsc1Aj2wm9syz7MzoWy9FxI+mFQUl7CX08o
	PQ+eS14g3Tv/wdWiwgrsXw89u+6+nSIQaH7y4Xe70pcEfxdysvSVjH5r
X-Gm-Gg: ASbGncuSI/+pUDKerdQU0qomTvnQLzvezdkgoZGkD1KDMkqcOCv+29CrCxmU7J6EsKU
	X/Geg/XW08nnEAlS/UPv38QsMNfaN6KLl9cItQYEej7tC4o5zPj4FfBPaX3wkQjUIgrNUBlXKZd
	ZR6ZC7EmBBb1NNBKMnHiboMXCGgeiOjziZAC7YtIdZlTTkB3xpAMb2DU8bmMwBIikZeSRcUCosa
	ipmfwmR0htheQY650PQR8PcLLSibCiF/ekrRAtX3xFcx4GS6Txb5u9g+SdGmUqH9EEYzHkAXn1L
	2dX0PyF938KzOj1Pl/ApDxg2nMbLKf0moowiOXvuIcFWDV7FA31Bt14QmSLoYRzyri3A40R6XNG
	0XxhThtpx4Q6zAY/yxE6OiOM=
X-Google-Smtp-Source: AGHT+IGJNkskQ6HtPeSLERSg8E7NgFIUqPVnq0JdUJ3imp4C1Ig/Qot2Z0dvSBzfgLdyazSmt2eRQQ==
X-Received: by 2002:a05:6000:250e:b0:3a5:2670:e220 with SMTP id ffacd0b85a97d-3a531cb01b7mr13702741f8f.32.1749571332193;
        Tue, 10 Jun 2025 09:02:12 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229e009sm13017806f8f.16.2025.06.10.09.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 09:02:11 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/6] imx8mp: add support for the IMX AIPSTZ bridge
Date: Tue, 10 Jun 2025 12:01:46 -0400
Message-Id: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_090214_836671_73B986DF 
X-CRM114-Status: GOOD (  26.20  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The AIPSTZ bridge offers some security-related configurations which can
be used to restrict master access to certain peripherals on the bridge.

Normally, this could be done from a secure environment such as ATF before
Linux boots but the configuration of AIPSTZ5 is lost each time the power
domain is powered off and then powered on. Because of this, it has to be
configured each time the power domain is turned on and before any master
tries to access the peripherals (e.g: AP, CM7, DSP, on i.MX8MP).

The child-parent relationship between the bridge and its peripherals
should guarantee that the bridge is configured before the AP attempts
to access the IPs.

Other masters should use the 'access-controllers' property to enforce
a dependency between their device and the bridge device (see the DSP,
for example).

The initial version of the series can be found at [1]. The new version
should provide better management of the device dependencies.

[1]: https://lore.kernel.org/linux-arm-kernel/20241119130726.2761726-1-daniel.baluta@nxp.com/

---
Changes in v7:
* fix merge conflit caused by addition of the reset-related properties to the
dsp node.
* align values for the macros defined in "imx8mp-aipstz.h" as per Shawn's
comment.
* encapsulate the default configuration and base address in a
"struct imx_aipstz_data" to make the driver more future-proof as per
Shawn's comment.
* link to v6: https://lore.kernel.org/lkml/20250415171919.5623-1-laurentiumihalcea111@gmail.com/

Changes in v6:
* drop the 'IMX8MP_AIPSTZ_HIFI4_T_RW_PL' macro. Its whole point was to
help with making the DTS more readable but if it makes it look worse
then there's no point in keeping it.
* use consumer ID as first AC cell and consumer type as the second cell.
Better to go with a format that more people are used to as long as it
still makes sense.
* pick up Rob's R-b
* link to v5: https://lore.kernel.org/lkml/20250408154236.49421-1-laurentiumihalcea111@gmail.com/

Changes in v5:
* merge imx-aipstz.h into imx8mp-aipstz.h. imx-aipstz.h is
currently only used in the DTS so it can't be added as a binding.
* place 'ranges' property just after 'reg' in the binding DT example
as Frank suggested.
* use the  (1 << x) notation for the configuration bits. Previously,
hex values were used which didn't make it very clear that the
configuration options are bits.
* shorten the description of the bridge's AC cells.
* shorten the message of the commit introducing the bridge's binding.
* pick up some more R-b's on patches that remained untouched since V4.
* link to v4: https://lore.kernel.org/lkml/20250401154404.45932-1-laurentiumihalcea111@gmail.com/

Changes in v4:
* AIPS5 node now only contains a single memory region: that of the AC
(just like in V2). 'reg-names' property is dropped.
* AIPS5 node now uses 'ranges' property to restrict the size of the bus
(1:1 mapping)
* change the number of AC cells from 0 to 3
* add binding headers
* link to v3: https://lore.kernel.org/lkml/20250324162556.30972-1-laurentiumihalcea111@gmail.com/

Changes in v3:
* make '#address-cells' and '#size-cells' constants and equal to 1 in the
binding. The bus is 32-bit.
* add child node in the example DT snippet.
* the 'aips5' DT node now contains 2 memory regions: that of the
peripherals accessible via this bridge and that of the access controller.
* link to v2: https://lore.kernel.org/lkml/20250226165314.34205-1-laurentiumihalcea111@gmail.com/

Changes in v2:
* adress Frank Li's comments
* pick up some A-b/R-b's
* don't use "simple-bus" as the second compatible. As per Krzysztof's
comment, AIPSTZ is not a "simple-bus".
* link to v1: https://lore.kernel.org/lkml/20250221191909.31874-1-laurentiumihalcea111@gmail.com/
---

Laurentiu Mihalcea (6):
  dt-bindings: bus: document the IMX AIPSTZ bridge
  dt-bindings: dsp: fsl,dsp: document 'access-controllers' property
  bus: add driver for IMX AIPSTZ bridge
  arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
  arm64: dts: imx8mp: add aipstz-related definitions
  arm64: dts: imx8mp: make 'dsp' node depend on 'aips5'

 .../bindings/bus/fsl,imx8mp-aipstz.yaml       | 104 ++++++++++++++++++
 .../devicetree/bindings/dsp/fsl,dsp.yaml      |   3 +
 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h |  33 ++++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  16 ++-
 drivers/bus/Kconfig                           |   6 +
 drivers/bus/Makefile                          |   1 +
 drivers/bus/imx-aipstz.c                      |  96 ++++++++++++++++
 7 files changed, 255 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h
 create mode 100644 drivers/bus/imx-aipstz.c

-- 
2.34.1


