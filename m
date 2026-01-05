Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8676BC2A088
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 10:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IN6vRkNKEVxOczX1saJPQdmukp5i6BLBmJn4SGM91Z0=; b=KJDPq1PbOVzc/9KNgm0N4s+kLq
	C+D1HGDFoiwuFwcJojzwR8O9SjWxtJREV3USJa27EhnTIzdfWxrrDAsPhotaQzIdZtzCL1DV1+Av8
	/fLyWjnfLFy/vFmDZX2zNAII+VgjxKx1ggA9/BxOCHjfu2YshKZHf5wyAfRLfb3pIAaZDg96C79VF
	pkBmj/R7nUmzwgdxZch2ix2MwZ6vbfbvIpWO243UqQ8pYesN3oVhGj1qslAAq8nC1lUwBcVy2zq4K
	F5eBcdO24lhhd99OdPVUPER+oiYvh2LgbnEK2Z9oocp1Bp7WzaO3yvzA1UNhau5Jwos2ADbVK6gcm
	nVqy7vqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vchlU-0000000B6PL-2VFC;
	Mon, 05 Jan 2026 10:24:44 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vchlR-0000000B6Ol-1xVo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 10:24:42 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-477632b0621so86707215e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 02:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767608679; x=1768213479; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IN6vRkNKEVxOczX1saJPQdmukp5i6BLBmJn4SGM91Z0=;
        b=Q2izJX04wJjhi4+V2ivSrxk9JBm+Z922RnobynnaKWKJWt6YQtNOdHVoWej3Cyl/kc
         T2giBszGrZmREPb5HblGxvAcyDooXMH9Nf4RyZrUleCwEGM5ESTDt8Z63Za2C8B+F2j9
         eGvkm44A/uWCUEoffWRKSmvGR86daA3XMhOG+czhZaTrogYpRLzPzzFP4TgBdf5xP4uB
         aRQk/b+N2luXU2HnY1jtyfF+Jn3puaN9X0kuUJ9V3FB8dLUwAx0BXP3BFlx4WLeQPNWy
         pjUSbyXMlmr67ZZYLvTpxexJdojLoBco5bYpS3ibXvhm4u7uL1u4cZR7T+Q6s59GQvxb
         tAzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767608679; x=1768213479;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IN6vRkNKEVxOczX1saJPQdmukp5i6BLBmJn4SGM91Z0=;
        b=EnXp4GM6VTiWFPeygENWkHwmDcvRkKV1oeIYOHr0G7ZS8hL4iZBKiieR1vUIiz0n4b
         jQsbCyCBdP/+G0a09Nd2y/JvS8m8z2acEGy9iz3oLjXAMU82Hl9mAloZ3X8vXNJJvPL1
         9yIsPbPhREed0l7G7SjUPpDnSRhWTp19lUqQ9Nt/UEU6o3rXJFjZU5n4wf/njqAs8DnS
         tbMCbgxJLxcCFwfC03Hs/l1MQkwhK85eoorvkwxHd1OkqSLYrnNgVAj9PF9GCifir9px
         WBN9ZzM04E9SNklKPdp75sUSflCpc+JNznW/xLl77tnrqoHcHHbXa5G1l9fGkhW9J6ZI
         v50A==
X-Forwarded-Encrypted: i=1; AJvYcCWOxoVAuoEJN34zN/MReQbofbIa9KpK1cTemXSM5kG9sz/hC5jFGYeRFzkiTFLyEkmzGtxt68CsldUvz+Aa+LzM@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2a4Ao2jXWnWsa8jk3WOVGGZzJXTVlFdY048hJLq5uDp6Zb3Vd
	pcBO9OLlk2bnPBSxy3VQSPgKKJoKe+hTW99AJfNvu2nsnhb6FI0VJjsM
X-Gm-Gg: AY/fxX4FcZyYawHbFrqJdiHnVQRhgRB4MmA57VbnH6QsqJDw4uuKWs+G4poiCSP5iX7
	f8qwW1ItpI/ipdzHt35Bsmncmz7gllqofVVTdqIaG2+LPCUbwvujSbRTuEs8rVVMbPQqJSLgUyE
	gbcE8z3gG2RvUHH/DlQEgQLQmR9h48LxwSB6qQPoyqc8fO/AeC8d8b6XagDQMPdZqNpHRGbRRxi
	+2EWpvoItghzgrCiBC2jHVKesDJguwzy62ZrlIH9p03oj1fv9ea8XZ4yz4V9AQVcQYkP6bf6ZK3
	ZC1Ccr3nwUSFKC5IfGMHt78zZHQ98FtHYXRNJ3DlOMzv5ws0kA9yTHssPHb6DT00lEOKkj2wZlu
	7UEKthIG/GhScV4WgN34XFnurZGYoy11IcgtdTJHCtAeovjskVMutvCoQUquxR5y/eN5/O7YIb4
	fqKyVIA3JMQuy7xDd7b7iwo3sEXTI7Bopyt6B/ObJmv8GH00YV6iehutXRk63AF4J+rgLFBaclg
	4UmUu3Tob8ZyzRUK9nTqw3d/Q==
X-Google-Smtp-Source: AGHT+IE6Ut/zBvkgGiDfA9fqbiDTp9MkLewGpq779KdJeWNbVM5HNW0RBNC8pVKNFd6A70hzt18tlg==
X-Received: by 2002:a05:600c:4ed2:b0:477:af07:dd21 with SMTP id 5b1f17b1804b1-47d195b3c08mr635442425e9.25.1767608678952;
        Mon, 05 Jan 2026 02:24:38 -0800 (PST)
Received: from Lord-Beerus.station (net-93-151-204-73.cust.vodafonedsl.it. [93.151.204.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d452be4sm145607205e9.10.2026.01.05.02.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 02:24:38 -0800 (PST)
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
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Yannic Moog <y.moog@phytec.de>,
	Josua Mayer <josua@solid-run.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/3] Add support for Variscite DART-MX95 and Sonata board
Date: Mon,  5 Jan 2026 11:24:00 +0100
Message-ID: <20260105102412.6674-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_022441_523649_F488E841 
X-CRM114-Status: GOOD (  14.11  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

This patch series adds support for the Variscite DART-MX95 system on
module and the Sonata carrier board.

The series includes:
- Device tree bindings documentation for both SOM and carrier board
- SOM device tree with on-module peripherals
- Sonata carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

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
 .../dts/freescale/imx95-var-dart-sonata.dts   | 590 ++++++++++++++++++
 .../boot/dts/freescale/imx95-var-dart.dtsi    | 461 ++++++++++++++
 4 files changed, 1058 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi


base-commit: 40fbbd64bba6c6e7a72885d2f59b6a3be9991eeb
-- 
2.47.3


