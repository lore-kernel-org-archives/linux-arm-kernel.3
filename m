Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF950CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 10:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D8nQkRvpmKKt09UiqtWevDsmYEzF6a0SS4RoNlY4WkA=; b=I4SbsghWrhZoYovadd1EsxsXFO
	jcHO0wapHojCloLs3NABHdgNSGctOQ3He5gwx4I+P11U4+QxpEk43sVG6t4r51EVsq+5aBkE6seKH
	qEUlElqz+UAFTigjv44XQjhM9juehCb0TbXT0VZD45g1pXfdDs9KHtKqnCzQUmCj186rrDKNleurR
	No5nItUyi+7sh/w+lNEWQTz2ndkvJYQQba2D3QBFLG4MYqIOLazmJvDeCi25aT6fBGJ5aqDM6HtQ/
	Y+Tj7OqiTxykcidF/YbdLdx0ab+mOFtPtcOnTQio6OGbzVOHECR+RgwWvYVd4NOkG/qazC+84Da4h
	Hc23fkzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ura7J-00000001DAt-3mgf;
	Thu, 28 Aug 2025 10:44:29 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urZEd-000000011tJ-3d6Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 09:48:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1756374479; x=1787910479;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=D8nQkRvpmKKt09UiqtWevDsmYEzF6a0SS4RoNlY4WkA=;
  b=SKj9LQHMkPCo/uep6je3MBJgROqRnxT75aGCMhDBwirhgtwrhNepyCER
   T08mp4CiVrONWHWEKq+/UuzyLLL8PgbfujExhMHMPo3nImCCrqycqCJql
   cCP07A1Drm9XPlKFvxhopqALtxLj1Cied0qzht1gOYUMoYFnzvOuwR98z
   APu3HbM3GweOdT13F22RmZL2FxZffakjWBDddMoS9VoVlhEiBEOzC3R/F
   GJ6TjmaMxXvwOQT2X+jwuPSmFgpe4U9+K7jhq9cx+fvHvdqlYLf8hQRQ6
   AL9iZFtYZvS9uBq948Ccn77VxHSxh/Yz9auPCm1a7b5mOEH5EsS7I1a0t
   Q==;
X-CSE-ConnectionGUID: IVm/NR15SRWLvhrdJFb3YQ==
X-CSE-MsgGUID: ESBlCGXxQ8arFe4RadziYQ==
X-IronPort-AV: E=Sophos;i="6.18,217,1751234400"; 
   d="scan'208";a="45953047"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 28 Aug 2025 11:47:58 +0200
X-CheckPoint: {68B025CE-17-299FBAB0-EF52EDE7}
X-MAIL-CPID: FB74D8873684AD535BEE68EAC473F561_5
X-Control-Analysis: str=0001.0A002105.68B025CF.0078,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8949C16947D;
	Thu, 28 Aug 2025 11:47:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1756374474; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=D8nQkRvpmKKt09UiqtWevDsmYEzF6a0SS4RoNlY4WkA=;
	b=XR8J/JzFiqHhgaXBwzwPipx5NU14j83641gTXAIBTF8tzDAIK1TSFyiRx/bDc/CMPH7Efo
	i5pjIjfItVqw5El3oZQ9qWNXCTJqzJ7kJTPDQNDxaSz/ENmeEqSnfQIzSIflczG9O8vzUH
	QhD3YakaKt3RKfOv6kg/Ps1jRVfkeylOErtpABdSlSTqSpk/atyDQIEcv0DM0rmORjB/XJ
	pqbXcnmt40qzZy7whNZ4VRAc5OQErxBrOfAX/OJsJO8hEkwkJGWrg5VomRKmmW42lwrT2K
	+CkixEhLMb5GiLAoMb/fRvJ8fR9amC0bLmDrG3mXOBaBxd2LklyMd57oYO3VwQ==
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
Subject: [PATCH 1/2] dt-bindings: arm: fsl: add TQMa91xxLA SOM
Date: Thu, 28 Aug 2025 11:47:42 +0200
Message-ID: <20250828094745.3733533-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250828094745.3733533-1-alexander.stein@ew.tq-group.com>
References: <20250828094745.3733533-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_024800_208413_7CF70A44 
X-CRM114-Status: GOOD (  10.72  )
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

TQMa91xxLA is a SOM variant in the TQ-Systems GmbH TQMa91xx series using
NXP i.MX91 CPU on an LGA type board.
MBa91xxCA is a starterkit base board for TQMa91xxLA on an adapter board.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index ebafa6ecbcb64..0843c5e9275be 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1433,6 +1433,24 @@ properties:
               - fsl,imxrt1170-evk         # i.MXRT1170 EVK Board
           - const: fsl,imxrt1170
 
+      - description:
+          TQMa91xxLA and TQMa91xxCA are two series of feature compatible SOM
+          using NXP i.MX91 SOC in 11x11 mm package.
+          TQMa91xxLA is designed to be soldered on different carrier boards.
+          TQMa91xxCA is a compatible variant using board to board connectors.
+          All SOM and CPU variants use the same device tree hence only one
+          compatible is needed. Bootloader disables all features not present
+          in the assembled SOC.
+          MBa91xxCA mainboard can be used as starterkit for the SOM
+          soldered on an adapter board or for the connector variant
+          MBa91xxLA mainboard is a single board computer using the solderable
+          SOM variant
+        items:
+          - enum:
+              - tq,imx91-tqma9131-mba91xxca # TQ-Systems GmbH i.MX91 TQMa91xxCA/LA SOM on MBa91xxCA
+          - const: tq,imx91-tqma9131        # TQ-Systems GmbH i.MX91 TQMa91xxCA/LA SOM
+          - const: fsl,imx91
+
       - description:
           TQMa93xxLA and TQMa93xxCA are two series of feature compatible SOM
           using NXP i.MX93 SOC in 11x11 mm package.
-- 
2.43.0


