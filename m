Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A65E8F53D65
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 15:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9OU9GJ7hTS0RTZZlRjvrompDSYq9g4Wd7DryiX4nbMg=; b=0k9f5TwJhQAleInxBRFnLvKSPH
	n00p/uHP5eDwaDAFejwaHpYd4b1e3+eNrMrlWs7X/dF1YttKOEACRnGQbqsuIzXsb9rn4mY5kvG3z
	Rv5Ni0B9tCAkNPdTUdMZ23wXoFXlBhQtu0xznSuIMcWC1mXrBfOeLzGCoNeUKHxbGyj7S1xVvA0B6
	GdpsHMi2JD1r+/Lx/uKbyVDRTe7J0kLJXA8jGLChgsrE59Op8bHeS4InAcoT6S/z8/FV1HkQ6BEka
	7QrB7iEHGmyB/HkNSCsKG+blxFrnq4Wbt4rDIpiR6iA+FdIlfgvo75IrzNVX4AaSqvjk12a2eWJ1l
	5vliGvoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29Vs-00000004HvB-49QF;
	Mon, 16 Mar 2026 15:05:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29Vr-00000004Huz-4BS6
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Mar 2026 15:05:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=9OU9GJ7hTS0RTZZlRjvrompDSYq9g4Wd7DryiX4nbMg=; b=P70O1i8nvIlGyxONSd8ruz/V5m
	WmHEb9WhA7/enlPWJ9RqVA+Y2vRp4RXT71F+NLUxpIdgvGzsi6Py82aIbnQJ6EOFFJxLEj4IzHwsk
	61rO5FERDjanWmr/jUoxVDOkjnVmSYILU94PniHWZTlw1b7Fj1cTRsy2DG+XVN+ufYKm3eBHI/ItF
	mKn20hFi1Lr9PAOMECQTi5llT0UOJXdNBcUVeIznqcXexCmB1EFnhr+3op+sbrQpl+m/XSgxhKr7q
	EMXrv1ZNwUt6E4tSLw/AsWbkYykxRkYMk4kSTH7qQ6ueWQNqbZN7tPRCuoFDHaj4YseNhjwPDWWBE
	/UOp4r+g==;
Received: from www537.your-server.de ([188.40.3.216])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29Vo-000000071w6-2eGg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 15:05:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=9OU9GJ7hTS0RTZZlRjvrompDSYq9g4Wd7DryiX4nbMg=; b=qJOBzulltHEwDL4ghoZ1Ss4VLg
	lXPWYJiMR83par5sIzq1BYZJ3sFA/IZMgbuqQmYcOqQ/lIeNrzH0CP73aIy0/GD8SMld9d1Cbdjx3
	kJCIqDPUIAYh4SsXjR4KYLPBsSJcX5oqznaRVFIu+v1KSJPPTnG5WrAdQP3fDeTXbot4lLhWV1M51
	IFsXKZvIE29PTA4S5dGsEKgy1OmW+ZcSWnJ1QmRtSSbu+8L4N1+R0pR+jmJkAHE0k9TvTgixilLHK
	kO7OouK2mRa7vD30MmSWiybqU55CAiyDq2YqfKzNyWlddZmgSr/EUKScL3XE/X/3wkEjdyl1Uj0qb
	O3iwbKlg==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w29Vm-0009Kp-1I;
	Mon, 16 Mar 2026 16:05:42 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w29Vk-0003GC-37;
	Mon, 16 Mar 2026 16:05:41 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	linux-renesas-soc@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 1/3] dt: bindings: arm: add bindings for TQMa95xxLA
Date: Mon, 16 Mar 2026 16:04:51 +0100
Message-ID: <20260316150535.786122-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27942/Mon Mar 16 07:24:14 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_150544_811828_5BC2C272 
X-CRM114-Status: UNSURE (   7.93  )
X-CRM114-Notice: Please train this message.
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

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

TQMa95xxLA is a SOM using NXP i.MX95 CPU. MBa95xxCA is a carrier
reference design / starter kit board.

[1] https://www.tq-group.com/en/products/tq-embedded/arm-architecture/tqma95xxla/

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 5a7a75ede0a87..1559ae22c10c9 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1614,6 +1614,17 @@ properties:
           - const: kontron,imx93-osm-s    # Kontron OSM-S i.MX93 SoM
           - const: fsl,imx93
 
+      - description:
+          TQMa95xxLA is a series of SOM featuring NXP i.MX95 SoC variants,
+          designed to be soldered on different carrier boards.
+          MBa95xxCA is a carrier reference design / starter kit that allows
+          to use TQMa95xxLA via an adaper board.
+        items:
+          - enum:
+              - tq,imx95-tqma9596la-mba95xxca  # TQ-Systems GmbH i.MX95 TQMa95xxLA SOM on MBa95xxCA
+          - const: tq,imx95-tqma9596la         # TQ-Systems GmbH i.MX95 TQMa95xxLA SOM
+          - const: fsl,imx95
+
       - description:
           TQMa95xxSA is a series of SOM featuring NXP i.MX95 SoC variants.
           It has the SMARC form factor and is designed to be placed on
-- 
2.43.0


