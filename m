Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0453BD637AF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 19:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cJ8QMGzCMpCaQwAwEg2/P5qPEfEiY64c9xCdF+siaoo=; b=p2UBt+A0JNCu0lgfpuIEzzd2Y3
	Ci42z9wpUYrZHDoNwoD5br3KS+8s9CDoWQlZjYzUwrL5HG6Vvt9U4wlWV/5IonJMHqTxjHcCvKLUx
	qFlq+JYdwm06BQMmMX6tDoXmVZYPOOwQoNUvt7O8VwRWeBGbqbP5T3q3Q3CK8F7RJVWo+8zCp9HTn
	S72Yot4HvWtAoSqALmgLyeGhc+q+yOI5xf9LBFgpkWG5tDTPqXYgrXstEbtLijd0ZyUvk3E3L8SRM
	oJXJa34UGkL3+2XR/TtludLbFpg6kmUdQgTkE3rwuy4rDMSKQr4tSI9W7O/a+4WJzjA4EtDgObang
	ywrBUjTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBJSN-00000007t4g-389j;
	Wed, 13 Nov 2024 19:55:15 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBJQV-00000007sln-2eie
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 19:53:21 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-432d9bb168cso225635e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Nov 2024 11:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731527597; x=1732132397; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cJ8QMGzCMpCaQwAwEg2/P5qPEfEiY64c9xCdF+siaoo=;
        b=moRX13eO1z/X/GmWREO7wLsPAfY6odrcM1yfhx5DQsgnWM15JBU6vtwgAo5bKWxKNi
         0rvrVGqcGduwLdzaReepsBUwjQh1xgUNkwhUR+EfCrgzdWu9gRb/zjlMVIBCAwbP0LMz
         RjYEQYspRE0NhD3zb11fSKb5VCWrI68duMaosuJMls1D/nN9420L2LEm3e3Zp4NuSvlU
         qhBmkc8h1fN3RKnitSwMxqtFXRQSetMqMLWO4yTnXlKz3RBR6K4Vr8+rq99JG/kjbYpI
         BN3AKtAYUm2fLNvUU9x3uSCiQIBbgJ3xc2CqhtYub84keLxKGapY8Wxtpn7noh30nZPZ
         FhKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731527597; x=1732132397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cJ8QMGzCMpCaQwAwEg2/P5qPEfEiY64c9xCdF+siaoo=;
        b=blwacGlCDdfWkakpzxMIBl8IBcNqvAaGCcqXra4Lis7gXgSWb9wzcvGn08ES6IgIxd
         1TjgvFeNrGCgn5RyRBBLnCQ8EV9bMBJllOxgJHtggTSHDUomGUe0HENmmkWHgZjFCrDq
         4Ly+lITc2BhlF2F4mZltAI6KCgMi4EZaAgBKOPhFKCJur0ZvbB8ChTeRn0ejyVmHpZZx
         jaEUF4MnPBm+6D0yAYAiCikiqC8a6lC52WORA16jG3iSxSmofA7GjS7IXyH9Dwhdjv8G
         6Y1bmBhnrUCz4RwgvyKYLJbPAh9dQa1bfVkc4fDnaWeySORy5UG/n/0lljXA39fOk+FF
         uzkw==
X-Gm-Message-State: AOJu0YzvU0ZFbc9G/PcGudAQ9tsYC7P+Ooz/75DY2Hfo0882+4UPwqtc
	LBdPi1qDSHK5L7e/nfbP4swTqudR1RlPLf4dXD2d7UlRIjW14kKKwcotpOScMSw=
X-Google-Smtp-Source: AGHT+IEJ+OgyDhiObJDLSUqfKPbscxIsWPEYCybVM9JHR8F0mDVuDPh5t34siJcnZuIWqoUEsXJC1w==
X-Received: by 2002:a5d:64e7:0:b0:374:c7cd:8818 with SMTP id ffacd0b85a97d-38214064d0amr634681f8f.22.1731527597046;
        Wed, 13 Nov 2024 11:53:17 -0800 (PST)
Received: from playground.localdomain ([86.127.146.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d5503c58sm34633065e9.22.2024.11.13.11.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 11:53:15 -0800 (PST)
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
Subject: [PATCH v2 0/5] add sof support on imx95
Date: Wed, 13 Nov 2024 14:52:35 -0500
Message-Id: <20241113195240.3699-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_115319_708412_968BC695 
X-CRM114-Status: GOOD (  17.34  )
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
  ASoC: dt-bindings: add common binding for NXP CPUs
  ASoC: dt-bindings: add binding for imx95's CM7 core
  ASoC: dt-bindings: audio-graph-card2: add widgets and hp-det-gpios
    support
  ASoC: SOF: imx: add driver for imx95
  arm64: dts: imx: add imx95 dts for sof

 .../bindings/sound/audio-graph-card2.yaml     |   4 +
 .../bindings/sound/fsl,imx95-cm7-sof.yaml     |  44 ++
 .../bindings/sound/fsl,sof-cpu.yaml           |  35 ++
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx95-19x19-evk-sof.dts     |  74 ++++
 sound/soc/sof/imx/Kconfig                     |   8 +
 sound/soc/sof/imx/Makefile                    |   2 +
 sound/soc/sof/imx/imx95.c                     | 401 ++++++++++++++++++
 8 files changed, 569 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,imx95-cm7-sof.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,sof-cpu.yaml
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
 create mode 100644 sound/soc/sof/imx/imx95.c

-- 
2.34.1


