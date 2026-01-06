Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D89CDC19A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 13:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=knA82HoFVq5Vl5qoZqEkHj4/fd3hThuMjeSabaCgNw8=; b=iPYxwi4yJjEs0zf0h12InlJ8P5
	N2PEJPqAB9J+oHv/8op/KvkPozKavlyRk11oCApget9I4zCmskfUgc6T9EsZ1TCJYvVQ29hnvPc/0
	VHxA2l6FyCr5RD54df5aN7hCGAbl2BgFrg6YZe586HMuanbuX1JK1unGpzqu+wVX2BXKmDweWmBkW
	OgLlv+W/TwL0FqwhNbQNGY7axszBtVINNEz72r/HtqKLnQDNGlv1V2pZ/Gs7eypiaM1t25icjoycc
	R2BInKsnozuUfpSVVDbAZl/IBpUJP6T/ZAKWF+5R9XOiuGaq/t6A6e/t+IZYZ/xgT3UVp6bBRl8Lq
	a4Uj3qvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd6nf-0000000D3Pr-2oXC;
	Tue, 06 Jan 2026 13:08:39 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd6na-0000000D3PE-3EC9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 13:08:38 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so7278095e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 05:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767704913; x=1768309713; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=knA82HoFVq5Vl5qoZqEkHj4/fd3hThuMjeSabaCgNw8=;
        b=jLAFnQR1JuYsYVdxukkfCZd+cCW/83ePJZMVw3/Mbpzq3evcU4fp/OGocUxtfcN5JF
         H7hwEhOmoYJ0hryFtwBJ8w9MG35E7rjZVmTaH/RJ4IvNm/ujrZGb5wsL40qmujln4A4z
         LtTL3AfuID+HQIeSoa9VZZet2IdR3rSPuubAP+T58x/jnJttjI5hj7q4MGS6AS3x2G3H
         m5mQwWuWFKjTYuB39S2SCDQjTvex+CspiteINZC5obwcd3E4qg210F4OQBVizYNDDn3m
         DljwE/d8YF5L7XloIwkuEjFWu3RAGGs6M69PgVTpH9vN0ArGVzFtYIn2Gqxxo/3EiQsA
         HbQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767704913; x=1768309713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=knA82HoFVq5Vl5qoZqEkHj4/fd3hThuMjeSabaCgNw8=;
        b=iRQXoq8ef1oKhOKpA8cPCAbydowD88zjo9acgNqj7Gh3tAotCYsO3mSUPNU5yBGLs2
         LoOhqMY0Rw3DMowq1nOkwFecTc1PGOW3aG/0bRc6aAk2dkszqLcgf2mrpnmeBoXTzCpr
         g1/j49tkyCb03NfD+s926BVLbjEkCmHm3H/MFksHJhKXISwuLyqemJO92ibjCL74ZXZ9
         CVrRm7mV2vushrOA4h1vG86w10RDn5KfcVIn7/h+G5lk1Z8YjibakK7HMKhOUvYf0/PC
         DWYy9mE2WYvP+GU59zYzxDqdJcFAAArqaARIXdtUhdKCl0DVyBHyp0o3TpbVucGT4e8s
         TIDA==
X-Forwarded-Encrypted: i=1; AJvYcCXWF2x5+U6DD6rxBiBRyEBnGuIZmbhdIs48ZMz4GlMWChTnilyUOEa0UcQKzLVoaxaYy0FsyuEP90T5sMRgsUdK@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0/Wije59r+CVE7rfSPP3T6MvjkwcgMSwI0tBXfyl4rAG2yfl2
	9b76J2AG+TiR6DYx3s7lnLaZdNw/z8wHfJ4T+QnXFCj12Goms1N1lrx2
X-Gm-Gg: AY/fxX7UcVMHGQgQDmjpBo+zaHwLjeMHXsuHNuObi59k3UgPxqLrTYFLVVlrOhknRBo
	H+wIuIvz0gOULDMmA4AX6SlvPGXdRKNWUV8dU1XPTCS7Ssj5Q+2jsO68MraIgDz0qIkYaVyOsvR
	6CDMrlx44eng1BfpQiZmbdWy4rrq0VQ8hodJVTfiWqbDgrJ+7XIi3CRKOfxH3wYL6MGqm2FRC66
	LgKo8E3GztIX9svW2lRQqyvOarWnGrhLDnM4xEsT5nOXrO82gXojbGvfmikuztm4BuQqke+rbvC
	H19FjlejeXMIpTvl/y7CB8FVe4aE1f8eVjNSmp7ElqKjjbMoH4o8jiAevofa4Y5Gd8XzDhywvdq
	6AZqyEUcffsORXu1hJfm5Nf/ggGSedKLPTciQd1cDEwvm7ilFmRFOX2Zat8OLldEedab2nb7nGg
	nXD/TP1uUjGUldkkGkenI4OUGEs8aHxtXzz8YSylmiRMdhQA//E5/hRhPrMURKwDAXnfXAGl/by
	7++EKqiN3Eweqcc5fWafiPfgA==
X-Google-Smtp-Source: AGHT+IEgdDduQB8C1wxDqFC9WBdiYOJOB1Zvyi+DFvPEzDYlB1IWXSDoybQxNllxp6wpNzMK+ExQqQ==
X-Received: by 2002:a05:600c:4f93:b0:46e:53cb:9e7f with SMTP id 5b1f17b1804b1-47d7f0929c2mr31848395e9.18.1767704912499;
        Tue, 06 Jan 2026 05:08:32 -0800 (PST)
Received: from Lord-Beerus.station (net-93-151-204-73.cust.vodafonedsl.it. [93.151.204.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f70bc4fsm41601635e9.15.2026.01.06.05.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 05:08:32 -0800 (PST)
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
	Primoz Fiser <primoz.fiser@norik.com>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Yannic Moog <y.moog@phytec.de>,
	Josua Mayer <josua@solid-run.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 0/3] Add support for Variscite DART-MX95 and Sonata board
Date: Tue,  6 Jan 2026 14:07:29 +0100
Message-ID: <20260106130741.91532-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_050837_292050_0189D3B6 
X-CRM114-Status: GOOD (  15.11  )
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
 .../dts/freescale/imx95-var-dart-sonata.dts   | 590 ++++++++++++++++++
 .../boot/dts/freescale/imx95-var-dart.dtsi    | 425 +++++++++++++
 4 files changed, 1022 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi


base-commit: 40fbbd64bba6c6e7a72885d2f59b6a3be9991eeb
-- 
2.47.3


