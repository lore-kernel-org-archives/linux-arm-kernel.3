Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CEAAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 10:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IK0eBtS7c0+Md+AQXziX/hdIdbv0oXutseltgb0KCfI=; b=Igqcm4vAkx16eDm+6QSI8gbv/R
	OBNcMcHrimWCbHQGwbhVCkROe2q+Lz5tXM8UEfoixEsURoPO7m9vCr5d4KeXEakRf3/y4kwWSzf0/
	Q1jWud5L6UC8ihJ0r38SyYZTzH/xd2PUaXsRnSGQnu6+JkeoG2PLIAco8EVToGbIhWDJCsyLs1qtt
	JpTEVhtgQ7PF9qQ5qdYXBg+xv0Lbld/NpH6dcqFJ/XvCn80JW49sAwXbcogxAy9RcKjIkasWIQvHx
	vOismiKp64M/DV0y7ASo+IGGEvSQgLV94O21rG6ev+hbQVwEhpRWBGBj1F5Qge2MCi+JlMWzGiHXI
	lxVxhQng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1werpW-00000001H8z-3SiS;
	Wed, 01 Jul 2026 10:06:06 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1werpU-00000001H7z-0zp5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 10:06:05 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-47122683cf3so336141f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 03:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782900362; x=1783505162; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IK0eBtS7c0+Md+AQXziX/hdIdbv0oXutseltgb0KCfI=;
        b=ejExH8EW5UcyZMaMjZb7OoVayFsPNmpKjqY20JIFFw/yZ2rHVnevDJ3asV3CoWsDzg
         jppwJBfliAG++Hn5KBPdLbAlPZOuojxGgBefVqFcsmBRyEB3tcbN27yC1vgeq8hxcrzY
         l0X7j9Bs9DIFqMI0TL4ZdUgTHbgeaoh9urNkaLhYuyS8KB+qoZIOkNwQwWkGNziNnMYl
         JG9kYvvj5XnDF+cVAJ0qfj+oUmmLvaLApQFB2sEptgyovVZZnvxilZRZE7raR8myZgQY
         yjspdO2N3kxXvmn/lUsXAc0Yi5LgKv/iLJ5FlF3IdT68YTLn1plzlPIUX37bhRV1gkGI
         GXeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782900362; x=1783505162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IK0eBtS7c0+Md+AQXziX/hdIdbv0oXutseltgb0KCfI=;
        b=IewbdMgdMJ6KKxKcMgrk1PMo8lMh2ayBZHcmMl5o5nbht9JIxuuEfouwJ76AKBPKr1
         zVQomabNuV16E7WF/cIK3CtdHGKjdD7RTowCAjwJPiS3BpPl1NcGyX68EurZLKSUR/k4
         RPLvf2XG5g81qn35cKMYm0LVh8DagLxWhwC9jihV5nUfELeHYcwOp2xjGjOctN9oh45+
         860hLrIIuiUX9g8oT6kiBQo7XLzO2OlxpbuOUAW7T2NYrngYIroxYwLQQyM9drr+MDap
         O+H1v1nGCXSMg/7vBr1u0e9NY1ksuJE6wzWrmgz3aOiPSj+LLjdYn4B0kPcjahrm+wSP
         kBMQ==
X-Forwarded-Encrypted: i=1; AHgh+RqVZa1r6rpZrMveJz+OaIosoSgOP795ywXXuXPqS893vyZJltgp2BMzUPU2bho4qZu6Q16da9OaXECZI4sBCCAc@lists.infradead.org
X-Gm-Message-State: AOJu0YxpuGBF8LnfCZBLryNU0EZR0DGG+Kuw44GgYZyjNuGdQTUZK3Oe
	ezcDtMj4RqSeQASBmRGS8NOUcPM/32+/phXxBT9W6Uw3dIXYnfezSIP2
X-Gm-Gg: AfdE7clFywJqU5E0Dw4chzZgeWPJ/4maPVEkBjww+ErQBNRHMZfOe9vVYXrJN8hgEbn
	B+eFMj/ZFxcNYHic/4QcAnvj8n19EogjnVlolFEkxnaBxfkjEfZ2IgHnFoB476ig1fNp1CSC5tS
	NtNd6iIWB2nI4bPtvGc5rOvJ92LlC2MSi4jZ9cfLweoUi80N6N7jYyt03QTiMC834Jq+UKAY3tr
	Yk8Ow5u+mzM0wdDUX0xw9C2P92E+HoY89jp5zbhYrkR90ofu3xs4nJZtVkpowj4Csy+M+7dVe8Z
	sglc5eDFu4e1NdIXCCO4zfcAGi8xhVU1qbeyGviPFtlTIBG8LQVCuBgGrQksOhDdrwMtSZBdiS1
	BhbdhJXNKi1b+WHIo5lVMA2r4gq8YqLxtRWJr4aV7KFyqa+rPg9sjV++PVueC7xLWjFRezsoYOv
	S1iGxypsHU0fwGvjEp1c80xrityQVntNDlc2Z/zXnMh/Avuqqyujq+DFV80BYMt28lobmhC//sk
	lMAuJIKTIiYyIOZjlBl9sHV8DgQoP14l5jn
X-Received: by 2002:a5d:68c5:0:b0:45e:779a:302c with SMTP id ffacd0b85a97d-4775a100e55mr1113050f8f.29.1782900361613;
        Wed, 01 Jul 2026 03:06:01 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756636cf26sm13742935f8f.19.2026.07.01.03.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:06:01 -0700 (PDT)
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
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Josua Mayer <josua@solid-run.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v6 0/3] Add support for Variscite DART-MX8M-PLUS and Sonata board
Date: Wed,  1 Jul 2026 12:05:54 +0200
Message-ID: <cover.1782898728.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_030604_349686_D28F2D28 
X-CRM114-Status: GOOD (  13.80  )
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

This patch series adds support for the Variscite DART-MX8M-PLUS
system on module and the Sonata carrier board.

The series includes:
- SOM device tree with on-module peripherals
- Sonata carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

v5->v6:
 - 

v4->v5:
 - Fix nodes order

v3->v4:
 - Add snvs nodes

v2->v3:
 - Fixed wrong som eth phy address

v1->v2:
 - Fixed wrong sai peripheral reference
 - Fixed wrong eqos pinctrl gpio
 - Fixed model name
 - Added new usdhc2 regulator pinctrl
 - Adjusted irq edges

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite DART-MX8M PLUS Boards
  arm64: dts: freescale: Add support for Variscite DART-MX8M-PLUS
  arm64: dts: imx8mp-var-dart: Add support for Variscite Sonata board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8mp-var-dart-sonata.dts  | 733 ++++++++++++++++++
 .../boot/dts/freescale/imx8mp-var-dart.dtsi   | 475 ++++++++++++
 4 files changed, 1215 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-dart.dtsi


base-commit: d0c222c2e2ce577d801bdf129dc6c078f29e22df
-- 
2.47.3


