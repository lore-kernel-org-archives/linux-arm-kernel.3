Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E03DC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 23:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IS1Aa/IQ/IUlV5JxAaBTn62cmT2MDAhS4oWaHSnRKrY=; b=1DZwuHNAcAwkpenUwm2BsQX5mE
	NSFF6cmYPzFyEkwn6pSYkWIBANRXHtU41a1BXee0xOOiPHg3J5MqDdDEzpw6RevB75PQJPdGwmhbk
	DSHLwd3vo5SxvnBxfR/vOGvnVuvSvr/Tyq+M0OgTSeQUM72A73b623S9F6UMcuXxJ8wspWMqncNda
	LBuUT3cF7VL0lYdhl31lxEjze84C0kH3FY936+OkyoXSy1IzGKact1JG3NT0Tz+yy9u7HhmLGW3/t
	/8kBwMtOGc01UV7bZGFMXRCz8Q16U9BfKdn1H5r6tcGWJSu/nqvrvPjlbS5pz2uXwsLiixsKN5UQr
	IOP6t6kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thzEd-00000005X9q-1IzQ;
	Tue, 11 Feb 2025 23:00:07 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thzDD-00000005WsM-31PE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 22:58:41 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-ab78e6edb99so668379366b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 14:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739314718; x=1739919518; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IS1Aa/IQ/IUlV5JxAaBTn62cmT2MDAhS4oWaHSnRKrY=;
        b=I/nFmMJzSExJbXydKZW8LTfrqep7cXHONCuQctTPHVskULHct/WYeidN8bZ5/ucn24
         OYUvksTBuG5PnTRpuQvFCJK1AT5a/hj3XlRa12XDb1+p0mTfxzIcd9OYRKHbTTgpUxYK
         5fLQGVE9bEyNKM2bRVEgxwk8hlh9HxVkkBbYyJ8bc3bQ6nSG3+ZYCYIdM5Hpdj2bndBk
         +dg6U0+p/D6DMxA6xr4Y+LFRiDwF1HRtEtzbLwkXhA+GUDqARqEuB5Ac+KfLI/uWyN4+
         3wjGrmbMmIry/qPMRL++dUYEdHcsx103NwGHAApgu5yAyHF82gZCkPsQaGLbSguXXrac
         kk1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739314718; x=1739919518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IS1Aa/IQ/IUlV5JxAaBTn62cmT2MDAhS4oWaHSnRKrY=;
        b=LhauKsg9nZPvEGi10LyWZVBW/r2s4EwEZwIKZxncVomJGb7MzIFmJueRMyj3JQ6EZO
         bBxfiwZks/azGBf9TvrlaAVqJs9pM8BwOo+YSHMLnFsnhhmGkLZuOSeRT9oHhohihUVS
         3wJyceUVlwhyJMZMLUM7mwuMSjIT4+LGJNEmpopF2uhv3wD9s+QyNlE/rCunL9Syutyd
         eMIY5MZUYmhHuWgXG8+FiB/je5Tufh1Yeve4pxQRH9rJL1+Jfb1GzA/QLSXpi+WMQTK6
         G/uqXiod/xSbQZFuz0AXmcRHWHnOzdh5XrvlWaSdizfCXrSIAVjhWcy5NJ+tl74Sl9lW
         2wIw==
X-Forwarded-Encrypted: i=1; AJvYcCU157j3OmtNJcYTX1+ribmUCsnRc6kwdzFK9Llv5qWFu6ssRKTbG1VD0Pj7Onnd6C4J1dcY6vZggYqZ5TH7MiAe@lists.infradead.org
X-Gm-Message-State: AOJu0Yz65YLpH1mlmj67tTGhPZxn+eBZggpSbfoG7fWCl8bK6P57VctA
	IC6RJ8OpwWsNF1mWQfEY/Kas1Kg0Fy7OziwnjNvp+LcjkM7hvNZ+
X-Gm-Gg: ASbGncs3vvMekdWuV6YNFkM5gX3vhgQ4nUIxdkwKnlOk9Q3AQDB5k7Jw+536S8fKcDr
	KVm2VnRL1QpQhfogmrF4CYhiywxmWtZqn2kWjfb2UCCUA/7e3Ps26v8qtj2tj2wEWGpf36o8di1
	gDj2y35B9U+wOQx/PxxYPWmfvyUDbDSN949rMG1f2mRuB3QRkUTAIobn6qEnmQ1sDXa5dOYgbGV
	XF7F1DRzvsPuCU6zB7ulyPTj2ejbK5XQIDcqZADTuJ7eQiZEaEDC2wXFRVakAvmR35Rz9olrhga
	iOqM4tCblmK2sKT/swr2rZTTaJpg6VFa4QJXEEHU5s/xLgOqhhQm0w==
X-Google-Smtp-Source: AGHT+IFfDhnh48nyjrqJLvEAPlFmJ3fjs7mcyr23zd4vcVw6KZQK2okNE3vXrPxb5oT0oY2PyNoYLw==
X-Received: by 2002:a17:907:971c:b0:ab7:851d:4718 with SMTP id a640c23a62f3a-ab7f34aec59mr67103766b.36.1739314717302;
        Tue, 11 Feb 2025 14:58:37 -0800 (PST)
Received: from playground.localdomain ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7e9fcd99csm131525166b.89.2025.02.11.14.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 14:58:36 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 0/3] add sof support on imx95
Date: Tue, 11 Feb 2025 17:58:05 -0500
Message-Id: <20250211225808.3050-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_145839_760890_14129FF0 
X-CRM114-Status: GOOD (  19.77  )
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
 .../dts/freescale/imx95-19x19-evk-sof.dts     | 85 +++++++++++++++++++
 5 files changed, 181 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,imx95-cm7-sof.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,sof-cpu.yaml
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts

-- 
2.34.1


