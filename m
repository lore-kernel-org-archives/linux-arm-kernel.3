Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B1610A1E68
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 11:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nf+rMiHi6jNbgWaWaj5/gNwKBHvcOV2zQhPWDkDxDaI=; b=mMmvJG1zY74FRuflKBgz2xLl3q
	ONA6VQ03l+E06po7n3cFrna+sc7McqS2xaO7bYKaZUD9Me9uZGFezWKb3PKw94JLAnXgg1EKI6s2C
	Q+X1pp2Io4UbL/Wvu/4H0RLL36fu7u0XqGw516DXDpltw6fQvcC1LnA3hjExt1uQ3gsmuI3cowJIB
	2amCAqxVlq2/+2uVZboUKMXo16SdhOhY1jb6MnUq9eg2qviWsbnHRIfFjXux+PyT+Uc61Q7KHE82W
	uu0WY/ApgE1rmUHJf0MZRCPfKhjS3iEnQqfq/RY+5TFXP0CVTpKVA2yzq9Vjwx2P1UCyu5bpjqr2w
	0XeWnyXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5ijG-00000005LbE-4Bsw;
	Thu, 26 Mar 2026 11:18:23 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5ijD-00000005LZy-3Txu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 11:18:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=nf+rMiHi6jNbgWaWaj5/gNwKBHvcOV2zQhPWDkDxDaI=; b=FdBVBEhnr8+ZxXqeLS+DtRcTPS
	HrlVaqUHTUl0IGhIWj6bIj6FC2AxqEHiIuOLK6NU1sg2qxa0Bl88BZNmyDNxCcwWvUFwUq0JNB3A6
	NdCAcfM5pnFe1SxX/csuMK/bDRVCgtbxCgQ1PBwNxsoMBpHEqWPE9crolx6qLor3XvylRq3KG1Od8
	vp90GYMNzm6JmNCSUKIhT+adTxBJaeEH4k01X31SvWhKPYKrFm+41VYrrbSbVk7qPMllSvctKsqWH
	xYpuwn5oRnUma/WojDr+vfWBR0xqkv27grMehuiX+TkIzq8aVRbKtybRRYxblvu2lv4EYQrMhkxfA
	ngnYV/4g==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w5ij8-000LWf-25;
	Thu, 26 Mar 2026 12:18:14 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w5iia-000JmA-2Z;
	Thu, 26 Mar 2026 12:18:14 +0100
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
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/2] dt: bindings: arm: add bindings for TQMa95xxLA
Date: Thu, 26 Mar 2026 12:03:29 +0100
Message-ID: <20260326111803.1248934-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27952/Thu Mar 26 07:24:52 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_041820_409285_CF7DF62C 
X-CRM114-Status: UNSURE (   8.27  )
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
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v2:
* Added Krzysztof's A-b

 Documentation/devicetree/bindings/arm/fsl.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index a476a6b11ba06..db8f8a0c87619 100644
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


