Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 901EDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 09:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OrneY2kKhdTyzwwJPc0c8d/pNlFC/NXGDitof6NVC2g=; b=BH19ruLzcbqGxF1xaFtuoLYS2s
	YrNJiC9VhOIOOY7+1Y/LlImuPRUeKKwc4zOWyd2jfSFR3V5exUzzkIZQSEO5j3X6dyGBSSKJlq4Tn
	C5cX3yCJHUxIvZEf/NNmkegzXxBj/FBNT8G9EkifyFoSxudQclPNfgUnJE4dYXgWjMPIVEFveynuz
	V4bFA4PKRW/gz8tBLXWE3h1eQ//obbbT13K/scY7CDz0bq5a+kx/pNTnHBDkbxlY73j5/MOdKyzBx
	0Bz+aWyQdzg9S6NQZ68noHcB28AZDeSHREYc2A7M8j71BaX6iHnED5/ulCmHS3uX6YEppHWu0b3cN
	+vyfSd+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjDEf-00000008mHm-0tp2;
	Mon, 13 Jul 2026 09:46:01 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjDEd-00000008mGj-0QJK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 09:46:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=OrneY2kKhdTyzwwJPc0c8d/pNlFC/NXGDitof6NVC2g=; b=Y27lHHXo08WXoMk2xFeZQdz+34
	LYRm6tADlH2i0R2V9ynoDd9+99WCScjoXo5wcN6oxFBDKeRoFyFKjW7Rf29dlGxERpwZ2FErF9JCv
	7bS/Kbm/O/XtdNn951TPHhVytzUAZDdACspxGB7AFKhC94zncWgvhGvD/11tCv0n1/JYel3IT7y6X
	06ozM+nNukZfiYp77SHjq1qqTEoGBpWfAXSW5p0zXzZJv2hVSC3o9BDh+JmwrkvevVZBQVYFoaqXP
	HofkRVMT0l1hvPdcyBnVc75aGvH5IxuLByn5PpjNndVpxYMCsZxqaAlCFR9t3KHEPiIslRrq8zgzU
	WiCYnypQ==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wjCp9-0004S2-0W;
	Mon, 13 Jul 2026 11:19:39 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wjCp8-0004Bh-2N;
	Mon, 13 Jul 2026 11:19:38 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: add MBa93xxCA as mainboard for TQMa91xxCA and TQMa91xxLA SOM
Date: Mon, 13 Jul 2026 11:19:21 +0200
Message-ID: <20260713091924.2319674-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260713091924.2319674-1-alexander.stein@ew.tq-group.com>
References: <20260713091924.2319674-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28059/Mon Jul 13 08:25:07 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_024559_251004_FC7C8472 
X-CRM114-Status: GOOD (  10.84  )
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

TQMa91xxLA and TQMa91xxCA are two series of feature compatible SOM
using NXP i.MX91 SoC in 11x11 mm package.

MBa93xxCA is a starterkit base board usable for TQMa91xxCA and TQMa91xxLA
soldered on an adapter board to demonstrate use cases without display but
more interfaces.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index f96f3d31dac10..1bc9edaedd6e4 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1607,11 +1607,13 @@ properties:
           in the assembled SOC.
           MBa91xxCA mainboard can be used as starterkit for the SOM
           soldered on an adapter board or for the connector variant
-          MBa91xxLA mainboard is a single board computer using the solderable
-          SOM variant
+          to demonstrate parallel display and majority of interfaces while
+          MBa93xxCA starterkit mainboard is focused on communication
+          interfaces without display support.
         items:
           - enum:
               - tq,imx91-tqma9131-mba91xxca # TQ-Systems GmbH i.MX91 TQMa91xxCA/LA SOM on MBa91xxCA
+              - tq,imx91-tqma9131-mba93xxca # TQ-Systems GmbH i.MX91 TQMa91xxCA/LA SOM on MBa93xxCA
           - const: tq,imx91-tqma9131        # TQ-Systems GmbH i.MX91 TQMa91xxCA/LA SOM
           - const: fsl,imx91
 
-- 
2.54.0


