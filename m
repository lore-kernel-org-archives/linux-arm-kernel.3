Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E05D29C50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 18:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=55lyyZqMdMa9O5mc9RnR0TLqDLX220EotOz5fNdnf3I=; b=MuWa1ZKIWag6wjU5SRn4A2j7SU
	jw6i5exF27V39UZt0U4Ih2G5GDNZGRQ2pvqQGdinzDzjiPSzNDdgTPyKdJtKv27+3LcXfcd7hEa/Q
	Se8xlZMloMS+Y0EMtNbSXDZeMyH0khezbNR35Qr4iY3os5/WEsE4ycCv/cbhmnguitx1PP0Pbrz7P
	nvFzQt3mWSeUL1/Bnqq194SrkHrSRUX0yP67VnfIOOycObOr1Cx+iLGfhjVQJogsdnI3l0Y+n/pB6
	p0RQya92Di+a2cW2x0EoI1ENMRaDur+pQV/TEBHKj/54l6N0n8nCGE47XAjQgNeLXTpzPPozwcFIH
	NkVMD/ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhu6x-00000002iYX-1yGD;
	Mon, 19 Jan 2026 18:36:23 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhu6q-00000002iXV-19RS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 18:36:22 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-47ff94b46afso30384785e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 10:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768847774; x=1769452574; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=55lyyZqMdMa9O5mc9RnR0TLqDLX220EotOz5fNdnf3I=;
        b=EBo9SCilHBgBfonyffazWHNkiZcVSPXOQ6+VPJtPqlqHM2uqVN/tzhtGcZj3+1yRaB
         8t8bIf3N9nSYMzVpSURTDXCRrLDhq67ZpSV3hB3Kft3opOMkXmvwoqEVsaBNiTfC/DjM
         VzjCgoUy4bwYJYnFeQVGlR+VH/URSMEmmykWWjSa17gRilqjXa49NLN8Kyp+6ud/COLX
         hwcU280RtNLIP6HzATW6I32eAFwNJssGe2Hji77fsUQx/amxJiKqnh0RQTLIgTXHNuX0
         9DsoA61543jWdrAQiS/20l5epqysmr+qlI8ADtUzZbBsRiIMCuTLbYF675/ghB50g1pS
         F6GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768847774; x=1769452574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=55lyyZqMdMa9O5mc9RnR0TLqDLX220EotOz5fNdnf3I=;
        b=cj9W6MkXfnXa3FOm1if0BxIrt+7SIYwC8icNyJ6XJXowtjGuKv3s5PL9GMwZQvku1h
         Jf5i2HKuBaCoj6Hkg+IEv1dxExrHTGA9SZkBa49v+LkOI9z+pqsOxkrhXZTJ057jjK5j
         YgjRdReCdgRGlNERWlWm36QidrzSC17MpMjHtjo0Aui2esaQqAs9iMq7rQRPOq11233G
         UlbGEpin/ACvqEuvmrjCr/czKmQNLkLvTb3PPdCUdR+TCAPC3FmfqxEzjyCvlFgnzW5Z
         cY+bVjaTNpc0KwnNf49st0NaMZJOkyymkGIdR4oV1lb6Q5B0j6VRcvFJKLtIsslkvuMF
         LjIg==
X-Forwarded-Encrypted: i=1; AJvYcCVGmmIcDKMB2f9a55hE70ku8JLvXlxMxM3Vh+XBoFwdC8tOIOxDDUUW/zf2ssVBLbXM8FQ49bHDUtiD2kWZ2AQ/@lists.infradead.org
X-Gm-Message-State: AOJu0YzYeWMPdHG+z92061pNzDOCDYImdRKfcOyaJ7Tw3gsbMqHLGGjS
	iNE6xMlWfwknBTw+ev+Tan0cGAaay7bhOFyGnIp76+VcRhiOxpPRRVfk
X-Gm-Gg: AY/fxX4leDmdg4F2af1gx/J7j/fyjtU03PPTSD0/QWG93d4fZkLHBSwf8CU93LWDdqO
	ve1RsAE+vgOSG2uUzwVuOvhjn/oH0mYJvVBSr4UBgdIfM5PLs2Hh7d0eG22AvifYb+AKw6frheM
	jFYf1PsouV5/G0WXPBdDDGO+v/oACvQx17AiXu7e4P5NWR3ygHg/+Cpg9OhrINm/CtT/PucGvX4
	ScfLuzv5JCVI3EEzlAB3aBYBLuQ+eqmsn6gL9s6fFcTgSzKNhbVmgXRz9CA2//LpbjP+5NxD1AT
	G6oRlmk1hMZT7B0XwBijImqGIhwiuAhMnL4U77oJoQsQaQkb/9PUZ5Af9HxGmTT6zKg/zAdkVAR
	PcqVDjdc1Ka1INrPKdcklx4vJ5gWuklYiR7C/0zX1dfxN/l4cDYhUpiXn6aypuhmSHB+PwNjQrD
	RZb0spy0drmTkbCIy3SRrmvjAe5Rj+2Uk+MYNDxqt439tXH6Uo7sSJ/mKLaCgk5nWHdHNFW8elW
	nmqur/9cXXn1MpZ2nUsf4vkIA==
X-Received: by 2002:a05:600c:6812:b0:47d:403a:277 with SMTP id 5b1f17b1804b1-4801e5301fcmr175456075e9.4.1768847773622;
        Mon, 19 Jan 2026 10:36:13 -0800 (PST)
Received: from Lord-Beerus.station (net-93-151-204-73.cust.vodafonedsl.it. [93.151.204.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8c9cbcsm203965015e9.12.2026.01.19.10.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 10:36:13 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Yannic Moog <y.moog@phytec.de>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Josua Mayer <josua@solid-run.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 0/3] Add support for Variscite DART-MX95 and Sonata board
Date: Mon, 19 Jan 2026 19:35:52 +0100
Message-ID: <20260119183604.88192-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_103616_331706_14DB3B97 
X-CRM114-Status: GOOD (  14.70  )
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

This patch series adds support for the Variscite DART-MX95 system on
module and the Sonata carrier board.

The series includes:
- Device tree bindings documentation for both SOM and carrier board
- SOM device tree with on-module peripherals
- Sonata carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

v5:
- Fix newlines and nodes order
v4:
- Fix typo in spacing
- Remove vpu and cm7 reserved memory
- Add GPIO_OPEN_DRAIN to i2c gpios
- Move pinmux to eof
v3:
- Fix specific node names with generic ones
- Remove fixed-link property for SFP
- Audio regulator cleanup
v2:
- Add SFP cage node for enetc_port2 following sff,sfp.yaml binding

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite DART-MX95 Boards
  arm64: dts: freescale: Add support for Variscite DART-MX95
  arm64: dts: imx95-var-dart: Add support for Variscite Sonata board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx95-var-dart-sonata.dts   | 591 ++++++++++++++++++
 .../boot/dts/freescale/imx95-var-dart.dtsi    | 425 +++++++++++++
 4 files changed, 1023 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi


base-commit: 40fbbd64bba6c6e7a72885d2f59b6a3be9991eeb
-- 
2.47.3


