Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77632CA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 11:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LglhPlwMqIEb5lp6QQRc6h7tbZs7go6i8tgRSxiq4X8=; b=u8zb1Z3HL4AVCnpwGwDd5pl6lN
	4T+PBnvpukxZDszdxoQSpk61vZDPf+vluw3zt1r5DwmqCQtw4yM/UvuCWwtbN58yZq3RgPTOX0/qV
	mz8xUKF5GesBIqHmKfqnOEvdAeogbTDS0USN6neCu91KsxMQTJaiABonhoUef/k33H3eOuhkTNl8l
	uEWWsFj+hh+oB1BmtlB6OjW9T0IAUaYhblaM3gWyxV1jq4JvyyGmwqMB/5oOI2be3AhlOLgKnuRgI
	+zD4cn0xBnzpv9PfrC+Ttt9/nC4+hIcT1wH/QVpNVIHznovnKBt50HV2AcKkPTRsP8NkR1/B9z72e
	5ERxQ7EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut2op-0000000C4Zx-43Jr;
	Mon, 01 Sep 2025 11:35:28 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut1PC-0000000Bqu7-0uSn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 10:04:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1756721094; x=1788257094;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LglhPlwMqIEb5lp6QQRc6h7tbZs7go6i8tgRSxiq4X8=;
  b=jOtRQ4zdbOLm+zEb7wRIGGRv0Scm5Qi8C5Q5+8cFvJnJwj3Fpg7f6vu2
   ina2YyGjPWSmvew/iM5F2Lrczbh9Ehizcjy4+crdZik6kCVvEaR3wZcVN
   79fBoadj6TIF6PzPaHNT1ccmPE/aJ/J9fJklh/XLRbTqZOpmsq6hNd1hV
   /9awWAea4+qUW8ZMkaTHs4ZkSTxUETNORBMiuNt0qh5RPmTCOxr1qQK7j
   Uqc7h9bn1l+Sncsy5H+tNo26fZ7g6UYAFaydv3VVxwI6E3mwPaPzTc9ME
   iIiVk21/nrwzjwZ9Wz6BNAMU8l/m1T2uO3dBbVC4wbFcRmbxEiFHgBRoO
   g==;
X-CSE-ConnectionGUID: y/fatGMXSAqiuNPuVA67sg==
X-CSE-MsgGUID: ZRt67WOPR++GxyGeS8zMrg==
X-IronPort-AV: E=Sophos;i="6.18,225,1751234400"; 
   d="scan'208";a="46004680"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 01 Sep 2025 12:04:49 +0200
X-CheckPoint: {68B56FC1-1B-20CAA7DA-EC9DC758}
X-MAIL-CPID: BD1DAF44F32A66FB5B73D9DFF9139FF1_0
X-Control-Analysis: str=0001.0A00210D.68B56F5F.0090,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 683611697BF;
	Mon,  1 Sep 2025 12:04:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1756721085; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=LglhPlwMqIEb5lp6QQRc6h7tbZs7go6i8tgRSxiq4X8=;
	b=MtZJxsr05piR25btcguKeO1U9Tx+XOs3scH1EgiBapVT4FRoy/HuRE8CcvDkY/rrx4lQRa
	LSo5jxNWt5Qgfo7sUIgiWzYFTAQdC9T49Uxay+Y7kdNdYtRPQ0lJQuH5MmLEJNN7F54CPB
	P8XAjoGxm+YcTOp9UIv72vdbMcCHUoPif6K8lh6Ws1FG20ggGJE1Ct6iskkwmS0dTlmTaA
	M6iaTr9avPZeDEb7+ft2Du9BPpxtuGQm7GDYyO0dKNMKdFVIkc6hvxaovhse82/jC3HY2q
	ePQYr7qb2iLK5N1MeSvhlO48s2QntA1cO1gJpR0yQvJJh3bOvwrJ5J6fW7F9Dg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: [PATCH v2 0/2] TQMa91xx support
Date: Mon,  1 Sep 2025 12:04:28 +0200
Message-ID: <20250901100432.139163-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_030454_737040_D4B6E5C7 
X-CRM114-Status: GOOD (  10.09  )
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

Hi,

this series supports i.MX91 based module series TQMa91xx. It is available
in a socketable variant (CA [1]) and as an LGA variant (LA [2]). Both
are covered by the same device tree file.
The hardware is identical to their TQMa93xx counterparts, just a different SoC.

This series depends on the i.MX91 SoC support [3].

Best regards
Alexander Stein

[1] https://www.tq-group.com/en/products/tq-embedded/arm-architecture/tqma91xxca/
[2] https://www.tq-group.com/en/products/tq-embedded/arm-architecture/tqma91xxla/
[3] https://lore.kernel.org/all/20250825091223.1378137-1-joy.zou@nxp.com/

v1:
* https://lore.kernel.org/all/20250828094745.3733533-1-alexander.stein@ew.tq-group.com/

Alexander Stein (2):
  dt-bindings: arm: fsl: add TQMa91xx SOM series
  arm64: dts: freescale: add initial device tree for TQMa91xx/MBa91xxCA

 .../devicetree/bindings/arm/fsl.yaml          |  18 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../freescale/imx91-tqma9131-mba91xxca.dts    | 739 ++++++++++++++++++
 .../boot/dts/freescale/imx91-tqma9131.dtsi    | 295 +++++++
 4 files changed, 1053 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-tqma9131.dtsi

-- 
2.43.0


