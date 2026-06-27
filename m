Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 936FBC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Jun 2026 14:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HBg/7OCyilKcHeMXMdL3WuPjtAWiZJrGkie7U7w+6JM=; b=wGWmVx9LRGR44yJ5NeTQA8l1Da
	4z91Sg8yxdr+LPwRw5GfR2ncDo/lQm9QKjhtXZJo3yeT9gzFDRLdb0Hxd9cYuaoEWcQyBTa/eISZc
	EjiXS1s2roQ8RTID3dUJzo1qZ9ZzMQXjKymCFLuR4+hQ1EmYoyirsL7OFV8rE9I4zL8Jz6Sw33mAE
	zUGvwZyJXGNcmNpR4f+MCzdroEsSBD4PcHaPcf7zdc1aV4JXEB4ZqWMcJsvN1k9FCPnSOZ3q0aunu
	Zqkjc9jAWHKmy7d1g0xGxHRsywh8oOlwhqy0cgzhYtrq/Ti3OHzYEF5PS//WmpJBv1eB7Gp3iqAbY
	b7QEQ6XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdUIg-0000000CYvT-1nSi;
	Sat, 27 Jun 2026 14:46:30 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdUIe-0000000CYub-0xaE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Jun 2026 14:46:29 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-492719b2d81so2783315e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Jun 2026 07:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782571586; x=1783176386; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HBg/7OCyilKcHeMXMdL3WuPjtAWiZJrGkie7U7w+6JM=;
        b=q92fIpum/F6LpD8pIx+23gbkeo6MszCnmKdRcueTkUCJ91k8gsFxcG3NCUXhAPMqlW
         QYIgRlSORXRzmBnfKWTmvzKadrLHxExNlhV6nknttwqyaYo3gXoeHXXTHjyIFj25dlVN
         0/Rs2TqiTyBzUmyNf3fEtEAvm0b74K4M7omPK/IGMVcj+bU41zZWXhrc072YyZj+QgIc
         eLs8o267fxzYIdR9ujLNjHqwHinUZ7qGXNnsP/x6lPpt01dJusPn1bLsPp/oM7JMQDO6
         lV3/9B3USzdVpkpASmylSiHqSmHjMMLLYY9xbHGyhnY6+xNR+9hH1EtoCjOcwIHRlZCC
         rKGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782571586; x=1783176386;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HBg/7OCyilKcHeMXMdL3WuPjtAWiZJrGkie7U7w+6JM=;
        b=TGaZ8c4SEbzxGCvqrHqCQLZeP0t1yFo1elVPFCG3o8EohAFoitS50Orp2s6Qu3kpYH
         1xS0dx8eYqfPZrqp1imFYW1q1W37NYCnwpQyZqDOYTFKqwesMgeLZLvFeVGlGu48N3gF
         YnN4rg57Mp+HyUMaBd/k8hvhiRVRrqrkc00VQwYIdV7GTONyfaxNfZ3j9ZJmS2xmt6l9
         cwRrOhIeEOMN7+8u4QJCE0QEaGxVSv97wAgOTyeec8fitaaUfNzManP63ng3DNtH6+OY
         6WOaePodiC6RU8YVqa0nSDiTWmd/lVldGQFaMOgczmR+WeQfS+/zpP8WNcsDppiUsBRy
         kMtg==
X-Forwarded-Encrypted: i=1; AFNElJ/lnjfTforQi+R+tjRugIqX/jXAGxsp8HOurzYS9TeT6uGbZWKniCxUIgK3c26Ul+tWurKNrC/xxJ+vHIzNR1Dg@lists.infradead.org
X-Gm-Message-State: AOJu0YyswVUygBEFDs9PRC8J+T2E1GINRRK8oVgCRpNnqapRIqvRio09
	FBLam1kfEw5SenW4/BAUeGdB+rQkdBZyfn+jWTIAFW5U4JtV2bI683KK
X-Gm-Gg: AfdE7cmGlMwK9U/YTiOFiIkZHTrIteC6Ae0kJyA07ZGVmVF1v2T3RO1ju/o7n75n86W
	ananaflapiiEDvlTl1w3OTec76Ga9UzIEq5QHBYIgSLxa9fhER/brSAMYbii+GLYGrheN0vNbnF
	q6nXRpfnGRE/ui+7HIOSeXi2nCo676hWyUxixoSkCAeylnNZv32KGTYEn7hiNsSaQnMRmhmYS5M
	RjmxPXe00xDnC5N43jdp9fxoklWnM6TY3pOKsCH/n3E1+dfVr/7TDIAfuRsGPPF7vfJjxTA+Qxu
	pOBdUEH+WEf7GR/2yDs60STc71Y0txWiO17udJAkKv/DhCjpepetGKArjv6ufnez1BEMEHxfn14
	hoWcxwJPPnJjDyMXFSwuVF8FnlIUnjxcgVsYt+iv1ftoBVPBnhWupddga2EXX7XjknZWiR9w7pI
	WkL78ZV9IIHdS1mR84UkQRwHmqixFsPmwQq5NRRZrDEAZJ5Fubiw8FJ29z68ZE3VL2t3UhFlOBD
	6SZX9XNDEhStqW94i1VYeDPbok=
X-Received: by 2002:a05:600c:c4a3:b0:490:d354:bd00 with SMTP id 5b1f17b1804b1-4926fc8822cmr82329145e9.25.1782571585491;
        Sat, 27 Jun 2026 07:46:25 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.vodafonedsl.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4927038578bsm98709035e9.4.2026.06.27.07.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 07:46:24 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v2 0/3] Add support for Variscite DART-MX8M-MINI and Sonata board
Date: Sat, 27 Jun 2026 16:46:10 +0200
Message-ID: <cover.1782571383.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260627_074628_284666_EDA66655 
X-CRM114-Status: GOOD (  13.43  )
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

This patch series adds support for the Variscite DART-MX8M-MINI
system on module and the Sonata carrier board.

The series includes:
- SOM device tree with on-module peripherals
- Sonata carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

v1->v2:
 - Remove HDMI from commit message
 - Fixed eth regulator

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite DART-MX8M-MINI Boards
  arm64: dts: freescale: Add support for Variscite DART-MX8M-MINI
  arm64: dts: imx8mm-var-dart: Add support for Variscite Sonata board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8mm-var-dart-sonata.dts  | 517 ++++++++++++++++
 .../boot/dts/freescale/imx8mm-var-dart.dtsi   | 558 ++++++++++++++++++
 4 files changed, 1082 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi


base-commit: 23a7098c710673ce8f245af317903ae46325a694
-- 
2.47.3


