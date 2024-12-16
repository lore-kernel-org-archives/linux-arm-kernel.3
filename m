Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50096E77183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 15:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uAsk9ZjNjG2Xsz4F0kxEND8XevJ5WxVcer/d+hZes7Q=; b=M/K9RMS11cdMJseEvTzLbim06s
	82kO8XiIfsOSohytQ4jf+cW16HgFOv3PZ1wEqXZ+JRWubOUrnPxAcRVLC+SOv64mvvRmSymfr9Ayr
	dU+TvVR0S+U/aFLHoG9W45WzlX0QLWa+FdnZhvEbhGPaG9CziABnweRGIoZOTVJKhiCnjSldGb6Yv
	QjT7a8odQG8lcyQgG0ptVG2FxO6vSJGencTRjf2J4BcsHFcHk6cwiQ+2aw6/vMXuf1pRy4FGeWK6j
	bBGJ4tPF2cwNDLLKjZBkUSa/FmupNdYVa1BuTeCoxpzjgcd47xaBtvmq3dsWpI8iRuAxjS0RclMgR
	S6/qfbKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNDQo-0000000AU59-35dq;
	Mon, 16 Dec 2024 15:54:50 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNCRF-0000000AJ4b-19KU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 14:51:14 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4361a50e337so29085465e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 06:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734360672; x=1734965472; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uAsk9ZjNjG2Xsz4F0kxEND8XevJ5WxVcer/d+hZes7Q=;
        b=SFP7P1G4bZqUjQ+O7dn4lSSCnr09Q0oiaguKcMHyNHxAB5vrMVtw0edgZc05V3IMC5
         DUmZ6g3H92HVAe0RF9m0bYp73JSkDAVCcPn+++povtzIW1N9jIS5GhJQtSJp87iBsBFX
         AWBqqHx/LICHIwY4ucR+rxPy562jrIAKakm0OS6VEN2bjCwMv6UF1nxARG3Yjre31SXe
         5HXQqpvR3VxyRuLWxf2tLkeBGQJvwz/KBHpnHsYlNDk3fIOuSDBMcx53U4AS65+L4UQN
         S3D3rMTR6Q2kUAkiYpjuLcJ89gthzPI1B3eePzU2GZWzSFDKgpg8KnW8v1YjEPvIhw1b
         kl7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734360672; x=1734965472;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uAsk9ZjNjG2Xsz4F0kxEND8XevJ5WxVcer/d+hZes7Q=;
        b=G9cPOA4xVglV3/CW8axvyE3BAex/GHwjBNnFPErhq4VM0/rpXxtVKx8L60KAmXfZMS
         kIWmPGkI9julvptoFc1JjNxP6US+vEr3bbcJxdPdiMDyVyJvdtg+e4qRXMIEkBYBwdA7
         j7MGZGlgC4WBXr+7OEwRc+z8mI4i2FhzpyDgmARjsUgFaV0SSmduUnd2Ssp5hcwR3AvE
         6hbyWgY65Jv8DDIHL6bWoB7PoWv5EnkSGU61MojrkHDNha9bfrA5o9qzNGkCCOq2lk/t
         HvxfeMXSv3t/nbAZ6qbyhebePagqreLG55L2IFfhTR8/DC9OHY/+fue+zvFlN1Pp1/CP
         Hp1A==
X-Gm-Message-State: AOJu0YwTht6n+PSPSZyV2KQaN3zH4qFSDNKB/KqICrOlkIhymN8iGJ+1
	nVa3QNNr4AiZXakLehy035QCLt1s2kFcd+1B+BHiYYQtpqfLO9m3
X-Gm-Gg: ASbGncuShLiEI03NfK+zoKgHHS6+8Od1E+NKhaGTvjPyFdHtfJwFp+tcwymj7o7bmEB
	4biqXqCinGXVRW/LGy31zuTLnAQqMUMNZG6QMc6eTURMFs/mansj2Zr5pbkh7TpJqq/GU24hHkR
	0zGKC1FygWjLyEMzDlLcPGeZumzrWyjfdI/qFXFbeSAF6jTtELtflCTvWtKh+2WpaiMtqexoeXi
	BdJqoE1dlHuqtKhlWA2Lm6DdqHUFcqlLQHo8AwMi0Lgocufd/hSo1qXQLGCanuK52rSArjbeyxL
	yEsmsNLMWLD/QPT2
X-Google-Smtp-Source: AGHT+IEEdMUhmjBce9trMWEaZmzDbJkRmOJV4eeE4OPNHba9b9GfzehogBrTvU3TQeHPPyjiEdm+kg==
X-Received: by 2002:a05:600c:4ed4:b0:434:a734:d268 with SMTP id 5b1f17b1804b1-4362aa589f0mr119266575e9.14.1734360671467;
        Mon, 16 Dec 2024 06:51:11 -0800 (PST)
Received: from playground.localdomain ([92.120.5.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4362559ed6csm141616455e9.24.2024.12.16.06.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 06:51:10 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Takashi Iwai <tiwai@suse.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Frank Li <Frank.li@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/5] add sof support on imx95
Date: Mon, 16 Dec 2024 09:50:34 -0500
Message-Id: <20241216145039.3074-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_065113_311773_C9FA7FDE 
X-CRM114-Status: GOOD (  17.22  )
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

Add sof support on imx95. This series also includes some changes to
the audio-graph-card2 binding required for the support.

---
Changes in v3:
- Ordered DT nodes alphabetically
- Removed 'cpu' and 'cpu_ep' labels from binding example
- Some small changes to the binding commit messages/titles.
- Link to v2: https://lore.kernel.org/lkml/20241113195240.3699-1-laurentiumihalcea111@gmail.com/

Changes in v2:
- Added new binding for 95's CM7 core with SOF. fsl,dsp.yaml is no longer used.
- "hp-det-gpios" and "widgets" properties now reference the definitions from audio-graph.yaml
- Removed extra empty spaces from DTS as suggested by Frank
- Ordered 'edma2', 'sai3', 'wm8962' DT nodes alphabetically. The order of the nodes
placed inside / is kept the same for readability
- Ordered driver header files includes alphabetically as suggested by Frank
- Removed "reg-names" and changed the maximum size of the "reg" property to 1 to align
with the other NXP CPUs sharing the same programming model (i.e: audio processing with SOF).
The region described in the DTS is the SRAM and the mailbox region is now hardcoded in the
driver as an offset to the start of the SRAM region.
- Added new binding with properties required by all NXP CPUs sharing the same programming
model (i.e: audio processing with SOF).
- Various driver adjustments made to accomodate the DT changes + some bug fixing related
to the mboxes not being requested/free'd on resume/suspend.
- Fixed value passed to "dma-channel-mask". A set bit means the channel is masked, not the
other way around.
- Link to v1: https://lore.kernel.org/lkml/20241023162114.3354-1-laurentiumihalcea111@gmail.com/
---

Laurentiu Mihalcea (5):
  ASoC: dt-bindings: add common binding for NXP audio processors
  ASoC: dt-bindings: support imx95's CM7 core
  ASoC: dt-bindings: audio-graph-card2: add widgets and hp-det-gpios
    support
  ASoC: SOF: imx: add driver for imx95
  arm64: dts: imx: add imx95 dts for sof

 .../bindings/sound/audio-graph-card2.yaml     |   4 +
 .../bindings/sound/fsl,imx95-cm7-sof.yaml     |  44 ++
 .../bindings/sound/fsl,sof-cpu.yaml           |  35 ++
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx95-19x19-evk-sof.dts     |  75 ++++
 sound/soc/sof/imx/Kconfig                     |   8 +
 sound/soc/sof/imx/Makefile                    |   2 +
 sound/soc/sof/imx/imx95.c                     | 401 ++++++++++++++++++
 8 files changed, 570 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,imx95-cm7-sof.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,sof-cpu.yaml
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
 create mode 100644 sound/soc/sof/imx/imx95.c

-- 
2.34.1


