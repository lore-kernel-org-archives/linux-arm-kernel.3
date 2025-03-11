Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20AF6C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 16:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UIDBs7DD8htZivMkrDKOWUTb71/7yaXdmxjJ1UItOWw=; b=stInSSCYwVY6H1IQW2rW5xa1rg
	5jHKC8yaDcT4p9fYGBelZf21A0FCPNi986o6m7eIZ9S6ZgNmT9IlmLVNoK+kPB+YUv0jhc1tDkC13
	5XqrrPJbrWrliwwZvshq6brZYhYVbxwLgE+o1Eizs6vNy0qsLs+kSlfGdXGCgbDqiyjc6XREp3obr
	OpnkCMJiqEAuYHGKGumTF7Vy8XhMqkj88uLT06D5XlCTFtI3Zxaxi6/4X04hx/iQ1KlTLNOB3Dk/u
	j+NvMcUV81G+m+5if2hoAUeUs0lgY2QfICphkJACxpsFxg1sPckblEelDvSo5MYKFEChw2fLKDVNP
	l0U/jK0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts2aH-00000006Lct-42EM;
	Tue, 11 Mar 2025 16:36:01 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts2Ye-00000006LQO-18AD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 16:34:21 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so7795655e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 09:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741710858; x=1742315658; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UIDBs7DD8htZivMkrDKOWUTb71/7yaXdmxjJ1UItOWw=;
        b=EbOGIGmLGKZaAAUDMoCm9LMTMK4hrE9ai2n/ogBXzgJKPA8bgXL34ZyQGKlLQyLcpW
         NMEL9Zbs6BvDaRAvr+/86A3kx4j6oQB1TIxZOuoOkZrT05RgdCzRdPnbX5S69RAx6emt
         NNMkgcVTfivVBOELi7GxcUFFnNYDq7ZE3pp2bmJV7N7cEquh8PED105zGAW/xOIrIjYv
         DKwwul0tf75G53EVwsFYPUfyxfw6S7czS5MPrW9eY62YKLI8+eRsPNzrVrfhWq7ZfS0F
         fCScdnuvyBHUAVhxQxzWzskV1DTOil9ABJD/rHPmVn/IpCCg0RWf/IWX4jVLeYtuBjB+
         aOkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741710858; x=1742315658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UIDBs7DD8htZivMkrDKOWUTb71/7yaXdmxjJ1UItOWw=;
        b=gNYpbqZbzKNWWqCKhZBFEV1C4OK4UnbQMcA1Fy6SjTq2f+SviVezZmWXopUbYq9ZUM
         f45D/SPXWJ3o2WPXvUMdTlmiNzJST8E286egCpGu9Qjw/zv7hS3xSVFb5iEwZDzGrfe5
         aTFenN77veb/J0KLDbXuIvKsVp5CORsSXe4enrIxxmwvv/tMg+4AIOWo6lkN53DxuNJb
         aTqLsNM4HjRtYbwoOdli0vG1QOIyQswZflZ6K6qZrDrSSkiruDuPPZ8EB/dX1dS8EQDM
         aUdgTR04aTJlHTnL5cPkZOrKto4MJ9YTCTWA0Q5jDf/qkOlpTlHKpLjQJaroeMGuWD2v
         RTUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXIfbIRZa10My8UfJHlVJvHutfqU9u72b/AnOcbtZc5uwjcvMPxTD/gqQdJnBqvOj8fdIjJg72Tm+9Iv7nN40S@lists.infradead.org
X-Gm-Message-State: AOJu0YwUGO5hNdXr/LT6rt0QVT8MYKlQy+r60nsIWeotGthfRwWzGj5g
	rGY5h/YZ6o9ZbympozB6hJsSbELaQA15+ZQWxRs59YHIcwx4+LKl
X-Gm-Gg: ASbGncuS6HlhdHq7rQqFy+TcCQAZ6SLsRFASBk9xC/XnC5R1LKuswFQobFkOSkg1ZcO
	L06eIZPc4WMlkaC2ppPSww41pi7Cq8VJT0xFnltfZFOQKH1qSpQcd9vKT9Ct6VNqVd2+ZKmgkVr
	4I8KR6HoT4ZFdoC9tNPgx7wttdSFOo40j8dPcgruIxdp7329tOj8pUCKmhuLQocMFiE9AZddr57
	Qf60FNxw8xOz49lKDxXuOFfLJs8l1iggk6pFi7fbcByiyV0lDGsgxDlwoeTm2IAhY3wg24n+rAd
	Hrvr5arHRq7PZLv6ajJY7PhC1dr3Artc4Ql6yyWdrGKtLFLo0MO6bMCLOJ9BtT6hoTOq9Qi24NI
	TnKEVBOQ=
X-Google-Smtp-Source: AGHT+IHdsDUwn7BuB7/yHC+hyJsD9u0HfbePtL8M8V5c5UicG8UQVf8a0J+pTxBUDdadzKyEwrdEnA==
X-Received: by 2002:a05:600c:4ecb:b0:43c:eeee:b6e8 with SMTP id 5b1f17b1804b1-43ceeeeb9fbmr90756515e9.21.1741710858030;
        Tue, 11 Mar 2025 09:34:18 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d07fd046esm13398935e9.19.2025.03.11.09.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 09:34:17 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 0/3] add sof support on imx95
Date: Tue, 11 Mar 2025 12:32:52 -0400
Message-Id: <20250311163255.2664-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_093420_312667_D9054CFB 
X-CRM114-Status: GOOD (  21.92  )
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
Changes in v5:
- added comment in the DTS regarding the reserved DMA channels.
- addressed Frank's comment regarding the widgets/routing properties.
- changed codec and CPU EP names to include SAI3/WM8962 in their naming.
Previous naming was too generic.
- picked up some more R-b's
- change soundcard DT node name to the more generic "sof-sound" as the
soundcard might support additional DAI-CODEC links in the future.
- change the soundcard label to "audio". Same rationale as above. The
SOF core will append to it the "sof-" prefix, thus the resulting name will
be "sof-audio".
- Link to v4: https://lore.kernel.org/lkml/20250211225808.3050-1-laurentiumihalcea111@gmail.com/

Changes in v4:
- addressed Frank's comments regarding the DTS.
- squashed commits for common and imx95 bindings.
- dropped patch introducing driver. This was already handled via
https://lore.kernel.org/all/20250207162246.3104-1-laurentiumihalcea111@gmail.com/
- introduced two new properties: 'reg-names' and 'memory-region-names',
which are now needed by the driver to work properly. Because of this, 'reg'
and 'memory-region' properties had to be moved from the common binding as
'reg-names' and 'memory-region-names' depend on them (you'd get a failure
when running the binding check otherwise).
- added missing 'bitclock-master' and 'frame-master' properties to codec EP.
- addressed Krzysztof's comments regarding the imx95 binding
- added Krzysztof's Acked-by
- Link to v3: https://lore.kernel.org/lkml/20241216145039.3074-1-laurentiumihalcea111@gmail.com/

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

Laurentiu Mihalcea (3):
  ASoC: dt-bindings: support imx95's CM7 core
  ASoC: dt-bindings: audio-graph-card2: add widgets and hp-det-gpios
    support
  arm64: dts: imx: add imx95 dts for sof

 .../bindings/sound/audio-graph-card2.yaml     |  4 +
 .../bindings/sound/fsl,imx95-cm7-sof.yaml     | 64 ++++++++++++++
 .../bindings/sound/fsl,sof-cpu.yaml           | 27 ++++++
 arch/arm64/boot/dts/freescale/Makefile        |  1 +
 .../dts/freescale/imx95-19x19-evk-sof.dts     | 84 +++++++++++++++++++
 5 files changed, 180 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,imx95-cm7-sof.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,sof-cpu.yaml
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts

-- 
2.34.1


