Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BDCDE9D416
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 17:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qMd6eVgyTaMp2dz0Bmva0s1vsJYaGNF3GbW8MNURkF8=; b=KdUq4VcFroG9/DeGR5dHeSPgK1
	ZtfocsDFLI3Yyxi1mzfU0omMZmEz+rQm1G4+WZT8mbly1+bx1ckkScFVfgux7EP66pmi6ldD349ZM
	KXtDuXhgBLH/PoVWLY8I92By9c05P3g5vqszr3vJJvSMY9pPaBEhamEXZTIw4XnesDnuIKP6IxTw2
	EwtZrvbiaBGwrFfXhwTUvQOaqNY6AN5OusUUEctxnfG1uav2snmRPhYKDcdXbNO/DKP6DENbh8xWO
	u6l7M9zPNPsn9UrIAnFW19smH3OeNag8Gqxr//voR0WpiOUn2hyMKA0zPeDAavoaYBXPnYSL+IsL8
	6IrB5IMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vngJq-00000008p1c-35Ii;
	Wed, 04 Feb 2026 17:05:34 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vngJo-00000008p0n-2ztp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 17:05:33 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4806d23e9f1so119115e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Feb 2026 09:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770224730; x=1770829530; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qMd6eVgyTaMp2dz0Bmva0s1vsJYaGNF3GbW8MNURkF8=;
        b=MCqx8H+BdPqpwfDaZpObx+YSqB8k9mJ1jbTl6faktuphGG6wQezY9s3n94GFWYanAk
         8t7ClFMLf88b2eqSMZYF/Z4x77dFNOpQDQVh/NAQY0rTNhdxDTzffQmF9kvDeZyg+ABl
         ZnazfZpzHLRs+TgCQ7HsTEo5/hdmo2XtBXYvMyjhEn7uaOsDsZpmi+CQYLg88H+OefsM
         rhGdNVgUCW4rW5gxYajSVZX2oIt3X0CGi2bHu/NW30aRyAkLVolXOpBsg+DW7qsqzm6R
         0tih5Ot1YAoBXMrZEgh7FhtjID39ORcmyeNHZD/bNbzRDHSUMrEmJqadBo257flZZeGG
         KnWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770224730; x=1770829530;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qMd6eVgyTaMp2dz0Bmva0s1vsJYaGNF3GbW8MNURkF8=;
        b=DkwzQB7Woo9qUaAk6qwJxGkJzEoyDNb8Lp9LvlIGaTLPc83Fi/MiPD1xyO/eR8Pf9j
         eEJxLMOzk+CcfvMIUT/REuOD8qbKInrAThOYPk+5T/rsKevOhZOubjA8dxwVb27qPZf4
         RqWzGLYqo27OuJtMqdnnzF4iDTepIFjOuhqegEvYF+8odKUWTLkclbDsS5e0igaCsd4m
         wG/M2b+co84N5U1bBolxwVhWLcr2FPihR0ptndHH/nc0TFi4+12R+FLUVc5taDEGjrYK
         gQvZXwehthKinPeH1JVae+OyVzqjklbNlHZnhfl/3H5J0goageZtBXnyggoKsUnsgnMZ
         Ld8w==
X-Forwarded-Encrypted: i=1; AJvYcCVoxf90LqeX1wWpXwW2uSEYut49R32jGftZgEtGKpH0+cQN3/o1one0zzS9CcDsv6BPDrjaBg7CmBPCOTV2n/yH@lists.infradead.org
X-Gm-Message-State: AOJu0YxlEbEEY1qujajF6OC578qX2iA6wTWB7mIzMB2qBych3/qLbDhw
	xy6ZtQP+s/ILnCnRexWGw6PYWlM/sZ4saTp/4HESOtYbbsagQ7c1AsHL
X-Gm-Gg: AZuq6aLD3yv8WhdEsTpw4CyJA6/XNoFghp/fD4SzTZ5V43pextJjbhpDc1EYxuCEhR8
	WEh/7osynkth5odFoE47ZY2ECIULO/2YhDZx+8GiutkCBL0w5Ot/coAr30NN+NnViECyqKPHd5R
	YZ88vmEFfgtfvV9CLkvAi6Yoj2+3G6vkuvnwplrz6dd2ZgpxFvOUicbQrmd38SR+GPOji+gIVhE
	Vr2qbO4mcGUFrjpdDxLcApgpitY8ubrKJAnsppbZUphPkG13S7I1J/gHiN/U5uBar7qx8acMcyr
	Xre/sxidPcLJBAD3XqzCYkpidd9gVZw1IFHbV3tyMWZQm3gc8RWhukKNzDQA9Md7/cAfqk656q8
	4JXIA8CE+sUS2bJhNCS4UozHlH9Kq7anogBJ9vP4e1QpPIkZ/wctuig8NIuAf/SF+6lNwdVVTLp
	XjQjAy/1D/p6tkl4qEqItWbVZTr9fkw5Pd0wTevbX8sKUADX7JIiRdF4kcRU1EWs4Ctv8eFtqdb
	ZIZG/sMkOHOOeB+qUz1pxxIVE2m
X-Received: by 2002:a05:600c:680a:b0:480:6c75:ddce with SMTP id 5b1f17b1804b1-4830e9a9b17mr51563435e9.33.1770224730178;
        Wed, 04 Feb 2026 09:05:30 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.vodafonedsl.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830ec10011sm38044465e9.0.2026.02.04.09.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 09:05:29 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	alexander.stein@ew.tq-group.com,
	dario.binacchi@amarulasolutions.com,
	primoz.fiser@norik.com,
	Markus.Niebel@tq-group.com,
	y.moog@phytec.de,
	josua@solid-run.com,
	francesco.dolcini@toradex.com,
	maudspierings@gocontroll.com,
	Stefano Radaelli <stefano.r@variscite.com>
Subject: [PATCH v1 0/3] Add support for Variscite DART-MX91 and Sonata board
Date: Wed,  4 Feb 2026 18:03:53 +0100
Message-ID: <20260204170356.35169-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_090532_770385_B41017B1 
X-CRM114-Status: GOOD (  12.92  )
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

This patch series adds support for the Variscite DART-MX91 system on
module and the Sonata carrier board.

The series includes:
- Device tree bindings documentation for both SOM and carrier board
- SOM device tree with on-module peripherals
- Sonata carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite DART-MX91 Boards
  arm64: dts: freescale: Add support for Variscite DART-MX91
  arm64: dts: imx91-var-dart: Add support for Variscite Sonata board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx91-var-dart-sonata.dts   | 498 ++++++++++++++++++
 .../boot/dts/freescale/imx91-var-dart.dtsi    | 468 ++++++++++++++++
 4 files changed, 973 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-var-dart.dtsi


base-commit: 18f7fcd5e69a04df57b563360b88be72471d6b62
-- 
2.47.3


